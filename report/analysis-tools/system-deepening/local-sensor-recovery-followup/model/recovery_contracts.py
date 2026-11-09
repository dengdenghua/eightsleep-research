#!/usr/bin/env python3
"""Finite normal fault/recovery events. Never loads or executes vendor binaries.
CRC/transport outcomes are Boolean observations supplied by fixtures; no malformed
frames or exploit schedules are generated. Times are software ticks, not rates.
"""
import copy,json,struct,hashlib
from pathlib import Path
O=Path(__file__).resolve().parents[1]
def f(x):return struct.unpack('<f',struct.pack('<f',x))[0]
def fvalues(blocks,scale=40):
 raw=blocks[0]+blocks[1];t,x,y,z=struct.unpack_from('>Hhhh',raw)
 return [f(f(f(f(t)-f(17508))/f(60.1))+f(25))]+[f(f(n*2**-15)*scale) for n in [x,y,z]]

class Sampling:
 #268c8/26722/211b6 and233f4. active below is sequential scheduler state,
 #not a guard inside233f4; no already-running callback/interleaving modeled.
 def __init__(self):
  self.current=list(range(10,18));self.backup=self.current[:];self.imu=[100]*24
  self.adc=[];self.iq=[];self.phase=0;self.active=True;self.crc_fail=0;self.available=True;self.trace=[]
 def stop(self):self.active=False;self.trace.append({'event':'stop','queues':[len(self.adc),len(self.iq)],'current':self.current[:]})
 def start(self):
  self.adc.clear();self.iq.clear();self.phase=0;self.active=True
  self.trace.append({'event':'start','queues':[0,0],'current':self.current[:],'assumption':'sync/drain does not run hardware; current retained until a later producer write'})
 def adc_read(self,enabled=True,age=8,drdy=True,crc_ok=True,ready=255,values=None):
  if not enabled:return True
  if age<8:self.current=self.backup[:];return True
  if not drdy:return False
  if not crc_ok:self.crc_fail+=1;return False
  if ready==0:return False
  for i in range(8):
   if ready&(1<<i):self.current[i]=values[i]
  self.backup=self.current[:];return True
 def snapshot(self,tick):
  if not self.active:return
  self.adc.append({'tick':tick,'values':self.current[:]});self.phase=(self.phase+1)%5
  if self.phase==0:self.iq.append(self.imu[:])
 def take_normal_batch(self):
  # Main1f900 requires only queue counts/mode, no sampling-active check.
  if len(self.adc)<5 or not self.iq:return None
  rows=self.adc[:5];del self.adc[:5];im=self.iq.pop(0)
  return {'rows':rows,'imu':im,'reported_crc_marker':False}

class Fdc:
 #240e4 partial measurement state +22694 cache getter. Other channels untouched.
 def __init__(self):self.cache=12.5;self.updated=0;self.grace=False;self.grace_start=0;self.flags=0x101;self.config=0xdf0;self.trace=[]
 def measurement(self,t,elapsed,complete=False,corrected=15.):
  if not complete:
   if elapsed>29:
    self.flags=0;self.config=0;self.trace.append({'event':'measurement_timeout','tick':t,'cache':self.cache,'updated':self.updated});return 'done_without_new_value'
   return 'pending'
  if corrected>=0 and (not self.grace or t-self.grace_start>4999):self.cache=corrected;self.updated=t
  if self.grace and t-self.grace_start>4999:self.grace=False
  self.trace.append({'event':'completed','tick':t,'cache':self.cache,'updated':self.updated});return 'done'
 def get(self,t):return self.cache if t-self.updated<5500 else -1.
 def reinitialize(self,t):self.cache=-1.;self.updated=t;self.flags=0;self.config=0;self.grace=False

