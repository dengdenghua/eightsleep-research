#!/usr/bin/env python3
"""Audit retained identities and saved results for the non-bed-frame follow-up."""
from pathlib import Path
import json,hashlib
O=Path(__file__).resolve().parent;N=O.parent
def sha(b):return hashlib.sha256(b).hexdigest()
out=[]
for name in ['local-command-completion-followup','local-control-lifecycle-followup','local-fault-state-followup']:
    p=N/name;j=json.loads((p/'SOURCE_MANIFEST.json').read_text());rows=j.get('files',j.get('items'));assert rows
    for row in rows:
        b=(p/row['path']).read_bytes();assert len(b)==row['bytes'] and sha(b)==row['sha256'],(name,row['path'])
    item=dict(directory=name,manifest_files_verified=len(rows),manifest_sha256=sha((p/'SOURCE_MANIFEST.json').read_bytes()))
    if name!='local-fault-state-followup':
        m=json.loads((p/'MODEL_RESULTS.json').read_text());assert all(x['observed']==x['expected'] and x['status']=='PASS' for x in m['cases'])
        item['persisted_observed_expected_cases']=len(m['cases'])
    out.append(item)
reviews=[]
for name in ['REVIEW_COMMAND_COMPLETION_FOLLOWUP.json','REVIEW_CONTROL_LIFECYCLE_FOLLOWUP.json','REVIEW_FAULT_STATE_FOLLOWUP.json']:
    p=N/name;j=json.loads(p.read_text());status=j.get('status',j.get('result',''));assert status.startswith('PASS'),name
    reviews.append(dict(file=name,status=status,sha256=sha(p.read_bytes())))
result=dict(status='PASS',directories=out,reviews=reviews,total_manifest_files=sum(x['manifest_files_verified'] for x in out),scope='Identity and saved model consistency, with separate bounded semantic reviews; not device or whole-program coverage.')
(O/'VERIFICATION.json').write_text(json.dumps(result,ensure_ascii=False,indent=2)+'\n');print(json.dumps(result,ensure_ascii=False))
