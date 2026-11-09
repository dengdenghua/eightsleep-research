"""Record the byte-exact inputs the round-13 model consumes.

Nothing here calls Ghidra. Every path below already existed on disk before this
round started, which is what no_new_exports / no_new_ghidra_calls assert.
"""

import hashlib
import json
from pathlib import Path

HERE = Path(__file__).resolve().parent
FOLDER = HERE.parent
ROOT = HERE.parents[4]
DEEP = ROOT / 'report/analysis-tools/system-deepening'
DATE = '2026-11-09'

INPUTS = [
    'materials/eightsleep-full-evidence-20261107/firmware/mtk/rootfs/files/opt/eight/'
    'lib/subsystem_updates/firmware-sensor-g0.bbin',
    'report/analysis-tools/system-deepening/sensor-nonusb-dispatch/pass4/0800a578.txt',
    'report/analysis-tools/system-deepening/post-layout-closure/pass3/0800a480.txt',
    'report/analysis-tools/system-deepening/post-layout-closure/pass3/0800a4d8.txt',
    'report/analysis-tools/system-deepening/local-nonusb-fdc-temperature/pass4/0800814c.txt',
    'report/analysis-tools/system-deepening/sensor-nonusb-dispatch/pass3/08016e50_08016f0e.txt',
    'report/analysis-tools/system-deepening/sensor-nonusb-dispatch/pass4/08017102_0801710a.txt',
    'report/analysis-tools/system-deepening/post-layout-closure/pass6/08016e34.txt',
    'report/analysis-tools/system-deepening/sensor-nonusb-dispatch/baseline/0801d888.txt',
    'report/analysis-tools/system-deepening/sensor-nonusb-dispatch/pass1/0801710c_08017190.txt',
    'report/analysis-tools/system-deepening/report-object-layout/LAYOUT_MAP.json',
    'report/analysis-tools/system-deepening/literal-field-access/FIELD_ACCESS_LEDGER.json',
]

entries = []
for rel in INPUTS:
    p = ROOT / rel
    if not p.exists():
        entries.append(dict(path=rel, exists=False))
        continue
    data = p.read_bytes()
    entries.append(dict(path=rel, exists=True, bytes=len(data),
                        sha256=hashlib.sha256(data).hexdigest()))

manifest = dict(
    schema='eightsleep.nonusb.receive-path.source-manifest.v1',
    date=DATE, round=13,
    no_new_ghidra_calls=True,
    no_new_exports=True,
    ghidra_workspace_untouched=True,
    note=('this round only reads the frozen BBIN and exports that earlier rounds '
          'already produced; the Ghidra project was not opened, no function was '
          're-decompiled and no new passN directory was created'),
    inputs=entries,
    inputs_total=len(entries),
    inputs_missing=[e['path'] for e in entries if not e['exists']],
)
(FOLDER / 'SOURCE_MANIFEST.json').write_text(
    json.dumps(manifest, indent=2, ensure_ascii=False, sort_keys=True) + '\n')
print('entries=%d missing=%d no_new_ghidra_calls=true'
      % (len(entries), len(manifest['inputs_missing'])))
