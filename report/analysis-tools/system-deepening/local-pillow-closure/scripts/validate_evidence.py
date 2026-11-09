#!/usr/bin/env python3
import json,struct,re,hashlib
from pathlib import Path
O=Path(__file__).resolve().parents[1];R=O.parents[2]
def sha(b):return hashlib.sha256(b).hexdigest()
def put(p,x):(O/p).write_text(json.dumps(x,ensure_ascii=False,indent=2)+'\n')
def bl(a,b):
 h1,h2=struct.unpack('<HH',b);s=h1>>10&1;i1=1^((h2>>13&1)^s);i2=1^((h2>>11&1)^s);n=s<<24|i1<<23|i2<<22|(h1&1023)<<12|(h2&2047)<<1;return (a+4+n-(1<<25 if s else 0))&0xffffffff
results=[]
for fam,rel,base,expected in [('pillow','mediatek/rootfs-selected/opt/eight/lib/subsystem_updates/firmware-pillow.bbin',0x08008000,'1344d170a6c74f0aa0e38195b89d687ea9f69105980db0a83ddb5e3ee68661d1'),('host','mediatek/rootfs-selected/opt/eight/bin/frankenfirmware',0x100000,'84727b57ef8b226c78618f9fa9257df7d8ae771c78d8a51e6f3cabf0acc0c375')]:
 b=(R/rel).read_bytes();assert sha(b)==expected;loads=[]
 if fam=='host':
  h=struct.unpack_from('<16sHHIQQQIHHHHHH',b);loads=[x for i in range(h[10]) if (x:=struct.unpack_from('<IIQQQQQQ',b,h[5]+i*h[9]))[0]==1]
 def at(a,n):
  v=a-base
  if not loads:assert 0<=v<=len(b)-n;return v
  for x in loads:
   if x[3]<=v and v+n<=x[3]+x[5]:return x[2]+v-x[3]
  raise AssertionError(hex(a))
 files=sorted(O.glob('host-pass*/*.txt')) if fam=='host' else sorted(O.glob('pass*/*.txt'))+sorted((O/'before-repair').glob('*.txt'))
 seen={};occ=branches=lits=0
 for p in files:
  for line in p.read_text().splitlines():
   m=re.match(r'INSN ([0-9a-f]{8}) ([0-9a-f]+) (.*)',line)
   if not m:continue
   a=int(m[1],16);bb=bytes.fromhex(m[2]);assert b[at(a,len(bb)):at(a,len(bb))+len(bb)]==bb,(p,hex(a));assert a not in seen or seen[a]==bb;seen[a]=bb;occ+=1
   m2=re.match(r'(bl|b) 0x([0-9a-f]{8})\b',m[3])
   if m2 and fam=='host':
    w=int.from_bytes(bb,'little');n=w&0x3ffffff;n-=1<<26 if n&1<<25 else 0;assert a+4*n==int(m2[2],16);branches+=1
   elif m2 and fam=='pillow' and m2[1]=='bl':assert bl(a,bb)==int(m2[2],16);branches+=1
   if fam=='pillow':
    for aa,v in re.findall(r'REF\[READ:([0-9a-f]{8})=([0-9a-f]+)\]',m[3]):
     aa=int(aa,16)
     if base<=aa<=base+len(b)-4:assert int.from_bytes(b[aa-base:aa-base+4],'little')==int(v,16);lits+=1
 results.append({'family':fam,'input':rel,'sha256':expected,'instruction_occurrences':occ,'unique_instructions':len(seen),'unique_bytes':sum(map(len,seen.values())),'branch_targets':branches,'literal_checks':lits,'status':'PASS'})
 if fam=='pillow':
  tables=[]
  for a,n,label in [(0x08008000,128,'BBINheader'),(0x08008080,64,'vectors'),(0x0801c030,24,'requested_rate_selection'),(0x0801da6c,112,'seven_alarm_descriptors'),(0x0801db60,28,'alarm_descriptor_pointer_order'),(0x08017330,28,'startup_copy_clear_literals'),(0x0801dc4c,0x420,'initialized_data_flash_source')]:
   bb=b[a-base:a-base+n];tables.append({'label':label,'va':hex(a),'file_offset':a-base,'bytes_hex':bb.hex()})
  put('RAW_TABLES.json',{'pillow_tables':tables,'initialized_data_mapping':'startup copies 0x0801dc4c..0x0801e06c to0x20000200..0x20000620. Static initial bytes only, not runtime RAM.'})
put('BYTE_VALIDATION.json',{'status':'PASS','inputs':results,'limits':'Original instruction identity, direct branch checks and file-backed literals; no firmware execution or physical cadence proof.'});print(json.dumps(results))
