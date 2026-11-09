#!/usr/bin/env python3
"""Bounded shared-framer schedule model; no target, USB or IRQ execution.

The interrupt timing and preexisting ADC-full state are explicit fixtures.
CRC is the retained LSP CRC function; the outer body is the existing synthetic
377B baseline 0x3c fixture, the nested logs are synthetic. Actual callback acceptance and delayed consumption
are assumptions, not observed traffic. Only one preemption
between byte writes is modeled; there is no instruction-level CPU simulation.
"""
from pathlib import Path
import json
import sys, importlib.util
sys.dont_write_bytecode=True

OUT=Path(__file__).resolve().parents[1]
spec=importlib.util.spec_from_file_location('receiver',OUT/'vendor/receiver_model.py')
receiver=importlib.util.module_from_spec(spec);spec.loader.exec_module(receiver)
OUTER=(OUT/'fixtures/baseline-3c-body.bin').read_bytes()
assert len(OUTER)==377 and OUTER[0]==0x3c
LOG_TEXT=b'synthetic [sampling] overflow'
LOG_BODY=bytes([7,len(LOG_TEXT)])+LOG_TEXT
FAULT_TEXT=b'synthetic fault'
FAULT_BODY=bytes([7,len(FAULT_TEXT)])+FAULT_TEXT

def esc(data):
    return bytes(v for x in data for v in ((0x7d,x^0x20) if x in (0x7d,0x7e) else (x,)))

class SharedFramer:
    def __init__(self):
        self.slots=[bytearray(1024) for _ in range(32)]
        self.status=[1]*32
        self.selected=None
        self.offset=0
        self.submissions=[]
        self.events=[]
    def log(self,op,**kw):self.events.append(dict(op=op,selected=self.selected,offset=self.offset,**kw))
    def begin(self,name,length):
        # c4c0 reads status; c764 does not reserve or save old framer globals.
        self.selected=next(i for i,status in enumerate(self.status) if status!=0)
        self.log('select_without_reservation',name=name,status=self.status[self.selected])
        self.byte(0x7e,name)
        for x in esc(length.to_bytes(2,'big')):self.byte(x,name)
    def byte(self,value,name):
        # Selected cases remain below 1024; the full-slot path is not exercised.
        assert 0<=self.offset<1024
        self.slots[self.selected][self.offset]=value
        self.log('write',name=name,value=value)
        self.offset+=1
    def finish(self,name,body):
        for x in esc(receiver.crc16(body).to_bytes(2,'big')):self.byte(x,name)
        # d6fc accepts and holds the original pointer; no PMA consumption modeled.
        n=self.offset
        self.submissions.append({'name':name,'slot':self.selected,'length':n,
                                 'at_submit_hex':bytes(self.slots[self.selected][:n]).hex()})
        self.status[self.selected]=0
        self.log('accepted_pointer_submission',name=name,length=n)
        self.offset=0 # 29254 after callback, no selected-pointer restore
    def send(self,name,body):
        self.begin(name,len(body))
        for x in esc(body):self.byte(x,name)
        self.finish(name,body)
    def sampling_irq(self,adc_full):
        self.log('sampling_irq_fixture',adc_queue_full=adc_full,tick_regression=False)
        if adc_full:self.send('overflow-log',LOG_BODY)
        self.log('sampling_irq_returns')
    def result(self):
        records=[]
        for r in self.submissions:
            r=dict(r);r['current_hex']=bytes(self.slots[r['slot']][:r['length']]).hex()
            r['held_content_changed']=r['current_hex']!=r['at_submit_hex'];records.append(r)
        observations={}
        for field,label in [('at_submit_hex','copy_all_bytes_at_each_submit'),('current_hex','read_all_pointers_after_encoding')]:
            rx=receiver.Receiver()
            stream=b''.join(bytes.fromhex(r[field]) for r in records)
            rx.add(stream);rx.drain()
            observations[label]={'explicit_read_schedule_not_USB_simulation':True,'stream_hex':stream.hex(),
                'accepted':[{**item,'opcode':bytes.fromhex(item['hex'])[0]&0x7f} for item in rx.snapshot()['accepted']],
                'events':rx.events,'business_payload_acceptance':'not_checked_frame_layer_only'}
        return dict(submissions=records,events=self.events,final_offset=self.offset,
                    selected_slot=self.selected,slot_status=self.status,receiver_observations=observations)

