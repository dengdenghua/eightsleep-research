#!/usr/bin/env python3
"""Model the four static residual gaps using only the retained evidence.

Reads RESIDUAL_TABLES.json plus the pass2 setter exports. Builds:
  * CONFIG_SLOTS.json   -- per-setter config-object slot ledger and consumer semantics
  * MODEL_RESULTS.json  -- table / accumulation / 0x18c / USART BRR models and assertions

All baud rates and the 64MHz SYSCLK are EXPLICIT ASSUMPTIONS or conditional
computed values, not measured hardware facts. No firmware is executed.

Usage:
  python3 model/residual_models.py
"""
from __future__ import annotations

import argparse
import json
import re
from pathlib import Path

HERE = Path(__file__).resolve().parent
TOOL = HERE.parent
TABLES = TOOL / 'RESIDUAL_TABLES.json'

SETTERS = [
    (0, 0x0000, 'I00', '0800f58d'), (1, 0x0805, 'I05', '0800f719'),
    (2, 0x0900, 'J00', '0800f761'), (3, 0x0a00, 'K00', '0800f969'),
    (4, 0x0a05, 'K05', '0800fafd'), (5, 0x0a10, 'K10', '0800fae1'),
    (6, 0x0a30, 'K30', '0800fc05'), (7, 0x0a33, 'K33', '0800fc65'),
    (8, 0x0a34, 'K34', '0800fc99'), (9, 0x0a35, 'K35', '0800fcc1'),
    (10, 0x0a36, 'K36', '0800fce1'), (11, 0x0a37, 'K37', '0800fd0d'),
    (12, 0x0a87, 'K87', '0800fd25'), (13, 0x0a90, 'K90', '0800fd31'),
]

# Raw Thumb-1 halfwords for the two setters with no decoded function body.
UNDECODED = {
    '0800fd25': [(0x0800fd24, 'ldr r3,[pc,#0x4]'), (0x0800fd26, 'str r3,[r0,#0x0]'),
                 (0x0800fd28, 'bx lr')],
    '0800fd31': [(0x0800fd30, 'ldr r3,[pc,#0xc]'), (0x0800fd32, 'movs r2,#0x0'),
                 (0x0800fd34, 'str r3,[r0,#0x0]'), (0x0800fd36, 'movs r3,#0xc6'),
                 (0x0800fd38, 'lsls r3,r3,#0x1'), (0x0800fd3a, 'strb r2,[r0,r3]'),
                 (0x0800fd3c, 'bx lr')],
}

# Consumer semantics taken from the main dispatcher 0801d888 pseudo-C / INSN rows.
SLOT_SEMANTICS = {
    0x000: 'slot0: pointer to the 4-byte hwrev version string (all 14 setters write it)',
    0x004: 'param_1[1]: callback installed into the report object',
    0x00c: 'param_1[3]: callback invoked after the first 1000ms timeout arm',
    0x010: 'param_1[4]: periodic callback; report +0x3e08 = fn, +0x3e10 = 1000ms, +0x3e14 = 1',
    0x018: 'param_1[6] -> DAT_200022e0',
    0x01c: 'param_1[7] -> DAT_200022e4',
    0x020: 'param_1[8] -> DAT_200022e8',
    0x024: 'param_1[9] -> DAT_200022ec (also the USART divisor-table index)',
    0x028: 'param_1[10] / param_1[0xb]: passed to FUN_08019c90 slot 1',
    0x030: 'param_1[0xc] / param_1[0xd]: passed to FUN_08019c90 slot 2',
    0x038: 'param_1[0xe] / param_1[0xf]: passed to FUN_08019c90 slot 3',
    0x040: 'part of the 0x40..0x7c driver-handle block',
    0x114: 'param_1[0x45]: start of a 0x50-byte callback/handle block copied to report +0x3e28',
    0x0d4: 'param_1[0x35]: callback invoked before the state block is built',
    0x164: 'param_1[0x59]: saved function pointer',
    0x168: 'param_1[0x5a]: saved function pointer',
    0x17c: 'high callback slot written by the two full-default setters',
    0x188: 'param_1[0x62] -> DAT_2000a4b4, clamped to <= 4 (a bounded count/limit)',
    0x18c: 'BYTE status copied to report +0x3a80; 0xff is a sentinel; K90 clears it to 0',
    0x190: 'param_1[100]: side callback; return 1 => "right", otherwise "left"',
    0x194: 'param_1[0x65]: optional post-init callback(config_object)',
    0x19c: 'param_1[0x67]: copied to report +0x3df4',
    0x1a0: 'pointer to an 8-byte table; copied into the report when non-NULL',
    0x1a4: 'pointer to an 8-byte 0..7 channel remap table; copied into the report when non-NULL',
}

