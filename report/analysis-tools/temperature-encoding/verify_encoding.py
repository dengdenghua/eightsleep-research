#!/usr/bin/env python3
from pathlib import Path
import struct,json,itertools,hashlib,math
from engine import CPU,bits,flt,f32,CBASE,b,B
HERE=Path(__file__).resolve().parent;O=CBASE-0x1c0c;OUT=0x20070000
records=[]
# Direct raw getter route isolates integer serialization from window filtering.
for slot in [8,9,10,11,15]:
 for value in [-100.0,-327.68,-1.239,-0.0099,-0.0,0.0,0.0099,1.239,2.55,20.125,60.0,327.67,327.68,655.35]:
  c=CPU();c.put(CBASE+4*slot,bits(value));ret=c.run(0x0801ecf0,[O,slot,OUT]);got=bytes(c.get(OUT+k,1) for k in range(3))
  x=flt(bits(value))
  code=(0x00ff if slot==10 else 0x8000) if x==-100.0 else int(f32(x*100.0))&65535
  want=bytes([slot])+struct.pack('>H',code);assert ret==3 and got==want,(slot,value,got.hex(),want.hex())
  records.append({'slot':slot,'input_float32':x,'input_word':hex(bits(value)),'scaled_float32':None if x==-100 else f32(x*100.0),'encoded_hex':got.hex(),'code':hex(code)})
# Actual mean route (slot0) -> sentinel/centi encoding, not arbitrary stubbed values.
for values in [[],[20.0,30.0],[-100.0],[2.0,60.0],[61.0,10.0]]:
 c=CPU();q=CBASE+64
 for off,v in [(0,0x20040000),(4,10),(8,4),(12,0),(16,0)]:c.put(q+off,v)
 for x in values:c.put(0x20060000,bits(x));c.run(0x0801d6c0,[CBASE,0,0x20060000])
 c.run(0x0801ecf0,[O,0,OUT]);got=bytes(c.get(OUT+k,1) for k in range(3));valid=[x for x in values if 2<=x<=60];mean=sum(valid)/len(valid) if valid else -100.0;expected=bytes([0])+struct.pack('>H',0x8000 if mean==-100 else int(f32(mean*100))&65535);assert got==expected
 records.append({'slot':0,'queue_values':values,'encoded_hex':got.hex()})
# Independent finite reference: double intermediates then binary32 return.
def W(a,z,r):
 a,z,r=map(lambda x:flt(bits(x)),[a,z,r]);return f32(((max(a,z)+0.2*min(a,z))+0.1*r)/1.3)
def merge(a,z,c,r):
 a,z,c,r=map(lambda x:flt(bits(x)),[a,z,c,r]);r=a if r==-100 else r
 if c==-100:
  if z==-100:return a
  if a==-100:return z
  return W(a,z,r)
 if z==-100:
  if a==-100:return c
  return W(c,a,r)
 if a==-100:return W(c,z,r)
 u=W(c,a,r);return W(u,z,max(z,u))
fusion=[]
for values in itertools.product([-100.0,2.0,20.0,60.0],repeat=4):
 cpu=CPU();got=cpu.run(0x0801eb90,[bits(x) for x in values]);want=bits(merge(*values));assert got==want,(values,hex(got),hex(want))
 fusion.append({'inputs':list(values),'output_word':hex(got),'output_float':flt(got)})
# Specific reachability-not-established function-entry witness: missing fallback reference affects result.
witness=[-100.0,2.0,2.0,-100.0];cpu=CPU();got=cpu.run(0x0801eb90,[bits(x) for x in witness]);assert flt(got)<2 and flt(got)!=-100.0
r={'result':'PASS','image_sha256':hashlib.sha256(b).hexdigest(),'encoding_cases':len(records),'encoding_records':records,'fusion_cases':len(fusion),'fusion_records':fusion,'function_entry_witness':{'inputs':witness,'output_word':hex(got),'output_float':flt(got),'scope':'Synthetic function-entry tuple; caller/real-device reachability NOT established.'},'limitations':['Native byte control flow, actual compiled float comparisons and int conversion interpreted.','f32/f64 arithmetic and conversions summarized; no vendor softfloat bit-equivalence proof for all IEEE inputs.','Integer tests finite in int32 range; no NaN/Inf conversion contract claimed.','Physical units and slot10 business meaning not inferred.']}
(HERE/'ENCODING_VERIFICATION.json').write_text(json.dumps(r,ensure_ascii=False,indent=2)+'\n');print('PASS',len(records),'integer cases;',len(fusion),'fusion cases; witness',flt(got))
