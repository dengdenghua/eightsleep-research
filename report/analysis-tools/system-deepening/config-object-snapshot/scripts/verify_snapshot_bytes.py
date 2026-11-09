#!/usr/bin/env python3
"""Byte-level verification for the sixth static round (config-object snapshot).

Read-only. Re-reads the frozen BBIN plus the retained Ghidra -readOnly
-noanalysis exports in pass1/pass2/pass3 of this folder and verifies:

  * every decoded INSN machine-code row against the frozen image
  * every flash literal carried in a REF[...=value] annotation
  * the 14-row dispatch table, 14 version strings, the loop bound, the
    pre-divider tables, the USART divisor table, channel masks and pointers
  * key instruction anchors for 0800cf10 / 0800e8b4 / 08008174 / the setters
  * raw Thumb-1 halfwords for the two setters with no decoded function body
  * negative checks: four "consumer" addresses are literal-pool slots, not code

Outputs BYTE_VALIDATION.json. Never executes firmware, never mutates the
Ghidra project, never contacts a device, account or network.

Usage:
  python3 scripts/verify_snapshot_bytes.py
"""
from __future__ import annotations

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
SHA256 = '51531576fd31af96f7239b71d26e1f175815f5cb21dbe9ab305fa9a33cc6a891'
DATE = '2026-11-08'

DISPATCH_VA = 0x08025da4
STRINGS_VA = 0x08024234
DIVISOR_VA = 0x0802420c
AHB_TABLE_VA = 0x080241cc
APB_TABLE_VA = 0x080241ac
MASK_TABLE_VA = 0x08025ec0
CHANNEL_TABLE_VAS = (0x08025ee8, 0x08025ef0, 0x08025ef8,
                     0x08025f00, 0x08025f08)
TAIL_VA = 0x08025f28
LOOP_CMP_VA = 0x0801d8cc

VERSION_STRINGS = ['I00', 'I05', 'J00', 'K00', 'K10', 'K05', 'K30', 'K33',
                   'K34', 'K35', 'K36', 'K37', 'K87', 'K90']
THRESHOLDS = [0x0000, 0x0805, 0x0900, 0x0A00, 0x0A05, 0x0A10, 0x0A30,
              0x0A33, 0x0A34, 0x0A35, 0x0A36, 0x0A37, 0x0A87, 0x0A90]
CALLEES = [0x0800f58d, 0x0800f719, 0x0800f761, 0x0800f969, 0x0800fafd,
           0x0800fae1, 0x0800fc05, 0x0800fc65, 0x0800fc99, 0x0800fcc1,
           0x0800fce1, 0x0800fd0d, 0x0800fd25, 0x0800fd31]

# setter target -> (slot0 store address, literal-pool address, string index)
SLOT0 = [
    ('0800f58d', 0x0800f590, 0x0800f694, 0),
    ('0800f719', 0x0800f71a, 0x0800f734, 1),
    ('0800f761', 0x0800f764, 0x0800f784, 2),
    ('0800f969', 0x0800f96e, 0x0800fa5c, 3),
    ('0800fafd', 0x0800fb02, 0x0800fb70, 5),
    ('0800fae1', 0x0800faea, 0x0800faf4, 4),
    ('0800fc05', 0x0800fc0a, 0x0800fc40, 6),
    ('0800fc65', 0x0800fc6e, 0x0800fc84, 7),
    ('0800fc99', 0x0800fc9a, 0x0800fcb0, 8),
    ('0800fcc1', 0x0800fcc8, 0x0800fcd4, 9),
    ('0800fce1', 0x0800fce2, 0x0800fcf8, 10),
    ('0800fd0d', 0x0800fd12, 0x0800fd1c, 11),
    ('0800fd25', None, 0x0800fd2c, 12),
    ('0800fd31', None, 0x0800fd40, 13),
]

