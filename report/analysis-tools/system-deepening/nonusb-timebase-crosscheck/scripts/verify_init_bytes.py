#!/usr/bin/env python3
"""Independent byte-level crosscheck of the two G0 sensor SysTick startup records.

Reads the frozen BBIN files as data and re-verifies the claims stored in the two
prior RAW_INIT_FACTS.json files. This deliberately does NOT use Ghidra, does not
run any firmware, and does not contact a device, account or network. It is a
re-read of the original bytes, so it can be repeated after any archive restore.

Usage:
  python3 scripts/verify_init_bytes.py [--output BYTE_CROSSCHECK.json]
"""
from __future__ import annotations

import argparse
import hashlib
import json
import struct
from pathlib import Path

HERE = Path(__file__).resolve().parent
TOOL = HERE.parent
SYSTEM = TOOL.parent
REPORT = SYSTEM.parents[1]
PROJECT = SYSTEM.parents[2]

BIN_DIR = PROJECT / 'materials/eightsleep-full-evidence-20261107/firmware/mtk/rootfs/files/opt/eight/lib/subsystem_updates'

TARGETS = {
    'nonusb': {
        'bbin': 'firmware-sensor-g0.bbin',
        'facts': SYSTEM / 'sensor-nonusb-dispatch/RAW_INIT_FACTS.json',
        'sha_key': 'input_sha256',
        'base': 0x08008000,
        'expected_bytes': 132896,
        'expected_sha256': '51531576fd31af96f7239b71d26e1f175815f5cb21dbe9ab305fa9a33cc6a891',
        'systick_handler': 0x080094a2,
        'tick_ram': 0x20001144,
        'bss_zero': (0x200004bc, 0x2000ac14),
        'call_priority_argument': 3,
        'priority_call_site': '0x080099ac',
    },
    'usb': {
        'bbin': 'firmware-sensor-g0-usb.bbin',
        'facts': SYSTEM / 'sensor-timebase/RAW_INIT_FACTS.json',
        'sha_key': 'target_sha256',
        'base': 0x08010000,
        'expected_bytes': 140828,
        'expected_sha256': '1a125674542934f36266f88d9f8ca378a6a5ca696d9e58305d1b0e533f795563',
        'systick_handler': 0x080114a2,
        'tick_ram': 0x2000121c,
        'bss_zero': (0x20000594, 0x2000b344),
        'call_priority_argument': None,
        'priority_call_site': 'not independently recorded in sensor-timebase; left unknown',
    },
}


def as_int(value):
    return int(value, 16) if isinstance(value, str) else int(value)


