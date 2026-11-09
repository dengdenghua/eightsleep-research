"""Finite normal-input contracts from static A02 code. Not target execution.
No malformed-packet, all-float-pattern or real timer/peripheral equivalence claim.
"""
from dataclasses import dataclass, field
from pathlib import Path
from copy import deepcopy
import json,struct
O=Path(__file__).resolve().parents[1]
MODE=[dict(cap=100,sleep=5,grants=[120000,90000,240000]),dict(cap=80,sleep=600,grants=[240000,180000,480000])]
@dataclass
class Scheduler:
    interval:int=50
    last:int=0
    grants:list=field(default_factory=lambda:MODE[0]['grants'][:])
    active_grant:int=0
    sleep:int=5
    steady:int=1000
    state:int=0
    idle:int=0
    profile:int=0
    pump_max:int=100
    mode:int=0
    def set_interval(self,value,now):
        if not 1<=value<=60000:return False
        self.interval=value;self.last=(now-value)&0xffffffff;return True
    def due(self,now):return ((now-self.last)&0xffffffff)>=self.interval
    def set_grants(self,value):
        if not 1<=value<=300000:return False
        self.grants=[value]*3;return True
    def select(self,kind):self.active_grant=self.grants[kind]
    def set_steady(self,value):
        if not 1<=value<=6500:return False
        self.steady=value;return True
    def can_leave_steady(self,elapsed,stable_count):return elapsed>=self.steady and (elapsed>=8000 or stable_count>=3)
    def set_sleep(self,value):
        if not 1<=value<=3600:return False
        self.sleep=value;return True
    def apply_mode(self,n,pumps=()):
        if n not in (0,1):return False
        d=MODE[n];self.mode=n;self.pump_max=d['cap'];self.sleep=d['sleep'];self.grants=d['grants'][:]
        for p in pumps:p.target=d['cap']
        return True
@dataclass
class Motion:
    enabled:bool=True
    threshold:int=50
    quiet:int=3000
    ceiling:int=60000
    state:int=1
    start:int=100
    quiet_flag:bool=True
    def gate(self):return self.enabled and self.state in (1,2)
    def configure(self,en,t,q,c,scheduler):
        if en not in (0,1) or not 10<=t<=1000 or not 0<=q<=30000 or not 1000<=c<=600000:return False
        before=self.gate();self.enabled=bool(en);self.threshold=t;self.quiet=q;self.ceiling=c
        if not en:self.state=4;self.quiet_flag=False
        elif self.state==4:self.state=0
        if before and not self.gate() and scheduler.state==4:scheduler.state=0;scheduler.idle=0
        return True
@dataclass
class Pump:
    minimum:int=20
    maximum:int=100
    current:int=0
    target:int=100
    state:int=0
    up_ms:int=100
    down_ms:int=100
    step_ms:int=10
    steps:int=0
    step:int=0
    down_start:int=0
    def output(self,value):
        value=min(value,100)
        self.current=0 if value==0 else max(self.minimum,min(value,self.maximum))
    def speed(self,value):
        if not 0<=value<=100:return False
        self.target=value
        if self.state==3:self.output(value)
        return True
    def ramp_config(self,up,down):
        if not 0<=up<=2000 or not 0<=down<=2000:return False
        self.up_ms=up;self.down_ms=down;return True
    def enable(self):
        if not self.target:self.state=0;self.output(0);return
        self.state=2;self.step=0;self.steps=self.up_ms//self.step_ms
        if self.current>=self.target:self.state=3
        elif self.steps==0:self.output(self.target);self.state=3
    def disable(self):
        self.state=4;self.down_start=self.current;self.step=0;self.steps=self.down_ms//self.step_ms
        if not self.steps:self.state=0;self.output(0)
    def tick_due(self):
        if self.state==2:
            self.step+=1;value=self.target*self.step//self.steps
            if value>=self.target or self.step>=self.steps:self.output(self.target);self.state=3
            else:self.output(value)
        elif self.state==4:
            self.step+=1;value=self.down_start*(self.steps-self.step)//self.steps
            if value<=0 or self.step>=self.steps:self.output(0);self.state=0
            else:self.output(value)