# Exact bytes of the two setters that the retained project never disassembled.
RAW_THUMB16 = {
    0x0800fd24: ('014b03607047c046',
                 ['ldr r3,[pc,#0x4]', 'str r3,[r0,#0x0]', 'bx lr']),
    0x0800fd30: ('034b00220360c6235b00c2547047c046',
                 ['ldr r3,[pc,#0xc]', 'movs r2,#0x0', 'str r3,[r0,#0x0]',
                  'movs r3,#0xc6', 'lsls r3,r3,#0x1',
                  'strb r2,[r0,r3]', 'bx lr']),
}

# Anchors taken from pass1 / pass3 exports: (address, exact mnemonic prefix).
KEY_INSNS = [
    # 0800cf10: the APB / peripheral clock selector (missing consumer #1).
    (0x0800cf10, 'ldr r3,[0x0800cf2c]'),
    (0x0800cf14, 'ldr r3,[r3,#0x8]'),
    (0x0800cf18, 'lsls r3,r3,#0x11'),
    (0x0800cf1a, 'lsrs r3,r3,#0x1d'),
    (0x0800cf1c, 'lsls r3,r3,#0x2'),
    (0x0800cf1e, 'ldr r3,[r3,r1]'),
    (0x0800cf20, 'movs r1,#0x1f'),
    (0x0800cf22, 'ldr r0,[r2,#0x0]'),
    (0x0800cf24, 'ands r3,r1'),
    (0x0800cf26, 'lsrs r0,r3'),
    # 0800e8b4: USART clock-source selection and BRR paths.
    (0x0800e8c8, 'ldr r5,[0x0800ea28]'),
    (0x0800e976, 'bl 0x08008174'),
    (0x0800e982, 'bl 0x08008174'),
    (0x0800e9e4, 'bl 0x08008174'),
    (0x0800e9f2, 'bl 0x08008174'),
    (0x0800ea18, 'cmp r0,#0x0'),
    # 08008174: unsigned division helper entry / tail / divide-by-zero path.
    (0x08008174, 'movs r2,#0x0'),
    (0x08008176, 'lsrs r3,r0,#0x1'),
    (0x080081ba, 'adcs r2,r2'),
    (0x08008266, 'subs r1,r0,r1'),
    (0x08008268, 'bcs 0x0800826c'),
    (0x0800826a, 'mov r1,r0'),
    (0x0800826c, 'adcs r2,r2'),
    (0x0800826e, 'mov r0,r2'),
    (0x08008270, 'bx lr'),
    (0x08008274, 'push {r0,lr}'),
    (0x08008278, 'bl 0x0800845c'),
    (0x0800827c, 'pop {r1,pc}'),
    (0x0800845c, 'bx lr'),
    # K34 conditional +0x1a4 load, K35 backup, K37/K90 high slots.
    (0x0800fca2, 'cmp r2,#0x4'),
    (0x0800fca4, 'bne 0x0800fca8'),
    (0x0800fca6, 'ldr r3,[0x0800fcbc]'),
    (0x0800fcac, 'str r3,[r0,r2]'),
    (0x0800fccc, 'str r1,[r3,#0x0]'),
    (0x0800fcd0, 'str r3,[r0,r2]'),
    (0x0800fd16, 'str r3,[r0,r2]'),
    (0x0800fd44, 'ldr r3,[r0,#0x0]'),
    (0x0800fae4, 'bl 0x0800f968'),
    (0x0800fc68, 'bl 0x0800fafc'),
    # literal-pool readers around the four mis-classified "consumers".
    (0x0800fdaa, 'ldr r0,[0x0800fdc0]'),
    (0x08012aec, 'bl 0x080110f6'),
    (0x080110f8, 'movs r0,#0x0'),
    (0x080110fa, 'bl 0x0801fdd0'),
    (0x0801fdd2, 'muls r2,r0'),
]

