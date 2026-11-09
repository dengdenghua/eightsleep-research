#!/usr/bin/env python3
"""Finite synthetic events. Does not execute vendor code or emulate the protocol/MCU.

Scheduler boundaries and send/cleanup completions are explicit fixture inputs.
No exhaustive concurrency or timing claim is made.
"""
from pathlib import Path
from copy import deepcopy
import json
O=Path(__file__).resolve().parents[1]

class Config:
    def __init__(self):
        self.ram={'enabled':True,'target':'old-target','mode':'old-mode'}
        self.disk=deepcopy(self.ram)
    def update(self,key,value,save_ok=True):
        self.ram={**self.ram,key:value}
        if save_ok: self.disk=deepcopy(self.ram)
        return save_ok

class Ready:
    def __init__(self,identity,config,connection='connection-A'):
        self.identity=identity; self.config=config; self.connection=connection
        self.queue=[]; self.selected=[]; self.pending=False; self.handed=False
        self.lock_owner=None; self.cancelled=False; self.waiting_handoff=False
        self.inflight=None; self.events=[]
    def event(self,kind,**kw): self.events.append(dict(kind=kind,**deepcopy(kw)))
    def enqueue(self,kind,value):
        self.queue.append((kind,value));self.event('enqueue',request=kind,value=value)
    def request_calibration(self):
        self.pending=True; self.enqueue('calibration','selected-bags')
    def begin_tick(self):
        # This uses the already recovered per-kind selection only as an entry condition.
        chosen={}
        while self.queue:
            kind,value=self.queue.pop(0);chosen[kind]=value
        if 'calibration' in chosen:
            self.waiting_handoff=True;self.event('drained_for_handoff',discarded=[x for x in chosen if x!='calibration'])
            return self.try_handoff()
        self.selected=[(x,chosen[x]) for x in ('target','mode') if x in chosen]
        return 'ordinary_batch'
    def try_handoff(self):
        assert self.waiting_handoff
        if self.cancelled:
            self.event('wait_lock_cancelled');self.waiting_handoff=False;return 'cancelled'
        if self.lock_owner is not None:
            self.event('handoff_waits_for_lock');return 'waiting'
        self.handed=True;self.waiting_handoff=False
        self.event('handoff_mark_then_release_then_construct')
        return 'Calibrating'
    def begin_locked_api(self,name):
        if self.lock_owner is not None:return 'waiting'
        if self.handed:
            self.event('reject_after_handoff',api=name);return 'CalibrationRunningException'
        self.lock_owner=name;self.event('locked_api_started',api=name,token='None');return 'started'
    def finish_locked_api(self,outcome='returned'):
        assert self.lock_owner is not None
        self.event('locked_api_finished',api=self.lock_owner,outcome=outcome)
        self.lock_owner=None
    def start_selected_send(self,save_ok=True):
        assert self.inflight is None and self.selected
        kind,value=self.selected.pop(0)
        self.config.update(kind,value,save_ok)
        self.inflight=(kind,value)
        # This is a call into SendCustomCommand, NOT proof of serial write or device application.
        self.event('send_call',request=kind,value=value,token_cancelled=self.cancelled)
    def complete_send(self,outcome='returned'):
        assert self.inflight is not None
        self.event('send_await_finished',request=self.inflight[0],outcome=outcome)
        self.inflight=None
        # SendFirmnessCommand/SendModeCommand catch Exception, including OCE.

def ready_base_exit(monitor_result=None,link_changed=False,cancelled=False):
    if cancelled:return {'close_requested':True,'next':'NotConnected'}
    if monitor_result is not None:return {'close_requested':False,'next':monitor_result}
    return {'close_requested':True,'next':'NotConnected'}

def host_reconcile(local_state,public_state,cts_cancelled):
    if local_state=='Null':return local_state
    if cts_cancelled and public_state=='Null':return public_state
    return local_state

def disable(config,ready,save_ok=True):
    # UpdateConfiguration sets RAM first, but a thrown save error prevents subsequent Disable steps.
    if not config.update('enabled',False,save_ok):
        return {'public_state':'Ready','returned':'save_exception','joined':False}
    ready.cancelled=True
    return {'public_state':'Null','returned':'void','joined':False}

