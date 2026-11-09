#!/usr/bin/env python3
"""Verify local retained bytes and index the selected IL/source review scope."""
from pathlib import Path
import hashlib,json
O=Path(__file__).resolve().parents[1]
sha=lambda b:hashlib.sha256(b).hexdigest()
def write(name,value):(O/name).write_text(json.dumps(value,ensure_ascii=False,indent=2)+'\n')
ledger=json.loads((O/'SOURCE_LEDGER.json').read_text())
for e in ledger:
    data=Path(e['source']).read_bytes();assert sha(data)==e['sha256']
    if e.get('copy'):assert (O/e['copy']).read_bytes()==data
commands=json.loads((O/'il/COMMANDS.json').read_text())
for e in commands:
    assert e['exit_code']==0 and sha((O/e['output']).read_bytes())==e['sha256']
result=json.loads((O/'MODEL_RESULTS.json').read_text())
assert result['case_count']==len(result['cases'])==24
assert all(e['status']=='PASS' and e['observed']==e['expected'] for e in result['cases'])
queries={
 'Eight.Firmness__FirmnessReadyState.il.txt':['::requests','::WaitAsync(','::handedOffToCalibration','::Release()', '::CreateCalibratingState','::set_CalibrationHandoffPending','::SendFirmnessCommand','::SendModeCommand'],
 'Eight.Lsp.Subsystems__ReadyStateBase.il.txt':['::ThrowIfCancellationRequested','::Close(', '::TrySetResult('],
 'Eight.Lsp.Subsystems__SubsystemHost.il.txt':['::GetNextState(', '::get_IsCancellationRequested()', '::set_Item(', '::Invoke(!0)'],
 'Eight.Firmness__CalibratingState.il.txt':['::Tick(', '::AbandonAsync(', '::CreateReadyState(', '::get_IsCalibrating()'],
 'Eight.Firmness__CalibrationRunner.il.txt':['::cancelRequested','::finalizing','::stateMachine','::SafeShutdownBestEffort','::FinalizeAsync'],
 'Eight.Firmness__FirmnessService.il.txt':['::UpdateConfiguration(', '::CreateNullState(', '::set_Item(', '::Cancel()'],
 'Eight.Firmness__FirmnessStateFactory.il.txt':['FirmnessReadyState::.ctor','::GetRequiredService'],
 'Eight.Firmness__ServiceCollectionExtensions.il.txt':['PodConifgurationManager','IPodConfigurationManager'],
 'Eight.Capybara__ServiceCollectionExtensions.il.txt':['R12.json'],
 'Eight.Capybara.Config__PodConifgurationManager.il.txt':['::set_Configuration','::Save()','::ReadConfiguration']
}
anchors=[]
for f,terms in queries.items():
    lines=(O/'il'/f).read_text().splitlines()
    for i,line in enumerate(lines):
        if 'IL_' in line and any(t in line for t in terms):
            anchors.append(dict(path='il/'+f,line=i+1,text=line.strip(),context=[{'line':j+1,'text':lines[j].strip()} for j in range(max(0,i-2),min(len(lines),i+3))]))
write('IL_ANCHORS.json',{'purpose':'Navigation only; original complete static IL exports retained. Not a list of independently audited every instruction.', 'anchors':anchors})
sources=[]
for p in sorted((O/'source').rglob('*.cs')):
    sources.append(dict(path=str(p.relative_to(O)),sha256=sha(p.read_bytes()),lines=len(p.read_text().splitlines())))
