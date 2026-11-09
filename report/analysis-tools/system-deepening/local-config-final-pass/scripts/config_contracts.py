#!/usr/bin/env python3
"""Finite models of recovered configuration/order rules; never run vendor code."""
import copy,json,re,struct
from pathlib import Path
O=Path(__file__).resolve().parents[1]
cases=[]
def check(name,actual,expected,source):
 actual=copy.deepcopy(actual);expected=copy.deepcopy(expected)
 assert actual==expected,(name,actual,expected)
 cases.append(dict(name=name,observed=actual,expected=expected,source=source,status='PASS'))
def lookup(providers,key):
 for p in reversed(providers):
  if key in p:return p[key]
 return None
def machine(keys,revision):
 return max([k for k in keys if re.fullmatch('[A-Z][0-9]{2}',k) and k<=revision] or ['A00'])
cfg=json.loads((O/'CONFIG_EXCERPTS.json').read_text());keys=list(cfg['machine.json'])
check('later_provider_same_key',lookup([{'x':1},{'x':2}],'x'),2,'ConfigurationRoot.GetConfiguration')
check('missing_key_retains_prior_provider',lookup([{'x':1},{'y':2}],'x'),1,'ConfigurationRoot.GetConfiguration')
check('absent_business_env_provider',lookup([{'x':1},{'y':2}],'NODE_ENV'),None,'Program.LoadConfiguration and Sources.Clear')
for rev,expected in [('A00','A00'),('I00','I00'),('I20','I00'),('I21','I21'),('I99','I21'),('000','A00')]:
 check('watermark_'+rev,machine(keys,rev),expected,'MachineConfig.ResolveSectionKey')
check('I00_does_not_inherit_A00_roots',cfg['machine.json'][machine(keys,'I20')]['firmness'].get('usbRoots'),None,'HostExtensions.PostConfigure')
def post(base,section):
 x=copy.deepcopy(base)
 if 'usbPortConfig' in section:x['usbPortConfig']=copy.deepcopy(section['usbPortConfig'])
 if section.get('usbRoots'):x['usbRoots']=copy.deepcopy(section['usbRoots'])
 return x
base={'usbPortConfig':{'left':['baseL'],'right':['baseR']},'usbRoots':['baseRoot']}
check('post_config_replaces_port_object',post(base,{'usbPortConfig':{'left':['newL']}})['usbPortConfig'],{'left':['newL']},'HostExtensions.PostConfigure')
check('empty_roots_do_not_clear_base',post(base,{'usbRoots':[]})['usbRoots'],['baseRoot'],'HostExtensions.PostConfigure')
check('nonempty_roots_override_base',post(base,{'usbRoots':['new']})['usbRoots'],['new'],'HostExtensions.PostConfigure')

class Store:
 def __init__(self,value):self.ram=copy.deepcopy(value);self.disk=copy.deepcopy(value);self.saved=copy.deepcopy(value);self.writes=0
 def update(self,value,save_ok=True):
  self.ram=copy.deepcopy(value)
  if self.ram==self.saved:return
  if not save_ok:return
  self.disk=copy.deepcopy(self.ram);self.saved=copy.deepcopy(self.ram);self.writes+=1
s=Store({'left':1,'right':1});s.update({'left':2,'right':1},False)
check('save_failure_leaves_new_RAM_old_disk',[s.ram,s.disk],[{'left':2,'right':1},{'left':1,'right':1}],'PodConifgurationManager.UpdateConfiguration/Save')
s.update(s.ram,True);check('retry_after_failure_writes',s.writes,1,'PodConifgurationManager.savedJson assigned only after successful SaveConfiguration')
s.update(s.ram,True);check('unchanged_serialized_value_skips_write',s.writes,1,'PodConifgurationManager.Save')
old={'left':1,'right':1};left={**old,'left':2};right={**old,'right':3};s=Store(old);s.update(left);s.update(right)
check('two_updates_based_on_same_old_snapshot_can_lose_first',[s.ram,s.disk],[right,right],'record with + UpdateConfiguration; no shared read-modify-write lock')
s=Store({'mode':0});s.disk={'mode':1};check('external_file_change_does_not_update_cached_property',s.ram,{'mode':0},'Create loads once; Configuration updated by UpdateConfiguration')

def drain(requests):
 last={}
 for kind,value in requests:last[kind]=copy.deepcopy(value)
 if 'calibrate' in last:return [('calibrate',last['calibrate'])]
 return [(k,last[k]) for k in ['firmness','mode'] if k in last]
