from pathlib import Path
import json,re,struct,hashlib
O=Path(__file__).resolve().parents[1];sha=lambda b:hashlib.sha256(b).hexdigest()
i=json.loads((O/'INPUTS.json').read_text());b=Path(i['path']).read_bytes();base=0x08010000
assert len(b)==i['bytes'] and sha(b)==i['sha256']
rows={};bl={};files=[]
for folder in ['callbacks','helpers','ranges','reference/platform']:
 for f in sorted((O/folder).glob('*.txt')):
  count=0
  for l in f.read_text().splitlines():
   m=re.match(r'^([0-9a-f]{8}) ([0-9a-f]+) (.+)$',l)
   if not m:continue
   a=int(m[1],16);raw=bytes.fromhex(m[2]);assert b[a-base:a-base+len(raw)]==raw,(f,a)
   rows[a]=raw;count+=1
   branch=re.match(r'bl 0x([0-9a-f]+)$',m[3])
   if branch:
    h1,h2=struct.unpack('<HH',raw);s=(h1>>10)&1;j1=(h2>>13)&1;j2=(h2>>11)&1
    off=(s<<24)|((1^(j1^s))<<23)|((1^(j2^s))<<22)|((h1&1023)<<12)|((h2&2047)<<1)
    if off&(1<<24):off-=1<<25
    target=a+4+off;assert target==int(branch[1],16),(a,target,branch[1]);bl[a]=target
  files.append({'path':str(f.relative_to(O)),'sha256':sha(f.read_bytes()),'instruction_rows':count})
source_index=json.loads((O/'SOURCE_INDEX.json').read_text())
for x in source_index:
 assert sha(Path(x['path']).read_bytes())==x['sha256'];assert sha((O/x['retained']).read_bytes())==x['sha256']
G=0x2000aa30;F=[G+0x1558+k*0xe0+0xa2 for k in range(5)];regions=json.loads((O/'OBJECT_REGIONS.json').read_text())
for r in regions['normal_initialization_or_snapshot_regions']:
 assert not any(int(r['start'],16)<=a<int(r['end_exclusive'],16) for a in F)
assert G+0x1164+6*0xa8==0x2000bf84 and G+0x1558==0x2000bf88
assert G+0x1558+5*0xe0==0x2000c3e8
# Anchor immediate bytes from original independently of pseudo-C argument prototypes.
anchors={0x08023dd2:'4422',0x08023fbc:'a822',0x0802403a:'5022'}
for a,h in anchors.items():assert b[a-base:a-base+len(h)//2].hex()==h
r={'status':'PASS','original_sha256':sha(b),'export_files':len(files),'instruction_rows_including_overlap':sum(x['instruction_rows'] for x in files),'unique_instruction_addresses':len(rows),'unique_instruction_bytes':sum(map(len,rows.values())),'independently_decoded_unique_bl_targets':len(bl),'unchanged_retained_sources':len(source_index),'object_regions_checked':len(regions['normal_initialization_or_snapshot_regions']),'bag_fault_bytes':[f'{a:08x}' for a in F],'immediate_length_anchors':{f'{a:08x}':h for a,h in anchors.items()},'limits':['No firmware execution or real device observations.','Original-byte equality does not prove all semantic interpretations.','Interval assertions cover the selected normal constructor arguments, not arbitrary pointers or all interrupt callbacks.'],'files':files,'bl_targets':[{'site':f'{a:08x}','target':f'{t:08x}'} for a,t in sorted(bl.items())]}
(O/'VERIFICATION.json').write_text(json.dumps(r,ensure_ascii=False,indent=2)+'\n')
print(json.dumps({k:v for k,v in r.items() if k not in ['files','bl_targets']},ensure_ascii=False,indent=2))
