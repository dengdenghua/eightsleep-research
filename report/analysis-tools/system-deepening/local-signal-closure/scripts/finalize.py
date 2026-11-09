#!/usr/bin/env python3
"""Write normal contract metadata and hash manifest for this new analysis only."""
from pathlib import Path
import hashlib,json
O=Path(__file__).resolve().parents[1]
def put(name,x):(O/name).write_text(json.dumps(x,ensure_ascii=False,indent=2)+'\n')
contracts={
 'scope':'normal producer layouts and observed code contracts only',
 'op35':{'body_bytes':176,'wire_version':2,'wire_freq':200,'records':10,'words':['second LIS packed Z/status','first LIS packed Z/status','second range','first range'],'host_consumer':'legacy Sensor (UsbSensor ignores 34/35)','topic':'raw.sens.lps','type':'lps','outputs':{'pres.left1':'word3 first range','pres.right1':'word2 second range','pres.left2':'word1 first Z/status','pres.right2':'word0 second Z/status'},'physical_units':None},
 'op33':{'body_bytes':27,'tick':'u32 BE','statuses':'two u16 BE','records':6,'record':'u8 id + u16 BE low bits of int(float32(cached*100))','producer':'0802572c normal main state1/3','host_consumers':['legacy Sensor aggregate','UsbSensor side queue with enableA30Mode'],'topic':'raw.sens.capsense','type':'capSense','keys':['out','cen','in','status'],'source_missing':-1.0,'wire_missing_hex':'ff9c','host_missing_integer':65436,'host_statuses':['good','railed','locked','converged','unknown'],'physical_units':None},
 'op44':{'body_bytes':90,'tick':'u32 BE','statuses':'two u16 BE','version':1,'records':16,'record':'u8 id + IEEE754 binary32 big endian bits','host_sides':'id<8 left, id>=8 right, original within-side order','normal_valid_items_per_side':8,'topic':'raw.sens.capextended','type':'capSense2','normal_negative_one':'float -1.0 remains valid; not null','cbor_float_primitive':'001d7620 writes 0xfa + BE32','physical_units':None},
 'op3d':{'body_bytes':51,'version':'u16 BE =1','timestamp_in_wire':False,'fields':['vmidref']+['thermistor'+str(i) for i in range(8)]+['humidity','ambient','mcu_temp'],'record':'12 IEEE754 binary32 BE fields','host_timestamp':'local source00252b10 when event is consumed','consumer':'UsbSensor→1e1070→1e64c0→1ecc14→side queues','queue_gate':'enableA30Mode','outputs':[{'mask':'0x08000000','topic':'raw.x.sens.bedtemp','type':'stealthTemps','policy':'missing side null; thermistors outside inclusive2..60 null; four auxiliary negative values null'},{'mask':'0x00000008','topic':'raw.sens.bedtemp','type':'bedTemp','policy':'whole-side gate; first3 fields multiplied by100 and truncated to signed16 then signed integer average; does not reuse stealthTemps per-field validity'}]},
 'fdc_cache':{'initial_value':-1,'valid_age_condition':'age<5500 tick','grace_end_condition':'age>4999 tick','corrected':'float32(signed24*2^-19 + CAPDAC*3.125)','negative_corrected':-1,'status_check_period_ticks':30000,'send_timer_ticks':500,'timer_catchup':False,'achieved_rate':None},
 'temperature':{'queue_capacity':10,'full_policy':'pop oldest then push','mean_valid_range_inclusive':[2,60],'no_valid_value':-100,'read_consumes_queue':False,'age_eviction':False,'weighted_helper':'W(a,b,r)=float32((max(a,b)+.2*min(a,b)+.1*r)/1.3)','all_three_valid_wrapper':'u=W(c,a,r), result=W(u,b,max(b,u))'},
 'limits':['Packet body includes opcode; payload length at Host excludes opcode.','Normal finite synthetic models, no target execution or measured signal.','No proof of target current configuration/physical units/electrode wiring/sampling cadence.','No recovered production sleep classifier or HRV model in these routes.']}
put('CONTRACTS.json',contracts)
files=[]
for p in sorted(O.rglob('*')):
 if not p.is_file() or p.name=='SOURCE_MANIFEST.json' or '__pycache__' in p.parts:continue
 b=p.read_bytes();files.append({'path':str(p.relative_to(O)),'bytes':len(b),'sha256':hashlib.sha256(b).hexdigest()})
put('SOURCE_MANIFEST.json',{'scope':'local-signal-closure final retained exports/scripts/models and reports','excluded':['SOURCE_MANIFEST.json (self)','__pycache__ (Python cache)'],'files':files})
for x in files:
 p=O/x['path'];assert p.stat().st_size==x['bytes'] and hashlib.sha256(p.read_bytes()).hexdigest()==x['sha256']
print(json.dumps({'manifest_files':len(files),'total_bytes':sum(x['bytes'] for x in files),'readback':'PASS'}))
