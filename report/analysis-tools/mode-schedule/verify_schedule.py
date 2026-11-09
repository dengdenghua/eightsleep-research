#!/usr/bin/env python3
"""Interpret the real four-way scheduling bytecode, summarize temperature
getter and cache setter calls, compare requests to an independent schedule table.
"""
from pathlib import Path
import json,hashlib
from capstone import *
from capstone.arm import *
HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[2];b=(ROOT/'materials/eightsleep-full-evidence-20261107/firmware/mtk/rootfs/files/opt/eight/lib/subsystem_updates/firmware-sensor-g0.bbin').read_bytes();B=0x08008000;S=0x20010000;O=S+0x31c;M1=0x20030000;M2=0x20031000
assert hashlib.sha256(b).hexdigest()=='51531576fd31af96f7239b71d26e1f175815f5cb21dbe9ab305fa9a33cc6a891'
m=Cs(CS_ARCH_ARM,CS_MODE_THUMB|CS_MODE_MCLASS);m.detail=True;cache={}
def dec(a):
 if a not in cache:cache[a]=next(m.disasm(b[a-B:a-B+4],a,1))
 return cache[a]
def ri(r):
 n=m.reg_name(r)
 return {'sp':13,'lr':14,'pc':15}.get(n,int(n[1:]) if n.startswith('r') else -1)
def run(limit,step,enable_a,enable_b,seed):
 regs=[0]*16;regs[13]=S;regs[7]=O;regs[5]=step;regs[6]=5;mem={};Z=False;C=False;pc=0x080168c8;writes=[];gets=[]
 def put(a,v,n):
  for k in range(n):mem[a+k]=(v>>(8*k))&255
 def get(a,n):
  if B<=a and a+n<=B+len(b):return int.from_bytes(b[a-B:a-B+n],'little')
  return sum(mem.get(a+k,0)<<(8*k) for k in range(n))
 def val(op):return regs[ri(op.reg)] if op.type==ARM_OP_REG else op.imm
 def addr(op):return (regs[ri(op.mem.base)]+(regs[ri(op.mem.index)] if op.mem.index else 0)+op.mem.disp)&0xffffffff
 put(O+0x202c,limit,4);put(O+0x2020,M1,4);put(O+0x2024,M2,4);put(M1,enable_a,1);put(M2,enable_b,1)
 for n in range(220):
  if pc==0x080169b0:return {'setter_requests':writes,'getter_requests':gets,'stop':hex(pc),'instructions':n}
  i=dec(pc);ops=i.operands;name=i.mnemonic;nxt=pc+i.size
  if name=='ldr' or name=='ldrb':
   a=(((pc+4)&~3)+ops[1].mem.disp) if ops[1].mem.base==ARM_REG_PC else addr(ops[1]);regs[ri(ops[0].reg)]=get(a,4 if name=='ldr' else 1)
  elif name=='str':put(addr(ops[1]),val(ops[0]),4)
  elif name=='movs':regs[ri(ops[0].reg)]=val(ops[1])
  elif name in ['add','adds']:
   rd=ri(ops[0].reg);regs[rd]=((regs[rd] if len(ops)==2 else val(ops[1]))+val(ops[-1]))&0xffffffff
  elif name=='lsls':regs[ri(ops[0].reg)]=(val(ops[1])<<val(ops[2]))&0xffffffff
  elif name=='cmp':lhs=val(ops[0]);rhs=val(ops[1]);Z=lhs==rhs;C=lhs>=rhs
  elif name=='adcs':rd=ri(ops[0].reg);regs[rd]=(regs[rd]+val(ops[1])+int(C))&0xffffffff
  elif name in ['b','beq','bne','bhi','bls']:
   take={'b':True,'beq':Z,'bne':not Z,'bhi':C and not Z,'bls':not C or Z}[name]
   if take:nxt=ops[0].imm
  elif name=='bl':
   t=ops[0].imm
   if t==0x08008160:
    base=nxt;index=regs[0];assert index<4;nxt=base+2*get(base+2*index,2)
   elif t==0x0801d6f0:
    ch=regs[1];gets.append(ch);regs[0]=(seed+(ch<<8)+step)&0xffffffff
   elif t==0x0801d6c0:
    assert regs[0]==S+0x20+0x1f08;writes.append({'slot':regs[1],'value_bits':get(regs[2],4)})
   else:raise AssertionError(('unmodeled call',hex(pc),hex(t)))
  else:raise AssertionError(('opcode',hex(pc),name))
  pc=nxt
 raise AssertionError('execution bound')
# Expected per-step cache slot requests, not physical sensor labels.
expected={3:[(2,7),(3,6),(4,5)],4:[(0,4),(1,5),(2,6),(3,7)]}
cases=[]
for limit,steps in expected.items():
 for step,slots in enumerate(steps):
  for ena,enb in [(0,0),(0,1),(1,0),(1,1)]:
   for seed in [0x3f800000,0x80001000]:
    actual=run(limit,step,ena,enb,seed)
    want=[{'slot':slots[0],'value_bits':((seed+(1<<8)+step)&0xffffffff) if ena else 0xc2c80000},{'slot':slots[1],'value_bits':((seed+(4<<8)+step)&0xffffffff) if enb else 0xc2c80000}]
    assert actual['setter_requests']==want,(limit,step,ena,enb,actual,want)
    assert actual['getter_requests']==(([1] if ena else [])+([4] if enb else []))
    cases.append({'limit':limit,'step':step,'enable_a':ena,'enable_b':enb,'seed':seed,**actual})
r={'result':'PASS','cases':len(cases),'image_sha256':hashlib.sha256(b).hexdigest(),'schedule':{str(n):[list(x) for x in rows] for n,rows in expected.items()},'source_getter_args':[1,4],'disabled_value_bits':'0xc2c80000','disabled_value_float':-100.0,'assumptions':['Entry at 080168c8, r5 is prior step and r6=5 (main state5).','O[202c]=3 or4, O[2020]/O[2024] point to test descriptors.','Getter returns synthetic raw words; setter requests observed, actual cache filtering not reimplemented.','Stop at 080169b0 before further weighting/output logic.'],'records':cases}
(HERE/'SCHEDULE_VERIFICATION.json').write_text(json.dumps(r,ensure_ascii=False,indent=2)+'\n');print('PASS',len(cases),'cases; schedule',r['schedule'])
