#!/usr/bin/env python3
"""Retain statically inspected managed command completion evidence."""
from pathlib import Path
import hashlib, json, subprocess, shutil

O=Path(__file__).resolve().parents[1]
R=O.parents[2]
S=R/'analysis/sleep-pipeline'
def sha(b): return hashlib.sha256(b).hexdigest()
types=[('Eight.Lsp.Protocol','Eight.Lsp.Protocol',x) for x in
       ['Connection','DeviceSession','PacketParser','PacketEncoder','FrameEncoder','SerialPhysical','ResponseCode','LspOptions','ConnectionFactory']]
types.append(('Eight.Lsp.Subsystems','Eight.Lsp.Subsystems.Services.Connection','DeviceConnection'))
types.append(('Eight.Lsp.Subsystems','Eight.Lsp.Subsystems.Services.Connection','DeviceConnectionFactory'))
inv=json.loads((S/'bundle-inventory.json').read_text())
raw=Path(inv['source']).read_bytes();assert sha(raw)==inv['sha256']
ledger=[];commands=[]
for asm in sorted({x[0] for x in types}):
    member=next(x for x in inv['entries'] if x['name']==asm+'.dll')
    dll=S/'capybara-bundle'/member['name'];data=dll.read_bytes()
    assert member['compressed_size']==0 and len(data)==member['size'] and sha(data)==member['sha256']
    assert raw[member['offset']:member['offset']+member['size']]==data
    ledger.append(dict(kind='bundle-member',source=str(dll),bytes=len(data),sha256=sha(data),bundle_offset=member['offset']))
for asm,namespace,name in types:
    src=S/'decompiled'/asm/namespace/(name+'.cs');dest=O/'source'/asm/namespace/(name+'.cs')
    dest.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(src,dest)
    data=src.read_bytes();ledger.append(dict(kind='decompiled-source',source=str(src),copy=str(dest.relative_to(O)),bytes=len(data),sha256=sha(data)))
    out=O/'il'/(asm+'__'+name+'.txt');out.parent.mkdir(exist_ok=True)
    typename=namespace+'.'+name+('`1' if name=='DeviceSession' else '')
    args=[str(S/'tools/dotnet/dotnet'),str(S/'tools/ilspy/tools/net10.0/any/ilspycmd.dll'),'--disable-updatecheck','--ilcode','--type',typename,str(S/'capybara-bundle'/(asm+'.dll'))]
    r=subprocess.run(args,stdout=subprocess.PIPE,stderr=subprocess.PIPE,timeout=120)
    out.write_bytes(r.stdout);assert r.returncode==0,(name,r.stderr.decode())
    commands.append(dict(argv=args,exit_code=r.returncode,output=str(out.relative_to(O)),sha256=sha(r.stdout),stderr=r.stderr.decode()))
(O/'SOURCE_LEDGER.json').write_text(json.dumps(dict(original_bundle=inv['source'],bundle_sha256=inv['sha256'],files=ledger),ensure_ascii=False,indent=2)+'\n')
(O/'il/COMMANDS.json').write_text(json.dumps(commands,ensure_ascii=False,indent=2)+'\n')
print(json.dumps(dict(bundle_members=2,selected_types=len(types),static_exports=len(commands))))
