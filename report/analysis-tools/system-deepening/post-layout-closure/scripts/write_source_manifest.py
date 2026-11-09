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
DEEP = PROJECT / 'report/analysis-tools/system-deepening'
BBIN = (PROJECT / 'materials/eightsleep-full-evidence-20261107/firmware/mtk/'
        'rootfs/files/opt/eight/lib/subsystem_updates/firmware-sensor-g0.bbin')

EXCLUDE_NAMES = {
    'SOURCE_MANIFEST.json', 'BYTE_VALIDATION.json', 'MODEL_RESULTS.json',
    'COVERAGE_RESIDUAL.json', 'EXPORT_COMMANDS.json', 'EXPORT_TARGETS.json',
    'FIELD_LEDGER.json', 'DESCRIPTOR_TABLE.json', 'CALLEE_GRAPH.json',
    'FORMAT_STRINGS.json', 'REPRODUCE.txt', 'FINDINGS_ZH.txt', '_cache.json',
}

UPSTREAM = [
    (DEEP / 'report-object-layout/LAYOUT_MAP.json',
     'round-8 layout map; supplies the 14 coverage holes and the 15880B domain'),
    (DEEP / 'callback-implementations/pass2/0801d888.txt',
     'round-7 main-dispatcher export; supplies the hole-write statements'),
    (DEEP / 'report-object-layout/pass1/0801c864.txt',
     'round-8 export of the 0x10f0 block consumer'),
    (DEEP / 'report-object-layout/pass1/08019bac.txt',
     'round-8 export of the 0x250 nested constructor'),
    (DEEP / 'sensor-nonusb-dispatch/scripts/ExportSensorDiff.java',
     'read-only exporter with the SHA256 gate; regenerates every pass dir'),
]


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
    for path, role in UPSTREAM:
        items.append(entry(path, role))
    for p in sorted(TOOL.glob('pass*/*.txt')):
        items.append(entry(p, 'retained read-only Ghidra export'))
    for p in sorted(TOOL.glob('pass*-export.log')):
        items.append(entry(p, 'retained Ghidra invocation log'))
    for p in (sorted((TOOL / 'scripts').glob('*.py'))
              + sorted((TOOL / 'model').glob('*.py'))):
        items.append(entry(p, 'reproducible verification / model script'))
    doc = {
        'schema': 'eightsleep.nonusb.post-layout-closure.source-manifest.v1',
        'date': '2026-11-09',
        'round': 9,
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
