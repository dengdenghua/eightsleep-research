#!/usr/bin/env python3
"""Verify the new nonUSB clock-writer exports against the frozen BBIN bytes.

Read-only: compares retained instruction bytes, flash literals and branch
arithmetic with the original file. Never executes firmware, never modifies the
Ghidra project, never contacts a device/account/network.

Usage:
  python3 scripts/verify_clock_bytes.py [--output BYTE_VALIDATION.json]
"""
from __future__ import annotations

import argparse
import hashlib
import json
import re
from pathlib import Path

HERE = Path(__file__).resolve().parent
TOOL = HERE.parent
SYSTEM = TOOL.parent
PROJECT = SYSTEM.parents[2]
BBIN_DIR = PROJECT / 'materials/eightsleep-full-evidence-20261107/firmware/mtk/rootfs/files/opt/eight/lib/subsystem_updates'

NONUSB = {'file': 'firmware-sensor-g0.bbin', 'base': 0x08008000,
          'sha256': '51531576fd31af96f7239b71d26e1f175815f5cb21dbe9ab305fa9a33cc6a891'}
USB = {'file': 'firmware-sensor-g0-usb.bbin', 'base': 0x08010000,
       'sha256': '1a125674542934f36266f88d9f8ca378a6a5ca696d9e58305d1b0e533f795563'}


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

    blobs = {}
    for key, meta in (('nonusb', NONUSB), ('usb', USB)):
        data = (BBIN_DIR / meta['file']).read_bytes()
        assert hashlib.sha256(data).hexdigest() == meta['sha256'], key + ' SHA mismatch'
        blobs[key] = data

    data = blobs['nonusb']
    base = NONUSB['base']
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
            ok = 0 <= off <= len(data) - len(raw) and data[off:off + len(raw)] == raw
            if not ok:
                failures.append({'file': path.name, 'check': 'instruction_bytes', 'address': hex(a)})
                continue
            if a in unique:
                assert unique[a] == raw, 'conflicting bytes for ' + hex(a)
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
            if md:
                h = int.from_bytes(raw, 'little')
                assert len(raw) == 2
                if md[1] == 'b':
                    assert h & 0xf800 == 0xe000
                    dest = a + 4 + signed(h & 0x7ff, 11) * 2
                else:
                    assert h & 0xf000 == 0xd000
                    dest = a + 4 + signed(h & 255, 8) * 2
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

    # Cross-version identity of the two error-handling chain functions.
    cross = []
    for name, va_nu, va_us, length in [
        ('error_helper_SYSRESETREQ', 0x0800a430, 0x08012430, 20),
        ('error_halt_cpsid_loop', 0x08008c04, 0x08010c04, 16),
        ('systick_config_entry', 0x0800995c, 0x0801195c, 12),
    ]:
        a = data[va_nu - base:va_nu - base + length]
        b = blobs['usb'][va_us - USB['base']:va_us - USB['base'] + length]
        cross.append({'role': name, 'nonusb': hex(va_nu), 'usb': hex(va_us),
                      'delta': hex(va_us - va_nu), 'bytes_identical': a == b,
                      'nonusb_hex': a.hex(), 'usb_hex': b.hex()})
    for name, va_nu, va_us in [
        ('AIRCR_BASE_literal', 0x0800a444, 0x08012444),
        ('AIRCR_VECTKEY_SYSRESETREQ_literal', 0x0800a448, 0x08012448),
    ]:
        a = data[va_nu - base:va_nu - base + 4]
        b = blobs['usb'][va_us - USB['base']:va_us - USB['base'] + 4]
        cross.append({'role': name, 'nonusb': hex(va_nu), 'usb': hex(va_us),
                      'delta': hex(va_us - va_nu), 'bytes_identical': a == b,
                      'value_le32': hex(int.from_bytes(a, 'little'))})

    # Clock writer region: note that the address delta is 0x8464, not 0x8000.
    region = []
    for name, va_nu, va_us in [
        ('clock_writer_1', 0x0800c828, 0x08014c8c),
        ('clock_writer_2', 0x0800c8dc, 0x08014d40),
        ('clock_writer_3', 0x0800cdb4, 0x08015218),
    ]:
        a = data[va_nu - base:va_nu - base + 16]
        b = blobs['usb'][va_us - USB['base']:va_us - USB['base'] + 16]
        region.append({'role': name, 'nonusb': hex(va_nu), 'usb': hex(va_us),
                       'delta': hex(va_us - va_nu), 'first16_identical': a == b})

    result = {
        'schema': 'eightsleep.nonusb.clock-writers-byte-validation.v1',
        'date': '2026-11-08',
        'status': 'PASS' if not failures else 'FAIL',
        'source': {'nonusb': str(BBIN_DIR / NONUSB['file']), 'sha256': NONUSB['sha256'],
                   'image_base': hex(base), 'mapping': 'file offset = VA - 0x08008000; 128-byte header included',
                   'usb': str(BBIN_DIR / USB['file']), 'usb_sha256': USB['sha256']},
        'method': 'Retained Ghidra -readOnly -noanalysis instruction rows re-checked against the frozen BBIN; '
                  'BL/direct-branch targets recomputed from the raw halfwords; flash literals re-read.',
        'totals_including_overlap': totals,
        'unique_instruction_addresses': len(unique),
        'unique_instruction_bytes': sum(len(v) for v in unique.values()),
        'failures': failures,
        'cross_version_error_chain': cross,
        'cross_version_clock_writer_region': region,
        'files': per_file,
        'limits': [
            'Byte identity and branch arithmetic do not prove complete CFG, execution, or physical reset behavior.',
            'Repeated exports of the same function are counted as overlap, not as newly discovered functions.',
            'AIRCR SYSRESETREQ write is a static instruction fact; whether the device actually resets needs a device.',
        ],
        'executes_firmware': False,
    }
    out = Path(args.output)
    out.write_text(json.dumps(result, ensure_ascii=False, indent=2) + '\n')
    print(json.dumps({'status': result['status'], 'failures': len(failures),
                      'totals': totals, 'unique_addresses': len(unique),
                      'error_chain_identical': all(c['bytes_identical'] for c in cross)},
                     ensure_ascii=False, indent=2))
    return 0 if not failures else 1


if __name__ == '__main__':
    raise SystemExit(main())
