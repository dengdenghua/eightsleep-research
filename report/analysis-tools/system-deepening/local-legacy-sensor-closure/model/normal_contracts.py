"""Finite NORMAL synthetic contracts; no MCU/emulator/serial/USB execution."""
import json,struct,math,hashlib
from pathlib import Path
O=Path(__file__).resolve().parents[1]
def f32(x):return struct.unpack('<f',struct.pack('<f',x))[0]
def crc(body):
 c=0x1d0f
 for x in body:
  c^=x<<8
  for _ in range(8):c=((c<<1)^(0x1021 if c&0x8000 else 0))&65535
 return c
def frame(body):
 assert 0<len(body)<=255
 x=bytes([len(body)])+body+struct.pack('>H',crc(body));out=bytearray([0x7e])
 for b in x:out.extend([0x7d,b^0x20] if b in [0x7d,0x7e] else [b])
 return bytes(out)
def unframe(data):
 assert data[0]==0x7e;x=bytearray();esc=False
 for b in data[1:]:
  if esc:x.append(b^0x20);esc=False
  elif b==0x7d:esc=True
  else:x.append(b)
 assert not esc and x[0]==len(x)-3
 body=bytes(x[1:-2]);assert crc(body)==int.from_bytes(x[-2:],'big');return body
# queue snapshots: no concurrent producer/consumer and sufficient positive normal fields.
def packet32(rows,frequency=100):
 if len(rows)<31:return None,0
 first=rows[0];chosen=[first]
 for row in rows[1:60]:
  if row['gains']!=first['gains']:break
  chosen.append(row)
 body=b'\x32\x02'+struct.pack('>IIHH',frequency,first['tick'],*first['gains'])
 body+=b''.join(struct.pack('>HH',*r['adc']) for r in chosen)
 return body,len(chosen)
def packet34(rows,frequency=500,field=2):
 if len(rows)<21:return None,0
 first=rows[0];chosen=[first]
 for row in rows[1:30]:
  if row['gain']!=first['gain']:break
  chosen.append(row)
 body=bytes([0x34,((field<<6)|1)&255])+struct.pack('>III',frequency,first['tick'],first['gain'])
 pair=(2,3) if field==1 else (0,1)
 for r in chosen:body+=b''.join(struct.pack('>I',r['adc'][i]&0xffffffff) for i in pair)
 return body,len(chosen)
def packet33(tick,status,values):
 # wire values are numeric slots; no physical side/location names.
 assert len(status)==2 and len(values)==6
 return b'\x33'+struct.pack('>IHH',tick,*status)+b''.join(bytes([i])+struct.pack('>H',int(f32(f32(v)*f32(100)))&65535) for i,v in enumerate(values))
def sign25(word):
 word&=0x1ffffff
 return word-(1<<25) if word&(1<<24) else word

def full_mcp_record(words,times,gain=400):
 # All four distinct logical channels arrive normally, times supplied, no IO/CRC errors.
 assert set(words)==set(range(4)) and len(times)==4
 start=times[0];delta=times[-1]-start
 tick=start+2-delta if delta<2 else start
 return {'adc':[sign25(words[i]) for i in range(4)],'tick':tick,'gain':gain}
def close(a,b):return float(f32(max(a,b)-min(a,b)))<1e-9
def cap_status(stable,same,values):
 if stable>=11:return 1 if any(15.9999<=x<=16 for x in values) else 2
 return 3 if close(values[2],values[1]) and close(values[1],values[0]) and same>10 else 0
def logarithm(x):
 assert x>0
 z=(x-1)/(x+1);z2=z*z;power=z;term=1.0;total=z;prev=0.0;iterations=0
 while prev!=total:
  prev=total;term+=2.0;power*=z2;total+=power/term;iterations+=1
  assert iterations<100000 # model guard only; not a firmware branch
 return 2*total

def ntc(adc,mode,beta,r4,r6):
 if adc<50 or (mode and adc>4050):return -100.0
 a=f32(adc);ratio=f32(f32(4095.0/a)-1.0)
 r=f32(f32(r6)*ratio) if mode==0 else f32(f32(r4)/ratio)
 ln=logarithm(float(f32(r/10000.0)))
 kelvin=1.0/(ln/beta+struct.unpack('<d',struct.pack('<Q',0x3f6b79e1dcb5db83))[0])
 return f32(float(f32(kelvin))-273.15)
def blend(a,b,c):return f32((0.2*min(a,b)+max(a,b)+0.1*c)/1.3)
def thermal_state(temp,target,hottest,core,previous):
 if temp==-100:return 0
 if f32(target+0.5)<temp or hottest>40.5 or core>66:return 2
 if f32(target-0.5)>=temp and hottest<=39.5 and core<=64:return 1
 return previous
