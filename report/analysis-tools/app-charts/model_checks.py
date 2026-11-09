"""Derived formulas only; never executes the target APK or authenticates."""
import json,math
from pathlib import Path
from datetime import date,timedelta
out=[]
def check(name,actual,expected):
 assert actual==expected,(name,actual,expected)
 out.append(dict(name=name,actual=actual,expected=expected,passed=True))
def highlight(ranges,stage_match,sleep_response,t):
 return ranges is None or any(stage_match or (not sleep_response and a<=t<=b) for a,b in ranges)
check('no_selection_all_active',highlight(None,False,True,100),True)
check('empty_ranges_even_stage_match_inactive',highlight([],True,False,100),False)
check('matching_stage_outside_range_active',highlight([(10,20)],True,True,100),True)
check('different_stage_sleep_response_in_range_inactive',highlight([(10,20)],False,True,15),False)
check('manual_in_range_active',highlight([(10,20)],False,False,15),True)
check('range_end_inclusive',highlight([(10,20)],False,False,20),True)
def off(points,start,end):
 gap=int((end-start)*.02);result=[]
 for i,(t,y) in enumerate(points):
  if i==0: result.extend([(start,y),(t,y)])
  else:
   result.extend([(t-gap,result[-1][1]),(t-gap,y),(t,y)])
   if i==len(points)-1:result.append((end,y))
 return result
check('single_off_no_endcap',off([(20,10)],0,100),[(0,10),(20,10)])
check('two_off_synthetic_points',off([(20,10),(70,30)],0,100),[(0,10),(20,10),(68,10),(68,30),(70,30),(100,30)])
check('padding_tie_even',round(abs((25-0)*.1)),2)
check('month_31_slots',(date(2026,2,28)-timedelta(days=30)).isoformat(),'2026-01-29')
check('last_duplicate_sample_wins',dict([('2026-11-01',1),('2026-11-01',2)]),{'2026-11-01':2})
check('same_period_ui_retains_unreturned_date',{**{'a':1,'b':2},**{'b':3}},{'a':1,'b':3})
stage_end,snore_end,last_event=120,130,125
m=max(stage_end,snore_end,last_event)
check('snore_append_uses_stage_end',[m,m-stage_end,snore_end+(m-stage_end)],[130,10,140])
check('stage_ratio_float_not_integer',300.0/1200.0,0.25)
# Java Duration.toHours truncates its seconds quotient toward zero.
# This is a translation of caller math plus P2.H.d0/x, not executing APK bytecode.
def axis_step(minutes,start_minute):
 hours=math.trunc((minutes+start_minute)/60)
 step=math.ceil(hours/4.0)
 return {'step':step,'helper_result':'accepted' if step>0 else 'IllegalArgumentException'}
check('axis_30min_exact_hour_step0',axis_step(30,0),{'step':0,'helper_result':'IllegalArgumentException'})
check('axis_zero_duration_step0',axis_step(0,0),{'step':0,'helper_result':'IllegalArgumentException'})
check('axis_negative_5h_step_negative',axis_step(-300,0),{'step':-1,'helper_result':'IllegalArgumentException'})
check('axis_30min_from45_step1',axis_step(30,45),{'step':1,'helper_result':'accepted'})
def domain(values):
 lo=min(values) if values else 0;hi=max(values) if values else 10
 p=round(abs((hi-lo)*.1))
 a=lo-3*p;b=hi+p
 return [a,b,[a+i*(b-a)/4 for i in range(5)]]
check('constant_temperature_zero_domain',domain([20,20]),[20,20,[20,20,20,20,20]])
check('empty_temperature_defaults',domain([]),[-3,11,[-3,.5,4,7.5,11]])
def float_div_model(a,b):
 # Explicit IEEE floating-point special values, serialized as names for strict JSON.
 if b==0:
  if a==0:return 'NaN'
  return '+Infinity' if math.copysign(1,a)*math.copysign(1,b)>0 else '-Infinity'
 return a/b
check('stage_0_over_0',float_div_model(0.0,0.0),'NaN')
check('stage_positive_over_0',float_div_model(60.0,0.0),'+Infinity')
check('stage_negative_over_0',float_div_model(-1.0,0.0),'-Infinity')
check('stage_negative_total_negative_ratio',float_div_model(30.0,-60.0),-.5)
check('subsecond_total_getSeconds_zero',[500//1000,float_div_model(0.0,float(500//1000))],[0,'NaN'])
check('stage_negative_width',100*float_div_model(-30.0,60.0),-50.0)
check('off_unsorted_preserves_reverse_x',off([(70,10),(20,30)],0,100),[(0,10),(70,10),(18,10),(18,30),(20,30),(100,30)])
check('off_zero_axis_repeated_x',off([(0,10),(0,30)],0,0),[(0,10),(0,10),(0,10),(0,30),(0,30),(0,30)])
check('snore_nonpositive_duration_axis_min1s',[max(0,1000),max(-60000,1000)],[1000,1000])
(Path(__file__).parent/'MODEL_CHECKS.json').write_text(json.dumps({'scope':'derived synthetic formulas; target APK not executed','cases':out},ensure_ascii=False,indent=2)+'\n')
print(f'{len(out)} synthetic model cases passed')