class Tmag:
 #231f0 and29574. Six-byte blocks are normal sensor-value fixtures.
 def __init__(self):
  raw=struct.pack('>Hhhh',17508,8192,-8192,4096)+bytes(4)
  self.blocks=[raw[:6],raw[6:]];self.values=fvalues(self.blocks);self.ready=False;self.net=0;self.total=0;self.dirty=False;self.last_completion=0;self.request_timer=0;self.enabled=True;self.trace=[]
 def callback(self,register,valid,newblock,t):
  k=0 if register==0x10 else 1
  if valid:
   self.blocks[k]=bytes(newblock);self.net=max(0,self.net-1)
  else:self.net+=1;self.total+=1;self.dirty=True
  if register==0x16:self.ready=True;self.last_completion=t
  self.trace.append({'event':'data_callback','register':hex(register),'crc_valid':valid,'net':self.net,'total':self.total,'ready':self.ready})
  return 0x16 if register==0x10 else None
 def worker(self,t,write_status=1,read_status=1):
  if not self.enabled or not write_status or not read_status:return 'gate_wait'
  if t-self.request_timer>2000:self.request_timer=t;return 'request_reg10'
  if not self.ready:return 'no_ready'
  self.values=fvalues(self.blocks);self.ready=False;return 'converted'
 def body39(self,tmp=31.25):
  xyz=self.values[1:] if self.enabled else [f(-3.4028234663852886e38)]*3
  return bytes([0x39,0x82])+struct.pack('>4fB',tmp,*xyz,0x10)

def bus_complete(status,age):
 #1c688: success callback only for1; pending remains at10, timeout at11.
 if status:return {'request_status':status,'callback':status==1,'advance':True}
 if age>=11:return {'request_status':2,'callback':False,'advance':True}
 return {'request_status':0,'callback':False,'advance':False}

def assessment_due(current_alert,last_report,elapsed):return current_alert!=last_report or elapsed>=300000
def tmag_bad(enabled,last_completion_age,net):return not enabled or last_completion_age>59999 or net>4

