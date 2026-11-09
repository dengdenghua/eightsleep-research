#!/usr/bin/env python3
"""Static caller/object binding and counter gating in frozen sensor g0.
Requires capstone==5.0.7, never executes the target. Calls remain opaque.
"""
import json,hashlib,collections
from pathlib import Path
import capstone
from capstone import Cs,CS_ARCH_ARM,CS_MODE_THUMB,CS_MODE_MCLASS
from capstone.arm import ARM_OP_IMM,ARM_OP_REG,ARM_REG_R7,ARM_REG_PC,ARM_GRP_JUMP
HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[2];p=ROOT/'materials/eightsleep-full-evidence-20261107/firmware/mtk/rootfs/files/opt/eight/lib/subsystem_updates/firmware-sensor-g0.bbin';b=p.read_bytes();BASE=0x08008000
assert hashlib.sha256(b).hexdigest()=='51531576fd31af96f7239b71d26e1f175815f5cb21dbe9ab305fa9a33cc6a891'
m=Cs(CS_ARCH_ARM,CS_MODE_THUMB|CS_MODE_MCLASS);m.detail=True
A=[]
def eq(label,a,z):A.append({'label':label,'actual':a,'expected':z,'ok':a==z});assert a==z,(label,a,z)
def raw(a,n):return b[a-BASE:a-BASE+n]
def dec(a):return next(m.disasm(raw(a,4),a,1),None)
def row(i):return {'address':hex(i.address),'bytes':i.bytes.hex(),'mnemonic':i.mnemonic,'operands':i.op_str}
def h(a):return int.from_bytes(raw(a,2),'little')
def word(a):return int.from_bytes(raw(a,4),'little')
def lit(a):i=dec(a);eq(hex(a)+' is LDR',i.mnemonic,'ldr');return word(((a+4)&~3)+i.operands[1].mem.disp)
# Frame and actual caller arguments, independent of export names.
eq('frame push',h(0x080152d8),0xb5f0);eq('frame delta',lit(0x080152da),0xffffbe5c);eq('SP addition',h(0x080152dc),0x44a5);eq('object base add',h(0x080152e8),0xafc7);eq('object passed as r1',h(0x080152ee),0x0039);eq('config pointer add',h(0x080152f0),0xa847);eq('constructor target',dec(0x080152f2).operands[0].imm,0x0801d888)
eq('constructor report pointer capture',h(0x0801d8a4),0x000e)
frame_bytes=(0x100000000-word(0x08015330));eq('frame bytes',frame_bytes,0x41a4);eq('object tail envelope',frame_bytes-0x31c,0x3e88)
# Rooted main-loop CFG. Three switch helper calls are NOT ordinary returning calls.
lo=0x080152d8;hi=0x08016df6;switches={0x08015322:(5,2),0x0801581c:(7,2),0x080168d2:(4,2)}
eq('first switch guard',h(0x0801531c),0x2804);eq('main state guard',h(0x08015812),0x2e06);eq('nested state guard',h(0x080168ca),0x2d03)
eq('helper LR capture',h(0x08008162),0x4671);eq('helper halfword index',h(0x08008166),0x0040);eq('helper LDRH',h(0x0800816a),0x5a09);eq('helper scale by two',h(0x0800816c),0x0049);eq('helper LR target add',h(0x0800816e),0x448e)
seen={};edges=[];calls=[];pending=[lo];unknown=[];tables=[]
while pending:
 a=pending.pop()
 if a in seen:continue
 if not lo<=a<hi:unknown.append({'kind':'edge_outside_selected_main_range','address':hex(a)});continue
 i=dec(a)
 if i is None:unknown.append({'kind':'invalid_opcode','address':hex(a)});continue
 seen[a]=i;fall=a+i.size;targets=[]
 if i.mnemonic in ['bl','blx']:
  target=i.operands[0].imm if i.operands[0].type==ARM_OP_IMM else None
  if target in [0x08008160,0x0800814c,0x08008138]:
   if a not in switches:unknown.append({'kind':'unmodeled_switch','address':hex(a)});continue
   n,width=switches[a];values=[int.from_bytes(raw(fall+k*width,width),'little') for k in range(n)];targets=[fall+2*v for v in values]
   tables.append({'call':hex(a),'helper':hex(target),'table':hex(fall),'width':width,'entries':values,'targets':[hex(t) for t in targets]})
  else:calls.append({'address':hex(a),'target':None if target is None else hex(target),'kind':i.mnemonic});targets=[fall]
 elif i.mnemonic=='b':targets=[i.operands[0].imm]
 elif i.group(ARM_GRP_JUMP):
  if i.operands and i.operands[-1].type==ARM_OP_IMM:targets=[fall,i.operands[-1].imm]
  else:unknown.append({'kind':'indirect_jump','instruction':row(i)})
 elif i.mnemonic=='pop' and any(o.type==ARM_OP_REG and o.reg==ARM_REG_PC for o in i.operands):pass
 elif i.mnemonic in ['udf','bkpt']:pass
 elif i.operands and i.operands[0].type==ARM_OP_REG and i.operands[0].reg==ARM_REG_PC:unknown.append({'kind':'write_pc','instruction':row(i)})
 else:targets=[fall]
 for t in targets:edges.append((a,t));pending.append(t)
