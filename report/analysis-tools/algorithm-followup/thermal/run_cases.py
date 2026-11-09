"""Finite examples for the two different clamp layers. No thermal plant simulation."""
import json
from pathlib import Path
from model import step,f32,mul
HERE=Path(__file__).resolve().parent
cases=[]
def save(name,args,checks):
    result=step(**args)
    for name_,expected in checks.items():
        assert result[name_]==expected,(name,name_,result[name_],expected)
    cases.append({'name':name,'input':args,'observed':result,'expected_fields':checks})
    return result
hot={'target':30,'water':25,'integral':10,'previous_e':5,'ambient':30}
save('heating_ambient_clip_keeps_integral',hot,{'integral_saved':15.,'cached_i':mul(.005,15),'cooling_actual_cut':False,'previous_e_saved':5.,'cached_d':0.,'final_request':f32(.8)})
cold={'target':20,'water':25,'integral':10,'previous_e':0,'ambient':20}
r=save('cooling_cut_rolls_back_only_integral',cold,{'integral_saved':10.,'attempted_integral':5.,'cached_i':mul(.005,5),'cached_d':-1.,'cooling_actual_cut':True,'previous_e_saved':-5.,'final_request':f32(-.67)})
assert r['cached_raw_output']!=r['final_request']
save('next_cooling_step_uses_updated_previous_error',{**cold,'integral':r['integral_saved'],'previous_e':r['previous_e_saved']},{'integral_saved':10.,'cached_d':0.,'cooling_actual_cut':True,'final_request':f32(-.67)})
save('ceiling_at_one_then_only_ambient_cut',{'target':20,'water':22,'integral':-80,'previous_e':-2,'ambient':20,'ceiling':1},{'integral_saved':-82.,'cached_i':mul(.005,-82),'cooling_actual_cut':False,'final_request':f32(-.8)})
save('heating_fallback_output_clip_keeps_integral',{**hot,'ambient':None},{'integral_saved':15.,'cooling_actual_cut':False,'final_request':1.})
save('integral_bound_is_separate_from_output_clip',{**hot,'integral':199},{'attempted_integral':200.,'integral_saved':200.,'cached_i':mul(.005,200),'final_request':f32(.8)})
save('small_cooling_without_cut',{'target':24,'water':25,'integral':0,'previous_e':-1,'ambient':24},{'integral_saved':-1.,'cached_d':0.,'cooling_actual_cut':False,'final_request':f32(-.305)})
result={'result':'PASS','cases':cases,'cases_count':len(cases),'scope':'Analyst float32 finite-step transcription. Fixed ceiling is an input; no scheduling, whole-controller equivalence, NaN, or physical performance claim.'}
(HERE/'MODEL_RESULTS.json').write_text(json.dumps(result,ensure_ascii=False,indent=2)+'\n')
print(json.dumps({'result':'PASS','cases':len(cases)}))
