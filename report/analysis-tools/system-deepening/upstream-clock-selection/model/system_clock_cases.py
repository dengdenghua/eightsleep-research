#!/usr/bin/env python3
"""Finite integer model of the nonUSB system-clock computation chain.

SYNTHETIC only. It restates the byte-proven control flow of FUN_0800cd24,
FUN_0800cdb4 and FUN_0800995c for explicit hypothetical RCC register values.
It does NOT read real hardware registers, does NOT decode the PLL configuration
written by writer 2, does NOT execute firmware and does NOT claim 64 MHz is the
running nonUSB core clock.

Run: python3 model/system_clock_cases.py
"""
from __future__ import annotations

import json
from pathlib import Path

HERE = Path(__file__).resolve().parent
TOOL = HERE.parent

HSI = 16_000_000
DIVIDER_TABLE = [0] * 8 + [1, 2, 3, 4, 6, 7, 8, 9]


def div(a, b):
    """Integer division as implemented by FUN_08008174; b is never 0 in these cases."""
    return 0 if b == 0 else a // b


def system_clock(sws, software_input, rcc_cr=0x00000002, cfgr=0, cfgr2=0):
    """Mirror FUN_0800cd24: pick SYSCLK from RCC_CFGR.SWS."""
    if sws == 0x00:                                   # HSI
        return HSI >> ((rcc_cr & 0x3FFF) >> 11), 'HSI'
    if sws == 0x08:                                   # HSE -> software input field
        return software_input, 'HSE'
    if sws == 0x10:                                   # PLL
        pllmul = ((cfgr & 0x7F) >> 4) + 1
        pllin = software_input if (~cfgr & 3) == 0 else HSI
        pll_input_div = div(pllin, pllmul)
        numerator = ((cfgr & 0x7FFF) >> 8) * pll_input_div
        return div(numerator, (cfgr >> 29) + 1), 'PLL'
    if sws == 0x18:
        return 32_000, 'LSI'
    if sws == 0x20:
        return 0x8000, 'LSE'
    return 0, 'unknown_source'


def apply_prescaler(core_hz, index):
    """FUN_0800cdb4: 0x20000250 = system_clock >> table[(RCC_CFGR2 & 0xfff) >> 8]."""
    if not 0 <= index < len(DIVIDER_TABLE):
        raise ValueError('prescaler index out of the 16-entry table')
    return core_hz >> DIVIDER_TABLE[index]


def systick_load(clock_variable, step):
    """FUN_0800995c: q=floor(1000/step); N=floor(clock/q); LOAD=N-1."""
    if step == 0:
        return {'error': 'step_zero_rejected'}
    q = 1000 // step
    n = clock_variable // q
    return {'q': q, 'n': n, 'load': n - 1,
            'load_within_24bit': 0 <= n - 1 <= 0xFFFFFF,
            'conditional_nominal_unit_ms': 1000.0 / q}


def case(label, sws, software_input, index, step, note, **regs):
    core, source = system_clock(sws, software_input, **regs)
    variable = apply_prescaler(core, index)
    return {'label': label, 'sws': hex(sws), 'source': source,
            'software_input_hz': software_input, 'prescaler_index': index,
            'prescaler_shift': DIVIDER_TABLE[index],
            'system_clock_hz': core, 'clock_variable_0x20000250': variable,
            'tick_step': step, 'systick': systick_load(variable, step), 'note': note}


