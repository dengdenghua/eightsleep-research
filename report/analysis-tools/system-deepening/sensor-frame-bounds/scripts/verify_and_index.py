#!/usr/bin/env python3
"""Offline original BBIN byte/literal/branch verification and reproducible evidence manifest."""
import hashlib,json,re,shlex
from pathlib import Path
O=Path(__file__).resolve().parent.parent
R=O.parents[2]
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def write(n,v):(O/n).write_text(json.dumps(v,ensure_ascii=False,indent=2)+'\n')
def branch32(a,raw,m):
 h1,h2=int.from_bytes(raw[:2],'little'),int.from_bytes(raw[2:],'little')
 assert h1&0xf800==0xf000 and h2&0xd000==(0xd000 if m=='bl' else 0x9000)
 s=h1>>10&1;i1=1^((h2>>13&1)^s);i2=1^((h2>>11&1)^s)
 d=s<<24|i1<<23|i2<<22|(h1&1023)<<12|(h2&2047)<<1
 return (a+4+d-(1<<25 if s else 0))&0xffffffff

def main():
 inp=json.loads((O/'INPUTS.json').read_text());src=R/inp['source'];data=src.read_bytes();base=int(inp['mapping_base'],16)
 assert sha(src)==inp['sha256'] and len(data)==inp['size']
 totals=dict(instruction_occurrences=0,instruction_bytes=0,flash_literals=0,bl_bw_targets=0);seen={};files=[]
 for p in sorted(O.glob('pass*/*.txt')):
  n=0
  for line in p.read_text().splitlines():
   m=re.match(r'INSN ([0-9a-f]{8}) ([0-9a-f]+) (.*)',line)
   if not m:continue
   a=int(m[1],16);raw=bytes.fromhex(m[2]);asm=m[3];off=a-base
   assert 0<=off<=len(data)-len(raw) and data[off:off+len(raw)]==raw,(str(p),hex(a))
   if a in seen:assert seen[a]==raw
   seen[a]=raw;n+=1;totals['instruction_occurrences']+=1;totals['instruction_bytes']+=len(raw)
   b=re.match(r'(bl|b\.w) 0x([0-9a-f]{8})\b',asm)
   if b:
    assert branch32(a,raw,b[1])==int(b[2],16),(str(p),hex(a),'branch')
    totals['bl_bw_targets']+=1
   for aa,v in re.findall(r'REF\[READ:([0-9a-f]{8})=([0-9a-f]+)\]',asm):
    x=int(aa,16)-base
    if 0<=x<=len(data)-4:
     assert int.from_bytes(data[x:x+4],'little')==int(v,16),(str(p),hex(a),'literal')
     totals['flash_literals']+=1
  files.append({'path':str(p.relative_to(O)),'instruction_count':n,'sha256':sha(p)})
 pointer_scan={}
 for a in (0x0801c765,0x0801c8c9,0x080292a1,0x0801d595):
  raw=a.to_bytes(4,'little');hits=[];offset=0
  while True:
   x=data.find(raw,offset)
   if x<0:break
   hits.append({'file_offset':x,'mapped_va':hex(base+x)});offset=x+1
  pointer_scan[hex(a)]=hits
 write('RAW_FACTS.json',{'source_sha256':inp['sha256'],'header_mapping':'full BBIN, fileoffset=VA-0x08010000; no second128 adjustment',
   'timestamp_format':{'va':'0x0802e093','file_offset':0x1e093,'hex':data[0x1e093:0x1e098].hex(),'ascii':data[0x1e093:0x1e097].decode('ascii')},
   'exact_thumb_pointer_word_scan':pointer_scan,'scan_limit':'Only exact little-endian full pointer values in original BBIN; does NOT exclude computed or indirectly initialized callbacks.'})
 write('BYTE_VALIDATION.json',{'status':'PASS','source':inp['source'],'sha256':inp['sha256'],'mapping_base':inp['mapping_base'],'totals':totals,
   'unique_instruction_addresses':len(seen),'unique_instruction_bytes':sum(map(len,seen.values())),'files':files,
   'limits':'Byte identity, decoded direct BL/B.W and flash literals only; not firmware execution, complete control flow or proof of actual inputs. Overlapping exports counted separately.'})
 jobs=json.loads((O/'JOBS.json').read_text());assert len(jobs)==7
 for row in jobs:
  assert row['status']=='completed_exit_0'
  log=(O/(row['pass']+'.log')).read_text();assert 'REPORT: Execute script: ExportSensorFrameBounds.java ' in log and 'REPORT SCRIPT ERROR' not in log
 commands=json.loads((O/'COMMANDS.json').read_text())
 lines=['Static reproduction only; target firmware is not run.','JAVA_HOME=/opt/homebrew/opt/openjdk@21/libexec/openjdk.jdk/Contents/Home','']
 for row in commands:
  lines.append(shlex.join(row['args']))
 lines += ['','python3 '+shlex.quote(str(O/'scripts/build_bounds.py')),'python3 '+shlex.quote(str(O/'scripts/model_frame_bounds.py')),'python3 '+shlex.quote(str(O/'scripts/verify_and_index.py'))]
 (O/'REPRODUCE.txt').write_text('\n'.join(lines)+'\n')
 ev=json.loads((O/'EVIDENCE_MAP.json').read_text())
 for row in ev['rows']:
  lines=(O/row['path']).read_text().splitlines()
  for a in row['anchors']:assert lines[a['line']-1].startswith('INSN '+a['va'][2:]+' ')
 records=[]
 for p in sorted(O.rglob('*')):
  if p.is_file() and p.name!='SOURCE_MANIFEST.json' and '__pycache__' not in p.parts:
   records.append({'root':'sensor-frame-bounds','path':str(p.relative_to(O)),'size':p.stat().st_size,'sha256':sha(p),'kind':'derived_analysis'})
 for rel in [inp['source']]+inp['prior_evidence']:
  p=R/rel;records.append({'root':'research','path':rel,'size':p.stat().st_size,'sha256':sha(p),'kind':'original_BBIN' if p==src else 'prior_readonly_evidence'})
 write('SOURCE_MANIFEST.json',{'self_hash_excluded':True,'files':records})
 print(json.dumps({'status':'PASS',**totals,'unique_instruction_addresses':len(seen),'unique_instruction_bytes':sum(map(len,seen.values())),'manifest_records':len(records)}))
if __name__=='__main__':main()
