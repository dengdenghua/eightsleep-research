# Bounded interpreter derived from temperature-cache/verify_cache.py.
# Extension: SXTH, f32 multiply and f32/f64 conversion + f64 arithmetic summaries.
# Integer conversion and float comparison routines are interpreted from g0 bytes.
#!/usr/bin/env python3
"""Bounded Thumb interpretation of queue setter/getter and compiled float
comparisons; summarize memcpy, unsigned division and selected IEEE float/double operations.
No target execution or device/network access.
"""
from pathlib import Path
import json,struct,hashlib,math,random
from capstone import *
from capstone.arm import *
HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[2];p=ROOT/'materials/eightsleep-full-evidence-20261107/firmware/mtk/rootfs/files/opt/eight/lib/subsystem_updates/firmware-sensor-g0.bbin';b=p.read_bytes();B=0x08008000;CBASE=0x20020000;QBASE=0x20040000
assert hashlib.sha256(b).hexdigest()=='51531576fd31af96f7239b71d26e1f175815f5cb21dbe9ab305fa9a33cc6a891'
m=Cs(CS_ARCH_ARM,CS_MODE_THUMB|CS_MODE_MCLASS);m.detail=True;cache={}
def bits(x):return struct.unpack('<I',struct.pack('<f',x))[0]
def flt(x):return struct.unpack('<f',struct.pack('<I',x))[0]
def f32(x):return flt(bits(x))
def regid(r):
 n=m.reg_name(r)
 return {'sp':13,'lr':14,'pc':15}.get(n,int(n[1:]) if n.startswith('r') else -1)
