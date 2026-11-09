#!/usr/bin/env python3
"""Bounded core-NATS subscriber for an already-authorized loopback/SSH connection.
No publish, queue group, JetStream consumer, ACK, auto-discovery or reconnect.
"""
import argparse,hashlib,json,re,socket,time
from datetime import datetime,timezone
from pathlib import Path
class ProtocolError(Exception):pass
class Frames:
 def __init__(self,max_frame=1048576):self.buffer=bytearray();self.max_frame=max_frame
 def feed(self,data):
  self.buffer.extend(data)
  while True:
   end=self.buffer.find(b'\r\n')
   if end<0:
    if len(self.buffer)>16384:raise ProtocolError('control_line_too_long')
    return
   if end>16384:raise ProtocolError('control_line_too_long')
   line=bytes(self.buffer[:end]);parts=line.split();op=parts[0] if parts else b''
   if op in (b'MSG',b'HMSG'):
    expected=(4,5) if op==b'MSG' else (5,6)
    if len(parts) not in expected:raise ProtocolError('invalid_message_header')
    try:
     if not parts[-1].isdigit():raise ValueError()
     total=int(parts[-1]);headers=0
     if op==b'HMSG':
      if not parts[-2].isdigit():raise ValueError()
      headers=int(parts[-2])
     subject=parts[1].decode('ascii');sid=parts[2].decode('ascii')
    except (ValueError,UnicodeError):raise ProtocolError('invalid_message_fields')
    if total>self.max_frame or headers>total:raise ProtocolError('message_size_limit')
    consumed=end+2+total+2
    if len(self.buffer)<consumed:return
    body=bytes(self.buffer[end+2:end+2+total])
    if self.buffer[consumed-2:consumed]!=b'\r\n':raise ProtocolError('invalid_message_terminator')
    if headers and (not body[:headers].startswith(b'NATS/1.0') or not body[:headers].endswith(b'\r\n\r\n')):raise ProtocolError('invalid_nats_headers')
    del self.buffer[:consumed]
    yield {'op':op.decode(),'subject':subject,'sid':sid,'headers':body[:headers],'payload':body[headers:]}
   else:
    del self.buffer[:end+2]
    if op==b'INFO':
     try:info=json.loads(line[5:])
     except (ValueError,UnicodeError):raise ProtocolError('invalid_info')
     if not isinstance(info,dict):raise ProtocolError('invalid_info')
     yield {'op':'INFO','info':info}
    elif line in (b'PING',b'PONG',b'+OK'):yield {'op':line.decode()}
    elif op==b'-ERR':raise ProtocolError('server_error')
    else:raise ProtocolError('unknown_control')
def subject_valid(s):
 return bool(re.fullmatch(r'(?:raw|rawmem)\.[A-Za-z0-9_-]+(?:\.[A-Za-z0-9_-]+)*',s))
def capture(port,out,duration=30,subject='rawmem.x.sens.stealth',max_bytes=8*1024*1024,max_messages=4000):
 if not subject_valid(subject):raise ValueError('only one exact raw/rawmem subject is allowed')
 if not 0<duration<=3600 or not 0<port<65536 or max_bytes<1 or max_messages<1:raise ValueError('invalid limits')
 out=Path(out);out.mkdir(mode=0o700,parents=False,exist_ok=False)
 start=time.monotonic();deadline=start+duration;frames=Frames(min(max_bytes,1048576));sock=None;ready=False;connected=False;count=0;wire_bytes=0;payload_bytes=0;sent=[]
 meta={'kind':'core_nats_raw_capture','subject':subject,'host':'127.0.0.1','port':port,'requested_seconds':duration,'max_wire_bytes':max_bytes,'max_messages':max_messages,'status':'starting','device_identity_verified':False,'scope':'Only new publications during subscription; no history, no JetStream ACK or completeness guarantee.'}
 def send(data):
  sock.sendall(data);sent.append(data.split(b' ',1)[0].strip().decode())
 try:
  with (out/'events.jsonl').open('x') as events:
   sock=socket.create_connection(('127.0.0.1',port),timeout=min(3,duration))
   while True:
    remaining=deadline-time.monotonic()
    if remaining<=0:meta['status']='duration_limit';break
    sock.settimeout(remaining)
    try:data=sock.recv(min(65536,max_bytes-wire_bytes+1))
    except socket.timeout:meta['status']='duration_limit';break
    if not data:meta['status']='connection_closed';break
    wire_bytes+=len(data)
    if wire_bytes>max_bytes:meta['status']='wire_byte_limit';break
    for f in frames.feed(data):
     if f['op']=='INFO':
      if f['info'].get('auth_required') or f['info'].get('tls_required'):raise ProtocolError('requires_separately_configured_auth_or_tls')
      if not connected:
       meta['server_version']=str(f['info'].get('version','unknown'))[:80]
       connect={'verbose':False,'pedantic':True,'tls_required':False,'name':'eightsleep-raw-observer','lang':'python','version':'1','protocol':1,'headers':True}
       send(b'CONNECT '+json.dumps(connect,separators=(',',':')).encode()+b'\r\n')
       send(('SUB '+subject+' 1\r\n').encode());send(b'PING\r\n');connected=True
     elif f['op']=='PING':send(b'PONG\r\n')
     elif f['op']=='PONG':ready=connected
     elif f['op'] in ('MSG','HMSG'):
      if not connected or f['sid']!='1' or f['subject']!=subject:raise ProtocolError('unexpected_subscription_message')
      count+=1;payload=f['payload'];headers=f['headers'];name=f'{count:06d}'
      (out/(name+'.payload.bin')).write_bytes(payload)
      header_file=None
      if headers:header_file=name+'.headers.bin';(out/header_file).write_bytes(headers)
      row={'index':count,'received_utc':datetime.now(timezone.utc).isoformat(),'elapsed_seconds':time.monotonic()-start,'subject':subject,'payload_file':name+'.payload.bin','payload_bytes':len(payload),'payload_sha256':hashlib.sha256(payload).hexdigest(),'headers_file':header_file,'headers_sha256':hashlib.sha256(headers).hexdigest() if headers else None}
      events.write(json.dumps(row,separators=(',',':'))+'\n');events.flush();payload_bytes+=len(payload)
      if count>=max_messages:meta['status']='message_limit';break
    if meta['status']=='message_limit':break
 except (ProtocolError,OSError) as exc:
  meta['status']='error';meta['error_kind']=str(exc) if isinstance(exc,ProtocolError) else type(exc).__name__
 except KeyboardInterrupt:meta['status']='interrupted'
 finally:
  if sock:sock.close()
  if frames.buffer:(out/'partial-wire.bin').write_bytes(frames.buffer)
  meta.update(subscription_barrier_observed=ready,messages=count,payload_bytes=payload_bytes,wire_bytes=wire_bytes,partial_wire_bytes=len(frames.buffer),elapsed_seconds=time.monotonic()-start,commands_sent=sent)
  (out/'metadata.json').write_text(json.dumps(meta,indent=2)+'\n')
 return meta
if __name__=='__main__':
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--port',type=int,default=14222);p.add_argument('--out',type=Path,required=True);p.add_argument('--duration',type=float,default=30);p.add_argument('--subject',default='rawmem.x.sens.stealth');a=p.parse_args();m=capture(a.port,a.out,a.duration,a.subject);print(json.dumps(m,indent=2));raise SystemExit(1 if m['status']=='error' else 0)