def main():
 out=O/'model/results';out.mkdir(parents=True,exist_ok=True);cases=[];traces={}
 def case(name,observed,expected,evidence):
  assert observed==expected,(name,observed,expected)
  cases.append({'name':name,'observed':copy.deepcopy(observed),'expected':copy.deepcopy(expected),'evidence':evidence,'status':'PASS'})
 case('I2C_pending_at10',bus_complete(0,10),{'request_status':0,'callback':False,'advance':False},'0801c688')
 case('I2C_timeout_at11_skips_callback',bus_complete(0,11),{'request_status':2,'callback':False,'advance':True},'0801c688')
 case('I2C_success_runs_callback',bus_complete(1,11)['callback'],True,'0801c688')
 s=Sampling();old=s.current[:]
 s.adc_read(crc_ok=False,values=[900]*8)
 for t in [2,4,6,8,10]:s.snapshot(t)
 case('ADC_CRC_failure_five_snapshots_retain_current',[r['values'] for r in s.adc],[old]*5,'0801d228→0801d7dc→080233f4')
 case('ADC_failure_does_not_clear_availability',s.available,True,'0801d228 and0801d7dc do not write enabled')
 s.stop();case('stop_preserves_queued_batch_and_consumer_can_pop',s.take_normal_batch()['rows'][0]['values'],old,'080211b6;main1f900')
 for t in [12,14]:s.snapshot(t)
 case('completed_stop_setter_prevents_new_scheduled_snapshots',len(s.adc),0,'installer zero callback;active0')
 s.adc=[{'tick':0,'values':old}];s.iq=[s.imu[:]];s.start()
 case('start_flushes_queues_but_keeps_current',[len(s.adc),len(s.iq),s.current],[0,0,old],'08026722/080268c8')
 s.snapshot(20);s.adc_read(age=7,values=[900]*8)
 case('sync_window_7_replays_backup',s.current,old,'0801d7dc')
 s.adc_read(age=8,ready=1,values=[900]*8)
 case('read_after_window_updates_ready_channel_only',s.current,[900]+old[1:],'0801d7dc')
 traces['sampling']=s.trace
 d=Fdc();case('FDC_pending29',d.measurement(29,29),'pending','080240e4')
 case('FDC_timeout30_done_without_update',d.measurement(30,30),'done_without_new_value','080240e4')
 case('FDC_timeout_preserves_value_until_age5499',d.get(5499),12.5,'080240e4/08022694')
 case('FDC_cache_age5500_emits_sentinel',d.get(5500),-1.,'08022694')
 case('FDC_late_ready_skips_timeout_branch',d.measurement(5501,31,True,14.),'done','080240e4 pc8 ready gate')
 case('FDC_recovery_refreshes_cache',d.get(5501),14.,'080240e4')
 d.grace=True;d.grace_start=6000;d.measurement(10999,0,True,15.)
 case('FDC_grace4999_keeps_prior_cache',d.cache,14.,'080240e4')
 d.measurement(11000,0,True,15.);case('FDC_grace5000_accepts_new_value',d.cache,15.,'080240e4')
 d.reinitialize(11001);case('FDC_full_reinit_clears_cache',d.get(11001),-1.,'08023d28 memset428/cache initialization')
 traces['fdc']=d.trace
 m=Tmag();new=struct.pack('>Hhhh',18109,16384,-16384,8192)+bytes(4)
 m.callback(0x10,False,new[:6],100);m.callback(0x16,True,new[6:],101)
 case('TMAG_first_CRC_fail_second_success_net_zero',[m.net,m.total,m.ready],[0,1,True],'080231f0')
 m.worker(102);case('TMAG_converts_old_T_X_Y_and_new_Z',m.values,[25.,10.,-10.,10.],'080231f0→08029574')
 before=m.body39();(out/'mixed-cache-normal39.body').write_bytes(before)
 case('TMAG_mixed_output_has_normal19B_layout',len(before),19,'main1fcb6 normalversion82')
 m.callback(0x10,True,new[:6],103);m.callback(0x16,True,new[6:],104);m.worker(105)
 case('TMAG_all_good_recovery_replaces_both_blocks',m.values[1:],[20.,-20.,10.],'080231f0→08029574')
 (out/'recovered-normal39.body').write_bytes(m.body39())
 m.ready=False;case('TMAG_no_ready_keeps_value',m.worker(2000),'no_ready','08029574')
 case('TMAG_age2001_requests_without_zeroing',m.worker(2001),'request_reg10','08029574')
 case('TMAG_pending_IO_precedes_retry_timer',m.worker(5000,read_status=0),'gate_wait','08029574')
 m.callback(0x10,False,new[:6],5001);m.callback(0x16,False,new[6:],5002)
 case('TMAG_two_failed_CRCs_still_mark_completion',[m.ready,m.last_completion],[True,5002],'080231f0')
 case('TMAG_health_boundary_net4_vs5',[tmag_bad(True,100,4),tmag_bad(True,100,5)],[False,True],'0802694c')
 case('TMAG_health_boundary_age59999_vs60000',[tmag_bad(True,59999,0),tmag_bad(True,60000,0)],[False,True],'0802694c')
 case('health_check_is_gated_not_each_main_loop',[assessment_due(0,0,299999),assessment_due(0,0,300000),assessment_due(8,0,1)],[False,True,True],'0802694c leading gate')
 traces['tmag']=m.trace
 (out/'traces.json').write_text(json.dumps(traces,ensure_ascii=False,indent=2)+'\n')
 artifacts=[]
 for p in sorted(out.glob('*')):
  b=p.read_bytes();artifacts.append({'path':str(p.relative_to(O)),'bytes':len(b),'sha256':hashlib.sha256(b).hexdigest()})
 result={'status':'PASS','case_count':len(cases),'cases':cases,'artifacts':artifacts,'limits':['Normal bounded fault events with supplied transport/CRC outcomes; no malformed data generation, no target execution.','No IRQ reentrancy, corruption, USB transport or cloud model; no physical cadence inferred. Stop fixtures assume setter completed and no callback already running.','ADC start drain/reinit hardware transactions are not simulated; assertions distinguish shared current from queue contents.','FDC model represents one cache and selected measurement branches, not the entire I2C register machine.','Global assessment tests threshold/entry gate only; board-reset policy branches are documented statically, not hardware simulated.']}
 (O/'MODEL_RESULTS.json').write_text(json.dumps(result,ensure_ascii=False,indent=2)+'\n');print(json.dumps({'status':'PASS','cases':len(cases)}))
if __name__=='__main__':main()
