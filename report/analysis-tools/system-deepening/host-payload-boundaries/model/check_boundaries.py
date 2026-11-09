"""Finite synthetic payload contract checks, never executes Frank machine code.

LSP body storage is explicitly preseeded; no claim about real initial RAM.
Only decoded rows, mapper arguments, packet counter delta and callback requests
are modeled. Native wall-time mapper/coroutine/logger outcomes are not emulated.
"""
import hashlib
import json
import struct
from pathlib import Path
from lsp_receiver import Receiver, frame

OUT = Path(__file__).resolve().parent


def usb_payload(data, initial_counter=7):
    result = dict(length=len(data), rows=[], mapper_calls=[], counter_before=initial_counter,
                  counter_after=initial_counter, writes_to_persistent_timing=False)
    if len(data) < 120:
        return dict(result, outcome='short_header_exit')
    tick, flags, frequency = struct.unpack_from('>IHH',data)
    count = (len(data)-56)//64
    result.update(tick=tick,flags=flags,frequency=frequency,count=count,imu_offset=8+count*64,
                  ignored_tail=len(data)-(56+count*64))
    if frequency == 0:
        return dict(result,outcome='zero_frequency_exit')
    step = 1000//frequency
    imu_wire=struct.unpack_from('>24h',data,8+count*64)
    imu=[v if flags & (1 << (12+i//6)) else 0x7fff for i,v in enumerate(imu_wire)]
    for i in range(count):
        adc_wire=struct.unpack_from('>16i',data,8+i*64)
        adc=[v if flags & (1 << (8+j//8)) else 0x7fffffff for j,v in enumerate(adc_wire)]
        input_tick=(tick+i*step)&0xffffffff
        result['rows'].append(dict(adc=adc,imu=imu,tick_input=input_tick,adc_offset=8+i*64))
        result['mapper_calls'].append(dict(tick=input_tick,check_and_update_flag=1))
        result['counter_after']+=1
    return dict(result,outcome='rows_decoded',step=step,writes_to_persistent_timing=True,
                ordinary_callback_requests=count,
                additional_gap_callbacks='Depends on native mapper return; not modeled')


def capsense_payload(storage,length,anchor_seconds=500,anchor_tick=9000):
    # storage begins at payload pointer, but extends past declared length.
    result=dict(length=length,read_ranges=[],output=[0]*9,callback_requested=True,
                timing_context_updated=False,mode_gate='Downstream A30 mode must exist; not modeled as enabled')
    if length >= 28:
        return dict(result,outcome='decoder_skips_but_zero_callback_requested')
    def read(off,size):
        result['read_ranges'].append(dict(offset=off,size=size,
                                         outside_declared=[i for i in range(off,off+size) if i>=length]))
        return int.from_bytes(storage[off:off+size],'big')
    tick=read(0,4)
    result['output'][0]=(anchor_seconds+((tick-anchor_tick)&0xffffffff)//1000)&0xffffffff
    for index,off in enumerate([4,6,9,12,15,18,21,24],1):
        result['output'][index]=read(off,2)
    return dict(result,outcome='decoded',tick_from_storage=tick,
                mapper_call=dict(tick=tick,check_and_update_flag=0))


def dispatch_gate(opcode_byte,state=2):
    # 00219b34 -> 00236174 -> UsbSensor handler; other flags/states omitted.
    return state==2 and opcode_byte>>7==0 and opcode_byte&0x7f in (0x3c,0x33)


def make_3c(count=5,flags=0xf300,frequency=500):
    header=struct.pack('>IHH',10000,flags,frequency)
    adc=b''.join(struct.pack('>16i',*(1000*i+j for j in range(16))) for i in range(count))
    imu=struct.pack('>24h',*(100+i for i in range(24)))
    return header+adc+imu


def main():
    cases=[]
    def save(name,result,claim):
        cases.append(dict(name=name,passed=True,claim=claim,result=result))
    normal=make_3c()
    r=usb_payload(normal);assert r['count']==5 and r['ignored_tail']==0
    save('3c_normal_376',r,'Five rows and one shared IMU block.')
    r=usb_payload(normal[:-1]);assert r['count']==4 and r['imu_offset']==264 and r['ignored_tail']==63
    assert r['rows'][0]['imu']==list(struct.unpack_from('>24h',normal,264))
    save('3c_remove_one_byte',r,'Length375 becomes four rows; IMU comes from part of former fifth ADC block.')
    r=usb_payload(normal+b'Q'*63);assert r['count']==5 and r['rows']==usb_payload(normal)['rows'] and r['ignored_tail']==63
    save('3c_append_63_ignored',r,'Bytes after existing IMU are ignored without changing rows.')
    r=usb_payload(normal+b'Q'*64);assert r['count']==6 and r['imu_offset']==392 and r['ignored_tail']==0
    save('3c_append_64_reframes',r,'Crossing64 changes N and the IMU offset; former IMU enters sixth ADC block.')
    for size in (0,8,119):
        r=usb_payload(normal[:size]);assert r['counter_after']==7 and not r['mapper_calls']
        save(f'3c_short_{size}',r,'Exits before per-row timing/counter work.')
    r=usb_payload(make_3c(frequency=0));assert not r['mapper_calls'] and r['counter_after']==7
    save('3c_zero_frequency',r,'Header parsed, no row mapper/counter work.')
    r=usb_payload(make_3c(frequency=1001));assert [x['tick_input'] for x in r['rows']]==[10000]*5
    save('3c_frequency_gt1000',r,'Integer 1000/frequency gives zero step; no frequency ceiling in audited branch.')
    r=usb_payload(make_3c(flags=0));assert all(v==0x7fffffff for row in r['rows'] for v in row['adc'])
    assert all(v==0x7fff for row in r['rows'] for v in row['imu'])
    save('3c_disabled_groups_reset',r,'Templates supply sentinel values; row count/timing calls still occur.')

    cap=struct.pack('>I',10000)+bytes(range(4,26))
    for size in (26,27,28):
        payload=cap+b'X'*(size-26)
        r=capsense_payload(payload+b'PRESEEDED',size)
        assert r['callback_requested'] and not r['timing_context_updated']
        if size<28: assert r['read_ranges'][-1]['offset']==24 and not any(x['outside_declared'] for x in r['read_ranges'])
        else: assert not r['read_ranges'] and r['output']==[0]*9
        save(f'33_length_{size}',r,'26/27 decode; 28 leaves caller-cleared20-byte output and still requests callback.')

    for size in (0,4,25):
        receiver=Receiver();receiver.body[:]=bytes([0xa5])*2048
        previous=b'\x33'+cap
        current=b'\x33'+(struct.pack('>I',20000)+bytes([0x66])*22)[:size]
        receiver.add(frame(previous));assert receiver.receive()==previous
        receiver.add(frame(current));assert receiver.receive()==current
        r=capsense_payload(receiver.body[1:],size)
        outside=[i for item in r['read_ranges'] for i in item['outside_declared']]
        assert outside and max(outside)==25
        for i in outside: assert receiver.body[1+i]==cap[i]
        r.update(previous_lsp=frame(previous).hex(),current_lsp=frame(current).hex(),
                 both_crc_accepted=True,explicit_seed_hex='a5 repeated 2048',
                 outside_bytes=[dict(payload_offset=i,value=receiver.body[1+i],source='prior CRC-valid frame') for i in outside])
        save(f'33_short_{size}_inherits_prior_bytes',r,'Current CRC is valid but decoder consumes prior-frame tail beyond current payload.')

    gate=[dict(header=h,state=s,enters_usb=dispatch_gate(h,s)) for h,s in [(0x33,2),(0x3c,2),(0xb3,2),(0xbc,2),(0x33,1),(0x3c,1),(0x32,2)]]
    assert [x['enters_usb'] for x in gate]==[True,True,False,False,False,False,False]
    save('opcode_flag_state_gate',gate,'High-bit responses or non-firmware state do not enter these USB event branches.')

    # All payload lengths permitted by an in-capacity nonempty 2048-byte LSP body.
    for length in range(120,2048):
        count=(length-56)//64; imu=8+64*count
        assert 0<=length-(imu+48)<64 and imu+48<=length
        assert all(8+64*i+64<=length for i in range(count))
    result=dict(kind='synthetic_only',case_count=len(cases),all_passed=True,cases=cases,
                finite_length_arithmetic=dict(first=120,last=2047,checked=1928,passed=True),
                limits=['No target execution or actual device failure.',
                        'Explicit previous valid frame supplies retained bytes; real initial RAM is not assumed zero.',
                        'LSP CRC acceptance does not mean downstream enqueue/cloud acceptance.',
                        'Native mapper outcomes, coroutine exceptions, logger mode/full queues are outside model.',
                        '3c larger than the2048-byte LSP body capacity is excluded.'])
    (OUT/'RESULTS.json').write_text(json.dumps(result,ensure_ascii=False,indent=2)+'\n')
    print(json.dumps(dict(case_count=len(cases),all_passed=True)))


if __name__=='__main__':main()