def signed(x):return x-0x100000000 if x&0x80000000 else x
class CPU:
 def __init__(self):self.mem={};self.calls=[];self.total_steps=0
 def put(self,a,v,n=4):
  for k in range(n):self.mem[(a+k)&0xffffffff]=(v>>(8*k))&255
 def get(self,a,n=4):
  if B<=a and a+n<=B+len(b):return int.from_bytes(b[a-B:a-B+n],'little')
  return sum(self.mem.get((a+k)&0xffffffff,0)<<(8*k) for k in range(n))
 def run(self,entry,args,initial_regs=None):
  R=[0]*16;R[:len(args)]=args;R[13]=0x20080000;R[14]=0x0fff0001;pc=entry;N=Z=CF=V=False;tr=[]
  for k,v in (initial_regs or {}).items():R[k]=v
  def setnz(v):return bool(v&0x80000000),v==0
  def arith(a,z,sub=False):
   nonlocal N,Z,CF,V
   wide=a-z if sub else a+z;res=wide&0xffffffff;N,Z=setnz(res);CF=a>=z if sub else wide>0xffffffff;V=bool(((a^z)&(a^res) if sub else (~(a^z)&(a^res)))&0x80000000);return res
  for step in range(25000):
   if pc in [0x0fff0000,0x080175b8]:self.total_steps+=step;return R[0]
   if pc not in cache:cache[pc]=next(m.disasm(b[pc-B:pc-B+4],pc,1),None)
   i=cache[pc];assert i is not None,hex(pc);op=i.operands;name=i.mnemonic;nxt=pc+i.size
   def val(o):return R[regid(o.reg)] if o.type==ARM_OP_REG else o.imm
   def addr(o):return (((pc+4)&~3) if o.mem.base==ARM_REG_PC else R[regid(o.mem.base)])+(R[regid(o.mem.index)] if o.mem.index else 0)+o.mem.disp
   if name in ['mov','movs']:
    x=val(op[1])&0xffffffff;R[regid(op[0].reg)]=x
    if name=='movs':N,Z=setnz(x)
   elif name in ['add','adds','subs','adcs','sbcs','rsbs']:
    rd=regid(op[0].reg)
    if name=='rsbs':a=val(op[2]);z=val(op[1]);res=arith(a,z,True)
    else:
     a=R[rd] if len(op)==2 else val(op[1]);z=val(op[-1])
     if name=='adcs':z+=int(CF)
     if name=='sbcs':z+=int(not CF)
     res=arith(a,z,name in ['subs','sbcs']) if name!='add' else (a+z)&0xffffffff
    R[rd]=res
   elif name=='cmp':arith(val(op[0]),val(op[1]),True)
   elif name in ['ands','orrs','bics','eors','mvns']:
    rd=regid(op[0].reg);a=R[rd];z=val(op[-1]);x={'ands':a&z,'orrs':a|z,'bics':a&~z,'eors':a^z,'mvns':~z}[name]&0xffffffff;R[rd]=x;N,Z=setnz(x)
   elif name in ['lsls','lsrs','asrs']:
    rd=regid(op[0].reg);a=R[rd] if len(op)==2 else val(op[1]);shift=val(op[-1]);shift=shift&255 if op[-1].type==ARM_OP_REG else shift
    if shift:
     if name=='lsls':CF=bool((a>>(32-shift))&1) if shift<=32 else False;x=(a<<shift)&0xffffffff
     elif name=='lsrs':CF=bool((a>>(shift-1))&1) if shift<=32 else False;x=a>>shift
     else:CF=bool((a>>(shift-1))&1) if shift<32 else bool(a&0x80000000);x=(signed(a)>>min(shift,32))&0xffffffff
    else:x=a
    R[rd]=x;N,Z=setnz(x)
   elif name in ['muls','mul']:rd=regid(op[0].reg);R[rd]=((R[rd] if len(op)==2 else val(op[1]))*val(op[-1]))&0xffffffff;N,Z=setnz(R[rd])
   elif name in ['uxtb','uxth','sxth']:
    x=val(op[1])&(255 if name=='uxtb' else 65535);R[regid(op[0].reg)]=(x-65536 if name=='sxth' and x&32768 else x)&0xffffffff
   elif name in ['ldr','ldrb','ldrh']:R[regid(op[0].reg)]=self.get(addr(op[1]),{'ldr':4,'ldrb':1,'ldrh':2}[name])
   elif name in ['str','strb','strh']:self.put(addr(op[1]),val(op[0]),{'str':4,'strb':1,'strh':2}[name])
   elif name=='push':
    rs=sorted(regid(o.reg) for o in op);R[13]-=4*len(rs)
    for k,r in enumerate(rs):self.put(R[13]+4*k,R[r])
   elif name=='pop':
    rs=sorted(regid(o.reg) for o in op)
    for k,r in enumerate(rs):
     x=self.get(R[13]+4*k)
     if r==15:nxt=x&~1
     else:R[r]=x
    R[13]+=4*len(rs)
   elif name=='sub':rd=regid(op[0].reg);R[rd]=(R[rd]-val(op[1]))&0xffffffff
   elif name=='bx':nxt=val(op[0])&~1
   elif name in ['b','beq','bne','bhs','blo','bhi','bls','bge','blt','bgt','ble','bmi','bpl']:
    take={'b':True,'beq':Z,'bne':not Z,'bhs':CF,'blo':not CF,'bhi':CF and not Z,'bls':not CF or Z,'bge':N==V,'blt':N!=V,'bgt':not Z and N==V,'ble':Z or N!=V,'bmi':N,'bpl':not N}[name]
    if take:nxt=op[0].imm
   elif name=='bl':
    t=op[0].imm;self.calls.append(t)
    if t==0x08008280:
     assert R[1]!=0;R[0],R[1]=divmod(R[0],R[1])
    elif t==0x08020f94:
     buf=[self.get(R[1]+k,1) for k in range(R[2])]
     for k,x in enumerate(buf):self.put(R[0]+k,x,1)
    elif t in [0x080233f8,0x0802370c,0x08023ad8]:
     a,z=flt(R[0]),flt(R[1]);R[0]=bits(a+z if t==0x080233f8 else (a*z if t==0x08023ad8 else a/z))
    elif t==0x08012344:self.reply_status=R[0]
    elif t==0x08012314:
     if not hasattr(self,'reply_chunks'):self.reply_chunks=[]
     self.reply_chunks.append(bytes(self.get(R[0]+k,1) for k in range(R[1])))
    elif t==0x08020d7c:
     lo,hi=struct.unpack('<II',struct.pack('<d',flt(R[0])));R[0],R[1]=lo,hi
    elif t==0x08020e0c:R[0]=bits(struct.unpack('<d',struct.pack('<II',R[0],R[1]))[0])
    elif t in [0x080216c8,0x08021fe4,0x0801ff3c]:
     a=struct.unpack('<d',struct.pack('<II',R[0],R[1]))[0];z=struct.unpack('<d',struct.pack('<II',R[2],R[3]))[0];v=a+z if t==0x080216c8 else (a*z if t==0x08021fe4 else a/z);R[0],R[1]=struct.unpack('<II',struct.pack('<d',v))
    else:R[14]=nxt|1;nxt=t
   else:raise AssertionError(('unsupported',hex(pc),name,i.op_str))
   pc=nxt
  raise AssertionError('instruction budget')
