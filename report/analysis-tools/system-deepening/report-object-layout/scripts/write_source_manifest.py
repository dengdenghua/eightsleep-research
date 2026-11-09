#!/usr/bin/env python3
"""Write SOURCE_MANIFEST.json: SHA256 of every input to this evidence folder.

Excludes itself and all derived outputs so the manifest has no self-reference.
Paths are relative to the delivery root so it stays portable across mounts.

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
ROUND7 = PROJECT / 'report/analysis-tools/system-deepening/callback-implementations'

EXCLUDE_NAMES = {
    'SOURCE_MANIFEST.json', 'BYTE_VALIDATION.json', 'LAYOUT_MAP.json',
    'CONSTRUCTOR_LEDGER.json', 'MODEL_RESULTS.json', 'COVERAGE_RESIDUAL.json',
    'EXPORT_COMMANDS.json', 'REPRODUCE.txt', 'FINDINGS_ZH.txt', '_cache.json',
}


def entry(path: Path, role: str) -> dict:
    b = path.read_bytes()
    try:
        shown = str(path.relative_to(PROJECT))
    except ValueError:
        shown = str(path)
    return {'path': shown, 'role': role, 'bytes': len(b),
            'sha256': hashlib.sha256(b).hexdigest()}


def main() -> int:
    items = [entry(BBIN, 'frozen firmware image, read as data only'),
             entry(ROUND7 / 'pass2/0801d888.txt',
                   'round-7 main-dispatcher read-only export (primary input)'),
             entry(ROUND7 / 'REPORT_FIELDS.json',
                   'round-7 report-field ledger (cross-round validation input)'),
             entry(ROUND7 / 'scripts/thumb_lite.py',
                   'upstream minimal Thumb decoder copied into this round')]
    for p in sorted(TOOL.glob('pass*/*.txt')):
        items.append(entry(p, 'retained read-only Ghidra export'))
    for p in sorted(TOOL.glob('pass*-export.log')):
        items.append(entry(p, 'retained Ghidra invocation log'))
    for p in (sorted((TOOL / 'scripts').glob('*.py'))
              + sorted((TOOL / 'model').glob('*.py'))):
        items.append(entry(p, 'reproducible verification / model script'))
    doc = {
        'schema': 'eightsleep.nonusb.report-object-layout.source-manifest.v1',
        'date': '2026-11-09',
        'entries': len(items),
        'excluded': sorted(EXCLUDE_NAMES),
        'files': items,
        'note': 'Paths are relative to the delivery root; the Ghidra project '
                'itself is NOT part of the delivery and is not required to '
                'audit the published conclusions.',
    }
    out = TOOL / 'SOURCE_MANIFEST.json'
    out.write_text(json.dumps(doc, ensure_ascii=False, indent=2,
                              sort_keys=True) + '\n')
    print(json.dumps({'entries': len(items), 'output': str(out)}, indent=2))
    return 0


if __name__ == '__main__':
    raise SystemExit(main())
