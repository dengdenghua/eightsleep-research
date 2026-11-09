"""Offline identity checks only; never executes any firmware or opens Ghidra."""
import hashlib
import json
import re
import struct
from pathlib import Path

OUT = Path(__file__).resolve().parent.parent
ROOT = OUT.parents[2]


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def put(name, obj):
    (OUT/name).write_text(json.dumps(obj, ensure_ascii=False, indent=2)+'\n')


def thumb_bl(addr, raw):
    h1, h2 = struct.unpack('<HH', raw)
    assert h1 & 0xf800 == 0xf000 and h2 & 0xd000 == 0xd000
    sign = (h1 >> 10) & 1
    i1 = 1 ^ (((h2 >> 13) & 1) ^ sign)
    i2 = 1 ^ (((h2 >> 11) & 1) ^ sign)
    offset = (sign << 24) | (i1 << 23) | (i2 << 22) | ((h1 & 1023) << 12) | ((h2 & 2047) << 1)
    if sign:
        offset -= 1 << 25
    return (addr+4+offset) & 0xffffffff


def main():
    inputs = json.loads((OUT/'INPUTS.json').read_text())
    outputs = []
    for inp in inputs:
        path = ROOT/inp['path']
        assert digest(path) == inp['sha256'] and path.stat().st_size == inp['size']
        data = path.read_bytes()
        base = int(inp['mapping_base'], 16)
        loads = []
        if inp['family'] == 'host':
            header = struct.unpack_from('<16sHHIQQQIHHHHHH', data)
            assert data[:6] == b'\x7fELF\x02\x01' and header[2] == 183
            loads = [struct.unpack_from('<IIQQQQQQ', data, header[5]+i*header[9]) for i in range(header[10])]
            loads = [s for s in loads if s[0] == 1]

        def offset(addr, length):
            va = addr-base
            if not loads:
                assert 0 <= va <= len(data)-length
                return va
            for seg in loads:
                if seg[3] <= va and va+length <= seg[3]+seg[5]:
                    return seg[2]+va-seg[3]
            raise AssertionError(('unbacked ELF address', hex(addr)))

        seen = {}
        occurrences = bls = literals = 0
        checked_files = []
        for source in sorted((OUT/'source'/inp['family']).glob('*.txt')):
            count = 0
            for line in source.read_text().splitlines():
                match = re.match(r'INSN ([0-9a-f]{8}) ([0-9a-f]+) (.*)', line)
                if not match:
                    continue
                addr = int(match[1], 16)
                raw = bytes.fromhex(match[2])
                at = offset(addr, len(raw))
                assert data[at:at+len(raw)] == raw, (source.name, hex(addr))
                assert addr not in seen or seen[addr] == raw
                seen[addr] = raw
                occurrences += 1
                count += 1
                if inp['family'] != 'host':
                    branch = re.match(r'bl 0x([0-9a-f]{8})\b', match[3])
                    if branch:
                        assert thumb_bl(addr, raw) == int(branch[1], 16), (source.name, hex(addr), 'BL')
                        bls += 1
                    for literal, value in re.findall(r'REF\[READ:([0-9a-f]{8})=([0-9a-f]+)\]', match[3]):
                        off = int(literal, 16)-base
                        if 0 <= off <= len(data)-4:
                            assert int.from_bytes(data[off:off+4], 'little') == int(value, 16)
                            literals += 1
            checked_files.append({'path': str(source.relative_to(OUT)), 'instructions': count})
        outputs.append({'family': inp['family'], 'status': 'PASS', 'input_sha256': inp['sha256'],
                        'instruction_occurrences': occurrences, 'unique_instructions': len(seen),
                        'unique_instruction_bytes': sum(map(len, seen.values())), 'thumb_BL_targets': bls,
                        'flash_literal_occurrences': literals, 'files': checked_files})
    sources = json.loads((OUT/'SOURCES.json').read_text())['sources']
    for item in sources:
        assert digest(OUT/item['local']) == item['sha256']
        assert digest(ROOT/item['origin']) == item['sha256']
    put('BYTE_VALIDATION.json', {'status': 'PASS', 'inputs': outputs,
                               'limits': 'Byte identity; Thumb BL destination and in-BBIN 32-bit flash literals. ELF instruction bytes mapped through PT_LOAD. Not execution, full control-flow recovery, or physical deployment proof.'})
    records = [{'path': str(p.relative_to(OUT)), 'size': p.stat().st_size, 'sha256': digest(p)}
               for p in sorted(OUT.rglob('*')) if p.is_file() and p.name != 'SOURCE_MANIFEST.json' and '__pycache__' not in p.parts]
    put('SOURCE_MANIFEST.json', {'self_excluded': True, 'files': records, 'original_inputs': inputs})
    print(json.dumps({'status': 'PASS', 'families': [{k:v for k,v in x.items() if k != 'files'} for x in outputs], 'manifest_records': len(records)}))


if __name__ == '__main__':
    main()
