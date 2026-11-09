"""Record the byte-exact inputs the disassembly consumes.

Nothing here calls Ghidra.  Two kinds of input are recorded: the eight sensor
images under subsystem_updates (the frozen target plus the siblings used by the
load-address probe), and the whole export corpus as one aggregate fingerprint so
the 2758 contributing files are reproducible without listing each of them.
"""

import hashlib
import json
from pathlib import Path

HERE = Path(__file__).resolve().parent
FOLDER = HERE.parent
ROOT = HERE.parents[4]
DEEP = ROOT / 'report/analysis-tools/system-deepening'
SU = ('materials/eightsleep-full-evidence-20261107/firmware/mtk/rootfs/files/'
      'opt/eight/lib/subsystem_updates')
DATE = '2026-11-09'

IMAGES = ['firmware-sensor-g0.bbin', 'firmware-sensor-g0-usb.bbin',
          'firmware-sensor.bbin', 'firmware-sensor-legacy.bbin',
          'firmware-frozen.bbin', 'firmware-pillow.bbin',
          'firmware-balloon-g0.bbin', 'firmware-posture-g0.bbin']
EXTRA = ['report/analysis-tools/system-deepening/'
         'local-acquisition-final-pass/pass1/08018bd0.txt']

entries = []
for name in IMAGES:
    p = ROOT / SU / name
    if not p.exists():
        for alt in (ROOT / 'materials/eightsleep-full-evidence-20261107/firmware'
                    '/mtk/rootfs/files/opt/eight/firmware').rglob(name):
            p = alt
            break
    if not p.exists():
        entries.append(dict(path=name, exists=False))
        continue
    data = p.read_bytes()
    entries.append(dict(path=str(p.relative_to(ROOT)), exists=True,
                        bytes=len(data),
                        sha256=hashlib.sha256(data).hexdigest()))
for rel in EXTRA:
    p = ROOT / rel
    if not p.exists():
        entries.append(dict(path=rel, exists=False))
        continue
    data = p.read_bytes()
    entries.append(dict(path=rel, exists=True, bytes=len(data),
                        sha256=hashlib.sha256(data).hexdigest()))

corpus = []
for p in sorted(DEEP.rglob('*.txt')):
    if FOLDER.name in p.parts:
        continue
    corpus.append('%s %s' % (p.relative_to(DEEP),
                             hashlib.sha256(p.read_bytes()).hexdigest()))
corpus_digest = hashlib.sha256(('\n'.join(corpus) + '\n').encode()).hexdigest()

manifest = dict(
    schema='eightsleep.sensor.disasm.source-manifest.v1',
    date=DATE,
    no_new_ghidra_calls=True,
    no_new_exports=True,
    ghidra_workspace_untouched=True,
    note=('the decoder reads only the frozen BBIN bytes and the exports that '
          'already exist under report/analysis-tools/system-deepening; the '
          'Ghidra project was never opened and no new export was produced'),
    inputs=entries,
    inputs_total=len(entries),
    inputs_missing=[e['path'] for e in entries if not e['exists']],
    export_corpus=dict(
        root='report/analysis-tools/system-deepening',
        txt_files=len(corpus),
        aggregate_sha256=corpus_digest,
        aggregate_rule='sha256 over the sorted "relative/path sha256" lines '
                       'terminated by a newline'),
)
(FOLDER / 'SOURCE_MANIFEST.json').write_text(
    json.dumps(manifest, indent=2, ensure_ascii=False, sort_keys=True) + '\n')
print('entries=%d missing=%d corpus_txt=%d digest=%s'
      % (len(entries), len(manifest['inputs_missing']), len(corpus),
         corpus_digest[:16]))
