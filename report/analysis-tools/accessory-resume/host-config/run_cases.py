"""Finite read/replace/save interleavings; analyst model, no original DLL execution.
Save serialization+I/O treated as atomic here, successful disk operations only.
"""
from pathlib import Path
from itertools import combinations
import json
results=[]
for left in combinations(range(6),3):
 order=['L' if i in left else 'R' for i in range(6)]
 phases={'L':0,'R':0};ram={'L':0,'R':0};disk=dict(ram);snap={};trace=[]
 for who in order:
  phase=phases[who];phases[who]+=1
  if phase==0:snap[who]=dict(ram);action='read'
  elif phase==1:
   value=dict(snap[who]);value[who]=1;ram=value;action='clone-replace'
  else:disk=dict(ram);action='serialize-save'
  trace.append({'side':who,'action':action,'ram':dict(ram),'disk':dict(disk)})
 assert disk==ram
 results.append({'order':order,'trace':trace,'final':ram,'lost_update':ram!={'L':1,'R':1}})
assert len(results)==20
assert any(x['lost_update'] for x in results) and any(not x['lost_update'] for x in results)
Path(__file__).with_name('MODEL_RESULTS.json').write_text(json.dumps({'result':'PASS','cases':20,'lost_update_schedules':sum(x['lost_update'] for x in results),'rows':results,'scope':'All 20 schedules of this selected 3-step-per-side abstraction only. No thread scheduling probabilities, memory visibility proof, file failure, concurrent serialization or device-command effects.'},indent=2)+'\n')
print('PASS 20 selected schedules; lost updates',sum(x['lost_update'] for x in results))
