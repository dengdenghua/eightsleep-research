#!/usr/bin/env python3
"""Retain primary managed sources and statically export selected IL types."""
from pathlib import Path
import hashlib,json,shutil,subprocess
O=Path(__file__).resolve().parents[1];R=O.parents[2];S=R/'analysis/sleep-pipeline'
def sha(b):return hashlib.sha256(b).hexdigest()
selected={
 'Eight.Capybara':['Eight.Capybara.Program','Eight.Capybara.HostExtensions','Eight.Capybara.MachineConfig','Eight.Capybara.ConfigHelpers','Eight.Capybara.Extensions.ServiceCollectionExtensions','Eight.Capybara.DeviceSpecialization','Eight.Capybara.Firmness.SpecializationFirmnessGate'],
 'Eight.Config':['Eight.Config.Extensions','Eight.Config.Config'],
 'Eight.Capybara.Config':['Eight.Capybara.Config.PodConifgurationManager`1'],
 'Eight.Firmness':['Eight.Firmness.Extensions.ServiceCollectionExtensions','Eight.Firmness.Models.BalloonOptions','Eight.Firmness.Models.FirmnessConfiguration','Eight.Firmness.StateMachine.FirmnessService','Eight.Firmness.StateMachine.States.FirmnessReadyState','Eight.Firmness.Services.DynamicModeService','Eight.Firmness.Repositories.FirmnessPresetRepository','Eight.Firmness.DeviceAPI.FirmnessController','Eight.Firmness.StateMachine.States.FirmnessStateFactory','Eight.Firmness.Models.ToleranceBands','Eight.Firmness.Models.PressureMappings','Eight.Firmness.Models.DefaultFirmnessPresets'],
 'Microsoft.Extensions.Configuration':['Microsoft.Extensions.Configuration.ConfigurationRoot'],
 'Microsoft.Extensions.Options':['Microsoft.Extensions.Options.OptionsFactory`1'],
}
inv=json.loads((S/'bundle-inventory.json').read_text());host=Path(inv['source']);data=host.read_bytes();assert sha(data)==inv['sha256']
ledger=[dict(kind='original-bundle',source=str(host),sha256=sha(data),bytes=len(data))];commands=[]
tool=[str(S/'tools/dotnet/dotnet'),str(S/'tools/ilspy/tools/net10.0/any/ilspycmd.dll'),'--disable-updatecheck']
for assembly,types in selected.items():
 entry=next(x for x in inv['entries'] if x['name']==assembly+'.dll');assert entry['compressed_size']==0
 original=S/'capybara-bundle'/entry['name'];raw=original.read_bytes();assert data[entry['offset']:entry['offset']+entry['size']]==raw and sha(raw)==entry['sha256']
 ledger.append(dict(kind='original-managed-member',source=str(original),bytes=len(raw),sha256=sha(raw),bundle_offset=entry['offset']))
 for typ in types:
  simple=typ.rsplit('.',1)[1].split('`')[0];namespace=typ.rsplit('.',1)[0]
  src=S/'decompiled'/assembly/namespace/(simple+'.cs')
  if src.exists():
   copy=O/'source'/assembly/namespace/src.name;copy.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(src,copy)
   ledger.append(dict(kind='retained-decompilation',source=str(src),copy=str(copy.relative_to(O)),bytes=src.stat().st_size,sha256=sha(src.read_bytes()),assembly=assembly+'.dll'))
  for il in ([True] if src.exists() else [False,True]):
   rel=Path('il' if il else 'source/framework')/(assembly+'__'+simple+('.il.txt' if il else '.cs'))
   dest=O/rel;dest.parent.mkdir(parents=True,exist_ok=True)
   cmd=tool+(['--ilcode'] if il else [])+['--type',typ,str(original)]
   run=subprocess.run(cmd,capture_output=True)
   dest.write_bytes(run.stdout)
   commands.append(dict(command=cmd,exit_code=run.returncode,stderr=run.stderr.decode(),output=str(rel),sha256=sha(run.stdout)))
   assert run.returncode==0,(typ,run.stderr.decode())
configroot=Path('/Volumes/My Passport/eightsleep-full-evidence-20261107/firmware/mtk/rootfs/files/opt/eight/config')
excerpt={}
for name in ['default.json','machine.json']:
 p=configroot/name;raw=p.read_bytes();config=json.loads(raw)
 ledger.append(dict(kind='original-config',source=str(p),bytes=len(raw),sha256=sha(raw)))
 excerpt[name]=({'firmness':config['firmness']} if name=='default.json' else {k:{'firmness':v.get('firmness')} for k,v in config.items()})
(O/'CONFIG_EXCERPTS.json').write_text(json.dumps(excerpt,ensure_ascii=False,indent=2)+'\n')
(O/'SOURCE_LEDGER.json').write_text(json.dumps(ledger,ensure_ascii=False,indent=2)+'\n')
(O/'il/COMMANDS.json').write_text(json.dumps(commands,ensure_ascii=False,indent=2)+'\n')
print(json.dumps({'sources':len(ledger),'static_exports':len(commands),'vendor_execution':False}))
