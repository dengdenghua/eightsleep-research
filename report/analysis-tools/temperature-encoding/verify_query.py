#!/usr/bin/env python3
from pathlib import Path
import json,hashlib,struct
from engine import CPU,bits,CBASE,b
HERE=Path(__file__).resolve().parent;O=CBASE-0x1c0c;REQ=0x20090000
def setup():
 c=CPU()
 for i in range(8):
  q=CBASE+64+20*i
  for off,v in [(0,0x20040000+256*i),(4,10),(8,4),(12,0),(16,0)]:c.put(q+off,v)
  c.put(0x20060000,bits(20.0+i));c.run(0x0801d6c0,[CBASE,i,0x20060000])
 for i in range(8,15):c.put(CBASE+i*4,bits(-100.0 if i==10 else float(i)))
 return c
def record(i):return bytes([i])+struct.pack('>H',0xff if i==10 else int((20+i if i<8 else i)*100))
cases=[]
for mode in [3,4]:
 for i in [0,10,11,12,255]:
  c=setup();c.put(O+0x202c,mode);c.put(O+0x260,1,1);c.put(REQ+1,i,1);c.run(0x0801724c,[],{7:O,4:REQ,2:1})
  got=b''.join(getattr(c,'reply_chunks',[]));status=getattr(c,'reply_status',None)
  if i==255:expected=b''.join(record(k) for k in range(11 if mode==3 else 15));assert status==0 and got==expected
  elif i<=11:assert status==0 and got==record(i)
  else:assert status==1 and not got
  cases.append({'mode':mode,'requested_id':i,'status':status,'append_bytes':len(got),'append_hex':got.hex()})
for available,payload in [(0,1),(1,0)]:
 c=setup();c.put(O+0x260,available,1);c.put(REQ+1,0,1);c.run(0x0801724c,[],{7:O,4:REQ,2:payload});assert c.reply_status==(1 if not available else 6) and not getattr(c,'reply_chunks',[]);cases.append({'available':available,'payload_bytes_after_opcode':payload,'status':c.reply_status,'append_bytes':0})
r={'result':'PASS','cases':len(cases),'records':cases,'image_sha256':hashlib.sha256(b).hexdigest(),'scope':'MCU local 2a branch, native branch/serialization bytes interpreted; status and append routines summarized. append bytes are requested response content, not hardware transmission; append capacity truncation not modeled. App/cloud reachability not established.'}
(HERE/'QUERY_VERIFICATION.json').write_text(json.dumps(r,ensure_ascii=False,indent=2)+'\n');print('PASS',len(cases),'query cases; bulk33/45 bytes; id12 rejected individually but present in mode4 bulk')