@dataclass
class Valve:
    ramp_ms:int=10
    ramp_step:int=5
    hold_ms:int=50
    maintain:int=70
    close1:int=40
    close1_ms:int=250
    close2:int=30
    close2_ms:int=250
    state:int=0
    output:int=0
    progress:int=0
    captured_interval:int=10
    origin:int=0
    close_phase:int=0
    def opening_config(self,opening,closing=None):
        rm,rs,hm,maint=opening
        if not (1<=rm<=1000 and 1<=rs<=100 and 0<=hm<=10000 and 1<=maint<=100):return False
        self.ramp_ms,self.ramp_step,self.hold_ms,self.maintain=opening
        # 11B host message fills all close fields from current static mode table.
        fields=(40,250,30,250) if closing is None else closing
        for name,val,limit in zip(('close1','close1_ms','close2','close2_ms'),fields,(100,2000,100,2000)):
            if 0<=val<=limit:setattr(self,name,val)
        return True
    def close_config(self,p1,t1,p2,t2):
        assert 0<=p1<=255 and 0<=p2<=255 and 0<=t1<=0xffffffff and 0<=t2<=0xffffffff
        self.close1,self.close1_ms,self.close2,self.close2_ms=p1,t1,p2,t2
    def open(self,now):
        self.state=2;self.progress=0;self.output=0;self.captured_interval=self.ramp_ms;self.origin=now-self.ramp_ms
    def close(self,now):
        if self.state==0:return
        if self.close1==0:self.state=0;self.output=0
        else:self.state=5;self.close_phase=0;self.origin=now;self.output=min(self.close1,100)
    def tick(self,now):
        if self.state==2 and now-self.origin>=self.captured_interval:
            self.origin=now-(now-self.origin)%self.captured_interval
            self.progress=min(100,self.progress+self.ramp_step);self.output=self.progress
            if self.progress>=100:self.state=3;self.origin=now
        elif self.state==3 and now-self.origin>=self.hold_ms:self.state=4;self.output=self.maintain
        elif self.state==5:
            duration=self.close1_ms if self.close_phase==0 else self.close2_ms
            if now-self.origin>=duration:
                if self.close_phase==0 and self.close2:
                    self.close_phase=1;self.origin=now;self.output=min(self.close2,100)
                else:self.state=0;self.output=0
def pwm_compare(duty,arr,reverse=False,valve=False):
    ccr=arr+1 if valve and duty==100 else duty*arr//100
    return (arr-ccr)&0xffffffff if reverse else ccr
def config_packet(n):
    # v2 layout reconstructed independently from wire writes, not vendor parser.
    out=bytearray([2]);out.extend(struct.pack('>7I',50,120000,90000,240000,1000,5,60))
    out.extend(struct.pack('>4f',0,10,1,1));out.extend(bytes([0,100,1,10]))
    for i in range(10):out.extend(struct.pack('>ff',i/100,i/50))
    out.append(n)
    for i in range(n):out.extend(struct.pack('>5fBf',.43,1.65,0,1.65,0,1,.25))
    return bytes(out)

tests=[]
def ck(name,condition):
    assert condition,name
    tests.append({'name':name,'passed':True})
