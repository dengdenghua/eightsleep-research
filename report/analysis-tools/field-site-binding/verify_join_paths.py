#!/usr/bin/env python3
"""Independently decode two bounded Thumb-1 paths to one shared STRB.
All assertions operate on frozen image bytes, not exported instruction text.
"""
from pathlib import Path
import hashlib,json
HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[2]
p=ROOT/'materials/eightsleep-full-evidence-20261107/firmware/mtk/rootfs/files/opt/eight/lib/subsystem_updates/firmware-sensor-g0.bbin';b=p.read_bytes();BASE=0x08008000
assert hashlib.sha256(b).hexdigest()=='51531576fd31af96f7239b71d26e1f175815f5cb21dbe9ab305fa9a33cc6a891'
checks=[];sites=[]
def eq(label,a,z):checks.append({'label':label,'actual':a,'expected':z,'ok':a==z});assert a==z,(label,a,z)
def half(a):return int.from_bytes(b[a-BASE:a-BASE+2],'little')
def lit(a):
 h=half(a);eq(hex(a)+' literal opcode',h&0xf800,0x4800);addr=((a+4)&~3)+4*(h&255);return (h>>8)&7,addr,int.from_bytes(b[addr-BASE:addr-BASE+4],'little')
def mov(a):
 h=half(a);eq(hex(a)+' mov immediate',h&0xf800,0x2000);return (h>>8)&7,h&255
def mem(a):
 h=half(a);eq(hex(a)+' register memory opcode',h&0xf000,0x5000);return (h>>9)&7,(h>>6)&7,(h>>3)&7,h&7
# Path A: selected predecessor loads zero then 0x1c08 and falls into store.
eq('path A zero',mov(0x0801615e),(2,0));eq('path A offset',lit(0x08016160),(3,0x080161f4,0x1c08));eq('shared store',mem(0x08016162),(2,3,7,2))
# Path B: clear 0x1c08, then set a different field via branch to SAME store.
eq('path B zero',mov(0x08016740),(3,0));eq('path B first offset',lit(0x08016742),(2,0x080167a0,0x1c08));eq('path B clear store',mem(0x08016744),(2,2,7,3));eq('path B one',mov(0x08016746),(2,1));eq('path B second offset',lit(0x08016748),(3,0x08016808,0x378e))
h=half(0x0801674a);eq('path B unconditional B opcode',h&0xf800,0xe000);imm=h&0x7ff;imm=imm-0x800 if imm&0x400 else imm;target=0x0801674a+4+2*imm;eq('branch reaches shared store',target,0x08016162)
# Both paths then set byte zero of the SAME r7-relative base to six.
eq('join state value',mov(0x08016166),(3,6));h=half(0x0801616a);eq('join immediate STRB opcode',h&0xf800,0x7000);eq('join strb operand tuple',((h>>6)&31,(h>>3)&7,h&7),(0,7,3))
for a,n in [(0x0801615e,16),(0x08016740,12),(0x080161f4,4),(0x080167a0,4),(0x08016808,4)]:sites.append({'address':hex(a),'bytes':b[a-BASE:a-BASE+n].hex()})
r={'result':'PASS','image_sha256':hashlib.sha256(b).hexdigest(),'checks':checks,'byte_sites':sites,'paths':{'A':['r2=0','r3=0x1c08','M8[r7+r3]=r2','M8[r7+0]=6'],'B':['r3=0','r2=0x1c08','M8[r7+r2]=r3','r2=1','r3=0x378e','B 0x08016162','M8[r7+r3]=r2','M8[r7+0]=6']},'scope':'Conditional local path semantics only. Incoming r7 identity, upstream branch conditions and physical meaning remain unresolved. A consumer address alone cannot identify its field offset.'}
(HERE/'JOIN_STORE_PATHS.json').write_text(json.dumps(r,ensure_ascii=False,indent=2)+'\n');print('PASS',len(checks),'raw-byte assertions; two offset-dependent paths to shared store')
