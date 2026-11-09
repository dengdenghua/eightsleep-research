#!/usr/bin/env python3
"""Static-only retention and ILSpy export; never loads vendor DLL for execution."""
from pathlib import Path
import hashlib,json,shutil,subprocess
O=Path(__file__).resolve().parents[1]
R=O.parents[2];S=R/'analysis/sleep-pipeline'
sha=lambda b:hashlib.sha256(b).hexdigest()
selected={
 'Eight.Firmness':[
 'Eight.Firmness.StateMachine.FirmnessService',
 'Eight.Firmness.StateMachine.States.FirmnessReadyState',
 'Eight.Firmness.StateMachine.States.CalibratingState',
 'Eight.Firmness.StateMachine.States.FirmnessStateFactory',
 'Eight.Firmness.StateMachine.States.SubsystemStateFactoryBase',
 'Eight.Firmness.Services.Calibration.CalibrationRunner',
 'Eight.Firmness.Services.Calibration.CalibrationRunStateMachine',
 'Eight.Firmness.Services.Calibration.Landing.LandingRunStateMachine',
 'Eight.Firmness.DeviceAPI.CalibrationController',
 'Eight.Firmness.DeviceAPI.FirmnessController',
 'Eight.Firmness.DeviceAPI.FirmnessDeviceStatus',
 'Eight.Firmness.DeviceAPI.ToleranceDebugController',
 'Eight.Firmness.DeviceAPI.TelemetryProfileDebugController',
 'Eight.Firmness.Services.DynamicModeService',
 'Eight.Firmness.Extensions.ServiceCollectionExtensions'],
 'Eight.Lsp.Subsystems':[
 'Eight.Lsp.Subsystems.StateMachine.SubsystemHost',
 'Eight.Lsp.Subsystems.StateMachine.States.ReadyStateBase',
 'Eight.Lsp.Subsystems.StateMachine.States.NullState',
 'Eight.Lsp.Subsystems.StateMachine.States.NotConnectedState',
 'Eight.Lsp.Subsystems.StateMachine.States.WaitingForBootloaderState',
 'Eight.Lsp.Subsystems.StateMachine.States.CheckingFirmwareState',
 'Eight.Lsp.Subsystems.StateMachine.States.BootingToFirmwareState'],
 'Eight.Capybara.Config':['Eight.Capybara.Config.PodConifgurationManager`1'],
 'Eight.Capybara':['Eight.Capybara.Extensions.ServiceCollectionExtensions']}
inv=json.loads((S/'bundle-inventory.json').read_text())
host=Path(inv['source']);rawhost=host.read_bytes();assert sha(rawhost)==inv['sha256']
ledger=[dict(kind='original-bundle',source=str(host),sha256=sha(rawhost),bytes=len(rawhost))];commands=[]
tool=[str(S/'tools/dotnet/dotnet'),str(S/'tools/ilspy/tools/net10.0/any/ilspycmd.dll'),'--disable-updatecheck']
for assembly,types in selected.items():
 entry=next(x for x in inv['entries'] if x['name']==assembly+'.dll')
 original=S/'capybara-bundle'/entry['name'];raw=original.read_bytes()
 assert entry['compressed_size']==0 and rawhost[entry['offset']:entry['offset']+entry['size']]==raw and sha(raw)==entry['sha256']
 ledger.append(dict(kind='original-managed-member',source=str(original),bytes=len(raw),sha256=sha(raw),bundle_offset=entry['offset']))
 for typ in types:
  simple=typ.rsplit('.',1)[1].split('`')[0];namespace=typ.rsplit('.',1)[0]
  src=S/'decompiled'/assembly/namespace/(simple+'.cs');assert src.exists()
  dest=O/'source'/assembly/namespace/src.name;dest.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(src,dest)
  ledger.append(dict(kind='retained-decompilation',source=str(src),copy=str(dest.relative_to(O)),sha256=sha(src.read_bytes()),bytes=src.stat().st_size,assembly=assembly+'.dll'))
  il=O/'il'/(assembly+'__'+simple+'.il.txt');il.parent.mkdir(exist_ok=True)
  cmd=tool+['--ilcode','--type',typ,str(original)];run=subprocess.run(cmd,capture_output=True)
  il.write_bytes(run.stdout);commands.append(dict(command=cmd,output=str(il.relative_to(O)),exit_code=run.returncode,stderr=run.stderr.decode(),sha256=sha(run.stdout)))
  assert run.returncode==0,(typ,run.stderr.decode())
  print(typ,flush=True)
(O/'SOURCE_LEDGER.json').write_text(json.dumps(ledger,ensure_ascii=False,indent=2)+'\n')
(O/'il/COMMANDS.json').write_text(json.dumps(commands,ensure_ascii=False,indent=2)+'\n')
(O/'VERIFICATION.json').write_text(json.dumps(dict(bundle_sha256=sha(rawhost),dll_members_verified_against_bundle=len(selected),static_il_exports=len(commands),vendor_execution=False),indent=2)+'\n')
