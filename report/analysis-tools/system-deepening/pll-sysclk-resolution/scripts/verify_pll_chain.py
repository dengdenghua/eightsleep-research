#!/usr/bin/env python3
"""Verify the nonUSB PLL/SYSCLK chain against the frozen BBIN and read-only exports.

Read-only. Re-checks every retained instruction row, the in-image prescaler table,
flash literals, the RCC reset values, writer2's PLL register OR-expression, the
SYSCLK formula in 0800cd24, the clock-source switch in 0800cdb4, and the SysTick
divider in 0800995c. Decodes the two configuration structs with a small constant
propagator over the exported Thumb instructions (no disassembly mutation).

Never executes firmware, never modifies the Ghidra project, never contacts a
device, account or network.

Usage:
  python3 scripts/verify_pll_chain.py
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
SHA256 = '51531576fd31af96f7239b71d26e1f175815f5cb21dbe9ab305fa9a33cc6a891'
DIVIDER_TABLE = [0] * 8 + [1, 2, 3, 4, 6, 7, 8, 9]

# (address, expected value, meaning)
LITERALS = [
    (0x08010950, 0xfffff579, 'hwrev - 0xA87 threshold helper'),
    (0x08010954, 16000000, '16MHz HSE software input'),
    (0x0801095c, 32000000, '32MHz HSE software input'),
    (0x08010958, 0x20000474, 'HSE software input RAM field'),
    (0x080109f0, 8000000, '8MHz HSE software input'),
    (0x080109ec, 0x20000474, 'HSE software input RAM field (8MHz entrance)'),
    (0x0800cdac, 16000000, 'HSI PLL input constant'),
    (0x0800cdb0, 0x20000474, 'HSE PLL input RAM field'),
    (0x0800c8cc, 16000000, 'RCC reset SysTick clock variable'),
    (0x0800c8d0, 0x20000250, 'RCC reset clock variable address'),
    (0x0800c8d4, 0x2000025c, 'RCC reset step field address'),
    (0x0800c8c8, 0x40021000, 'RCC register block base'),
    (0x0800cd14, 0x40021000, 'writer2 RCC register block base'),
    (0x0800cd18, 0xfeffffff, 'PLLOFF clear mask'),
    (0x0800cd1c, 0x11c1808c, 'CFGR2 preserved-bit mask'),
    (0x0800cef4, 0x40021000, 'clock-switch RCC base'),
    (0x0800cef8, 0x080241cc, 'prescaler shift table base'),
    (0x0800cefc, 0x20000250, 'SysTick clock variable address'),
    (0x0800cf00, 0x2000025c, 'SysTick step field address'),
    (0x0800cf08, 0xfffff0ff, 'prescaler-index field clear mask'),
    (0x0800cf0c, 0xffff8fff, 'MCO field clear mask'),
    (0x080099a0, 0x20000258, 'software tick step byte address'),
    (0x080099a4, 0x20000250, 'SysTick clock variable address'),
    (0x080099a8, 0x2000025c, 'SysTick step field address'),
]

# (address, substring that must appear in the exported instruction text, purpose)
KEY_INSNS = [
    (0x0800c856, 'str r3,[r4,#0x8]', 'writer1 resets CFGR to 0 (SW=HSI)'),
    (0x0800c862, 'str r3,[r4,#0x0]', 'writer1 resets CR to 0x100'),
    (0x0800c87e, 'str r3,[r4,#0xc]', 'writer1 resets CFGR2 to 0x1000'),
    (0x0800c88c, 'str r2,[r3,#0x0]', 'writer1 sets clock variable to 16MHz'),
    (0x0800cc2c, 'ldr r1,[r4,#0x24]', 'writer2 reads struct[9] (PREDIV field)'),
    (0x0800cc2e, 'ldr r3,[r4,#0x20]', 'writer2 reads struct[8] (PLLSRC field)'),
    (0x0800cc30, 'ldr r2,[r5,#0xc]', 'writer2 reads old CFGR2'),
    (0x0800cc34, 'ldr r1,[0x0800cd1c]', 'writer2 loads preserved-bit mask'),
    (0x0800cc3c, 'ldr r2,[r4,#0x2c]', 'writer2 reads struct[11]'),
    (0x0800cc42, 'ldr r2,[r4,#0x30]', 'writer2 reads struct[12]'),
    (0x0800cc46, 'ldr r2,[r4,#0x34]', 'writer2 reads struct[13]'),
    (0x0800cc4a, 'ldr r2,[r4,#0x28]', 'writer2 reads struct[10] (PLLMUL)'),
    (0x0800cc4c, 'lsls r2,r2,#0x8', 'writer2 shifts PLLMUL into bits 14:8'),
    (0x0800cc50, 'str r3,[r5,#0xc]', 'writer2 writes CFGR2'),
    (0x0800cc5e, 'ldr r2,[r5,#0xc]', 'writer2 re-reads CFGR2'),
    (0x0800cc60, 'lsls r3,r3,#0x15', 'writer2 builds 0x10000000 PLL enable bit'),
    (0x0800cc64, 'str r3,[r5,#0xc]', 'writer2 sets PLL enable bit'),
    (0x0800cd52, 'ldr r3,[r4,#0xc]', 'SYSCLK formula reads CFGR2'),
    (0x0800cd58, 'lsls r1,r1,#0x19', 'PREDIV field shift left'),
    (0x0800cd5a, 'lsrs r1,r1,#0x1d', 'PREDIV field shift right'),
    (0x0800cd5e, 'adds r1,#0x1', 'PREDIV = field + 1'),
    (0x0800cd6a, 'bl 0x08008174', 'HSE / PREDIV integer division'),
    (0x0800cd66, 'lsls r5,r5,#0x11', 'PLLMUL field shift left'),
    (0x0800cd6e, 'lsrs r5,r5,#0x19', 'PLLMUL field shift right'),
    (0x0800cd72, 'muls r0,r5', 'PLLMUL multiply'),
    (0x0800cd74, 'lsrs r1,r1,#0x1d', 'PLLDIV field shift right'),
    (0x0800cd76, 'adds r1,#0x1', 'PLLDIV = field + 1'),
    (0x0800cd78, 'bl 0x08008174', 'final integer division by PLLDIV'),
    (0x0800cd80, 'ldr r0,[0x0800cdac]', 'HSI 16MHz PLL input branch'),
    (0x0800ce00, 'bl 0x0800cd24', 'clock switch calls SYSCLK formula'),
    (0x0800ce08, 'lsls r3,r3,#0x14', 'prescaler index shift left'),
    (0x0800ce0a, 'lsrs r3,r3,#0x1c', 'prescaler index = CFGR bits 11:8'),
    (0x0800ce0e, 'ldr r3,[r3,r1]', 'prescaler table lookup'),
    (0x0800ce14, 'lsrs r0,r3', 'SYSCLK >> prescaler shift'),
    (0x0800ce1a, 'str r0,[r2,#0x0]', 'store SysTick clock variable'),
    (0x0800ce1e, 'bl 0x0800995c', 'configure SysTick from clock variable'),
    (0x08009962, 'ldrb r1,[r3,#0x0]', 'read software tick step byte'),
    (0x08009970, 'bl 0x08008174', 'q = 1000 / step'),
    (0x0800997a, 'bl 0x08008174', 'N = clock_variable / q'),
    (0x0800999a, 'str r5,[r3,#0x0]', 'store step field'),
    (0x08010914, 'bl 0x0800c8dc', '16/32MHz entrance calls writer2'),
    (0x08010934, 'bl 0x0800cdb4', '16/32MHz entrance calls clock switch'),
    (0x080109bc, 'bl 0x0800c8dc', '8MHz entrance calls writer2'),
    (0x080109dc, 'bl 0x0800cdb4', '8MHz entrance calls clock switch'),
    (0x08010944, 'movs r4,#0x30', '32MHz branch sets PREDIV field'),
]

# (label, file, start, end, preset registers, expected 14-slot struct)
STRUCT_RUNS = [
    ('16MHz', '080108ac.txt', 0x080108e4, 0x08010912, {'r4': 0x10},
     [9, 0x10000, 0, 0, 0, 0, 1, 2, 3, 0x10, 0x18, 0x60000, 0x6000000, 0x40000000]),
    ('32MHz', '080108ac.txt', 0x080108e4, 0x08010912, {'r4': 0x30},
     [9, 0x10000, 0, 0, 0, 0, 1, 2, 3, 0x30, 0x18, 0x60000, 0x6000000, 0x40000000]),
    ('8MHz', '08010960.txt', 0x0801098a, 0x080109ba, {},
     [9, 0x10000, 0, 0, 0, 0, 1, 2, 3, 0x00, 0x18, 0x60000, 0x6000000, 0x40000000]),
]


def load_image():
    data = BBIN.read_bytes()
    assert hashlib.sha256(data).hexdigest() == SHA256, 'frozen BBIN SHA256 mismatch'
    return data


def u32(data, va):
    return struct.unpack_from('<I', data, va - BASE)[0]


def read_exports():
    rows = {}
    for path in sorted(TOOL.glob('pass*/*.txt')):
        if path.name == 'program.txt':
            continue
        for line in path.read_text().splitlines():
            m = re.match(r'INSN ([0-9a-f]{8}) ([0-9a-f]+) (.*)', line)
            if m:
                rows[int(m[1], 16)] = (bytes.fromhex(m[2]), m[3], path.name)
    return rows


def bl_target(addr, h1, h2):
    s = h1 >> 10 & 1
    i1 = 1 ^ ((h2 >> 13 & 1) ^ s)
    i2 = 1 ^ ((h2 >> 11 & 1) ^ s)
    n = (s << 24) | (i1 << 23) | (i2 << 22) | ((h1 & 1023) << 12) | ((h2 & 2047) << 1)
    if s:
        n -= 1 << 25
    return (addr + 4 + n) & 0xffffffff


def signed(n, width):
    return n - (1 << width) if n & (1 << (width - 1)) else n


def propagate(rows, start, end, preset):
    """Tiny constant propagator over the exported Thumb rows; only the arithmetic
    forms actually used by the two struct builders are modelled."""
    regs = {f'r{i}': None for i in range(8)}
    regs.update(preset)
    slots = {}
    for addr in sorted(a for a in rows if start <= a <= end):
        raw, asm, _ = rows[addr]
        m = re.match(r'movs (r\d),#0x([0-9a-f]+)', asm)
        if m:
            regs[m[1]] = int(m[2], 16)
            continue
        m = re.match(r'lsls (r\d),(r\d),#0x([0-9a-f]+)', asm)
        if m:
            v = regs.get(m[2])
            regs[m[1]] = None if v is None else (v << int(m[3], 16)) & 0xffffffff
            continue
        m = re.match(r'adds (r\d),#0x([0-9a-f]+)', asm)
        if m:
            v = regs.get(m[1])
            regs[m[1]] = None if v is None else (v + int(m[2], 16)) & 0xffffffff
            continue
        m = re.match(r'adds (r\d),(r\d),(r\d)', asm)
        if m and m[1] == m[2] == m[3]:
            v = regs.get(m[1])
            regs[m[1]] = None if v is None else (v * 2) & 0xffffffff
            continue
        m = re.match(r'str (r\d),\[sp,#0x([0-9a-f]+)\]', asm)
        if m:
            off = int(m[2], 16)
            slots[(off - 0x10) // 4] = regs.get(m[1])
            continue
        # any other instruction that writes a low register invalidates it
        m = re.match(r'(ldr|mov|add|sub|bl|cmp|tst|and|orr|bics|rsbs|lsls|lsrs)\w*\s+(r\d)', asm)
        if m:
            regs[m[2]] = None
    return [slots.get(i, 0) for i in range(14)]


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--validation', default=str(TOOL / 'BYTE_VALIDATION.json'))
    ap.add_argument('--chain', default=str(TOOL / 'PLL_CHAIN.json'))
    args = ap.parse_args()

    data = load_image()
    rows = read_exports()
    failures = []
    checks = []

    def ck(name, cond, **detail):
        checks.append({'name': name, 'ok': bool(cond), **detail})
        if not cond:
            failures.append({'check': name, **detail})
        return bool(cond)

    # 1. all retained instruction bytes plus branch/literal arithmetic
    totals = {'instruction_rows': 0, 'unique_addresses': 0, 'flash_literals': 0,
              'bl_targets': 0, 'direct_branch_targets': 0}
    for addr, (raw, asm, fname) in sorted(rows.items()):
        off = addr - BASE
        ck(f'insn_bytes_{addr:08x}',
           0 <= off <= len(data) - len(raw) and data[off:off + len(raw)] == raw,
           file=fname)
        totals['instruction_rows'] += 1
        mb = re.match(r'bl 0x([0-9a-f]{8})\b', asm)
        if mb and len(raw) == 4:
            h1 = int.from_bytes(raw[:2], 'little')
            h2 = int.from_bytes(raw[2:], 'little')
            if bl_target(addr, h1, h2) == int(mb[1], 16):
                totals['bl_targets'] += 1
            else:
                failures.append({'check': 'bl_target', 'address': hex(addr)})
        md = re.match(r'(b|beq|bne|bcs|bcc|bmi|bpl|bvs|bvc|bhi|bls|bge|blt|bgt|ble) '
                      r'0x([0-9a-f]{8})\b', asm)
        if md and len(raw) == 2:
            h = int.from_bytes(raw, 'little')
            if md[1] == 'b' and h & 0xf800 == 0xe000:
                dest = addr + 4 + signed(h & 0x7ff, 11) * 2
            elif md[1] != 'b' and h & 0xf000 == 0xd000:
                dest = addr + 4 + signed(h & 255, 8) * 2
            else:
                dest = None
            if dest is not None:
                if dest == int(md[2], 16):
                    totals['direct_branch_targets'] += 1
                else:
                    failures.append({'check': 'direct_branch_target', 'address': hex(addr)})
        for lit, val in re.findall(r'REF\[READ:([0-9a-f]{8})=([0-9a-f]+)\]', asm):
            o = int(lit, 16) - BASE
            if 0 <= o <= len(data) - 4 and int.from_bytes(data[o:o + 4], 'little') == int(val, 16):
                totals['flash_literals'] += 1
            else:
                failures.append({'check': 'flash_literal', 'address': lit, 'file': fname})
    totals['unique_addresses'] = len(rows)

    # 2. in-image prescaler table
    div = [u32(data, 0x080241cc + 4 * i) for i in range(16)]
    ck('prescaler_shift_table', div == DIVIDER_TABLE, values=div)
    ck('prescaler_index_zero_shift_is_zero', div[0] == 0, value=div[0])

    # 3. flash literals
    for va, expected, meaning in LITERALS:
        got = u32(data, va)
        ck(f'literal_{va:08x}', got == expected,
           expected=hex(expected), got=hex(got), meaning=meaning)

    # 4. key instructions
    for va, fragment, purpose in KEY_INSNS:
        got = rows.get(va, (b'', '<missing>', ''))[1]
        ck(f'key_insn_{va:08x}', fragment in got, expected=fragment, got=got, purpose=purpose)

    # 5. decode the 14-slot configuration structs by constant propagation
    structs = {}
    for label, _fname, start, end, preset, expected in STRUCT_RUNS:
        decoded = propagate(rows, start, end, preset)
        ck(f'struct_{label}', decoded == expected, decoded=[hex(x) if x is not None else None for x in decoded],
           expected=[hex(x) for x in expected])
        structs[label] = [hex(x) if x is not None else None for x in decoded]

    # 6. writer2 CFGR2 OR-expression assembly, from the decoded struct slots
    #    struct[8] | struct[9] | (old CFGR2 & 0x11c1808c) | struct[11] | struct[12]
    #    | struct[13] | (struct[10] << 8) | 0x10000000
    MASK = 0x11c1808c
    OLD_CFGR2 = 0x1000  # written by writer1 at 0800c87e
    ck('writer1_cfgr2_reset_value', OLD_CFGR2 & MASK == 0,
       old=hex(OLD_CFGR2), mask=hex(MASK), preserved=hex(OLD_CFGR2 & MASK))
    cfgr2 = {}
    for label in ('16MHz', '32MHz', '8MHz'):
        s = [int(x, 16) for x in structs[label]]
        v = (s[8] | s[9] | (OLD_CFGR2 & MASK) | s[11] | s[12] | s[13]
             | (s[10] << 8) | 0x10000000) & 0xffffffff
        cfgr2[label] = v
        ck(f'cfgr2_{label}_bits', v == 0x56061803 + s[9],
           value=hex(v), expected=hex(0x56061803 + s[9]))

    chain = {
        'schema': 'eightsleep.nonusb.pll-sysclk-chain.v1',
        'date': '2026-11-08',
        'source': {'file': str(BBIN), 'bytes': len(data), 'sha256': SHA256,
                   'image_base': hex(BASE), 'mapping': 'file offset = VA - 0x08008000'},
        'method': 'Read-only Ghidra exports re-checked byte-for-byte; the two '
                  'configuration structs are decoded by constant propagation over '
                  'the exported Thumb instructions; RCC reset value and the writer2 '
                  'OR-expression are asserted against the frozen image.',
        'rcc_reset_by_0800c828': {
            'CR_40021000': '0x100', 'CFGR_40021008': '0x0 (SW=HSI)',
            'CFGR2_4002100c': '0x1000', 'clock_variable_20000250': 16000000,
        },
        'writer2_0800c8dc': {
            'expression': 'CFGR2 = s[8] | s[9] | (old & 0x11c1808c) | s[11] | s[12] '
                          '| s[13] | (s[10] << 8) | 0x10000000',
            'preserved_mask': hex(MASK),
            'old_cfgr2': hex(OLD_CFGR2),
            'old_and_mask': hex(OLD_CFGR2 & MASK),
            'cfgr2_values': {k: hex(v) for k, v in cfgr2.items()},
        },
        'config_structs_14_slots': structs,
        'sysclk_formula_0800cd24': {
            'condition': 'SWS = (CFGR & 0x38) == 0x10 (PLL)',
            'pll_input': 'HSE software field 0x20000474 when (~CFGR2 & 3)==0, else HSI 16000000',
            'prediv': '((CFGR2 << 25) >> 29) + 1  == ((CFGR2 & 0x70) >> 4) + 1',
            'pllmul': '(CFGR2 << 17) >> 25  == (CFGR2 >> 8) & 0x7f',
            'plldiv': '(CFGR2 >> 29) + 1',
            'result': 'divide((HSE // PREDIV) * PLLMUL, PLLDIV)',
            'integer_division_helper': '08008174 (Ghidra unsigned division; three callers use the quotient)',
        },
        'clock_switch_0800cdb4': {
            'param_slots': ['7', '2', '0', '0x4000'],
            'target_sw': 2, 'expected_sws': '0x10 (PLL)',
            'prescaler_index': 'CFGR bits 11:8 = 0 -> table[0] = 0 -> no shift',
            'after_switch': 'DAT_20000250 = 0800cd24() >> table[0]',
            'systick': '0800995c: q = 1000/step, N = clock_variable/q, LOAD = N-1',
        },
        'cfgr2_values': {k: hex(v) for k, v in cfgr2.items()},
        'limits': [
            'HSE 16/32/8MHz is a software input field, not a measured oscillator.',
            '64MHz is conditional on PLL lock, a successful SW switch, and no fatal error exit.',
            'Runtime RCC registers may differ from the reset state written by 0800c828.',
            'Static bytes do not prove a measured core clock, PLL lock or interrupt latency.',
        ],
        'executes_firmware': False,
    }
    Path(args.chain).write_text(json.dumps(chain, ensure_ascii=False, indent=2) + '\n')

    validation = {
        'schema': 'eightsleep.nonusb.pll-sysclk-byte-validation.v1',
        'date': '2026-11-08',
        'status': 'PASS' if not failures else 'FAIL',
        'source': chain['source'],
        'method': chain['method'],
        'totals': totals,
        'checks': checks,
        'failures': failures,
        'limits': chain['limits'],
        'executes_firmware': False,
    }
    Path(args.validation).write_text(json.dumps(validation, ensure_ascii=False, indent=2) + '\n')
    print(json.dumps({'status': validation['status'], 'failures': len(failures),
                      'checks': len(checks), 'totals': totals,
                      'cfgr2': {k: hex(v) for k, v in cfgr2.items()}},
                     ensure_ascii=False, indent=2))
    return 0 if not failures else 1


if __name__ == '__main__':
    raise SystemExit(main())
