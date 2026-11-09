#!/usr/bin/env python3
"""Snapshot all completed evidence files, then independently re-read each digest."""
from pathlib import Path
import json,hashlib
O=Path(__file__).resolve().parents[1]
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
records=[{'path':str(p.relative_to(O)),'bytes':p.stat().st_size,'sha256':sha(p)} for p in sorted(O.rglob('*')) if p.is_file() and p.name!='SOURCE_MANIFEST.json' and '__pycache__' not in p.parts]
m={'self_excluded':True,'files':records,'file_count':len(records),'content_bytes':sum(r['bytes'] for r in records),'original_inputs':json.loads((O/'INPUTS.json').read_text()),'boundary':'normal protocol static evidence; not current deployment or live device records'}
p=O/'SOURCE_MANIFEST.json';p.write_text(json.dumps(m,ensure_ascii=False,indent=2)+'\n')
for r in json.loads(p.read_text())['files']:
 q=O/r['path'];assert q.stat().st_size==r['bytes'] and sha(q)==r['sha256']
print(json.dumps({'status':'PASS','files':len(records),'content_bytes':m['content_bytes'],'manifest_sha256':sha(p)}))
