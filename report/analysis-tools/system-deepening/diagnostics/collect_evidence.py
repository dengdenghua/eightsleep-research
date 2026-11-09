#!/usr/bin/env python3
"""Copy/hash selected static source evidence; never import or execute target code."""
from pathlib import Path
import hashlib, json, zlib
from datetime import datetime, timezone, timedelta

ROOT = Path('/Users/dangbei/Downloads/eightsleep-firmware-research-20261107')
BASE = ROOT / 'analysis/sleep-pipeline'
OUT = Path(__file__).resolve().parent
SOURCES = [
 ('S01','Eight.Capybara/Eight.Capybara/HostExtensions.cs'),
 ('S02','Eight.Capybara/Eight.Capybara.Extensions/HandlerExtensions.cs'),
 ('S03','Eight.Firmness/Eight.Firmness.Extensions/DeviceApiExtensions.cs'),
 ('S04','Eight.Nats/Eight.Nats.Extensions/ServiceCollectionExtensions.cs'),
 ('S05','Eight.Capybara.DeviceApi/Eight.Capybara.DeviceApi/DeviceApiExtensions.cs'),
 ('S06','Eight.DeviceApiClient/Eight.DeviceApiClient/ConnectionOptions.cs'),
 ('S07','Eight.DeviceApiClient/Eight.DeviceApiClient/CertificateClientId.cs'),
 ('S08','Eight.Capybara.DeviceApi/Eight.Capybara.DeviceApi/DeviceAPIService.cs'),
 ('S09','Eight.DeviceApiClient/Eight.DeviceApiClient/Client.cs'),
 ('S10','Eight.DeviceApiClient/Eight.DeviceApiClient/Helpers.cs'),
 ('S11','Eight.DeviceApiClient/Eight.DeviceApiClient/ScopedRouter.cs'),
 ('S12','Eight.DeviceApiClient/Eight.DeviceApiClient/FunctionRoute.cs'),
 ('S13','Eight.DeviceApiClient/Eight.DeviceApiClient/ParameterParserFactory.cs'),
 ('S14','Eight.DeviceApiClient/Eight.DeviceApiClient/JsonSerializer.cs'),
 ('S15','Eight.DeviceApiClient/Eight.DeviceApiClient/DeserializeException.cs'),
 ('S16','Eight.DeviceProtocol/Eight.DeviceProtocol/Request.cs'),
 ('S17','Eight.DeviceProtocol/Eight.DeviceProtocol/Response.cs'),
 ('S18','Eight.DeviceProtocol/Eight.DeviceProtocol/Error.cs'),
 ('S19','Eight.Capybara.DeviceApi/Eight.Capybara.DeviceApi/Utils.cs'),
 ('S20','Eight.Firmness/Eight.Firmness.DeviceAPI/SubsystemDebugController.cs'),
 ('S21','Eight.Lsp.Subsystems/Eight.Lsp.Subsystems.Infrastructure/UsbPortMapper.cs'),
 ('S22','Eight.Firmness/Eight.Firmness.DeviceAPI/UsbPortMapping.cs'),
 ('S23','Eight.Nats/Eight.Nats.DeviceAPI/DebugNatsController.cs'),
 ('S24','Eight.Nats/Eight.Nats.DeviceAPI/DebugNatsArgs.cs'),
 ('S25','Eight.Nats/Eight.Nats.DeviceAPI/DebugNatsResponse.cs'),
 ('S26','Eight.Nats/Eight.Nats.Monitoring/NatsMonitoringClient.cs'),
 ('S27','Eight.Firmness/Eight.Firmness.DeviceAPI/FirmnessDebugController.cs'),
 ('S28','Eight.Firmness/Eight.Firmness.DeviceAPI/FirmnessDeviceStatus.cs'),
 ('S29','Eight.Firmness/Eight.Firmness.StateMachine.States/FirmnessReadyState.cs'),
 ('S30','Eight.Firmness/Eight.Firmness.StateMachine.States/FirmnessDeviceState.cs'),
 ('S31','Eight.Firmness/Eight.Firmness.StateMachine/FirmnessService.cs'),
 ('S32','Eight.Firmness/Eight.Firmness.DeviceAPI/FirmnessDebugResponse.cs'),
 ('S33','Eight.Firmness/Eight.Firmness.DeviceAPI/TelemetryProfileDebugController.cs'),
 ('S34','Eight.Firmness/Eight.Firmness.DeviceAPI/TelemetryProfileStateResponse.cs'),
 ('S35','Eight.Firmness/Eight.Firmness.DeviceAPI/ToleranceDebugController.cs'),
 ('S36','Eight.Firmness/Eight.Firmness.DeviceAPI/ToleranceStateResponse.cs'),
 ('S37','Eight.Capybara/Eight.Capybara.DeviceAPI.Handlers/PairingController.cs'),
 ('S38','Eight.Capybara/Eight.Capybara.DeviceAPI.Handlers/PairingStatusResponse.cs'),
 ('S39','Eight.Capybara/Eight.Capybara.AutoPairing/PairingService.cs'),
 ('S40','Eight.Capybara/Eight.Capybara.AutoPairing/PairingState.cs'),
 ('S41','Eight.Capybara/Eight.Capybara.DeviceAPI.Handlers/RemoteConnectivityController.cs'),
 ('S42','Eight.Capybara/Eight.Capybara.DeviceAPI.Handlers/RemoteConnectivityService.cs'),
 ('S43','Eight.Capybara/Eight.Capybara/PairingMode.cs'),
 ('S44','Eight.Capybara/Eight.Capybara/Program.cs'),
 ('S45','Eight.Capybara/Eight.Capybara/CapybaraWorker.cs'),
 ('S46','Eight.Lsp.Subsystems/Eight.Lsp.Subsystems.StateMachine.States/ReadyStateBase.cs'),
 ('S47','Eight.Firmness/Eight.Firmness.DeviceAPI/FirmnessController.cs'),
 ('S48','Eight.Capybara/Eight.Capybara.Ble.Characteristics/WifiSetupCharacteristic.cs'),
 ('S49','Eight.Capybara/Eight.Capybara.Ble.Characteristics/WifiSetupClearCharacteristic.cs'),
 ('S50','Eight.Capybara/Eight.Capybara.DeviceAPI.Handlers/StartSsh2Request.cs'),
 ('S51','Eight.Capybara/Eight.Capybara.DeviceAPI.Handlers/StartSshResponse.cs'),
 ('S52','Eight.Capybara/Eight.Capybara.DeviceAPI.Handlers/GetPublicKeyResponse.cs'),
 ('S53','Eight.Firmness/Eight.Firmness.DeviceAPI/DebugGetTelemetryArgs.cs'),
 ('S54','Eight.Lsp.Subsystems/Eight.Lsp.Subsystems.Models/Side.cs'),
]

