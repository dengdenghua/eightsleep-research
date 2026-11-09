"""Reconstruct successful four-buffer CBOR encoding from synthetic RAM images.

Layouts are from the bound Frank ELF, not device capture. Capacity failures,
exceptions, metadata producers, buffer reset, envelopes and network are outside
this module. Integers and byte strings follow the retained CBOR helpers.
"""
import struct

def header(major,n):
    if n<0 or n>=1<<64:raise ValueError('CBOR integer/length out of range')
    if n<24:return bytes([major|n])
    for width,tag in [(1,24),(2,25),(4,26),(8,27)]:
        if n<1<<(width*8):return bytes([major|tag])+n.to_bytes(width,'big')

class IndefMap(dict):pass

def encode(value):
    if isinstance(value,int):return header(0,value) if value>=0 else header(0x20,~value)
    if isinstance(value,bytes):return header(0x40,len(value))+value
    if isinstance(value,str):
        b=value.encode('utf-8');return header(0x60,len(b))+b
    if isinstance(value,list):return header(0x80,len(value))+b''.join(encode(x) for x in value)
    if isinstance(value,dict):
        start=b'\xbf' if isinstance(value,IndefMap) else header(0xa0,len(value))
        return start+b''.join(encode(k)+encode(v) for k,v in value.items())+(b'\xff' if isinstance(value,IndefMap) else b'')
    raise TypeError(type(value))

def check_buffer(buf,size):
    if len(buf)<size:raise ValueError(f'need {size} buffer bytes; got {len(buf)}')
def u32(buf,off):return struct.unpack_from('<I',buf,off)[0]
def words16(buf,off,count,signed):return list(struct.unpack_from('<'+('h' if signed else 'H')*count,buf,off))
def blobs(buf,off,count,size):return [bytes(buf[off+i*size:off+(i+1)*size]) for i in range(count)]

def buzzer(buf):
    check_buffer(buf,0x4e50)
    result=IndefMap(type='piezo-buzzer',ts=u32(buf,0x4e2c),freq=500)
    for name,offset,meta,gain in [('left',8,0x4e30,0x4e3c),('right',0x2718,0x4e34,0x4e46)]:
        result[name]={'gain':words16(buf,gain,5,True),'version':u32(buf,meta),'data':blobs(buf,offset,5,2000)}
    return encode(result)

def imu(buf):
    check_buffer(buf,0x259c)
    result=IndefMap(type='imu-multi-channel',ts=u32(buf,0x258c),freq=100,
                    lver=u32(buf,0x2590),rver=u32(buf,0x2594))
    for name,start in [('left',8),('right',0x12c8)]:
        result[name]=[]
        for group in range(4):
            b=start+group*1200
            result[name].append({kind:{axis:bytes(buf[b+base+i*200:b+base+(i+1)*200])
                                      for i,axis in enumerate(('x','y','z'))}
                                 for kind,base in [('gyro',0),('accel',600)]})
    return encode(result)

def multi(buf):
    check_buffer(buf,0x1f64)
    result=IndefMap(type='piezo-multi-channel',ts=u32(buf,0x1f4c),freq=500)
    for name,offset,meta,gain in [('left',8,0x1f50,0x1f5c),('right',0xfa8,0x1f54,0x1f60)]:
        result[name]={'gain':words16(buf,gain,2,False),'version':u32(buf,meta),'data':blobs(buf,offset,2,2000)}
    return encode(result)

def extadc(buf):
    check_buffer(buf,0x1f58)
    flags=u32(buf,0x1f50)
    result={'type':'piezo-dual','ts':u32(buf,0x1f4c),'freq':500,'adc':flags,'gain':u32(buf,0x1f40)}
    if flags&0x3e:
        result.update(version=2,left={'gain':u32(buf,0x1f40)},right={'gain':u32(buf,0x1f44)})
    result['left1']=bytes(buf[:2000])
    if (flags>>6)&3 == 0:result['left2']=bytes(buf[4000:6000])
    result['right1']=bytes(buf[2000:4000])
    if (flags>>6)&3 == 0:result['right2']=bytes(buf[6000:8000])
    return encode(result)

def stealth_body(buzzer_ram,imu_ram,multi_ram=None):
    # 00200960 mask bit26: concatenation, no outer array/map.
    return buzzer(buzzer_ram)+imu(imu_ram)+(multi(multi_ram) if multi_ram is not None else b'')
