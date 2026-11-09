#!/usr/bin/env python3
"""Offline normal-value contract model, not vendor execution or a real scheduler."""
from pathlib import Path
from collections import deque
import struct,json,hashlib,importlib.util,math
O=Path(__file__).resolve().parents[1];OUT=O/'model/results'
spec=importlib.util.spec_from_file_location('legacy',O/'model/vendor/normal_contracts.py');legacy=importlib.util.module_from_spec(spec);spec.loader.exec_module(legacy)
def put(name,x):(OUT/name).write_text(json.dumps(x,ensure_ascii=False,indent=2)+'\n')
def s32(x):x&=0xffffffff;return x-(1<<32) if x&(1<<31) else x
def f32(x):return struct.unpack('<f',struct.pack('<f',x))[0]
def roundf_bits(x):
 bits=struct.unpack('<I',struct.pack('<f',x))[0];exp=((bits&0x7fffffff)>>23)-127
 assert math.isfinite(x)
 if exp<23:
  if exp<0:bits=(bits&0x80000000)|(0x3f800000 if exp==-1 else 0)
  else:
   mask=0x7fffff>>exp
   if bits&mask:bits=(bits+(0x400000>>exp))&~mask
 return struct.unpack('<f',struct.pack('<I',bits))[0]
def pack_z(z,status):
 shifted=f32(f32(z)+32767.0);rounded=roundf_bits(shifted)
 assert 0<=rounded<=65535 and 0<=status<=7 # normal finite test domain, not arbitrary conversion behavior
 return (int(rounded)&0xffff)+(status<<16)
class Range:
 def __init__(self):self.mem=bytearray(0x1534)
 def get(self,off):return struct.unpack_from('<i',self.mem,off)[0]
 def set(self,off,x):struct.pack_into('<i',self.mem,off,s32(x))
 def step(self,values):
  rec=bytearray(80)
  for off,v in zip([12,16,44,48],values):struct.pack_into('<i',rec,off,v)
  i=(self.get(0xd54)+1)&15;self.set(0xd54,i);self.mem[0x804+i*80:0x804+(i+1)*80]=rec
  means=[]
  for off in [12,16,44,48]:
   mean=s32(sum(self.get(0x804+k*80+off) for k in range(16)))>>4;means.append(mean);self.set(0xd04+off,mean)
  j=(self.get(0x1528)+1)%25;self.set(0x1528,j);self.mem[0xd58+j*80:0xd58+(j+1)*80]=self.mem[0xd04:0xd54]
  swings=[]
  for off in [12,16,44,48]:
   a=[self.get(0xd58+k*80+off) for k in range(25)];swings.append(s32(max(a)-min(a)))
  values=[max(swings[:2]),max(swings[2:])]
  self.set(0x152c,values[0]);self.set(0x1530,values[1]);return {'ring16_index':i,'ring25_index':j,'means':means,'ranges':values}