write('SOURCE_INDEX.json',sources)
contracts=[
 {'id':'queue_owner','owner':'individual FirmnessReadyState','on_new_ready':'new empty queue, no transfer','persistence':'none at MakeRequest'},
 {'id':'handoff','order':['drain selected requests','await per-ready deviceWriteLock','handedOff=true','release lock','construct Calibrating'],'scope':'work executed through RunDeviceWrite, not all ordinary Send calls'},
 {'id':'cancel_calibration','order':['cancelRequested=true','return lastStatus'],'not_proven':['inflight send cancelled','MCU action stopped','pending calibration removed']},
 {'id':'disable','order':['UpdateConfiguration Enabled=false','stateDict side=Null','side CTS.Cancel'],'join_in_method':False,'save_exception':'RAM assignment may already occur; reset/cancel not reached'},
 {'id':'ready_exit','order':['await monitor','ThrowIfCancellationRequested','if explicit next state return it','otherwise await Close(None) on link/fallback'],'event_only':'non-Firmware link event sets TCS; no immediate in-flight RunTick cancellation'},
 {'id':'host_reconcile','rule':'keep local Null; otherwise prefer public Null only when current side CTS is cancelled'},
 {'id':'reconnect','source':'current singleton Configuration RAM in same process','file_read':'manager construction from /persistent/R12.json','not_transferred':['old queue','old Ready telemetry cache','old semaphore']},
 {'id':'calibration_finalize','normal_order':['await action batch','finalization/record','stateMachine=null','new Ready if no pending link change'],'abandon':'await cleanup with independent cancellation budget; no strict physical stop guarantee'}
]
write('CONTRACTS.json',{'scope':'managed application lifecycle only','contracts':contracts})
write('COVERAGE.json',{
 'retained_types':len(commands),'retained_dlls':4,'synthetic_cases':24,
 'direct_review':[
 'Ready constructor, requests/MakeRequest/RequestCalibration, RunTick, OnRequest, RunDeviceWrite, SendFirmness/SendMode catch boundaries and initialization config reads',
 'Factory new Ready/new Calibrating and DI singleton configuration source',
 'ReadyStateBase GetNextState event, await, cancellation and finally order; SubsystemHost local/public reconciliation',
 'FirmnessService Disable/Dispose and calibration/ordinary API state gates/tokens',
 'CalibratingState monitor/TickUntilDone/finally; Runner Cancel/Tick/Abandon/finalizer lifecycle',
 'Selected cancellation-consuming Advance gates in Pulse/Landing; not full algorithm math',
 'PodConifgurationManager UpdateConfiguration/Create/ReadConfiguration source and lifecycle IL anchors'
 ],
 'navigation_only_or_partial':[
 'Connection discovery/bootloader/firmware states retained to show construction route; not every port mapping, upgrade, retry or error branch re-audited',
 'CalibrationRunner source/IL retained whole for provenance; fits/analyzers/device output math outside lifecycle review',
 'DynamicMode retained to confirm requests use current Ready; previous posture algorithm not re-audited'
 ],
 'not_covered':[
 'Bed-frame firmware or persistence', 'Hardware execution, serial captures, account/service access',
 'All possible thread interleavings, cancellation callback scheduling, SemaphoreSlim fairness or memory visibility proofs',
 'Complete transport semantics (separate local-command-completion-followup evidence)',
 'Actual pressure/valve/pump effects, deployment identity, fault frequencies or physical stop deadlines'
 ]})
write('VERIFICATION.json',{
 'original_bundle_sha256':ledger[0]['sha256'],
 'bundle_member_binding':'retain.py verified original DLL bytes at official bundle offset and inventory SHA',
 'original_sources_and_copies_unchanged':True,
 'dll_members':4,'retained_types_and_il_exports':len(commands),
 'saved_model_cases_equal':24,'vendor_execution':False,
 'checks':'All SOURCE_LEDGER original/copy SHA, all IL command status/output SHA and persisted model equality checked by freeze.py'
})
manifest=[]
for p in sorted(O.rglob('*')):
    if p.is_file() and p.name!='SOURCE_MANIFEST.json':
        manifest.append(dict(path=str(p.relative_to(O)),bytes=p.stat().st_size,sha256=sha(p.read_bytes())))
write('SOURCE_MANIFEST.json',{'schema':'local-static-evidence-manifest-v1','files':manifest})
print(json.dumps({'files':len(manifest),'manifest_sha256':sha((O/'SOURCE_MANIFEST.json').read_bytes()),'cases':24,'il_exports':len(commands)}))
