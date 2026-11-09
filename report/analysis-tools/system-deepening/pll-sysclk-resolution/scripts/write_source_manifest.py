#!/usr/bin/env python3
"""Write SOURCE_MANIFEST.json: SHA256 of every input to this evidence folder.

Excludes itself and the derived outputs so it can be regenerated without a
self-reference mismatch.

Usage:
  python3 scripts/write_source_manifest.py
"""
from __future__ import annotations

import hashlib
import json
from pathlib import Path

TOOL = Path(__file__).resolve().parent.parent
PROJECT = TOOL.parents[3]
BBIN = (PROJECT / 'materials/eightsleep-full-evidence-20261107/firmware/mtk/'
        'rootfs/files/opt/eight/lib/subsystem_updates/firmware-sensor-g0.bbin')

EXCLUDE_NAMES = {'SOURCE_MANIFEST.json', 'BYTE_VALIDATION.json', 'PLL_CHAIN.json',
                 'MODEL_RESULTS.json', 'COVERAGE_RESIDUAL.json',
                 'EXPORT_COMMANDS.json', 'REPRODUCE.txt', 'FINDINGS_ZH.txt'}


def entry(path: Path, role: str) -> dict:
    b = path.read_bytes()
    try:
        shown = str(path.relative_to(PROJECT))
    except ValueError:
        shown = str(path)
    return {'path': shown, 'role': role, 'bytes': len(b),
            'sha256': hashlib.sha256(b).hexdigest()}


def main() -> int:
    items = [entry(BBIN, 'frozen firmware image, read as data only')]
    for p in sorted(TOOL.glob('pass*/*.txt')):
        items.append(entry(p, 'retained read-only Ghidra export'))
    for p in sorted((TOOL / 'scripts').glob('*.py')) + sorted((TOOL / 'model').glob('*.py')):
        items.append(entry(p, 'reproducible verification / model script'))
    doc = {
        'schema': 'eightsleep.nonusb.pll-sysclk-source-manifest.v1',
        'date': '2026-11-08',
        'entries': len(items),
        'excluded': sorted(EXCLUDE_NAMES),
        'files': items,
        'note': 'Paths are relative to the delivery root so the manifest is portable '
                'across mount points; the Ghidra project itself is NOT part of the delivery.',
    }
    out = TOOL / 'SOURCE_MANIFEST.json'
    out.write_text(json.dumps(doc, ensure_ascii=False, indent=2) + '\n')
    print(json.dumps({'entries': len(items), 'output': str(out)}, indent=2))
    return 0


if __name__ == '__main__':
    raise SystemExit(main())
