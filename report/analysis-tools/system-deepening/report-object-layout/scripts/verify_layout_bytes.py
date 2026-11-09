"""Byte / instruction / constant-propagation verification for the report layout round.

All checks use the frozen firmware-sensor-g0.bbin plus the retained read-only
Ghidra exports in pass1/pass2 of this folder. No firmware is executed.
"""

import hashlib
import json
import re
import struct
import sys
from collections import Counter
from pathlib import Path

HERE = Path(__file__).resolve().parent
FOLDER = HERE.parent
ROOT = HERE.parents[4]
sys.path.insert(0, str(HERE))
import thumb_lite

BBIN = ROOT / ('materials/eightsleep-full-evidence-20261107/firmware/mtk/'
               'rootfs/files/opt/eight/lib/subsystem_updates/firmware-sensor-g0.bbin')
BASE = 0x08008000
SHA = '51531576fd31af96f7239b71d26e1f175815f5cb21dbe9ab305fa9a33cc6a891'
DISPATCH = ROOT / ('report/analysis-tools/system-deepening/'
                   'callback-implementations/pass2/0801d888.txt')
b = BBIN.read_bytes()
CHECKS = []


def eq(label, got, want, group):
    CHECKS.append(dict(group=group, label=label, got=got, want=want,
                       ok=(got == want)))


def truthy(label, got, group):
    CHECKS.append(dict(group=group, label=label, got=got, want=True,
                       ok=bool(got)))


def read32(va):
    o = va - BASE
    return struct.unpack_from('<I', b, o)[0] if 0 <= o <= len(b) - 4 else None


eq('bbin_size', len(b), 132896, 'frozen_input')
eq('bbin_sha256', hashlib.sha256(b).hexdigest(), SHA, 'frozen_input')

exports = {}
for passname in ('pass1', 'pass2'):
    p = FOLDER / passname / 'program.txt'
    t = p.read_text()
    eq('%s_program_sha' % passname, ('EXECUTABLE_SHA256 ' + SHA) in t, True,
       'export_metadata')
    for q in sorted((FOLDER / passname).glob('*.txt')):
        exports['%s/%s' % (passname, q.name)] = q.read_text()

INSN_RE = re.compile(r'^INSN ([0-9a-f]{8}) ([0-9a-f]+) (.*)$')
insn_rows, insn_bad = 0, []
for name, text in exports.items():
    for line in text.splitlines():
        m = INSN_RE.match(line)
        if not m:
            continue
        insn_rows += 1
        va, hx = int(m.group(1), 16), m.group(2)
        o = va - BASE
        if o < 0 or o + len(hx) // 2 > len(b) or b[o:o + len(hx) // 2].hex() != hx:
            insn_bad.append((name, m.group(1)))
eq('insn_rows_total', insn_rows, 7576, 'instruction_bytes')
eq('insn_bytes_mismatch', len(insn_bad), 0, 'instruction_bytes')

lit_checked, lit_bad = 0, []
LIT_RE = re.compile(r'REF\[READ:([0-9a-f]{8})=([0-9a-f]+)\]')
for name, text in exports.items():
    for line in text.splitlines():
        for m in LIT_RE.finditer(line):
            va, shown = int(m.group(1), 16), int(m.group(2), 16)
            if not (BASE <= va < BASE + len(b)):
                continue
            lit_checked += 1
            if read32(va) != shown:
                lit_bad.append((name, m.group(1)))
truthy('flash_literals_checked', lit_checked > 100, 'flash_literals')
eq('flash_literal_mismatch', len(lit_bad), 0, 'flash_literals')

# ------------------------------------------------ constant propagation to memset
PSEUDO_SIZE = re.compile(r'FUN_080086a4\((\w+),0,(0x[0-9a-f]+|\d+)\)')


def parse_size(s):
    return int(s, 16) if s.startswith('0x') else int(s)