# Four addresses previously listed as "unexported consumers". They are in fact
# literal-pool slots holding table pointers; the readers are nearby code.
LITERAL_SLOTS = {
    0x0800fbcc: (0x08025ed0, '0800fbc0'),
    0x0800fdc0: (0x08025ec0, '0800fdaa'),
    0x080125a4: (0x08025ec0, '08012538'),
    0x08012cf0: (0x08025f28, '08012b5e'),
}


def rd(data, va, n):
    return data[va - BASE:va - BASE + n]


def u32(data, va):
    return struct.unpack_from('<I', data, va - BASE)[0]


def u16(data, va):
    return struct.unpack_from('<H', data, va - BASE)[0]


def load_image():
    data = BBIN.read_bytes()
    assert len(data) == 132896, 'frozen BBIN size mismatch'
    assert hashlib.sha256(data).hexdigest() == SHA256, 'frozen BBIN SHA256 mismatch'
    return data


def parse_export(path: Path):
    rows, target_line, refs_to, header = [], '', [], {}
    for line in path.read_text(errors='replace').splitlines():
        if line.startswith('TARGET '):
            target_line = line
        elif line.startswith('REF_TO '):
            refs_to.append(line)
        elif line.startswith('RANGE ') or line.startswith('NAME ') or \
             line.startswith('EXECUTABLE_SHA256 '):
            header[line.split(' ', 1)[0]] = line
        m = re.match(r'INSN ([0-9a-f]{8}) ([0-9a-f]+) (.*)', line)
        if m:
            asm = m[3]
            refs = re.findall(r'REF\[([^\]]+)\]', asm)
            body = asm.split(' REF[', 1)[0].strip()
            rows.append((int(m[1], 16), m[2], body, refs))
    return dict(name=path.name, target=target_line, refs_to=refs_to,
                header=header, rows=rows)


def decode_thumb16(h: int) -> str:
    """Minimal Thumb-1 decoder covering only the forms used by K87 / K90."""
    if h & 0xf800 == 0x4800:
        return f'ldr r{(h >> 8) & 7},[pc,#0x{(h & 0xff) * 4:x}]'
    if h & 0xf800 == 0x2000:
        return f'movs r{(h >> 8) & 7},#0x{h & 0xff:x}'
    if h & 0xf800 == 0x0000 and (h >> 6) & 0x1f:
        return f'lsls r{h & 7},r{(h >> 3) & 7},#0x{(h >> 6) & 0x1f:x}'
    if h & 0xf000 == 0x6000 and not (h & 0x0800):
        return f'str r{h & 7},[r{(h >> 3) & 7},#0x{((h >> 6) & 0x1f) * 4:x}]'
    if h & 0xf000 == 0x5000 and (h >> 9) & 7 == 2:   # STRB (register)
        return f'strb r{h & 7},[r{(h >> 3) & 7},r{(h >> 6) & 7}]'
    if h == 0x4770:
        return 'bx lr'
    if h == 0x46c0:
        return 'nop'
    return f'UNDECODED_{h:04x}'


