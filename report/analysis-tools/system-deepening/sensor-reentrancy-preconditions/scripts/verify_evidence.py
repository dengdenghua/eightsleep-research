#!/usr/bin/env python3
"""Verify retained disassembly bytes against the original shipped BBIN."""
from pathlib import Path
import hashlib,json,re,struct
O=Path(__file__).resolve().parents[1];R=O.parents[2]
SRC=R/'mediatek/rootfs-selected/opt/eight/lib/subsystem_updates/firmware-sensor-g0-usb.bbin'
EXPECTED='1a125674542934f36266f88d9f8ca378a6a5ca696d9e58305d1b0e533f795563';BASE=0x08010000
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def write(p,v):p.write_text(json.dumps(v,ensure_ascii=False,indent=2)+'\n')
def branch32(a,raw):
 h1,h2=struct.unpack('<HH',raw);s=h1>>10&1;i1=1^((h2>>13&1)^s);i2=1^((h2>>11&1)^s)
 d=(s<<24)|(i1<<23)|(i2<<22)|((h1&1023)<<12)|((h2&2047)<<1)
 return (a+4+d-(1<<25 if s else 0))&0xffffffff
def main():
 data=SRC.read_bytes();assert sha(SRC)==EXPECTED and len(data)==140828
 seen={};files=[];count=total=literal=branches=0
 for f in sorted((O/'source').glob('*.txt')):
  anchors=[]
  for i,line in enumerate(f.read_text().splitlines(),1):
   m=re.match(r'INSN ([0-9a-f]{8}) ([0-9a-f]+) (.*)',line)
   if not m:continue
   va=int(m[1],16);raw=bytes.fromhex(m[2]);asm=m[3];off=va-BASE
   assert 0<=off<=len(data)-len(raw) and data[off:off+len(raw)]==raw,(f.name,hex(va))
   assert va not in seen or seen[va]==raw
   seen[va]=raw;count+=1;total+=len(raw);anchors.append({'line':i,'va':hex(va),'bytes':len(raw)})
   b=re.match(r'(bl|b\.w) 0x([0-9a-f]{8})\b',asm)
   if b:assert branch32(va,raw)==int(b[2],16);branches+=1
   for addr,value in re.findall(r'REF\[READ:([0-9a-f]{8})=([0-9a-f]+)\]',asm):
    x=int(addr,16)-BASE
    if 0<=x<=len(data)-4:
     assert int.from_bytes(data[x:x+4],'little')==int(value,16),(f.name,hex(va),'literal');literal+=1
  files.append({'path':str(f.relative_to(O)),'sha256':sha(f),'instruction_anchors':anchors})
 write(O/'EVIDENCE_MAP.json',{'kind':'local retained evidence, not REA server evidence IDs','files':files})
 write(O/'BYTE_VALIDATION.json',{'status':'PASS','original':str(SRC),'sha256':EXPECTED,'bytes':len(data),
  'mapping':'full BBIN at VA 0x08010000; offset=VA-base; 128-byte header remains included',
  'instruction_occurrences':count,'instruction_bytes':total,'unique_addresses':len(seen),
  'unique_bytes':sum(map(len,seen.values())),'flash_literals_checked':literal,'direct_bl_bw_checked':branches,
  'scope':'bytes of retained decoded contexts; not whole firmware reachability or execution'})
 write(O/'RAW_STRINGS.json',{'source_sha256':EXPECTED,'strings':[{'va':hex(a),'file_offset':a-BASE,
  'text':data[a-BASE:data.index(0,a-BASE)].decode('ascii')} for a in [0x0802ef89,0x0803016f,0x08030fa3]]})
 for e in json.loads((O/'REUSED_SOURCES.json').read_text()):assert sha(O/e['retained'])==e['sha256']
 assert json.loads((O/'MODEL_RESULTS.json').read_text())['status']=='PASS'
 records=[{'path':str(f.relative_to(O)),'bytes':f.stat().st_size,'sha256':sha(f)} for f in sorted(O.rglob('*'))
  if f.is_file() and f.name!='SOURCE_MANIFEST.json' and '__pycache__' not in f.parts]
 write(O/'SOURCE_MANIFEST.json',{'self_excluded':True,'original':{'path':str(SRC),'bytes':len(data),'sha256':EXPECTED},'files':records})
 print(json.dumps({'status':'PASS','occurrences':count,'unique_instructions':len(seen),'unique_bytes':sum(map(len,seen.values())),
  'literal_reads':literal,'direct_branches':branches,'manifest_files':len(records)}))
if __name__=='__main__':main()
