#!/usr/bin/env python3
"""Normal finite-value arithmetic/schema checks; NOT firmware execution or device traces.

Derived from the retained functions named in SOURCE_FUNCTIONS.  Inputs are explicit
synthetic fixture values.  No scheduling, I2C, DMA, wall-clock or cloud simulation.
"""
import hashlib,json,math,struct
from collections import deque
from pathlib import Path

O=Path(__file__).resolve().parents[1]
SOURCE_FUNCTIONS={
 'fdc_registers':'mcu-pass8/0801df84.txt',
 'fdc_compensation':'mcu-pass6/080240e4.txt',
 'cache':'mcu-pass8/08022694.txt',
 'maps':'mcu-pass9/080226b4_08022727.txt',
 'producer':'mcu-pass8/0802572c.txt',
 'serializer':'mcu-pass7/08022784.txt',
 'status':'mcu-pass7/08022c2c.txt',
 'decode33':'pass3/0021abe0.txt',
 'decode44':'pass3/0021ad74.txt',
 'encode33':'pass3/001f2970.txt',
 'encode44':'pass3/001f5b80.txt',
 'temperature':'mcu-pass8/0802769c.txt',
 'rolling_read':'mcu-pass11/08028bf4.txt',
 'weighted':'mcu-pass10/0802241c.txt',
 'select':'mcu-pass8/08028b3c.txt',
 'side_capsense':'pass4/001f2c20.txt',
 'temp_dispatch':'pass4/0027e7b0.txt',
 'temp_queue':'pass7/001f0ae0.txt',
 'temp_filtered':'pass6/001f3940.txt',
 'temp_compatibility':'pass5/001f4140.txt',
}
def f32(x):return struct.unpack('<f',struct.pack('<f',x))[0]
def raw_fdc(high,low):
 w=((high<<16)|low)&0xffffffff
 if w&0x80000000:w-=0x100000000
 return f32((w>>8)*2**-19)
def compensation(raw,capdac):return f32(float(f32(raw))+float(capdac)*3.125)
def cache(value,age):return f32(value) if age<5500 else -1.0
def capdac_step(raw,capdac,grace=False):
 # Only the finite, nonnegative corrected-value branch. Grace lifetime external.
 corrected=compensation(raw,capdac)
 if corrected<0:return capdac
 if raw<=-12.875:return max(capdac-1,0)
 if raw>12.875:return min(capdac+(3 if grace else 1),31)
 return capdac
def status(age_groups,enabled=True,tick=2000):
 if not enabled or tick<2000:return 0
 for code,threshold in ((1,60000),(2,3000),(3,3000),(4,60000)):
  flags=[x>threshold for x in age_groups[code]]
  if (all(flags) if code==3 else any(flags)):return code
 return 0
def normal33(tick,statuses,values):
 assert len(values)==6
 b=b'\x33'+struct.pack('>IHH',tick,*statuses)
 return b+b''.join(bytes([i])+struct.pack('>H',int(f32(f32(v)*100.0))&65535) for i,v in enumerate(values))
def normal44(tick,statuses,values):
 assert len(values)==16
 return b'\x44'+struct.pack('>IHHB',tick,*statuses,1)+b''.join(bytes([i])+struct.pack('>f',f32(v)) for i,v in enumerate(values))
STATUS_HOST=['good','railed','locked','converged','unknown']
def decode33(b):
 assert len(b)==27 and b[0]==0x33
 tick,ls,rs=struct.unpack_from('>IHH',b,1)
 v=[struct.unpack_from('>H',b,10+3*i)[0] for i in range(6)]
 return {'tick':tick,'type':'capSense','left':dict(zip(['out','cen','in'],v[:3]),status=STATUS_HOST[min(ls,4)]),'right':dict(zip(['out','cen','in'],v[3:][::-1]),status=STATUS_HOST[min(rs,4)])}
def decode44(b):
 assert len(b)==90 and b[0]==0x44
 tick,ls,rs,ver=struct.unpack_from('>IHHB',b,1)
 sides=[[],[]]
 for p in range(10,len(b),5):
  channel=b[p];value=struct.unpack_from('>f',b,p+1)[0]
  sides[int(channel>=8)].append({'value':value,'valid':True})
 assert list(map(len,sides))==[8,8]
 return {'tick':tick,'version':ver,'type':'capSense2','left':{'values':sides[0],'status':STATUS_HOST[min(ls,4)]},'right':{'values':sides[1],'status':STATUS_HOST[min(rs,4)]}}
