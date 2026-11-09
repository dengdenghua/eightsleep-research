"""Finite, synthetic examples of recovered contracts. Never execute target firmware.
Float operations round to binary32; sqrt uses host sqrt followed by binary32 and
does not claim bit-exact replacement of every softfloat exceptional case.
"""
import json, math, struct
from pathlib import Path

def f(x): return struct.unpack('<f',struct.pack('<f',x))[0]
def add(x,y): return f(f(x)+f(y))
def sub(x,y): return f(f(x)-f(y))
def mul(x,y): return f(f(x)*f(y))
def div(x,y): return f(f(x)/f(y))

class Window:
    def __init__(self): self.reset()
    def reset(self): self.data=[0.]*20;self.n=0;self.i=0;self.base=0.;self.s=0.;self.q=0.
    def push(self,p,eligible=True):
        p=f(p)
        if not eligible or math.isnan(p):self.reset();return None
        if self.n==0:self.base=p
        d=sub(p,self.base)
        if self.n==20:
            old=sub(self.data[self.i],self.base)
            self.s=sub(self.s,old);self.q=sub(self.q,mul(old,old))
        else:self.n+=1
        self.s=add(self.s,d);self.q=add(self.q,mul(d,d));self.data[self.i]=p;self.i+=1
        if self.i==20:
            self.i=0
            if self.n==20:
                total=0.
                for v in self.data:total=add(total,v)
                self.base=div(total,20);self.s=0.;self.q=0.
                for v in self.data:
                    d=sub(v,self.base);self.s=add(self.s,d);self.q=add(self.q,mul(d,d))
        if self.n<20:return None
        var=sub(div(self.q,20),mul(div(self.s,20),div(self.s,20)))
        return f(math.sqrt(max(var,0.)))

def gate(state,score,now,start,quiet_start=None,threshold=f(.05),hold=3000,maximum=60000):
    event=False
    if score is None:
        return (3 if state==3 else 0),start,None,event
    if score>threshold:
        quiet_start=None
        if state==0:state=1;start=now;event=True
        elif state==2:state=1
    else:
        if quiet_start is None:quiet_start=now
        if state==1:state=2
        if state in (2,3) and now-quiet_start>=hold:return 0,start,None,event
    if state in (1,2) and now-start>=maximum:state=3
    return state,start,quiet_start,event

def inflate_stop(sp,offset,duty,enabled=True):
    ci=sub(add(sp,offset),sp) if enabled else 0.
    scale=1. if duty==0 else min(1.,max(f(.55),f(math.sqrt(div(duty,100)))))
    return add(sp,mul(ci,scale))
def deflate_stop(sp,high_a,high_b,low_a,low_b,enabled=True):
    a,b=(low_a,low_b) if f(sp)<1 else (high_a,high_b)
    return div(sub(sp,b),a) if enabled and a>0 else f(sp)
def velocity(previous,current,dt,old,settled=True):
    if not settled or not 1<=dt<=999:return f(old)
    return max(0.,min(1.5,add(mul(div(sub(previous,current),div(dt,1000)),.3),mul(old,.7))))

def run():
    checks=[]
    def ck(name,actual,expected):
        ok=actual==expected if not isinstance(expected,float) else abs(actual-expected)<2e-5
        checks.append({'name':name,'actual':actual,'expected':expected,'pass':ok})
    w=Window()
    ck('window needs 20 eligible observations',[w.push(2.) for _ in range(19)], [None]*19)
    ck('constant full window',w.push(2.),0.)
    w.reset()
    for p in [1.9,2.1]*10:s=w.push(p)
    ck('alternating pressure std',s,.1)
    max_err=0.
    for i in range(80):
        s=w.push(2.+.15*math.sin(i*.7))
        mean=sum(w.data)/20;truth=math.sqrt(sum((p-mean)**2 for p in w.data)/20)
        max_err=max(max_err,abs(s-truth))
    ck('rolling/rebase matches independent population std',max_err<2e-5,True)
    ck('actuating/invalid bag resets whole window',w.push(2.,False),None)
    ck('window reset count',w.n,0)
    for p in [1.]*20:w.push(p)
    ck('NaN resets',w.push(float('nan')),None)
    ck('threshold equality does not activate',gate(0,f(.05),0,0)[0],0)
    ck('above threshold activates',gate(0,.051,0,0)[0],1)
    ck('low score enters holding',gate(1,.01,1000,0)[0],2)
    ck('hold at 2999 ms still blocks',gate(2,.01,3999,0,1000)[0],2)
    ck('hold at 3000 ms releases',gate(2,.01,4000,0,1000)[0],0)
    ck('above threshold at 60 sec reaches non-blocking state3',gate(1,.1,60000,0)[0],3)
    ck('state3 remains despite ongoing high score',gate(3,.1,70000,0)[0],3)
    ck('state3 clears after quiet hold',gate(3,.01,73000,0,70000)[0],0)
    ck('missing score clears blocking state',gate(1,None,100,0)[0],0)
    ck('missing score preserves state3',gate(3,None,100,0)[0],3)
    ck('inflate full duty offset',inflate_stop(2,.43,100),2.43)
    ck('inflate lower scale bound',inflate_stop(2,.43,20),2+.43*.55)
    ck('inflate sqrt scaling',inflate_stop(2,.43,64),2+.43*.8)
    ck('zero duty uses unscaled offset',inflate_stop(2,.43,0),2.43)
    ck('disabled compensation unchanged',inflate_stop(2,.43,64,False),2.)
    ck('deflate high-range inverse affine',deflate_stop(2,1.65,.1,1.8,.2),(2-.1)/1.65)
    ck('deflate low-range inverse affine',deflate_stop(.5,1.65,.1,1.8,.2),(.5-.2)/1.8)
    ck('deflate nonpositive multiplier fallback',deflate_stop(.5,1.65,.1,0,.2),.5)
    ck('EMA decline',velocity(2,1.95,100,.2),.29)
    ck('EMA clamped upper',velocity(3,1,100,1),1.5)
    ck('EMA clamped lower',velocity(1,2,100,0),0.)
    ck('1000ms dt rejected',velocity(2,1,1000,.2),f(.2))
    ck('settle interval retains speed',velocity(2,1,100,.2,False),f(.2))
    out={'kind':'synthetic contract checks, not observations or full target emulation','checks':checks,'total':len(checks),'passed':sum(c['pass'] for c in checks),'rolling_std_max_absolute_error':max_err}
    path=Path(__file__).resolve().parents[1]/'MODEL_CHECKS.json';path.write_text(json.dumps(out,indent=2)+'\n')
    print(json.dumps({k:out[k] for k in ['total','passed','rolling_std_max_absolute_error']}))
    assert out['passed']==out['total']
if __name__=='__main__':run()
