"""Normal nonUSB formula fixtures. Synthetic, no native execution or live sensor input.
Arithmetic function definitions reused from already reviewed USB mathematical model;
nonUSB binding is independently recorded in CONTRACTS and PAIR_COMPARISON.
Not a scheduler, ADC/I2C emulator or bit-exact implementation of vendor logf.
"""
from pathlib import Path
import struct,math,json
from collections import deque
O=Path(__file__).resolve().parents[1]
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
 rows=[]
 def rec(name,value,source):rows.append({'name':name,'result':value,'source':source,'synthetic':True,'status':'PASS'})
 assert [raw_fdc(0x1000,0),raw_fdc(0xf000,0)]==[2,-2];rec('signed24',[2,-2],'pass1/0801418c.txt')
 assert compensation(2,4)==14.5;rec('CAPDAC_compensation',14.5,'pass1/0801a338.txt')
 steps=[capdac_step(x,c,g) for x,c,g in [(-12.875,5,False),(12.875,4,False),(13,4,False),(13,4,True),(13,31,True)]]
 assert steps==[4,4,5,7,31];rec('CAPDAC_normal_steps',steps,'pass1/0801a338.txt')
 assert [cache(12,5499),cache(12,5500)]==[12,-1];rec('cache_age',[12,-1],'pass2/080188e8.txt')
 ages={1:[60000,0],2:[3000,0],3:[3000,3000],4:[60000,0]};assert status(ages)==0
 codes=[]
 for k,values in [(4,[60001,0]),(3,[3001,3001]),(2,[3001,0]),(1,[60001,0])]:ages[k]=values;codes.append(status(ages))
 assert codes==[4,3,2,1];rec('status_priority',codes,'pass2/08018e80.txt + RAW_TABLES')
 b=normal33(123,(1,4),[1.25,2.5,3.75,4.25,5.5,-1]);assert len(b)==27 and b[-2:]==bytes.fromhex('ff9c');(O/'model/normal33.body.bin').write_bytes(b);rec('normal33_body',{'size':27,'sentinel':b[-2:].hex()},'pass1/0801b834.txt + pass2/080189d8.txt')
 b=normal44(123,(1,4),list(range(8))+[-1]*8);assert len(b)==90 and b[-4:]==struct.pack('>f',-1.0);(O/'model/normal44.body.bin').write_bytes(b);rec('normal44_body',{'size':90,'version':b[9]},'pass1/0801b834.txt + pass2/080189d8.txt')
 q=deque(maxlen=10)
 for x in [-100,1,2,20,40,60,61,30,50,70,25]:q.append(f32(x))
 before=list(q);m=mean_valid(q);assert len(q)==10 and m==f32(227/7) and list(q)==before
 rec('rolling_10_valid_mean',{'window':before,'mean':m},'pass1/0801d6c0.txt +0801ec48.txt')
 t=thermistor(2387,1500,1500);assert 24<t<26;rec('normal_NTC',{'adc':2387,'cal':1500,'reference':1500,'modeled_temperature':t},'pass1/0801d6f0.txt')
 u=weighted(40,20,25);out=merge(20,30,40,25);assert out==weighted(u,30,max(u,30));assert merge(-100,30,-100,25)==30
 rec('two_stage_weighted_fusion',out,'pass1/0801eb90.txt +080185cc.txt')
 b=b'\x3d\x00\x01'+struct.pack('>12f',1650,*[20+i for i in range(8)],40,22,34);assert len(b)==51;(O/'model/normal3d.body.bin').write_bytes(b)
 rec('normal3d_layout',{'body_bytes':len(b),'float_items':12,'mcu_tick_present':False},'pass2/080164d0_08016815.txt + reference/nonusb/080122b6.txt')
 r={'status':'PASS','case_count':len(rows),'cases':rows,'limits':['Synthetic normal finite values only; not real data or hardware timings.','NTC logarithm mathematically modeled, not vendor softfloat bit equivalence.','Register values, timer ages, capacities and modes are explicit fixtures; asynchronous drivers and main scheduler not executed.','No Host/cloud reimplementation in this model; existing Host evidence referenced only.']}
 (O/'MODEL_RESULTS.json').write_text(json.dumps(r,ensure_ascii=False,indent=2)+'\n');print('PASS',len(rows))
if __name__=='__main__':main()
