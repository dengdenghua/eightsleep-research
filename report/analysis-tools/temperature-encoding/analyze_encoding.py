#!/usr/bin/env python3
from pathlib import Path
import json,hashlib,struct
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
def double(a,z):return struct.unpack('<d',struct.pack('<II',lit(a),lit(z)))[0]
eq('serializer getter',target(0x0801ecfa),0x0801ecdc);eq('missing word',lit(0x0801ecfe),0xc2c80000);eq('missing equality',target(0x0801ed02),0x08008568);eq('special id10',h(0x0801ed0c),0x380a);eq('missing special mask',lit(0x0801ed12),0x80ff);eq('missing base code',lit(0x0801ed18),0xffff8000);eq('normal scale100',lit(0x0801ed28),0x42c80000);eq('normal float multiply',target(0x0801ed2c),0x08023ad8);eq('actual int convert',target(0x0801ed30),0x0801fe78);eq('narrow signed16',h(0x0801ed34),0xb200);eq('id store',h(0x0801ed1e),0x7025);eq('high byte store',h(0x0801ed22),0x7063);eq('low byte store',h(0x0801ed20),0x70a0)
eq('W reference coefficient',double(0x080185f0,0x080185f2),0.1);eq('W lesser coefficient',double(0x08018604,0x08018606),0.2);eq('W divisor',double(0x08018624,0x08018626),1.3);eq('W compare',target(0x08018600),0x0800859c);eq('final float conversion',target(0x0801862c),0x08020e0c)
eq('query opcode adjustment',h(0x0801719a),0x1fa8);eq('query jump helper',target(0x080171a0),0x08008484);eq('helper signed half load',h(0x0800848e),0x5e09);base=0x080171a4;entry=int.from_bytes(raw(base+2*(0x2a-6),2),'little',signed=True);eq('2a destination',base+entry*2,0x0801724c)
eq('query availability offset shift',h(0x0801724c),0x2398);eq('single id max',h(0x08017264),0x290b);eq('all id',h(0x0801727c),0x29ff);eq('single encoded length',h(0x08017276),0x2103);eq('three-mode item count',h(0x080172b2),0x230b);eq('four-mode extra count',h(0x080172a2),0x330b);eq('reply append',target(0x08017154),0x08012314)
excerpts={}
for name,a,z in [('serializer',0x0801ecf0,0x0801ed38),('int_conversion',0x0801fe78,0x0801feb2),('weighted',0x080185cc,0x08018642),('merge',0x0801eb90,0x0801ec44),('query',0x0801724c,0x080172b6),('reply_append',0x08012314,0x0801233c)]:
 rows=[]
 while a<z:
  i=ins(a);rows.append({'address':hex(a),'bytes':i.bytes.hex(),'mnemonic':i.mnemonic,'operands':i.op_str});a+=i.size
 excerpts[name]=rows
r={'result':'PASS','image':{'path':str(p.relative_to(ROOT)),'sha256':hashlib.sha256(b).hexdigest()},'assertions':A,'rules':{'encoding':'id:u8 + BE16. Exact -100.0 ->8000 except id10 ->00ff. Otherwise low16(trunc(f32(value*100))).','W':'f32((max(a,b)+double(.2)*min(a,b)+double(.1)*reference)/double(1.3)), evaluated in byte-derived order.','merge':'Missing reference first replaced with A, even when A is missing. Missing-main cases branch; all-present uses two W steps with max(B,U) second reference.','query':'Local MCU opcode2a; single ids0..11; ff bulk emits0..10 for mode3 or0..14 for mode4. Append routine may limit actual content to remaining response-buffer capacity.'},'excerpts':excerpts,'limitations':['Not App/cloud API; no current device reachability or successful transfer established.','Encoding aliases do not prove their input tuples reachable on real device.','Synthetic missing-reference witness does not by itself prove a firmware bug or downstream physical effect.']}
(HERE/'ENCODING_CHAIN.json').write_text(json.dumps(r,ensure_ascii=False,indent=2)+'\n');print('PASS',len(A),'raw assertions')
