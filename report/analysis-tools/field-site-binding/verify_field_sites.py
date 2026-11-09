#!/usr/bin/env python3
"""Check supported local accesses against bytes, independently of the producer."""
from pathlib import Path
import json,hashlib,collections,struct
HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[2];DEEP=ROOT/'report/analysis-tools/system-deepening';d=json.loads((HERE/'FIELD_SITE_AUDIT.json').read_text());images={}
for i in d['images']:
 b=(ROOT/i['path']).read_bytes();assert hashlib.sha256(b).hexdigest()==i['sha256'];images[i['name']]=(b,int(i['base'],16))
for s in d['sources']:assert hashlib.sha256((DEEP/s['path']).read_bytes()).hexdigest()==s['sha256']
assert len(d['records'])==2609
checked=0
for x in d['records']:
 for name,result in x['images'].items():
  if result['status']=='unbound_or_mismatching_site':continue
  b,base=images[name];la=int(x['literal_load'],16);ua=int(x['consumer'],16);pa=int(x['literal_address'],16)
  lh=struct.unpack_from('<H',b,la-base)[0];uh=struct.unpack_from('<H',b,ua-base)[0];value=struct.unpack_from('<I',b,pa-base)[0]
  assert lh>>11==9 # Thumb-1 LDR literal
  assert ua>=la+2 and (ua-la)%2==0 and uh>>12==5
  assert (la+4)//4*4+4*(lh%256)==pa
  assert value==int(x['offset'],16)
  assert 'r'+str((lh//256)%8)==x['offset_reg']=='r'+str((uh//64)%8)
  assert 'r'+str((uh//8)%8)==x['textual_base_reg']
  assert b[la-base:la-base+2].hex()==x['exported_load_bytes']
  assert b[ua-base:ua-base+2].hex()==x['exported_consumer_bytes']
  if result['status']=='exact_adjacent_access':assert ua==la+2
  checked+=1
for name in images:assert dict(collections.Counter(x['images'][name]['status'] for x in d['records']))==d['counts'][name]
adj={tuple(x[k] for k in ['literal_load','consumer','offset']) for x in d['records'] if x['images']['g0']['status']=='exact_adjacent_access'};assert len(adj)==138
assert len({tuple(x[k] for k in ['literal_load','consumer','offset']) for x in d['records']})==589
focus=d['focus_holes']['0234..0258']['records'];claimed=[x for x in focus if x['historical_object_heuristic']];assert len(claimed)==2 and len({(x['literal_load'],x['consumer']) for x in claimed})==1 and all(x['images']['g0']['status']=='unbound_or_mismatching_site' for x in claimed)
result={'result':'PASS','candidate_records':2609,'export_file_hashes':len(d['sources']),'image_hashes':len(images),'supported_image_site_pairs_checked':checked,'unique_candidate_triples':589,'g0_adjacent_unique_triples':138,'duplicated_0234_witnesses_not_g0_confirmed':True,'scope':'Byte/opcode consistency and accounting, not main-object pointer identity.','audit_sha256':hashlib.sha256((HERE/'FIELD_SITE_AUDIT.json').read_bytes()).hexdigest()}
(HERE/'VERIFICATION.json').write_text(json.dumps(result,ensure_ascii=False,indent=2)+'\n');print(json.dumps(result,ensure_ascii=False))
