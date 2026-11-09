#!/usr/bin/env python3
"""Synthetic boundary cases with source-specific expected outcomes."""
from pathlib import Path
import json,struct,sys
from model import Pipeline,Sample,Timing,Shared,U32,production_pairs,ADC_MISSING,IMU_MISSING

O=Path(__file__).resolve().parent;E=1700000000
cases={};traces={}
sys.path.insert(0,str(O.parent/'cbor-encoder'))
from host_signal_parser import CBORReader
def decode(blob):
    reader=CBORReader(blob);obj=reader.read();assert reader.pos==len(blob);return obj
def sample(side,slot,epoch=E,tag=None):
    t=tag or f'{side}:{epoch}:{slot}'
    return Sample(t,t,side,epoch,slot*2,adc=tuple(side*100000+slot*100+i for i in range(16)),
                  imu=tuple(side*1000+slot*25+i for i in range(24)))
def put(p,side,slots,epoch=E):
    for i in slots:p.offer(sample(side,i,epoch))
def save(name,p,expect,category='synthetic_input'):
    cases[name]={'category':category,'checked_behavior':expect,'observed':p.audit()}
    traces[name]=p.evidence()
def realpoints(o,name):return [r for r in o['encoded']['streams'][name]['points'] if r['token']]

# All buffer channel routes, sentinel schemas and 500Hz -> 100Hz IMU selection.
p=Pipeline(auto_flush=False)
put(p,0,range(500));put(p,1,range(500));o=p.flush()
assert o['load']['break_at'] is None
assert o['load']['attempts']=={'buzzer':500,'imu':100,'extadc':500,'multi':500}
assert len(realpoints(o,'buzzer'))==1000 and len(realpoints(o,'imu'))==200
for n in ('buzzer','imu','multi','extadc'):
    for r in realpoints(o,n):
        src=p.samples[r['token']]
        expected=list(src.imu) if n=='imu' else list(src.adc[8:13]) if n=='buzzer' else list(src.adc[14:]) if n=='multi' else [src.adc[13],src.adc[13]]
        assert r['values']==expected
assert all(p.buffers[n].epoch==0 and not p.buffers[n].rows for n in p.buffers)
save('complete_dual_channel_routes',p,'Both sides: buzzer ADC8..12, IMU24 axes only index%5==0, multi ADC14/15, extADC13 copied to arrays(0,2)/(1,3).')

# Real caller mapping + duplicated full current payload crossing a second.
p=Pipeline(enabled=(True,False),auto_flush=False)
p.ingest(0,10000,E,'anchor');p.ingest(0,10996,E,'before')
p.ingest(0,11000,E+1,'after',adc=range(100,116),imu=range(200,224))
assert p.buckets[0][E+1][499].token=='after/copy'
assert p.samples['after/copy'].adc==p.samples['after/real'].adc
p.flush();p.flush()
assert p.disposition['after/copy']=='loader_unvisited_bucket_deleted'
save('cross_second_copy',p,'Current epoch is unchanged in copy, relative-2 selects slot499 of next-second bucket; early break later deletes it.')

# Leading default epoch0 can accept peer data, then overwrite its slot0.
p=Pipeline(auto_flush=False)
put(p,0,[1,2]);put(p,1,[0,1,2]);o=p.flush()
assert o['load']['primary']==0 and o['load']['break_at']==3
assert p.contributions[f'1:{E}:0'][0]['event']=='staged'
assert any(c['event']=='output_overwritten' and c['stream']=='imu' for c in p.contributions[f'1:{E}:0']) is False
# Initial IMU only runs index0; primary epoch0 -> IMU output epoch0 with real peer.
assert o['encoded']['streams']['imu']['epoch']==0
assert realpoints(o,'imu')[0]['token']==f'1:{E}:0'
save('leading_primary_hole_peer_epoch_zero',p,'Default primary index0 can stage peer IMU with output epoch0; subsequent primary timestamps do not repair that IMU metadata.')

