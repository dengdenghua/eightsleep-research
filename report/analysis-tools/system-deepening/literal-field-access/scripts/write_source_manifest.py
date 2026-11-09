#!/usr/bin/env python3
"""Write SOURCE_MANIFEST.json: SHA256 of every input to this evidence folder.

No new Ghidra invocations were made in this round: every input is either the
frozen firmware image or an already-retained read-only export. Excludes itself
and all derived outputs so the manifest has no self-reference.
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
    'FIELD_ACCESS_LEDGER.json', 'HOLE_WITNESSES.json', 'CASE_CHAIN.json',
    'REPRODUCE.txt', 'FINDINGS_ZH.txt', '_cache.json',
}

UPSTREAM = [
    (DEEP / 'report-object-layout/LAYOUT_MAP.json',
     'layout map; supplies the 13 covered intervals and the nested block base'),
    (DEEP / 'residual-target-closure/pass8/08015e00_08017000.txt',
     'trampoline-cluster RANGE export; supplies the 496 instruction rows'),
    (DEEP / 'residual-target-closure/RESIDUAL_LEDGER.json',
     'closure ledger from the reachability pass'),
    (DEEP / 'callback-implementations/pass2/0801d888.txt',
     'main dispatcher export; object owner for hole witnesses'),
    (DEEP / 'sensor-frame-bounds/pass2/08027834.txt',
     'sibling dispatcher export; second object owner'),
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
    for p in (sorted((TOOL / 'scripts').glob('*.py'))
              + sorted((TOOL / 'model').glob('*.py'))):
        items.append(entry(p, 'reproducible verification / model script'))
    doc = {
        'schema': 'eightsleep.nonusb.literal-field-access.source-manifest.v1',
        'date': '2026-11-09',
        'round': 11,
        'entries': len(items),
        'excluded': sorted(EXCLUDE_NAMES),
        'files': items,
        'no_new_exports': True,
        'note': 'Paths are relative to the delivery root. No Ghidra project is '
                'needed to audit these conclusions: the analysis consumes the '
                'already-retained exports listed above plus the frozen image.',
    }
    out = TOOL / 'SOURCE_MANIFEST.json'
    out.write_text(json.dumps(doc, ensure_ascii=False, indent=2,
                              sort_keys=True) + '\n')
    print(json.dumps({'entries': len(items), 'output': str(out)}, indent=2))
    return 0


if __name__ == '__main__':
    raise SystemExit(main())
