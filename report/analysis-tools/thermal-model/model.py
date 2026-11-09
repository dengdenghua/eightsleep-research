"""Source-bound boundary models, not firmware emulation or a physical model.

Inputs are finite float32; scheduler eligibility and unmodelled safety checks
are explicit inputs. No network, device I/O or target execution.
"""
import struct
from dataclasses import dataclass

def f32(x):
    return struct.unpack('<f', struct.pack('<f', x))[0]

def clamp(x, lo, hi):
    return min(max(f32(x), f32(lo)), f32(hi))

def temp_valid(success, now_ms, last_success_ms):
    return bool(success) and ((now_ms-last_success_ms)&0xffffffff) < 5000

def ambient_clamp(demand, ambient, requested, valid=True, enabled=True):
    delta = abs(f32(f32(ambient)-f32(requested)))
    lo, hi = (-0.8 if delta <= 4 else -1, 0.8) if valid and enabled else (-1, 1)
    return clamp(demand,lo,hi)

def thermostat_step(previous, next_limited_pid, *, enabled=True, due=True,
                    water_valid=True, ambient=24, requested=24,
                    ambient_valid=True, ambient_enabled=True):
    # 0801E408 early returns preserve output. Disable setter is separate.
    if not (enabled and due and water_valid):
        return {'demand':f32(previous), 'pid_executed':False, 'tec_set_called':False}
    return {'demand':ambient_clamp(next_limited_pid,ambient,requested,ambient_valid,ambient_enabled),
            'pid_executed':True,'tec_set_called':True}

def target_cross_resets(old, new, water, valid=True):
    delta = abs(f32(f32(new)-f32(old)))
    product = f32(f32(f32(old)-f32(water))*f32(f32(new)-f32(water)))
    return bool(valid and delta>5 and product<0)

def waterblock_local_guard(block, water, *, block_valid=True, water_valid=True):
    # Subset at 0801C3xx..C46C, reached only if earlier protections/ranges pass.
    if not block_valid:
        return 0 if water_valid else 1
    block,water=f32(block),f32(water)
    if block<11:return 7
    if block<14 and (not water_valid or f32(water-block)>5):return 8
    if block>50 and (not water_valid or f32(block-water)>5):return 9
    return 0

def overtemp_latch(temperature, previous, valid=True):
    return bool(valid and f32(temperature)>(60 if previous else 65))

@dataclass
class Tec:
    mode:str='normal'
    direction:int=0
    pending_direction:int=0
    pwm:float=0.4
    ramp:float=0.4
    enabled:bool=True
    switched_at:int=0
    wait_ms:int=1000
    step:float=0.001

    def tick(self, now, signed_request, due=True, safety_code=0):
        requested_direction=0 if signed_request>=0 else 1
        magnitude=abs(clamp(signed_request,-1,1))
        if self.mode=='reversal':
            age=(now-self.switched_at)&0xffffffff
            if age>=500:self.enabled=True
            if age>=self.wait_ms:
                self.mode='normal';self.direction=self.pending_direction;self.ramp=0
            # Returning to normal schedules its 100ms period; does not run PWM branch here.
            return
        if self.mode!='normal' or not due:return
        if safety_code:
            self.ramp=self.pwm=0;self.enabled=False;self.mode='protected';return
        if requested_direction==self.direction:
            self.ramp=min(magnitude,f32(self.ramp+self.step)) if magnitude>=self.ramp else magnitude
            self.pwm=clamp(self.ramp,0,1)
        else:
            self.ramp=self.pwm=0
            self.mode='reversal';self.pending_direction=requested_direction
            self.enabled=False;self.switched_at=now;self.wait_ms=max(self.wait_ms,500)

def fill_duty(level, connected=True, already_primed=False):
    level=f32(level)
    if not connected or level<=12.5:return 0.0
    if already_primed:return f32(0.1)
    if level<25:return f32(f32(level-12.5)/12.5)
    if level<50:return 1.0
    if level<100:return f32(1-f32(f32(f32(level-50)/50)*f32(0.9)))
    return f32(0.1)

@dataclass
class PrimingBoundary:
    state:str='FILL'
    fill_counter:int=0  # +0x130
    low_counter:int=0   # +0x158, shared between the two sides
    primed_mask:int=0

    def fill(self, raw, averages, connected=3, due=True):
        if not due:return
        # average clears old primed bits; entry threshold itself consumes raw readings.
        for side in (0,1):
            if f32(averages[side])<37.5:self.primed_mask &= ~(1<<side)
        need=connected & ~self.primed_mask
        if not need:
            self.state='WAIT_CAP';self.fill_counter=self.low_counter=0;return
        levels=[f32(raw[i]) for i in (0,1) if need & (1<<i)]
        qualifies=min(levels)>=50 or (max(levels)>=100 and min(levels)>=25)
        self.fill_counter=self.fill_counter+200 if qualifies else 0
        if self.fill_counter>=600:self.state='RED'

    def low_water(self, averages, connected=3, due=True):
        if not due:return
        if self.state not in ('WAIT_CAP','FLUSH'):raise ValueError('wrong state')
        sides=[i for i in (0,1) if connected & (1<<i)]
        if not sides:raise ValueError('startup rejects connected mask 0')
        threshold=18.75 if self.state=='WAIT_CAP' else 12.5
        low=[i for i in sides if (f32(averages[i])<threshold if self.state=='WAIT_CAP'
                                  else f32(averages[i])<=threshold)]
        limit=3000 if self.state=='WAIT_CAP' else 2000
        # Shared counter +0x158; any selected side can keep it accumulating.
        self.low_counter=self.low_counter+200 if low else 0
        if self.low_counter>=limit:
            if self.state=='WAIT_CAP':
                for i in low:self.primed_mask &= ~(1<<i)
            self.fill_counter=0
            self.state='FILL'

def final_flush_pass(averages, connected=3):
    if not connected:raise ValueError('startup rejects connected mask 0')
    return min(f32(averages[i]) for i in (0,1) if connected&(1<<i))>=37.5
