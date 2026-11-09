#!/usr/bin/env python3
"""Verify frozen follow-up evidence, persisted model assertions and input identities."""
import hashlib, json
from pathlib import Path
HERE=Path(__file__).resolve().parent
N=HERE.parent
R=N.parents[1]
folders=['local-parameter-resolution','local-sensor-recovery-followup','local-persistence-followup','local-aggregate-version-followup']
results=[]
for name in folders:
 root=N/name
 manifest=json.loads((root/'SOURCE_MANIFEST.json').read_text())
 files=manifest['files']; checked=set()
 for entry in files:
  rel=entry['path']; p=root/rel
  assert p.resolve().is_relative_to(root.resolve()),rel
  raw=p.read_bytes()
  assert len(raw)==entry.get('bytes',entry.get('size')),(name,rel,'size')
  assert hashlib.sha256(raw).hexdigest()==entry['sha256'],(name,rel,'hash')
  assert rel not in checked,(name,rel,'duplicate')
  checked.add(rel)
 actual={str(p.relative_to(root)) for p in root.rglob('*') if p.is_file() and p.name!='SOURCE_MANIFEST.json' and '__pycache__' not in p.parts and not p.name.startswith('._')}
 assert actual==checked,(name,'file-set',sorted(actual-checked),sorted(checked-actual))
 model=json.loads((root/'MODEL_RESULTS.json').read_text())
 cases=model['cases']; comparisons=0
 assert model.get('case_count',len(cases))==len(cases)
 for case in cases:
  assert case.get('passed',case.get('status')=='PASS'),(name,case)
  if 'expected' in case:
   key='observed' if 'observed' in case else 'actual'
   assert case[key]==case['expected'],(name,case)
   comparisons+=1
 results.append({'directory':name,'files_verified':len(files),'model_cases':len(cases),'persisted_expected_comparisons':comparisons,'manifest_sha256':hashlib.sha256((root/'SOURCE_MANIFEST.json').read_bytes()).hexdigest(),'status':'PASS'})
inputs=[
 ('mediatek/rootfs-selected/opt/eight/bin/frankenfirmware','84727b57ef8b226c78618f9fa9257df7d8ae771c78d8a51e6f3cabf0acc0c375'),
 ('mediatek/rootfs-selected/opt/eight/lib/subsystem_updates/firmware-sensor-g0-usb.bbin','1a125674542934f36266f88d9f8ca378a6a5ca696d9e58305d1b0e533f795563'),
 ('mediatek/rootfs-selected/opt/eight/firmware/balloon/A02/firmware-balloon-g0.bbin','0a2fa991c548478fa614d227777222f3f0914594f8db779bcc3837f30cd2e67a')]
for path,expected in inputs: assert hashlib.sha256((R/path).read_bytes()).hexdigest()==expected,path
accessory_inputs=json.loads((N/'local-persistence-followup/INPUTS.json').read_text())
for entry in accessory_inputs:
 path=Path(entry['path']); raw=path.read_bytes()
 assert len(raw)==entry['bytes'] and hashlib.sha256(raw).hexdigest()==entry['sha256'],entry['family']
result={'status':'PASS','directories':results,'total_finite_cases':sum(x['model_cases'] for x in results),'input_sha256_rechecked':len(inputs)+len(accessory_inputs),'scope':'Manifest identity, file-set coverage and persisted finite model checks. This is not a new native-semantic review, firmware execution, or measured device coverage. Separate original-byte validators and peer reviews remain in each report.'}
(HERE/'VERIFICATION.json').write_text(json.dumps(result,ensure_ascii=False,indent=2)+'\n')
print(json.dumps(result,ensure_ascii=False))
