from pathlib import Path
import hashlib,json
O=Path(__file__).resolve().parents[1]
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
inputs=json.loads((O/'INPUTS.json').read_text());assert sha(Path(inputs[0]['path']))==inputs[0]['sha256']
sources={'input':inputs[0],'reused_listing':{'source':str(O.parent/'local-persistence-followup/k1-scan-all/decoded-instructions.tsv'),'sha256':sha(O/'reference/decoded-instructions.tsv')},'claims':[
 {'id':'startup-data','sources':['pass2/00026580.txt','pass3/0002c490.txt','RAW_TABLES.json','scripts/decode_startup_data.py','STARTUP_DATA.json']},
 {'id':'primary-init-API','sources':['pass2/00029658.txt','pass2/0003221c.txt','pass2/00030098.txt','RAW_TABLES.json']},
 {'id':'completion-callback','sources':['pass3/0002faac.txt','pass3/0002faa4.txt','pass3/0002f99c.txt','STARTUP_DATA.json']},
 {'id':'bounded-alias','sources':['alias/coverage.txt','alias/status.tsv','alias/alias-candidates.tsv','ALIAS_CANDIDATES.json','scripts/AliasPersistence.java']},
 {'id':'indirect-provenance','sources':['INDIRECT_CALL_LEDGER.json','pass1/value-slices.tsv','reference/late-callback-ranges.txt']},
 {'id':'record-not-appended-in-selected-candidates','sources':['pass1/00029840.txt','pass1/000298bc.txt','pass1/0002b6a8.txt','BLOCK_COPY_LEDGER.json']},
 {'id':'service-arguments-boundary','sources':['reference/late-callback-ranges.txt','CONTRACTS.json']}
], 'limits':'No REA Evidence IDs; readOnly native exports and byte identities. Source lists support bounded statements, not whole-program no-save proof.'}
for c in sources['claims']:
 c['hashes']={s:sha(O/s) for s in c['sources']}
(O/'SOURCE_INDEX.json').write_text(json.dumps(sources,ensure_ascii=False,indent=2)+'\n')
entries=[]
for p in sorted(O.rglob('*')):
 if p.is_file() and p.name not in ['SOURCE_MANIFEST.json'] and '__pycache__' not in p.parts:entries.append({'path':p.relative_to(O).as_posix(),'bytes':p.stat().st_size,'sha256':sha(p)})
(O/'SOURCE_MANIFEST.json').write_text(json.dumps({'version':1,'items':entries,'count':len(entries),'scope':'All retained files in this owned directory except manifest itself and Python interpreter caches'},ensure_ascii=False,indent=2)+'\n')
for e in entries:assert sha(O/e['path'])==e['sha256']
print(json.dumps({'files':len(entries),'manifest_sha256':sha(O/'SOURCE_MANIFEST.json'),'findings_sha256':sha(O/'FINDINGS_ZH.txt'),'verification':'all hashes match'}))
