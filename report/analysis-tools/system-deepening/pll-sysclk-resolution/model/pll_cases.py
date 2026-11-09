#!/usr/bin/env python3
"""Finite integer model of the nonUSB PLL -> SYSCLK -> SysTick chain.

Pure arithmetic over the verified PLL_CHAIN.json. No firmware, no device, no
network. The HSE values are software input fields, not measured oscillators.

Usage:
  python3 model/pll_cases.py
"""
from __future__ import annotations

import argparse
import json
from pathlib import Path

HERE = Path(__file__).resolve().parent
TOOL = HERE.parent
CHAIN = TOOL / 'PLL_CHAIN.json'

HSE_INPUT = {'16MHz': 16000000, '32MHz': 32000000, '8MHz': 8000000}
DIVIDER_TABLE = [0] * 8 + [1, 2, 3, 4, 6, 7, 8, 9]


def decode_fields(cfgr2):
    """Field extraction mirrors the shifts in 0800cd24 INSN rows exactly."""
    return {
        'pll_source': 'HSE software field' if (~cfgr2 & 3) == 0 else 'HSI 16000000',
        'prediv': (((cfgr2 << 25) & 0xffffffff) >> 29) + 1,
        'pllmul': ((cfgr2 << 17) & 0xffffffff) >> 25,
        'plldiv': (cfgr2 >> 29) + 1,
    }


def sysclk(cfgr2, hse):
    f = decode_fields(cfgr2)
    pll_input = hse if f['pll_source'] == 'HSE software field' else 16000000
    # 0800cd24: divide(HSE,PREDIV) -> multiply by PLLMUL -> divide by PLLDIV
    pre = pll_input // f['prediv']
    return (pre * f['pllmul']) // f['plldiv']


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--output', default=str(TOOL / 'MODEL_RESULTS.json'))
    args = ap.parse_args()

    chain = json.loads(CHAIN.read_text())
    cfgr2 = {k: int(v, 16) for k, v in chain['cfgr2_values'].items()}
    failures = []
    assertions = []

    def assert_eq(name, got, expected):
        ok = got == expected
        assertions.append({'name': name, 'ok': ok, 'got': got, 'expected': expected})
        if not ok:
            failures.append(name)

    cases = []
    for label in ('16MHz', '32MHz', '8MHz'):
        f = decode_fields(cfgr2[label])
        hse = HSE_INPUT[label]
        clk = sysclk(cfgr2[label], hse)
        cases.append({
            'variant': label, 'hse_software_input_hz': hse,
            'cfgr2': hex(cfgr2[label]),
            'pll_source': f['pll_source'], 'prediv': f['prediv'],
            'pllmul': f['pllmul'], 'plldiv': f['plldiv'],
            'pll_input_after_prediv_hz': hse // f['prediv'],
            'vco_before_plldiv_hz': (hse // f['prediv']) * f['pllmul'],
            'sysclk_hz': clk,
        })
        assert_eq(f'{label}_sysclk_is_64mhz', clk, 64000000)
        assert_eq(f'{label}_pllmul', f['pllmul'], 24)
        assert_eq(f'{label}_plldiv', f['plldiv'], 3)
        assert_eq(f'{label}_source_is_hse', f['pll_source'], 'HSE software field')
        assert_eq(f'{label}_prediv_input_is_8mhz', hse // f['prediv'], 8000000)

    assert_eq('prediv_16mhz', cases[0]['prediv'], 2)
    assert_eq('prediv_32mhz', cases[1]['prediv'], 4)
    assert_eq('prediv_8mhz', cases[2]['prediv'], 1)
    assert_eq('all_three_variants_agree', len({c['sysclk_hz'] for c in cases}), 1)

    # Prescaler: 0800cdb4 writes CFGR bits 11:8 = 0 from its second struct slot.
    idx = 0
    shift = DIVIDER_TABLE[idx]
    clock_variable = cases[0]['sysclk_hz'] >> shift
    assert_eq('prescaler_index_from_second_struct', idx, 0)
    assert_eq('prescaler_shift_table_zero', shift, 0)
    assert_eq('systick_clock_variable_64mhz', clock_variable, 64000000)

    # 0800995c: q = 1000/step, N = clock_variable/q, LOAD = N-1
    systick = []
    for step in (1, 10):
        q = 1000 // step
        n = clock_variable // q
        systick.append({'step_software_ticks': step, 'q': q, 'N': n, 'LOAD': n - 1,
                        'nominal_unit_ms_conditional': 1000 // q})
    assert_eq('systick_LOAD_step1', systick[0]['LOAD'], 63999)
    assert_eq('systick_LOAD_step10', systick[1]['LOAD'], 639999)
    assert_eq('systick_nominal_step1_ms', systick[0]['nominal_unit_ms_conditional'], 1)
    assert_eq('systick_nominal_step10_ms', systick[1]['nominal_unit_ms_conditional'], 10)

    # Counterfactual: the PREDIV field must scale with the software HSE input.
    cf_32_wrong_prediv = (cfgr2['32MHz'] & ~0x70) | (0x1 << 4)
    cf_value = sysclk(cf_32_wrong_prediv, 32000000)
    assert_eq('counterfactual_32mhz_with_prediv2_is_128mhz', cf_value, 128000000)

    # If the SW switch never reaches PLL, 0800cd24 returns the raw HSE field.
    hse_branch = {k: HSE_INPUT[k] for k in HSE_INPUT}
    assert_eq('hse_branch_16mhz', hse_branch['16MHz'], 16000000)
    assert_eq('hse_branch_32mhz', hse_branch['32MHz'], 32000000)
    assert_eq('hse_branch_8mhz', hse_branch['8MHz'], 8000000)

    out = {
        'schema': 'eightsleep.nonusb.pll-sysclk-model.v1',
        'date': '2026-11-08',
        'status': 'PASS' if not failures else 'FAIL',
        'method': 'Integer replay of the field shifts and two divisions in 0800cd24; '
                  'prescaler lookup from 080241cc; SysTick arithmetic from 0800995c.',
        'cases': cases,
        'prescaler': {'index': idx, 'shift': shift, 'clock_variable_hz': clock_variable},
        'systick': systick,
        'counterfactuals': {
            '32mhz_with_prediv_2': {'cfgr2': hex(cf_32_wrong_prediv), 'sysclk_hz': cf_value},
            'sw_not_pll': {'branch': 'HSE', 'values_hz': hse_branch},
        },
        'assertions': assertions,
        'failures': failures,
        'limits': [
            'HSE 16/32/8MHz are software inputs written by 080108ac / 08010960, '
            'not measurements of a fitted oscillator.',
            '64MHz is the value the firmware would compute and store, conditional on '
            'PLL lock, a successful SW=2 switch with SWS readback 0x10, and no fatal error.',
            'The integer-division semantics of 08008174 come from its three quotient '
            'call sites; the helper itself was not formally proved.',
            'Nominal SysTick units assume the running core clock equals the stored clock '
            'variable and the interrupt is serviced normally.',
            'Static bytes do not prove PLL lock, switch transition, tick loss or interrupt latency.',
        ],
        'executes_firmware': False,
    }
    Path(args.output).write_text(json.dumps(out, ensure_ascii=False, indent=2) + '\n')
    print(json.dumps({'status': out['status'], 'assertions': len(assertions),
                      'failures': len(failures), 'cases': len(cases),
                      'sysclk': [c['sysclk_hz'] for c in cases]}, indent=2))
    return 0 if not failures else 1


if __name__ == '__main__':
    raise SystemExit(main())
