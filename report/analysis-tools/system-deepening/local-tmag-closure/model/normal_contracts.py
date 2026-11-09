#!/usr/bin/env python3
"""Normal finite arithmetic and field-copy contract. No MCU or original code execution."""
import struct,json,copy,hashlib,math
from pathlib import Path
O=Path(__file__).resolve().parents[1]
def f(x):return struct.unpack('<f',struct.pack('<f',x))[0]
def crc6(b):
 assert len(b)==6;c=255
 for v in b:
  c^=v
  for _ in range(8):c=((c<<1)^(7 if c&128 else 0))&255
 return c

def normal_callback(cache,register,block):
 assert len(block)==7 and crc6(block[:6])==block[6]
 cache[register:register+6]=block[:6]
 return 0x16 if register==0x10 else None

def values(cache,scale):
 t,x,y,z=struct.unpack_from('>Hhhh',cache,0x10)
 return {'tmag_internal_temp':f(f(f(f(t)-f(17508))/f(60.1))+f(25)), 'x':f(f(f(x)*f(2**-15))*f(scale)), 'y':f(f(f(y)*f(2**-15))*f(scale)), 'z':f(f(f(z)*f(2**-15))*f(scale))}

def packet(groups,single=False):
 assert len(groups)==(1 if single else 2)
 body=bytes([0x39,0x82 if single else 2])
 for g in groups:body+=struct.pack('>4fB',g['tmp_temp'],g['x'],g['y'],g['z'],g['id'])
 return body

def host39(body):
 flag=body[1];single=bool(flag&128);p=2;parsed=[]
 for side in range(1 if single else 2):
  t,x,y,z,sid=struct.unpack_from('>4fB',body,p);p+=17
  valid=all(v>f(-3.4028234663852886e38) for v in [x,y,z]);connected=valid and f(f(x*x)+f(y*y))>f(3.05)
  sensor={0:'none',0x10:'TMAG5273A1',0x11:'TMAG5273A2',0x12:'TMAG5273B1',0x13:'TMAG5273B2',0x14:'TMAG5273C1',0x15:'TMAG5273C2',0x16:'TMAG5273D1',0x17:'TMAG5273D2',0x1f:'TMAG5273'}.get(sid,'unknown')
  # Error-string rendering itself is not reproduced; retain classification only.
  field=f(f(x*x)+f(y*y));error_class=('no mag sensor found' if sid==0 else 'tmag disconnected') if not valid else ('weak field' if f(.25)<field<=f(3.05) else None)
  parsed.append({'sensor':sensor,'error_class':error_class,'temp':t,'x':x,'y':y,'z':z,'sensor_id':sid,'is_connected':connected,'correct_orientation':(y<0 if side==0 else y>0) if connected else None,'flow_direction':(2-int(x<0) if side==0 else 2-int(x>0)) if connected else None})
 assert p==len(body)
 # Confirmed caller2128bc/2128d4 source equality and211870 source-read-only copy.
 return parsed,{'version_byte':flag,'first_map':copy.deepcopy(parsed[0]),'second_map':copy.deepcopy(parsed[0])}

class Aggregator:
 """Normal1fe910/1f74c0 control flow; queue payload is first map only.
 No CBOR/string rendering or native allocator execution. Objectside supplied.
 """
 def __init__(self):self.q=[[],[]];self.maps=[{},{}];self.outputs=[];self.trace=[]
 def one_call(self,side,ts,decoded):
  if len(self.q[side])<2 and (not self.q[0] or not self.q[1]):
   self.q[side].append((ts,copy.deepcopy(decoded['first_map'])))
   self.trace.append({'action':'enqueue','object_side':side,'ts':ts,'counts':[len(q) for q in self.q]})
   return True
  present=[]
  for k in [0,1]:
   if self.q[k]:
    t,m=self.q[k].pop(0);self.maps[k]=m;present.append(t)
  assert present
  self.outputs.append({'ts':min(present),'left':copy.deepcopy(self.maps[0]),'right':copy.deepcopy(self.maps[1])})
  self.trace.append({'action':'build_pending_then_caller_flush','ts':min(present),'counts':[len(q) for q in self.q]})
  return False
 def input(self,side,ts,decoded):
  if not self.one_call(side,ts,decoded):assert self.one_call(side,ts,decoded)

