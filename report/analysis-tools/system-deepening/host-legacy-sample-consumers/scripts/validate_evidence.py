#!/usr/bin/env python3
"""Check retained instruction bytes against original inputs. Offline, no firmware execution."""
import hashlib,json,re,struct
from pathlib import Path
O=Path(__file__).resolve().parents[1]
R=O.parents[2]
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def put(p,x):(O/p).write_text(json.dumps(x,ensure_ascii=False,indent=2)+'\n')
def thumb_bl(a,b):
 h1,h2=struct.unpack('<HH',b);assert h1&0xf800==0xf000 and h2&0xd000==0xd000
 s=(h1>>10)&1;i1=1^(((h2>>13)&1)^s);i2=1^(((h2>>11)&1)^s)
 n=(s<<24)|(i1<<23)|(i2<<22)|((h1&1023)<<12)|((h2&2047)<<1)
 return (a+4+n-(1<<25 if s else 0))&0xffffffff
def main():
 inputs=json.loads((O/'INPUTS.json').read_text());results=[];elf=None;elfmap=None
 for inp in inputs:
  p=R/inp['path'];data=p.read_bytes();assert sha(p)==inp['sha256'] and len(data)==inp['size']
  base=int(inp['mapping_base'],16);loads=[]
  if inp['family']=='host':
   h=struct.unpack_from('<16sHHIQQQIHHHHHH',data);assert h[2]==183 and data[:6]==b'\x7fELF\x02\x01'
   loads=[s for i in range(h[10]) if (s:=struct.unpack_from('<IIQQQQQQ',data,h[5]+i*h[9]))[0]==1]
  def offset(a,n):
   va=a-base
   if not loads:
    assert 0<=va<=len(data)-n;return va
   for s in loads:
    if s[3]<=va and va+n<=s[3]+s[5]:return s[2]+va-s[3]
   raise AssertionError(('unbacked',hex(a),n))
  paths=sorted((O/'source'/inp['family']).glob('*.txt'))
  if inp['family']=='host':paths+=sorted(O.glob('pass*/*.txt'))
  seen={};occ=bl=lit=0;files=[]
  for f in paths:
   count=0
   for line in f.read_text().splitlines():
    m=re.match(r'INSN ([0-9a-f]{8}) ([0-9a-f]+) (.*)',line)
    if not m:continue
    a=int(m[1],16);b=bytes.fromhex(m[2]);at=offset(a,len(b))
    assert data[at:at+len(b)]==b,(str(f),hex(a));assert a not in seen or seen[a]==b
    seen[a]=b;occ+=1;count+=1
    if inp['family']!='host':
     branch=re.match(r'bl 0x([0-9a-f]{8})\b',m[3])
     if branch:assert thumb_bl(a,b)==int(branch[1],16);bl+=1
     for addr,value in re.findall(r'REF\[READ:([0-9a-f]{8})=([0-9a-f]+)\]',m[3]):
      v=int(addr,16)-base
      if 0<=v<=len(data)-4:assert int.from_bytes(data[v:v+4],'little')==int(value,16);lit+=1
    else:
     branch=re.match(r'(?:bl|b) 0x([0-9a-f]{8})\b',m[3])
     if branch:
      w=int.from_bytes(b,'little');assert w&0x7c000000==0x14000000
      n=w&0x3ffffff;n=n-(1<<26) if n&(1<<25) else n
      assert a+n*4==int(branch[1],16);bl+=1
   files.append({'path':str(f.relative_to(O)),'instruction_occurrences':count})
  results.append({'family':inp['family'],'status':'PASS','original_sha256':inp['sha256'],'instruction_occurrences':occ,'unique_instructions':len(seen),'unique_instruction_bytes':sum(map(len,seen.values())),'branch_target_occurrences':bl,'flash_literal_occurrences':lit,'files':files})
  if inp['family']=='host':
   elf=data
   # retain the concrete file mapping, not closure over later loop variables
   elfmap=offset
 reused=json.loads((O/'REUSED_SOURCES.json').read_text())
 for x in reused:assert sha(Path(x['original']))==x['sha256']==sha(O/x['retained'])
 tables=[]
 for a,expected in [(0x46b958,'lps'),(0x46b960,'pres'),(0x46afc0,'freq'),(0x46b7a0,'adc'),(0x46b038,'gain')]:
  at=elfmap(a,len(expected)+1);b=elf[at:at+len(expected)+1];assert b==expected.encode()+b'\0'
  tables.append({'ghidra_va':f'{a:08x}','elf_va':f'{a-0x100000:08x}','file_offset':at,'bytes_hex':b.hex(),'ascii':expected})
 a=0x46d5c8;at=elfmap(a,78);raw=elf[at:at+78];values=struct.unpack('<39h',raw);targets=[0x2098ac+n*4 for n in values]
 assert all(0x2097a0<=t<=0x20b3ff for t in targets)
 put('RAW_TABLES.json',{'strings':tables,'legacy_coroutine_switch':{'ghidra_va':f'{a:08x}','elf_va':f'{a-0x100000:08x}','file_offset':at,'raw_hex':raw.hex(),'signed16_times4_base':'002098ac','entries':39,'targets':[f'{t:08x}' for t in targets],'boundary':'used only for transient readOnly disassembly repair; original ELF and persistent project unchanged'}})
 put('BYTE_VALIDATION.json',{'status':'PASS','inputs':results,'retained_source_identity_checks':len(reused),'raw_string_checks':len(tables),'switch_table_entries':39,'limits':'Instruction byte identity with ELF PT_LOAD/BBIN linear mapping; direct B/BL targets and in-file Thumb literal values. Not firmware execution, runtime path selection or complete program recovery.'})
 print(json.dumps({'status':'PASS','families':[{k:v for k,v in r.items() if k!='files'} for r in results],'retained_sources':len(reused)}))
if __name__=='__main__':main()