# Primary hole cannot be rescued by full secondary bucket.
p=Pipeline(auto_flush=False);put(p,0,[0,2,3]);put(p,1,[0,1,2,3]);o=p.flush()
assert o['load']['break_at']==1 and o['load']['break_mask']==13
assert len(realpoints(o,'buzzer'))==2 and p.disposition[f'1:{E}:1']=='loader_visited_no_stream_accepted'
assert p.disposition[f'1:{E}:2']=='loader_unvisited_bucket_deleted'
save('paired_primary_hole',p,'At index1 buzzer/extADC/multi reject epoch0; both side buckets removed including later valid peer records.')

# Every independent stale buffer can stop traversal after other buffers already write.
for n,mask in [('buzzer',1),('imu',2),('extadc',4),('multi',8)]:
    for paired in (False,True):
        p=Pipeline(enabled=(True,True) if paired else (True,False),auto_flush=False)
        put(p,0,[0,1,5]);
        if paired:put(p,1,[0,1,5])
        p.buffers[n].epoch=E-1;p.buffers[n].flags=0
        o=p.flush()
        assert o['load']['break_at']==0 and o['load']['break_mask']==mask
        for other in p.buffers:
            expected=0 if other==n else (2 if paired else 1)
            assert len(realpoints(o,other))==expected
        assert p.disposition[f'0:{E}:1']=='loader_unvisited_bucket_deleted'
        save(f'stale_{n}_{"dual" if paired else "single"}',p,
             f'{n} rejects at index0; the other three streams still accept index0, then the rest is deleted.',
             'injected_buffer_boundary_state_not_observed_device_fault')

# flags!=0 with matching nonzero epoch rejects; epoch0 explicitly clears flags.
p=Pipeline(enabled=(True,False),auto_flush=False);put(p,0,[0,1])
p.buffers['imu'].epoch=E;p.buffers['imu'].flags=1;o=p.flush()
assert o['load']['break_mask']==2
save('nonzero_flags_same_epoch',p,'Matching epoch does not bypass nonzero flags; other buffers still get first record.','injected_buffer_boundary_state_not_observed_device_fault')

# compat disabled restricts the cascade to buzzer and IMU.
for stale in ('buzzer','imu'):
    p=Pipeline(enabled=(True,False),auto_flush=False,compat=False);put(p,0,range(7))
    p.buffers[stale].epoch=E-1;p.buffers[stale].flags=0;o=p.flush()
    assert set(o['encoded']['streams'])=={'buzzer','imu'} and o['load']['break_at']==0
    assert len(realpoints(o,'buzzer' if stale=='imu' else 'imu'))==1
    save('compat_off_'+stale,p,'At index0 both buffer attempts occur; extADC/multi are disabled.',
         'injected_buffer_boundary_state_not_observed_device_fault')

# Secondary destination uses primary relative even if peer relative differs in slot.
p=Pipeline(auto_flush=False)
p.offer(Sample('left','left',0,E,0));p.offer(Sample('right','right',1,E,1));o=p.flush()
r=next(r for r in realpoints(o,'buzzer') if r['side']==1)
assert r['slot']==0 and r['source_relative']==1
save('secondary_uses_primary_timestamp',p,'Peer payload is placed at primary destination; no correlation or independent peer timestamp in loader.')

# Internal codec error drops whole stealth body but still resets all encoders.
p=Pipeline(enabled=(True,False),auto_flush=False);put(p,0,range(500));o=p.flush(fail_streams=('imu',))
assert not o['encoded']['stealth_body_ok']
assert all(not o['encoded']['streams'][n]['body_available'] for n in ('buzzer','imu','multi'))
assert o['encoded']['streams']['extadc']['body_available']
assert all(not b.rows and b.epoch==0 for b in p.buffers.values()) and p.watermark==E
p.offer(sample(0,1,E,'late'))
assert p.disposition['late']=='watermark_skip'
save('encoder_failure_no_restore',p,'Injected IMU bool failure invalidates combined body; extADC remains separate; reset and watermark are not rolled back.','injected_encoder_return')

