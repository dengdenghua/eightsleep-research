#!/usr/bin/env python3
"""Interpret frozen Thumb packet-builder and real BE32 leaf, with external
memset/getter/send calls summarized. Compare output to independent struct format.
Synthetic memory only; no target hardware execution.
"""
from pathlib import Path
import json,hashlib,struct,random
from capstone import *
from capstone.arm import *
HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[2];b=(ROOT/'materials/eightsleep-full-evidence-20261107/firmware/mtk/rootfs/files/opt/eight/lib/subsystem_updates/firmware-sensor-g0.bbin').read_bytes();BASE=0x08008000;S=0x20010000;O=S+0x31c;BUF=S+0x11c
assert hashlib.sha256(b).hexdigest()=='51531576fd31af96f7239b71d26e1f175815f5cb21dbe9ab305fa9a33cc6a891'
m=Cs(CS_ARCH_ARM,CS_MODE_THUMB|CS_MODE_MCLASS);m.detail=True;cache={}
def dec(a):
 if a not in cache:cache[a]=next(m.disasm(b[a-BASE:a-BASE+4],a,1))
 return cache[a]
def idx(reg):
 name=m.reg_name(reg)
 return {'sp':13,'lr':14,'pc':15}.get(name,int(name[1:]) if name.startswith('r') else -1)
def run(first,values,tail,send_return):
 regs=[0]*16;regs[13]=S;regs[7]=O;mem={};pc=0x08016674;Z=False;C=False;sent=[];getter_indices=[]
 def store(a,v,n):
  for j in range(n):mem[a+j]=(v>>(8*j))&255
 def load(a,n):
  if BASE<=a<BASE+len(b):return int.from_bytes(b[a-BASE:a-BASE+n],'little')
  return sum(mem.get(a+j,0)<<(8*j) for j in range(n))
 def val(op):return regs[idx(op.reg)] if op.type==ARM_OP_REG else op.imm
 def addr(op):return (regs[idx(op.mem.base)]+(regs[idx(op.mem.index)] if op.mem.index else 0)+op.mem.disp)&0xffffffff
 for j in range(52):store(BUF+j,0xa5,1)
 for off,v in zip([0x1c3c,0x1c34,0x1c2c,0x1c30],[first]+tail):store(O+off,v,4)
 for step in range(1200):
  if pc==0x08016712:
   assert len(sent)==1 and getter_indices==list(range(8));return sent[0],load(BUF+51,1),step
  i=dec(pc);ops=i.operands;nxt=pc+i.size;name=i.mnemonic
  if name=='movs':regs[idx(ops[0].reg)]=val(ops[1])
  elif name in ['add','adds','subs']:
   rd=idx(ops[0].reg);lhs=regs[rd] if len(ops)==2 else val(ops[1]);rhs=val(ops[-1]);regs[rd]=(lhs-rhs if name=='subs' else lhs+rhs)&0xffffffff
  elif name in ['lsls','lsrs']:
   v=val(ops[1]);sh=val(ops[2]);regs[idx(ops[0].reg)]=((v<<sh) if name=='lsls' else (v>>sh))&0xffffffff
  elif name=='uxtb':regs[idx(ops[0].reg)]=val(ops[1])&255
  elif name in ['ldr','ldrb']:
   a=(((pc+4)&~3)+ops[1].mem.disp) if ops[1].mem.base==ARM_REG_PC else addr(ops[1]);regs[idx(ops[0].reg)]=load(a,4 if name=='ldr' else 1)
  elif name in ['str','strb']:store(addr(ops[1]),val(ops[0]),4 if name=='str' else 1)
  elif name=='cmp':lhs=val(ops[0]);rhs=val(ops[1]);Z=lhs==rhs;C=lhs>=rhs
  elif name in ['bne','bls']:
   if (not Z if name=='bne' else (not C or Z)):nxt=ops[0].imm
  elif name=='bx':nxt=val(ops[0])&~1
  elif name=='bl':
   target=ops[0].imm
   if target==0x080086a4:
    a,n,v=regs[0],regs[2],regs[1]&255
    for j in range(n):store(a+j,v,1)
   elif target==0x0801ecdc:
    getter_indices.append(regs[1]);regs[0]=values[regs[1]]
   elif target==0x080122b6:regs[14]=nxt|1;nxt=target # interpret actual vendor leaf instructions
   elif target==0x080122d0:
    sent.append(bytes(load(regs[0]+j,1) for j in range(regs[1])));regs[0]=send_return
   else:raise AssertionError(('unmodeled call',hex(pc),hex(target)))
  else:raise AssertionError(('unsupported',hex(pc),name,i.op_str))
  pc=nxt
 raise AssertionError('instruction bound exceeded')
rng=random.Random(8365);vectors=[[0]*12,[0xffffffff]*12,list(range(12)),[0x01020304,0x80000000,0x7fc00000,0xbf800000]*3]+[[rng.getrandbits(32) for _ in range(12)] for _ in range(28)]
outputs=[];digest=hashlib.sha256()
for words in vectors:
 for status in [0,1]:
  packet,slack,steps=run(words[0],words[1:9],words[9:],status)
  want=b'\x3d\x00\x01'+struct.pack('>12I',*words)
  assert packet==want and len(packet)==51 and slack==0
  digest.update(packet);outputs.append({'send_return':status,'length':len(packet),'steps':steps})
r={'result':'PASS','synthetic_cases':len(outputs),'packet_bytes':51,'working_buffer_bytes':52,'format':'3d 00 01 + twelve BE32 raw words (first, vector[8], tail[3])','output_digest':digest.hexdigest(),'send_return_cases':[0,1],'getter_indices':'0..7 once each','helper':'Real 080122b6 instructions interpreted, not replaced with struct.pack; struct is independent expected output.','scope':'memset, getter and send summarized; vector units and transport delivery not inferred. Both send-return values reach 08016712 identically.','image_sha256':hashlib.sha256(b).hexdigest()}
(HERE/'PACKET_VERIFICATION.json').write_text(json.dumps(r,ensure_ascii=False,indent=2)+'\n');print(json.dumps(r,ensure_ascii=False))
