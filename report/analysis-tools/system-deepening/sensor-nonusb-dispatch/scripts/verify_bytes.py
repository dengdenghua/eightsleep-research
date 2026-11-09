"""Compare retained instruction bytes/literals/branches to original nonUSB BBIN only."""
from pathlib import Path
import argparse,hashlib,json,re
B=Path(__file__).resolve().parents[1]
p=argparse.ArgumentParser();p.add_argument('--research-root',type=Path,default=B.parents[2]);args=p.parse_args()
source=args.research_root/'mediatek/rootfs-selected/opt/eight/lib/subsystem_updates/firmware-sensor-g0.bbin'
data=source.read_bytes();sha=hashlib.sha256(data).hexdigest();assert sha=='51531576fd31af96f7239b71d26e1f175815f5cb21dbe9ab305fa9a33cc6a891'
base=0x8008000
# Early tentative linear decode crossed embedded tables. Preserve output but never count those data bytes as code.
excluded=[(0x8017132,0x8017138,'special jump table 5 bytes plus padding'),(0x80171a4,0x80171f8,'main signed16 jump table'),(0x801720a,0x801721c,'extended signed16 jump table')]
def bl(a,raw):
 h1=int.from_bytes(raw[:2],'little');h2=int.from_bytes(raw[2:],'little');assert h1&0xf800==0xf000 and h2&0xd000==0xd000
 s=h1>>10&1;i1=1^((h2>>13&1)^s);i2=1^((h2>>11&1)^s)
 n=(s<<24)|(i1<<23)|(i2<<22)|((h1&1023)<<12)|((h2&2047)<<1)
 if s:n-=1<<25
 return (a+4+n)&0xffffffff
def signed(n,width):return n-(1<<width) if n&(1<<(width-1)) else n
files=[];seen={};newseen={};excludedrows=[];totals={'instruction_rows':0,'instruction_bytes':0,'flash_literals':0,'bl_targets':0,'direct_branch_targets':0}
for path in sorted(list(B.glob('pass*/*.txt'))+list((B/'baseline').glob('*.txt'))):
 counts=dict.fromkeys(totals,0)
 for line in path.read_text().splitlines():
  m=re.match(r'INSN ([0-9a-f]{8}) ([0-9a-f]+) (.*)',line)
  if not m:continue
  a=int(m[1],16);raw=bytes.fromhex(m[2]);asm=m[3];off=a-base
  assert 0<=off<=len(data)-len(raw) and data[off:off+len(raw)]==raw,(str(path),hex(a),'bytes')
  bad=next((why for lo,hi,why in excluded if lo<=a<hi),None)
  if bad:excludedrows.append({'file':str(path.relative_to(B)),'address':hex(a),'raw_hex':raw.hex(),'reason':bad});continue
  if a in seen:assert seen[a]==raw
  seen[a]=raw
  if path.parent.name!='baseline':newseen[a]=raw
  counts['instruction_rows']+=1;counts['instruction_bytes']+=len(raw)
  m=re.match(r'bl 0x([0-9a-f]{8})\b',asm)
  if m:assert bl(a,raw)==int(m[1],16),(path.name,hex(a),'BL');counts['bl_targets']+=1
  m=re.match(r'(b|beq|bne|bcs|bcc|bmi|bpl|bvs|bvc|bhi|bls|bge|blt|bgt|ble) 0x([0-9a-f]{8})\b',asm)
  if m:
   h=int.from_bytes(raw,'little');assert len(raw)==2
   if m[1]=='b':assert h&0xf800==0xe000;dest=a+4+signed(h&0x7ff,11)*2
   else:assert h&0xf000==0xd000;dest=a+4+signed(h&255,8)*2
   assert dest==int(m[2],16),(path.name,hex(a),'B');counts['direct_branch_targets']+=1
  for addr,val in re.findall(r'REF\[READ:([0-9a-f]{8})=([0-9a-f]+)\]',asm):
   o=int(addr,16)-base
   if 0<=o<=len(data)-4:assert int.from_bytes(data[o:o+4],'little')==int(val,16);counts['flash_literals']+=1
 for k in totals:totals[k]+=counts[k]
 files.append({'path':str(path.relative_to(B)),'sha256':hashlib.sha256(path.read_bytes()).hexdigest(),'previous_baseline_copy':path.parent.name=='baseline',**counts})
report={'schema':'eightsleep.nonusb.dispatch-byte-validation.v1','status':'PASS','source':str(source),'sha256':sha,'bytes':len(data),'image_base':hex(base),'mapping':'file offset = VA - 0x08008000; 128-byte BBIN header already included','totals_including_baseline_and_overlap':totals,'unique_instruction_addresses':len(seen),'unique_instruction_bytes':sum(map(len,seen.values())),'new_exports_unique_addresses_including_previously_known_functions':len(newseen),'new_exports_unique_bytes':sum(map(len,newseen.values())),'excluded_data_rows':excludedrows,'files':files,'limits':['byte identity and branch arithmetic do not prove complete CFG or execution','baseline functions and repeated exports are not newly discovered functions','all table data remain independently preserved and decoded in DISPATCH_TABLES.json'],'executes_firmware':False}
(B/'BYTE_VALIDATION.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps({k:report[k] for k in ['status','unique_instruction_addresses','unique_instruction_bytes','new_exports_unique_addresses_including_previously_known_functions','new_exports_unique_bytes']}));print(json.dumps(totals))
