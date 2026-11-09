"""Finite, synthetic state contracts from A02 static instructions; no vendor execution.
This is not a CBOR/flash/peripheral emulator or exhaustive IEEE-754 verification.
"""
from pathlib import Path
from copy import deepcopy
import json, math, struct

OUT = Path(__file__).resolve().parents[1]
TABLES = json.loads((OUT / 'RAW_TABLES.json').read_text())
F = lambda x: struct.unpack('<f', struct.pack('<f', x))[0]
GENERIC = dict(a=F(1.65), b=F(.43), ci=0., al=F(1.65), cl=0., enabled=True)
def platform(sku, pn, bag):
    v = deepcopy(GENERIC)
    if sku in (1, 2) and bag < 4:
        row = next(x for x in TABLES['compensation'] if x['sku'] == sku and x['side_boolean'] == int(pn == 0x4fb1))
        v.update(a=row['a'][bag], al=row['a'][bag], b=row['b'][bag])
    return v
def staged_record(fields):
    # Well-formed finite CBOR field semantics only; absent/invalid numeric fields retain defaults.
    v = {k: value for k, value in GENERIC.items() if k != 'enabled'}
    v['c'] = bool(fields.get('c', False))
    for k in ('a', 'b', 'ci', 'al', 'cl'):
        low, high = (.5, 5.) if k in ('a', 'al') else (-2., 2.)
        if k in fields and low <= fields[k] <= high:
            v[k] = F(fields[k])
    if 'al' not in fields or not .5 <= fields['al'] <= 5.:
        v['al'], v['cl'] = v['a'], 0.
    return v
def boot(sku, pn, count, valid_flash=False, flash_count=None, fields=()):
    live = [deepcopy(GENERIC) for _ in range(5)]
    staging = [staged_record({}) for _ in range(8)]
    if valid_flash:
        n = min(count, flash_count if flash_count is not None and 1 <= flash_count <= 8 else count)
        for i, row in enumerate(fields[:8]): staging[i] = staged_record(row)
        for i in range(n): live[i].update({k: staging[i][k] for k in ('a','b','ci','al','cl')})
    else:
        n = count
        live = [platform(sku,pn,i) for i in range(5)]
    return {'live':live,'staging':staging,'count':n,'valid':valid_flash,'timestamp':0}
def stage(s, bag, a, b, ci=0., al=None, cl=0.):
    al = a if al is None else al
    vals = dict(a=a,b=b,ci=ci,al=al,cl=cl)
    if not (0 <= bag < min(5,s['count'])): return False
    if not all(math.isfinite(v) and ((.5 <= v <= 5) if k in ('a','al') else (-2 <= v <= 2)) for k,v in vals.items()): return False
    s['staging'][bag] = dict({k:F(v) for k,v in vals.items()}, c=True)
    return True
def save(s, timestamp, success=True):
    s['timestamp'] = timestamp
    if not success: return False
    s['valid'] = True
    for i in range(min(5,s['count'])):
        s['live'][i].update({k:s['staging'][i][k] for k in ('a','b','ci','al','cl')})
    return True
def clear(s, hardware_count, success=True):
    s.update(staging=[staged_record({}) for _ in range(8)],count=hardware_count,valid=False,timestamp=0)
    if not success: return False
    s['live'] = [deepcopy(GENERIC) for _ in range(5)]
    return True
def direct(s,bag,a,b,ci=0.):
    # Normal finite 0x53/9 payload; does not claim that MCU validates finiteness.
    assert 0 <= bag < 5 and .5 <= a <= 5 and -2 <= b <= 2 and -2 <= ci <= 2
    s['live'][bag].update(a=F(a),b=F(b),ci=F(ci),al=F(a),cl=F(ci))
def stop(v,sp):
    a,ci=(v['al'],v['cl']) if sp < 1 else (v['a'],v['ci'])
    return F(F(sp-ci)/a) if v['enabled'] and a > 0 else sp
def platform_layers(hw): return [x['callback'] for x in TABLES['platform_rows'] if x['min_hwrev'] <= hw]
def mode(s,number):
    if number not in (0,1): return False
    s['mode'] = deepcopy(TABLES['mode_records'][number]['fields'])
    return True

checks=[]
def check(name,cond):
    assert cond,name
    checks.append({'name':name,'passed':True})
