#!/usr/bin/env python3
"""Raw-byte provenance of mode inputs and bounded writer postdomination."""
from pathlib import Path
import json,hashlib,collections
from capstone import *
from capstone.arm import *
HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[2];p=ROOT/'materials/eightsleep-full-evidence-20261107/firmware/mtk/rootfs/files/opt/eight/lib/subsystem_updates/firmware-sensor-g0.bbin';b=p.read_bytes();B=0x08008000
assert hashlib.sha256(b).hexdigest()=='51531576fd31af96f7239b71d26e1f175815f5cb21dbe9ab305fa9a33cc6a891'
m=Cs(CS_ARCH_ARM,CS_MODE_THUMB|CS_MODE_MCLASS);m.detail=True;A=[]
def raw(a,n):return b[a-B:a-B+n]
def ins(a):return next(m.disasm(raw(a,4),a,1))
def h(a):return int.from_bytes(raw(a,2),'little')
def eq(n,x,y):A.append({'label':n,'actual':x,'expected':y,'ok':x==y});assert x==y,(n,x,y)
def lit(a):i=ins(a);eq(hex(a)+' ldr',i.mnemonic,'ldr');p=((a+4)&~3)+i.operands[1].mem.disp;return int.from_bytes(raw(p,4),'little')
eq('config callback offset component',h(0x0801db32),0x23c8);eq('config callback offset scale',h(0x0801db38),0x005b);eq('config callback load',h(0x0801db3e),0x58fb);eq('config callback save',h(0x0801db42),0x9308);eq('callback reload',h(0x0801dbac),0x9c08);eq('callback BLX r4',h(0x0801dbb2),0x47a0);eq('return capture',h(0x0801dbb4),0x0004)
eq('identifier base',lit(0x0801dbc4),0x20001cec);eq('identifier halfword offset10',h(0x0801dbc8),0x8a1b);eq('identifier stack H',h(0x0801dbca),0x9308);eq('outer threshold source',h(0x0801dbcc),0x23a0);eq('outer threshold shift',h(0x0801dbd0),0x011b);eq('above threshold branch',ins(0x0801dbd6).operands[0].imm,0x0801dd84)
# Raw rooted CFG from H>=a00 branch; ordinary calls summarized as return.
start=0x0801dd84;end=0x0801df10;pending=[start];nodes={};edges=[];exits=set()
while pending:
 a=pending.pop()
 if a in nodes:continue
 if not start<=a<end:exits.add(a);continue
 i=ins(a);nodes[a]=i;fall=a+i.size
 if i.mnemonic in ['bl','blx']:ts=[fall]
 elif i.mnemonic=='b':ts=[i.operands[0].imm]
 elif i.group(ARM_GRP_JUMP):ts=[fall,i.operands[0].imm]
 else:ts=[fall]
 for t in ts:edges.append((a,t));pending.append(t)
without=set();pending=[start]
while pending:
 a=pending.pop()
 if a in without or a==0x0801ddc2:continue
 without.add(a);pending.extend(t for f,t in edges if f==a)
eq('bounded exits',sorted(exits),[end]);eq('no bounded normal exit avoiding B store',sorted(exits&without),[])
eq('B store offset',lit(0x0801ddc0),0x3d9a);eq('B set one',h(0x0801ddbe),0x2301);eq('B STRB',h(0x0801ddc2),0x54b3)
# A known config callback candidate and its concrete MMIO leaf.
eq('callback slot setter literal',lit(0x0800f976),0x080110f7);eq('callback slot store offset',h(0x0800f97a),0x5083)
eq('callback index0',h(0x080110f8),0x2000);eq('callback target',ins(0x080110fa).operands[0].imm,0x0801fdd0);eq('descriptor table',lit(0x0801fdd4),0x08027f0c);eq('descriptor0 port',int.from_bytes(raw(0x08027f10,4),'little'),0x50000000);eq('descriptor0 mask',int.from_bytes(raw(0x08027f14,2),'little'),1);eq('leaf register read offset10',h(0x0800acbc),0x6900)
excerpts={}
for name,a,end2 in [('callback_input',0x0801db32,0x0801db46),('capture',0x0801dbac,0x0801dbd8),('mode_write',0x0801dda2,0x0801ddca),('callback',0x080110f6,0x08011100),('index_reader',0x0801fdd0,0x0801fdec),('mmio_bool',0x0800acbc,0x0800acc8),('setter',0x0800f968,0x0800f97c)]:
 out=[]
 while a<end2:
  i=ins(a);out.append({'address':hex(a),'bytes':i.bytes.hex(),'mnemonic':i.mnemonic,'operands':i.op_str});a+=i.size
 excerpts[name]=out
r={'result':'PASS','image':{'path':str(p.relative_to(ROOT)),'sha256':hashlib.sha256(b).hexdigest()},'assertions':A,'mode_input':{'H_address':'0x20001cfc','H_width':16,'callback_slot':'config+0x190','callback_null_result':0,'known_callback':'0x080110f7','known_callback_index':0,'known_mmio_register':'0x50000010','known_mask':1,'scope':'Slot candidate checked in frozen bytes; active deployment and full setter replay not claimed.'},'high_identifier_cfg':{'entry':hex(start),'normal_exit':hex(end),'nodes':len(nodes),'edges':len(edges),'exits':[hex(x) for x in sorted(exits)],'exit_reachable_without_store':False,'writer':'0x0801ddc2','note':'All modeled paths to bounded normal exit cross writer; callback==1 is not necessary for B=1. Ordinary calls assumed to return; no actual program path feasibility proof.'},'excerpts':excerpts,'limitations':['Mode register physical pin and electrical meaning unknown.','H>=a00 branch normal-exit property does not audit all runtime writers.','Global identifier production and actual board/deployment relation remain separate.']}
(HERE/'MODE_PROVENANCE.json').write_text(json.dumps(r,ensure_ascii=False,indent=2)+'\n');print('PASS',len(A),'assertions',len(nodes),'CFG nodes')
