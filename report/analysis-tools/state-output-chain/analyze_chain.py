#!/usr/bin/env python3
"""Bounded packet / progress / accounting chain, only frozen-g0 bytes."""
from pathlib import Path
import json,hashlib
from capstone import *
from capstone.arm import *
HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[2];p=ROOT/'materials/eightsleep-full-evidence-20261107/firmware/mtk/rootfs/files/opt/eight/lib/subsystem_updates/firmware-sensor-g0.bbin';b=p.read_bytes();B=0x08008000
assert hashlib.sha256(b).hexdigest()=='51531576fd31af96f7239b71d26e1f175815f5cb21dbe9ab305fa9a33cc6a891'
m=Cs(CS_ARCH_ARM,CS_MODE_THUMB|CS_MODE_MCLASS);m.detail=True;A=[]
def read(a,n):return b[a-B:a-B+n]
def ins(a):return next(m.disasm(read(a,4),a,1))
def eq(n,a,z):A.append({'label':n,'actual':a,'expected':z,'ok':a==z});assert a==z,(n,a,z)
def half(a):return int.from_bytes(read(a,2),'little')
def literal(a):i=ins(a);eq(hex(a)+' literal load',i.mnemonic,'ldr');pa=((a+4)&~3)+i.operands[1].mem.disp;return int.from_bytes(read(pa,4),'little')
def target(a):return ins(a).operands[0].imm
# No-packet paths arrive at exactly the same counter gate.
eq('copy source flag',literal(0x080165d4),0x2030);eq('packet enable flag',literal(0x0801665e),0x2030);eq('no packet flag branch',target(0x08016664),0x08016712);eq('timer call',target(0x0801666c),0x080134be);eq('not due branch',target(0x08016672),0x08016712);eq('packet transmit wrapper',target(0x0801670e),0x080122d0);eq('immediate next overwrites r3',half(0x08016712),0x4b23)
# Return r0 is not used before counter byte store: inspect the complete 5-insn interval.
gate=[ins(a) for a in [0x08016712,0x08016714,0x08016716,0x08016718,0x0801671a]]
eq('return r0 not read in gate',all(ARM_REG_R0 not in i.regs_access()[0] for i in gate),True)
# Selected constructor path sets B=1 and also clears 378c; H origin remains bounded.
eq('mode input transform literal',literal(0x0801dd86),0xfffff580);eq('mode input truncate',half(0x0801dd8a),0xb29b);eq('range compare',half(0x0801dd8e),0x2b7f);eq('additional local condition',half(0x0801dd92),0x2c01);eq('range miss branch',target(0x0801dd90),0x0801de20);eq('condition miss branch',target(0x0801dd94),0x0801ddca);eq('B destination',literal(0x0801ddc0),0x3d9a);eq('B source one',half(0x0801ddbe),0x2301);eq('B store',half(0x0801ddc2),0x54b3);eq('constructor packet flag copy source',literal(0x0801e5a6),0x3d9a)
# Packet header and leaf BE32 serializer.
eq('opcode',half(0x08016684),0x233d);eq('version calculation',half(0x08016694),0x3b3c);eq('8 vector words',half(0x080166c8),0x2c08);eq('working capacity',half(0x080166a6),0x2634);eq('leaf capacity guard',half(0x080122ba),0x2903);eq('leaf capacity fail exit',target(0x080122bc),0x080122ce)
# State 6 consumes latch for accounting, not send acknowledgment.
eq('state6 latch',literal(0x08016d26),0x378e);eq('state6 clear latch instruction',half(0x08016d30),0x54fd);eq('latch zero skips extra stats',target(0x08016d2c),0x08016d4e);eq('reset state zero instruction',half(0x08016d0e),0x703d)
eq('always time sum offset',0xa4<<2,0x290);eq('always count offset',(0xa4<<2)-4,0x28c);eq('latched time sum offset',0xa6<<2,0x298);eq('latched count offset',(0xa6<<2)-4,0x294)
for address,expected in [(0x08016d14,0x22a4),(0x08016d16,0x0092),(0x08016d1c,0x50bb),(0x08016d1e,0x3a04),(0x08016d24,0x50bb),(0x08016d3c,0x22a6),(0x08016d3e,0x0092),(0x08016d44,0x50bb),(0x08016d46,0x3a04),(0x08016d4c,0x50bb)]:eq(hex(address)+' accounting encoding',half(address),expected)
# Wrapper counts attempts / bytes before framing and returns local error-byte XOR 1.
eq('attempt counter address',literal(0x080122d0),0x20002264);eq('local error byte address',literal(0x080122d6),0x2000225c);eq('attempt byte sum address',literal(0x080122dc),0x20002260);eq('framer target',target(0x080122e8),0x0801f2d4);eq('return XOR opcode',half(0x080122f2),0x4058);eq('error counter address',literal(0x080122f8),0x200022b4)
excerpts={}
for name,start,end in [('mode_writer',0x0801dd84,0x0801ddca),('flag_copy',0x0801e5a6,0x0801e5c2),('send_gates',0x0801665e,0x08016684),('packet_builder',0x08016682,0x0801671c),('be32_leaf',0x080122b6,0x080122d0),('send_wrapper',0x080122d0,0x08012302),('state6_accounting',0x08016d04,0x08016d4e),('elapsed_helper',0x08013658,0x08013670)]:
 rows=[];a=start
 while a<end:
  i=ins(a);rows.append({'address':hex(a),'bytes':i.bytes.hex(),'mnemonic':i.mnemonic,'operands':i.op_str});a+=i.size
 excerpts[name]=rows
r={'result':'PASS','image':{'path':str(p.relative_to(ROOT)),'sha256':hashlib.sha256(b).hexdigest(),'base':hex(B)},'assertions':A,'excerpts':excerpts,'rules':{'mode_writer':'For low16(H-0xa80)<=0x7f and local r4==1 on selected constructor path, O[3d9a]=1 and O[378c]=0. H is [sp+0x20] at this point; all reaching writers not established.','send_gate':'O[2030]==0 or timer helper returns 0 -> counter gate without 3d send; otherwise build 3d and invoke 122d0, then counter gate with r0 unchecked.','packet':'3d 00 01; first BE32 word; 8 vector BE32 words; 3 tail BE32 words; 51 used bytes in 52-byte work buffer. Input words are raw bits, not newly inferred units.','accounting':'Always: O[290]+=elapsed; O[28c]++. If O[378e]!=0: clear it, O[298]+=second_elapsed; O[294]++. O[0] is reset to 0 before accounting.'},'limitations':['Selected constructor path is not a complete producer/writer proof or a device-mode name.','Attempt counter advances even when optional packet absent; it is not a successful-transmission or fresh-sample counter.','No cloud/device ACK, delivery, physical time units or biological algorithm inferred.','Callees and hardware paths outside the selected blocks remain bounded.']}
(HERE/'OUTPUT_CHAIN.json').write_text(json.dumps(r,ensure_ascii=False,indent=2)+'\n');print('PASS',len(A),'raw assertions')
