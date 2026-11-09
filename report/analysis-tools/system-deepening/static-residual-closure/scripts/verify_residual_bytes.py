#!/usr/bin/env python3
"""Verify the four static residual gaps against the frozen BBIN and read-only exports.

Read-only. Re-checks every retained instruction row, the 14-row hwrev dispatch
table, the 14 version strings, the secondary data tables and their full-image
pointer references, the config-object slot builders, the 0x18c / 0x1a4 readers
and writers, and the two USART baud-rate-register paths in 0800e8b4.

Never executes firmware, never modifies the Ghidra project, and never contacts a
device, account or network.

Usage:
  python3 scripts/verify_residual_bytes.py
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
BBIN = (PROJECT / 'materials/eightsleep-full-evidence-20261107/firmware/mtk/'
        'rootfs/files/opt/eight/lib/subsystem_updates/firmware-sensor-g0.bbin')

BASE = 0x08008000
FLASH_END = 0x08028720
SHA256 = '51531576fd31af96f7239b71d26e1f175815f5cb21dbe9ab305fa9a33cc6a891'

# (u16 threshold, u32 callee) -- 8-byte rows at 0x08025da4, all pad fields zero.
DISPATCH_ROWS = [
    (0x0000, 0x0800f58d), (0x0805, 0x0800f719), (0x0900, 0x0800f761),
    (0x0a00, 0x0800f969), (0x0a05, 0x0800fafd), (0x0a10, 0x0800fae1),
    (0x0a30, 0x0800fc05), (0x0a33, 0x0800fc65), (0x0a34, 0x0800fc99),
    (0x0a35, 0x0800fcc1), (0x0a36, 0x0800fce1), (0x0a37, 0x0800fd0d),
    (0x0a87, 0x0800fd25), (0x0a90, 0x0800fd31),
]
VERSION_STRINGS = [b'I00', b'I05', b'J00', b'K00', b'K10', b'K05',
                   b'K30', b'K33', b'K34', b'K35', b'K36', b'K37',
                   b'K87', b'K90']

CHANNEL_MAPS = {
    0x08025ee8: bytes([3, 2, 1, 0, 4, 5, 6, 7]),
    0x08025ef0: bytes([0, 1, 2, 4, 3, 5, 6, 7]),
    0x08025ef8: bytes([3, 2, 1, 0, 4, 5, 6, 7]),
    0x08025f00: bytes([3, 2, 1, 0, 4, 5, 6, 7]),
    0x08025f08: bytes([2, 1, 0, 4, 3, 5, 6, 7]),
}
PERIPHERAL_TABLE_A = [0x4000043c, 0x40000438, 0x40000434,
                      0x40012c34, 0x40012c38, 0x40000834]
PERIPHERAL_TABLE_B = [0x4000043c, 0x40000438, 0x40000434,
                      0x40012c38, 0x40012c34, 0x40012c3c]
MASK_TABLE = [1, 2, 4, 8]
TAIL_BYTES = bytes([2, 0, 1, 3, 2, 1, 0, 0])
BAUD_DIVISOR_TABLE = [1, 2, 4, 6, 8, 0xa, 0xc, 0x10,
                      0x20, 0x40, 0x80, 0x100, 0x408, 0x402, 0x108, 0x101]

# Full-image little-endian pointer references, verified as an exact hit set.
POINTER_REFS = {
    0x08025ec0: [0x0800fdc0, 0x080125a4],
    0x08025ed0: [0x0800fbcc],
    0x08025ee8: [0x0800fd20],
    0x08025ef0: [0x08011160],
    0x08025ef8: [0x08011158],
    0x08025f00: [0x0800fcb8],
    0x08025f08: [0x0800fcbc],
    0x08025f10: [0x0800fc00],
    0x08025f28: [0x08012cf0],
}

# (address, asm substring, purpose) -- instruction-level anchors.
KEY_INSNS = [
    (0x0801d8a2, 'movs r7,r0', 'main dispatcher: r7 = param_1 config object'),
    (0x0801d8a4, 'movs r6,r1', 'main dispatcher: r6 = param_2 report object'),
    (0x0801d8cc, 'cmp r5,#0xe', '14-row dispatch loop bound'),
    (0x0800f744, 'movs r2,#0xc6', 'global object 0x18c writer builds 0xc6'),
    (0x0800f746, 'movs r1,#0x1', 'value written is 1'),
    (0x0800f748, 'ldr r3,[0x0800f75c]', 'base object 0x2000a4c0'),
    (0x0800f74a, 'lsls r2,r2,#0x1', '0xc6 << 1 = 0x18c'),
    (0x0800f74c, 'strb r1,[r3,r2]', 'writes byte at 0x2000a64c = base + 0x18c'),
    (0x0800f74e, 'dsb #0xf', 'data synchronisation barrier after the flag write'),
    (0x0800f752, 'dmb #0x1f', 'data memory barrier'),
    (0x0800f756, 'sev', 'send-event after publishing the flag'),
    (0x0801e686, 'movs r3,#0xc6', 'main dispatcher builds 0xc6'),
    (0x0801e688, 'lsls r3,r3,#0x1', '0xc6 << 1 = 0x18c'),
    (0x0801e68a, 'ldrb r1,[r7,r3]', 'reads config byte at +0x18c'),
    (0x0801e690, 'lsls r3,r3,#0x6', 'report destination offset 0xea << 6 = 0x3a80'),
    (0x0801e692, 'strb r1,[r6,r3]', 'copies +0x18c to report +0x3a80'),
    (0x0801e698, 'cmp r1,#0xff', '0xff sentinel on the +0x18c byte'),
    (0x0800c6f2, 'movs r3,#0xc6', 'COUNTER-EXAMPLE: same immediate, different shift'),
    (0x0800c6f4, 'lsls r3,r3,#0x2', '0xc6 << 2 = 0x318, NOT 0x18c'),
    (0x080153c4, 'movs r3,#0xc6', 'COUNTER-EXAMPLE: same immediate, different shift'),
    (0x080153c6, 'lsls r3,r3,#0x5', '0xc6 << 5 = 0x18c0, NOT 0x18c'),
    (0x0801e662, 'movs r3,#0xd0', '0xd0 << 1 = 0x1a0 pointer slot reader'),
    (0x0801e664, 'lsls r3,r3,#0x1', '0x1a0'),
    (0x0801e666, 'ldr r1,[r7,r3]', 'reads +0x1a0 table pointer'),
    (0x0801e674, 'movs r3,#0xd2', '0xd2 << 1 = 0x1a4 pointer slot reader'),
    (0x0801e676, 'lsls r3,r3,#0x1', '0x1a4'),
    (0x0801e678, 'ldr r1,[r7,r3]', 'reads +0x1a4 table pointer'),
    (0x0801e682, 'bl 0x08020f94', 'copies 8 bytes from the +0x1a4 table'),
    (0x0801112c, 'movs r2,#0xd2', '08011100 builds 0x1a4'),
    (0x0801112e, 'lsls r2,r2,#0x1', '0x1a4'),
    (0x08011130, 'str r3,[r4,r2]', 'writes +0x1a4 table pointer'),
    (0x0800fca8, 'movs r2,#0xd2', 'K34 setter builds 0x1a4'),
    (0x0800fcac, 'str r3,[r0,r2]', 'K34 writes +0x1a4 table pointer'),
    (0x0800fca2, 'cmp r2,#0x4', 'K34 selects table by sku == 4'),
    (0x0800fd0c, 'movs r2,#0xd2', 'K37 setter builds 0x1a4'),
    (0x0800fd16, 'str r3,[r0,r2]', 'K37 writes +0x1a4 table pointer'),
    # USART BRR path A (16x oversampling): direct BRR write.
    (0x0800e8f0, 'ldr r2,[r3,#0x2c]', 'config[9] also lands in peripheral +0x2c low nibble'),
    (0x0800e96c, 'ldr r0,[0x0800ea44]', '16MHz fallback clock constant'),
    (0x0800e970, 'ldr r3,[0x0800ea48]', 'baud divisor table base 0x0802420c'),
    (0x0800e974, 'ldrh r1,[r2,r3]', 'u16 divisor = table[config[9]]'),
    (0x0800e976, 'bl 0x08008174', 'path A: clock / divisor'),
    (0x0800e97c, 'lsrs r3,r5,#0x1', 'rounding term baud >> 1'),
    (0x0800e982, 'bl 0x08008174', 'path A: (clock/divisor + baud/2) / baud'),
    (0x0800e98a, 'subs r2,#0x10', 'BRR range low bound 0x10'),
    (0x0800e98c, 'cmp r2,r3', 'BRR range high bound 0xffff'),
    (0x0800e992, 'str r0,[r3,#0xc]', 'path A writes BRR verbatim'),
    # USART BRR path B (8x oversampling): x2 and fraction shift.
    (0x0800e9e4, 'bl 0x08008174', 'path B: clock / divisor'),
    (0x0800e9ea, 'lsls r0,r0,#0x1', 'path B: x2 for 8x oversampling'),
    (0x0800e9f2, 'bl 0x08008174', 'path B: (2*clock/divisor + baud/2) / baud'),
    (0x0800ea04, 'lsls r0,r0,#0x1c', 'isolate the low 4 fraction bits'),
    (0x0800ea06, 'bics r2,r3', 'clear the low 4 bits'),
    (0x0800ea0a, 'lsrs r0,r0,#0x1d', 'fraction >> 1 (3-bit fraction, bit3 stays 0)'),
    (0x0800ea0e, 'orrs r3,r0', 'recombine BRR'),
    (0x0800ea10, 'str r3,[r2,#0xc]', 'path B writes the encoded BRR'),
    (0x0800e9ba, 'bl 0x0800cd24', 'runtime SYSCLK source, call site 1'),
    (0x0800ea20, 'bl 0x0800cd24', 'runtime SYSCLK source, call site 2'),
    (0x0800eca6, 'bl 0x0800e8b4', '0800ec64 calls the baud-rate configurator'),
]

# Flash literal pool anchors: (address, expected u32, purpose).
LITERALS = [
    (0x0800ea44, 16000000, '16MHz fallback PCLK constant 0x00f42400'),
    (0x0800ea48, 0x0802420c, 'baud divisor table base'),
    (0x0800ea4c, 0x0000ffef, 'BRR range mask'),
    (0x0800ea34, 0x40013800, 'USART1 base'),
    (0x0800ea38, 0x40021000, 'RCC base'),
    (0x0800f75c, 0x2000a4c0, 'global object holding the +0x18c byte written by 0800f744'),
    (0x08011158, 0x08025ef8, '08011100 branch: +0x1a4 table pointer A'),
    (0x08011160, 0x08025ef0, '08011100 branch: +0x1a4 table pointer B'),
    (0x0800fcb8, 0x08025f00, 'K34 +0x1a4 table pointer (sku != 4)'),
    (0x0800fcbc, 0x08025f08, 'K34 +0x1a4 table pointer (sku == 4)'),
    (0x0800fd20, 0x08025ee8, 'K37 +0x1a4 table pointer'),
    (0x0800fd1c, 0x08024260, 'K37 version string K37'),
    (0x0800fd2c, 0x08024264, 'K87 version string K87'),
    (0x0800fd40, 0x08024268, 'K90 version string K90'),
]


# K87 / K90 setters have NO decoded function body in the read-only Ghidra project.
# They are verified straight from the frozen Thumb-1 halfwords with a tiny decoder.
# (address, expected halfword, expected mnemonic)
RAW_THUMB16 = [
    (0x0800fd24, 0x4b01, 'ldr r3,[pc,#0x4]'),
    (0x0800fd26, 0x6003, 'str r3,[r0,#0x0]'),
    (0x0800fd28, 0x4770, 'bx lr'),
    (0x0800fd30, 0x4b03, 'ldr r3,[pc,#0xc]'),
    (0x0800fd32, 0x2200, 'movs r2,#0x0'),
    (0x0800fd34, 0x6003, 'str r3,[r0,#0x0]'),
    (0x0800fd36, 0x23c6, 'movs r3,#0xc6'),
    (0x0800fd38, 0x005b, 'lsls r3,r3,#0x1'),
    (0x0800fd3a, 0x54c2, 'strb r2,[r0,r3]'),
    (0x0800fd3c, 0x4770, 'bx lr'),
]


def decode_thumb16(h: int) -> str:
    """Minimal Thumb-1 decoder covering only the forms used by the two setters."""
    if h & 0xf800 == 0x4800:                       # ldr rt,[pc,#imm8*4]
        return f'ldr r{(h >> 8) & 7},[pc,#0x{(h & 0xff) * 4:x}]'
    if h & 0xf800 == 0x2000:                       # movs rd,#imm8
        return f'movs r{(h >> 8) & 7},#0x{h & 0xff:x}'
    if h & 0xf800 == 0x0000 and (h >> 6) & 0x1f:   # lsls rd,rm,#imm5
        return f'lsls r{h & 7},r{(h >> 3) & 7},#0x{(h >> 6) & 0x1f:x}'
    if h & 0xf800 == 0x6000:                       # str rt,[rn,#imm5*4]
        return f'str r{h & 7},[r{(h >> 3) & 7},#0x{((h >> 6) & 0x1f) * 4:x}]'
    if h & 0xfe00 == 0x5400:                       # strb rt,[rn,rm]
        return f'strb r{h & 7},[r{(h >> 3) & 7},r{(h >> 6) & 7}]'
    if h == 0x4770:
        return 'bx lr'
    if h == 0x46c0:
        return 'nop'
    return f'<undecoded 0x{h:04x}>'


def load_image() -> bytes:
    data = BBIN.read_bytes()
    assert len(data) == 132896, 'frozen BBIN size mismatch'
    assert hashlib.sha256(data).hexdigest() == SHA256, 'frozen BBIN SHA256 mismatch'
    return data


def rd(data, va, n):
    return data[va - BASE:va - BASE + n]


def u16(data, va):
    return struct.unpack_from('<H', data, va - BASE)[0]


def u32(data, va):
    return struct.unpack_from('<I', data, va - BASE)[0]


def find_all(data, needle):
    hits, pos = [], 0
    while True:
        i = data.find(needle, pos)
        if i < 0:
            return [BASE + h for h in hits]
        hits.append(i)
        pos = i + 1


def read_exports():
    """(address -> (raw bytes, asm, file, all REF payloads)) plus per-file row counts."""
    rows, ref_lines, files = {}, [], {}
    for path in sorted(TOOL.glob('pass*/*.txt')):
        if path.name == 'program.txt':
            continue
        files[path.name] = 0
        for line in path.read_text().splitlines():
            m = re.match(r'INSN ([0-9a-f]{8}) ([0-9a-f]+) (.*)', line)
            if m:
                addr = int(m[1], 16)
                rows[addr] = (bytes.fromhex(m[2]), m[3], path.name)
                files[path.name] += 1
                ref_lines.append((addr, m[3], path.name))
    return rows, ref_lines, files


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--tables', default=str(TOOL / 'RESIDUAL_TABLES.json'))
    ap.add_argument('--validation', default=str(TOOL / 'BYTE_VALIDATION.json'))
    args = ap.parse_args()

    data = load_image()
    rows, ref_lines, files = read_exports()
    checks, failures = [], []

    def check(kind, name, got, want):
        ok = got == want
        checks.append({'kind': kind, 'name': name, 'got': got, 'expected': want,
                       'status': 'PASS' if ok else 'FAIL'})
        if not ok:
            failures.append(f'{kind}:{name}: got {got!r}, expected {want!r}')

    check('image', 'sha256', hashlib.sha256(data).hexdigest(), SHA256)
    check('image', 'size', len(data), 132896)

    prog = (TOOL / 'pass1/program.txt').read_text()
    check('image', 'program_sha256_gate',
          SHA256 in prog.splitlines()[1], True)
    check('image', 'program_base', 'BLOCK ram 08008000' in prog, True)

    # Every retained instruction row must match the frozen bytes exactly.
    for addr in sorted(rows):
        raw, asm, fname = rows[addr]
        check('instruction', f'{addr:08x}', rd(data, addr, len(raw)).hex(), raw.hex())
    # Every flash literal carried in a REF annotation must match too.
    literal_hits = 0
    for addr, asm, fname in ref_lines:
        for m in re.finditer(r'REF\[[A-Z_]+:([0-9a-f]{8})=([0-9a-f]+)\]', asm):
            lit_addr, lit_val = int(m[1], 16), int(m[2], 16)
            if not (BASE <= lit_addr < FLASH_END):
                continue
            literal_hits += 1
            check('literal', f'{addr:08x}->{lit_addr:08x}',
                  u32(data, lit_addr), lit_val)

    # 14-row dispatch table and the 14 version strings.
    for i, (th, callee) in enumerate(DISPATCH_ROWS):
        va = 0x08025da4 + i * 8
        check('dispatch', f'row{i}_threshold', u16(data, va), th)
        check('dispatch', f'row{i}_pad', u16(data, va + 2), 0)
        check('dispatch', f'row{i}_callee', u32(data, va + 4), callee)
        check('dispatch', f'str{i}', rd(data, 0x08024234 + i * 4, 4).hex(),
              (VERSION_STRINGS[i] + b'\x00').hex())
    check('dispatch', 'loop_bound_bytes', rd(data, 0x0801d8cc, 2).hex(), '0e2d')

    # Secondary data tables.
    for va, expected in CHANNEL_MAPS.items():
        check('channel_map', f'{va:08x}', list(rd(data, va, 8)), list(expected))
        check('channel_map', f'{va:08x}_is_permutation',
              sorted(rd(data, va, 8)), list(range(8)))
    for i, v in enumerate(MASK_TABLE):
        check('mask_table', f'idx{i}', u32(data, 0x08025ec0 + i * 4), v)
    for name, va, expected in (('peripheral_A', 0x08025ed0, PERIPHERAL_TABLE_A),
                               ('peripheral_B', 0x08025f10, PERIPHERAL_TABLE_B)):
        for i, v in enumerate(expected):
            check(name, f'idx{i}', u32(data, va + i * 4), v)
    check('tail_bytes', '08025f28', list(rd(data, 0x08025f28, 8)), list(TAIL_BYTES))
    for i, v in enumerate(BAUD_DIVISOR_TABLE):
        check('baud_divisor_table', f'idx{i}', u16(data, 0x0802420c + i * 2), v)

    # Full-image pointer reference sets (these are what make the mapping unique).
    for target, expected in POINTER_REFS.items():
        check('pointer_ref', f'{target:08x}',
              find_all(data, struct.pack('<I', target)),
              expected)

    # Instruction anchors and flash literals.
    for addr, fragment, purpose in KEY_INSNS:
        got = rows.get(addr)
        check('key_insn', f'{addr:08x}:{purpose}',
              fragment in got[1] if got else None, True)
    for addr, want, purpose in LITERALS:
        check('literal_anchor', f'{addr:08x}:{purpose}', u32(data, addr), want)

    # Negative checks: common baud rates are NOT compile-time constants in flash,
    # so any concrete BRR number must be stated as a parameterised model output.
    for baud in (9600, 19200, 38400, 57600, 115200, 230400, 460800, 921600):
        check('negative_baud_constant', f'{baud}',
              find_all(data, struct.pack('<I', baud)), [])

    # The two setters that the project does not disassemble are checked against
    # raw Thumb-1 halfwords from the frozen image.
    for addr, half, mnemonic in RAW_THUMB16:
        got = u16(data, addr)
        check('raw_thumb16', f'{addr:08x}:bytes', got, half)
        check('raw_thumb16', f'{addr:08x}:decode', decode_thumb16(got), mnemonic)

    # Distinct shift widths for the same 0xc6 immediate.
    check('shift_disambiguation', '0xc6<<1', 0xc6 << 1, 0x18c)
    check('shift_disambiguation', '0xc6<<2', 0xc6 << 2, 0x318)
    check('shift_disambiguation', '0xc6<<5', 0xc6 << 5, 0x18c0)

    totals = {
        'instruction_rows': len(rows),
        'instruction_files': len(files),
        'instruction_rows_per_file': files,
        'flash_literal_annotations': literal_hits,
        'dispatch_rows': len(DISPATCH_ROWS),
        'channel_maps': len(CHANNEL_MAPS),
        'pointer_ref_targets': len(POINTER_REFS),
        'key_instruction_anchors': len(KEY_INSNS),
        'literal_anchors': len(LITERALS),
        'raw_thumb16_instructions': len(RAW_THUMB16),
        'negative_checks': 8,
        'total_checks': len(checks),
        'failures': len(failures),
    }

    tables = {
        'schema': 'eightsleep.nonusb.static-residual-tables.v1',
        'date': '2026-11-08',
        'source': {
            'bbin': str(BBIN.relative_to(PROJECT)),
            'bytes': len(data), 'sha256': SHA256,
            'va_to_file_offset': 'offset = VA - 0x08008000',
        },
        'method': 'read-only byte comparison against the frozen BBIN and retained Ghidra -readOnly -noanalysis exports',
        'dispatch_table': {
            'base': '0x08025da4', 'row_size': 8, 'row_count': 14,
            'row_layout': '[u16 threshold][u16 pad][u32 callee]',
            'string_table_base': '0x08024234', 'string_size': 4,
            'rows': [dict(index=i, threshold=hex(th), callee=hex(ca),
                          version=VERSION_STRINGS[i].decode())
                     for i, (th, ca) in enumerate(DISPATCH_ROWS)],
            'note': 'String table indices 4/5 are K10/K05 while the threshold rows are 0x0A05/0x0A10 (K05/K10); the two are swapped.',
        },
        'secondary_tables': {
            'channel_maps': {
                hex(va): {'bytes': list(v), 'is_permutation_of_0_7': True}
                for va, v in CHANNEL_MAPS.items()
            },
            'channel_map_role': '8-byte index remap consumed through config-object slot +0x1a4 (u32 index 0x69); main dispatcher 0801e674 reads the pointer and copies 8 bytes into the report object when non-NULL.',
            'peripheral_address_table_A': dict(base='0x08025ed0', u32=[hex(v) for v in PERIPHERAL_TABLE_A], referenced_at='0x0800fbcc'),
            'peripheral_address_table_B': dict(base='0x08025f10', u32=[hex(v) for v in PERIPHERAL_TABLE_B], referenced_at='0x0800fc00'),
            'mask_table': dict(base='0x08025ec0', u32=MASK_TABLE,
                               referenced_at=['0x0800fdc0', '0x080125a4']),
            'tail_bytes': dict(base='0x08025f28', bytes=list(TAIL_BYTES),
                               referenced_at='0x08012cf0'),
            'baud_divisor_table': dict(base='0x0802420c', u16=BAUD_DIVISOR_TABLE,
                                       referenced_at='0x0800ea48',
                                       role='u16 divisor indexed by config[9]; config[9] also occupies the low nibble of the peripheral +0x2c register'),
            'pointer_references': {hex(k): [hex(x) for x in v]
                                   for k, v in POINTER_REFS.items()},
        },
        'config_slots': {
            'plus_0x18c': {
                'build': 'movs rN,#0xc6; lsls rN,rN,#1',
                'type': 'byte (strb / ldrb)',
                'writers': [
                    '0x0800f74c: strb r1(=1),[0x2000a4c0 + 0x18c = 0x2000a64c], followed by DSB #0xf / DMB #0x1f / SEV (different base object)',
                    '0x0800fd3a (K90 setter, row 13, hwrev >= 0x0A90): strb r2(=0),[param_1 + 0x18c]',
                ],
                'readers': [
                    '0x0801e68a (main dispatcher 0801d888): ldrb r1,[r7 + 0x18c] with r7 = param_1',
                ],
                'downstream': 'copied to report object param_2 + 0x3a80 at 0801e692; the adjacent byte +0x18d goes to +0x3a81; 0xff is a sentinel that redirects through 0801ea3e',
                'disambiguation': '0xc6 << 2 = 0x318 (0800c6f4) and 0xc6 << 5 = 0x18c0 (080153c6) are DIFFERENT slots, not this byte; only the three lsls #1 sites build 0x18c',
            },
            'plus_0x1a0': {
                'build': 'movs rN,#0xd0; lsls rN,rN,#1',
                'type': 'u32 pointer',
                'reader': '0x0801e666: ldr r1,[r7 + 0x1a0]; if non-NULL, 8 bytes are copied via 08020f94',
            },
            'plus_0x1a4': {
                'build': 'movs rN,#0xd2; lsls rN,rN,#1',
                'type': 'u32 pointer (u32 index 0x69)',
                'writers': [
                    '0x0800fcac (K34, row 8): 0x08025f00, or 0x08025f08 when DAT_20001cf8 (sku) == 4',
                    '0x0800fd16 (K37, row 11): 0x08025ee8',
                    '0x08011130 (08011100): 0x08025ef8 when DAT_20001cf0 == 0x5150014E; otherwise 0x08025ef0 when (DAT_20001cf0 & ~2) == 0x5150014D, FUN_080110f6() == 0, hwrev == 0x0A35 and sku == 4',
                ],
                'reader': '0x0801e678: ldr r1,[r7 + 0x1a4]; if non-NULL, 8 bytes are copied via 08020f94 at 0801e680',
                'accumulation': 'the 14 dispatch rows are applied cumulatively (all rows whose threshold <= hwrev), so later setters overwrite this slot; 08011100 runs later as a callback',
            },
        },
        'usart_brr': {
            'function': '0x0800e8b4', 'caller': '0x0800eca6 (0800ec64)',
            'division_helper': '0x08008174 = unsigned integer division param_1 / param_2; quotient in r0, remainder in r1',
            'config_object': {
                'param_1[0]': 'USART peripheral base (0x40013800 / 0x40004400 / 0x40004800 / 0x40004c00 / 0x40005000 / 0x40013c00)',
                'param_1[1]': 'target baud rate (runtime value; no compile-time baud constant exists in the image)',
                'param_1[7]': 'oversampling selector: 0x8000 or other',
                'param_1[9]': 'u16 index into 0x0802420c; also written to the low nibble of peripheral +0x2c',
            },
            'clock_sources': [
                '0x00f42400 = 16000000 constant at 0x0800ea44 (fallback / HSI path)',
                'FUN_0800cd24() runtime SYSCLK at call sites 0x0800e9ba and 0x0800ea20 (64MHz per the previous PLL round, conditional)',
            ],
            'path_A': {
                'label': '16x oversampling, direct BRR',
                'formula': 'q = clock // table[config[9]]; BRR = (q + (baud >> 1)) // baud',
                'write': '0x0800e992: str r0,[USART + 0xc]',
            },
            'path_B': {
                'label': '8x oversampling, x2 and 3-bit fraction',
                'formula': 'q = clock // table[config[9]]; N = (2*q + (baud >> 1)) // baud; BRR = (N & 0xfff0) | ((N & 0xf) >> 1)',
                'write': '0x0800ea10: str r3,[USART + 0xc]',
            },
            'range_check': '0x0800e98a/0x0800e9fa: (BRR - 0x10) must be <= 0xffef, i.e. 0x10 <= BRR <= 0xffff; otherwise 0800e950 returns 1 (error)',
            'source_select': 'RCC 0x40021054 bits [1:0]/[3:2]/[5:4] choose the USART clock source; the branches at 0800e900..0800e9d8 pick path A, path B, the 16MHz fallback or the runtime SYSCLK',
        },
        'limits': [
            'The channel maps are byte permutations; which physical sensor channel each index denotes needs a schematic or device.',
            '0x2000a4c0 + 0x18c and param_1 + 0x18c share the same offset but have different base objects; static bytes do not prove they are the same field.',
            'param_1[1] (baud) and param_1[9] (divisor index) are runtime values; no standard baud-rate constant appears anywhere in the 132896-byte image.',
            '0x0800cd24() = 64MHz is a conditional computed value from the previous round, not a measured oscillator.',
            'RCC 0x40021054 is a live register; which clock-source branch runs on hardware cannot be fixed statically.',
            'No firmware executed; no device, account, API or network access.',
        ],
        'executes_firmware': False,
    }
    Path(args.tables).write_text(json.dumps(tables, ensure_ascii=False, indent=2) + '\n')

    validation = {
        'schema': 'eightsleep.nonusb.static-residual-byte-validation.v1',
        'date': '2026-11-08',
        'status': 'PASS' if not failures else 'FAIL',
        'source': tables['source'],
        'method': tables['method'],
        'totals': totals,
        'checks': checks,
        'failures': failures,
        'limits': tables['limits'],
        'executes_firmware': False,
    }
    Path(args.validation).write_text(json.dumps(validation, ensure_ascii=False, indent=2) + '\n')
    print(json.dumps({'status': validation['status'], 'failures': len(failures),
                      'checks': len(checks), 'totals': totals},
                     ensure_ascii=False, indent=2))
    return 0 if not failures else 1


if __name__ == '__main__':
    raise SystemExit(main())
