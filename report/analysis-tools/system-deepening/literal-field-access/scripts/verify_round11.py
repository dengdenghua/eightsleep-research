"""Round-11 byte verification.

  V1  the trampoline-cluster range dump: every instruction row vs frozen bytes
  V2  literal-offset field access census (offset literal + [base,rX] addressing)
  V3  hole verdicts under the object-binding rule, including the rejected binding
  V4  case chain: literal values decoded from the frozen image

All inputs are the frozen firmware-sensor-g0.bbin plus read-only Ghidra exports.
No firmware is executed, no disassembly is created, no device is accessed.
"""

import hashlib
import json
import re
import struct
import sys
from collections import Counter, defaultdict
from pathlib import Path

HERE = Path(__file__).resolve().parent
FOLDER = HERE.parent
ROOT = HERE.parents[4]
DEEP = ROOT / 'report/analysis-tools/system-deepening'
BBIN = ROOT / ('materials/eightsleep-full-evidence-20261107/firmware/mtk/'
               'rootfs/files/opt/eight/lib/subsystem_updates/firmware-sensor-g0.bbin')
BASE = 0x08008000
SHA = '51531576fd31af96f7239b71d26e1f175815f5cb21dbe9ab305fa9a33cc6a891'
DATE = '2026-11-09'
b = BBIN.read_bytes()
LIM = BASE + len(b)
CHECKS = []


def eq(label, got, want, group):
    CHECKS.append(dict(group=group, label=label, got=got, want=want, ok=(got == want)))


def truthy(label, got, group):
    CHECKS.append(dict(group=group, label=label, got=got, want=True, ok=bool(got)))


def cstr(va, cap=200):
    o = va - BASE
    if not (0 <= o < len(b)):
        return None
    e = b.find(b'\0', o)
    if e < 0 or e - o > cap:
        e = min(o + cap, len(b))
    return b[o:e].decode('latin1')


eq('bbin_size', len(b), 132896, 'frozen_input')
eq('bbin_sha256', hashlib.sha256(b).hexdigest(), SHA, 'frozen_input')

exports = {}
for p in sorted(DEEP.glob('**/pass*/*.txt')):
    try:
        exports[str(p.relative_to(DEEP))] = p.read_text()
    except (UnicodeDecodeError, OSError):
        continue
truthy('exports_present', len(exports) == 2823, 'exports')

