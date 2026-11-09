"""Analyst translation of selected normal firmware paths; no vendor code is executed."""
from pathlib import Path
import struct,json
O=Path(__file__).resolve().parents[1]
TABLES=json.loads((O/'RAW_TABLES.json').read_text())
def f(x):return struct.unpack('<f',struct.pack('<f',x))[0]
def due(now,last,period):
 d=(now-last)&0xffffffff
 return (True,(now-d%period)&0xffffffff) if d>=period else (False,last)
def selector(request):return {0:(0,0),1:(1,0),2:(0,1)}[request]
def power_guard(state,limit):return 2 if state==1 and limit==0 else state
def pwm(ver,hw,slot,power,period=2400):
 if ver=='42292' and hw<0x720 and slot in (2,3):return None
 if power==0:duty=0.0
 else:
  coeff,offset=(.45,.12) if ver=='42292' and hw>=0x720 else (.4,.1)
  duty=f(float(f(f(power)/f(100)))*coeff+offset)
 duty=max(0.0,min(1.0,duty))
 return int(float(f(f(period)*duty))+.5)&65535
def old_ramp(elapsed_ms,max_power):
 r=int(f(f(f(elapsed_ms)/f(300000))*f(max_power)))&255
 return int(max(10,min(max_power,r)))&255
def old_step(state,elapsed_ms):
 """One a238 invocation, separate from wall-time scheduler. slot boundary returns switch=True."""
 old=state['count'];state['count']=(old-1)&255
 if old==0:
  state['count']=10
  if state['active']:
   state['step']=(state['step']+1)&7
   if state['step']==0:state['ramp']=old_ramp(elapsed_ms,state['max'])
  return dict(switch=True,power=0,logical_channel=None)
 if not state['active']:return dict(switch=False,power=0,logical_channel=None)
 channel=TABLES['39704']['alarm_patterns'][state['pattern']][state['step']]
 p=int(f(f(f(10-state['count'])/f(10))*f(state['ramp'])))&255
 return dict(switch=False,power=p if channel<3 else 0,logical_channel=channel if channel<3 else None)
def new_power(elapsed_ms,max_power,channel):
 frac=min(f(1),f(f(elapsed_ms)/f(TABLES['42292']['ramp_ms'][channel])))
 scaled=f(f(f(max_power)*frac)/f(100))
 return max(5,int(float(max(f(.05),scaled))*100))
def new_advance(pattern,seq,step,seq_elapsed):
 p=TABLES['42292']['alarm_patterns'][pattern]['sequences'];s=p[seq]
 step=(step+1)%len(s['steps']);switch=step==0
 newseq=(seq+1)%len(p) if switch and seq_elapsed>=s['min_elapsed_ms'] else seq
 return newseq,step,switch,newseq!=seq
def run():
 checks=[]
 def ck(name,a,b):assert a==b,(name,a,b);checks.append(dict(name=name,actual=a,expected=b))
 ck('raw GPIO mapping equal across versions',TABLES['39704']['power'],[{**x,'selector_table':TABLES['39704']['power'][i]['selector_table']} for i,x in enumerate(TABLES['42292']['power'])])
 for q,expected in [(0,(0,0)),(1,(1,0)),(2,(0,1))]:ck('selector '+str(q),selector(q),expected)
 ck('heat zero power limit converts to off',power_guard(1,0),2)
 ck('positive power limit retains heat',power_guard(1,1),1)
 ck('15000ms before',due(14999,0,15000),(False,0))
 ck('15000ms at',due(15000,0,15000),(True,15000))
 ck('missed periods one callback + phase retained',due(47000,0,15000),(True,45000))
 ck('39704 immediate initialized timer',due(1000,(1000-15000)&0xffffffff,15000),(True,1000))
 ck('42292 init phase not simple full period',due(1000,(1000+113*20-15000)&0xffffffff,15000),(False,(1000+2260-15000)&0xffffffff))
 ck('42292 phased first boundary',due(3260,(1000+113*20-15000)&0xffffffff,15000),(True,3260))
 ck('39704 PWM zero',pwm('39704',0x500,0,0),0)
 ck('39704 PWM100 offset curve',pwm('39704',0x500,0,100),1200)
 ck('42292 below720 disabled slot2',pwm('42292',0x710,2,100),None)
 ck('42292 at720 slot2 enabled',pwm('42292',0x720,2,100),1368)
 ck('42292 at720 power0',pwm('42292',0x720,2,0),0)
 ck('42292 at720 power50',pwm('42292',0x720,2,50),828)
 ck('old sequence full power5min',old_ramp(300000,100),100)
 ck('old ramp byte conversion before clamp retained',old_ramp(900000,100),44)
 ck('old floor10',old_ramp(0,100),10)
 state=dict(count=10,active=True,step=0,pattern=0,ramp=10,max=100)
 events=[old_step(state,0) for _ in range(11)]
 ck('old slot ten power updates',[e['power'] for e in events[:10]],list(range(1,11)))
 ck('old slot eleventh callback switches',events[10]['switch'],True)
 ck('old slot advances to channel1',state['step'],1)
 state=dict(count=10,active=False,step=0,pattern=0,ramp=10,max=100)
 ck('inactive old side also countdown to switch',[old_step(state,0)['switch'] for _ in range(11)],[False]*10+[True])
 ck('new power floor at start',new_power(0,100,0),5)
 ck('new channel0 reaches ramp at120s',new_power(120000,100,0),100)
 ck('new channel2 still50 at120s',new_power(120000,100,2),50)
 ck('new first step is1',new_advance(0,0,0,0),(0,1,False,False))
 ck('new sequence ends switch',new_advance(0,0,11,0),(0,0,True,False))
 ck('new staged pattern before threshold',new_advance(1,0,1,29999),(0,0,True,False))
 ck('new staged pattern at threshold',new_advance(1,0,1,30000),(1,0,True,True))
 ck('new pattern1 four sequence floors',[s['min_elapsed_ms'] for s in TABLES['42292']['alarm_patterns'][1]['sequences']],[30000,60000,180000,330000])
 result=dict(kind='static-derived synthetic checks, not MCU execution or hardware measurements',count=len(checks),passed=True,checks=checks)
 (O/'MODEL_RESULTS.json').write_text(json.dumps(result,indent=2)+'\n');print(len(checks),'checks passed')
if __name__=='__main__':run()
