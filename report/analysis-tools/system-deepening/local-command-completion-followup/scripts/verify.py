#!/usr/bin/env python3
from pathlib import Path
import hashlib,json
O=Path(__file__).resolve().parents[1]
def sha(b):return hashlib.sha256(b).hexdigest()
j=json.loads((O/'SOURCE_LEDGER.json').read_text());bundle=Path(j['original_bundle']).read_bytes();assert sha(bundle)==j['bundle_sha256']
for x in j['files']:
    b=Path(x['source']).read_bytes();assert len(b)==x['bytes'] and sha(b)==x['sha256']
    if x['kind']=='bundle-member':assert bundle[x['bundle_offset']:x['bundle_offset']+len(b)]==b
    if 'copy' in x:assert (O/x['copy']).read_bytes()==b
cmd=json.loads((O/'il/COMMANDS.json').read_text())
for c in cmd:assert c['exit_code']==0 and sha((O/c['output']).read_bytes())==c['sha256']
spec={
 'Eight.Lsp.Protocol__Connection.txt':['SemaphoreSlim::Wait(int32)','PacketEncoder::SendPacket','Connection::ResolveRequest','Connection::StopAsync','Task`1<class Eight.Lsp.Protocol.Packet>::WaitAsync'],
 'Eight.Lsp.Protocol__DeviceSession.txt':['Connection::SendCommand','DeviceCommunicationException'],
 'Eight.Lsp.Subsystems__DeviceConnection.txt':['DeviceSession`1<class [Eight.Lsp.Protocol]Eight.Lsp.Protocol.ProtocolContext>::SendCustomCommand']}
anchors=[]
for name,needles in spec.items():
    lines=(O/'il'/name).read_text().splitlines()
    for needle in needles:
        hits=[dict(line=i+1,text=l.strip()) for i,l in enumerate(lines) if needle in l];assert hits,(name,needle)
        anchors.append(dict(file='il/'+name,needle=needle,matches=hits))
(O/'IL_ANCHORS.json').write_text(json.dumps(anchors,ensure_ascii=False,indent=2)+'\n')
m=json.loads((O/'MODEL_RESULTS.json').read_text());assert m['case_count']==24 and all(x['observed']==x['expected'] for x in m['cases'])
v=dict(status='PASS',bundle_members=2,source_files=sum(x['kind']=='decompiled-source' for x in j['files']),static_IL_exports=len(cmd),IL_anchor_groups=len(anchors),persisted_model_cases=24,limits='Source/bundle identity and selected IL anchors; not independent whole-assembly decoding or runtime validation.')
(O/'VERIFICATION.json').write_text(json.dumps(v,ensure_ascii=False,indent=2)+'\n');print(json.dumps(v))
