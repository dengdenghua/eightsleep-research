#!/usr/bin/env python3
"""Synthetic cases and invariant checks, no device/firmware execution."""
from model import Pipeline,Sample,Timing,Shared,U32
from pathlib import Path
import json,hashlib
O=Path(__file__).resolve().parent
E=1700000000
cases={};details={}
def save(name,p,expected):
    cases[name]={'observed':p.audit(),'checked_behavior':expected}
    details[name]=p.evidence()

# 1. Real mapper + caller copy + queue crossing, no manual correction of epoch.
p=Pipeline(enabled=(True,False),auto_flush=False)
p.ingest(0,10000,E,'anchor');p.ingest(0,10996,E,'before');p.ingest(0,11000,E+1,'after')
assert p.buckets[0][E+1][499].token=='after/copy'
assert 499 not in p.buckets[0][E]
p.flush();p.flush()
assert p.disposition['after/copy']=='loader_unvisited_bucket_deleted'
save('cross_second_copy',p,'Copy goes to next-second slot499; sparse prefix reaches hole, copy later deleted with bucket.')

# 2. Complete combined path, dual side sequential interleaving, auto flush.
p=Pipeline()
for i in range(1501):
    for side in (0,1):p.ingest(side,10000+i*2,E+(i*2)//1000,f'{side}:{i}')
assert p.outputs and p.outputs[0]['paired'] and p.outputs[0]['primary']==0
assert len(p.outputs[0]['points'])==1000
save('dual_contiguous_auto_flush',p,'Equal bucket counts select side0; first paired second stages 500 tokens per side.')

# 3. Other side does not rescue a hole in primary buzzer path.
p=Pipeline(auto_flush=False)
for side,slots in [(0,[0,2,3]),(1,[0,1,2,3])]:
    for slot in slots:p.offer(Sample(f'{side}:{slot}',f'{side}:{slot}',side,E,slot*2))
o=p.flush();assert o['paired'] and o['break_at']==1 and len(o['points'])==2
assert p.disposition['1:1']=='loader_unvisited_bucket_deleted'
save('paired_primary_hole',p,'Buzzer traversal stops at primary hole1 although secondary1 exists; both buckets removed.')

# 4. Input overwrite and late data after watermark feedback.
p=Pipeline(enabled=(True,False),auto_flush=False)
p.offer(Sample('old','old',0,E,0));p.offer(Sample('new','new',0,E,1));p.flush()
p.offer(Sample('late','late',0,E,2))
assert p.disposition['old']=='input_slot_overwritten' and p.disposition['late']=='watermark_skip'
save('overwrite_and_late_arrival',p,'Odd/even adjacent milliseconds address same slot; once loader updates watermark, same-second late data skipped.')

# 5. Shared request waits until next reference check, not every arrival.
p=Pipeline(auto_flush=False)
p.ingest(0,10000,E,'Linit');p.ingest(1,10000,E,'Rinit')
m=p.ingest(0,0,E,'Ltick-reset');assert 'drift_gt_2s' in m['reasons'] and p.shared.bits==2
for i in range(1,1000):
    m=p.ingest(1,10000+i*2,E+(i*2)//1000,f'R{i}')
    assert 'shared_request' not in m['reasons']
m=p.ingest(1,12000,E+2,'Rcheck')
assert m['reasons']==['shared_request'] and p.shared.bits==0
save('shared_request_check_boundary',p,'With supplied reciprocal masks, side1 consumes request at call1000, not first subsequent sample. A left tick reset requests a right re-anchor; the right side still waits for its own check.')

# 6. Integrated mapper wall-clock rollback after prior loader watermark.
p=Pipeline(enabled=(True,False),auto_flush=False)
p.offer(Sample('initial','initial',0,E+100,0));p.flush()
p.timing[0]=Timing(p.shared,1,2,previous=10000,initialized=True,count=999,anchor_epoch=E+100,anchor_tick=10000)
for i in range(501):p.ingest(0,12000+i*2,E+60+(i*2)//1000,f'rollback:{i}')
assert sum(d=='old_500_reset' for d in p.disposition.values())==1
assert 'rollback:500/real' in {s.token for b in p.buckets[0].values() for s in b.values()}
save('clock_rollback_to_loader_recovery',p,'Mapper rebase alone leaves old watermark; 500 severely-old enqueue attempts reset it, next epoch can insert.')

# 7. Capacity failure retries once after fallback loader; old bucket erased.
p=Pipeline(auto_flush=False)
for i in range(10):p.offer(Sample(f'k{i}',f'k{i}',0,E+i,0))
p.offer(Sample('eleventh','eleventh',0,E+10,0))
assert len(p.outputs)==1 and p.disposition['eleventh']=='pending' and len(p.buckets[0])==10
save('capacity_retry',p,'11th novel bucket forces one loader/encode opportunity before retry; missing peer uses single-side fallback.')

# 8. True uint32 wrap stays continuous with no unconditional rebase.
p=Pipeline(enabled=(True,False),auto_flush=False)
p.ingest(0,U32-255,E,'wrap-init');p.ingest(0,U32-1,E,'wrap-before');m=p.ingest(0,0,E,'wrap-after')
assert m['relative']==256 and not m['reasons']
save('unsigned_tick_wrap',p,'Tick decrease causes check, but uint32 subtraction keeps mapped relative256; no >2s error, no rebase.')

# 9. Secondary record staged at primary timestamp slot, not its own relative field.
p=Pipeline(auto_flush=False)
p.offer(Sample('primary','primary',0,E,0))
p.offer(Sample('secondary','secondary',1,E,1))
o=p.flush();sp=next(x for x in o['points'] if x['side']==1)
assert sp['slot']==0 and sp['relative']==1
save('secondary_uses_primary_output_slot',p,'Output destination derives from primary relative; secondary shares array slot selection, no waveform correlation.')

# 10. Capacity and oldest pending-key guard do not imply retry on all skips.
p=Pipeline(enabled=(True,False),auto_flush=False)
p.offer(Sample('pending','pending',0,E+2,0));p.offer(Sample('outoforder','outoforder',0,E+1,0))
assert p.disposition['outoforder']=='older_than_pending_min'
save('older_than_earliest_pending',p,'Below earliest pending key skips even before any loader watermark exists.')

(O/'RESULTS.json').write_text(json.dumps({'kind':'synthetic_host_reconstruction_not_firmware_execution','case_count':len(cases),'cases':cases,
'limits':['Only buzzer staging; no claim of full encoder/network/cloud output.','No actual ADC/IMU values, physical clocks or hardware gain.','Reciprocal shared masks and event scheduling are explicit scenario inputs; deployed wiring not established.','No asynchronous interleavings, output-error propagation, or IMU/extADC/multi-channel early-break coupling.','Current device version unbound.']},ensure_ascii=False,indent=2)+'\n')
(O/'TRACE.json').write_text(json.dumps(details,ensure_ascii=False,separators=(',',':'))+'\n')
print(json.dumps({'cases':len(cases),'assertions':'passed','result':str(O/'RESULTS.json'),'trace_bytes':(O/'TRACE.json').stat().st_size}))