check('hw0 executes two base rows', platform_layers(0)==['0x801598c']*2)
check('hw3 ends at A02 (no revision3 callback)',platform_layers(3)[-2:]==['0x8015bc8']*2 and len(platform_layers(3))==6)
check('hw5 executes all10 rows',len(platform_layers(5))==10)
check('unknown SKU uses generic',platform(3,0x4fb0,0)==GENERIC)
check('bag4 uses generic even SKU2',platform(2,0x4fb1,4)==GENERIC)
check('SKU2 main bag0 table3.08',platform(2,0x4fb0,0)['a']==F(3.08))
check('SKU2 ext bag0 differs1.89',platform(2,0x4fb1,0)['a']==F(1.89))
check('all b table entries equal generic',all(v==F(.43) for row in TABLES['compensation'] for v in row['b']))
s=boot(2,0x4fb0,4);check('invalid flash selects SKU defaults',s['live'][0]['a']==F(3.08))
s=boot(2,0x4fb0,4,True,1,[{'a':2.2,'c':False}])
check('valid record wins over SKU',s['live'][0]['a']==F(2.2))
check('valid partial count does not fill with SKU',s['live'][1]==GENERIC)
check('calibrated marker false does not disable live compensation',s['live'][0]['enabled'] and not s['staging'][0]['c'])
check('missing al falls back a and discards cl',staged_record({'a':2.2,'cl':.3})['cl']==0 and staged_record({'a':2.2})['al']==F(2.2))
check('valid al preserves separate cl',staged_record({'a':2.2,'al':1.3,'cl':.3})['cl']==F(.3))
check('out-of-range a retained default (wellformed record)',staged_record({'a':9})['a']==GENERIC['a'])
s=boot(2,0x4fb0,4,True,8,[]);check('flash bag count clamps hardware',s['count']==4)
s=boot(2,0x4fb0,4);before=deepcopy(s['live']);check('set accepts inclusive boundaries',stage(s,0,.5,-2,2,5,-2))
check('staging write leaves live coefficients unchanged',s['live']==before)
check('bag index4 rejected with four-bag staging count',not stage(s,4,2,.4))
check('normal above max rejected',not stage(s,0,5.001,.4))
check('failed save leaves live unchanged but updates timestamp',not save(s,123,False) and s['live']==before and s['timestamp']==123)
check('successful save copies five coefficients',save(s,124) and s['live'][0]['a']==.5 and s['live'][0]['cl']==-2)
check('save unstaged bags come from staging defaults not SKU',s['live'][1]==GENERIC)
s['live'][0]['enabled']=False;save(s,125);check('save preserves live enabled flag',not s['live'][0]['enabled'])
s=boot(1,0x4fb0,4);st=deepcopy(s['staging']);direct(s,0,2.4,.2,.1)
check('direct runtime write changes al and cl to a and ci',s['live'][0]['al']==F(2.4) and s['live'][0]['cl']==F(.1))
check('direct runtime write leaves staging unchanged',s['staging']==st)
save(s,126);check('later save replaces direct coefficients with staging',s['live'][0]==GENERIC)
s=boot(2,0x4fb0,4);check('clear immediately generic',clear(s,4) and s['live'][0]==GENERIC)
check('reboot after clear returns to platform3.08',boot(2,0x4fb0,4)['live'][0]['a']==F(3.08))
s=boot(2,0x4fb0,4);before=deepcopy(s['live']);stage(s,0,2.1,.3);check('clear failure resets staging but preserves live',not clear(s,4,False) and s['live']==before and s['staging'][0]['a']==GENERIC['a'])
s=boot(1,0x4fb0,4);before=deepcopy(s['live']);mode(s,1)
check('sleep mode cap80 grants240/180/480sec',s['mode']['pump_cap_pct']==80 and s['mode']['inflate_grant_ms']==240000 and s['mode']['deflate_grant_ms']==180000 and s['mode']['other_grant_ms']==480000)
check('mode does not alter compensation',s['live']==before)
mode(s,0);check('demo overwrites sleep mode shared fields',s['mode']['pump_cap_pct']==100 and s['mode']['scheduler_sleep_sec']==5)
v=dict(GENERIC,a=2.,ci=.2,al=1.,cl=.1);check('strict SP<1 chooses low coefficients',abs(stop(v,.99)-F(.89))<1e-6 and abs(stop(v,1)-F(.4))<1e-6)
result={'kind':'synthetic static contracts, not MCU execution','scope':'finite normal records and selection/write ordering; no malformed CBOR, flash electrical behaviour or full floating point cases','case_count':len(checks),'cases':checks}
(OUT/'MODEL_RESULTS.json').write_text(json.dumps(result,ensure_ascii=False,indent=2)+'\n')
print(f'{len(checks)} finite contract cases PASS')
