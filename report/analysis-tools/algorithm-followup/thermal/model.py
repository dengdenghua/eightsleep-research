"""Bounded, analyst-written float32 transcription, not original firmware execution.
A due, enabled thermostat step with finite valid water is assumed. Cooling ceiling
is supplied explicitly; its slow adaptation, physical TEC state, sensor validity,
scheduling, and other safety callbacks are outside this model.
"""
import struct

def f32(x):
    return struct.unpack('<f',struct.pack('<f',x))[0]
def add(a,b):return f32(f32(a)+f32(b))
def sub(a,b):return f32(f32(a)-f32(b))
def mul(a,b):return f32(f32(a)*f32(b))
def clamp(x,lo,hi):return f32(max(f32(lo),min(f32(hi),f32(x))))

def step(*, target, water, integral, previous_e, ambient, ceiling=0.67,
         cooling_disabled=False, ambient_enabled=True):
    """Trace one normal-Pod6 PID call, fixed cooling ceiling, then ambient clamp."""
    target,water,integral,previous_e=map(f32,(target,water,integral,previous_e))
    error=sub(target,water)
    attempted_integral=clamp(add(integral,error),-200,200) if abs(error)>0 else integral
    p=mul(.3,error)
    i=mul(.005,attempted_integral)
    d=mul(.2,sub(error,previous_e))
    raw=add(add(p,i),d)
    ceiling=f32(ceiling)
    # 0801BB28: the actual cut flag +0x21 is distinct from engaged hysteresis +0x20.
    applies=ceiling>0 and not cooling_disabled and error<f32(-.5) and ceiling<1
    cooling_cut=applies and raw<f32(-ceiling)
    after_cooling=f32(-ceiling) if cooling_cut else raw
    saved_integral=integral if cooling_cut else attempted_integral
    if ambient is None or not ambient_enabled:
        bounds=(-1.,1.)
    elif abs(sub(ambient,target))<=f32(4.):
        bounds=(-.8,.8)
    else:
        bounds=(-1.,.8)
    final=clamp(after_cooling,*bounds)
    return {'error':error,'integral_before':integral,'attempted_integral':attempted_integral,
            'integral_saved':saved_integral,'previous_e_saved':error,
            'cached_p':p,'cached_i':i,'cached_d':d,'cached_raw_output':raw,
            'cooling_actual_cut':bool(cooling_cut),'after_cooling':after_cooling,
            'ambient_bounds':[f32(x) for x in bounds],'final_request':final}
