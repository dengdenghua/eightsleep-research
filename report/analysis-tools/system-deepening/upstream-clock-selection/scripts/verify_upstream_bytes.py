#!/usr/bin/env python3
"""Verify the upstream clock-selection exports and data tables against the frozen BBIN.

Read-only: re-reads retained instruction rows, flash literals, branch arithmetic and
four in-image data tables. Never executes firmware, never modifies the Ghidra
project, never contacts a device/account/network.

Usage:
  python3 scripts/verify_upstream_bytes.py [--output BYTE_VALIDATION.json]
"""
from __future__ import annotations

import argparse
import hashlib
import json
import re
import struct
from pathlib import Path

HERE = Path(__file__).resolve().parent
TOOL = HERE.parent
PROJECT = TOOL.parents[3]
BBIN_DIR = PROJECT / 'materials/eightsleep-full-evidence-20261107/firmware/mtk/rootfs/files/opt/eight/lib/subsystem_updates'

NONUSB = {'file': 'firmware-sensor-g0.bbin', 'base': 0x08008000,
          'sha256': '51531576fd31af96f7239b71d26e1f175815f5cb21dbe9ab305fa9a33cc6a891'}

# In-image tables, transcribed from the frozen file and asserted verbatim below.
DIVIDER_TABLE = [0] * 8 + [1, 2, 3, 4, 6, 7, 8, 9]
VERSION_STRINGS = ['I00', 'I05', 'J00', 'K00', 'K10', 'K05', 'K30', 'K33',
                   'K34', 'K35', 'K36', 'K37', 'K87', 'K90']
HWREV_THRESHOLDS = [
    (0x0000, 0x0800f58d), (0x0805, 0x0800f719), (0x0900, 0x0800f761),
    (0x0A00, 0x0800f969), (0x0A05, 0x0800fafd), (0x0A10, 0x0800fae1),
    (0x0A30, 0x0800fc05), (0x0A33, 0x0800fc65), (0x0A34, 0x0800fc99),
    (0x0A35, 0x0800fcc1), (0x0A36, 0x0800fce1), (0x0A37, 0x0800fd0d),
    (0x0A87, 0x0800fd25), (0x0A90, 0x0800fd31),
]
INIT_POINTER_SLOTS = {
    0x0800f698: 0x08010bf5,
    0x0800f78c: 0x08010c6d,
    0x0800fa60: 0x080114bd,
    0x0800fb74: 0x08011d91,
    0x0800fc44: 0x08011915,
    0x0800fc88: 0x08012009,
}


def bl_target(a, raw):
    """Standard Thumb-2 BL target arithmetic."""
    h1 = int.from_bytes(raw[:2], 'little')
    h2 = int.from_bytes(raw[2:], 'little')
    assert h1 & 0xf800 == 0xf000 and h2 & 0xd000 == 0xd000
    s = h1 >> 10 & 1
    i1 = 1 ^ ((h2 >> 13 & 1) ^ s)
    i2 = 1 ^ ((h2 >> 11 & 1) ^ s)
    n = (s << 24) | (i1 << 23) | (i2 << 22) | ((h1 & 1023) << 12) | ((h2 & 2047) << 1)
    if s:
        n -= 1 << 25
    return (a + 4 + n) & 0xffffffff


