"""Synthetic buffer->bytes checks against an existing independent decoder."""
import hashlib
import json
import struct
from pathlib import Path
import sys
from encode_buffers import *

HERE=Path(__file__).resolve().parent
sys.path.insert(0,str(HERE))
from host_signal_parser import CBORReader

cases=[]
def check(label,actual,expected):
    assert actual==expected,(label,actual,expected)
    cases.append({'name':label,'passed':True})
def decode(blob):
    r=CBORReader(blob);v=r.read();assert r.pos==len(blob);return v
def fixture(size,region,word):
    buf=bytearray(size)
    start,count=region
    buf[start:start+count]=word*(count//len(word))
    return buf

b=fixture(0x4e50,(8,20000),struct.pack('<i',0x7fffffff))
i=fixture(0x259c,(8,9600),struct.pack('<h',0x7fff))
m=fixture(0x1f64,(8,8000),struct.pack('<i',0x7fffffff))
e=fixture(0x1f58,(0,8000),struct.pack('<i',0x7fffffff))
for buf,off in [(b,0x4e2c),(i,0x258c),(m,0x1f4c),(e,0x1f4c)]:struct.pack_into('<I',buf,off,0x12345678)
struct.pack_into('<5H',b,0x4e3c,1,23,24,32768,65535)
struct.pack_into('<2H',m,0x1f5c,32768,65535)
struct.pack_into('<i',b,8,-12345);struct.pack_into('<i',b,0x2718,54321)
struct.pack_into('<h',i,8,-123);struct.pack_into('<h',i,0x12c8+1000,456)
struct.pack_into('<II',i,0x2590,123,456)
check('uint23',encode(23).hex(),'17');check('uint24',encode(24).hex(),'1818')
check('uint255',encode(255).hex(),'18ff');check('uint256',encode(256).hex(),'190100')
check('uint65536',encode(65536).hex(),'1a00010000');check('uint32plus',encode(1<<32).hex(),'1b0000000100000000')
check('negative1',encode(-1).hex(),'20');check('negative32768',encode(-32768).hex(),'397fff')
check('indef_map',encode(IndefMap(a=1)).hex(),'bf616101ff')
check('buzzer_gain_signed',decode(buzzer(b))['left']['gain'],[1,23,24,-32768,-1])
check('multi_gain_unsigned',decode(multi(m))['left']['gain'],[32768,65535])
check('buzzer_fixed_channels',list(map(len,decode(buzzer(b))['right']['data'])),[2000]*5)
check('buzzer_endian',struct.unpack_from('<i',decode(buzzer(b))['left']['data'][0])[0],-12345)
check('buzzer_missing_preserved',decode(buzzer(b))['left']['data'][0][4:8].hex(),'ffffff7f')
check('imu_version_fields',[decode(imu(i))[k] for k in ['lver','rver']],[123,456])
check('imu_right_axis',struct.unpack_from('<h',decode(imu(i))['right'][0]['accel']['z'])[0],456)
check('imu_missing_preserved',decode(imu(i))['left'][1]['gyro']['x'][:2].hex(),'ff7f')
for flags,n in [(0,9),(2,12),(0x40,7),(0x42,10)]:
    struct.pack_into('<I',e,0x1f50,flags);v=decode(extadc(e))
    check(f'extadc_flags_{flags}_map_count',len(v),n)
    check(f'extadc_flags_{flags}_sample_keys',[k for k in v if k in ['left1','left2','right1','right2']],
          ['left1','right1'] if flags&0xc0 else ['left1','left2','right1','right2'])
body=stealth_body(b,i,m);r=CBORReader(body);types=[]
while r.pos<len(body):types.append(r.read()['type'])
check('three_concatenated_maps',types,['piezo-buzzer','imu-multi-channel','piezo-multi-channel'])
for fn,size in [(buzzer,0x4e50),(imu,0x259c),(multi,0x1f64),(extadc,0x1f58)]:
    try:fn(bytes(size-1));raise AssertionError('short buffer accepted')
    except ValueError:cases.append({'name':fn.__name__+'_short_buffer_rejected','passed':True})
fixtures=HERE/'fixtures';fixtures.mkdir(exist_ok=True)
files={}
for name,data in [('buzzer.cbor',buzzer(b)),('imu.cbor',imu(i)),('multi.cbor',multi(m)),('extadc.cbor',extadc(e)),('stealth-body.cbor',body)]:
    (fixtures/name).write_bytes(data);files[name]={'bytes':len(data),'sha256':hashlib.sha256(data).hexdigest()}
(HERE/'RESULTS.json').write_text(json.dumps({'cases':cases,'count':len(cases),'passed':True,'synthetic_fixtures':files,
 'scope':'Successful encode bytes from explicitly constructed RAM; not captured device packets or upload envelopes.'},ensure_ascii=False,indent=2)+'\n')
print(json.dumps({'cases':len(cases),'passed':True,'fixtures':files}))