def normalize(raw: dict, kind: str) -> dict:
    """Bring the two differently-shaped prior records into one comparable shape."""
    out = {'kind': kind}
    out['claimed_sha256'] = raw['input_sha256'] if 'input_sha256' in raw else raw['target_sha256']
    out['mapping_base'] = as_int(raw['mapping_base'])
    out['vector_header_bytes'] = raw.get('vector_header_bytes', 128)

    if 'vectors' in raw:
        out['vectors'] = {
            name: {'file_offset': v['file_offset'], 'value': as_int(v['value']),
                   'raw_hex': v.get('raw_hex')}
            for name, v in raw['vectors'].items()
        }
    else:
        out['vectors'] = {
            'systick': {'file_offset': raw['systick_vector']['file_offset'],
                        'value': as_int(raw['systick_vector']['value']),
                        'raw_hex': None}
        }

    dc = raw.get('data_copy') or raw.get('data_init') or {}
    out['data_copy'] = {
        'flash': as_int(dc.get('flash') or dc.get('load_address')),
        'ram_start': as_int(dc['ram_start']),
        'ram_end_exclusive': as_int(dc['ram_end_exclusive']),
    }
    if 'bss_zero' in raw:
        out['bss_zero'] = {
            'start': as_int(raw['bss_zero']['start']),
            'end_exclusive': as_int(raw['bss_zero']['end_exclusive']),
            'covers_tick': bool(raw['bss_zero'].get('covers_tick_20001144')),
        }
    else:
        out['bss_zero'] = None
    out['initialized_values'] = [
        {'role': v['role'], 'ram_address': as_int(v['ram_address']),
         'file_offset': v['file_offset'], 'raw_hex': v['raw_hex'], 'value': v['value']}
        for v in raw['initialized_values']
    ]
    return out


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument('--output', default=str(TOOL / 'BYTE_CROSSCHECK.json'))
    args = ap.parse_args()

    checks = []
    derived = {}
    all_ok = True

    def check(target, name, expected, actual, note=''):
        nonlocal all_ok
        ok = expected == actual
        all_ok &= ok
        checks.append({'target': target, 'check': name, 'expected': expected,
                       'actual': actual, 'ok': ok, 'note': note})

    for kind, meta in TARGETS.items():
        path = BIN_DIR / meta['bbin']
        blob = path.read_bytes()
        claims = normalize(json.loads(meta['facts'].read_text()), kind)

        sha = hashlib.sha256(blob).hexdigest()
        check(kind, 'file_bytes', meta['expected_bytes'], len(blob))
        check(kind, 'file_sha256', meta['expected_sha256'], sha)
        check(kind, 'recorded_sha256_matches_file', sha, claims['claimed_sha256'])
        check(kind, 'mapping_base', meta['base'], claims['mapping_base'])

        for vec_name, vec in claims['vectors'].items():
            raw = blob[vec['file_offset']:vec['file_offset'] + 4]
            actual_value = struct.unpack('<I', raw)[0]
            expected_hex = vec['raw_hex'] or struct.pack('<I', vec['value']).hex()
            check(kind, f'vector_{vec_name}_raw_hex', expected_hex, raw.hex())
            check(kind, f'vector_{vec_name}_value', vec['value'], actual_value)
            if vec_name == 'systick':
                stripped = actual_value & ~1
                check(kind, 'systick_handler_thumb_stripped',
                      meta['systick_handler'], stripped,
                      'Thumb bit cleared; handler address is from the same BBIN')

        dc = claims['data_copy']
        data_start = dc['flash'] - meta['base']
        data_len = dc['ram_end_exclusive'] - dc['ram_start']
        check(kind, 'data_copy_start_within_file', True, 0 <= data_start < len(blob))
        check(kind, 'data_copy_end_equals_file_end', len(blob), data_start + data_len,
              'Both BBINs end exactly at the end of their .data source region')

        for item in claims['initialized_values']:
            off = item['file_offset']
            raw = blob[off:off + len(item['raw_hex']) // 2]
            check(kind, f"init_{item['role']}_raw_hex", item['raw_hex'], raw.hex())
            if item['raw_hex'] == '01':
                actual_value = raw[0]
            elif len(raw) == 1:
                actual_value = raw[0]
            else:
                actual_value = struct.unpack('<I', raw)[0]
            check(kind, f"init_{item['role']}_value", item['value'], actual_value)
            computed = dc['flash'] + (item['ram_address'] - dc['ram_start']) - meta['base']
            check(kind, f"init_{item['role']}_offset_from_data_copy", off, computed,
                  'Independent arithmetic: Flash load address + RAM delta - mapping base')
            check(kind, f"init_{item['role']}_inside_data_copy", True,
                  data_start <= off < data_start + data_len)

        if claims['bss_zero']:
            bss = claims['bss_zero']
            bss_note = 'Range taken from RAW_INIT_FACTS.json of the same BBIN.'
        else:
            bss = {'start': meta['bss_zero'][0], 'end_exclusive': meta['bss_zero'][1]}
            bss_note = 'Range taken from prior sensor-timebase FINDINGS text, NOT re-derived from bytes here.'
        check(kind, 'bss_zero_covers_tick', True,
              bss['start'] <= meta['tick_ram'] < bss['end_exclusive'], bss_note)

        clock = next(v['value'] for v in claims['initialized_values']
                     if v['role'] == 'clock_frequency_variable')
        step = next(v['value'] for v in claims['initialized_values']
                    if v['role'] == 'tick_step')
        q = 1000 // step
        n = clock // q
        load = n - 1
        derived[kind] = {
            'default_step': step,
            'software_clock_hz': clock,
            'q_1000_div_step': q,
            'n_core_cycles_per_tick': n,
            'systick_load': load,
            'load_within_24bit': 0 <= load <= 0xFFFFFF,
            'clock_divisible_by_1000': clock % 1000 == 0,
            'nominal_unit': '1 ms per tick, conditional on config success and interrupt service',
            'cache_window_8_ticks_nominal_ms': 8 * (1000 // q) if q else None,
            'send_gate_500_ticks_nominal_ms': 500 * (1000 // q) if q else None,
            'ram_tick_priority_initial': next(
                v['value'] for v in claims['initialized_values']
                if v['role'] == 'tick_priority'),
            'priority_argument_at_call_site': meta['call_priority_argument'],
            'priority_note': 'RAM initial value is not the argument used by every init call',
        }

    result = {
        'date': '2026-11-08',
        'method': 'Re-read frozen BBIN bytes; compare against the two prior RAW_INIT_FACTS.json claims; '
                  'no Ghidra, no firmware execution, no device/account/network access.',
        'inputs': {
            k: {'path': str(BIN_DIR / v['bbin']),
                'facts_record': str(v['facts']),
                'bytes': v['expected_bytes'], 'sha256': v['expected_sha256']}
            for k, v in TARGETS.items()
        },
        'checks': checks,
        'checks_total': len(checks),
        'checks_failed': sum(1 for c in checks if not c['ok']),
        'derived': derived,
        'all_ok': all_ok,
        'scope_limit': 'Startup bytes and SysTick integer arithmetic only. Physical core clock, '
                       'PLL lock, RCC transition, interrupt latency and ADC CLKIN/DRDY are not measured.',
    }
    out = Path(args.output)
    out.write_text(json.dumps(result, ensure_ascii=False, indent=2) + '\n')
    print(json.dumps({'checks_total': result['checks_total'],
                      'checks_failed': result['checks_failed'],
                      'all_ok': result['all_ok'],
                      'derived': derived}, ensure_ascii=False, indent=2))
    return 0 if all_ok else 1


if __name__ == '__main__':
    raise SystemExit(main())