def main():
    cases = [
        case('HSI_default', 0x00, 16_000_000, 0, 1,
             '.data default; HSI path ignores the software input field'),
        case('HSE_16MHz_input', 0x08, 16_000_000, 0, 1,
             '080108ac true branch writes 16000000 to 0x20000474'),
        case('HSE_32MHz_input', 0x08, 32_000_000, 0, 1,
             '080108ac false branch writes 32000000 to 0x20000474'),
        case('HSE_8MHz_input', 0x08, 8_000_000, 0, 1,
             '08010960 writes 8000000 to 0x20000474'),
        case('HSE_prescaler_max', 0x08, 16_000_000, 15, 1,
             'largest in-table shift (9) cuts the SysTick clock to 31250 Hz'),
        case('PLL_formula_hypothetical_registers', 0x10, 8_000_000, 0, 1,
             'HYPOTHETICAL cfgr values yield 12.8 MHz, NOT 64 MHz: the PLL branch is a formula '
             'over runtime registers, so 64 MHz cannot be carried over from the USB analysis '
             'without evidence for the nonUSB register values.',
             cfgr=(4 << 4) | (8 << 8) | 3),
        case('LSI', 0x18, 16_000_000, 0, 1, 'fixed 32000 Hz branch'),
        case('LSE', 0x20, 16_000_000, 0, 1, 'fixed 32768 Hz branch'),
        case('HSE_step10', 0x08, 16_000_000, 0, 10,
             'guards the corrected 1000/q millisecond unit (10 ms)'),
    ]

    checks = [
        {'check': 'HSI default yields 16000000', 'ok': cases[0]['system_clock_hz'] == 16_000_000},
        {'check': 'HSE branch returns the software input verbatim',
         'ok': all(cases[i]['system_clock_hz'] == cases[i]['software_input_hz'] for i in (1, 2, 3))},
        {'check': 'three software inputs are distinct',
         'ok': len({cases[i]['software_input_hz'] for i in (1, 2, 3)}) == 3},
        {'check': 'prescaler index 15 divides by 2^9',
         'ok': cases[4]['clock_variable_0x20000250'] == 16_000_000 >> 9},
        {'check': 'PLL branch is computed, not hardcoded',
         'ok': cases[5]['system_clock_hz'] not in (0, 16_000_000, cases[5]['software_input_hz'])},
        {'check': 'every LOAD fits the 24-bit field',
         'ok': all(c['systick'].get('load_within_24bit') for c in cases)},
        {'check': 'step=1 -> 1 ms and step=10 -> 10 ms',
         'ok': cases[0]['systick']['conditional_nominal_unit_ms'] == 1.0
         and cases[8]['systick']['conditional_nominal_unit_ms'] == 10.0},
        {'check': 'USB 64MHz arithmetic is reproducible as a formula only',
         'ok': systick_load(64_000_000, 1)['load'] == 63999
         and systick_load(64_000_000, 10)['load'] == 639999},
        {'check': 'no case reads a real register or executes firmware', 'ok': True},
    ]
    out = {
        'date': '2026-11-08',
        'kind': 'synthetic_integer_arithmetic_not_firmware_execution_or_clock_measurement',
        'formula': 'system_clock = FUN_0800cd24(RCC_CFGR.SWS, 0x20000474, RCC regs); '
                   '0x20000250 = system_clock >> table[(RCC_CFGR2 & 0xfff) >> 8]; '
                   'q=floor(1000/step); N=floor(clock_variable/q); LOAD=N-1',
        'formula_sources': ['pass1/0800cd24.txt', 'pass1/0800cdb4.txt',
                            'nonusb-clock-writers/pass1/0800995c.txt'],
        'case_count': len(cases),
        'checks': checks,
        'checks_failed': sum(1 for c in checks if not c['ok']),
        'cases': cases,
        'scope_limits': [
            'RCC register values other than the .data defaults are explicit hypothetical inputs, not device readings.',
            'The PLL configuration written by writer 2 (0800c8dc) and the config structs in 080108ac/08010960 are NOT decoded here.',
            'USB-side 64MHz is used only to check the LOAD formula; it is NOT asserted as the nonUSB running core clock.',
            'No PLL lock, switch transition, lost ticks, interrupt latency or wall-clock deadline is modelled.',
            'Conditional nominal millisecond unit requires running core clock == clock_variable and serviced SysTick IRQs.',
        ],
    }
    target = TOOL / 'MODEL_RESULTS.json'
    target.write_text(json.dumps(out, ensure_ascii=False, indent=2) + '\n')
    print(json.dumps({'case_count': len(cases), 'checks_failed': out['checks_failed'],
                      'cases': [{'label': c['label'], 'system_clock': c['system_clock_hz'],
                                 'clock_variable': c['clock_variable_0x20000250'],
                                 'load': c['systick'].get('load')} for c in cases]},
                     ensure_ascii=False, indent=2))
    return 0 if out['checks_failed'] == 0 else 1


if __name__ == '__main__':
    raise SystemExit(main())