def main():
 cases=[];out=O/'model/results';out.mkdir(exist_ok=True)
 def ok(name,observed,expected):assert observed==expected;(cases.append({'name':name,'observed':observed,'expected':expected,'status':'PASS'}))
 cache=bytearray(32);raw=struct.pack('>Hhhh',17508,16384,-8192,4096)+bytes([1,0,0,0])
 blocks=[raw[:6],raw[6:12]]
 ok('normal_first_crc_block_chains_register',normal_callback(cache,0x10,blocks[0]+bytes([crc6(blocks[0])])),0x16)
 ok('normal_second_crc_block_completes',normal_callback(cache,0x16,blocks[1]+bytes([crc6(blocks[1])])),None)
 v=values(cache,40);ok('TMAG_four_raw_values',v,{'tmag_internal_temp':25.,'x':20.,'y':-10.,'z':5.})
 ok('range133_scaling',values(cache,133)['x'],66.5)
 g0={'tmp_temp':31.25,'x':2.,'y':-2.,'z':.5,'id':0x10};g1={'tmp_temp':22.5,'x':-3.,'y':4.,'z':1.,'id':0x13}
 body=packet([g0,g1]);parsed,result=host39(body)
 ok('bilateral_normal_size',len(body),36);ok('bilateral_distinct_inputs',parsed[0]!=parsed[1],True)
 ok('two_output_maps_same_first_input',result['first_map']==result['second_map']==parsed[0],True)
 ok('second_input_not_propagated_by_copy',result['second_map']==parsed[1],False)
 single=packet([g1],True);p,r=host39(single);ok('single_normal_size',len(single),19);ok('single_first_map_copy',r['first_map']==r['second_map']==p[0],True)
 ok('wire_temperature_is_TMP_source',struct.unpack_from('>f',body,2)[0],31.25)
 quiet=dict(g0,x=1.,y=1.);p,_=host39(packet([quiet,g1]));ok('XY_square_sum_below_connection_threshold',p[0]['is_connected'],False)
 ag=Aggregator();_,d0=host39(packet([g0],True));_,d1=host39(packet([g1],True))
 ag.input(0,100,d0);ag.input(1,105,d1)
 ok('pair_waits_for_next_input_before_flush',len(ag.outputs),0)
 ag.input(0,110,d0)
 ok('object_sides_preserve_different_first_maps',[ag.outputs[0]['left']['temp'],ag.outputs[0]['right']['temp']],[31.25,22.5])
 ok('paired_timestamp_minimum',ag.outputs[0]['ts'],100)
 ag.input(0,120,d0);ag.input(0,130,d0)
 ok('one_side_next_flush_keeps_other_cached_map',ag.outputs[-1]['right'],d1['first_map'])
 (out/'aggregation-trace.json').write_text(json.dumps({'trace':ag.trace,'outputs':ag.outputs,'limits':'Explicit sequential canonical input; no native allocator, coroutine scheduling or CBOR execution.'},indent=2)+'\n')

 (out/'normal39-bilateral.body').write_bytes(body);(out/'normal39-single.body').write_bytes(single)
 (out/'normal39-bilateral.decoded.json').write_text(json.dumps({'parsed':parsed,'decoder_output':result},indent=2)+'\n')
 artifacts=[]
 for p in sorted(out.glob('*')):
  b=p.read_bytes();artifacts.append({'path':str(p.relative_to(O)),'bytes':len(b),'sha256':hashlib.sha256(b).hexdigest()})
 (O/'MODEL_RESULTS.json').write_text(json.dumps({'status':'PASS','case_count':len(cases),'cases':cases,'artifacts':artifacts,'limits':['Canonical finite packets only, valid two-block CRC; not target execution.','Models212280 map copy and finite1fe910/1f74c0 per-object-side aggregation; no deployed physical side identity asserted.','No hardware units, callback cadence or deployment verified.']},ensure_ascii=False,indent=2)+'\n')
 print(json.dumps({'status':'PASS','cases':len(cases)}))
if __name__=='__main__':main()