# Production reciprocal masks, delayed consume and separate pillow allocation.
pairs=production_pairs(auto_flush=False);p=pairs['sensor'];q=pairs['pillow']
p.ingest(0,10000,E,'Linit');p.ingest(1,10000,E,'Rinit')
m=p.ingest(0,0,E,'Lreset');assert 'drift_gt_2s' in m['reasons'] and p.shared.bits==2
assert q.shared.bits==0 and q.shared is not p.shared
for i in range(1,1000):
    m=p.ingest(1,10000+i*2,E+(i*2)//1000,f'R{i}')
    assert 'shared_request' not in m['reasons']
m=p.ingest(1,12000,E+2,'Rcheck')
assert m['reasons']==['shared_request'] and p.shared.bits==0
save('production_masks_delayed_consume_pair_isolation',p,'Actual ELF masks left(1,2)/right(2,1); consume at check1000; pillow has separate shared allocation.')

# Existing bucket/watermark recovery behavior remains connected to new loader.
p=Pipeline(enabled=(True,False),auto_flush=False)
p.offer(sample(0,0,E+100,'initial'));p.flush()
p.timing[0]=Timing(p.shared,1,2,previous=10000,initialized=True,count=999,anchor_epoch=E+100,anchor_tick=10000)
for i in range(501):p.ingest(0,12000+i*2,E+60+(i*2)//1000,f'rollback:{i}')
assert sum(d=='old_500_reset' for d in p.disposition.values())==1
assert p.disposition['rollback:500/real']=='pending'
save('clock_rollback_queue_recovery',p,'500 severely old attempts clear watermark/buckets; next epoch can re-enter.')

p=Pipeline(auto_flush=False)
for i in range(10):p.offer(sample(0,0,E+i,'k'+str(i)))
p.offer(sample(0,0,E+10,'eleventh'))
assert len(p.outputs)==1 and p.disposition['eleventh']=='pending' and len(p.buckets[0])==10
save('capacity_retry',p,'Capacity return causes one flush and one retry; missing peer uses single loader.')

p=Pipeline(enabled=(True,False),auto_flush=False)
p.ingest(0,U32-255,E,'wrap-init');p.ingest(0,U32-1,E,'wrap-before');m=p.ingest(0,0,E,'wrap-after')
assert m['relative']==256 and not m['reasons']
save('unsigned_tick_wrap',p,'Tick regression triggers check; uint32 delta remains256, no unnecessary rebase.')

p=Pipeline(enabled=(True,False),auto_flush=False)
p.offer(sample(0,0,E,'old'));p.offer(Sample('new','new',0,E,1));p.flush()
p.offer(sample(0,1,E,'late'))
assert p.disposition['old']=='input_slot_overwritten' and p.disposition['late']=='watermark_skip'
save('slot_overwrite_watermark_skip',p,'Two relative values in same slot replace input; consumed epoch rejects late arrival.')

# Controlled normal coroutine interleaving, CAS contention and timer retry boundary.
p=Pipeline(auto_flush=False)
for epoch in range(E,E+3):
    put(p,0,[0],epoch);put(p,1,[0],epoch)
a=p.begin_offer(sample(0,0,E+3,'A'));b=p.begin_offer(sample(1,1,E+3,'B'))
assert p.jobs[a]['state']==p.jobs[b]['state']=='waiting'
assert p.poll_gate(a,100)=='acquired'
assert p.poll_gate(b,100)=='waiting'
assert p.poll_gate(b,50099)=='timer_pending'
p.resume_offer(a)
assert p.jobs[a]['state']=='done' and [len(x) for x in p.buckets]==[3,2]
assert p.poll_gate(b,50100)=='acquired'
c=p.begin_offer(sample(1,2,E+3,'C'))
assert p.jobs[c]['state']=='done' and p.gate_owner==b  # enqueue path does not acquire flush gate
p.resume_offer(b)
assert len(p.loads)==2 and p.jobs[b]['state']=='done' and p.gate_owner is None
assert [o['bucket'] for o in p.loads]==[E,E+1]
save('coroutine_contended_wait_and_ungated_enqueue',p,
     'Second await CAS retries only after50000ticks; it flushes on resume even if threshold changed; ordinary enqueue can occur while flush gate is held.',
     'controlled_scheduler_normal_path_not_measured_runtime_timing')

# Preflush coroutine loops after resume rather than single unconditional insertion.
p=Pipeline(enabled=(True,False),auto_flush=False)
for epoch in range(E,E+5):put(p,0,[0],epoch)
j=p.begin_offer(sample(0,0,E+5,'pending-job'))
for expected in (4,3,2):
    assert p.poll_gate(j)=='acquired';p.resume_offer(j)
    if expected>=3:assert p.jobs[j]['state']=='waiting' and len(p.buckets[0])==expected
assert p.jobs[j]['state']=='done' and len(p.loads)==3 and len(p.buckets[0])==3
save('coroutine_preflush_recheck_loop',p,'5 pending buckets require3 completed preflush awaits before insertion brings count back to3.')

p=Pipeline(enabled=(True,False),auto_flush=False)
for epoch in range(E,E+3):put(p,0,[0],epoch)
a=p.begin_offer(sample(0,0,E+3,'owner'));b=p.begin_offer(sample(0,1,E+3,'wait-error'))
p.poll_gate(a);p.poll_gate(b);p.fail_wait(b)
assert p.gate_owner==a and len(p.loads)==0 and p.disposition['wait-error']=='wait_exception_before_enqueue'
p.resume_offer(a)
save('wait_exception_before_acquire',p,'A timer error before gate acquisition does not flush/enqueue the waiting record or release another job gate.',
     'injected_timer_exception_data_plane_only')

# Fully integrated normal mapper/autoflush path remains reproducible.
p=Pipeline()
for i in range(1501):
    for side in (0,1):p.ingest(side,10000+i*2,E+(i*2)//1000,f'{side}:{i}')
assert p.loads[0]['paired'] and p.loads[0]['primary']==0
assert len([r for r in p.outputs[0]['streams']['buzzer']['points'] if r['token']])==1000
save('dual_contiguous_mapping_queue_loader',p,'Mapping, automatic flush, dual selection and all four buffers run together on3002 synthetic records.')

# Metadata observed by loader belongs to current side configuration, not sample time.
p=Pipeline(enabled=(True,False),auto_flush=False)
s=sample(0,0,tag='gain-old-payload');s.version=7;p.offer(s)
p.set_gains(0,buzzer=[1,23,24,32768,65535],multi=[32768,65535],extadc=1234)
p.flush();wire=p.wire_payloads[0]
b=decode(wire['buzzer']);m=decode(wire['multi']);im=decode(wire['imu']);e=decode(wire['extadc'])
assert b['left']['gain']==[1,23,24,-32768,-1] and b['right']['gain']==[400]*5
assert [b['left']['version'],b['right']['version']]==[7,7]
assert m['left']['gain']==[32768,65535] and m['right']['gain']==[400]*2
assert [im['lver'],im['rver']]==[7,7]
assert e['adc']==0x41 and e['gain']==1234 and 'left2' not in e and 'right2' not in e
assert struct.unpack_from('<i',b['left']['data'][0])[0]==8
save('metadata_to_real_cbor_gain_signedness',p,'Gain updated after enqueue is read at load; buzzer int16 signed vs multi uint16; single-side versions mirrored; extADC0x41 emits only left1/right1.')
fixtures=O/'fixtures';fixtures.mkdir(exist_ok=True)
for name,payload in wire.items():
    if payload is not None:(fixtures/('integrated-'+name+'.cbor')).write_bytes(payload)

p=Pipeline(enabled=(False,True),auto_flush=False)
s=sample(1,0,tag='R-only');s.version=33;p.offer(s)
p.set_gains(1,buzzer=[200,201,202,203,204],multi=[300,301],extadc=600)
o=p.flush()
assert o['encoded']['streams']['extadc']['metadata']['gains']==[600,600]
b=decode(p.wire_payloads[0]['buzzer'])
assert b['left']['gain']==[400]*5 and b['right']['gain']==[200,201,202,203,204]
assert b['left']['version']==b['right']['version']==33
save('right_only_metadata_defaults_and_extadc_mirror',p,'Missing-side buzzer/multi gains stay400; extADC uses selected right gain on both metadata positions; versions mirror selected side.')

p=Pipeline(auto_flush=False)
for side in (0,1):
    for slot in range(6):
        s=sample(side,slot);s.version=(7+side if slot<5 else 9+side);p.offer(s)
o=p.flush()
for name in ('buzzer','imu','multi'):assert o['encoded']['streams'][name]['metadata']['versions']==[9,10]
assert o['load']['break_at']==6
assert decode(p.wire_payloads[0]['buzzer'])['left']['version']==9
assert any(e.get('event')=='buffer_metadata_changed' and e.get('index')==5 for e in p.events)
save('version_changes_do_not_split_bucket',p,'Version metadata changes at accepted slots without splitting; final version labels arrays containing earlier-version source points.')

p=Pipeline(enabled=(True,False),auto_flush=False)
s=sample(0,0);s.version=88;p.offer(s)
p.set_gains(0,buzzer=[500]*5,multi=[600]*2,extadc=700)
p.buffers['buzzer'].epoch=E-1;p.buffers['buzzer'].flags=0
o=p.flush()
assert o['encoded']['streams']['buzzer']['metadata']['versions']==[1,1]
assert o['encoded']['streams']['buzzer']['metadata']['gains']==[[400]*5,[400]*5]
assert o['encoded']['streams']['multi']['metadata']['versions']==[88,88]
save('rejected_buffer_preserves_own_metadata',p,'Rejected buzzer retains old metadata; accepted other streams latch current side version/gains.','injected_buffer_boundary_state')

p=Pipeline(enabled=(True,False),auto_flush=False);put(p,0,[0]);p.set_gains(0,buzzer=[700]*5);p.flush()
assert p.buffers['buzzer'].metadata['gains'][0]==[700]*5
assert p.buffers['extadc'].metadata['adc']==0x41
p.flush()
assert decode(p.wire_payloads[1]['buzzer'])['ts']==0 and decode(p.wire_payloads[1]['buzzer'])['left']['gain']==[700]*5
save('encoding_reset_keeps_metadata',p,'Encoder clears timestamp/count/data while version/gain persist, including an empty subsequent encode.')

for acquire in (False,True):
    p=Pipeline(enabled=(True,False),auto_flush=False)
    for epoch in range(E,E+3):put(p,0,[0],epoch)
    a=p.begin_offer(sample(0,0,E+3,'cancelled'))
    if acquire:p.poll_gate(a)
    p.cancel_offer(a)
    assert p.gate_owner==(a if acquire else None) and len(p.loads)==0
    b=p.begin_offer(sample(0,1,E+3,'next'))
    assert p.poll_gate(b)==('waiting' if acquire else 'acquired')
    save('cancel_'+('after' if acquire else 'before')+'_gate_acquire',p,
         'Explicit outer destructor does not release a CAS already acquired; before-acquisition cancellation leaves gate free.',
         'controlled_destroy_boundary_not_live_scheduler_reachability')

p=Pipeline(auto_flush=False)
for epoch in range(E,E+3):put(p,0,[0],epoch);put(p,1,[0],epoch)
j=p.begin_offer(sample(0,0,E+3,'allocation-failure'));p.poll_gate(j)
p.fail_publish_allocation(j)
assert p.watermark==E and p.gate_owner==j
assert all(p.buffers[n].epoch==0 for n in ('buzzer','imu','multi'))
assert p.buffers['extadc'].epoch==E and p.buffers['extadc'].rows
assert 'extadc' not in p.outputs[-1]['streams']
assert not p.outputs[-1]['extadc_independent_body']
assert p.outputs[-1]['publish_allocation']=='injected_failure_before_NATS_queue'
save('post_encoder_allocation_throw_then_destroy',p,'At explicit post-encode bad_alloc point, main buffers/buckets are already consumed; extADC remains loaded because separate flush never runs; destroy does not release gate.',
     'injected_existing_throw_branch_and_explicit_destructor')

result={'kind':'offline_python_reconstruction_NOT_original_binary_execution','passed':True,'case_count':len(cases),'cases':cases,
        'limits':['External scheduler ordering is supplied; hardware concurrency/fairness is not measured.',
                  'Synthetic actual-format CBOR is independently decoded; no original binary execution, publish ACK, cloud processing or device capture.',
                  'Buffer adverse states and codec failures are explicit injected boundary conditions.',
                  'Controlled outer destruction and explicit post-encode bad_alloc are covered; no proof of live scheduler cancellation frequency or arbitrary C++ unwinding.']}
(O/'RESULTS.json').write_text(json.dumps(result,ensure_ascii=False,indent=2)+'\n')
(O/'TRACE.json').write_text(json.dumps(traces,ensure_ascii=False,separators=(',',':'))+'\n')
print(json.dumps({'cases':len(cases),'passed':True,'trace_bytes':(O/'TRACE.json').stat().st_size}))
