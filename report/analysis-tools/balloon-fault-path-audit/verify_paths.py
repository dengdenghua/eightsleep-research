#!/usr/bin/env python3
"""Bounded original-byte Thumb execution of A02 FaultReason guard/store slices.
No firmware process, peripheral, device or network is accessed.
"""
from pathlib import Path
import hashlib,json
from capstone import Cs, CS_ARCH_ARM, CS_MODE_THUMB, CS_MODE_MCLASS
from capstone.arm import ARM_OP_REG,ARM_OP_IMM
HERE=Path(__file__).resolve().parent
ROOT=HERE.parents[2]
IMAGE=ROOT/'materials/eightsleep-full-evidence-20261107/firmware/mtk/rootfs/files/opt/eight/firmware/balloon/A02/firmware-balloon-g0.bbin'
BASE=0x08010000;BAG=0x2000bf88;FAULT=0xa2
raw=IMAGE.read_bytes();sha=hashlib.sha256(raw).hexdigest()
assert sha=='0a2fa991c548478fa614d227777222f3f0914594f8db779bcc3837f30cd2e67a'
md=Cs(CS_ARCH_ARM,CS_MODE_THUMB|CS_MODE_MCLASS);md.detail=True
cache={};visited=set();traces={}
def instruction(pc):
 if pc not in cache:
  assert BASE<=pc<BASE+len(raw)
  cache[pc]=next(md.disasm(raw[pc-BASE:pc-BASE+4],pc,1))
 return cache[pc]
def execute(entry,stops,initial,mem):
 regs=dict(initial);writes=[];path=[];zero=False;carry=False;pc=entry
 def reg(n):return regs.get(n,0)
 def get(a,n):return sum(mem.get(a+i,0)<<(8*i) for i in range(n))
 for step in range(50):
  if pc in stops:return {'stop':pc,'writes':writes,'path':path,'mem':mem}
  ins=instruction(pc);visited.add(pc);path.append(pc);ops=ins.operands;m=ins.mnemonic;nxt=pc+ins.size
  def val(op):
   if op.type==ARM_OP_REG:return reg(md.reg_name(op.reg))
   assert op.type==ARM_OP_IMM
   return op.imm
  def address(op):
   assert not op.mem.index
   return (reg(md.reg_name(op.mem.base))+op.mem.disp)&0xffffffff
  if m in ('mov','movs'):regs[md.reg_name(ops[0].reg)]=val(ops[1])&0xffffffff
  elif m in ('add','adds'):
   dest=md.reg_name(ops[0].reg);regs[dest]=((reg(dest) if len(ops)==2 else val(ops[1]))+val(ops[-1]))&0xffffffff
  elif m in ('ldr','ldrb','ldrh'):
   n={'ldr':4,'ldrb':1,'ldrh':2}[m];regs[md.reg_name(ops[0].reg)]=get(address(ops[1]),n)
  elif m in ('str','strb','strh'):
   n={'str':4,'strb':1,'strh':2}[m];a=address(ops[1]);v=val(ops[0]);writes.append({'pc':pc,'address':a,'width':n,'value':v&((1<<(8*n))-1)})
   for i in range(n):mem[a+i]=(v>>(8*i))&255
  elif m=='cmp':a,z=val(ops[0]),val(ops[1]);zero=a==z;carry=a>=z
  elif m in ('b','bl','beq','bne','bhi'):
   take={'b':True,'bl':True,'beq':zero,'bne':not zero,'bhi':carry and not zero}[m]
   if take:nxt=ops[0].imm
  else:raise AssertionError((hex(pc),m,ins.op_str))
  pc=nxt
 raise AssertionError('slice step budget exceeded')
def put(mem,a,v,n=4):
 for i in range(n):mem[a+i]=(v>>(8*i))&255
