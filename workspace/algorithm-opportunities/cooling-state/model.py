"""Analyst transcription of finite, valid inputs; no firmware execution or thermal plant."""
from dataclasses import dataclass,asdict
import struct
f=lambda x:struct.unpack('<f',struct.pack('<f',x))[0]
elapsed=lambda now,then:(now-then)&0xffffffff
@dataclass
class State:
 base:float=f(.67)
 threshold:float=f(.5)
 disabled:bool=False
 best:float=float('inf')
 progress_at:int=0
 climbing:bool=False
 seen:bool=False
 suppressed:bool=False
 ceiling:float=f(.67)
 raised_at:int=0
 engaged:bool=False
 cut:bool=False
 def enable_reset(self,now):
  self.best=float('inf');self.progress_at=now;self.seen=False;self.suppressed=False
 def target_reset(self,now):
  self.enable_reset(now);self.climbing=False;self.ceiling=self.base;self.raised_at=now
 def step(self,demand,error,now):
  demand,error=f(demand),f(error);now&=0xffffffff;self.cut=False
  cap=self.ceiling if self.climbing else self.base
  if self.base<=0 or self.disabled or error>=-self.threshold:
   self.engaged=False;self.enable_reset(now);return demand
  improved=f(self.best-f(.1))>abs(error)
  if improved:
   self.progress_at=now;self.seen=False;self.suppressed=False;self.best=abs(error)
  if not self.climbing:
   if not improved and elapsed(now,self.progress_at)>=180000:
    if self.seen:self.climbing=True;cap=self.ceiling;self.raised_at=now
    else:self.suppressed=True
  else:
   cap=self.ceiling
   if elapsed(now,self.raised_at)>=30000:
    self.raised_at=now
    if cap<1:
     cap=f(cap+f(.11))
     if cap>1:
      self.ceiling=f(1);self.engaged=False;return demand
     self.ceiling=cap
  if cap>=1:self.engaged=False;return demand
  edge=f(cap-f(.05)) if self.engaged else cap
  self.engaged=-edge>demand
  if self.engaged:self.seen=True
  if -cap>demand:self.cut=True;return f(-cap)
  return demand
