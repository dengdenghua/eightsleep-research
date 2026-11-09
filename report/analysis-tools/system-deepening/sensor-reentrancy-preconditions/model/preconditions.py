#!/usr/bin/env python3
"""Bounded queue/event model, not firmware execution or a CPU-time model."""
from collections import deque
from itertools import product
from pathlib import Path
import argparse, json

class State:
    def __init__(self):
        self.adc=deque(); self.imu=deque(); self.phase=0; self.callback_id=0
        self.dirty=[False,False]; self.gain=[400,400]; self.events=[]
        self.outer=None; self.rejected=0; self.accepted=0; self.popped=[]
        self.event('empty_queue',condition='initialized/flush-complete queue; sampling callback enabled; no RAM snapshot claimed')
    def event(self,kind,**kw):
        self.events.append(dict(index=len(self.events),kind=kind,adc_count=len(self.adc),
            imu_count=len(self.imu),phase=self.phase,outer=self.outer,**kw))
    def callback(self,where):
        self.callback_id+=1; n=self.callback_id
        ok=len(self.adc)<30
        if ok:self.adc.append(n);self.accepted+=1
        else:self.rejected+=1
        self.event('adc_push',callback=n,accepted=ok,where=where,source='08023456 -> 0801c388')
        if not ok:self.event('overflow_log',callback=n,where=where,source='08023460 -> 0801c8f8')
        self.phase+=1
        if self.phase==5:
            self.phase=0;imu_ok=len(self.imu)<12
            if imu_ok:self.imu.append(n)
            self.event('imu_push',callback=n,accepted=imu_ok,where=where,source='08023494; failure does not call logger')
        assert 0<=len(self.adc)<=30 and 0<=len(self.imu)<=12
        return ok
    def produce(self,n,where):
        return [self.callback(where) for _ in range(n)]
    def raw_pop(self,i):
        assert self.adc
        item=self.adc.popleft();self.popped.append(item)
        self.event('raw_adc_pop',record=item,pop_number=i,source='0801f92a' if i==1 else '0801f974')
    def raw_build(self,gaps=(0,0,0,0,0),before_framer=0):
        assert len(self.adc)>=5 and self.imu
        self.event('raw_eligible',source='0801f900..0801f91e')
        for i,n in enumerate(gaps,1):
            self.raw_pop(i)
            self.produce(n,'after_adc_pop_'+str(i))
        self.event('raw_imu_pop',record=self.imu.popleft(),source='0801f996')
        self.produce(before_framer,'after_final_pop_before_framer')
        self.outer='raw_0x3c_framer'
        self.event('raw_framer_entry',source='0801f9aa -> 0801f374 -> 0801c8c8')
    def request_gain(self,left,right):
        assert all(0<=x<=65535 for x in (left,right))
        for side,new in enumerate((left,right)):
            # Main's zero shorthand is resolved before invoking the setter.
            value=self.gain[side] if new==0 else new
            if value>99 and value!=self.gain[side]:
                self.gain[side]=value;self.dirty[side]=True
        self.event('gain_setter',requests=[left,right],dirty=list(self.dirty),source='080213f6 -> 08026758')
        if any(self.dirty):self.event('updated_gain_log_returned',source='080267c4; this earlier log is not interrupted in these cases')
    def gain_outer(self):
        if not any(self.dirty):self.event('gain_log_gate_skipped',source='0801f23e..0801f242');return False
        self.outer='main_gain_sync_log'
        self.event('gain_sync_log_entry',source='0801f246 -> 0801c8f8',condition='main reached dirty branch before 0801f296 flush')
        return True
    def flush_without_callbacks(self):
        self.outer=None
        a=len(self.adc);m=len(self.imu);self.adc.clear();self.imu.clear()
        self.event('flush_complete',adc_removed=a,imu_removed=m,source='0801f296 -> 08026722',condition='selected case supplies no callbacks during flush; not an atomicity claim')

