"""Synthetic header/length/gate checks, not MCU/Frank execution or a signal model.

Only reviewed ordinary paths are represented. Opaque record bytes are synthetic;
they do not stand for measured ADC, CapSense, IMU, units, or channel locations.
"""
import json
import struct
from pathlib import Path

OUT = Path(__file__).resolve().parent.parent


def batch34():
    # 0x4234 little endian + 0xf401 little endian; BE32 serializer thereafter.
    header = struct.pack('<IH', 0x4234, 0xf401)
    return header + struct.pack('>IIH', 1, 2, 3) + b''.join(struct.pack('>II', i, 100+i) for i in range(25))


def batch35():
    header = struct.pack('<III', 0x235, 0, 0xc8000000)
    return header + struct.pack('>I', 1) + b''.join(struct.pack('>IIII', i, i+10, i+20, i+30) for i in range(10))


def main_branch(raw_gate, adc_count, imu_count):
    if raw_gate:
        return (0x3c, 377) if adc_count > 4 and imu_count != 0 else None
    return (0x34, 216) if adc_count > 24 else None


def enters_33_business_branch(body, host_state=2):
    # Reused Frank 00219b34 + 00236174 + 0027e7b0 contract.
    # This says nothing about CRC, queue enablement, decoder safety or enqueue.
    return bool(body) and body[0] >> 7 == 0 and host_state == 2 and body[0] & 0x7f == 0x33


def main():
    rows = []
    def record(name, actual, expected, evidence):
        assert actual == expected, (name, actual, expected)
        rows.append({'name': name, 'actual': actual, 'expected': expected, 'status': 'PASS', 'evidence': evidence})
    a, b = batch34(), batch35()
    record('batch34_header_and_size', [a[:6].hex(), len(a), len(a)-1], ['3442000001f4', 216, 215], ['0801f2ec..0801f374', '080154f4..0801557c'])
    record('batch35_header_and_size', [b[:12].hex(), len(b), len(b)-1], ['3502000000000000000000c8', 176, 175], ['0802533e..080253b8', '0801b446..0801b4c0'])
    for gate, adc, imu, expected in [(1,4,1,None),(1,5,0,None),(1,5,1,(0x3c,377)),(0,24,1,None),(0,25,0,(0x34,216))]:
        record(f'main_gate_{gate}_adc_{adc}_imu_{imu}', main_branch(gate,adc,imu), expected, ['0801f2c8..0801f2de','0801f900..0801f912'])
    for name, body, state, expected in [('real_header34',a,2,False),('real_header35',b,2,False),('raw_header3c',bytes([0x3c])+bytes(376),2,False),('synthetic33',bytes([0x33])+bytes(26),2,True),('reply_b3',bytes([0xb3,0]),2,False),('synthetic33_wrong_state',bytes([0x33])+bytes(26),1,False)]:
        record(name, enters_33_business_branch(body,state),expected,['Frank00219b34','Frank00236174','Frank0027e7b0'])
    result = {'kind':'finite_synthetic_contract_checks','status':'PASS','cases':rows,
              'not_modeled':['Native execution','CRC/escaping (already separate receiver evidence)','Full producer record semantics','Interrupt mutation or queue races','Real hardware deployment/input frequency','Indirect unknown producers','CapSense queue existence does not imply any MCU opcode33 producer']}
    (OUT/'model/RESULTS.json').write_text(json.dumps(result,ensure_ascii=False,indent=2)+'\n')
    print(json.dumps({'status':'PASS','synthetic_cases':len(rows)}))


if __name__ == '__main__':
    main()
