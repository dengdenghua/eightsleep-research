import json
import struct
from dataclasses import asdict
from pathlib import Path
from model import *

OUT=Path(__file__).resolve().parent
cases=[]
def check(name,inputs,actual,expected):
    assert actual==expected,(name,actual,expected)
    cases.append({'name':name,'inputs':inputs,'actual':actual,'expected':expected})
def adjacent(x,direction):
    bits=struct.unpack('<I',struct.pack('<f',x))[0]
    return struct.unpack('<f',struct.pack('<I',bits+direction))[0]

for age in [0,4999,5000,5001]:
    check('water_age_'+str(age),{'age_ms':age,'successful':True},temp_valid(True,10000+age,10000),age<5000)
check('success_flag_missing',{},temp_valid(False,100,99),False)
check('uint32_clock_wrap',{'now':100,'last':0xffffff00},temp_valid(True,100,0xffffff00),True)
check('clock_backwards',{'now':99,'last':100},temp_valid(True,99,100),False)
for kwargs in [dict(water_valid=False),dict(due=False),dict(enabled=False)]:
    check('pid_preserves_'+next(iter(kwargs)),kwargs,thermostat_step(.6,-.9,**kwargs),
          {'demand':f32(.6),'pid_executed':False,'tec_set_called':False})
for delta in [adjacent(4,-1),4,adjacent(4,1)]:
    # requested=0 makes the float32 difference exactly the selected delta.
    for demand in [-1,1]:
        check('ambient_boundary',{'delta':delta,'demand':demand},ambient_clamp(demand,delta,0),
              f32(-.8 if delta<=4 else -1) if demand<0 else f32(.8))
check('ambient_invalid_local_only',{},ambient_clamp(1,24,24,False),1)
check('ambient_disabled',{},ambient_clamp(-1,24,24,True,False),-1)
for new in [5,adjacent(5,1)]:
    check('target_change_strict_5',{'old':0,'new':new,'water':2},target_cross_resets(0,new,2),new>5)
check('touching_water_not_crossing',{},target_cross_resets(0,10,10),False)
for value,expected in [(adjacent(11,-1),7),(11,8),(adjacent(14,-1),8),(14,0),
                       (50,0),(adjacent(50,1),9)]:
    check('water_expired_block_guard',{'water_valid':False,'block':value},
          waterblock_local_guard(value,25,water_valid=False),expected)
check('both_sensors_invalid',{},waterblock_local_guard(25,25,block_valid=False,water_valid=False),1)
check('cold_delta_equal_5',{},waterblock_local_guard(13,18),0)
check('cold_delta_over_5',{},waterblock_local_guard(13,adjacent(18,1)),8)
for old in [False,True]:
    for t in [60,65,adjacent(65,1)]:
        check('overtemp_hysteresis',{'old':old,'temperature':t},overtemp_latch(t,old),t>(60 if old else 65))
t=Tec(); trace=[]
for now,due in [(0,True),(499,True),(500,True),(999,True),(1000,True),(1099,False),(1100,True)]:
    t.tick(now,-.5,due);trace.append({'now_ms':now,**asdict(t)})
check('reversal_no_pwm_through_1099',trace,[x['pwm'] for x in trace[:-1]],[0]*6)
check('reversal_enables_at_500',{},[x['enabled'] for x in trace],[False,False,True,True,True,True,True])
check('reversal_ramp_next_normal_tick',{},trace[-1]['pwm'],f32(.001))
t=Tec();t.tick(100,-.5,safety_code=1)
check('safety_precedes_direction',{},[t.mode,t.pwm,t.enabled],['protected',0,False])
t=Tec();t.tick(100,.1)
check('downward_request_no_ramp_delay',{},t.pwm,f32(.1))
for level,expected in [(12.5,0),(25,1),(50,1),(75,.55),(100,.1)]:
    check('fill_duty',{'level':level},fill_duty(level),f32(expected))
