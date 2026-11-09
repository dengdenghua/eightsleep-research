#!/usr/bin/env python3
"""Byte compatibility audit of the frozen 1461-file exclusion set.
No target execution, disassembly, network or change to decoder seeds.
"""
from pathlib import Path
import json,hashlib,re,collections
ROOT=Path(__file__).resolve().parents[3]
HERE=Path(__file__).resolve().parent
DEEP=ROOT/'report/analysis-tools/system-deepening'
OLD=DEEP/'disasm-full-image'
FIRM=ROOT/'materials/eightsleep-full-evidence-20261107/firmware/mtk/rootfs/files/opt/eight'
INSN=re.compile(r'^INSN ([0-9a-f]{8}) ([0-9a-f]{4,8})(?=\s|$)',re.M)
SHA=re.compile(r'(?im)^\s*(SOURCE_SHA256|SHA256)\s+([0-9a-f]{64})\b')
def digest(b):return hashlib.sha256(b).hexdigest()
def saved(name,obj):(HERE/name).write_text(json.dumps(obj,ensure_ascii=False,indent=2,sort_keys=True)+'\n')
def word(s):
 b=bytes.fromhex(s)
 assert len(b) in (2,4)
 return b if len(b)==2 else b[:2]+b[2:][::-1]
def scores(rows,data,base):
 hits=0;run=0;longest=0;end=None;matched_bytes=0
 for va,w in rows:
  off=va-base
  ok=0<=off and off+len(w)<=len(data) and data[off:off+len(w)]==w
  if ok:
   hits+=1;matched_bytes+=len(w);run=run+len(w) if end==va else len(w);longest=max(longest,run);end=va+len(w)
  else:run=0;end=None
 return {'matched_rows':hits,'rows':len(rows),'ratio':round(hits/len(rows),8),'matched_bytes':matched_bytes,'longest_matching_run_bytes':longest}
identity=(OLD/'EXPORT_IDENTITY.json').read_bytes();original=json.loads(identity)
subset=[x for x in original['export_files'] if x['cls']=='foreign'];assert len(subset)==1461
images=[]
for p in sorted(FIRM.rglob('*.bbin')):
 if p.name.startswith('._'):continue
 raw=p.read_bytes();images.append((str(p.relative_to(ROOT)),raw,digest(raw)))
assert len(images)==9 # frozen target plus eight sibling BBINs
protected=['DISASM_STATS.json','FUNCTION_INDEX.json','IMAGE_MAP.json','CROSSCHECK.json','MODEL_RESULTS.json','EXPORT_IDENTITY.json']
protected_hashes={n:digest((OLD/n).read_bytes()) for n in protected}
records=[];inline_sha=0
for item in subset:
 p=DEEP/item['export'];text_bytes=p.read_bytes();text=text_bytes.decode(errors='replace');rows=[(int(v,16),word(w)) for v,w in INSN.findall(text)]
 assert len(rows)==item['rows'] and rows
 citations=[{'field':field.upper(),'sha256':value.lower()} for field,value in SHA.findall(text)];inline_sha+=bool(citations)
 # Recheck the original classification against exactly the frozen bytes.
 target=next(raw for path,raw,_ in images if path.endswith('/lib/subsystem_updates/firmware-sensor-g0.bbin'))
 assert scores(rows,target,0x08008000)['matched_rows']==0
 assert scores(rows,target,0x08010000)['matched_rows']==0
 candidates=[]
 # Exhaust every page-aligned base at which ANY row could overlap an image.
 # Bounds use the complete row list, not a filename or short signature.
 for path,data,h in images:
  bases=set()
  for va,w in rows:
   lo=(va+len(w)-len(data)+4095)//4096*4096;hi=va//4096*4096
   bases.update(range(max(0,lo),hi+1,4096))
  for base in sorted(bases):
   sc=scores(rows,data,base)
   if sc['matched_rows'] and (sc['ratio']>=0.9 or sc['longest_matching_run_bytes']>=16):
    candidates.append({'image':path,'image_sha256':h,'base':hex(base),'base_in_tested_flash_window':0x08000000<=base<0x08100000,**sc})
 candidates.sort(key=lambda c:(-c['matched_rows'],-c['longest_matching_run_bytes'],c['image'],c['base']))
 qualified=[c for c in candidates if c['base_in_tested_flash_window'] and c['ratio']>=.95 and c['longest_matching_run_bytes']>=16 and len(rows)>=6]
 exact=[c for c in qualified if c['matched_rows']==len(rows)]
 selected=exact or qualified
 in_flash=all(0x08000000<=va<0x08100000 for va,_ in rows)
 if len(rows)<6 or sum(len(w) for _,w in rows)<16:cls='insufficient_content'
 elif len(selected)>1:cls='multiple_compatible_candidates'
 elif len(selected)==1:cls='unique_exact_compatibility' if exact else 'unique_high_compatibility'
 elif not any(0x08000000<=va<0x08100000 for va,_ in rows):cls='outside_tested_mcu_address_window'
 elif in_flash:cls='no_supported_candidate_in_tested_set'
 else:cls='mixed_address_ranges_unresolved'
 records.append({'export':item['export'],'export_sha256':digest(text_bytes),'instruction_rows':len(rows),'address_min':hex(min(v for v,_ in rows)),'address_max':hex(max(v+len(w) for v,w in rows)),'inline_hash_citations':citations,'classification':cls,'selected_candidates':selected,'other_candidates': [c for c in candidates if c not in selected],'origin_provenance':'not_established_by_byte_compatibility','excluded_from_original_decoder':True})
 if len(records)%200==0:print('processed',len(records),flush=True)