# Register-write inventory excludes callee internals and interrupt handlers.
r7_writes=[row(i) for _,i in sorted(seen.items()) if ARM_REG_R7 in i.regs_access()[1]]
eq('rooted graph reaches shared store',0x08016162 in seen,True);eq('rooted graph r7 assignments',[x['address'] for x in r7_writes],['0x80152e8'])
preds=sorted(set(a for a,t in edges if t==0x08016162));eq('shared store predecessor instructions',preds,[0x08016160,0x0801674a])
# Counter step is uint8 modulo addition, not a boolean assignment.
eq('counter literal',lit(0x08016712),0x1c08)
for addr,expected in [(0x08016714,'ldrb'),(0x08016716,'adds'),(0x08016718,'uxtb'),(0x0801671a,'strb'),(0x08016724,'cmp'),(0x08016726,'bhs')]:eq(hex(addr)+' opcode',dec(addr).mnemonic,expected)
eq('threshold offset',lit(0x0801671c),0x37a0);eq('bypass byte offset',lit(0x08016728),0x3d9a);eq('other byte offset',lit(0x08016748),0x378e)
eq('unsigned threshold branch target',dec(0x08016726).operands[0].imm,0x08016732);eq('below threshold zero bypass path',dec(0x08016730).operands[0].imm,0x08016ca2)
# Enumerate uint8 counter input against uint32 boundary representatives.
models=[]
for before in range(256):
 for limit in [0,1,2,3,4,254,255,256,0xffffffff]:
  for bypass in [0,1,255]:
   after=(before+1)&255;complete=after>=limit or bypass!=0
   models.append({'before':before,'limit':limit,'bypass':bypass,'after_increment':after,'completion_branch':complete,'counter_final':0 if complete else after})
# Fixed witnesses show wrap and larger-than-u8 thresholds.
eq('255 wraps',((255+1)&255),0);eq('ordinary below threshold',((0+1)&255)>=2,False);eq('uint32 limit >255 cannot be reached by u8 after',any(((n+1)&255)>=256 for n in range(256)),False)
# Constructor-local mode selection writes the normal limits, not arbitrary 32-bit values.
eq('mode byte offset',lit(0x0801df82),0x378c);eq('four selected',h(0x0801df7c),0x2504);eq('mode branch cmp',h(0x0801df90),0x2800);eq('nonzero mode branch',dec(0x0801df92).operands[0].imm,0x0801df96);eq('zero mode branch',dec(0x0801df94).operands[0].imm,0x0801e6b4);eq('four limit offset',lit(0x0801df9c),0x37a0);eq('four STR register',h(0x0801dfa0),0x50b5);eq('three immediate',h(0x0801e6b4),0x2503);eq('three limit offset',lit(0x0801e6b6),0x37a0);eq('three STR register',h(0x0801e6b8),0x5035)
# Recover direct byte-verified excerpts, including constructor clear handoff.
excerpts={}
for name,start,end in [('helper',0x08008160,0x08008174),('caller',0x080152d8,0x08015306),('constructor_entry',0x0801d888,0x0801d8a8),('constructor_clear_setup',0x0801dab4,0x0801dac2),('constructor_clear',0x0801db28,0x0801db54),('constructor_mode',0x0801df7a,0x0801dfa2),('constructor_limit_three',0x0801e6b4,0x0801e6ba),('shared_join',0x08016154,0x0801616e),('counter_gate',0x08016712,0x0801674c),('state6',0x08016cb6,0x08016d20)]:
 ins=[];a=start
 while a<end:
  i=dec(a)
  if i is None:break
  ins.append(row(i));a+=i.size
 excerpts[name]=ins
r={'schema':'eightsleep.main-object.control.v1','result':'PASS','image':{'path':str(p.relative_to(ROOT)),'sha256':hashlib.sha256(b).hexdigest(),'base':hex(BASE)},'engine':{'capstone':capstone.__version__},'assertions':A,'constructor_selected_limit':{'condition_offset':'0x378c','zero':3,'nonzero':4,'scope':'Verified local constructor paths; not a global exclusion of all other writers.'},'caller_frame':{'pushed_bytes':20,'allocated_bytes':frame_bytes,'object_offset_from_local_sp':0x31c,'config_offset_from_local_sp':0x11c,'tail_envelope_bytes':0x3e88,'note':'Frame envelope equals previous write-derived lower bound; not a C sizeof proof.'},'cfg':{'entry':hex(lo),'exclusive_end':hex(hi),'instructions':len(seen),'edges':len(edges),'r7_writes':r7_writes,'shared_store_direct_predecessors':[hex(a) for a in preds],'switch_tables':tables,'opaque_calls':calls,'unresolved':unknown,'scope':'Overapproximate intraprocedural graph for modeled switch indices; calls assumed to return and preserve r7 under normal ABI. No callee, interrupt or path-feasibility proof.'},'excerpts':excerpts,'counter_model':{'cases':len(models),'rule':'c=(old+1)&255; complete=(c >= M32[O+0x37a0]) || (M8[O+0x3d9a]!=0). If complete: M8[O+0x1c08]=0; M8[O+0x378e]=1; M8[O]=6. Below threshold and zero bypass branches to 0x08016ca2.','note':'Conditional path and selected input combinations, not measured event rate or hardware timing.'},'limitations':['Object identity holds for the selected caller and normal register preservation; external runtime modification not observed.','Count unit, threshold producer, bypass meaning and payload completion semantics still require callers/consumers.','State values outside modeled 0..6, computed entries and non-returning/ABI-violating calls are not proven safe.']}
(HERE/'OBJECT_CONTROL.json').write_text(json.dumps(r,ensure_ascii=False,indent=2)+'\n');(HERE/'COUNTER_CASES.json').write_text(json.dumps(models,ensure_ascii=False,separators=(',',':'))+'\n')
print(json.dumps({'assertions':len(A),'graph_nodes':len(seen),'unknown':unknown,'r7_writes':r7_writes,'shared_predecessors':[hex(a) for a in preds],'counter_cases':len(models),'switch_tables':tables},ensure_ascii=False,indent=2))