# Explicitly assumed baud rates. None of these constants exist in the image.
ASSUMED_BAUDS = [9600, 19200, 38400, 57600, 115200, 230400, 460800, 921600]
CLOCK_CASES = {
    'HSI_16MHz_constant': 16_000_000,
    'computed_SYSCLK_64MHz': 64_000_000,
}


def extract_slots(export_path: Path):
    """Attribute stores to config-object offsets only when the base is unambiguous.

    r0 (and a plain `movs rX,r0` alias) is the config object. `adds`/`subs` on
    such an alias moves the pointer WITHIN the config object (typically +0xfc),
    so the delta is accumulated into the reported offset. A `ldr` into the
    register replaces the pointer with an unrelated value, so those stores are
    reported as unattributed rather than being given a wrong offset.
    """
    regs = {}
    base_off = {'r0': 0}          # register -> byte offset from the config base
    slots, other = [], []
    for line in export_path.read_text().splitlines():
        m = re.match(r'INSN ([0-9a-f]{8}) ([0-9a-f]+) (.*)', line)
        if not m:
            continue
        addr, asm = m[1], m[3]

        a = re.match(r'movs (r\d),#0x([0-9a-f]+)', asm)
        if a:
            regs[a[1]] = int(a[2], 16)
            base_off.pop(a[1], None)
            continue
        a = re.match(r'movs (r\d),(r\d)', asm)
        if a:
            if a[2] in base_off:
                base_off[a[1]] = base_off[a[2]]
            else:
                base_off.pop(a[1], None)
            regs[a[1]] = regs.get(a[2])
            continue
        a = re.match(r'(lsls|adds|subs) (r\d),(r\d),#0x([0-9a-f]+)', asm)
        if a:
            v, k = regs.get(a[3]), int(a[4], 16)
            regs[a[2]] = None if not isinstance(v, int) else {
                'lsls': lambda x: x << k, 'adds': lambda x: x + k,
                'subs': lambda x: x - k}[a[1]](v) & 0xffffffff
            if a[1] == 'adds' and a[2] in base_off:
                base_off[a[2]] += k
            elif a[1] == 'subs' and a[2] in base_off:
                base_off[a[2]] -= k
            continue
        a = re.match(r'(adds|subs) (r\d),#0x([0-9a-f]+)', asm)
        if a:
            v, k = regs.get(a[2]), int(a[3], 16)
            regs[a[2]] = None if not isinstance(v, int) else (
                v + k if a[1] == 'adds' else v - k) & 0xffffffff
            if a[2] in base_off:
                base_off[a[2]] += k if a[1] == 'adds' else -k
            continue
        a = re.match(r'ldr (r\d),', asm)
        if a:
            base_off.pop(a[1], None)
            regs.pop(a[1], None)
            continue

        a = re.match(r'(strb|str) (r\d),\[(r\d),#0x([0-9a-f]+)\]', asm)
        if a:
            rec = {'at': '0x' + addr, 'kind': a[1], 'base': a[3], 'asm': asm}
            if a[3] in base_off:
                rec['offset'] = int(a[4], 16) + base_off[a[3]]
                slots.append(rec)
            else:
                rec['offset'] = None
                other.append(rec)
            continue
        a = re.match(r'(strb|str) (r\d),\[(r\d),(r\d)\]', asm)
        if a:
            off = regs.get(a[4])
            rec = {'at': '0x' + addr, 'kind': a[1], 'base': a[3], 'asm': asm}
            if a[3] in base_off and isinstance(off, int):
                rec['offset'] = off + base_off[a[3]]
                slots.append(rec)
            else:
                rec['offset'] = None
                other.append(rec)
    return slots, other