def propagate_memset_sizes(text):
    """Return the r2 value at each 'bl 0x080086a4' by following only the
    constant-loading forms actually used by these constructors."""
    regs, out = {}, []
    for line in text.splitlines():
        m = INSN_RE.match(line)
        if not m:
            continue
        asm = m.group(3).split(' REF[')[0].strip()
        mm = re.match(r'movs (r\d),#0x([0-9a-f]+)$', asm)
        if mm:
            regs[mm.group(1)] = int(mm.group(2), 16)
            continue
        mm = re.match(r'movs (r\d),(r\d)$', asm)
        if mm:
            regs[mm.group(1)] = regs.get(mm.group(2))
            continue
        mm = re.match(r'lsls (r\d),(r\d),#0x([0-9a-f]+)$', asm)
        if mm:
            v = regs.get(mm.group(2))
            regs[mm.group(1)] = None if v is None else (v << int(mm.group(3), 16)) & 0xFFFFFFFF
            continue
        mm = re.match(r'ldr (r\d),\[0x([0-9a-f]{8})\]', asm)
        if mm:
            lit = int(mm.group(2), 16)
            lm = re.search(r'REF\[READ:[0-9a-f]{8}=([0-9a-f]+)\]', line)
            regs[mm.group(1)] = int(lm.group(1), 16) if lm else read32(lit)
            continue
        if 'bl 0x080086a4' in asm:
            out.append(regs.get('r2'))
            continue
        # any other write to r2 invalidates the tracked constant
        if re.match(r'^(add|sub|ldr|ldrb|ldrh|mov|ands|eors|orrs|bics|lsrs|asrs)', asm):
            dst = re.match(r'^\w+ (r\d)', asm)
            if dst and dst.group(1) == 'r2':
                regs['r2'] = None
    return out


pseudo_sizes = {}
for name, text in exports.items():
    if 'FUNCTION_BODY' not in text:
        continue
    c = text[text.find('FUNCTION_BODY'):text.find('\nINSN ')]
    sizes = [parse_size(s) for target, s in PSEUDO_SIZE.findall(c)
             if target == 'param_1']
    if sizes:
        pseudo_sizes[name] = sizes
truthy('constructors_with_memset', len(pseudo_sizes) >= 10, 'memset_constants')

checked, mismatched = 0, []
for name, sizes in sorted(pseudo_sizes.items()):
    derived = propagate_memset_sizes(exports[name])
    for i, want in enumerate(sizes):
        if i >= len(derived):
            break
        if derived[i] is None:
            continue
        checked += 1
        if derived[i] != want:
            mismatched.append((name, i, derived[i], want))
truthy('memset_sizes_derived_from_instructions', checked >= 10,
       'memset_constants')
eq('memset_size_mismatch', len(mismatched), 0, 'memset_constants')

# ------------------------------------------------ main-dispatcher constants
for va, val in ((0x0801DC98, 0x3E08), (0x0801E2D8, 0x868),
                (0x0801E7AC, 0x444), (0x0801DCC4, 0x3E28),
                (0x0801EB84, 0x3E7C)):
    eq('dispatch_literal_%08x' % va, read32(va), val, 'dispatch_constants')

dt = DISPATCH.read_text()
for needle in ('FUN_080086a4(param_2,0,0x3e08);',
               'FUN_080086a4(param_2 + 0x2a0,0,0x868);',
               'FUN_080086a4(param_2 + 0x37a4,0,0x2dc);',
               'FUN_080086a4(param_2 + 0x1c0c,0,0x444);',
               'FUN_08020f94(param_2 + 0x3e28,param_1 + 0x45,0x50);',
               'FUN_080134a8(param_2 + 0x3e7c,300000,60000);'):
    eq('dispatch_pseudo_%s' % needle[:38], needle in dt, True,
       'dispatch_pseudo')

# ------------------------------------------------ undecoded exports
# A `function=none` TARGET is not automatically a code entry point. If the very
# same address is the operand of a PC-relative literal load somewhere in the
# retained exports, it is a literal-pool slot and must NOT be decoded as Thumb.
# 080191f4 is exactly that: 0x00006001, read by `ldr r3,[0x080191f4]` at
# 0801916a, inside the trailing literal pool of FUN_080190e4 [080190e4,080191e3].
lit_readers = {}
for name, text in exports.items():
    for m in LIT_RE.finditer(text):
        lit_readers.setdefault(int(m.group(1), 16), set()).add(
            (name, int(m.group(2), 16)))