def thermistor(adc,vrefcal,vref):
 # Normal positive ADC fixture only, no exceptional/division-zero behavior claim.
 calibrated=f32((vrefcal*3000)//vref)
 voltage=f32(f32(calibrated/4095.0)*f32(adc))
 resistance=f32(7150.0/f32(f32(calibrated/voltage)-1.0))
 logterm=f32(math.log(f32(resistance/10000.0)))
 inverse=float(f32(logterm/3380.0))+1.0/298.15
 return f32(float(f32(1.0/inverse))-273.15)
def mean_valid(values):
 total=f32(0);count=f32(0)
 for v in values:
  v=f32(v)
  if 2.0<=v<=60.0:total=f32(total+v);count=f32(count+1)
 return f32(total/count) if count>0 else -100.0
def weighted(a,b,reference):
 return f32((max(a,b)+.2*min(a,b)+.1*reference)/1.3)
def merge(a,b,c,reference):
 # A direct transcription for finite inputs of 28b3c, not a generic median.
 if reference==-100.0:reference=a
 if c==-100.0:
  if b==-100.0:return a
  if a==-100.0:return b
  return weighted(a,b,reference)
 if b==-100.0:
  if a==-100.0:return c
  return weighted(c,a,reference)
 if a==-100.0:return weighted(c,b,reference)
 interim=weighted(c,a,reference)
 return weighted(interim,b,interim if b<interim else b)
def main():
 tests=[];artifacts=[];dest=O/'model'/'fdc-temperature-results';dest.mkdir(exist_ok=True)
 def record(name,detail):tests.append({'name':name,'status':'PASS','synthetic':True,**detail})
 assert [raw_fdc(0x1000,0),raw_fdc(0xf000,0)]==[2.0,-2.0]
 record('signed24_register_conversion',{'high_low_fixtures':[[4096,0],[61440,0]],'result':[2,-2]})
 assert compensation(2,4)==14.5
 assert [capdac_step(x,c,g) for x,c,g in [(-12.875,5,False),(12.875,4,False),(13,4,False),(13,4,True),(13,31,True),(-15,4,False)]]==[4,4,5,7,31,4]
 record('compensation_and_capdac_normal_finite_branch',{'corrected_2_plus_4_times_3_125':14.5,'limits':'grace activation/timing and async I2C not modeled'})
 assert [cache(12,5499),cache(12,5500)]==[12,-1]
 record('cached_value_age_boundary',{'age_5499':12,'age_5500':-1,'unit':'firmware tick; no fresh-rate claim'})
 ages={1:[60000,0],2:[3000,0],3:[3000,3000],4:[60000,0]}
 assert status(ages)==0
 ages[4][0]=60001;assert status(ages)==4
 ages[3]=[3001,3000];assert status(ages)==4
 ages[3]=[3001,3001];assert status(ages)==3
 ages[2][0]=3001;assert status(ages)==2
 ages[1][0]=60001;assert status(ages)==1
 assert status(ages,False)==status(ages,tick=1999)==0
 record('status_strict_age_and_priority',{'ordered_codes':[1,2,3,4],'all_policy_only':3,'limits':'ages are supplied, not elapsed runtime'})
 for name,b,decode in [('normal33',normal33(123456,(1,4),[1.25,2.5,3.75,4.25,5.5,-1]),decode33),('normal44',normal44(123456,(3,4),[float(i)/2 for i in range(8)]+[-1.0]*8),decode44)]:
  parsed=decode(b);path=dest/(name+'.body.bin');path.write_bytes(b)
  j=dest/(name+'.decoded.json');j.write_text(json.dumps(parsed,ensure_ascii=False,indent=2)+'\n')
  if name=='normal33':assert parsed['right']=={'out':65436,'cen':550,'in':425,'status':'unknown'}
  else:assert all(x=={'value':-1.0,'valid':True} for x in parsed['right']['values'])
  record(name+'_producer_to_host_schema',{'bytes':len(b),'output':parsed,'time_scope':'tick retained; host epoch mapper deliberately not reimplemented'})
  for p in [path,j]:artifacts.append({'path':str(p.relative_to(O)),'bytes':p.stat().st_size,'sha256':hashlib.sha256(p.read_bytes()).hexdigest()})
 q=deque(maxlen=10)
 for x in [-100,1,2,20,40,60,61,30,50,70,25]:q.append(f32(x))
 before=list(q);m=mean_valid(q);assert m==f32((2+20+40+60+30+50+25)/7) and list(q)==before
 assert mean_valid([-100,1,61])==-100 and mean_valid([2,60])==31
 record('ten_value_window_filter_and_nonconsuming_mean',{'window':before,'mean':m,'accepted_inclusive':[2,60]})
 t=thermistor(2387,1500,1500);assert 24<t<26
 record('normal_ntc_formula',{'adc':2387,'vrefcal':1500,'vref':1500,'temperature':t,'limits':'synthetic counts and mathematically modeled log, not bit-exact vendor logf execution'})
 assert weighted(20,30,25)==f32(36.5/1.3)
 outputs=[merge(20,30,40,25),merge(20,-100,40,25),merge(-100,30,-100,25),merge(-100,-100,-100,-100)]
 assert outputs[0]==weighted(weighted(40,20,25),30,max(30,weighted(40,20,25)))
 assert outputs[0]!=weighted(20,30,max(30,weighted(40,20,25)))
 assert outputs[1]==weighted(40,20,25) and outputs[2]==30 and outputs[3]==-100
 record('weighted_temperature_selection',{'inputs':['20,30,40,25','20,-100,40,25','-100,30,-100,25','all -100'],'outputs':outputs,'formula':'(max(a,b)+0.2*min(a,b)+0.1*reference)/1.3; wrapper selection as in 28b3c'})
 # Explicit software timestamps; 1f2c20 compares raw numbers and only logs >100.
 side_times=(1000,1201);assert min(side_times)==1000 and abs(side_times[0]-side_times[1])>100
 record('capsense_head_pair_time_difference',{'left_ts':1000,'right_ts':1201,'output_ts':1000,'both_heads_consumed':True,'numeric_difference_logged':True,'limits':'No nearest-time search. Log says 100ms but this check does not change decoder time units.'})
 fields=[1650.0,-100.0,20.0,30.0,60.0,2.0,40.0,50.0,25.0,40.0,22.0,34.0]
 b=b'\x3d\x00\x01'+struct.pack('>12f',*fields);assert len(b)==51
 decoded=list(struct.unpack('>12f',b[3:]));therms=decoded[1:9]
 filtered=[v if 2<=v<=60 else None for v in therms]
 # Signed16 centi-values before signed truncating integer division, as in 1f4140.
 compatibility=[int(f32(v*100.0)) for v in therms[:3]]
 avg=math.trunc(sum(compatibility)/3)
 assert filtered[0] is None and avg==-1666
 record('normal3d_distinct_temperature_output_policies',{'body_bytes':51,'wire_values':decoded,'stealthTemps_thermistors':filtered,'compatibility_first_three_centi':compatibility,'compatibility_average':avg,'limits':'Normal producer sentinel -100 is supplied as fixture; no actual sensor failure claim. No epoch mapper or cooperative queue timing execution.'})
 for name,data in [('normal3d.body.bin',b),('normal3d.filtered.json',(json.dumps({'version':1,'vmidref':decoded[0],'thermistors':filtered,'humidity':decoded[9],'ambient':decoded[10],'mcu_temp':decoded[11]},indent=2)+'\n').encode())]:
  p=dest/name;p.write_bytes(data);artifacts.append({'path':str(p.relative_to(O)),'bytes':len(data),'sha256':hashlib.sha256(data).hexdigest()})
 sources=[{'path':p,'sha256':hashlib.sha256((O/p).read_bytes()).hexdigest()} for p in SOURCE_FUNCTIONS.values()]
 result={'status':'PASS','case_count':len(tests),'cases':tests,'artifacts':artifacts,'sources':sources,'limits':['Offline normal finite fixture model; no native firmware execution.','No actual sensor values, deployment, physical pad wiring, achieved sampling cadence, I2C/DMA scheduling or cloud behavior.','33/44 decoding is the normal producer layout only; no malformed packets.','CBOR float primitive is proven by retained 001d7620 assembly, not executed in this model.','No claim these values implement sleep stages, HR/HRV or occupancy.']}
 (O/'FDC_TEMPERATURE_MODEL_RESULTS.json').write_text(json.dumps(result,ensure_ascii=False,indent=2)+'\n')
 print(json.dumps({'status':'PASS','cases':len(tests),'artifacts':len(artifacts)}))
if __name__=='__main__':main()
