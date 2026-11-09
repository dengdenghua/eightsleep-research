#!/usr/bin/env python3
"""Read and independently check the produced attribution table, without imports from its producer."""
from pathlib import Path
import json,re,hashlib,collections,struct
HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[2];DEEP=ROOT/'report/analysis-tools/system-deepening'
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
d=json.loads((HERE/'FOREIGN_ATTRIBUTION.json').read_text());old=DEEP/'disasm-full-image'
original=json.loads((old/'EXPORT_IDENTITY.json').read_text());expected={x['export'] for x in original['export_files'] if x['cls']=='foreign'}
assert {x['export'] for x in d['records']}==expected and len(d['records'])==1461
assert collections.Counter(x['classification'] for x in d['records'])==d['counts']
images={i['path']:(ROOT/i['path']).read_bytes() for i in d['candidate_images']}
assert len(images)==9
for i in d['candidate_images']:assert hashlib.sha256(images[i['path']]).hexdigest()==i['sha256']
checked=0
for x in d['records']:
 p=DEEP/x['export'];assert sha(p)==x['export_sha256'];text=p.read_text(errors='replace');rows=[]
 for a,b in re.findall(r'^INSN ([0-9a-f]{8}) ([0-9a-f]{4,8})(?=\s|$)',text,re.M):
  raw=bytes.fromhex(b[:4]);raw+=struct.pack('<H',int(b[4:],16)) if len(b)==8 else b'';rows.append((int(a,16),raw))
 assert len(rows)==x['instruction_rows']
 for c in x['selected_candidates']+x['other_candidates']:
  data=images[c['image']];base=int(c['base'],16);assert base%4096==0
  good=0;run=0;longest=0;last=None
  for va,b in rows:
   off=va-base
   if off>=0 and off+len(b)<=len(data) and data[off:off+len(b)]==b:
    good+=1;run=run+len(b) if last==va else len(b);longest=max(longest,run);last=va+len(b)
   else:last=None;run=0
  assert good==c['matched_rows'] and longest==c['longest_matching_run_bytes']
  if c in x['selected_candidates']:assert good/len(rows)>=.95 and longest>=16
  checked+=1
for name,h in d['protected_decoder_outputs'].items():assert sha(old/name)==h
source=DEEP/'sensor-log-producers/pass1/functions/0801f0d0.txt';expected_source=sha(source)
refs=[c for x in d['records'] for c in x['inline_hash_citations']];assert len(refs)==2 and all(c['field']=='SOURCE_SHA256' and c['sha256']==expected_source for c in refs)
r={'result':'PASS','exclusive_categories_sum':sum(d['counts'].values()),'export_paths_and_hashes_verified':1461,'candidate_image_hashes_verified':9,'candidate_scores_independently_verified':checked,'upstream_export_references_verified':2,'protected_decoder_outputs_unchanged':len(d['protected_decoder_outputs']),'output_sha256':sha(HERE/'FOREIGN_ATTRIBUTION.json'),'producer_sha256':sha(HERE/'attribute_exports.py'),'verifier_sha256':sha(Path(__file__)),'limitations':'Checks table values and selected thresholds; does not prove original provenance or decoder correctness.'}
(HERE/'INDEPENDENT_VERIFICATION.json').write_text(json.dumps(r,ensure_ascii=False,indent=2)+'\n');print(json.dumps(r,ensure_ascii=False,indent=2))