check('disabled_side_pump_off',{},fill_duty(75,False),0)
for raw,expected in [([49.9,49.9],'FILL'),([50,50],'RED'),([100,25],'RED'),([100,24.9],'FILL')]:
    s=PrimingBoundary()
    for _ in range(3):s.fill(raw,[40,40])
    check('fill_three_samples',{'raw':raw,'samples':3},s.state,expected)
s=PrimingBoundary()
for _ in range(2):s.fill([50,50],[40,40])
check('fill_before_600',{},[s.state,s.fill_counter],['FILL',400])
s.fill([49,49],[40,40]);check('fill_resets_on_drop',{},s.fill_counter,0)
s.fill([50,50],[40,40],due=False);check('fill_no_increment_not_due',{},s.fill_counter,0)
s=PrimingBoundary();s.fill([50,50],[10,10]);s.fill([50,50],[10,10]);s.fill([50,50],[10,10])
check('fill_entry_raw_not_average',{'raw':[50,50],'average':[10,10]},s.state,'RED')
for state,threshold,steps,inclusive in [('WAIT_CAP',18.75,15,False),('FLUSH',12.5,10,True)]:
    for value in [adjacent(threshold,-1),threshold,adjacent(threshold,1)]:
        s=PrimingBoundary(state=state,primed_mask=3)
        for _ in range(steps):s.low_water([value,30])
        low=value<=threshold if inclusive else value<threshold
        check(state+'_threshold',{'average':value,'samples':steps},s.state,'FILL' if low else state)
    s=PrimingBoundary(state=state)
    for _ in range(steps-1):s.low_water([0,30])
    check(state+'_one_sample_early',{},s.state,state)
    s.low_water([30,30]);check(state+'_counter_reset',{},s.low_counter,0)
s=PrimingBoundary(state='WAIT_CAP',primed_mask=3)
for i in range(15):s.low_water([10,30] if i%2==0 else [30,10])
check('wait_cap_alternating_low_side_shared_counter',{},[s.state,s.low_counter,s.primed_mask],['FILL',3000,2])
s.fill([50,50],[30,30])
check('wait_cap_to_fill_must_accumulate_again',{},[s.state,s.fill_counter,s.low_counter],['FILL',200,3000])
s=PrimingBoundary(state='FLUSH',fill_counter=400,primed_mask=3)
for _ in range(10):s.low_water([10,40])
check('flush_return_preserves_primed_bits',{},[s.state,s.fill_counter,s.primed_mask],['FILL',0,3])
s.fill([50,50],[30,30])
check('flush_to_fill_must_accumulate_again',{},[s.state,s.fill_counter],['FILL',200])
s=PrimingBoundary(fill_counter=400,low_counter=2800,primed_mask=3)
s.fill([50,50],[40,40])
check('already_primed_wait_entry_clears_both_counters',{},[s.state,s.fill_counter,s.low_counter],['WAIT_CAP',0,0])
for v in [adjacent(37.5,-1),37.5,adjacent(37.5,1)]:
    check('final_flush_37_5',{'minimum_average':v},final_flush_pass([v,50]),v>=37.5)
result={'scope':'local boundary models, not complete firmware nor physical simulation',
        'case_count':len(cases),'all_passed':True,'cases':cases,'reversal_trace':trace,
        'assumptions':['finite float32 inputs; previous safety gates/range checks pass unless explicitly injected',
        'PID output after cooling limiter supplied, not whole PID/cooling stall model',
        'priming due calls each represent firmware +200 counter; not measured elapsed time',
        'priming averages supplied; full rolling-average, RED stability and pump diagnosis not simulated',
        'TEC protected recovery and current self-test outside this model; no physical temperature predictions']}
(OUT/'RESULTS.json').write_text(json.dumps(result,ensure_ascii=False,indent=2)+'\n')
print(json.dumps({'case_count':len(cases),'all_passed':True}))
