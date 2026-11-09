#!/usr/bin/env python3
"""Read-only probes of existing Python contracts; output confined to this review.
Not MCU execution, not independent oracle for firmware algorithms.
"""
import sys
sys.dont_write_bytecode=True
from pathlib import Path
import importlib.util,struct,json,hashlib
R=Path('/Users/dangbei/Downloads/eightsleep-firmware-research-20261107')
A=R/'analysis';O=Path(__file__).resolve().parents[1]
def load(name,p):
 spec=importlib.util.spec_from_file_location(name,p);m=importlib.util.module_from_spec(spec);sys.modules[name]=m;spec.loader.exec_module(m);return m
prev=load('previous_model',A/'finishable-20261107/host-model/previous_model.py')
host=load('review_host_model',A/'finishable-20261107/host-model/model.py')
parser=load('review_wire_parser',A/'finishable-20261107/cbor-encoder/host_signal_parser.py')
queue=load('review_queue',A/'prepublish-queue-20261108/model/model.py')
results=[]
def record(name,**kw):results.append({'case':name,'synthetic':True,**kw})
def wire(body):
 raw=len(body).to_bytes(2,'big')+body+parser.lsp_crc(body).to_bytes(2,'big')
 return b'\x7e'+b''.join(bytes((0x7d,b^0x20)) if b in (0x7d,0x7e) else bytes((b,)) for b in raw)
def payload(freq=500,flags=0x2200):
 return struct.pack('>IHH',10000,flags,freq)+b''.join(struct.pack('>16i',*(i*100+j for j in range(16))) for i in range(5))+struct.pack('>24h',*range(-12,12))
x=parser.parse_lsp(wire(b'\xbc'+payload()),side='left')[0]['stealth']
assert all(s['adc'][:8]==[None]*8 for s in x['samples'])
assert [g is None for g in x['imu_groups_wire_order']]==[True,False,True,True]
assert all('imu' not in s and 'version' not in s for s in x['samples'])
assert [s['device_tick_ms'] for s in x['samples']]==[10000,10002,10004,10006,10008]
record('parser_adapter_fields',flags=x['flags'],sample_keys=sorted(x['samples'][0]),tick_sequence=[s['device_tick_ms'] for s in x['samples']],disabled_adc_slots=8,disabled_imu_groups=3,adapter_must_supply=['ADC sentinel','flattened/shared 24 IMU values and sentinels','version=flags16','capture side','host wall now'])
try:parser.parse_usb(payload()+b'\x00')
except ValueError as e:record('strict_length_reject',error=str(e),not_firmware_rejection_proof=True)
else:raise AssertionError('expected strict rejection')
y=parser.parse_usb(payload(freq=333));assert y['sample_step_ms_integer']==3
record('non500_parser_only',frequency=333,tick_step=3,host_model_fixed_slot_ms=2,encoder_fixed_adc_frequency=500,integration_should_reject_or_out_of_scope=True)
p=host.Pipeline(enabled=(True,False),compat=False,auto_flush=False)
p.ingest(0,10000,1700000000,source='omitted-fields')
s=p.samples['omitted-fields/real'];assert s.adc==tuple(range(16)) and s.imu==tuple(range(24)) and s.version==1
record('unsafe_defaults_are_values',adc=list(s.adc),imu=list(s.imu),version=s.version,warning='Omission fabricates model default payload; adapter must never omit actual fields')
p=host.Pipeline(enabled=(True,False),compat=False,auto_flush=False)
adc=tuple([-1]*8+list(range(8,16)));imu=tuple(range(-12,12))
for i in range(500):p.ingest(0,10000+2*i,1700000000,source=f'explicit-{i}',adc=adc,imu=imu,version=0xf200 if i<499 else 0xf300)
p.set_gains(0,buzzer=[800]*5)
p.flush();body=p.wire_payloads[-1]['stealth'];decoded=parser.parse_cbor(body,samples=True)
assert len(decoded)==2 and decoded[0]['record']['left']['version']==0xf300 and decoded[0]['record']['right']['version']==0xf300
assert decoded[0]['record']['left']['gain']==[800]*5 and decoded[0]['record']['right']['gain']==[400]*5
assert decoded[0]['record']['left']['data'][0]==[8]*500
assert decoded[1]['record']['left'][0]['gyro']['x']==[-12]*100
assert all(v is None for v in decoded[0]['record']['right']['data'][0])
record('explicit_payload_metadata_cbor',cbor_objects=[d['record']['type'] for d in decoded],body_bytes=len(body),body_sha256=hashlib.sha256(body).hexdigest(),last_accepted_version=0xf300,left_gain=[800]*5,missing_side_gain=[400]*5,missing_side_version_mirrored=True,imu_points_per_channel=100,buzzer_points_per_channel=500)
p=host.Pipeline(enabled=(True,False),compat=False,auto_flush=False)
for i in range(11):p.offer(host.Sample(f'cap-{i}',f'cap-{i}',0,1700000000+i,0,adc=adc,imu=imu,version=0xf200))
assert len(p.outputs)==len(p.wire_payloads)==1 and len(p.buckets[0])==10
record('auto_flush_false_still_capacity_flush',outputs=len(p.outputs),pending_buckets=len(p.buckets[0]),reason='inherited offer capacity branch flushes independently of auto_flush')
p=host.Pipeline(enabled=(True,False),compat=False)
f=p.flush();assert f['load'] is None and len(p.wire_payloads)==1 and p.wire_payloads[0]['stealth']
record('empty_flush_still_creates_cbor',load=None,cbor_objects=len(parser.parse_cbor(p.wire_payloads[0]['stealth'])),epoch=0,should_not_force_drain_empty_pipeline=True)
w=queue.Worker()
for i in range(15):assert w.queues[0].enqueue(queue.Record(f'external-{i}',b'raw.fixture.external',b'preload'))
c=queue.RawCaller(w)
assert c.flush('candidate-A',b'raw.x.sens.stealth',body)
assert not c.flush('candidate-B',b'raw.x.sens.stealth',body)
assert len(w.queues[0].records())==16 and c.sequence==2 and w.queues[0].records()[-1].record_id=='candidate-A'
record('queue_capacity_is_body_count',externally_preloaded_records=15,raw_capacity=16,candidate_A_accepted=True,candidate_B_rejected=True,caller_sequence_after_two=2,one_stealth_body_cbor_objects=2)
w=queue.Worker();c=queue.RawCaller(w);assert c.flush('retry-same',b'raw.x.sens.stealth',body)
w.connection_result(True);assert w.step(queue.PublishObservation(1,possible_remote_accept='scenario_may_have_accepted'))=='js_failure'
assert w.queues[0].peek().body==body and c.sequence==1
w.connection_result(True);assert w.step(queue.PublishObservation(0))=='js_success';assert not w.queues[0].records() and c.sequence==1
record('retry_does_not_reencode_or_readmit',publish_attempts=2,caller_sequence=1,unchanged_body_sha256=hashlib.sha256(body).hexdigest(),remote_acceptance='unknown; failure fixture may have accepted',ack_observed=None)
(O/'PROBE_RESULTS.json').write_text(json.dumps({'kind':'existing Python contract probes, not firmware oracle','cases':len(results),'passed':True,'results':results},ensure_ascii=False,indent=2)+'\n')
print(json.dumps({'cases':len(results),'passed':True}))