def run(out):
    out.mkdir(parents=True,exist_ok=True);(out/'traces').mkdir(exist_ok=True)
    cases={}
    def save(name,s,summary):
        (out/'traces'/f'{name}.jsonl').write_text(''.join(json.dumps(e,ensure_ascii=False)+'\n' for e in s.events))
        cases[name]=dict(status='PASS',summary=summary,callbacks=s.callback_id,accepted=s.accepted,
            rejected=s.rejected,adc_count=len(s.adc),imu_count=len(s.imu),adc_popped=s.popped,
            overflow_logs=sum(e['kind']=='overflow_log' for e in s.events),trace=f'traces/{name}.jsonl')

    s=State();s.produce(30,'producer_only_prefix');s.raw_build();assert len(s.adc)==25
    assert s.callback('first_irq_in_raw_framer');assert len(s.adc)==26 and s.rejected==0
    save('raw_full_then_pop5_one_callback',s,'30 accepted from empty; pop5 =>25; next callback =>26, no overflow')

    s=State();s.produce(30,'producer_only_prefix');s.raw_build()
    assert s.produce(6,'inside_raw_framer')==[True]*5+[False]
    save('raw_full_then_pop5_six_callbacks',s,'first five refill; sixth rejects, under supplied six-callback framer interval')

    s=State();s.produce(30,'producer_only_prefix');s.raw_build((1,1,1,1,0));assert len(s.adc)==29
    assert s.callback('first_irq_in_raw_framer');assert not s.callback('second_irq_in_raw_framer')
    save('raw_refill_between_pops',s,'four earlier gaps each refill; last pop =>29; first in-framer fills, second rejects')

    s=State();s.produce(30,'producer_only_prefix');s.raw_build((1,1,1,1,0),before_framer=1)
    assert len(s.adc)==30 and not s.callback('first_irq_in_raw_framer')
    save('raw_refill_before_framer',s,'first in-framer rejection requires refill after final pop; total additional callbacks still six')

    s=State();s.request_gain(800,0);s.produce(30,'main_delayed_before_gain_log')
    assert s.rejected==0 and s.gain_outer();assert not s.callback('inside_gain_log')
    save('gain_dirty_full_before_flush',s,'dirty setter and thirty accepted callbacks coexist before main gain log; next callback rejects')

    s=State();s.request_gain(800,0);s.produce(29,'main_delayed_before_gain_log')
    assert s.gain_outer();assert s.callback('first_irq_in_gain_log');assert not s.callback('second_irq_in_gain_log')
    save('gain_dirty_one_free_slot',s,'gain log does not itself imply overflow: count29 requires two callbacks')

    s=State();s.request_gain(400,99);s.produce(30,'producer_only_prefix')
    assert not s.gain_outer();s.raw_build();assert s.callback('first_irq_in_raw_framer')
    save('unchanged_or_small_gain_no_dirty',s,'unchanged400 and <=99 do not set dirty from clean fixture; no gain-sync log branch')

    s=State();s.request_gain(800,0);s.produce(30,'main_delayed_before_gain_log');assert s.gain_outer()
    s.event('gain_log_returned_without_callback');s.flush_without_callbacks();assert s.callback('after_flush')
    save('gain_log_returns_then_flush_control',s,'same entry count does not imply failure if no callback overlaps; later no-IRQ flush removes queued records')

    formulas=[]
    for q0 in range(5,31):
        s=State();s.produce(q0,'prefix');s.raw_build();q=len(s.adc)
        n=31-q;assert s.produce(n,'post_pop')==[True]*(n-1)+[False]
        formulas.append(dict(initial_count=q0,after_pop5=q,callbacks_until_first_rejection=n))
    combinations=0
    for gaps in product(range(4),repeat=4):
        s=State();s.produce(30,'prefix');s.raw_build((*gaps,0))
        assert len(s.adc)<=29
        assert s.callback('immediately_after_final_pop_and_no_other_callback')
        combinations+=1
    result=dict(status='PASS',cases=cases,finite_checks={'no_interleaving_formulas':formulas,
        'pop_gap_schedules_checked':combinations,'gap_values':'0..3 callbacks after each of first four ADC pops; none after fifth before checked callback'},
        scope='queue identities/order and dirty gate only; no firmware/CPU/USB/framer/printf execution',
        assumptions=['valid capacity30 ADC and capacity12 IMU; no counter wrap, reset or RAM corruption',
        'callback is sole selected ADC producer, main selected pop is sole consumer; no concurrent flush',
        'callback enabled; monotonic tick selected so time-travel log is excluded',
        'callback and pop modeled at completed-operation boundaries; not proof of all instruction-level races',
        'initial gain400 is a synthetic valid value, not a RAM observation; queue starts empty in every trace',
        'producer-only prefix and IRQ placement are supplied schedules; no CPU duration or field probability inferred',
        'main gain branch is entered before flush; earlier setter log/command response and unrelated loop work are not replayed',
        'no serialized packet bytes or CRC claims; prior framer/formatter models require their own conditions'])
    (out/'MODEL_RESULTS.json').write_text(json.dumps(result,ensure_ascii=False,indent=2)+'\n')
    print(json.dumps({'status':'PASS','cases':len(cases),'formulas':len(formulas),'gap_schedules':combinations}))

if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('--out',type=Path,default=Path(__file__).resolve().parents[1]);run(p.parse_args().out)
