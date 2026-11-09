from model import State,f
from dataclasses import asdict
from pathlib import Path
import json
cases=[]
def check(name,s,d,e,t,expected,out=None):
 y=s.step(d,e,t)
 for k,v in expected.items():assert getattr(s,k)==v,(name,k,getattr(s,k),v)
 if out is not None:assert y==f(out),(name,y,out)
 cases.append({'name':name,'input':{'demand':d,'error':e,'now':t},'state':asdict(s),'output':y,'expected':expected,'expected_output':out})
s=State();check('initial_best_resets_timer',s,-1,-5,0,{'best':5.,'seen':True,'cut':True},-.67)
check('before_180s',s,-1,-5,179999,{'climbing':False})
check('at_180s',s,-1,-5,180000,{'climbing':True,'raised_at':180000,'ceiling':f(.67)})
check('before_30s_raise',s,-1,-5,209999,{'ceiling':f(.67)})
check('at_30s_raise',s,-1,-5,210000,{'ceiling':f(f(.67)+f(.11))})
check('late_call_one_increment_only',s,-1,-5,360000,{'ceiling':f(f(f(.67)+f(.11))+f(.11)),'raised_at':360000})
check('progress_does_not_exit_climbing',s,-1,-4,360001,{'climbing':True,'best':4.,'progress_at':360001})
check('next_raise_caps_at_one',s,-1,-4,390000,{'ceiling':1.,'cut':False,'engaged':False},-1)
s=State();check('no_clip_initial',s,-.2,-5,0,{'seen':False})
check('stall_without_seen_is_suppressed',s,-.2,-5,180000,{'suppressed':True,'climbing':False})
check('first_clip_on_stall_call_not_yet_climbing',s,-1,-5,180001,{'suppressed':True,'seen':True,'climbing':False})
check('next_call_enters_climbing',s,-1,-5,180002,{'climbing':True})
s=State(best=5.,progress_at=0);check('exact_float32_improvement_boundary_is_not_progress',s,-1,-f(5-f(.1)),100,{'progress_at':0,'best':5.})
check('more_than_threshold_progress',s,-1,-4.89,101,{'progress_at':101,'best':f(4.89)})
s=State();check('equal_cap_does_not_cut_or_engage',s,-f(.67),-5,0,{'cut':False,'engaged':False})
check('strong_demand_engages',s,-.8,-5,1,{'engaged':True,'cut':True})
check('hysteresis_engaged_without_actual_cut',s,-.64,-5,2,{'engaged':True,'cut':False},-.64)
check('hysteresis_release',s,-.6,-5,3,{'engaged':False,'cut':False})
s=State(climbing=True,ceiling=f(.89),seen=True,engaged=True)
check('error_equal_minus_threshold_bypasses_preserves_adaptive',s,-1,-.5,123,{'climbing':True,'ceiling':f(.89),'seen':False,'engaged':False,'cut':False},-1)
s.enable_reset(124);assert s.climbing and s.ceiling==f(.89)
s.target_reset(125);assert not s.climbing and s.ceiling==f(.67) and s.raised_at==125
cases.append({'name':'enable_vs_target_reset','result':'PASS','enable_preserves_climbing':True,'target_clears_climbing':True})
s=State(best=5.,progress_at=0xffff0000,seen=True)
check('uint32_wrap_stall',s,-1,-5,(0xffff0000+180000)&0xffffffff,{'climbing':True})
s=State(climbing=True,ceiling=f(.67),raised_at=0)
check('progress_and_raise_same_call',s,-1,-4,30000,{'best':4.,'ceiling':f(f(.67)+f(.11)),'climbing':True})
s=State(disabled=True,climbing=True,ceiling=f(.89));check('disabled_bypass_preserves_ceiling',s,-1,-5,20,{'climbing':True,'ceiling':f(.89),'cut':False},-1)
s=State(base=0);check('zero_base_bypass',s,-1,-5,20,{'cut':False,'seen':False},-1)
s=State(climbing=True,ceiling=f(.95));check('raise_overshoot_caps_at_one',s,-2,-5,30000,{'ceiling':1.,'engaged':False,'cut':False},-2)
# Avoid non-standard Infinity in JSON: use a textual marker only in recorded snapshots.
def clean(x):
 if isinstance(x,float) and x==float('inf'):return '+Infinity'
 if isinstance(x,dict):return {k:clean(v) for k,v in x.items()}
 if isinstance(x,list):return [clean(v) for v in x]
 return x
result={'result':'PASS','cases_count':len(cases),'cases':clean(cases),'scope':'Finite-state analyst model; fixed configured base/threshold. No NaN, thermal response, full scheduler or all MCU modes equivalence.'}
Path(__file__).with_name('MODEL_RESULTS.json').write_text(json.dumps(result,indent=2,allow_nan=False)+'\n')
print(json.dumps({'result':'PASS','cases_count':len(cases)}))
