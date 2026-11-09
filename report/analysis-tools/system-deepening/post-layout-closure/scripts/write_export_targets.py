#!/usr/bin/env python3
"""Rebuild EXPORT_TARGETS.json from the retained round-9 invocation logs.

The output directory path contains a space (/Volumes/My Passport/...), so the
COMMAND line cannot be split naively. Each target list is recovered by locating
the marker '/post-layout-closure/<pass> ' and taking everything after it.
The result is a self-contained plan: which target produced which txt file.
"""

import json
import re
from pathlib import Path

TOOL = Path(__file__).resolve().parent.parent
FROZEN = ('materials/eightsleep-full-evidence-20261107/firmware/mtk/rootfs/files/'
          'opt/eight/lib/subsystem_updates/firmware-sensor-g0.bbin')


def txt_name(target):
    if ':' in target:
        a, b = target.split(':')
        return '%s_%s.txt' % (a, b)
    return '%s.txt' % target


passes = []
for log in sorted(TOOL.glob('pass*-export.log')):
    name = log.name.split('-')[0]
    line = next(l for l in log.read_text().splitlines() if l.startswith('COMMAND '))
    marker = '/post-layout-closure/%s ' % name
    idx = line.index(marker) + len(marker)
    targets = line[idx:].split()
    actual = sorted(p.name for p in (TOOL / name).glob('*.txt') if p.name != 'program.txt')
    expected = sorted(txt_name(t) for t in targets)
    passes.append(dict(
        name=name,
        export_log=log.name,
        target_count=len(targets),
        targets=targets,
        txt_count=len(actual),
        txt_matches_targets=(actual == expected),
        untargeted_txt=sorted(set(actual) - set(expected)),
        missing_txt=sorted(set(expected) - set(actual)),
    ))

doc = {
    'schema': 'eightsleep.nonusb.post-layout-closure.export-targets.v1',
    'date': '2026-11-09',
    'round': 9,
    'frozen_input': {'path': FROZEN, 'bytes': 132896,
                     'sha256': '51531576fd31af96f7239b71d26e1f175815f5cb21dbe9ab305fa9a33cc6a891'},
    'purpose': ('pass1 covers the 17 contiguous VA ranges that had no decoded '
                'instruction before this round; pass2..pass7 cover the 692 '
                'flash-internal BL targets never exported as TARGET before, in '
                'batches of at most 116 argv elements.'),
    'marker_rule': ('paths contain a space, so targets are recovered after the '
                    "marker '/post-layout-closure/<pass> ' rather than by splitting "
                    'the whole COMMAND line'),
    'totals': {
        'passes': len(passes),
        'targets': sum(p['target_count'] for p in passes),
        'txt_files': sum(p['txt_count'] for p in passes),
        'ranges': sum(1 for p in passes for t in p['targets'] if ':' in t),
        'single_functions': sum(1 for p in passes for t in p['targets'] if ':' not in t),
    },
    'all_txt_match_targets': all(p['txt_matches_targets'] for p in passes),
    'passes': passes,
}
out = TOOL / 'EXPORT_TARGETS.json'
out.write_text(json.dumps(doc, indent=2, ensure_ascii=False, sort_keys=True) + '\n')
print(json.dumps(doc['totals'], indent=2))
print('all txt match targets:', doc['all_txt_match_targets'])
for p in passes:
    if not p['txt_matches_targets']:
        print(' MISMATCH', p['name'], 'extra', p['untargeted_txt'][:3],
              'missing', p['missing_txt'][:3])