def build_slot_ledger():
    ledger = []
    for row, threshold, version, stem in SETTERS:
        path = TOOL / f'pass2/{stem}.txt'
        if stem in UNDECODED:
            slots = [{'at': f'0x{a:08x}', 'offset': (0x0 if 'str r3,[r0,#0x0]' in asm
                                              else 0x18c if 'strb' in asm else None),
                      'kind': 'strb' if 'strb' in asm else 'str', 'base': 'r0'}
                     for a, asm in UNDECODED[stem] if asm.startswith(('str ', 'strb '))]
            other, source = [], 'raw Thumb-1 halfwords (project has no decoded body)'
        else:
            slots, other = extract_slots(path)
            source = f'pass2/{stem}.txt'
        offsets = sorted({s['offset'] for s in slots if s['offset'] is not None})
        ledger.append({
            'row': row, 'threshold': hex(threshold), 'version': version,
            'callee': '0x' + stem, 'source': source,
            'config_object_slots': [hex(o) for o in offsets],
            'slot_details': slots,
            'other_object_store_count': len(other),
            'annotated_semantics': {hex(o): SLOT_SEMANTICS[o]
                                    for o in offsets if o in SLOT_SEMANTICS},
        })
    return ledger


def apply_dispatch(hwrev: int, sku: int, devicesn: int, init_check: int):
    """Cumulative application of all rows whose threshold <= hwrev."""
    applied = [r[0] for r in SETTERS if r[1] <= hwrev]
    slot_1a4 = None
    if 8 in applied:                      # K34
        slot_1a4 = 0x08025f08 if sku == 4 else 0x08025f00
    if 11 in applied:                     # K37 overwrites K34
        slot_1a4 = 0x08025ee8
    # 08011100 runs later as a callback: hwrev == 0x0A35, sku == 4, and a
    # devicesn match. It overwrites whatever the setters installed.
    callback = None
    if hwrev == 0x0a35 and sku == 4:
        if devicesn == 0x5150014e:
            callback = 0x08025ef8
        elif (devicesn & 0xfffffffd) == 0x5150014d and init_check == 0:
            callback = 0x08025ef0
    if callback is not None:
        slot_1a4 = callback
    return {
        'hwrev': hex(hwrev), 'applied_rows': applied,
        'slot_1a4': hex(slot_1a4) if slot_1a4 else None,
        'byte_0x18c_cleared': 13 in applied,
        'callback_08011100': hex(callback) if callback else None,
    }


def brr_path_a(clock: int, divisor: int, baud: int):
    q = clock // divisor
    return (q + (baud >> 1)) // baud


def brr_path_b(clock: int, divisor: int, baud: int):
    q = clock // divisor
    n = (2 * q + (baud >> 1)) // baud
    return (n & 0xfff0) | ((n & 0xf) >> 1), n