def check_range(name,stream):
 r=Range();raw=deque([[0]*4 for _ in range(16)],maxlen=16);avg=deque([[0]*4 for _ in range(25)],maxlen=25);trace=[]
 for n,row in enumerate(stream):
  got=r.step(row);raw.append(row);means=[sum(x[k] for x in raw)//16 for k in range(4)]
  assert all(abs(sum(x[k] for x in raw))<2**31 for k in range(4));avg.append(means)
  sw=[max(x[k] for x in avg)-min(x[k] for x in avg) for k in range(4)]
  assert got['means']==means and got['ranges']==[max(sw[:2]),max(sw[2:])]
  trace.append({'update':n+1,'record_selected_values':row,**got})
 put(name+'.json',trace);return trace

def main():
 checks=[]
 t=check_range('signed_startup',[[-1,16,-17,32]]);assert t[0]['means']==[-1,1,-2,2];checks.append('startup zeros, arithmetic right shift for signed sums')
 t=check_range('constant_warmup',[[160,320,480,640]]*45);assert t[-1]['ranges']==[0,0] and t[0]['ranges']==[20,40];checks.append('fixed16 divisor and initial zero windows disappear only after enough updates')
 t=check_range('variable_pair_ranges',[[i*100,(-1)**i*i*250,2000-i*30,(-1)**i*600] for i in range(65)]);checks.append('all4 selected fields, 16/25 wrap, pairwise max range against independent deque')
 z=[]
 for v in [-1024.5,-12.5,0,12.5,1024.5]:
  for status in [0,1,2,4,7]:
   w=pack_z(v,status);expected=math.floor(f32(f32(v)+32767)+0.5);assert w&0xffff==expected and w>>16==status
   z.append({'z':v,'status':status,'word':w,'low16':w&65535})
 put('z_status_pack.json',z);checks.append('normal finite Z+32767 rounded then low16 with three observed status bits')
 rows=[];body=bytes.fromhex('3502000000000000000000c8')+struct.pack('>I',100000)
 for i in range(10):
  # Pick actual modeled range states as external producer snapshots; not an elapsed-time or IRQ simulation.
  ranges=t[40+i]['ranges'];w0=pack_z(-250+i*2.5,i%8);w1=pack_z(500-i*3.5,(i+3)%8);words=[w0,w1,ranges[1],ranges[0]]
  body+=b''.join(struct.pack('>I',w) for w in words)
  rows.append({'row':i,'tick':100000+i*5,'range_trace_update':t[40+i]['update'],'range_first':ranges[0],'range_second':ranges[1],'z_first':500-i*3.5,'status_first':(i+3)%8,'z_second':-250+i*2.5,'status_second':i%8,'record_0x0c':w0,'record_0x10':w1,'record_0x14':ranges[1],'record_0x18':ranges[0]})
 assert len(body)==176;decoded=legacy.decode35(body)
 for i,r in enumerate(rows):
  for label,field in [('left1','range_first'),('right1','range_second'),('left2','record_0x10'),('right2','record_0x0c')]:assert decoded['buffer'][label][i]==r[field]
 (OUT/'diagnostic35.body.bin').write_bytes(body);put('diagnostic35.producer.json',rows);put('diagnostic35.host_contract.json',decoded)
 checks.append('all40 producer diagnostic words map through retained normal35 decoder to four lps arrays')
 machine=json.loads((O/'source/config/machine.json').read_text());keys=sorted([k for k,v in machine.items() if isinstance(v,dict)],reverse=True);cases=[]
 for rev,expected in [('000','A00'),('A00','A00'),('H99','A00'),('I00','I00'),('I20','I00'),('I21','I21'),('K60','I21')]:
  chosen=next((k for k in keys if k<=rev),keys[-1]);assert chosen==expected
  port=machine[chosen].get('sensorPort','');assert bool(port)==(chosen=='A00');cases.append({'synthetic_label_revision':rev,'chosen_entire_section':chosen,'sensorPort':port,'legacy_enabled':bool(port)})
 put('machine_selection.json',cases);checks.append('bundled3 configs descending lexical selection, whole-object no sensorPort inheritance')
 a=[65535]*1000;b=[65535]*1000;a[0]=0;b[0]=65534;a[999]=32768;b[999]=123
 payloads={'ordinary_array':a,'sub_bytes_intended_le':b''.join(struct.pack('<H',x) for x in a).hex()};assert len(bytes.fromhex(payloads['sub_bytes_intended_le']))==2000
 assert list(struct.unpack('<1000H',bytes.fromhex(payloads['sub_bytes_intended_le'])))==a
 put('legacy_u16_encoder_types.json',payloads);checks.append('uint16 sentinel65535 stays integer in array variant; sub variant preserves2000LE bytes')
 result={'status':'PASS','checks':checks,'check_count':len(checks),'range_updates':111,'z_pack_values':len(z),'normal35_values_checked':40,'machine_cases':len(cases),'limitations':['Python contract model, not original binary execution','range fixtures stay within signed32 sum/range bounds; no arbitrary float or invalid-input claims','normal35 uses chosen range snapshots and regular synthetic timestamps, no actual sensor freshness, interrupt scheduling or current deployment claim','legacy Sensor state2, stable anchor100000, sequential completions and newly initialized lps buffer inherited from vendor model','no native CBOR serializer or NATS publishing executed; host_contract is schema/array mapping only','no sleeping-person inference, physiological classification or physical calibration'], 'artifacts':[{'path':str(p.relative_to(O)),'bytes':p.stat().st_size,'sha256':hashlib.sha256(p.read_bytes()).hexdigest()} for p in sorted(OUT.iterdir())]}
 (O/'MODEL_RESULTS.json').write_text(json.dumps(result,ensure_ascii=False,indent=2)+'\n');print(json.dumps({k:v for k,v in result.items() if k not in ['artifacts','limitations']}))
if __name__=='__main__':main()
