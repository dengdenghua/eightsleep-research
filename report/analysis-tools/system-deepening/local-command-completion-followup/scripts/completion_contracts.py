#!/usr/bin/env python3
"""Finite, analyst-authored event model; does not execute the shipped DLL."""
from pathlib import Path
from copy import deepcopy
import json

O=Path(__file__).resolve().parents[1]
cases=[]
def check(name,observed,expected,source):
    assert observed==expected,(name,observed,expected)
    cases.append(dict(name=name,observed=deepcopy(observed),expected=deepcopy(expected),source=source,status='PASS'))

class Link:
    def __init__(self):
        self.pending={};self.gates={};self.sent=[];self.reading=True
    def enter(self,opcode,request,budget=500,spent=0,cancel=False):
        if opcode in self.gates:
            return 'cancelled-in-queue' if cancel else 'queued'
        self.gates[opcode]=request
        if budget-spent<=0:
            del self.gates[opcode];return 'budget-exhausted'
        self.pending[opcode]=(request,budget-spent)
        self.sent.append(request)
        # Explicit schedule: token cancelled, no response completed before WaitAsync.
        if cancel:
            self.finish(opcode,request);return 'cancelled-after-send'
        return 'waiting-response'
    def response(self,opcode):
        item=self.pending.pop(opcode,None)
        return item[0] if item else None
    def remove_pair(self,opcode,request):
        item=self.pending.get(opcode)
        if item and item[0]==request:del self.pending[opcode]
    def finish(self,opcode,request):
        self.remove_pair(opcode,request)
        assert self.gates.get(opcode)==request
        del self.gates[opcode]
    def stop(self):self.reading=False

S='Connection.SendCommand / ResolveRequest / ExpireRequests / StopAsync'
x=Link();check('first_call_sends_then_waits',x.enter(0x52,'A'),'waiting-response',S)
check('same_opcode_queues',x.enter(0x52,'B'),'queued',S)
check('different_opcode_can_be_pending',x.enter(0x54,'M'),'waiting-response',S)
check('same_opcode_not_sent_while_gate_owned',x.sent,['A','M'],S)
check('unmatched_opcode_does_not_resolve',x.response(0x53),None,S)
check('matching_response_selects_pending_opcode',x.response(0x52),'A',S)
check('gate_stays_owned_until_sender_finally',x.enter(0x52,'B'),'queued',S)
x.finish(0x52,'A');check('released_gate_allows_next',x.enter(0x52,'B',spent=120),'waiting-response',S)
check('queue_time_deducted_from_response_budget',x.pending[0x52],('B',380),S)
x.finish(0x52,'B');check('budget_exhausted_does_not_send',x.enter(0x52,'C',spent=500),'budget-exhausted',S)
check('budget_failure_sent_list_unchanged',x.sent,['A','M','B'],S)
y=Link();check('already_cancelled_free_gate_still_sends',y.enter(0x52,'cancelled',cancel=True),'cancelled-after-send',S)
check('cancelled_request_not_retracted',y.sent,['cancelled'],S)
check('cancel_finally_removes_pending',y.pending,{},S)
y.enter(0x52,'held');check('cancelled_contended_request_not_sent',y.enter(0x52,'queued-cancel',cancel=True),'cancelled-in-queue',S)
check('contention_cancel_sent_list',y.sent,['cancelled','held'],S)
z=Link();z.enter(0x52,'old');z.finish(0x52,'old')
check('late_response_without_waiter_discarded',z.response(0x52),None,S)
z.enter(0x52,'new')
# A genuine old reply delayed until this point contains only opcode correlation.
check('conditional_late_reply_matches_new_same_opcode',z.response(0x52),'new',S)
z.finish(0x52,'new');z.enter(0x52,'current');z.remove_pair(0x52,'stale')
check('identity_matched_cleanup_keeps_new_pending',z.pending[0x52][0],'current',S)
z.stop();check('stop_has_no_explicit_pending_failure',z.pending[0x52][0],'current',S)
fresh=Link();check('new_connection_has_separate_pending_dictionary',fresh.pending,{},S)
def session_result(code,body):return ('return',body) if code==0 else ('DeviceCommunicationException',code)
check('ACK_returns_body_after_status',session_result(0,b'readback'),('return',b'readback'),'DeviceSession.SendCommand')
check('NAK_throws',session_result(1,b''),('DeviceCommunicationException',1),'DeviceSession.SendCommand')
check('unsupported_throws',session_result(2,b''),('DeviceCommunicationException',2),'DeviceSession.SendCommand')

def normalize(x):
    if isinstance(x,bytes):return {'bytes_hex':x.hex()}
    if isinstance(x,tuple):return [normalize(i) for i in x]
    if isinstance(x,list):return [normalize(i) for i in x]
    if isinstance(x,dict):return {str(k):normalize(v) for k,v in x.items()}
    return x
out=normalize(dict(status='PASS',case_count=len(cases),cases=cases,limits=[
    'Explicit normal response timing only; not a CLR scheduler or serial hardware simulator.',
    'Late reply case assumes the old real reply arrives after a same-opcode successor registers; actual occurrence not observed.',
    'Cancellation case assumes response has not already completed before cancellable wait.',
    'No claims about physical-layer write atomicity, device completion, malicious input or real frequency.'
]))
(O/'MODEL_RESULTS.json').write_text(json.dumps(out,ensure_ascii=False,indent=2)+'\n')
assert all(c['observed']==c['expected'] for c in out['cases'])
print(json.dumps(dict(status='PASS',cases=len(cases))))