def paused_outer():
    f=SharedFramer();body=OUTER;f.begin('outer-main',len(body))
    for x in body[:2]:f.byte(x,'outer-main')
    assert f.offset==5 and f.status[0]==1
    return f,body[2:]

def main():
    cases={}
    f=SharedFramer();f.send('main-1',OUTER);f.send('main-2',LOG_BODY)
    r=f.result();assert [x['slot'] for x in r['submissions']]==[0,1]
    assert not any(x['held_content_changed'] for x in r['submissions'])
    assert all(len(x['accepted'])==2 for x in r['receiver_observations'].values())
    cases['serial_calls']=r
    f,tail=paused_outer();f.sampling_irq(False)
    for x in esc(tail):f.byte(x,'outer-main')
    f.finish('outer-main',OUTER);r=f.result()
    assert len(r['submissions'])==1 and not r['submissions'][0]['held_content_changed']
    assert all(len(x['accepted'])==1 for x in r['receiver_observations'].values())
    cases['sampling_irq_no_overflow_no_time_regression']=r
    f,tail=paused_outer();f.sampling_irq(True)
    assert f.offset==0 and f.selected==0 and f.status[0]==0
    for x in esc(tail):f.byte(x,'outer-main')
    f.finish('outer-main',OUTER);r=f.result()
    assert [x['slot'] for x in r['submissions']]==[0,0]
    assert bytes.fromhex(r['submissions'][0]['at_submit_hex'])[5]==0x7e
    assert r['submissions'][0]['held_content_changed']
    assert bytes.fromhex(r['submissions'][1]['at_submit_hex'])==esc(tail)+esc(receiver.crc16(OUTER).to_bytes(2,'big'))
    assert [x['opcode'] for x in r['receiver_observations']['copy_all_bytes_at_each_submit']['accepted']]==[7]
    assert r['receiver_observations']['read_all_pointers_after_encoding']['accepted']==[]
    cases['adc_full_irq_during_encoding_then_resume']=r
    f,tail=paused_outer();f.send('fault-log',FAULT_BODY)
    f.log('fault_path_nonreturn_fixture');r=f.result()
    assert len(r['submissions'])==1 and not r['submissions'][0]['held_content_changed']
    assert bytes.fromhex(r['submissions'][0]['at_submit_hex'])[5]==0x7e
    assert all([x['opcode'] for x in obs['accepted']]==[7] for obs in r['receiver_observations'].values())
    cases['fault_path_does_not_resume_outer']=r
    result={'status':'PASS','case_count':len(cases),'scope':'conditional shared-memory schedules only',
        'assumptions':['framer initialized; available slot exists','ADC-full state and interrupt arrival explicitly supplied',
         'one preemption between byte writes','callback accepts pointer; consumption time fixed separately by each observation',
         'fixed two-byte length; real LSP CRC; retained synthetic 377B 0x3c plus synthetic logs; all frames below 1024',
         'two explicit whole-pointer read schedules; actual PMA reading times unknown',
         'ADC-full state not derived from production/consumption of retained outer 0x3c fixture',
         'no timeout, GPIO, ISR priority, USB, hardware or cloud execution'], 'cases':cases}
    (OUT/'MODEL_RESULTS.json').write_text(json.dumps(result,ensure_ascii=False,indent=2)+'\n')
    print(json.dumps({k:v for k,v in result.items() if k!='cases'}))

if __name__=='__main__':main()