counts=[0,1,2,3,0xffffffff];cases=0;effects={'write5':0,'write6':0,'preserve':0}
for inflate in counts:
 for deflate in counts:
  for old in range(256):
   mem={};put(mem,BAG+0x8c,inflate);put(mem,BAG+0x90,deflate);put(mem,BAG+FAULT,old,1)
   out=execute(0x0802293c,{0x08022958,0x08022a2a},{'r6':BAG,'r7':6},mem)
   expected=5 if inflate>2 else 6 if deflate>2 else old
   assert out['stop']==0x08022958 and mem[BAG+FAULT]==expected
   expected_count=int(inflate>2 or deflate>2);assert len(out['writes'])==expected_count
   if expected_count:assert out['writes'][0]['address']==BAG+FAULT and out['writes'][0]['width']==1
   effect='write5' if inflate>2 else 'write6' if deflate>2 else 'preserve';effects[effect]+=1;cases+=1
   if old==1 and (inflate,deflate) in [(3,3),(2,3),(2,2)]:traces[f'counts_{inflate}_{deflate}_old1']=out['path']
guard_cases=0
for value in range(256):
 if value==6:continue
 out=execute(0x0802293c,{0x08022958,0x08022a2a},{'r6':BAG,'r7':value},{})
 assert out['stop']==0x08022a2a and not out['writes'];guard_cases+=1
safety_cases=0
for old in range(256):
 for latch in (0,1,255):
  mem={};put(mem,BAG+0xa0,latch,1);put(mem,BAG+0xa1,4,1);put(mem,BAG+0xa2,old,1)
  out=execute(0x08022a20,{0x08022a2a},{'r5':BAG+0xa0},mem)
  assert mem[BAG+0xa2]==old
  if latch:assert mem[BAG+0xa0]==mem[BAG+0xa1]==0 and len(out['writes'])==1
  else:assert not out['writes']
  safety_cases+=1
clear_cases=0
for old in range(256):
 mem={};put(mem,BAG+FAULT,old,1)
 out=execute(0x08022a32,{0x080226aa},{'r6':BAG},mem)
 assert mem[BAG+FAULT]==0 and len(out['writes'])==1
 assert out['writes'][0]['pc']==0x080221fc;clear_cases+=1
result={'schema':'eightsleep.a02-fault-path-audit.v1','result':'PASS','image':{'path':str(IMAGE.relative_to(ROOT)),'sha256':sha,'bytes':len(raw),'load_base':hex(BASE)},'scope':'Bounded guarded slices with explicit entry registers/memory, not whole-program emulation or device behavior. Calls only follow the local shared store at 080221fc.','cases':{'count_cross_old_byte':cases,'non6_guard':guard_cases,'safety_halfword':safety_cases,'fault_clear':clear_cases,'total':cases+guard_cases+safety_cases+clear_cases},'effects':effects,'instructions':[{'address':hex(a),'bytes':cache[a].bytes.hex(),'instruction':cache[a].mnemonic+' '+cache[a].op_str} for a in sorted(visited)],'traces':{k:[hex(a) for a in v] for k,v in traces.items()},'conclusions':['The B+0x90+0x12 destination is B+0xA2, verified from original instructions.','The guard at 0802293c excludes r7!=6 from the inspected deflate store path. A syntactic source candidate 1 does not establish a reachable Fault1 write.','Inflate count>2 writes5 before deflate comparison; otherwise deflate count>2 writes6; otherwise no FaultReason write in this slice.','Old Fault1..4 bytes can be preserved by the below-threshold slice but their origin is not established.','Safety halfword clear at B+A0 touches A0 and A1 only; separate shared-byte clear at 080221fc can zero A2.'],'limitations':['No reconstruction of counters upstream or timing/units.','No proof that all incoming edges to any store satisfy this slice entry condition.','Unresolved writes and other firmware regions remain outside scope.','Synthetic memory with old1..4 is a test input, not evidence of an actual producer.']}
(HERE/'PATH_VERIFICATION.json').write_text(json.dumps(result,ensure_ascii=False,indent=2)+'\n')
print(json.dumps({'result':'PASS','cases':result['cases'],'instruction_sites':len(visited),'effects':effects}))
