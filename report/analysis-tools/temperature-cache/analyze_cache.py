#!/usr/bin/env python3
from pathlib import Path
import json,hashlib
from capstone import *
from capstone.arm import *
HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[2];p=ROOT/'materials/eightsleep-full-evidence-20261107/firmware/mtk/rootfs/files/opt/eight/lib/subsystem_updates/firmware-sensor-g0.bbin';b=p.read_bytes();B=0x08008000
assert hashlib.sha256(b).hexdigest()=='51531576fd31af96f7239b71d26e1f175815f5cb21dbe9ab305fa9a33cc6a891'
m=Cs(CS_ARCH_ARM,CS_MODE_THUMB|CS_MODE_MCLASS);m.detail=True;A=[]
def raw(a,n):return b[a-B:a-B+n]
def ins(a):return next(m.disasm(raw(a,4),a,1))
def h(a):return int.from_bytes(raw(a,2),'little')
def eq(n,a,z):A.append({'label':n,'actual':a,'expected':z,'ok':a==z});assert a==z,(n,a,z)
def target(a):return ins(a).operands[0].imm
def lit(a):i=ins(a);p=((a+4)&~3)+i.operands[1].mem.disp;return int.from_bytes(raw(p,4),'little')
eq('queue stride',h(0x0801d6c0),0x2314);eq('queue descriptor offset',h(0x0801d6c4),0x3340);eq('setter first push',target(0x0801d6d0),0x080130f0);eq('setter pop on full',target(0x0801d6dc),0x080131b4);eq('setter second push',target(0x0801d6e8),0x080130f0)
eq('push capacity check',h(0x08013100),0x428b);eq('full push skips copy',target(0x08013102),0x08013122);eq('push memcpy',target(0x08013116),0x08020f94);eq('push index advance',h(0x0801311e),0x3301);eq('pop index advance',h(0x080131e0),0x3301)
eq('lower bound immediate',h(0x0801ec8c),0x2180);eq('lower bound shift',h(0x0801ec90),0x05c9);eq('lower comparator',target(0x0801ec94),0x080085b0);eq('upper comparator',target(0x0801eca0),0x08008588);eq('mean sum helper',target(0x0801ecac),0x080233f8);eq('mean division helper',target(0x0801ecce),0x0802370c);eq('getter lower bound bits',0x80<<23,0x40000000);eq('getter upper bound',lit(0x0801ec9c),0x42700000);eq('getter no valid sentinel',lit(0x0801ec86),0xc2c80000);eq('getter pop',target(0x0801ec72),0x080131b4);eq('getter reinsert same word',target(0x0801ecc2),0x080130f0);eq('getter pop buffer',h(0x0801ec70),0xa903);eq('getter reinsertion buffer',h(0x0801ecc0),0xa903);eq('getter snapshot W load',h(0x0801ec5c),0x6cc2);eq('getter snapshot R load',h(0x0801ec60),0x6d03)
eq('getter route limit',h(0x0801ecde),0x2907);eq('mean selected for <=7',target(0x0801ece0),0x0801ece8);eq('mean target',target(0x0801ece8),0x0801ec48);eq('raw route load',h(0x0801ece4),0x5808)
eq('constructor descriptor base',lit(0x0801e9ba),0x1c4c);eq('constructor component base',lit(0x0801e9c4),0x1c0c);eq('constructor capacity10',h(0x0801e9ce),0x220a);eq('capacity store',h(0x0801e9d0),0x604a);eq('element size source',h(0x0801e9c0),0x2204);eq('element size store',h(0x0801e9d4),0x608a);eq('16 queue descriptors',h(0x0801e9fc),0x2810);eq('init data sentinel',lit(0x0801e9ee),0xc2c80000)
excerpts={}
for name,a,z in [('setter',0x0801d6c0,0x0801d6ee),('push',0x080130f0,0x08013124),('pop',0x080131b4,0x080131e6),('mean',0x0801ec48,0x0801ecd4),('getter',0x0801ecdc,0x0801ecee),('init',0x0801e9ba,0x0801ea00),('lower_wrapper',0x080085b0,0x080085c2),('upper_wrapper',0x08008588,0x0800859a)]:
 rows=[]
 while a<z:
  i=ins(a);rows.append({'address':hex(a),'bytes':i.bytes.hex(),'mnemonic':i.mnemonic,'operands':i.op_str});a+=i.size
 excerpts[name]=rows
r={'result':'PASS','image':{'path':str(p.relative_to(ROOT)),'sha256':hashlib.sha256(b).hexdigest()},'assertions':A,'descriptor':{'offset':'component+0x40+20*slot','fields':{'0':'buffer','4':'capacity','8':'element_bytes','12':'write_counter','16':'read_counter'},'constructor':{'queues':16,'capacity':10,'element_bytes':4}},'rules':{'setter':'Copy raw word. If full, pop one then retry push. No numeric validity filtering in this path.','getter_0_7':'Snapshot occupancy; pop and re-push original words; average eligible 2<=float32<=60. No eligible words -> -100.0. No wall-clock age field inspected.','getter_over7':'Direct component[slot] raw-word load; not averaged; caller bounds are separate.','scope':'Normal valid queue descriptor and no interleaving/counter wrap. This temperature queue is not the piezo/HR processing algorithm.'},'excerpts':excerpts}
(HERE/'CACHE_CHAIN.json').write_text(json.dumps(r,ensure_ascii=False,indent=2)+'\n');print('PASS',len(A),'raw queue/getter/constructor assertions')
