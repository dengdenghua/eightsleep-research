"""xc.c.i row merge model; inputs already passed AggregatePeriodResponse.toDomain.
No network/Room execution. Values are symbolic fixtures, not personal metrics.
"""
from copy import deepcopy
from datetime import date
import json
from pathlib import Path

MAPS=('doubleAvg','intAvg','durationAvg','timeAvg','trueFalseCountAvg','doubleSum','stdDev')
def row(name='week',day='2026-11-01',**values):
    return dict(name=name,date=day,**{k:values.get(k,{}) for k in MAPS},samples=values.get('samples',[]))
def store_response(cache,user,to,periods,metrics,response,today):
    result=deepcopy(cache)
    if not response and to<=today:
        for period in periods:
            result[(user,period,to)]=row(period,to,stdDev={m:0.0 for m in metrics})
        return result
    # Each group reads a snapshot before writing its returned rows.
    groups={}
    for incoming in response:groups.setdefault(incoming['name'],[]).append(incoming)
    for name,items in groups.items():
        snapshot=deepcopy(result)
        for incoming in items:
            key=(user,name,incoming['date']);old=snapshot.get(key)
            merged=deepcopy(incoming)
            if old is not None:
                for k in MAPS[:-1]:merged[k]={**old[k],**incoming[k]}
                merged['stdDev']={**{m:0.0 for m in metrics},**old['stdDev'],**incoming['stdDev']}
                # samples remain the incoming list; they are not concatenated.
            result[key]=merged
    return result

if __name__=='__main__':
    key=('fixture','week','2026-11-01')
    old={key:row(doubleAvg={'hr':60,'hrv':30},stdDev={'hr':2},samples=['old'])}
    cases=[]
    def run(label,initial,response,to='2026-11-01'):
        out=store_response(initial,'fixture',to,['week'],['hr','hrv'],response,'2026-11-07')
        cases.append({'label':label,'input_rows':[{'key':k,'row':v} for k,v in initial.items()],
                      'response':response,'to':to,'result':[{'key':k,'row':v} for k,v in out.items()]})
        return out
    a=run('partial map update preserves absent metrics; replaces samples',old,[row(doubleAvg={'hr':65},samples=[])])[key]
    assert a['doubleAvg']=={'hr':65,'hrv':30} and a['samples']==[] and a['stdDev']=={'hr':2,'hrv':0.0}
    a=run('new stdDev overrides cached stdDev',old,[row(stdDev={'hr':4})])[key]
    assert a['stdDev']=={'hr':4,'hrv':0.0}
    a=run('uncached row has no synthetic stdDev defaults',{},[row(doubleAvg={'hr':65})])[key]
    assert a['stdDev']=={}
    a=run('empty past response overwrites same-key cached row',old,[])[key]
    assert a['doubleAvg']=={} and a['stdDev']=={'hr':0.0,'hrv':0.0} and a['samples']==[]
    a=run('empty future response writes nothing',old,[],to='2026-11-08')
    assert a==old
    a=run('same group duplicate rows merge against prewrite snapshot',old,[row(doubleAvg={'hr':65}),row(doubleAvg={'hrv':40})])[key]
    assert a['doubleAvg']=={'hr':60,'hrv':40}
    a=run('unreturned dates remain cached',old,[row(day='2026-11-02',doubleAvg={'hr':66})])
    assert a[key]==old[key] and len(a)==2
    (Path(__file__).parent/'MODEL_RESULTS.json').write_text(json.dumps({'cases':cases,'passed':True,'count':len(cases)},ensure_ascii=False,indent=2)+'\n')
    print(json.dumps({'count':len(cases),'passed':True}))
