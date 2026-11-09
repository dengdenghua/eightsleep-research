#!/usr/bin/env python3
"""Independent bounded Thumb-1 interpretation of the counter gate bytes.
Standard library only; no imports from producer or Capstone.
"""
from pathlib import Path
import hashlib,json,struct
HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[2]
b=(ROOT/'materials/eightsleep-full-evidence-20261107/firmware/mtk/rootfs/files/opt/eight/lib/subsystem_updates/firmware-sensor-g0.bbin').read_bytes();BASE=0x08008000;O=0x20000000;SP=0x20010000
assert hashlib.sha256(b).hexdigest()=='51531576fd31af96f7239b71d26e1f175815f5cb21dbe9ab305fa9a33cc6a891'
def emulate(old,limit,bypass):
 regs=[0]*16;regs[7]=O;regs[13]=SP;mem={};writes=[];Z=False;C=False;pc=0x08016712
 def put(addr,value,n):
  for k in range(n):mem[addr+k]=(value>>(8*k))&255
 def get(addr,n):
  if BASE<=addr and addr+n<=BASE+len(b):return int.from_bytes(b[addr-BASE:addr-BASE+n],'little')
  return sum(mem.get(addr+k,0)<<(8*k) for k in range(n))
 put(O+0x1c08,old,1);put(O+0x37a0,limit,4);put(O+0x3d9a,bypass,1);put(O+0x378e,0,1);put(O,5,1);put(SP+0x2c,0,4)
 for steps in range(80):
  if pc in [0x08016ca2,0x0801616c]:return {'destination':hex(pc),'counter':get(O+0x1c08,1),'other_byte':get(O+0x378e,1),'state':get(O,1),'writes':writes}
  h=get(pc,2);nxt=pc+2
  if h&0xf800==0x4800:regs[(h>>8)&7]=get(((pc+4)&~3)+4*(h&255),4)
  elif h&0xf000==0x5000:
   op=(h>>9)&7;addr=(regs[(h>>3)&7]+regs[(h>>6)&7])&0xffffffff;rt=h&7
   if op==2:put(addr,regs[rt],1);writes.append([hex(addr-O),regs[rt]&255])
   elif op in [4,6]:regs[rt]=get(addr,4 if op==4 else 1)
   else:raise AssertionError(('unsupported memory opcode',hex(pc),hex(h)))
  elif h&0xf800==0x3000:rd=(h>>8)&7;regs[rd]=(regs[rd]+(h&255))&0xffffffff
  elif h&0xffc0==0xb2c0:regs[h&7]=regs[(h>>3)&7]&255
  elif h&0xffc0==0x4280:
   lhs=regs[h&7];rhs=regs[(h>>3)&7];Z=lhs==rhs;C=lhs>=rhs
  elif h&0xf800==0x2800:lhs=regs[(h>>8)&7];rhs=h&255;Z=lhs==rhs;C=lhs>=rhs
  elif h&0xf000==0xd000:
   cond=(h>>8)&15;take={0:Z,1:not Z,2:C,9:(not C or Z)}[cond];offset=h&255;offset=offset-256 if offset&128 else offset
   if take:nxt=pc+4+2*offset
  elif h&0xf800==0xe000:
   offset=h&2047;offset=offset-2048 if offset&1024 else offset;nxt=pc+4+2*offset
  elif h&0xf800==0x9800:regs[(h>>8)&7]=get(regs[13]+4*(h&255),4)
  elif h&0xf800==0x2000:regs[(h>>8)&7]=h&255
  elif h&0xf800==0x0000:regs[h&7]=(regs[(h>>3)&7]<<((h>>6)&31))&0xffffffff
  elif h&0xf800==0x7000:
   addr=regs[(h>>3)&7]+((h>>6)&31);put(addr,regs[h&7],1);writes.append([hex(addr-O),regs[h&7]&255])
  else:raise AssertionError(('unsupported instruction',hex(pc),hex(h)))
  pc=nxt
 raise AssertionError('bounded path did not terminate')
cases=json.loads((HERE/'COUNTER_CASES.json').read_text());digest=hashlib.sha256()
for c in cases:
 actual=emulate(c['before'],c['limit'],c['bypass']);complete=c['completion_branch']
 assert actual['counter']==c['counter_final']
 assert actual['state']==(6 if complete else 5) and actual['other_byte']==(1 if complete else 0)
 assert actual['destination']==('0x801616c' if complete else '0x8016ca2')
 digest.update(json.dumps(actual,sort_keys=True,separators=(',',':')).encode())
cycles=[]
for limit in [3,4]:
 c=0
 for n in range(1,limit+1):
  actual=emulate(c,limit,0);cycles.append({'limit':limit,'iteration':n,'before':c,'after':actual});c=actual['counter']
  assert actual['state']==(6 if n==limit else 5)
r={'result':'PASS','independent_emulated_cases':len(cases),'default_limit_cycles':cycles,'trace_digest':digest.hexdigest(),'scope':'Runs a bounded interpretation of selected instruction bytes on synthetic memory, not the vendor firmware or device. Entered stack word [sp+0x2c]=0 avoids optional log-call path.','input_cases_sha256':hashlib.sha256((HERE/'COUNTER_CASES.json').read_bytes()).hexdigest()}
(HERE/'VERIFICATION.json').write_text(json.dumps(r,ensure_ascii=False,indent=2)+'\n');print('PASS',len(cases),'independent byte-interpreted cases; normal limits 3/4 verified')