undecoded = []
for name, text in exports.items():
    m = re.search(r'TARGET (\w+) function=none', text)
    if m:
        undecoded.append((name, int(m.group(1), 16)))
lit_slots = [(n, e) for n, e in undecoded if e in lit_readers]
code_entries = [(n, e) for n, e in undecoded if e not in lit_readers]

eq('undecoded_exports', len(undecoded), 9, 'undecoded_classification')
eq('literal_pool_exports', len(lit_slots), 1, 'undecoded_classification')
eq('code_prefix_exports', len(code_entries), 8, 'undecoded_classification')
eq('literal_pool_addr', '0x%08x' % lit_slots[0][1], '0x080191f4',
   'undecoded_classification')
eq('literal_pool_value', read32(lit_slots[0][1]), 0x6001,
   'undecoded_classification')
eq('literal_pool_read_value',
   sorted({v for _, v in lit_readers[0x080191F4]}), [0x6001],
   'undecoded_classification')
eq('literal_pool_reader_ref',
   'REF_TO 0801916a READ' in exports['pass1/080191f4.txt'], True,
   'undecoded_classification')
eq('literal_pool_owner',
   'FUNCTION_BODY [[080190e4, 080191e3]]' in
   exports['pass1/080190e4.txt'], True, 'undecoded_classification')
eq('literal_pool_after_last_insn', 0x080191F4 > 0x080191E2, True,
   'undecoded_classification')

stops = Counter()
for name, e in code_entries:
    rows, stop = thumb_lite.scan(b, BASE, e, read32, max_halfwords=160)
    stops[stop] += 1
    eq('prefix_nonempty_%08x' % e, len(rows) > 0, True, 'undecoded_prefixes')
    eq('prefix_stop_%08x' % e,
       stop in ('return', 'unconditional_branch', 'prefix_limit'), True,
       'undecoded_prefixes')
    for row in rows:
        va = int(row['addr'], 16)
        eq('prefix_raw_%08x_%s' % (e, row['addr']),
           b[va - BASE:va - BASE + row['width']].hex(), row['raw'],
           'undecoded_prefixes')
eq('prefix_stops_returns', stops['return'], 7, 'undecoded_prefixes')
eq('prefix_stops_unconditional_branch', stops['unconditional_branch'], 1,
   'undecoded_prefixes')

groups = Counter(c['group'] for c in CHECKS)
failures = [c for c in CHECKS if not c['ok']]
out = dict(
    schema='eightsleep.nonusb.report-object-layout.byte-validation.v1',
    date='2026-11-09',
    source=dict(frozen_bbin=str(BBIN.relative_to(ROOT)), sha256=SHA,
                bytes=len(b), va_base=hex(BASE)),
    status='PASS' if not failures else 'FAIL',
    checks=len(CHECKS), failures=len(failures), groups=dict(groups),
    insn_rows_verified=insn_rows, flash_literals_verified=lit_checked,
    memset_sizes_derived=checked,
    constructors_with_memset=len(pseudo_sizes),
    undecoded_exports=len(undecoded),
    literal_pool_exports=len(lit_slots),
    code_prefix_exports=len(code_entries),
    code_prefix_stops=dict(stops),
    literal_pool_addr='0x080191f4',
    failure_details=failures[:40],
)
(FOLDER / 'BYTE_VALIDATION.json').write_text(
    json.dumps(out, indent=2, ensure_ascii=False, sort_keys=True) + '\n')
print('checks=%d failures=%d status=%s' % (len(CHECKS), len(failures),
                                           out['status']))
print('groups:', dict(groups))
if failures:
    for f in failures[:25]:
        print('  FAIL', f['group'], f['label'], repr(f['got']), '!=',
              repr(f['want']))
    sys.exit(1)