class Calibration:
    def __init__(self):
        self.active=True;self.cancel_requested=False;self.token_cancelled=False
        self.last_status='Running';self.batch=[];self.inflight=None;self.events=[]
    def cancel(self):
        self.cancel_requested=True;self.events.append('cancel_flag_only');return self.last_status
    def start_precomputed_action(self):
        assert self.batch and self.inflight is None
        self.inflight=self.batch.pop(0);self.events.append('send_call:'+self.inflight)
    def complete_action(self):
        assert self.inflight is not None
        self.events.append('send_completed:'+self.inflight);self.inflight=None
    def advance_selected_running_phase(self):
        # Only a phase in which the recovered state machine consumes cancellation.
        return 'shutdown_or_restore' if self.cancel_requested else 'continue'
    def begin_abandon(self):
        self.events.append('await_abandon_with_10s_cancellation_budget')
    def supplied_finalize_completion(self,record_saved=True):
        if not record_saved:
            self.events.append('record_save_exception_before_stateMachine_null');return
        self.active=False;self.last_status='terminal';self.events.append('stateMachine_null')

def main():
    cases=[]
    def check(name,observed,expected,sources,events=None,assumptions=None):
        record=dict(name=name,observed=deepcopy(observed),expected=deepcopy(expected),sources=sources,
                    events=deepcopy(events or []),assumptions=assumptions or [],synthetic=True)
        record['status']='PASS' if observed==expected else 'FAIL';cases.append(record)
        assert observed==expected,(name,observed,expected)
    sready='FirmnessReadyState ctor/MakeRequest/RunTick; FirmnessStateFactory.CreateReadyState'
    c=Config();a=Ready('old',c);a.enqueue('target','pending');b=Ready('new',c,'connection-B')
    check('new_ready_does_not_import_old_queue',[a.queue,b.queue,b.config.ram['target']],[[('target','pending')],[],'old-target'],sready,a.events)
    a=Ready('old',c);a.enqueue('target','batch-target');a.request_calibration();a.begin_locked_api('coefficient_write');result=a.begin_tick()
    check('handoff_waits_existing_locked_write',[result,a.handed,a.lock_owner],['waiting',False,'coefficient_write'],sready+'; RunDeviceWrite',a.events)
    a.enqueue('mode','late-mode');a.finish_locked_api();result=a.try_handoff();b=Ready('after-calibration',c)
    check('late_request_remains_old_object_not_new_ready',[result,a.queue,b.queue],['Calibrating',[('mode','late-mode')],[]],sready,a.events,['Late enqueue occurs after current drain and before state replacement.'])
    check('locked_api_rejects_handed_off_old_ready',a.begin_locked_api('read_coefficients'),'CalibrationRunningException','RunDeviceWrite lock then handedOff check',a.events)
    a=Ready('pending',c);a.request_calibration()
    check('pending_flag_does_not_itself_block_locked_get',a.begin_locked_api('read_coefficients'),'started','CalibrationController.Get; RunDeviceWrite',a.events)
    check('pending_cancel_api_not_calibrating', 'BadRequest' if not a.handed else 'flag', 'BadRequest','CalibrationController.Cancel sees current FirmnessReadyState')
    a.begin_tick();a.cancelled=True;result=a.try_handoff()
    check('cancelled_handoff_wait_does_not_construct_calibration',[result,a.handed,a.queue,a.pending],['cancelled',False,[],True],'RunTick WaitAsync before handedOff assignment',a.events)
    a=Ready('normal',Config());a.enqueue('target','t1');a.enqueue('mode','m1');a.begin_locked_api('tolerance');a.begin_tick();a.start_selected_send()
    check('ordinary_target_send_is_not_guarded_by_deviceWriteLock',[a.lock_owner,a.inflight],['tolerance',('target','t1')],'OnRequest/SendFirmnessCommand vs RunDeviceWrite',a.events)
    a.cancelled=True;a.complete_send('OperationCanceledException caught');a.start_selected_send()
    check('mode_send_call_can_follow_caught_target_cancellation',[a.config.ram['mode'],a.inflight,a.events[-1]['token_cancelled']],['m1',('mode','m1'),True],'RunTick no intermediate cancellation check; SendFirmnessCommand catches Exception',a.events,['Only downstream call is asserted, not bytes transmitted.'])
    c=Config();a=Ready('disable',c);a.begin_locked_api('manual_coefficient_write');state=disable(c,a)
    check('disable_does_not_join_external_none_token_write',[state,a.cancelled,a.lock_owner],[{'public_state':'Null','returned':'void','joined':False},True,'manual_coefficient_write'],'FirmnessService.Disable; CalibrationController.Set(CancellationToken.None)',a.events)
    c=Config();a=Ready('save-failure',c);state=disable(c,a,False)
    check('disable_save_exception_prevents_state_reset',[c.ram['enabled'],c.disk['enabled'],a.cancelled,state['public_state']],[False,True,False,'Ready'],'PodConfigurationManager.UpdateConfiguration; FirmnessService.Disable',assumptions=['Save exception supplied, no filesystem failure induced.'])
    check('host_preserves_disabled_null_over_old_return',host_reconcile('NotConnected','Null',True),'Null','SubsystemHost finally')
    check('host_does_not_assume_public_null_is_always_authoritative',host_reconcile('Ready','Null',False),'Ready','SubsystemHost finally')
    check('cancelled_ready_base_closes_before_reconnect',ready_base_exit('Calibrating',True,True),{'close_requested':True,'next':'NotConnected'},'ReadyStateBase.GetNextState ThrowIfCancellationRequested before result')
    check('explicit_state_return_precedes_link_change_branch',ready_base_exit('Calibrating',True,False),{'close_requested':False,'next':'Calibrating'},'ReadyStateBase.GetNextState IL_019f..01d3',assumptions=['Link event arrives during RunTick; cancellation remains false.'])
    cal=Calibration();cal.batch=['first','second'];cal.start_precomputed_action();ret=cal.cancel()
    check('calibration_cancel_returns_before_inflight_completion',[ret,cal.inflight,cal.token_cancelled,cal.active],['Running','first',False,True],'CalibrationRunner.Cancel',cal.events)
    cal.complete_action();cal.start_precomputed_action()
    check('already_computed_actions_continue_until_next_advance',cal.inflight,'second','CalibrationRunner.Tick foreach actions',cal.events,['First send completion supplied; next Advance is not executed while this action is in flight.'])
    cal.complete_action()
    check('subsequent_advance_observes_cancel_flag',cal.advance_selected_running_phase(),'shutdown_or_restore','CalibrationRunner.Tick and selected state-machine Advance gate',cal.events,['Both supplied send completions occurred; cancellation-consuming running phase selected.'])
    cal.begin_abandon()
    check('abandon_is_awaited_not_immediate_state_replacement',cal.active,True,'CalibratingState.RunMonitorLoop finally; CalibrationRunner.AbandonAsync',cal.events)
    cal.supplied_finalize_completion();b=Ready('return',c,'same-connection')
    check('normal_finalize_then_new_ready',[cal.active,b.queue,b.connection],[False,[],'same-connection'],'FinalizeAsync then TickUntilDone CreateReadyState',cal.events)
    cal=Calibration();cal.supplied_finalize_completion(False)
    check('failed_record_save_does_not_prove_terminal_clear',cal.active,True,'FinalizeAsync SaveRecord before stateMachine=null',cal.events,['I/O exception supplied; no real disk error induced.'])
    c=Config();c.update('target','ram-new',False);b=Ready('reconnect',c)
    check('same_process_reconnect_uses_manager_ram',[b.config.ram['target'],c.disk['target']],['ram-new','old-target'],'Factory resolves singleton manager; Ready.LoadAndApplyStoredTargetFirmness',[],['A previous save failed after RAM assignment.'])
    snapshot=deepcopy(c.ram);c.update('mode','later-mode')
    check('target_and_mode_share_one_load_snapshot_but_not_entire_init',[snapshot['mode'],c.ram['mode']],['old-mode','later-mode'],'LoadAndApplyStoredTargetFirmness local configuration; separate tolerance/profile reads')
    check('ordinary_remove_rejects_calibrating_side',any(x=='Calibrating' for x in ['Ready','Calibrating']),True,'FirmnessController.DisableFirmness checks both sides')
    result=dict(status='PASS',case_count=len(cases),cases=cases,limits=[
      'Synthetic finite sequential/event schedules, not firmware execution, physical safety, runtime incidence or exhaustive interleaving proof.',
      'Send completion, cancellation delivery, lock acquisition and finalizer completion are explicit inputs; no task scheduler, SemaphoreSlim fairness or serial transport emulation.',
      'Queue last-of-kind selection is reused only to enter lifecycle branches; no new claim about throughput.',
      'A send_call is not proof of transmitted bytes, device ACK, pressure target reached or cancellation rollback.',
      'Calibration algorithm phases/fits are not reimplemented; only a cancellation-consuming running phase and supplied normal finalization are represented.'
    ])
    (O/'MODEL_RESULTS.json').write_text(json.dumps(result,ensure_ascii=False,indent=2)+'\n')
    print(json.dumps({'status':'PASS','cases':len(cases)}))
if __name__=='__main__':main()