check('batch_keeps_last_target',drain([('firmness','manual1'),('firmness','manual2')]),[('firmness','manual2')],'FirmnessReadyState.RunTick')
check('mode_runs_after_target_regardless_enqueue_order',drain([('mode',1),('firmness',6)]),[('firmness',6),('mode',1)],'FirmnessReadyState.RunTick')
check('calibration_suppresses_drained_target_and_mode',drain([('firmness',6),('calibrate',[0]),('mode',1)]),[('calibrate',[0])],'FirmnessReadyState.RunTick')
check('last_calibration_request_wins_batch',drain([('calibrate',[0]),('calibrate',[1])]),[('calibrate',[1])],'FirmnessReadyState.RunTick')
check('dynamic_after_manual_wins_same_target_type',drain([('firmness','manual'),('firmness','dynamic')]),[('firmness','dynamic')],'DynamicModeService.ApplyPresetToSide + Ready.RunTick')
check('manual_after_dynamic_wins_same_target_type',drain([('firmness','dynamic'),('firmness','manual')]),[('firmness','manual')],'FirmnessController.SetFirmness + Ready.RunTick')
s=Store({'target':1});actual_device=1;s.update({'target':8});send_ok=False
if send_ok:actual_device=8
check('target_saved_before_failed_send',[s.disk,actual_device],[{'target':8},1],'Ready.OnRequest + SendFirmnessCommand catches errors')
s=Store({'target':1});s.update({'target':8},False);actual_device=8
check('target_save_failed_but_send_may_succeed',[s.ram,s.disk,actual_device],[{'target':8},{'target':1},8],'Ready.SaveTargetFirmness catches errors then OnRequest sends')
stored={'range':[0,10],'bins':{0:[.1,.1],1:[.2,.2]}};device=copy.deepcopy(stored)
device['range']=[0,8];device['bins'][0]=[.3,.3]
check('tolerance_later_send_failure_retains_old_store',[stored,device],[{'range':[0,10],'bins':{0:[.1,.1],1:[.2,.2]}},{'range':[0,8],'bins':{0:[.3,.3],1:[.2,.2]}}],'ApplyAndPersistToleranceBandsAsync: Save only after every send; no rollback')
new={'range':None,'bins':{1:[.5,.5]}};merged={'range':stored['range'],'bins':{**stored['bins'],**new['bins']}}
check('tolerance_patch_merge_by_bin_index',merged,{'range':[0,10],'bins':{0:[.1,.1],1:[.5,.5]}},'ToleranceBands.MergedOnto')

# No reimplementation of the missing posture producer: only consumer gates.
def posture_action(mtime_changed,heartbeat_fresh,posture_changed,ready):
 if not mtime_changed:return 'skip before heartbeat check'
 if not heartbeat_fresh:return 'queue default' if ready else 'skip not ready'
 if not posture_changed:return 'no new target'
 return 'queue posture preset' if ready else 'record posture then skip not ready'
check('unchanged_mtime_prevents_stale_fallback',posture_action(False,False,True,True),'skip before heartbeat check','DynamicModeService.ReadAndParseConfigFile')
check('same_posture_after_manual_does_not_reassert',posture_action(True,True,False,True),'no new target','DynamicModeService.ProcessDevicePosture')
check('changed_posture_not_ready_updates_state_without_send',posture_action(True,True,True,False),'record posture then skip not ready','ProcessDevicePosture state set before ApplyPresetToSide')
check('stale_heartbeat_when_file_changed',posture_action(True,False,False,True),'queue default','DynamicModeService.ProcessDevicePosture/IsStale')
mapping=[0.,.05,.4,.9,1.45,2.05,2.65,3.6,4.8,6.8,8.5]
check('level_mapping_not_linear',[mapping[i] for i in [0,1,5,10]],[0.,.05,2.05,8.5],'PressureMappings.GetPressureForLevel')
check('target_four_bags_has_four_floats',len(b''.join(struct.pack('<f',mapping[i]) for i in [1,3,5,7])),16,'Ready.SendFirmnessCommand 0x52')
result=dict(status='PASS',case_count=len(cases),cases=cases,scope='Finite synthetic source-precedence/order/failure contracts only. No vendor code, filesystem-failure injection, peripheral, account or device execution; concurrency example specifies an allowed interleaving, not a measured frequency.')
(O/'MODEL_RESULTS.json').write_text(json.dumps(result,ensure_ascii=False,indent=2)+'\n')
loaded=json.loads((O/'MODEL_RESULTS.json').read_text());assert all(x['observed']==x['expected'] for x in loaded['cases'])
print(json.dumps({'status':'PASS','finite_cases':len(cases),'persisted_comparisons':len(cases)}))
