"""Round-10 byte verification.

  B1  every retained round-10 export: instruction bytes vs the frozen image
  B2  closure metric: uncovered flash BL targets by target/function/range
  B3  trampoline cluster containment of the residual
  B4  log call sites and format literals after the larger export set
  B5  descriptor table references unchanged by the larger export set
  B6  hole witnesses restricted to the two dispatchers that own the object
      (a `param_2` offset in an unrelated module is not a witness)

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


def printable(s):
    return bool(s) and all(0x20 <= ord(c) < 0x7F for c in s)


eq('bbin_size', len(b), 132896, 'frozen_input')
eq('bbin_sha256', hashlib.sha256(b).hexdigest(), SHA, 'frozen_input')
eq('va_range', '%08x..%08x' % (BASE, LIM), '08008000..08028720', 'frozen_input')

exports = {}
for p in sorted(DEEP.glob('**/pass*/*.txt')):
    try:
        exports[str(p.relative_to(DEEP))] = p.read_text()
    except (UnicodeDecodeError, OSError):
        continue
truthy('exports_present', len(exports) > 2800, 'exports')

# ------------------------------------------------------------------- B1 bytes
INSN_RE = re.compile(r'^INSN ([0-9a-f]{8}) ([0-9a-f]+) ', re.M)
r10_insn = 0
bad = []
for name, text in exports.items():
    if not name.startswith('residual-target-closure/'):
        continue
    for m in INSN_RE.finditer(text):
        va, hx = int(m.group(1), 16), m.group(2)
        o = va - BASE
        r10_insn += 1
        if not (0 <= o <= len(b) - len(hx) // 2) or b[o:o + len(hx) // 2].hex() != hx:
            bad.append((name, m.group(1)))
truthy('round10_insn_rows', r10_insn > 0, 'round10_bytes')
eq('round10_insn_bytes_mismatch', len(bad), 0, 'round10_bytes')

# --------------------------------------------------------------- B2/B3 closure
TARGET = re.compile(r'^TARGET ([0-9a-f]{8})(?::[0-9a-f]{8})? function=(\S+)', re.M)
RANGE = re.compile(r'^RANGE ([0-9a-f]{8}) ([0-9a-f]{8})', re.M)
BL = re.compile(r'\bbl (?:0x)?([0-9a-f]{8})\b')
BLX = re.compile(r'\bblx (?:0x)?([0-9a-f]{8})\b')
addrs, funcs, ranges = set(), set(), []
for text in exports.values():
    m = TARGET.search(text)
    if m:
        addrs.add(int(m.group(1), 16))
        if m.group(2) != 'none':
            funcs.add(int(m.group(2), 16))
    for rm in RANGE.finditer(text):
        ranges.append((int(rm.group(1), 16), int(rm.group(2), 16)))
callees = set()
for text in exports.values():
    for t in BL.findall(text) + BLX.findall(text):
        callees.add(int(t, 16))
flash = {v for v in callees if BASE <= v < LIM}
covered = addrs | funcs


def in_range(v):
    return any(lo <= v < hi for lo, hi in ranges)


resid_t = sorted(v for v in flash if v not in covered)
resid_r = sorted(v for v in flash if v not in covered and not in_range(v))
eq('flash_targets', len(flash), 1296, 'closure')
eq('residual_target_only', ['0x%08x' % v for v in resid_t],
   ['0x08015f46', '0x08016e14'], 'closure')
eq('residual_with_ranges', len(resid_r), 0, 'closure')
truthy('residual_inside_cluster',
       all(0x08015F00 <= v < 0x08016F00 for v in resid_t), 'cluster')
eq('cluster_flash_targets',
   len([v for v in flash if 0x08015F00 <= v < 0x08016F00]), 35, 'cluster')
cluster = exports.get('residual-target-closure/pass8/08015e00_08017000.txt', '')
truthy('cluster_range_export', bool(cluster), 'cluster')
truthy('cluster_has_case_helper', '__gnu_thumb1_case_shi' in
       exports.get('residual-target-closure/pass5/08016e08.txt', ''), 'cluster')

# round-10 targets: every one is its own function entry with a body
new = {}
for name, text in exports.items():
    if not name.startswith('residual-target-closure/'):
        continue
    m = TARGET.search(text)
    if not m:
        continue
    va = int(m.group(1), 16)
    new[va] = (m.group(2), 'FUNCTION_BODY' in text, name)
eq('round10_targets', len(new), 124, 'closure')
eq('round10_self_entry', sum(1 for k, v in new.items() if v[0] == '%08x' % k), 124,
   'closure')
eq('round10_with_body', sum(1 for v in new.values() if v[1]), 124, 'closure')

# ------------------------------------------------------------ B4 log strings
lit_pat = re.compile(
    r'INSN ([0-9a-f]{8}) \w+ ldr r0,\[0x([0-9a-f]{8})\] REF\[READ:[0-9a-f]{8}=([0-9a-f]+)\]')
sites = 0
lits = set()
for text in exports.values():
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
                        lits.add(va)
                break
eq('log_call_sites', sites, 934, 'strings')
eq('format_literals', len(lits), 165, 'strings')
truthy('all_literals_printable', all(printable(cstr(v)) for v in lits), 'strings')

# -------------------------------------------------------------- B5 descriptor
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
eq('descriptor_referenced_ids', len(ref_ids), 27, 'descriptor')
eq('descriptor_reference_sites', sum(ref_ids.values()), 309, 'descriptor')
truthy('descriptor_ids_in_table', max(ref_ids) < 92, 'descriptor')

# ----------------------------------------------------------- B6 hole witnesses
HOLES = [(0x234, 0x258), (0x27C, 0x2A0), (0x1C08, 0x1C0C), (0x3E01, 0x3E08)]
P2 = re.compile(r'param_2\s*(?:\+\s*(0x[0-9a-f]+)|\[\s*(0x[0-9a-f]+)\s*\])')
OWNERS = {
    'callback-implementations/pass2/0801d888.txt': '0801d888',
    'sensor-frame-bounds/pass2/08027834.txt': '08027834',
}
for path, fn in OWNERS.items():
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
    eq('hole_writes_%s' % fn, n, 0, 'holes')
false_witness = exports.get('local-persistence-final-pass/pass1/0002d3fc.txt', '')
truthy('false_witness_export_present', bool(false_witness), 'holes')
truthy('false_witness_offsets_overlap',
       any(0x234 <= int(m.group(1), 16) < 0x258
           for m in re.finditer(r'param_2 \+ (0x[0-9a-f]+)', false_witness)),
       'holes')
eq('sibling_clear_helper_calls',
   exports['sensor-frame-bounds/pass2/08027834.txt'].count('FUN_080106a4'), 14,
   'holes')

groups = Counter(c['group'] for c in CHECKS)
failures = [c for c in CHECKS if not c['ok']]
out = dict(
    schema='eightsleep.nonusb.residual-target-closure.byte-validation.v1',
    date=DATE, round=10,
    source=dict(frozen_bbin=str(BBIN.relative_to(ROOT)), sha256=SHA,
                bytes=len(b), va_base=hex(BASE)),
    status='PASS' if not failures else 'FAIL',
    checks=len(CHECKS), failures=len(failures), groups=dict(groups),
    exports_total=len(exports),
    round10_insn_verified=r10_insn,
    round10_targets=len(new),
    flash_targets=len(flash),
    covered_addresses=len(covered),
    residual_target_only=['0x%08x' % v for v in resid_t],
    residual_with_ranges=len(resid_r),
    range_exports=len(ranges),
    log_call_sites=sites,
    distinct_format_literals=len(lits),
    descriptor_referenced_ids=len(ref_ids),
    failure_details=failures[:40],
)
(FOLDER / 'BYTE_VALIDATION.json').write_text(
    json.dumps(out, indent=2, ensure_ascii=False, sort_keys=True) + '\n')
print('checks=%d failures=%d status=%s' % (len(CHECKS), len(failures), out['status']))
print('groups:', dict(groups))
print('exports=%d r10_insn=%d flash=%d covered=%d resid=%d ranges=%d'
      % (len(exports), r10_insn, len(flash), len(covered), len(resid_t), len(ranges)))
if failures:
    for f in failures[:30]:
        print('  FAIL', f['group'], f['label'], repr(f['got']), '!=', repr(f['want']))
    sys.exit(1)