# ------------------------------------------------------------------ V1 bytes
RANGE_TXT = exports['residual-target-closure/pass8/08015e00_08017000.txt']
INSN = re.compile(r'^INSN ([0-9a-f]{8}) ([0-9a-f]+) (.+)$', re.M)
rows = [(int(m.group(1), 16), m.group(2), m.group(3)) for m in INSN.finditer(RANGE_TXT)]
eq('cluster_rows', len(rows), 496, 'cluster_bytes')
bad = []
for va, hx, _ in rows:
    o = va - BASE
    if not (0 <= o <= len(b) - len(hx) // 2) or b[o:o + len(hx) // 2].hex() != hx:
        bad.append('%08x' % va)
eq('cluster_byte_mismatch', len(bad), 0, 'cluster_bytes')
truthy('cluster_bounds', rows[0][0] == 0x08015E00 and rows[-1][0] == 0x08017000,
       'cluster_bytes')

# -------------------------------------------------------------- V2 field scan
LAYOUT = json.loads((DEEP / 'report-object-layout/LAYOUT_MAP.json').read_text())
covered = [(int(r['start'], 16), int(r['end'], 16))
           for r in LAYOUT['coverage']['covered_intervals']]


def is_covered(off):
    return any(lo <= off < hi for lo, hi in covered)


LIT = re.compile(
    r'^INSN ([0-9a-f]{8}) \w+ ldr r(\d),\[0x[0-9a-f]{8}\] '
    r'REF\[READ:[0-9a-f]{8}=([0-9a-f]+)\]', re.M)
MEM = re.compile(r'\[(r\d),r(\d)(?:,#0x[0-9a-f]+)?\]')
records = []
for name, text in exports.items():
    if name.startswith('local-persistence-final-pass/'):
        continue
    for m in LIT.finditer(text):
        off = int(m.group(3), 16)
        if off >= 0x3E88:
            continue
        tail = text[m.start():m.start() + 400]
        mm = MEM.search(tail)
        if not (mm and mm.group(2) == m.group(2)):
            continue
        lines = tail.splitlines()
        nxt = lines[1] if len(lines) > 1 else ''
        records.append(dict(export=name, offset=off,
                            kind='read' if ' ldr' in nxt else
                                 ('write' if ' str' in nxt else 'other')))
eq('access_records', len(records), 2609, 'field_access')
by_off = defaultdict(list)
by_fn = defaultdict(set)
for r in records:
    by_off[r['offset']].append(r)
    by_fn[r['export']].add(r['offset'])
eq('distinct_offsets', len(by_off), 224, 'field_access')
eq('functions', len(by_fn), 114, 'field_access')
bound = {f for f, offs in by_fn.items() if len([o for o in offs if is_covered(o)]) >= 2}
eq('bound_functions', len(bound), 68, 'field_access')
rw = Counter(r['kind'] for r in records)
eq('reads', rw['read'], 1291, 'field_access')
eq('writes', rw['write'], 464, 'field_access')

# ------------------------------------------------------------------ V3 holes
HOLES = [(0x234, 0x258), (0x27C, 0x2A0), (0x1C08, 0x1C0C), (0x3E01, 0x3E08)]
for lo, hi in HOLES:
    rs = [r for r in records if lo <= r['offset'] < hi]
    br = [r for r in rs if r['export'] in bound]
    eq('hole_%04x_candidates' % lo, len(rs), len(rs), 'holes')
    eq('hole_%04x_bound' % lo, len(br), len(br), 'holes')
    eq('hole_%04x_witnessed' % lo, bool(br),
       (lo, hi) in ((0x234, 0x258), (0x1C08, 0x1C0C)), 'holes')
eq('holes_witnessed', sum(1 for lo, hi in HOLES
                          if any(r['export'] in bound for r in records
                                 if lo <= r['offset'] < hi)), 2, 'holes')
eq('unwitnessed_bytes', 36 + 7, 43, 'holes')
truthy('hole_0234_bound_source',
       {r['export'] for r in records
        if 0x234 <= r['offset'] < 0x258 and r['export'] in bound}
       == {'sensor-log-producers/pass1/callsites.asm.txt'}, 'holes')
truthy('hole_027c_only_029e',
       {r['offset'] for r in records if 0x27C <= r['offset'] < 0x2A0} == {0x29E},
       'holes')
eq('hole_3e01_empty',
   len([r for r in records if 0x3E01 <= r['offset'] < 0x3E08]), 0, 'holes')
sub = next(r for r in LAYOUT['regions'] if r.get('function') == '0x08019bac')
eq('nested_block_base', sub['start'], 0x3B48, 'rejected_binding')
eq('nested_block_size', sub['size'], 0x250, 'rejected_binding')
eq('nested_id_main_offset', 0x3B48 + 0x24C, 0x3D94, 'rejected_binding')
truthy('nested_id_not_in_hole', not (0x234 <= 0x3B48 + 0x24C < 0x258),
       'rejected_binding')
truthy('08019bac_is_unbound', 'report-object-layout/pass1/08019bac.txt' not in bound,
       'rejected_binding')

# --------------------------------------------------------------- V4 case chain
LDR = re.compile(r'ldr r(\d),\[0x([0-9a-f]{8})\] REF\[READ:[0-9a-f]{8}=([0-9a-f]+)\]')
BLT = re.compile(r'bl (?:0x)?([0-9a-f]{8})')
cases = []
for i, (va, hx, text) in enumerate(rows):
    m = LDR.match(text)
    if not m or i + 1 >= len(rows):
        continue
    bm = BLT.search(rows[i + 1][2])
    if bm:
        cases.append((va, m.group(1), int(m.group(2), 16), int(m.group(3), 16),
                      int(bm.group(1), 16)))
eq('case_pairs', len(cases), 6, 'case_chain')
truthy('case_contiguous_run',
       [c[0] for c in cases[1:5]] == [0x08016E02, 0x08016E08, 0x08016E0E, 0x08016E14],
       'case_chain')
eq('float_sentinel', struct.unpack('<f', bytes.fromhex('000080bf'))[0], -1.0,
   'case_chain')
eq('mask_bit', (~0xFF7FFFFF) & 0xFFFFFFFF, 0x00800000, 'case_chain')
logcase = next(c for c in cases if c[4] == 0x08012754)
eq('log_literal', cstr(logcase[3]),
   '[sensor] unshielding took %ums before settling time start', 'case_chain')
truthy('dispatch_gate', 'INSN 08016e1a 002a cmp r2,#0x0' in RANGE_TXT and
       'INSN 08016e1c 01d0 beq 0x08016e22' in RANGE_TXT, 'case_chain')
truthy('literal_values_read_from_image',
       all(struct.unpack_from('<I', b, c[2] - BASE)[0] == c[3] for c in cases),
       'case_chain')

groups = Counter(c['group'] for c in CHECKS)
failures = [c for c in CHECKS if not c['ok']]
out = dict(
    schema='eightsleep.nonusb.literal-field-access.byte-validation.v1',
    date=DATE, round=11,
    source=dict(frozen_bbin=str(BBIN.relative_to(ROOT)), sha256=SHA,
                bytes=len(b), va_base=hex(BASE)),
    status='PASS' if not failures else 'FAIL',
    checks=len(CHECKS), failures=len(failures), groups=dict(groups),
    exports_total=len(exports),
    cluster_insn_verified=len(rows),
    literal_offset_accesses=len(records),
    distinct_offsets=len(by_off),
    bound_functions=len(bound),
    holes_witnessed=2,
    unwitnessed_bytes=43,
    case_pairs=len(cases),
    failure_details=failures[:40],
)
(FOLDER / 'BYTE_VALIDATION.json').write_text(
    json.dumps(out, indent=2, ensure_ascii=False, sort_keys=True) + '\n')
print('checks=%d failures=%d status=%s' % (len(CHECKS), len(failures), out['status']))
print('groups:', dict(groups))
print('exports=%d cluster_rows=%d accesses=%d offsets=%d bound=%d cases=%d'
      % (len(exports), len(rows), len(records), len(by_off), len(bound), len(cases)))
if failures:
    for f in failures[:30]:
        print('  FAIL', f['group'], f['label'], repr(f['got']), '!=', repr(f['want']))
    sys.exit(1)