def digest(data): return hashlib.sha256(data).hexdigest()
def record(path):
    data=path.read_bytes()
    return {'path':str(path.relative_to(ROOT)), 'bytes':len(data), 'sha256':digest(data)}

def main():
    prior=json.loads((BASE/'decompilation-provenance.json').read_text())
    prior={f['path']:f['sha256'] for f in prior['source_files']}
    ledger=[]; blocks=[]
    for sid,rel in SOURCES:
        source=BASE/'decompiled'/rel; data=source.read_bytes()
        dest=OUT/'source'/rel; dest.parent.mkdir(parents=True,exist_ok=True); dest.write_bytes(data)
        lines=data.decode().splitlines()
        entry={'id':sid,**record(source),'snapshot':str(dest.relative_to(OUT)), 'line_count':len(lines),'prior_sha256':prior.get('decompiled/'+rel),'prior_match':prior.get('decompiled/'+rel)==digest(data),'form':'existing ILSpy decompiled C#; not original vendor source'}
        ledger.append(entry)
        blocks += [f"\n=== {sid} {entry['path']} ===",f"SHA256 {entry['sha256']}",*[f'{i:04d}: {line}' for i,line in enumerate(lines,1)]]
    dlls=sorted({rel.split('/')[0]+'.dll' for _,rel in SOURCES})
    artifacts=[record(BASE/'capybara-bundle'/dll) for dll in dlls]
    artifacts += [record(ROOT/'mediatek/rootfs-selected/opt/eight/bin/Eight.Capybara'),record(BASE/'decompilation-provenance.json'),record(ROOT/'mediatek/rootfs-selected/opt/eight/config/default.json')]
    bundle=json.loads((BASE/'bundle-inventory.json').read_text())
    native=Path(bundle['source']).read_bytes()
    assert digest(native)==bundle['sha256']
    bindings=[]
    for dll in dlls:
        entry=next(e for e in bundle['entries'] if e['name']==dll)
        data=native[entry['offset']:entry['offset']+(entry['compressed_size'] or entry['size'])]
        if entry['compressed_size']:data=zlib.decompress(data,-15)
        matched=data==(BASE/'capybara-bundle'/dll).read_bytes() and digest(data)==entry['sha256']
        assert matched
        bindings.append({'entry':entry,'matches_native_member':matched})
    baseline=[record(BASE/'DOWNLOAD_AND_RUNTIME_ARTIFACTS_ZH.txt'),record(ROOT/'analysis/device-side-followup/diagnostics/FINDINGS_ZH.txt')]
    stamp=datetime.now(timezone(timedelta(hours=8))).isoformat(timespec='seconds')
    (OUT/'SOURCE_MANIFEST.json').write_text(json.dumps({'generated_at':stamp,'root':str(ROOT),'sources':ledger,'artifacts':artifacts,'bundle_bindings':bindings,'bundle_inventory':record(BASE/'bundle-inventory.json'),'baseline_reports':baseline,'limit':'Static local files only. No actual account, certificates, keys, live payloads or device state read. Code includes public vendor constants, not user credentials.'},ensure_ascii=False,indent=2)+'\n')
    (OUT/'SOURCE_CONTEXTS.txt').write_text('\n'.join(blocks)+'\n')
    checks={'source_files':len(ledger),'source_sha_matches_prior':sum(e['prior_match'] for e in ledger),'snapshot_byte_equal':all((OUT/e['snapshot']).read_bytes()==(ROOT/e['path']).read_bytes() for e in ledger),'artifact_count':len(artifacts),'assembly_count':len(dlls),'native_bundle_member_matches':len(bindings),'target_execution':False,'official_api_requests':0,'device_requests':0,'scope':'Source/IL evidence validation only; not runtime or server reachability validation.'}
    (OUT/'VALIDATION.json').write_text(json.dumps(checks,ensure_ascii=False,indent=2)+'\n')
    print(json.dumps(checks,ensure_ascii=False))

if __name__=='__main__':main()