s=Scheduler();ck('interval lower accepted and immediately due',s.set_interval(1,1234) and s.due(1234))
ck('interval upper accepted',s.set_interval(60000,1234))
ck('interval zero rejected',not s.set_interval(0,1234));ck('interval 60001 rejected',not s.set_interval(60001,1234))
ck('steady6500 accepted',s.set_steady(6500));ck('steady6501 rejected despite log60000',not s.set_steady(6501))
ck('steady lower bound accepted',s.set_steady(1));ck('steady zero rejected',not s.set_steady(0))
s.set_steady(6500);ck('minimum wait still required',not s.can_leave_steady(6499,3));ck('stable3 and6500 allows',s.can_leave_steady(6500,3));ck('8000 bypasses slope count',s.can_leave_steady(8000,0))
s.select(0);prior=s.active_grant;ck('grant valid all three overwritten',s.set_grants(300000) and s.grants==[300000]*3)
ck('inflight grant snapshot unchanged',s.active_grant==prior);s.select(1);ck('next selection consumes new grant',s.active_grant==300000)
ck('grant300001 rejected',not s.set_grants(300001));s.apply_mode(1);ck('mode can install480000 beyond uniform setter maximum',s.grants[2]==480000)
s.set_grants(1000);s.apply_mode(0);ck('later mode replaces custom grants',s.grants==MODE[0]['grants'])
ck('sleep0 rejected and3600 accepted',not s.set_sleep(0) and s.set_sleep(3600));ck('sleep3601 rejected',not s.set_sleep(3601))
m=Motion();s.state=4;s.idle=59;ck('motion valid inclusive lower limits',m.configure(1,10,0,1000,s))
old_start=m.start;ck('active gate parameter update keeps original start',m.start==old_start and m.state==1)
ck('disable releases gate and wakes sleep',m.configure(0,1000,30000,600000,s) and not m.gate() and m.state==4 and s.state==0 and s.idle==0)
ck('enable disabled state resets to idle',m.configure(1,50,3000,60000,s) and m.state==0)
for name,args in [('threshold9',(1,9,0,1000)),('threshold1001',(1,1001,0,1000)),('quiet30001',(1,50,30001,1000)),('ceiling999',(1,50,0,999)),('ceiling600001',(1,50,0,600001))]:ck('reject motion '+name,not m.configure(*args,s))
ck('profiles0/1/2 legacy/control choices',[(p!=2,p!=0) for p in (0,1,2)]==[(True,False),(True,True),(False,True)])
p=Pump();ck('speed while off changes target only',p.speed(90) and p.target==90 and p.current==0)
p.enable();p.tick_due();ck('up first step uses absolute target and hardware minimum',p.current==20 and p.state==2)
p.ramp_config(200,100);ck('ramp config does not replace captured step count',p.steps==10)
p.speed(50);p.tick_due();ck('up consumes changed target with old step count',p.target==50 and p.steps==10 and p.current==20)
p=Pump(current=90,target=90,state=3);s=Scheduler();s.apply_mode(1,[p]);ck('mode updates target but no immediate PWM write',p.target==80 and p.current==90)
p.speed(90);ck('direct speed can exceed sleep policy cap within hardware max',s.pump_max==80 and p.current==90)
p.speed(0);ck('speed0 stops output but retains running state',p.current==0 and p.state==3)
ck('speed101 rejected',not p.speed(101));p=Pump(current=90,target=80,state=3);p.enable();ck('enable with current already>=target does not lower PWM',p.state==3 and p.current==90)
p=Pump(minimum=0,current=40,target=80,state=3);p.enable();p.tick_due();ck('ramp is target*step/N not interpolation from old output',p.current==8)
p=Pump(current=80,target=80,state=3);p.disable();old_steps=p.steps;p.ramp_config(0,0);p.speed(100);p.tick_due();ck('down uses captured start and steps not new target/duration',p.current==72 and p.steps==old_steps)
p.disable();ck('zero ramp-down stops immediately',p.current==0 and p.state==0)
p=Pump();p.ramp_config(0,0);p.enable();ck('zero ramp-up applies target directly',p.current==100 and p.state==3)
ck('pump upper clamp and zero exception',(p.output(5),p.current)[1]==20);p.output(0);ck('explicit zero bypasses minimum',p.current==0)
v=Valve();v.close_config(20,500,10,600);ck('11B opening config resets closing to mode table',v.opening_config((10,5,50,70)) and (v.close1,v.close1_ms,v.close2,v.close2_ms)==(40,250,30,250))
v.close_config(20,500,10,600);v.opening_config((10,5,50,70),(30,400,10,2501));ck('opening setter keeps individually invalid close duration',v.close1==30 and v.close2_ms==600)
v.close_config(40,3000,30,3000);ck('direct close setter does not share2000ms validator',v.close1_ms==3000)
v.open(100);v.tick(100);ck('opening interval init makes first step immediately due',v.output==5)
v.opening_config((20,10,50,70));v.tick(110);ck('inflight opening step changes but timer interval stays captured',v.output==15 and v.captured_interval==10)
v.state=4;v.output=70;v.opening_config((10,5,50,60));v.tick(1000);ck('maintain config update does not immediately change latched duty',v.output==70)
v.close_config(40,250,30,250);v.close(0);v.tick(249);ck('close first dwell before boundary',v.output==40 and v.close_phase==0)
v.tick(250);ck('close first boundary selects second',v.output==30 and v.close_phase==1);v.tick(499);ck('close second dwell before boundary',v.output==30);v.tick(500);ck('close completion reaches zero',v.output==0 and v.state==0)
v.state=4;v.close_config(0,250,50,250);v.close(0);ck('zero first close stage skips whole dwell sequence',v.output==0 and v.state==0)
v.state=4;v.close_config(40,250,0,250);v.close(0);v.tick(250);ck('zero second stage closes at first boundary',v.output==0 and v.state==0)
ck('valve100 uses ARR+1 while pump100 uses ARR',pwm_compare(100,999,valve=True)==1000 and pwm_compare(100,999)==999)
for n in (4,5):
    packet=config_packet(n);ck(f'v2 readback exact {n}-bag length',len(packet)==130+25*n and packet[129]==n)
    ck(f'v2 {n}-bag readback is big endian',struct.unpack_from('>I',packet,1)[0]==50 and struct.unpack_from('>f',packet,134)[0]>1.6)
result={'scope':'normal finite command/state contracts; no firmware or peripheral execution','count':len(tests),'tests':tests}
(O/'MODEL_RESULTS.json').write_text(json.dumps(result,ensure_ascii=False,indent=2)+'\n')
print(len(tests),'PASS')
