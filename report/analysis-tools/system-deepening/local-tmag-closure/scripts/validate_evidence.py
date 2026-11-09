#!/usr/bin/env python3
import json,struct,re,hashlib
from pathlib import Path
O=Path(__file__).resolve().parents[1];R=O.parents[2]
def sha(b):return hashlib.sha256(b).hexdigest()
def put(p,x):(O/p).write_text(json.dumps(x,ensure_ascii=False,indent=2)+'\n')
def bl(a,b):
 h1,h2=struct.unpack('<HH',b);s=h1>>10&1;i1=1^((h2>>13&1)^s);i2=1^((h2>>11&1)^s);n=s<<24|i1<<23|i2<<22|(h1&1023)<<12|(h2&2047)<<1;return (a+4+n-(1<<25 if s else 0))&0xffffffff
results=[]
for fam,rel,base,expected in [('usb','mediatek/rootfs-selected/opt/eight/lib/subsystem_updates/firmware-sensor-g0-usb.bbin',0x08010000,'1a125674542934f36266f88d9f8ca378a6a5ca696d9e58305d1b0e533f795563'),('host','mediatek/rootfs-selected/opt/eight/bin/frankenfirmware',0x100000,'84727b57ef8b226c78618f9fa9257df7d8ae771c78d8a51e6f3cabf0acc0c375')]:
 b=(R/rel).read_bytes();assert sha(b)==expected;loads=[]
 if fam=='host':
  h=struct.unpack_from('<16sHHIQQQIHHHHHH',b);loads=[x for i in range(h[10]) if (x:=struct.unpack_from('<IIQQQQQQ',b,h[5]+i*h[9]))[0]==1]
 def at(a,n):
  v=a-base
  if not loads:assert 0<=v<=len(b)-n;return v
  for x in loads:
   if x[3]<=v and v+n<=x[3]+x[5]:return x[2]+v-x[3]
  raise AssertionError(hex(a))
 files=(sorted(O.glob('host-pass*/*.txt'))+[O/'source'/n for n in ['usb-host-event.txt','logger-dispatch.txt','logger-cbor-selection.txt']]) if fam=='host' else sorted(O.glob('pass*/*.txt'))+[O/'source'/n for n in ['usb-main.txt','usb-init.txt']]
 seen={};occ=branches=lits=0
 for p in files:
  for line in p.read_text().splitlines():
   m=re.match(r'INSN ([0-9a-f]{8}) ([0-9a-f]+) (.*)',line)
   if not m:continue
   a=int(m[1],16);bb=bytes.fromhex(m[2]);assert b[at(a,len(bb)):at(a,len(bb))+len(bb)]==bb,(p,hex(a));assert a not in seen or seen[a]==bb;seen[a]=bb;occ+=1
   m2=re.match(r'(bl|b) 0x([0-9a-f]{8})\b',m[3])
   if m2 and fam=='host':
    w=int.from_bytes(bb,'little');n=w&0x3ffffff;n-=1<<26 if n&1<<25 else 0;assert a+4*n==int(m2[2],16);branches+=1
   elif m2 and fam=='usb' and m2[1]=='bl':assert bl(a,bb)==int(m2[2],16);branches+=1
   if fam=='usb':
    for aa,v in re.findall(r'REF\[READ:([0-9a-f]{8})=([0-9a-f]+)\]',m[3]):
     aa=int(aa,16)
     if base<=aa<=base+len(b)-4:assert int.from_bytes(b[aa-base:aa-base+4],'little')==int(v,16);lits+=1
 results.append({'family':fam,'input':rel,'sha256':expected,'instruction_occurrences':occ,'unique_instructions':len(seen),'unique_bytes':sum(map(len,seen.values())),'branch_targets':branches,'literal_checks':lits,'status':'PASS'})
 if fam=='usb':
  tables=[]
  for a,n,label in [(0x08031b50,9,'sensor_id_table'),(0x08031b5c,16,'range_float_table'),(0x08031b6b,4,'fallback_i2c_addresses'),(0x0802df74,3,'device_identity_pattern')]:
   bb=b[a-base:a-base+n];tables.append({'label':label,'va':hex(a),'file_offset':a-base,'bytes_hex':bb.hex()})
  put('RAW_TABLES.json',{'usb_tables':tables,'scope':'File-backed original bytes. Firmware names and ranges do not prove actual board wiring or physical units.'})
put('BYTE_VALIDATION.json',{'status':'PASS','inputs':results,'limits':'Original instruction identity, direct branch checks and file-backed literals; no firmware execution or physical cadence proof.'});print(json.dumps(results))