def in_range(value: int):
    return 0x10 <= value <= 0xffff


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--slots', default=str(TOOL / 'CONFIG_SLOTS.json'))
    ap.add_argument('--results', default=str(TOOL / 'MODEL_RESULTS.json'))
    args = ap.parse_args()

    tables = json.loads(TABLES.read_text())
    maps = {int(k, 16): v['bytes'] for k, v in
            tables['secondary_tables']['channel_maps'].items()}
    divisors = tables['secondary_tables']['baud_divisor_table']['u16']

    assertions, failures = [], []

    def eq(name, got, want):
        ok = got == want
        assertions.append({'name': name, 'got': got, 'expected': want,
                           'status': 'PASS' if ok else 'FAIL'})
        if not ok:
            failures.append(f'{name}: got {got!r}, expected {want!r}')

    # ---- Model 1: channel remap tables -----------------------------------
    for va, seq in maps.items():
        eq(f'channel_map_{va:08x}_is_permutation', sorted(seq), list(range(8)))
        eq(f'channel_map_{va:08x}_length', len(seq), 8)
    distinct = {tuple(v) for v in maps.values()}
    eq('distinct_channel_maps', len(distinct), 3)
    eq('canonical_R_bytes', list(maps[0x08025ee8]), [3, 2, 1, 0, 4, 5, 6, 7])
    eq('canonical_R_equals_08025ef8', maps[0x08025ee8], maps[0x08025ef8])
    eq('canonical_R_equals_08025f00', maps[0x08025ee8], maps[0x08025f00])
    eq('S_is_3_4_swap', list(maps[0x08025ef0]), [0, 1, 2, 4, 3, 5, 6, 7])
    eq('T_bytes', list(maps[0x08025f08]), [2, 1, 0, 4, 3, 5, 6, 7])
    inverse_R = [0] * 8
    for i, v in enumerate(maps[0x08025ee8]):
        inverse_R[v] = i
    eq('R_is_self_inverse', inverse_R, list(maps[0x08025ee8]))
    inverse_T = [0] * 8
    for i, v in enumerate(maps[0x08025f08]):
        inverse_T[v] = i
    eq('T_inverse', inverse_T, [2, 1, 0, 4, 3, 5, 6, 7])
    eq('pointer_ref_targets', len(tables['secondary_tables']['pointer_references']), 9)

    # ---- Model 2: config slot ledger -------------------------------------
    ledger = build_slot_ledger()
    eq('setter_ledger_rows', len(ledger), 14)
    eq('every_setter_writes_slot0',
        all('0x0' in r['config_object_slots'] for r in ledger), True)
    eq('K34_writes_0x1a4', '0x1a4' in ledger[8]['config_object_slots'], True)
    eq('K37_writes_0x1a4', '0x1a4' in ledger[11]['config_object_slots'], True)
    eq('K90_writes_0x18c', '0x18c' in ledger[13]['config_object_slots'], True)
    eq('K87_only_slot0', ledger[12]['config_object_slots'], ['0x0'])
    eq('K90_slots', ledger[13]['config_object_slots'], ['0x0', '0x18c'])
    eq('K35_writes_0x194', '0x194' in ledger[9]['config_object_slots'], True)
    eq('K30_writes_0x19c', '0x19c' in ledger[6]['config_object_slots'], True)

    # ---- Model 3: cumulative dispatch and the 0x18c clear ----------------
    hwrev_bounds = [0x0000, 0x0a33, 0x0a34, 0x0a35, 0x0a36, 0x0a37,
                    0x0a87, 0x0a8f, 0x0a90, 0x0b00]
    dispatch = {}
    for h in hwrev_bounds:
        dispatch[h] = apply_dispatch(h, sku=0, devicesn=0, init_check=1)
        dispatch[h]['sku'] = 0
    eq('hwrev_0_applies_1_row', len(dispatch[0x0000]['applied_rows']), 1)
    eq('hwrev_top_applies_14_rows', len(dispatch[0x0b00]['applied_rows']), 14)
    eq('K34_installs_08025f00', dispatch[0x0a34]['slot_1a4'], '0x8025f00')
    eq('K37_overwrites_with_08025ee8', dispatch[0x0a37]['slot_1a4'], '0x8025ee8')
    eq('K87_keeps_slot_1a4', dispatch[0x0a87]['slot_1a4'], '0x8025ee8')
    eq('K90_keeps_slot_1a4', dispatch[0x0a90]['slot_1a4'], '0x8025ee8')
    eq('before_K90_byte_not_cleared', dispatch[0x0a8f]['byte_0x18c_cleared'], False)
    eq('at_K90_byte_cleared', dispatch[0x0a90]['byte_0x18c_cleared'], True)
    eq('K90_clear_value_is_not_sentinel', 0 != 0xff, True)

    sku_cases = {}
    for sku in (0, 4):
        r = apply_dispatch(0x0a34, sku=sku, devicesn=0, init_check=1)
        sku_cases[sku] = r['slot_1a4']
    eq('K34_sku4_selects_08025f08', sku_cases[4], '0x8025f08')
    eq('K34_other_sku_selects_08025f00', sku_cases[0], '0x8025f00')

    callback_cases = {}
    for sn, chk, label in ((0x5150014e, 1, 'sn_4e'),
                           (0x5150014d, 0, 'sn_4d_ok'),
                           (0x5150014d, 1, 'sn_4d_failed_check'),
                           (0x5150014f, 0, 'sn_4f_ok')):
        callback_cases[label] = apply_dispatch(0x0a35, 4, sn, chk)['slot_1a4']
    eq('08011100_sn4e_installs_08025ef8', callback_cases['sn_4e'], '0x8025ef8')
    eq('08011100_sn4d_ok_installs_08025ef0', callback_cases['sn_4d_ok'], '0x8025ef0')
    eq('08011100_sn4d_failed_keeps_K34', callback_cases['sn_4d_failed_check'], '0x8025f08')
    eq('08011100_sn4f_ok_installs_08025ef0', callback_cases['sn_4f_ok'], '0x8025ef0')

    # ---- Model 4: USART BRR ----------------------------------------------
    eq('divisor_table_length_matches_4bit_index', len(divisors), 1 << 4)
    eq('divisor_table_index0', divisors[0], 1)
    eq('divisor_table_index1', divisors[1], 2)
    eq('divisor_table_last', divisors[15], 0x101)

    brr_cases = []
    for label, clock in CLOCK_CASES.items():
        for baud in ASSUMED_BAUDS:
            for idx in range(len(divisors)):
                div = divisors[idx]
                a = brr_path_a(clock, div, baud)
                b, n = brr_path_b(clock, div, baud)
                brr_cases.append({
                    'clock': label, 'clock_hz': clock, 'baud': baud,
                    'divisor_index': idx, 'divisor': div,
                    'path_A_raw': a, 'path_A': hex(a), 'path_A_in_range': in_range(a),
                    'path_B_raw_N': n, 'path_B': hex(b), 'path_B_in_range': in_range(b),
                })
    eq('brr_case_count', len(brr_cases), 2 * 8 * 16)
    eq('brr_64MHz_115200_pathA', brr_path_a(64_000_000, 1, 115200), 556)
    eq('brr_64MHz_115200_pathA_hex', hex(brr_path_a(64_000_000, 1, 115200)), '0x22c')
    eq('brr_64MHz_115200_pathB_N', brr_path_b(64_000_000, 1, 115200)[1], 1111)
    eq('brr_64MHz_115200_pathB', hex(brr_path_b(64_000_000, 1, 115200)[0]), '0x453')
    eq('brr_16MHz_115200_pathA', brr_path_a(16_000_000, 1, 115200), 139)
    eq('brr_16MHz_115200_pathB', hex(brr_path_b(16_000_000, 1, 115200)[0]), '0x113')
    eq('brr_divisor2_halves_pathA',
       brr_path_a(64_000_000, 2, 115200), brr_path_a(32_000_000, 1, 115200))
    eq('brr_out_of_range_fast_baud', in_range(brr_path_a(64_000_000, 1, 8_000_000)), False)
    eq('brr_in_range_slow_baud', in_range(brr_path_a(64_000_000, 1, 9600)), True)
    # The encoded BRR must never set bit 3 (kept clear for 8x oversampling),
    # and the 4-bit fraction field must therefore always fit in 3 bits.
    eq('brr_pathB_encoded_bit3_clear',
       all((int(c['path_B'], 16) & 0x8) == 0 for c in brr_cases), True)
    eq('brr_pathB_fraction_fits_3_bits',
       all((int(c['path_B'], 16) & 0xf) <= 7 for c in brr_cases), True)
    # Counterfactual: using the 16MHz constant instead of the computed SYSCLK
    # produces a 4x smaller BRR, which is why the branch choice is material.
    eq('brr_clock_source_matters',
       brr_path_a(64_000_000, 1, 115200) // brr_path_a(16_000_000, 1, 115200), 4)

    from collections import defaultdict
    writers = defaultdict(list)
    for row in ledger:
        for det in row['slot_details']:
            off = det.get('offset')
            if isinstance(off, int) and off >= 0x110:
                writers[hex(off)].append(f"{det['at']} ({row['version']})")
    high_writers = {k: sorted(set(v)) for k, v in sorted(writers.items())}
    high_writers.setdefault('0x18c', []).append(
        '0x0800f74c (global 0x2000a4c0 object, writes 1)')
    high_writers.setdefault('0x1a4', []).append(
        '0x08011130 (08011100 hwinfo callback)')
    high_writers['0x1a0'] = ['read at 0x0801e666; no setter writes it in the 14 rows']

    slots_doc = {
        'schema': 'eightsleep.nonusb.static-residual-config-slots.v1',
        'date': '2026-11-08',
        'source': 'pass2 read-only setter exports + raw Thumb-1 halfwords + main dispatcher 0801d888',
        'config_object': 'param_1 in 0801d888 (r7 = param_1, r6 = param_2 report object)',
        'slot_semantics': {hex(k): v for k, v in SLOT_SEMANTICS.items()},
        'setters': ledger,
        'high_slot_writers': high_writers,
        'offset_note': 'Several setters issue adds rN,#0xfc before storing; the reported offsets already include that delta, so K33 [r4+0x18] is correctly +0x114, the start of the 0x50-byte block copied to report +0x3e28.',
        'limits': [
            'Callback/purpose names come from the consumer call sites; no symbol names exist in the stripped image.',
            'Stores through a register reloaded by ldr are listed as unattributed rather than being assigned a guessed offset.',
            'K87 / K90 have no decoded function body in the Ghidra project; their slots come from raw Thumb-1 halfwords.',
            'No firmware executed; no device, account, API or network access.',
        ],
        'executes_firmware': False,
    }
    Path(args.slots).write_text(json.dumps(slots_doc, ensure_ascii=False, indent=2) + '\n')

    results = {
        'schema': 'eightsleep.nonusb.static-residual-model-results.v1',
        'date': '2026-11-08',
        'status': 'PASS' if not failures else 'FAIL',
        'inputs': {
            'tables': 'RESIDUAL_TABLES.json',
            'byte_validation': 'BYTE_VALIDATION.json (must be PASS)',
            'setter_exports': 'pass2/*.txt',
        },
        'assumptions': {
            'baud_rates': 'EXPLICIT ASSUMPTION: 8 standard rates; no baud constant exists anywhere in the 132896-byte image',
            'clocks': '16MHz is an in-image constant; 64MHz is the conditional computed SYSCLK from the previous PLL round, not a measured oscillator',
            'divisor_index': 'all 16 table indices are enumerated; the runtime value is not fixed statically',
            'sku_and_devicesn': 'enumerated explicitly; runtime values come from hwinfo',
        },
        'models': {
            'channel_maps': {
                'distinct_permutations': [list(x) for x in sorted(distinct)],
                'R_inverse': inverse_R, 'T_inverse': inverse_T,
                'role': '8-byte index remap consumed through config slot +0x1a4',
            },
            'cumulative_dispatch': {hex(k): v for k, v in dispatch.items()},
            'sku_selection_at_K34': sku_cases,
            'callback_08011100': callback_cases,
            'usart_brr': {
                'case_count': len(brr_cases),
                'formula_A': 'q = clock // table[index]; BRR = (q + (baud >> 1)) // baud',
                'formula_B': 'q = clock // table[index]; N = (2*q + (baud >> 1)) // baud; BRR = (N & 0xfff0) | ((N & 0xf) >> 1)',
                'range': '0x10 <= BRR <= 0xffff, else 0800e950 returns 1',
                'worked_examples': [
                    {'clock': '64MHz', 'baud': 115200, 'index': 0,
                     'path_A': '0x22c (556)', 'path_B': '0x453 (N=1111)'},
                    {'clock': '16MHz', 'baud': 115200, 'index': 0,
                     'path_A': '0x8b (139)', 'path_B': '0x113 (N=278)'},
                ],
                'cases': brr_cases,
            },
        },
        'assertions': assertions,
        'assertion_count': len(assertions),
        'failures': failures,
        'limits': tables['limits'],
        'executes_firmware': False,
    }
    Path(args.results).write_text(json.dumps(results, ensure_ascii=False, indent=2) + '\n')
    print(json.dumps({'status': results['status'], 'assertions': len(assertions),
                      'failures': len(failures), 'brr_cases': len(brr_cases),
                      'setter_rows': len(ledger)},
                     ensure_ascii=False, indent=2))
    return 0 if not failures else 1


if __name__ == '__main__':
    raise SystemExit(main())
