#!/usr/bin/env python3
"""Hash the frozen inputs used by the state-machine switch recovery."""
from __future__ import annotations

import hashlib
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[4]
PROJECT = ROOT.parent
DEEP = ROOT / 'analysis-tools' / 'system-deepening'
OUT = Path(__file__).resolve().parents[1]
IMAGE = (ROOT.parent / 'materials/eightsleep-full-evidence-20261107/firmware/mtk/'
         'rootfs/files/opt/eight/lib/subsystem_updates/firmware-sensor-g0.bbin')

inputs = [
    ('frozen_bbin', IMAGE),
    ('range_export', DEEP / 'residual-target-closure/pass8/08015e00_08017000.txt'),
    ('switch_helper_export', DEEP / 'sensor-nonusb-dispatch/pass1/08008484.txt'),
    ('sink_helper_export', DEEP / 'sensor-nonusb-dispatch/pass4/0800a578.txt'),
    ('previous_case_chain', DEEP / 'literal-field-access/CASE_CHAIN.json'),
    ('previous_hole_witnesses', DEEP / 'literal-field-access/HOLE_WITNESSES.json'),
    ('report_layout_map', DEEP / 'report-object-layout/LAYOUT_MAP.json'),
]
entries = []
for name, path in inputs:
    entries.append(dict(name=name, path=str(path.relative_to(PROJECT)),
                        bytes=path.stat().st_size,
                        sha256=hashlib.sha256(path.read_bytes()).hexdigest()))

payload = dict(
    schema='eightsleep.nonusb.state-machine-switch.source-manifest.v1',
    date='2026-11-09', round=12,
    no_new_ghidra_calls=True,
    no_new_exports=True,
    entries=entries,
)
(OUT / 'SOURCE_MANIFEST.json').write_text(
    json.dumps(payload, ensure_ascii=False, indent=2) + '\n')
print('entries=%d no_new_ghidra_calls=true' % len(entries))
