"""Analyst finite operation-order model; no vendor code/device/filesystem execution.
Exceptions injected BEFORE named stage. Writes assumed successful if not injected;
Save is one serial operation here; true filesystem partial effects are out of scope.
"""
from copy import deepcopy
from pathlib import Path
import json
class Failure(Exception):pass
class State:
 def __init__(self):
  self.ram={'enabled':True,'left':0,'right':0};self.main=deepcopy(self.ram);self.saved=deepcopy(self.ram);self.tmp=None;self.public='Ready';self.cancelled=False;self.locked=False;self.trace=[]
 def point(self,name,fail):
  self.trace.append(name)
  if fail==name:raise Failure(name)
 def update(self,value,fail=None):
  self.ram=deepcopy(value);self.trace.append('replace_RAM');self.locked=True
  try:
   self.point('serialize',fail);snap=deepcopy(self.ram)
   if snap==self.saved:self.trace.append('skip_unchanged');return
   self.point('open_tmp',fail);self.tmp={}
   self.point('write_tmp',fail);self.tmp=deepcopy(snap)
   self.point('flush_tmp',fail)
   self.point('replace_main',fail);self.main=deepcopy(self.tmp);self.tmp=None
   self.saved=deepcopy(snap);self.trace.append('savedJson_updated')
  finally:self.locked=False
 def disable(self,fail=None):
  value=deepcopy(self.ram);value['enabled']=False
  self.update(value,fail);self.public='Null';self.cancelled=True;self.trace+=['states_Null','CTS_Cancel']
 def target(self,snapshot=None,fail=None):
  value=deepcopy(self.ram if snapshot is None else snapshot);value['left']=1
  try:self.update(value,fail)
  except Failure:self.trace.append('save_error_caught')
  self.trace.append('caller_may_proceed_to_send_method')
 def view(self):return {k:deepcopy(getattr(self,k)) for k in ['ram','main','saved','tmp','public','cancelled','locked','trace']}
rows=[]
def retain(name,s,expected):
 for path,v in expected.items():
  x=s.view()
  for key in path.split('.'):x=x[key]
  assert x==v,(name,path,x,v)
 rows.append({'name':name,'observed':s.view(),'expected':expected})
s=State();old=deepcopy(s.ram);s.disable();s.target(old);retain('old_Ready_snapshot_after_successful_Disable',s,{'ram.enabled':True,'main.enabled':True,'saved.enabled':True,'public':'Null','cancelled':True,'locked':False})
s=State();s.disable();s.target();retain('fresh_target_snapshot_preserves_disabled',s,{'ram.enabled':False,'main.enabled':False})
s=State();s.target();s.disable();retain('Disable_is_last_record_replacement',s,{'ram.enabled':False,'main.enabled':False,'main.left':1})
for stage in ['serialize','open_tmp','write_tmp','flush_tmp','replace_main']:
 s=State()
 try:s.disable(stage)
 except Failure:pass
 retain('Disable_fail_before_'+stage,s,{'ram.enabled':False,'main.enabled':True,'saved.enabled':True,'public':'Ready','cancelled':False,'locked':False})
 s.disable();retain('Disable_retry_after_'+stage,s,{'ram.enabled':False,'main.enabled':False,'saved.enabled':False,'public':'Null','cancelled':True,'locked':False})
 s=State();s.target(fail=stage);retain('target_save_fail_before_'+stage,s,{'ram.left':1,'main.left':0,'saved.left':0,'locked':False})
 assert 'caller_may_proceed_to_send_method' in s.trace
s=State();s.target(fail='replace_main');later=deepcopy(s.ram);later['right']=1;s.update(later);retain('later_success_can_persist_earlier_failed_target',s,{'main.left':1,'main.right':1})
s=State();s.disable();before=len(s.trace);s.disable('open_tmp');retain('unchanged_Disable_skips_IO_but_still_sets_Null_and_Cancel',s,{'ram.enabled':False,'main.enabled':False,'public':'Null','cancelled':True});assert 'open_tmp' not in s.trace[before:]
Path(__file__).with_name('MODEL_RESULTS.json').write_text(json.dumps({'result':'PASS','cases_count':len(rows),'cases':rows,'scope':'Finite synthetic method ordering and before-operation exceptions. No real filesystem durability/partial failure, thread memory proof, connection scheduling or hardware actions. Send method marker is not an observed write.'},indent=2)+'\n')
print('PASS',len(rows),'bounded cases')