def signed(n, width):
    return n - (1 << width) if n & (1 << (width - 1)) else n


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--output', default=str(TOOL / 'BYTE_VALIDATION.json'))
    args = ap.parse_args()

    data = (BBIN_DIR / NONUSB['file']).read_bytes()
    assert hashlib.sha256(data).hexdigest() == NONUSB['sha256'], 'nonUSB SHA mismatch'
    base = NONUSB['base']

    def u32(va):
        return struct.unpack_from('<I', data, va - base)[0]

    def u16(va):
        return struct.unpack_from('<H', data, va - base)[0]

    totals = {'instruction_rows': 0, 'instruction_bytes': 0, 'flash_literals': 0,
              'bl_targets': 0, 'direct_branch_targets': 0}
    unique = {}
    per_file = []
    failures = []

    for path in sorted(TOOL.glob('pass*/*.txt')):
        if path.name == 'program.txt':
            continue
        counts = dict.fromkeys(totals, 0)
        for line in path.read_text().splitlines():
            m = re.match(r'INSN ([0-9a-f]{8}) ([0-9a-f]+) (.*)', line)
            if not m:
                continue
            a = int(m[1], 16)
            raw = bytes.fromhex(m[2])
            asm = m[3]
            off = a - base
            if not (0 <= off <= len(data) - len(raw) and data[off:off + len(raw)] == raw):
                failures.append({'file': path.name, 'check': 'instruction_bytes', 'address': hex(a)})
                continue
            if a in unique and unique[a] != raw:
                failures.append({'file': path.name, 'check': 'conflicting_bytes', 'address': hex(a)})
            unique[a] = raw
            counts['instruction_rows'] += 1
            counts['instruction_bytes'] += len(raw)

            mb = re.match(r'bl 0x([0-9a-f]{8})\b', asm)
            if mb:
                got = bl_target(a, raw)
                if got != int(mb[1], 16):
                    failures.append({'file': path.name, 'check': 'bl_target', 'address': hex(a)})
                else:
                    counts['bl_targets'] += 1
            md = re.match(r'(b|beq|bne|bcs|bcc|bmi|bpl|bvs|bvc|bhi|bls|bge|blt|bgt|ble) 0x([0-9a-f]{8})\b', asm)
            if md and len(raw) == 2:
                h = int.from_bytes(raw, 'little')
                if md[1] == 'b' and h & 0xf800 == 0xe000:
                    dest = a + 4 + signed(h & 0x7ff, 11) * 2
                elif md[1] != 'b' and h & 0xf000 == 0xd000:
                    dest = a + 4 + signed(h & 255, 8) * 2
                else:
                    dest = None
                if dest is not None:
                    if dest != int(md[2], 16):
                        failures.append({'file': path.name, 'check': 'direct_branch_target', 'address': hex(a)})
                    else:
                        counts['direct_branch_targets'] += 1
            for addr, val in re.findall(r'REF\[READ:([0-9a-f]{8})=([0-9a-f]+)\]', asm):
                o = int(addr, 16) - base
                if 0 <= o <= len(data) - 4 and int.from_bytes(data[o:o + 4], 'little') == int(val, 16):
                    counts['flash_literals'] += 1
                else:
                    failures.append({'file': path.name, 'check': 'flash_literal', 'address': addr})
        for k in totals:
            totals[k] += counts[k]
        per_file.append({'path': str(path.relative_to(TOOL)),
                         'sha256': hashlib.sha256(path.read_bytes()).hexdigest(), **counts})

    tables = []

    def record(name, va, ok, detail):
        tables.append({'name': name, 'address': hex(va), 'ok': ok, 'detail': detail})
        if not ok:
            failures.append({'check': 'data_table', 'table': name})

    div = [u32(0x080241cc + 4 * i) for i in range(16)]
    record('prescaler_shift_table_080241cc', 0x080241cc, div == DIVIDER_TABLE,
           {'entries': 16, 'values': div})

    strings = [data[(0x08024234 + 4 * i) - base:(0x08024234 + 4 * i) - base + 3].decode('ascii')
               for i in range(14)]
    nul = all(data[(0x08024234 + 4 * i + 3) - base] == 0 for i in range(14))
    record('hwrev_version_strings_08024234', 0x08024234, strings == VERSION_STRINGS and nul,
           {'entries': 14, 'values': strings, 'all_nul_terminated': nul})

    thr = [(u16(0x08025da4 + 8 * i), u32(0x08025da4 + 8 * i + 4)) for i in range(14)]
    record('hwrev_threshold_dispatch_08025da4', 0x08025da4, thr == HWREV_THRESHOLDS,
           {'entries': 14, 'rows': [{'threshold': hex(t), 'callee': hex(p)} for t, p in thr]})

    slots = {hex(va): {'value': hex(u32(va)), 'expected': hex(exp), 'ok': u32(va) == exp}
             for va, exp in INIT_POINTER_SLOTS.items()}
    record('init_function_pointer_slots', 0x0800f698, all(v['ok'] for v in slots.values()), slots)

    # Ghidra prints instruction bytes in memory order: "0e2d" is the LE halfword 0x2d0e.
    loop_byte = data[0x0801d8cc - base:0x0801d8cc - base + 2]
    record('dispatch_loop_count_cmp_r5_0xe', 0x0801d8cc, loop_byte == bytes.fromhex('0e2d'),
           {'raw_hex': loop_byte.hex(), 'meaning': 'cmp r5,#0xe -> 14 table entries'})

    hse = u32(0x080109f0)
    record('config_entry_2_hse_constant', 0x080109f0, hse == 8000000,
           {'value': hse, 'meaning': '0x7a1200 = 8000000 written to 0x20000474'})

    literals = {hex(va): hex(u32(va)) for va in (0x0800cdb0, 0x08010958, 0x080109ec, 0x0801deb8)}
    record('ram_field_literals', 0x0800cdb0,
           all(u32(int(k, 16)) == 0x20000474 for k in literals if int(k, 16) != 0x0801deb8)
           and u32(0x0801deb8) == 0x20001cfc, literals)

    result = {
        'schema': 'eightsleep.nonusb.upstream-clock-selection-byte-validation.v1',
        'date': '2026-11-08',
        'status': 'PASS' if not failures else 'FAIL',
        'source': {'file': str(BBIN_DIR / NONUSB['file']), 'bytes': len(data),
                   'sha256': NONUSB['sha256'], 'image_base': hex(base),
                   'mapping': 'file offset = VA - 0x08008000'},
        'method': 'Retained Ghidra -readOnly -noanalysis exports re-checked byte-for-byte; '
                  'BL/branch targets recomputed from raw halfwords; four in-image tables and '
                  'the dispatch loop constant asserted against the frozen file.',
        'totals_including_overlap': totals,
        'unique_instruction_addresses': len(unique),
        'unique_instruction_bytes': sum(len(v) for v in unique.values()),
        'failures': failures,
        'data_tables': tables,
        'files': per_file,
        'limits': [
            'Data-table values are static bytes, not proof of which board or oscillator is fitted.',
            'A setter marked analyst_seed_* is an existing analyst-created function in the retained project.',
            'Two dispatch-table callees (0800fd25 / 0800fd31) have no decoded function body in this project.',
            'No firmware execution, no device/account/network access.',
        ],
        'executes_firmware': False,
    }
    Path(args.output).write_text(json.dumps(result, ensure_ascii=False, indent=2) + '\n')
    print(json.dumps({'status': result['status'], 'failures': len(failures),
                      'totals': totals, 'unique_addresses': len(unique),
                      'tables': len(tables), 'files': len(per_file)}, ensure_ascii=False, indent=2))
    return 0 if not failures else 1


if __name__ == '__main__':
    raise SystemExit(main())