counts=dict(collections.Counter(x['classification'] for x in records));per_image=collections.Counter()
for x in records:
 if x['classification'].startswith('unique_'):
  c=x['selected_candidates'][0];per_image[(c['image'],c['base'],x['classification'])]+=1
assert sum(counts.values())==len(records)==1461
assert len(set(x['export'] for x in records))==1461
for n,h in protected_hashes.items():assert digest((OLD/n).read_bytes())==h
result={'schema':'eightsleep.foreign-byte-compatibility.v1','date':'2026-11-09','original_identity_sha256':digest(identity),'population':1461,'method':{'normalization':'2-byte raw unchanged; second halfword of 4-byte serialized row byte-swapped, matching original exporter convention','base_search':'All 0x1000-aligned nonnegative bases with at least one complete row potentially in the candidate image; no signature/filename filter','supported_candidate':'At least 6 rows, >=95% matching rows, >=16 contiguous matching bytes, base in [0x08000000,0x08100000)','selection':'Prefer all-row-exact candidates; otherwise retain every supported candidate. Unique means unique in these nine files under this policy, not proof of original provenance.','small_exports':'Fewer than 6 rows or 16 total bytes are insufficient, even if bytes match.','outside_window':'Numeric address-window exclusion only; host/AP origin not established by filename.','unresolved':'No supported candidate is a bounded negative result, not proof of a missing build.','exclusions':'Non-page-aligned, relocated, packed, alternative encodings or absent image targets are not resolved by this test.'},'candidate_images':[{'path':p,'bytes':len(b),'sha256':h} for p,b,h in images],'counts':counts,'unique_candidate_counts':[{'image':p,'base':b,'classification':c,'exports':n} for (p,b,c),n in sorted(per_image.items())],'inline_sha256':{'present':inline_sha,'absent':1461-inline_sha,'note':'Includes SOURCE_SHA256; these two references identify a parent exported text, not a firmware image. No inline hash does not imply absence of external source manifests.'},'protected_decoder_outputs':protected_hashes,'records':records}
saved('FOREIGN_ATTRIBUTION.json',result)
saved('VERIFICATION.json',{'result':'PASS','population':1461,'exclusive_category_sum':sum(counts.values()),'unique_paths':1461,'all_original_zero_agreement_rechecked':True,'original_decoder_files_unchanged':protected_hashes,'script_sha256':digest(Path(__file__).read_bytes())})
print(json.dumps({k:result[k] for k in ['population','counts','unique_candidate_counts','inline_sha256']},ensure_ascii=False,indent=2))
