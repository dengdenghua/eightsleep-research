#!/usr/bin/env python3
"""Finite integer arithmetic for the nonUSB SysTick configuration chain.

SYNTHETIC only. It restates the byte-proven formula q=floor(1000/step),
N=floor(clock_variable/q), LOAD=N-1 for a few explicit input pairs. It does NOT
decode the PLL, does NOT measure a physical clock, does NOT execute firmware and
does NOT claim the running core frequency equals the input variable.

Run: python3 model/clock_cases.py
"""
from __future__ import annotations

import json
from pathlib import Path

HERE = Path(__file__).resolve().parent
TOOL = HERE.parent

# 16000000 is byte-verified as the .data initial value of 0x20000250 in the
# 132896B BBIN (file offset 132276). 32000000 and 8000000 are the two values
# written by config entries 080108ac / 08010960 into 0x20000474 -- they are
# software INPUT variables, not decoded PLL/core frequencies.
CLOCK_INPUTS = [
    {'label': 'data_initial_default', 'clock_variable': 16000000,
     'source': 'nonUSB RAW_INIT_FACTS.json / BYTE_CROSSCHECK.json'},
    {'label': 'config_080108ac_else_branch', 'clock_variable': 32000000,
     'source': 'pass2/080108c4.txt DAT_20000474 = 32000000'},
    {'label': 'config_08010960', 'clock_variable': 8000000,
     'source': 'pass2/0801096a.txt DAT_20000474 = 8000000'},
]
STEPS = [1, 10]   # 1 is the byte-verified default; 10 is the USB-side comparison variant


def systick(clock_variable, step):
    if step == 0:
        return {'error': 'step_zero_rejected'}
    q = 1000 // step
    n = clock_variable // q
    load = n - 1
    # One SysTick period is N core cycles. Only IF the running core clock equals
    # clock_variable does that equal N/clock = 1/q seconds = 1000/q milliseconds.
    # q/1000 was wrong (it gave 0.1 ms for step=10); step=10 is 10 ms, matching
    # the previously evidenced USB-side 64MHz/step10 -> LOAD 639999 -> 10 ms.
    return {'q_floor_1000_div_step': q,
            'n_core_cycles_per_tick': n,
            'systick_load': load,
            'load_within_24bit': 0 <= load <= 0xFFFFFF,
            'clock_divisible_by_1000': clock_variable % 1000 == 0,
            'conditional_nominal_unit_ms': 1000.0 / q,
            'unit_condition': 'only if running core clock == clock_variable and SysTick IRQs are serviced'}


def main():
    cases = []
    for item in CLOCK_INPUTS:
        for step in STEPS:
            r = systick(item['clock_variable'], step)
            cases.append({'label': item['label'], 'clock_variable': item['clock_variable'],
                          'tick_step': step, 'source': item['source'], **r})
    checks = [
        {'check': 'default 16MHz/step1 yields LOAD=15999', 'ok': cases[0]['systick_load'] == 15999},
        {'check': 'every load fits the 24-bit SysTick field', 'ok': all(c['load_within_24bit'] for c in cases)},
        {'check': 'all three software inputs are divisible by 1000',
         'ok': all(c['clock_divisible_by_1000'] for c in cases)},
        {'check': 'step is never zero in these cases', 'ok': all(c['tick_step'] > 0 for c in cases)},
        {'check': 'load is exactly N-1 for every case',
         'ok': all(c['systick_load'] == c['n_core_cycles_per_tick'] - 1 for c in cases)},
        {'check': 'step=1 -> 1 ms and step=10 -> 10 ms (guards the q/1000 unit bug)',
         'ok': all(c['conditional_nominal_unit_ms'] == c['tick_step'] for c in cases)},
        {'check': 'cases are deterministic and free of device data',
         'ok': all(isinstance(c['clock_variable'], int) for c in cases)},
    ]
    out = {
        'date': '2026-11-08',
        'kind': 'synthetic_integer_arithmetic_not_firmware_execution_or_clock_measurement',
        'formula': 'q=floor(1000/step); N=floor(clock_variable/q); LOAD=N-1; VAL=0; CTRL=7',
        'formula_source': 'pass1/0800995c.txt and sensor-nonusb-dispatch/FINDINGS_ZH.txt NU-05',
        'case_count': len(cases),
        'checks': checks,
        'checks_failed': sum(1 for c in checks if not c['ok']),
        'cases': cases,
        'corrections': [
            'First draft computed nominal_unit_ms as q/1000, which reported 0.1 ms for step=10. Corrected to 1000/q with an explicit core-clock condition and a regression check; the integer q/N/LOAD values were never wrong.'
        ],
        'scope_limits': [
            'The three clock_variable values are software inputs / .data initial values, NOT decoded PLL outputs.',
            'USB-side 6-case comparison concluded all three configurations decode to 64MHz; that PLL decode has NOT been reproduced for nonUSB here.',
            'No PLL lock, RCC switch transition, interrupt latency, lost ticks or wall-clock deadline is modelled.',
            'No firmware execution, no device/account/network access.',
        ],
    }
    target = TOOL / 'MODEL_RESULTS.json'
    target.write_text(json.dumps(out, ensure_ascii=False, indent=2) + '\n')
    print(json.dumps({'case_count': len(cases), 'checks_failed': out['checks_failed'],
                      'cases': [{'label': c['label'], 'step': c['tick_step'],
                                 'load': c['systick_load']} for c in cases]},
                     ensure_ascii=False, indent=2))
    return 0 if out['checks_failed'] == 0 else 1


if __name__ == '__main__':
    raise SystemExit(main())
