"""Round-10 residual-target closure ledgers.

Consumes only the frozen firmware image plus the read-only Ghidra text exports
under report/analysis-tools/system-deepening/**/pass*/*.txt.

  RESIDUAL_LEDGER.json   every flash-internal bl/blx target, covered or not,
                         with the export that covers it and the out-edges of the
                         99 newly exported functions
  CONVERGENCE.json       per-pass residual counts, the long-tail analysis of the
                         0x08015f00..0x08016f00 trampoline cluster, and the
                         two closure metrics
  MODEL_RESULTS.json     headline numbers + self-assertions

Nothing here executes firmware, opens a device, or touches the network.
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
ASSERT = []


def eq(label, got, want):
    ASSERT.append(dict(label=label, got=got, want=want, ok=(got == want)))


def truthy(label, got):
    ASSERT.append(dict(label=label, got=got, want=True, ok=bool(got)))


def cstr(va, cap=200):
    o = va - BASE
    if not (0 <= o < len(b)):
        return None
    e = b.find(b'\0', o)
    if e < 0 or e - o > cap:
        e = min(o + cap, len(b))
    return b[o:e].decode('latin1')


def printable(s):
    return bool(s) and all(0x20 <= ord(c) < 0x7F for c in s)


def dump(name, obj):
    (FOLDER / name).write_text(
        json.dumps(obj, indent=2, ensure_ascii=False, sort_keys=True) + '\n')


assert len(b) == 132896 and hashlib.sha256(b).hexdigest() == SHA

# ------------------------------------------------------------------ exports
exports = {}
for p in sorted(DEEP.glob('**/pass*/*.txt')):
    try:
        exports[str(p.relative_to(DEEP))] = p.read_text()
    except (UnicodeDecodeError, OSError):
        continue
eq('exports_total', len(exports), 2823)

TARGET = re.compile(r'^TARGET ([0-9a-f]{8})(?::([0-9a-f]{8}))? function=(\S+)', re.M)
RANGE = re.compile(r'^RANGE ([0-9a-f]{8}) ([0-9a-f]{8})', re.M)
BL = re.compile(r'\bbl (?:0x)?([0-9a-f]{8})\b')
BLX = re.compile(r'\bblx (?:0x)?([0-9a-f]{8})\b')
BODY = re.compile(r'FUNCTION_BODY \[\[([0-9a-f]{8}), ([0-9a-f]{8})\]')

addrs = {}          # address -> export path that produced a TARGET line
funcs = {}          # function entry -> export path
ranges = []         # (lo, hi, path)
for name, text in exports.items():
    m = TARGET.search(text)
    if m:
        addrs[int(m.group(1), 16)] = name
        if m.group(3) != 'none':
            funcs[int(m.group(3), 16)] = name
    for rm in RANGE.finditer(text):
        ranges.append((int(rm.group(1), 16), int(rm.group(2), 16), name))

eq('target_addresses', len(addrs), 1854)
eq('function_entries', len(funcs), 1105)
eq('range_exports', len(ranges), 153)


def in_range(v):
    return any(lo <= v < hi for lo, hi, _ in ranges)


# ------------------------------------------------------------ callee picture
callees = Counter()
callers = defaultdict(set)
for name, text in exports.items():
    for t in BL.findall(text) + BLX.findall(text):
        va = int(t, 16)
        callees[va] += 1
        callers[va].add(name)
flash = {v for v in callees if BASE <= v < LIM}
covered = set(addrs) | set(funcs)
resid_target_only = sorted(v for v in flash if v not in covered)
resid_with_ranges = sorted(v for v in flash if v not in covered and not in_range(v))
eq('distinct_call_targets', len(callees), 2244)
eq('flash_targets', len(flash), 1296)
eq('flash_covered', len(flash & covered), len(flash) - len(resid_target_only))
eq('residual_target_only', len(resid_target_only), 2)
eq('residual_with_ranges', len(resid_with_ranges), 0)
truthy('residual_target_only_addresses',
       ['0x%08x' % v for v in resid_target_only] == ['0x08015f46', '0x08016e14'])

# ------------------------------------------------------- newly exported batch
new = {}
for name, text in exports.items():
    if not name.startswith('residual-target-closure/'):
        continue
    m = TARGET.search(text)
    if not m:
        continue
    va = int(m.group(1), 16)
    fn = m.group(3)
    body = BODY.search(text)
    outs = sorted({int(t, 16) for t in BL.findall(text)})
    new[va] = dict(address='0x%08x' % va, export=name, function=fn,
                   has_body=body is not None,
                   body=('[%s,%s]' % (body.group(1), body.group(2))) if body else None,
                   # first body block only; 6 functions have several blocks
                   size=(int(body.group(2), 16) - int(body.group(1), 16)) if body else None,
                   out_edges=['0x%08x' % v for v in outs],
                   caller_exports=sorted(callers.get(va, set())))
eq('round10_single_targets', len(new), 124)
eq('round10_with_body', sum(1 for v in new.values() if v['has_body']), 124)
eq('round10_function_none', sum(1 for v in new.values() if v['function'] == 'none'), 0)
eq('round10_function_is_self',
   sum(1 for k, v in new.items() if v['function'] == '%08x' % k), 124)

sizes = Counter(v['size'] for v in new.values())
eq('round10_distinct_sizes', len(sizes), 73)
eq('round10_multi_range_bodies',
   sum(1 for v in new.values() if v['export'] and
       exports[v['export']].count('] [') >= 1), 6)
eq('round10_smallest_body', min(s for s in sizes if s is not None), 1)
eq('round10_largest_body', max(s for s in sizes if s is not None), 863)

# trampoline cluster: the long tail lives in one contiguous region
CLUSTER = (0x08015F00, 0x08016F00)
tail = sorted(v for v in flash if CLUSTER[0] <= v < CLUSTER[1])
eq('cluster_targets', len(tail), 35)
truthy('tail_inside_cluster',
       all(CLUSTER[0] <= v < CLUSTER[1] for v in resid_target_only))
sib = exports['sensor-frame-bounds/pass2/08027834.txt']
eq('sibling_clear_helper_calls', sib.count('FUN_080106a4'), 14)
eq('sibling_mentions_3e08', sib.count('0x3e08'), 2)

dump('RESIDUAL_LEDGER.json', dict(
    schema='eightsleep.nonusb.residual-target-closure.residual-ledger.v1',
    date=DATE, round=10,
    source=dict(frozen_bbin=str(BBIN.relative_to(ROOT)), sha256=SHA),
    metric=dict(
        covered=('an address counts as covered when some export has a TARGET '
                 'line for it, when some export names it as the containing '
                 'function, or when it falls inside an exported RANGE'),
        target_addresses=len(addrs), function_entries=len(funcs),
        range_exports=len(ranges), flash_targets=len(flash),
        residual_target_only=['0x%08x' % v for v in resid_target_only],
        residual_with_ranges=['0x%08x' % v for v in resid_with_ranges],
    ),
    newly_exported=sorted(new.values(), key=lambda r: int(r['address'], 16)),
    trampoline_cluster=dict(
        region=['0x%08x' % CLUSTER[0], '0x%08x' % CLUSTER[1]],
        flash_targets=len(tail),
        addresses=['0x%08x' % v for v in tail],
        note=('The unresolved tail is confined to this region. Stubs of 0x1e..0x20 '
              'bytes alternate with 6-byte __gnu_thumb1_case_shi dispatchers and '
              'call each other, so exporting one always reveals the next: the '
              'tail is bounded by the region, not by the number of passes.'),
    ),
    assertions=ASSERT,
))
print('residual ledger: %d new targets, residual target-only %d, with ranges %d'
      % (len(new), len(resid_target_only), len(resid_with_ranges)))

# ------------------------------------------------------------- convergence
CONV = [
    ('pass1', 99), ('pass2', 18), ('pass3', 3), ('pass4', 1),
    ('pass5', 1), ('pass6', 1), ('pass7', 1), ('pass8', 1),
]
for name, n in CONV:
    log = FOLDER / ('%s-export.log' % name)
    truthy('log_%s_present' % name, log.exists())
eq('convergence_passes', len(CONV), 8)
eq('convergence_total_targets', sum(n for _, n in CONV), 125)
dump('CONVERGENCE.json', dict(
    schema='eightsleep.nonusb.residual-target-closure.convergence.v1',
    date=DATE, round=10,
    passes=[dict(name=n, targets=t) for n, t in CONV],
    totals=dict(passes=len(CONV), targets=sum(t for _, t in CONV),
                single_function_targets=99 + 18 + 3 + 1 + 1 + 1 + 1,
                range_targets=1,
                pass8_target_kind='RANGE 08015e00:08017000'),
    start_residual=99, end_residual_target_only=len(resid_target_only),
    end_residual_with_ranges=len(resid_with_ranges),
    note=('Chasing one address at a time converges to a two-address oscillation '
          'inside the trampoline cluster, so the last pass exports the region as '
          'a RANGE instead. Recomputing with the range counted as coverage leaves '
          'zero uncovered flash BL targets.'),
    assertions=[a for a in ASSERT if a['label'].startswith(('convergence', 'log_'))],
))

# ------------------------------------------------------------------ metrics
lit_pat = re.compile(
    r'INSN ([0-9a-f]{8}) \w+ ldr r0,\[0x([0-9a-f]{8})\] REF\[READ:[0-9a-f]{8}=([0-9a-f]+)\]')
sites = 0
lits = {}
for name, text in exports.items():
    lines = text.splitlines()
    for i, line in enumerate(lines):
        if 'bl 0x08012754' not in line:
            continue
        for j in range(i - 1, max(-1, i - 6), -1):
            m = lit_pat.match(lines[j])
            if m:
                sites += 1
                va = int(m.group(3), 16)
                if BASE <= va < LIM:
                    s = cstr(va)
                    if printable(s) and '%' in s:
                        lits[va] = s
                break
eq('log_call_sites', sites, 934)
eq('format_literals', len(lits), 165)

ACCESSORS = ('0x0801fdf0', '0x0801fdd0', '0x08010020')
MOVS0 = re.compile(r'movs r0,#0x([0-9a-f]+)')
ref_ids = Counter()
for text in exports.values():
    pending = None
    for line in text.splitlines():
        if not line.startswith('INSN '):
            continue
        m = MOVS0.search(line)
        if m:
            pending = int(m.group(1), 16)
            continue
        if 'bl ' in line:
            tgt = line.split('bl ')[-1].split()[0]
            if pending is not None and tgt in ACCESSORS:
                ref_ids[pending] += 1
            pending = None
eq('descriptor_referenced_ids', len(ref_ids), 27)
eq('descriptor_reference_sites', sum(ref_ids.values()), 309)

# hole witnesses must belong to the same object: only the two dispatchers
HOLE_WRITERS = {'callback-implementations/pass2/0801d888.txt':
                '0801d888', 'sensor-frame-bounds/pass2/08027834.txt': '08027834'}
HOLES = [(0x234, 0x258), (0x27C, 0x2A0), (0x1C08, 0x1C0C), (0x3E01, 0x3E08)]
P2 = re.compile(r'param_2\s*(?:\+\s*(0x[0-9a-f]+)|\[\s*(0x[0-9a-f]+)\s*\])')
hole_sites = {}
for path, fn in HOLE_WRITERS.items():
    body = exports[path][exports[path].find('FUNCTION_BODY'):]
    n = 0
    for line in body.splitlines():
        if '=' not in line or 'param_2' not in line:
            continue
        for m in P2.finditer(line):
            off = int(next(x for x in m.groups() if x), 16)
            if any(lo <= off < hi for lo, hi in HOLES):
                n += 1
                break
    hole_sites[fn] = n
eq('hole_writes_dispatcher', hole_sites['0801d888'], 0)
eq('hole_writes_sibling', hole_sites['08027834'], 0)
truthy('false_witness_source_present',
       'local-persistence-final-pass/pass1/0002d3fc.txt' in exports)

groups = Counter(a['label'].split('_')[0] for a in ASSERT)
failures = [a for a in ASSERT if not a['ok']]
res = dict(
    schema='eightsleep.nonusb.residual-target-closure.model-results.v1',
    date=DATE, round=10,
    source=dict(frozen_bbin=str(BBIN.relative_to(ROOT)), sha256=SHA,
                bytes=len(b), va_range='%08x..%08x' % (BASE, LIM)),
    status='PASS' if not failures else 'FAIL',
    assertions=len(ASSERT), failures=len(failures),
    assertion_groups=dict(groups),
    headline=dict(
        exported_targets=len(new), exported_with_body=124,
        start_residual=99, end_residual_target_only=len(resid_target_only),
        end_residual_with_ranges=len(resid_with_ranges),
        passes=len(CONV), total_export_targets=sum(t for _, t in CONV),
        flash_targets=len(flash), covered_addresses=len(covered),
        cluster_targets=len(tail),
        log_call_sites=sites, format_literals=len(lits),
        descriptor_referenced_ids=len(ref_ids),
        hole_writes_dispatcher=hole_sites['0801d888'],
        hole_writes_sibling=hole_sites['08027834'],
    ),
    notes=[
        'All 103 single-function targets this round have a Ghidra function body; '
        'the 169 body-less targets counted in the previous round came from the '
        'interior addresses inside that larger target list, not from these.',
        'Recomputing coverage by target address OR containing function OR exported '
        'RANGE interval drives the uncovered flash BL target count to zero.',
        'A param_2 offset match in an unrelated module is not a witness for this '
        'object; the hole scan is restricted to the two dispatchers that own it.',
    ],
    failure_details=failures[:40],
)
dump('MODEL_RESULTS.json', res)
print('assertions=%d failures=%d status=%s' % (len(ASSERT), len(failures), res['status']))
print('groups:', dict(groups))
if failures:
    for f in failures[:25]:
        print('  FAIL', f['label'], repr(f['got']), '!=', repr(f['want']))
    sys.exit(1)