def thermal_guard(proposed,power_limit):return 2 if proposed==1 and power_limit==0 else proposed
def packet31(tick,states,current,selector):return b'\x31'+struct.pack('>IBBHB',tick,*states,current,selector)
# NB 0x42220000 is 40.5, not 41.0; validated literal below.
def adc_normalize(adc,vref_cal,vref_sample):
 assert vref_sample>0
 vref=(vref_cal*3300//vref_sample)&65535
 v=f32(f32(adc*vref)/f32(4095000.0));v=min(v,f32(3.3))
 return int(v/3.3*4095)&65535

def run():
 cases=[]
 def ck(name,observed,expected,source):
  assert observed==expected,(name,observed,expected)
  cases.append({'name':name,'observed':observed,'expected':expected,'source':source,'pass':True})
 rows32=[{'tick':1000+i*10,'adc':[100+i,200+i],'gains':[1000,1100]} for i in range(80)]
 ck('32 below batch threshold',packet32(rows32[:30])[1],0,'08009654')
 b,n=packet32(rows32[:31]);ck('32 minimum batch', [len(b),n],[138,31],'08009654')
 b,n=packet32(rows32);ck('32 maximum snapshot batch',[len(b),n],[254,60],'08009654')
 ck('32 header/tick/gains',list(struct.unpack('>BBIIHH',b[:14])),[0x32,2,100,1000,1000,1100],'08009654')
 ck('32 framing roundtrip',unframe(frame(b)).hex(),b.hex(),'08008304/08124/082c4')
 changed=[dict(x) for x in rows32];changed[1]=dict(changed[1],gains=[1200,1100]);b,n=packet32(changed);ck('32 new gain remains next batch',[len(b),n],[18,1],'08009654')
 rows34=[{'tick':1000+2*i,'adc':[i,-i,100+i,200+i],'gain':400} for i in range(50)]
 ck('34 below batch threshold',packet34(rows34[:20])[1],0,'08009528')
 b,n=packet34(rows34[:21]);ck('34 minimum batch',[len(b),n],[182,21],'08009528')
 b,n=packet34(rows34);ck('34 maximum snapshot batch',[len(b),n],[254,30],'08009528')
 ck('34 initialized flags and first pair',[b[1],list(struct.unpack('>II',b[14:22]))],[0x81,[0,0]],'08008ec0; initialized0800eb10')
 b1,n=packet34(rows34,field=1);ck('34 alternate pair',[b1[1],list(struct.unpack('>II',b1[14:22]))],[0x41,[100,200]],'08008ec0')
 ck('34 framing roundtrip',unframe(frame(b)).hex(),b.hex(),'08008304/08124/082c4')
 changed=[dict(x) for x in rows34];changed[1]=dict(changed[1],gain=800);b,n=packet34(changed);ck('34 gain boundary',[len(b),n],[22,1],'08009528')
 rec=full_mcp_record({0:1,1:0x1ffffff,2:0x1000000,3:0xffffff},[100,100,101,101]);ck('MCP complete 4-channel record',rec,{'adc':[1,-1,-16777216,16777215],'tick':101,'gain':400},'08009f68')
 ck('MCP complete immediate timestamp',full_mcp_record({i:i for i in range(4)},[100]*4)['tick'],102,'08009f68')
 b=packet33(0x01020304,[2,3],[1,2,3,4,5,6]);ck('33 body length',len(b),27,'0800d3a0..d485')
 ck('33 status and six tagged fields',[list(struct.unpack('>IHH',b[1:9])),[list(struct.unpack('>BH',b[i:i+3])) for i in range(9,27,3)]],[[0x01020304,2,3],[[i,(i+1)*100] for i in range(6)]],'0800d3a0..d485')
 ck('33 wire escaping roundtrip',unframe(frame(b)).hex(),b.hex(),'08008304')
 ck('cap state initial',cap_status(0,0,[1,2,3]),0,'080092f0')
 ck('cap stable finite',cap_status(11,0,[1,2,3]),2,'080092f0')
 ck('cap stable rail numeric interval',cap_status(11,0,[1,16,3]),1,'080092f0')
 ck('cap equal group counter',cap_status(0,11,[2,2,2]),3,'080092f0')
 ck('ln 1 exact',logarithm(1),0.0,'0800af98')
 ck('ln 2 finite agreement',abs(logarithm(2)-math.log(2))<1e-14,True,'0800af98')
 ck('NTC integer ADC near 25 degree point',abs(ntc(2048,1,3380,10000,10000)-25.0)<0.02,True,'0800b044/af98')
 ck('NTC low ADC sentinel',ntc(49,1,3380,10000,10000),-100.0,'0800b044')
 ck('NTC inverted upper sentinel',ntc(4051,1,3380,7150,10000),-100.0,'0800b044')
 ck('blend finite weighted',abs(blend(30,32,25)-(0.2*30+32+0.1*25)/1.3)<1e-5,True,'08008d18')
 ck('thermal normal enable',thermal_state(29,30,39,63,2),1,'0800b194')
 ck('thermal hysteresis hold',thermal_state(30,30,40,65,1),1,'0800b194')
 ck('thermal target high',thermal_state(31,30,39,63,1),2,'0800b194')
 ck('zero power limit guard',thermal_guard(1,0),2,'08009070')
 ck('normal nonzero power limit',thermal_guard(1,80),1,'08009070')
 ck('31 status body length',len(packet31(1000,[1,2],123,1)),10,'080090a4')
 ck('thermal hottest literal',struct.unpack('<f',struct.pack('<I',0x42220000))[0],40.5,'0800b194')
 ck('ADC reference normalization',adc_normalize(1000,1500,1500),1000,'08008f0c')
 ck('ADC float then integer truncation',adc_normalize(123,1500,1500),122,'08008f0c/08005728')
 ck('escape reserved normal bytes',unframe(frame(b'\x01\x7d\x7e')).hex(),'017d7e','08008124')
 (O/'MODEL_RESULTS.json').write_text(json.dumps({'kind':'finite synthetic normal contracts','cases':cases,'pass':True,'limits':['No target code, hardware, account or network executed.','Queue input snapshots only, no concurrent IRQ, wraparound, error injection or throughput proof.','Positive finite floating-point cases only, not a proof of all libgcc exceptional-value semantics.','Slot labels/numeric flags do not identify physical sensor location.']},indent=2)+'\n')
 print(len(cases),'normal synthetic checks PASS')
if __name__=='__main__':run()
