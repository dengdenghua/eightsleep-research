#!/usr/bin/env python3
"""Replay the cumulative 14-row hwrev dispatch table over hwrev boundaries.

Pure integer/string model over the verified DISPATCH_TABLE_MAP.json. No firmware,
no device, no network. The HSE value is the software field written by the two
clock-configuration entrances, NOT a measured oscillator frequency.

Usage:
  python3 model/apply_dispatch.py
"""
from __future__ import annotations

import argparse
import json
from pathlib import Path

HERE = Path(__file__).resolve().parent
TOOL = HERE.parent
MAP = TOOL / 'DISPATCH_TABLE_MAP.json'

# init variant (even address) -> clock configuration entrance called by it
INIT_TO_CONFIG = {
    0x08010bf4: 0x080108ac,
    0x08010c6c: 0x080108ac,
    0x080114bc: 0x08010960,
    0x08011914: 0x080108ac,
    0x08011d90: 0x08010960,
    0x08012008: 0x080108ac,
    # 08012274 starts with BL 08012008, so it inherits the same entrance.
    0x08012274: 0x080108ac,
}

BOUNDARIES = [0x0000, 0x0805, 0x0900, 0x0A00, 0x0A05, 0x0A10, 0x0A30,
              0x0A33, 0x0A34, 0x0A35, 0x0A36, 0x0A37, 0x0A87, 0x0A90,
              0x0AFF, 0x0B00]


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--output', default=str(TOOL / 'DISPATCH_SIMULATION.json'))
    args = ap.parse_args()

    doc = json.loads(MAP.read_text())
    rows = doc['rows']
    by_entry = {int(r['callee_entry'], 16): r for r in rows}
    failures = []
    assertions = []

    def assert_eq(name, got, expected):
        ok = got == expected
        assertions.append({'name': name, 'ok': ok, 'got': got, 'expected': expected})
        if not ok:
            failures.append(name)

    def apply(row, state):
        inline = row.get('inline_call')
        if inline:
            target = int(inline['target'], 16)
            if target not in by_entry:
                raise KeyError(f'inline target {hex(target)} not in table')
            apply(by_entry[target], state)
        state['slot0_version_label'] = row['version_string']
        state['applied'].append(row['threshold_label'])
        if row.get('slot1_init_pointer'):
            state['slot1_init_pointer'] = int(row['slot1_init_pointer'], 16)
        state['effects'].append({'setter': row['threshold_label'],
                                 'note': row['note']})
        return state

    def simulate(hwrev):
        state = {'slot0_version_label': None, 'slot1_init_pointer': None,
                 'applied': [], 'effects': []}
        for row in rows:
            if int(row['threshold'], 16) <= hwrev:
                apply(row, state)
        init_even = (state['slot1_init_pointer'] & ~1) if state['slot1_init_pointer'] else None
        config = INIT_TO_CONFIG.get(init_even)
        if config == 0x080108ac:
            hse = 16000000 if 0x0A87 <= hwrev <= 0x0AFF else 32000000
        elif config == 0x08010960:
            hse = 8000000
        else:
            hse = None
        return {
            'hwrev': hex(hwrev),
            'applied_rows': len(state['applied']),
            'applied_distinct_rows': len(set(state['applied'])),
            'applied_setters': state['applied'],
            'final_version_label': state['slot0_version_label'],
            'final_init_pointer': (hex(state['slot1_init_pointer'])
                                   if state['slot1_init_pointer'] else None),
            'final_init_entry': hex(init_even) if init_even else None,
            'clock_config_entrance': hex(config) if config else None,
            'hse_software_field_hz': hse,
        }

    results = [simulate(hwrev) for hwrev in BOUNDARIES]
    index = {int(r['hwrev'], 16): r for r in results}

    # each row's threshold is the first hwrev at which that label becomes visible
    for row in rows:
        thr = int(row['threshold'], 16)
        if thr in index:
            assert_eq(f'label_at_threshold_{row["threshold_label"]}',
                      index[thr]['final_version_label'], row['threshold_label'])

    assert_eq('K10_replays_K00_init', index[0x0A10]['final_init_pointer'], '0x80114bd')
    assert_eq('K33_replays_K05_then_overwrites_init',
              index[0x0A33]['final_init_pointer'], '0x8012009')
    assert_eq('K00_uses_8mhz_entrance', index[0x0A00]['hse_software_field_hz'], 8000000)
    assert_eq('K05_uses_8mhz_entrance', index[0x0A05]['hse_software_field_hz'], 8000000)
    assert_eq('K36_same_init_as_K87_but_32mhz', index[0x0A36]['hse_software_field_hz'], 32000000)
    assert_eq('K87_switches_to_16mhz', index[0x0A87]['hse_software_field_hz'], 16000000)
    assert_eq('K90_still_16mhz', index[0x0A90]['hse_software_field_hz'], 16000000)
    assert_eq('K87_final_init_is_7th_variant', index[0x0A87]['final_init_pointer'], '0x8012275')
    assert_eq('hwrev_0B00_falls_back_to_32mhz', index[0x0B00]['hse_software_field_hz'], 32000000)
    assert_eq('top_row_calls_16_setters_including_two_inline_replays',
              index[0x0B00]['applied_rows'], 16)
    assert_eq('top_row_triggers_all_14_distinct_rows',
              index[0x0B00]['applied_distinct_rows'], 14)
    assert_eq('first_row_applies_1_setter', index[0x0000]['applied_rows'], 1)

    out = {
        'schema': 'eightsleep.nonusb.hwrev-dispatch-table-simulation.v1',
        'date': '2026-11-08',
        'status': 'PASS' if not failures else 'FAIL',
        'method': 'Replays every row with threshold <= hwrev in table order; inline '
                  'BL replay is applied before the caller overwrites slots.',
        'init_to_config_entrance': {hex(k): hex(v) for k, v in INIT_TO_CONFIG.items()},
        'hse_rule': 'entrance 080108ac writes 16000000 for hwrev 0x0A87..0x0AFF, '
                    'else 32000000; entrance 08010960 writes 8000000.',
        'boundaries': results,
        'assertions': assertions,
        'failures': failures,
        'limits': [
            'The HSE field is a software input consumed by 0800cd24 in its HSE branch; '
            'it is not proof of a fitted oscillator or of a measured core clock.',
            'Setter side effects other than slot0/slot1 are listed but not modelled.',
            'Runtime RCC_CFGR source selection can override which branch is taken.',
        ],
        'executes_firmware': False,
    }
    Path(args.output).write_text(json.dumps(out, ensure_ascii=False, indent=2) + '\n')
    print(json.dumps({'status': out['status'], 'assertions': len(assertions),
                      'failures': len(failures), 'boundaries': len(results)}, indent=2))
    return 0 if not failures else 1


if __name__ == '__main__':
    raise SystemExit(main())
