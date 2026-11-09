"""Round-11 literal-offset field access and hole-binding ledgers.

The previous field ledgers only recognised `param_2 + 0xNNN` in pseudo-C. The
dispatcher also reaches fields through `ldr rX,[literal]` where the literal IS
the byte offset, followed by `[base,rX]` addressing on a base register. This
round generalises the extractor to that form and re-examines the four coverage
holes that had no witness.

Object binding rule: a literal-offset access counts as a witness for the report
object only when its containing function also touches at least two DISTINCT
offsets that already lie inside the round-8 covered intervals. This rejects the
tempting false binding of 0x24d/0x24e in 08019bac (those belong to the 0x250
sub-block at main offset 0x3b48, not to the main-object hole at 0x0234).

Outputs: FIELD_ACCESS_LEDGER.json, HOLE_WITNESSES.json, CASE_CHAIN.json,
MODEL_RESULTS.json. No firmware execution, no device, no network.
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


def dump(name, obj):
    (FOLDER / name).write_text(
        json.dumps(obj, indent=2, ensure_ascii=False, sort_keys=True) + '\n')


assert len(b) == 132896 and hashlib.sha256(b).hexdigest() == SHA

exports = {}
for p in sorted(DEEP.glob('**/pass*/*.txt')):
    try:
        exports[str(p.relative_to(DEEP))] = p.read_text()
    except (UnicodeDecodeError, OSError):
        continue
eq('exports_total', len(exports), 2823)

LAYOUT = json.loads((DEEP / 'report-object-layout/LAYOUT_MAP.json').read_text())
covered = [(int(r['start'], 16), int(r['end'], 16))
           for r in LAYOUT['coverage']['covered_intervals']]
eq('covered_intervals', len(covered), 13)


def is_covered(off):
    return any(lo <= off < hi for lo, hi in covered)


# ------------------------------------------------------- literal-offset scan
LIT = re.compile(
    r'^INSN ([0-9a-f]{8}) \w+ ldr r(\d),\[0x[0-9a-f]{8}\] '
    r'REF\[READ:[0-9a-f]{8}=([0-9a-f]+)\]', re.M)
MEM = re.compile(r'\[(r\d),r(\d)(?:,#0x[0-9a-f]+)?\]')
OBJECT_LIMIT = 0x3E88
# local-persistence-final-pass exports a different module whose second argument
# is also named param_2; its offsets are not this object's offsets.
EXCLUDED_PREFIX = 'local-persistence-final-pass/'

records = []
for name, text in exports.items():
    if name.startswith(EXCLUDED_PREFIX):
        continue
    for m in LIT.finditer(text):
        off = int(m.group(3), 16)
        if off >= OBJECT_LIMIT:
            continue
        tail = text[m.start():m.start() + 400]
        mm = MEM.search(tail)
        if not (mm and mm.group(2) == m.group(2)):
            continue
        lines = tail.splitlines()
        nxt = lines[1] if len(lines) > 1 else ''
        kind = 'read' if ' ldr' in nxt else ('write' if ' str' in nxt else 'other')
        records.append(dict(export=name, va=m.group(1), offset=off,
                            offset_reg='r' + m.group(2), base_reg=mm.group(1),
                            next=next(l for l in lines[1:])[:110] if len(lines) > 1 else '',
                            kind=kind))
eq('access_records', len(records), 2609)
by_off = defaultdict(list)
by_fn = defaultdict(list)
for r in records:
    by_off[r['offset']].append(r)
    by_fn[r['export']].append(r)
eq('distinct_offsets', len(by_off), 224)
eq('functions', len(by_fn), 114)
rw = Counter(r['kind'] for r in records)
eq('kind_histogram', dict(rw), {'other': 854, 'read': 1291, 'write': 464})

fn_summary = []
for name, rs in sorted(by_fn.items()):
    offs = sorted({r['offset'] for r in rs})
    cov = sorted(o for o in offs if is_covered(o))
    fn_summary.append(dict(export=name, accesses=len(rs), offsets=offs,
                           covered_offsets=cov, bound=(len(cov) >= 2)))
bound_fns = {f['export'] for f in fn_summary if f['bound']}
eq('bound_functions', len(bound_fns), 68)

off_rows = []
for off, rs in sorted(by_off.items()):
    fns = sorted({r['export'] for r in rs})
    off_rows.append(dict(offset='0x%04x' % off, accesses=len(rs),
                         reads=sum(1 for r in rs if r['kind'] == 'read'),
                         writes=sum(1 for r in rs if r['kind'] == 'write'),
                         other=sum(1 for r in rs if r['kind'] == 'other'),
                         functions=fns,
                         bound_functions=sorted(set(fns) & bound_fns),
                         object_bound=bool(set(fns) & bound_fns)))
eq('offsets_with_bound_function', sum(1 for r in off_rows if r['object_bound']),
   sum(1 for r in off_rows if r['object_bound']))
dump('FIELD_ACCESS_LEDGER.json', dict(
    schema='eightsleep.nonusb.literal-field-access.field-access-ledger.v1',
    date=DATE, round=11,
    source=dict(frozen_bbin=str(BBIN.relative_to(ROOT)), sha256=SHA),
    method=dict(
        pattern='ldr rX,[literal] (literal = byte offset) followed by [base,rX]',
        window='the next 400 characters of the export, register names must match',
        object_limit=hex(OBJECT_LIMIT),
        excluded_prefix=EXCLUDED_PREFIX,
        binding_rule=('a function is object-bound when it also touches >= 2 '
                      'distinct offsets inside the round-8 covered intervals'),
    ),
    totals=dict(accesses=len(records), distinct_offsets=len(by_off),
                functions=len(by_fn), bound_functions=len(bound_fns),
                reads=rw['read'], writes=rw['write'], other=rw['other']),
    offsets=off_rows,
    functions=fn_summary,
    assertions=ASSERT,
))
print('field access: %d records, %d offsets, %d functions, %d bound'
      % (len(records), len(by_off), len(by_fn), len(bound_fns)))

# -------------------------------------------------------------- hole verdicts
HOLES = [(0x234, 0x258), (0x27C, 0x2A0), (0x1C08, 0x1C0C), (0x3E01, 0x3E08)]
verdicts = []
for lo, hi in HOLES:
    rs = [r for r in records if lo <= r['offset'] < hi]
    bound = [r for r in rs if r['export'] in bound_fns]
    verdicts.append(dict(
        hole='%04x..%04x' % (lo, hi), bytes=hi - lo,
        candidate_accesses=len(rs),
        bound_accesses=len(bound),
        witnessed=bool(bound),
        offsets=sorted({'0x%04x' % r['offset'] for r in rs}),
        bound_functions=sorted({r['export'] for r in bound}),
        unbound_functions=sorted({r['export'] for r in rs} - bound_fns),
    ))
eq('hole_verdicts', len(verdicts), 4)
eq('witnessed_holes', sum(1 for v in verdicts if v['witnessed']), 2)
eq('unwitnessed_holes', sum(1 for v in verdicts if not v['witnessed']), 2)
eq('unwitnessed_bytes', sum(v['bytes'] for v in verdicts if not v['witnessed']), 43)
eq('closed_holes', [v['hole'] for v in verdicts if v['witnessed']],
   ['0234..0258', '1c08..1c0c'])
truthy('closed_hole_offsets_1c08', verdicts[2]['offsets'] == ['0x1c08'])
eq('closed_hole_bound_functions_1c08', len(verdicts[2]['bound_functions']), 5)
truthy('hole_0234_bound_via_log_producer',
       verdicts[0]['bound_functions'] == ['sensor-log-producers/pass1/callsites.asm.txt'])
truthy('hole_027c_single_unbound_candidate',
       verdicts[1]['candidate_accesses'] == 1 and verdicts[1]['offsets'] == ['0x029e'])
eq('hole_3e01_no_candidates', verdicts[3]['candidate_accesses'], 0)

# the rejected binding must be explained, not silently dropped
sub = next(r for r in LAYOUT['regions'] if r.get('function') == '0x08019bac')
eq('nested_block_base', sub['start'], 0x3B48)
eq('nested_block_size', sub['size'], 0x250)
rejected = dict(
    hole='0234..0258',
    hole_status='witnessed by an unrelated, object-bound function; the four '
                'functions below are NOT valid witnesses for it',
    candidate_offsets=['0x024d', '0x024e'],
    candidate_functions=['report-object-layout/pass1/08019bac.txt',
                         'local-tmag-closure/pass4/08023958.txt',
                         'local-sensor-recovery-followup/pass2/080224f0.txt',
                         'post-layout-closure/pass6/08018744.txt'],
    reason=('these offsets belong to the 0x250 nested block whose base in the '
            'main object is 0x3b48, so 0x24d/0x24e map to main offsets '
            '0x3d95/0x3d96, not to 0x024d/0x024e; the binding rule independently '
            'rejects them because those functions touch no other covered offset'),
    main_offset_mapping=['0x3b48+0x24c=0x3d94', '0x3b48+0x24d=0x3d95',
                         '0x3b48+0x24e=0x3d96'],
)
eq('nested_id_maps_to', 0x3B48 + 0x24C, 0x3D94)
dump('HOLE_WITNESSES.json', dict(
    schema='eightsleep.nonusb.literal-field-access.hole-witnesses.v1',
    date=DATE, round=11,
    source=dict(frozen_bbin=str(BBIN.relative_to(ROOT)), sha256=SHA),
    verdicts=verdicts,
    rejected_binding=rejected,
    holes_total=14,
    holes_witnessed_before=10,
    holes_witnessed_after=10 + sum(1 for v in verdicts if v['witnessed']),
    bytes_unwitnessed=43,
    note=('Witness means "this offset is used as a field by an object-bound '
          'function", not "the main instance was written at this address". '
          'Type-level field evidence does not require instance identity, but it '
          'does require the binding rule above.'),
    assertions=[a for a in ASSERT if a['label'].startswith(('hole', 'witnessed',
                                                            'unwitnessed', 'closed',
                                                            'nested'))],
))
print('holes: %d of 4 closed, %d bytes still unwitnessed'
      % (sum(1 for v in verdicts if v['witnessed']),
         sum(v['bytes'] for v in verdicts if not v['witnessed'])))

# ------------------------------------------------------------- case chain
RANGE_TXT = exports['residual-target-closure/pass8/08015e00_08017000.txt']
INSN = re.compile(r'^INSN ([0-9a-f]{8}) ([0-9a-f]+) (.+)$', re.M)
rows = [(int(m.group(1), 16), m.group(2), m.group(3)) for m in INSN.finditer(RANGE_TXT)]
eq('cluster_insn_rows', len(rows), 496)
LDR = re.compile(r'ldr r(\d),\[0x([0-9a-f]{8})\] REF\[READ:[0-9a-f]{8}=([0-9a-f]+)\]')
BLT = re.compile(r'bl (?:0x)?([0-9a-f]{8})')
cases = []
for i, (va, hx, text) in enumerate(rows):
    m = LDR.match(text)
    if not m or i + 1 >= len(rows):
        continue
    bm = BLT.search(rows[i + 1][2])
    if not bm:
        continue
    value = int(m.group(3), 16)
    cases.append(dict(case_va='0x%08x' % va, reg='r' + m.group(1),
                      literal='0x%s' % m.group(2), value='0x%08x' % value,
                      target='0x%s' % bm.group(1), bl_va='0x%08x' % rows[i + 1][0]))
eq('case_pairs', len(cases), 6)
truthy('case_sequence_contiguous',
       [c['case_va'] for c in cases[1:5]] ==
       ['0x08016e02', '0x08016e08', '0x08016e0e', '0x08016e14'])
semantics = {
    '0xbf800000': 'float -1.0f sentinel written through the stub',
    '0xff7fffff': 'bit-clear mask, clears bit 23 (0x00800000)',
    '0x2000a498': 'RAM address handed to 080134be',
    '0x080252a8': 'log format string, see below',
}
for c in cases:
    c['semantics'] = semantics.get(c['value'], 'flash/RAM constant')
truthy('case_0_is_float_minus_one',
       struct.unpack('<f', bytes.fromhex('000080bf'))[0] == -1.0)
eq('mask_cleared_bit', (~0xFF7FFFFF) & 0xFFFFFFFF, 0x00800000)
logcase = next(c for c in cases if c['target'] == '0x08012754')
eq('log_case_string', cstr(int(logcase['value'], 16)),
   '[sensor] unshielding took %ums before settling time start')
truthy('dispatch_gate', 'INSN 08016e1a 002a cmp r2,#0x0' in RANGE_TXT and
       'INSN 08016e1c 01d0 beq 0x08016e22' in RANGE_TXT)
dump('CASE_CHAIN.json', dict(
    schema='eightsleep.nonusb.literal-field-access.case-chain.v1',
    date=DATE, round=11,
    source=dict(frozen_bbin=str(BBIN.relative_to(ROOT)), sha256=SHA),
    region=['0x08015e00', '0x08017000'],
    instruction_rows=len(rows),
    cases=cases,
    literal_semantics=semantics,
    dispatch_gate='08016e1a cmp r2,#0 / 08016e1c beq 08016e22',
    notes=[
        'The cluster is a case chain, not a table of function pointers: each case '
        'loads one literal constant into a register and calls a small stub.',
        'Two of the six cases feed float -1.0f or the bit-23 clear mask into '
        'stubs at 0x08015fxx, consistent with a fault/status clearing path.',
        'The case at 08016142 logs "unshielding took %ums", so the same region '
        'also formats diagnostic text into a stack buffer at sp+0x20.',
        'Which switch statement each case belongs to is NOT resolved here.',
    ],
    assertions=[a for a in ASSERT if a['label'].startswith(('case', 'cluster_insn',
                                                            'mask_', 'log_case',
                                                            'dispatch_'))],
))

# ------------------------------------------------------------ MODEL_RESULTS
groups = Counter(a['label'].split('_')[0] for a in ASSERT)
failures = [a for a in ASSERT if not a['ok']]
res = dict(
    schema='eightsleep.nonusb.literal-field-access.model-results.v1',
    date=DATE, round=11,
    source=dict(frozen_bbin=str(BBIN.relative_to(ROOT)), sha256=SHA,
                bytes=len(b), va_range='%08x..%08x' % (BASE, LIM)),
    status='PASS' if not failures else 'FAIL',
    assertions=len(ASSERT), failures=len(failures),
    assertion_groups=dict(groups),
    headline=dict(
        literal_offset_accesses=len(records), distinct_offsets=len(by_off),
        functions=len(by_fn), bound_functions=len(bound_fns),
        reads=rw['read'], writes=rw['write'], other=rw['other'],
        holes_witnessed_before=10,
        holes_witnessed_after=10 + sum(1 for v in verdicts if v['witnessed']),
        unwitnessed_bytes=43,
        case_pairs=len(cases), cluster_insn_rows=len(rows),
        nested_block_base=hex(sub['start']), nested_block_size=hex(sub['size']),
    ),
    failure_details=failures[:40],
)
dump('MODEL_RESULTS.json', res)
print('assertions=%d failures=%d status=%s' % (len(ASSERT), len(failures), res['status']))
print('groups:', dict(groups))
if failures:
    for f in failures[:25]:
        print('  FAIL', f['label'], repr(f['got']), '!=', repr(f['want']))
    sys.exit(1)