def main():
    data = load_image()
    checks, failures = [], []

    def check(kind, name, got, expected):
        ok = got == expected
        item = dict(kind=kind, name=name, got=str(got), expected=str(expected),
                    status='PASS' if ok else 'FAIL')
        checks.append(item)
        if not ok:
            failures.append(item)

    check('image', 'sha256', hashlib.sha256(data).hexdigest(), SHA256)
    check('image', 'bytes', len(data), 132896)

    exports = []
    for sub in ('pass1', 'pass2', 'pass3'):
        d = TOOL / sub
        for p in sorted(d.glob('*.txt')):
            if p.name == 'program.txt':
                continue
            exports.append(parse_export(p))
            # program.txt of each pass carries the executable SHA256
            prog = d / 'program.txt'
            if prog.exists():
                sha_line = [x for x in prog.read_text().splitlines()
                            if x.startswith('EXECUTABLE_SHA256 ')]
                if sha_line:
                    check('program', f'{sub}/program.txt sha256',
                          sha_line[0].split(' ', 1)[1].strip(), SHA256)

    insn_rows = 0
    flash_literals = 0
    insn_index = {}
    for ex in exports:
        for addr, hexs, body, refs in ex['rows']:
            insn_rows += 1
            raw = bytes.fromhex(hexs)
            check('insn_bytes', f"{ex['name']}:{addr:08x}", rd(data, addr, len(raw)).hex(),
                  raw.hex())
            insn_index.setdefault(addr, (body, ex['name']))
            for ref in refs:
                m = re.match(r'(READ|DATA|WRITE|PARAM):([0-9a-f]{8})=([0-9a-f]+)', ref)
                if not m:
                    continue
                rva, val = int(m[2], 16), int(m[3], 16)
                if BASE <= rva < BASE + len(data) and rva + 4 <= BASE + len(data):
                    flash_literals += 1
                    check('flash_literal', f"{ex['name']}:{addr:08x}:{rva:08x}",
                          u32(data, rva), val)

    # In-image tables.
    for i, (t, c) in enumerate(zip(THRESHOLDS, CALLEES)):
        off = DISPATCH_VA + i * 8
        check('dispatch', f'row{i}_threshold', u16(data, off), t)
        check('dispatch', f'row{i}_pad', u16(data, off + 2), 0)
        check('dispatch', f'row{i}_callee', u32(data, off + 4), c)
    for i, s in enumerate(VERSION_STRINGS):
        check('strings', f'idx{i}', rd(data, STRINGS_VA + i * 4, 4).hex(),
              (s.encode() + b'\x00').hex())
    check('loop', '0801d8cc cmp r5,#0xe', rd(data, LOOP_CMP_VA, 2).hex(), '0e2d')

    divisors = [u16(data, DIVISOR_VA + i * 2) for i in range(16)]
    for i, v in enumerate(divisors):
        check('divisor_table', f'idx{i}', v,
              [1, 2, 4, 6, 8, 10, 12, 16, 32, 64, 128, 256,
               0x408, 0x402, 0x108, 0x101][i])
    ahb = [u32(data, AHB_TABLE_VA + i * 4) for i in range(16)]
    for i, v in enumerate(ahb):
        check('ahb_prescaler_table', f'idx{i}', v,
              [0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 3, 4, 6, 7, 8, 9][i])
    apb = [u32(data, APB_TABLE_VA + i * 4) for i in range(8)]
    for i, v in enumerate(apb):
        check('apb_prescaler_table', f'idx{i}', v, [0, 0, 0, 0, 1, 2, 3, 4][i])
    for i, va in enumerate(CHANNEL_TABLE_VAS):
        expect = {0x08025ee8: [3, 2, 1, 0, 4, 5, 6, 7],
                  0x08025ef0: [0, 1, 2, 4, 3, 5, 6, 7],
                  0x08025ef8: [3, 2, 1, 0, 4, 5, 6, 7],
                  0x08025f00: [3, 2, 1, 0, 4, 5, 6, 7],
                  0x08025f08: [2, 1, 0, 4, 3, 5, 6, 7]}[va]
        check('channel_table', f'{va:08x}', list(rd(data, va, 8)), expect)
    check('mask_table', '08025ec0', [u32(data, MASK_TABLE_VA + i * 4) for i in range(4)],
          [1, 2, 4, 8])
    check('tail_array', '08025f28', list(rd(data, TAIL_VA, 8)), [2, 0, 1, 3, 2, 1, 0, 0])

    for va, (pointer, reader) in LITERAL_SLOTS.items():
        check('literal_slot', f'{va:08x}', u32(data, va), pointer)
        # Negative check: no export declares a function at the literal address.
        decl = [ex['target'] for ex in exports
                if ex['name'].startswith(f'{va:08x}')]
        check('negative', f'{va:08x}_has_no_function_body',
              any('function=none' in x for x in decl), True)
        check('negative', f'{va:08x}_is_read_by_{reader}',
              any(r.startswith(f'REF_TO {reader} READ') for ex in exports
                  for r in ex['refs_to']), True)

    # setter slot0 literal pointers must point at the expected version string
    for name, store, lit, si in SLOT0:
        check('slot0_literal', name, u32(data, lit), STRINGS_VA + si * 4)
        if store is not None:
            body = insn_index.get(store, ('', ''))[0]
            # K10 / K33 preserve the config pointer in r4 before the inline BL.
            check('slot0_store', name,
                  body.startswith('str r3,[r0,#0x0]') or
                  body.startswith('str r3,[r4,#0x0]'), True)

    # Raw Thumb-1 setters.
    for va, (hexs, mnemonics) in RAW_THUMB16.items():
        raw = rd(data, va, len(hexs) // 2)
        check('raw_thumb16', f'{va:08x}_bytes', raw.hex(), hexs)
        halves = [struct.unpack_from('<H', raw, i)[0]
                  for i in range(0, len(mnemonics) * 2, 2)]
        for j, (h, want) in enumerate(zip(halves, mnemonics)):
            check('raw_thumb16', f'{va:08x}+{j * 2}_mnemonic',
                  decode_thumb16(h), want)

    # Key instruction anchors.
    for addr, want in KEY_INSNS:
        body = insn_index.get(addr, ('', ''))[0]
        check('key_insn', f'{addr:08x}', body.startswith(want), True)

    # The four u32 divisors and the two prescaler tables are distinct regions.
    check('negative', 'tables_do_not_overlap',
          APB_TABLE_VA + 32 <= AHB_TABLE_VA and AHB_TABLE_VA + 64 <= DIVISOR_VA,
          True)
    check('negative', 'divisor_table_precedes_strings',
          DIVISOR_VA + 32 <= STRINGS_VA, True)

    totals = dict(
        instruction_rows=insn_rows,
        instruction_files=sum(1 for ex in exports if ex['rows']),
        instruction_rows_per_file={ex['name']: len(ex['rows']) for ex in exports},
        flash_literal_annotations=flash_literals,
        dispatch_rows=len(THRESHOLDS),
        divisor_table_entries=len(divisors),
        ahb_prescaler_entries=len(ahb),
        apb_prescaler_entries=len(apb),
        channel_maps=len(CHANNEL_TABLE_VAS),
        literal_slot_corrections=len(LITERAL_SLOTS),
        key_instruction_anchors=len(KEY_INSNS),
        raw_thumb16_instructions=sum(len(v[1]) for v in RAW_THUMB16.values()),
        total_checks=len(checks),
        failures=len(failures),
    )
    out = dict(
        schema='eightsleep.nonusb.config-snapshot-byte-validation.v1',
        date=DATE,
        status='PASS' if not failures else 'FAIL',
        source=dict(
            bbin='materials/eightsleep-full-evidence-20261107/firmware/mtk/'
                 'rootfs/files/opt/eight/lib/subsystem_updates/firmware-sensor-g0.bbin',
            bytes=len(data), sha256=SHA256,
            va_to_file_offset='offset = VA - 0x08008000',
            export_passes=['pass1', 'pass2', 'pass3']),
        method='read-only byte comparison against the frozen BBIN and retained '
               'Ghidra -readOnly -noanalysis exports',
        totals=totals,
        checks=checks,
        failures=failures,
        limits=[
            'All clock values are software fields; no hardware measurement is claimed.',
            'The four literal-pool slots are data, not callable consumers.',
            'Runtime RCC register contents, sku and devicesn are not in the image.',
        ],
        executes_firmware=False,
    )
    (TOOL / 'BYTE_VALIDATION.json').write_text(
        json.dumps(out, ensure_ascii=False, indent=1, sort_keys=True) + '\n')
    print(json.dumps(dict(status=out['status'], totals=totals,
                          first_failures=failures[:8]), indent=1))
    return 0 if not failures else 1


if __name__ == '__main__':
    raise SystemExit(main())
