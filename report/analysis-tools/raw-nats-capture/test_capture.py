"""Protocol fixtures and optional official local broker; no device/cloud calls."""
import argparse,hashlib,json,socket,subprocess,tempfile,threading,time,unittest,urllib.request
from pathlib import Path
from capture import Frames,ProtocolError,capture,subject_valid
ROOT=Path(__file__).resolve().parent
SERVER=None
def port():
 with socket.socket() as s:s.bind(('127.0.0.1',0));return s.getsockname()[1]
class CaptureTests(unittest.TestCase):
 def test_fragmentation_and_binary_payload(self):
  payload=b'\0\r\n\xff';frame=b'MSG rawmem.x.sens.stealth 1 _INBOX.test 4\r\n'+payload+b'\r\n';f=Frames();out=[]
  for b in frame:out.extend(f.feed(bytes([b])))
  self.assertEqual(out[0]['payload'],payload);self.assertFalse(f.buffer)
 def test_headers_preserved(self):
  h=b'NATS/1.0\r\nRaw-Mem-Time: synthetic\r\n\r\n';p=b'\x00\xff'
  msg=f'HMSG rawmem.x.sens.stealth 1 {len(h)} {len(h)+len(p)}\r\n'.encode()+h+p+b'\r\n'
  out=list(Frames().feed(msg));self.assertEqual(out[0]['headers'],h);self.assertEqual(out[0]['payload'],p)
 def test_oversize_refused_before_body(self):
  with self.assertRaises(ProtocolError):list(Frames(10).feed(b'MSG raw.x 1 11\r\n'))
 def test_partial_frame_retained(self):
  f=Frames();b=b'MSG raw.x 1 4\r\nab';self.assertEqual(list(f.feed(b)),[]);self.assertEqual(f.buffer,b)
 def test_invalid_terminator(self):
  with self.assertRaises(ProtocolError):list(Frames().feed(b'MSG raw.x 1 1\r\nxXX'))
 def test_subject_injection_refused(self):
  for s in ['>','rawmem.>','raw.x\r\nPUB foo 1','raw..x','$JS.API.INFO']:
   self.assertFalse(subject_valid(s))
 def test_authorization_requirement_no_connect(self):
  with tempfile.TemporaryDirectory() as tmp,socket.socket() as listener:
   listener.bind(('127.0.0.1',0));listener.listen();received=[]
   def serve():
    with listener.accept()[0] as c:c.sendall(b'INFO {"auth_required":true}\r\n');received.append(c.recv(1024))
   t=threading.Thread(target=serve);t.start();m=capture(listener.getsockname()[1],Path(tmp)/'out',1);t.join(2)
   self.assertEqual(m['error_kind'],'requires_separately_configured_auth_or_tls');self.assertEqual(received,[b''])
 def test_official_broker_mapping_and_no_reply(self):
  if not SERVER:self.skipTest('explicit native test server required')
  with tempfile.TemporaryDirectory() as tmp:
   root=Path(tmp);p=port();monitor=port();cfg=root/'server.conf';cfg.write_text(f'listen: 127.0.0.1:{p}\nhttp: 127.0.0.1:{monitor}\nmappings {{ "raw.>": "rawmem.>" }}\n')
   log=(root/'server.log').open('wb');proc=subprocess.Popen([str(SERVER),'-c',str(cfg)],stdout=log,stderr=log)
   reader=None
   try:
    opener=urllib.request.build_opener(urllib.request.ProxyHandler({}));url=f'http://127.0.0.1:{monitor}/subsz?subs=1'
    deadline=time.monotonic()+5
    while True:
     try:
      with opener.open(url,timeout=.2) as resp:resp.read()
      break
     except OSError:
      if proc.poll() is not None or time.monotonic()>deadline:raise RuntimeError('test broker startup failed')
      time.sleep(.02)
    result=[];errors=[]
    def observe():
     try:result.append(capture(p,root/'out',1.5,max_messages=2))
     except Exception as e:errors.append(e)
    reader=threading.Thread(target=observe);reader.start();deadline=time.monotonic()+1
    while True:
     with opener.open(url,timeout=.3) as resp:body=resp.read()
     if b'rawmem.x.sens.stealth' in body:break
     if time.monotonic()>deadline:raise RuntimeError('subscription never appeared')
     time.sleep(.01)
    with socket.create_connection(('127.0.0.1',p),timeout=1) as pub:
     pub.recv(4096);pub.sendall(b'CONNECT {"verbose":false,"headers":true}\r\nSUB _INBOX.synthetic 9\r\nPING\r\n')
     until=b''
     while b'PONG\r\n' not in until:until+=pub.recv(4096)
     payloads=[b'\xa1\x61x\x01',b'\x00\r\n\xff'];h=b'NATS/1.0\r\nRaw-Mem-Time: synthetic\r\n\r\n'
     pub.sendall(b'PUB raw.x.sens.stealth _INBOX.synthetic 4\r\n'+payloads[0]+b'\r\n')
     pub.sendall(f'HPUB raw.x.sens.stealth _INBOX.synthetic {len(h)} {len(h)+4}\r\n'.encode()+h+payloads[1]+b'\r\n')
     reader.join(3);self.assertFalse(reader.is_alive());self.assertFalse(errors);self.assertEqual(result[0]['messages'],2)
     pub.settimeout(.15)
     with self.assertRaises(socket.timeout):pub.recv(4096)
    rows=[json.loads(x) for x in (root/'out/events.jsonl').read_text().splitlines()]
    for row,body in zip(rows,payloads):self.assertEqual((root/'out'/row['payload_file']).read_bytes(),body);self.assertEqual(row['payload_sha256'],hashlib.sha256(body).hexdigest())
    self.assertEqual((root/'out'/rows[1]['headers_file']).read_bytes(),h)
    self.assertEqual(set(result[0]['commands_sent']),{'CONNECT','SUB','PING'})
    self.assertEqual(result[0]['status'],'message_limit');self.assertTrue(result[0]['subscription_barrier_observed'])
   finally:
    proc.terminate()
    try:proc.wait(timeout=3)
    except subprocess.TimeoutExpired:proc.kill();proc.wait(timeout=3)
    if reader:reader.join(3)
    log.close()
if __name__=='__main__':
 p=argparse.ArgumentParser();p.add_argument('--server',type=Path);a=p.parse_args();SERVER=a.server
 result=unittest.TextTestRunner(verbosity=2).run(unittest.defaultTestLoader.loadTestsFromTestCase(CaptureTests))
 receipt={'result':'PASS' if result.wasSuccessful() else 'FAIL','tests':result.testsRun,'skipped':len(result.skipped),'native_test_broker':bool(SERVER),'native_broker_sha256':hashlib.sha256(SERVER.read_bytes()).hexdigest() if SERVER else None,'scope':'Loopback test broker and synthetic payloads; no device or cloud data.'}
 (ROOT/'VALIDATION.json').write_text(json.dumps(receipt,indent=2)+'\n');raise SystemExit(0 if result.wasSuccessful() else 1)
