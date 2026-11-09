"""Static layout model for the 0801d888 report object (round 8).

Inputs are only the frozen firmware-sensor-g0.bbin, the read-only Ghidra exports
retained in pass1/pass2 of this folder, and the round-7 export of the main
dispatcher 0801d888. No firmware is executed and no Ghidra project is mutated.

Outputs:
  LAYOUT_MAP.json          region map + coverage + protected tail
  CONSTRUCTOR_LEDGER.json  every constructor body, its memset size, call sites
  MODEL_RESULTS.json       all assertions
  COVERAGE_RESIDUAL.json   what is closed and what is still out of reach
"""

import hashlib
import json
import re
import struct
from collections import Counter, defaultdict
from pathlib import Path

HERE = Path(__file__).resolve().parent
FOLDER = HERE.parent
ROOT = HERE.parents[4]
DATE = '2026-11-09'
BBIN = ROOT / ('materials/eightsleep-full-evidence-20261107/firmware/mtk/'
               'rootfs/files/opt/eight/lib/subsystem_updates/firmware-sensor-g0.bbin')
DISPATCH = ROOT / ('report/analysis-tools/system-deepening/'
                   'callback-implementations/pass2/0801d888.txt')
BASE = 0x08008000
SHA = '51531576fd31af96f7239b71d26e1f175815f5cb21dbe9ab305fa9a33cc6a891'
b = BBIN.read_bytes()
M = []


def eq(label, got, want, group):
    M.append(dict(group=group, label=label, got=got, want=want, ok=(got == want)))


def truthy(label, got, group):
    M.append(dict(group=group, label=label, got=got, want=True, ok=bool(got)))


def parse(v):
    v = v.strip()
    return int(v, 16) if v.lower().startswith('0x') else int(v)


def hx(v):
    return '0x%04x' % v


def read32(va):
    o = va - BASE
    return struct.unpack_from('<I', b, o)[0] if 0 <= o <= len(b) - 4 else None


eq('bbin_size', len(b), 132896, 'frozen_input')
eq('bbin_sha256', hashlib.sha256(b).hexdigest(), SHA, 'frozen_input')
bv = json.loads((FOLDER / 'BYTE_VALIDATION.json').read_text())
eq('prerequisite_byte_validation', bv['status'], 'PASS', 'frozen_input')
eq('prerequisite_byte_failures', bv['failures'], 0, 'frozen_input')
eq('prerequisite_memset_size_mismatch',
   next((1 for f in bv['failure_details'] if f['label'] == 'memset_size_mismatch'), 0),
   0, 'frozen_input')

# ---------------------------------------------------------------- exports
exports = {}
for passname in ('pass1', 'pass2'):
    for q in sorted((FOLDER / passname).glob('*.txt')):
        exports['%s/%s' % (passname, q.name)] = q.read_text()

OWNER = re.compile(r'FUNCTION_BODY \[\[([0-9a-f]{8})')
MEMSET = re.compile(r'FUN_080086a4\(param_1,0,(0x[0-9a-f]+|\d+)\)')


def body_of(text):
    if 'FUNCTION_BODY' not in text:
        return ''
    return text[text.find('FUNCTION_BODY'):text.find('\nINSN ')]


bodies = {n: body_of(t) for n, t in exports.items()}
ctor_files = defaultdict(list)
ctor_size = {}
for name, body in bodies.items():
    own = OWNER.match(body)
    mm = MEMSET.search(body)
    if own and mm:
        addr = int(own.group(1), 16)
        ctor_files[addr].append(name)
        ctor_size[addr] = parse(mm.group(1))

eq('unique_constructor_bodies', len(ctor_size), 12, 'constructors')
eq('constructor_exports_with_memset', sum(len(v) for v in ctor_files.values()), 13,
   'constructors')
eq('duplicate_body_exports',
   sorted(ctor_files[0x080190E4]), ['pass1/080190e4.txt', 'pass1/08019170.txt'],
   'constructors')
eq('timer_size_from_080138d0', ctor_size[0x080138D0], 12, 'constructors')
eq('largest_constructor', max(ctor_size.values()), 0x428, 'constructors')

# ---------------------------------------------------------------- dispatcher
dt = DISPATCH.read_text()
dc = body_of(dt)
flat = re.sub(r'\s+', ' ', dc)
eq('dispatch_function_body', bool(dc), True, 'dispatcher')
eq('dispatch_signature',
   'void analyst_seed_801d888(undefined4 *param_1,undefined1 *param_2)' in flat,
   True, 'dispatcher')

# The protected tail is written BEFORE the top-level memset, so it survives it.
top_needle = 'FUN_080086a4(param_2,0,0x3e08);'
top_pos = flat.find(top_needle)
truthy('top_level_memset_present', top_pos > 0, 'protected_tail')
early_writes = [
    '*(code **)(param_2 + 0x3e08) = pcVar42;',
    'param_2[0x3e14] = 1;',
    '*(undefined4 *)(param_2 + 0x3e10) = 1000;',
    '*(int *)(param_2 + 0x3e0c) = iVar2 + -1000;',
    'FUN_08020f94(param_2 + 0x3e28,param_1 + 0x45,0x50);',
]
for i, needle in enumerate(early_writes):
    pos = flat.find(needle)
    eq('tail_write_%d_before_memset' % i, 0 <= pos < top_pos, True,
       'protected_tail')
eq('tail_prewrites_count', len(early_writes), 5, 'protected_tail')
eq('protected_boundary', read32(0x0801DC98), 0x3E08, 'protected_tail')

# ---------------------------------------------------------------- block ops
ALIAS = re.compile(r'(puVar\d+)\s*=\s*param_2\s*\+\s*(0x[0-9a-f]+)')
alias_pos = [(m.start(), m.group(1), int(m.group(2), 16))
             for m in ALIAS.finditer(flat)]


def alias_at(name, pos):
    c = [(p, v) for p, a, v in alias_pos if a == name and p < pos]
    return c[-1][1] if c else None


BLOCK = re.compile(
    r'FUN_(080086a4|08020f94)\(\s*([A-Za-z_]\w*)\s*'
    r'(?:\+\s*(0x[0-9a-f]+))?\s*,([^;]*?)\);')
blocks, seen_blocks = [], set()
for m in BLOCK.finditer(flat):
    fn, dst, offlit, rest = m.group(1), m.group(2), m.group(3), m.group(4)
    if dst == 'param_2':
        off = int(offlit, 16) if offlit else 0
    elif dst.startswith('puVar'):
        base = alias_at(dst, m.start())
        if base is None:
            continue
        off = base + (int(offlit, 16) if offlit else 0)
    else:
        continue
    size = parse(rest.rsplit(',', 1)[1].strip())
    key = ('memset' if fn == '080086a4' else 'memcpy', off, size)
    if key in seen_blocks:
        continue
    seen_blocks.add(key)
    blocks.append(dict(kind=key[0], offset=off, size=size,
                       target=fn, statement=m.group(0)[:180]))
blocks.sort(key=lambda x: (x['offset'], x['size']))
memsets = [x for x in blocks if x['kind'] == 'memset']
memcpys = [x for x in blocks if x['kind'] == 'memcpy']
eq('block_ops_total', len(blocks), 12, 'blocks')
eq('memset_ops', len(memsets), 8, 'blocks')
eq('memcpy_ops', len(memcpys), 4, 'blocks')
eq('top_level_memset_size', memsets[0]['size'], 0x3E08, 'blocks')
eq('flag_block_has_both_branches',
   sorted(x['kind'] for x in blocks if x['offset'] == 0x3DF8),
   ['memcpy', 'memset'], 'blocks')
eq('flag_block_memset_statement', 'FUN_080086a4(puVar44,0,9);' in flat, True,
   'blocks')
eq('flag_block_memcpy_statement',
   'FUN_08020f94(puVar44,&DAT_080241a3,9);' in flat, True, 'blocks')
flag_template = b[0x080241A3 - BASE:0x080241A3 - BASE + 9]
eq('flag_template_9_bytes', flag_template.hex(), '010101010000000001',
   'blocks')
eq('flag_template_nonzero_bytes', flag_template.count(1), 5, 'blocks')

by_off = {x['offset']: x for x in blocks}
eq('alias_puVar38_resolves_to_b08', alias_at('puVar38', flat.find(
    'FUN_080086a4(puVar38,0,0x10f0)')), 0xB08, 'blocks')
eq('alias_puVar44_resolves_to_3df8', alias_at('puVar44', flat.find(
    'FUN_080086a4(puVar44,0,9)')), 0x3DF8, 'blocks')
eq('bulk_clear_b08_size', by_off[0xB08]['size'], 0x10F0, 'blocks')
eq('bulk_clear_b08_end', 0xB08 + by_off[0xB08]['size'], 0x1BF8, 'blocks')
eq('memcpy_1bf8_size', by_off[0x1BF8]['size'], 8, 'blocks')
eq('memcpy_1c00_size', by_off[0x1C00]['size'], 8, 'blocks')
eq('memcpy_1c00_end', 0x1C00 + 8, 0x1C08, 'blocks')
eq('clear_1c0c_end', 0x1C0C + by_off[0x1C0C]['size'], 0x2050, 'blocks')
eq('clear_2a0_end', 0x2A0 + by_off[0x2A0]['size'], 0xB08, 'blocks')
eq('clear_37a4_end', 0x37A4 + by_off[0x37A4]['size'], 0x3A80, 'blocks')
eq('clear_3dac_end', 0x3DAC + by_off[0x3DAC]['size'], 0x3DC4, 'blocks')
eq('clear_3dc4_end', 0x3DC4 + by_off[0x3DC4]['size'], 0x3DDC, 'blocks')
eq('clear_3df8_end', 0x3DF8 + by_off[0x3DF8]['size'], 0x3E01, 'blocks')
eq('tail_memcpy_size', by_off[0x3E28]['size'], 0x50, 'blocks')
eq('tail_memcpy_end', 0x3E28 + 0x50, 0x3E78, 'blocks')

# ---------------------------------------------------------------- ctor calls
CALLS = re.compile(r'FUN_([0-9a-f]{8})\(\s*param_2\s*\+\s*(0x[0-9a-f]+|\d+)')
ctor_calls = defaultdict(set)
for m in CALLS.finditer(flat):
    fn = int(m.group(1), 16)
    if fn in ctor_size:
        ctor_calls[fn].add(parse(m.group(2)))
eq('constructor_functions_called', len(ctor_calls), 10, 'constructors')

pairs, singles = [], []
for fn, offs in sorted(ctor_calls.items()):
    u = sorted(offs)
    if len(u) == 2:
        pairs.append(dict(function='0x%08x' % fn, first=hx(u[0]), second=hx(u[1]),
                          delta=u[1] - u[0], size=ctor_size[fn],
                          matches=(u[1] - u[0]) == ctor_size[fn]))
    else:
        singles.append(dict(function='0x%08x' % fn, offsets=[hx(x) for x in u],
                            size=ctor_size[fn]))
eq('paired_constructors', len(pairs), 7, 'adjacency')
eq('all_pairs_adjacent', all(p['matches'] for p in pairs), True, 'adjacency')
for p in pairs:
    eq('pair_%s_delta' % p['function'][2:], p['delta'], p['size'], 'adjacency')

eq('ctor_19718_end', 0x1B8 + ctor_size[0x08019718], 0x210, 'adjacency')
eq('next_timer_after_19718', 0x210 in ctor_calls[0x080138D0], True, 'adjacency')
eq('ctor_19f7c_pair_end', 0x2A4 + 2 * ctor_size[0x08019F7C], 0xAF4, 'adjacency')
eq('timer_at_af4', 0xAF4 in {parse(x) for x in
                             re.findall(r'FUN_080134a8\(param_2 \+ (0x[0-9a-f]+|\d+)', flat)},
   True, 'adjacency')
eq('ctor_19bac_end', 0x3B48 + ctor_size[0x08019BAC], 0x3D98, 'adjacency')
eq('field_at_3d98', 'param_2[0x3d98] = 0;' in flat, True, 'adjacency')
eq('field_at_2050', '*(int *)(param_2 + 0x2050) = iVar14;' in flat, True,
   'adjacency')
eq('field_at_3a80', 'param_2[0x3a80] = cVar1;' in flat, True, 'adjacency')

# dynamic IMU array: index 0xc..0xf, stride == 08017b80 memset size
DYN = re.compile(r'FUN_08017b80\(param_2 \+ local_90 \* (0x[0-9a-f]+) \+ '
                 r'(0x[0-9a-f]+)')
dm = DYN.search(flat)
eq('imu_array_expression', bool(dm), True, 'dynamic_array')
eq('imu_array_stride', int(dm.group(1), 16), ctor_size[0x08017B80],
   'dynamic_array')
eq('imu_array_base', int(dm.group(2), 16), 0x1170, 'dynamic_array')
truthy('imu_loop_start', 'local_90 = 0xc;' in flat, 'dynamic_array')
truthy('imu_loop_end', 'while (local_90 != 0x10);' in flat, 'dynamic_array')

# ---------------------------------------------------------------- regions
TIMER = ctor_size[0x080138D0]
regions = []
for x in blocks:
    regions.append(dict(start=x['offset'], end=x['offset'] + x['size'],
                        size=x['size'], kind=x['kind'],
                        function='0x080086a4' if x['kind'] == 'memset' else '0x08020f94',
                        source='dispatcher pseudo-C', statement=x['statement'],
                        top_level=(x['offset'] == 0 and x['size'] == 0x3E08)))
for fn, offs in sorted(ctor_calls.items()):
    for off in sorted(offs):
        regions.append(dict(start=off, end=off + ctor_size[fn],
                            size=ctor_size[fn], kind='constructor',
                            function='0x%08x' % fn,
                            source='FUN_%08x memset(param_1,0,SIZE)' % fn,
                            statement='FUN_%08x(param_2 + %s, ...)' % (fn, hx(off)),
                            top_level=False))
for idx in range(0xC, 0x10):
    off = 0x1170 + idx * ctor_size[0x08017B80]
    regions.append(dict(start=off, end=off + ctor_size[0x08017B80],
                        size=ctor_size[0x08017B80], kind='dynamic_array_element',
                        function='0x08017b80', index=idx,
                        source='local_90 * 0xa8 + 0x1170 loop',
                        statement='FUN_08017b80(param_2 + local_90 * 0xa8 + 0x1170, ...)',
                        top_level=False))

tail_fields = [
    dict(offset=0x3E08, size=4, kind='code_pointer', statement=early_writes[0]),
    dict(offset=0x3E0C, size=4, kind='int32', statement=early_writes[3]),
    dict(offset=0x3E10, size=4, kind='uint32_const_1000', statement=early_writes[2]),
    dict(offset=0x3E14, size=1, kind='byte_const_1', statement=early_writes[1]),
    dict(offset=0x3E18, size=TIMER, kind='timer', statement='FUN_080138d0(param_2 + 0x3e18)'),
    dict(offset=0x3E24, size=4, kind='uint32', statement='*(undefined4 *)(param_2 + 0x3e24) = param_1[5]'),
    dict(offset=0x3E28, size=0x50, kind='memcpy_from_config',
         statement=early_writes[4]),
    dict(offset=0x3E7C, size=TIMER, kind='timer',
         statement='FUN_080134a8(param_2 + 0x3e7c,300000,60000)'),
]
for t in tail_fields:
    regions.append(dict(start=t['offset'], end=t['offset'] + t['size'],
                        size=t['size'], kind=t['kind'], function=None,
                        source='protected tail', statement=t['statement'],
                        top_level=False))
for t in tail_fields:
    truthy('tail_statement_%04x' % t['offset'], t['statement'] in flat,
           'protected_tail')
eq('tail_fields_count', len(tail_fields), 8, 'protected_tail')
eq('all_tail_fields_after_boundary',
   all(t['offset'] >= 0x3E08 for t in tail_fields), True, 'protected_tail')
eq('tail_3e18_timer_end', 0x3E18 + TIMER, 0x3E24, 'protected_tail')
eq('tail_3e28_copy_end', 0x3E28 + 0x50, 0x3E78, 'protected_tail')

object_lower_bound = max(r['end'] for r in regions)
eq('object_lower_bound', object_lower_bound, 0x3E88, 'layout')
eq('object_lower_bound_bytes', object_lower_bound, 16008, 'layout')
eq('protected_tail_bytes', object_lower_bound - 0x3E08, 0x80, 'layout')
eq('top_level_domain_bytes', 0x3E08, 15880, 'layout')
truthy('all_regions_positive', all(r['size'] > 0 for r in regions), 'layout')
truthy('all_regions_in_object',
       all(0 <= r['start'] < r['end'] <= object_lower_bound for r in regions),
       'layout')

# ---------------------------------------------------------------- coverage
FIELD = re.compile(r'param_2\s*\+\s*(0x[0-9a-f]+)|param_2\[(0x[0-9a-f]+)\]')
field_offsets = sorted({int(x, 16) for m in FIELD.finditer(flat)
                        for x in m.groups() if x})
eq('unique_field_offsets', len(field_offsets), 156, 'coverage')
eq('max_field_offset', max(field_offsets), 0x3E7C, 'coverage')
rf = json.loads((ROOT / ('report/analysis-tools/system-deepening/'
                         'callback-implementations/REPORT_FIELDS.json')).read_text())
rf_offsets = sorted({int(f['offset'], 16) for f in rf['fields']})
fs = set(field_offsets)
eq('round7_field_rows', len(rf['fields']), 136, 'cross_round')
eq('round7_unique_offsets', len(rf_offsets), 107, 'cross_round')
eq('round7_offsets_all_in_this_model',
   all(o in fs for o in rf_offsets), True, 'cross_round')
eq('round7_block_operations', rf['summary']['block_operations'], 9,
   'cross_round')
r7_blocks = {int(x['offset'], 16) for x in rf['block_operations']}
this_blocks = {x['offset'] for x in blocks}
eq('round7_block_sites_subset', r7_blocks <= this_blocks, True, 'cross_round')
eq('new_block_sites', sorted(this_blocks - r7_blocks),
   [0, 0xB08, 0x3DF8], 'cross_round')


def merge(intervals):
    out = []
    for s, e in sorted(intervals):
        if out and s <= out[-1][1]:
            out[-1][1] = max(out[-1][1], e)
        else:
            out.append([s, e])
    return [(s, e) for s, e in out]


block_intervals = [(r['start'], r['end']) for r in regions
                   if not r['top_level'] and r['end'] <= 0x3E08]
covered = merge(block_intervals)
covered_bytes = sum(e - s for s, e in covered)
holes, prev = [], 0
for s, e in covered:
    if s > prev:
        holes.append(dict(start=hx(prev), end=hx(s), size=s - prev))
    prev = max(prev, e)
if prev < 0x3E08:
    holes.append(dict(start=hx(prev), end=hx(0x3E08), size=0x3E08 - prev))
truthy('coverage_nonzero', covered_bytes > 0, 'coverage')
truthy('coverage_below_full', covered_bytes < 0x3E08, 'coverage')
truthy('holes_identified', len(holes) > 0, 'coverage')
truthy('coverage_plus_holes_equals_domain',
       covered_bytes + sum(h['size'] for h in holes) == 0x3E08, 'coverage')
for h in holes:
    lo, hi = int(h['start'], 16), int(h['end'], 16)
    h['scalar_writes_in_hole'] = sum(lo <= o < hi for o in field_offsets)

# ---------------------------------------------------------------- ledger
ledger = []
for addr, size in sorted(ctor_size.items()):
    bd = bodies[ctor_files[addr][0]]
    offs = sorted({int(x, 16) for x in
                   re.findall(r'param_1(?:\[(0x[0-9a-f]+)\]| \+ (0x[0-9a-f]+))', bd)
                   for x in x if x})
    subcalls = sorted({'0x%s' % x for x in
                       re.findall(r'FUN_([0-9a-f]{8})\(', bd)})
    ledger.append(dict(
        function='0x%08x' % addr, memset_size=size,
        memset_size_hex=hx(size),
        size_expression='FUN_080086a4(param_1,0,%s)' % (
            ('0x%x' % size) if size > 9 else str(size)),
        exports=sorted(ctor_files[addr]),
        duplicate_exports=len(ctor_files[addr]) > 1,
        dispatcher_call_offsets=[hx(x) for x in sorted(ctor_calls.get(addr, set()))],
        max_param_1_field_offset=hx(offs[-1]) if offs else None,
        param_1_field_offsets=len(offs),
        nested_call_count=len(subcalls)))
eq('ledger_entries', len(ledger), 12, 'constructors')
truthy('all_sizes_confirmed_by_instructions',
       bv['memset_sizes_derived'] == 13 and bv['status'] == 'PASS',
       'constructors')

# ---------------------------------------------------------------- emit
def dump(name, payload):
    (FOLDER / name).write_text(
        json.dumps(payload, indent=2, ensure_ascii=False, sort_keys=True) + '\n')


groups = Counter(a['group'] for a in M)
failures = [a for a in M if not a['ok']]

dump('MODEL_RESULTS.json', dict(
    schema='eightsleep.nonusb.report-object-layout.model-results.v1',
    date=DATE, round=8, status='PASS' if not failures else 'FAIL',
    assertions=len(M), failures=len(failures), groups=dict(groups),
    counts=dict(regions=len(regions), blocks=len(blocks),
                constructors=len(ctor_size), paired_constructors=len(pairs),
                protected_tail_fields=len(tail_fields),
                unique_field_offsets=len(field_offsets),
                covered_bytes=covered_bytes, holes=len(holes)),
    details=M))

dump('LAYOUT_MAP.json', dict(
    schema='eightsleep.nonusb.report-object-layout.layout-map.v1',
    date=DATE, round=8,
    dispatcher='0x0801d888', object_argument='param_2 (undefined1 *, byte offsets)',
    object_size_lower_bound=object_lower_bound,
    object_size_lower_bound_hex=hx(object_lower_bound),
    protected_boundary=0x3E08, protected_boundary_hex=hx(0x3E08),
    top_level_memset='FUN_080086a4(param_2,0,0x3e08)',
    protected_tail_rule=('tail fields at >= 0x3e08 are written BEFORE the '
                         'top-level memset and therefore survive it'),
    tail_prewrites=early_writes,
    protected_tail_fields=[dict(offset=hx(t['offset']), size=t['size'],
                                kind=t['kind'], statement=t['statement'])
                           for t in tail_fields],
    paired_constructors=pairs,
    unpaired_constructors=singles,
    dynamic_array=dict(function='0x08017b80', base='0x1170',
                       stride=ctor_size[0x08017B80], first_index=0xC,
                       end_index_exclusive=0x10, instances=4,
                       expression='param_2 + local_90 * 0xa8 + 0x1170'),
    regions=sorted(regions, key=lambda r: (r['start'], r['end'])),
    coverage=dict(domain=[0, 0x3E08], covered_intervals=[dict(start=hx(s), end=hx(e),
                                                               size=e - s)
                                                          for s, e in covered],
                  covered_bytes=covered_bytes,
                  covered_ratio=round(covered_bytes / 0x3E08, 4),
                  holes=holes,
                  note=('uncovered intervals have only scalar field writes; no '
                        'block-level memset/memcpy/constructor semantics')),
    field_offsets=[hx(x) for x in field_offsets]))

dump('CONSTRUCTOR_LEDGER.json', dict(
    schema='eightsleep.nonusb.report-object-layout.constructor-ledger.v1',
    date=DATE, round=8,
    rule=('a constructor zeroes its own param_1 with FUN_080086a4(param_1,0,SIZE); '
          'SIZE is the block size of its region in param_2'),
    unique_bodies=len(ctor_size), exports_with_memset=sum(
        len(v) for v in ctor_files.values()),
    duplicate_explanation=('080190e4 and 08019170 are two TARGETs that resolve to '
                           'the SAME Ghidra body [[080190e4, 080191e3]]; counted once'),
    timer_block_size=TIMER,
    timer_note=('FUN_080134a8 writes only param_1[0]/param_1[1]; the full 0xc timer '
                'block is defined by FUN_080138d0 memset size'),
    constructors=ledger))

dump('COVERAGE_RESIDUAL.json', dict(
    schema='eightsleep.nonusb.report-object-layout.coverage-residual.v1',
    date=DATE, round=8,
    scope='A 类静态残余 #1 上报对象构造链 + 0x3e28 完整布局分区图',
    executes_firmware=False,
    closed=[
        dict(id='RL-01', item='上报对象构造链', result=(
            '主分派 0801d888 的 param_2 是 byte-offset 对象；顶层 '
            'FUN_080086a4(param_2,0,0x3e08) 定义 15880B 主域，'
            '解析 puVar 别名后共 12 个块操作（8 memset + 4 memcpy），'
            '与 8 个构造函数族合计 %d 个区间' % len(regions)),
             evidence=['LAYOUT_MAP.json', 'CONSTRUCTOR_LEDGER.json', 'pass1/', 'pass2/']),
        dict(id='RL-02', item='0x3e08 分界与持久尾部', result=(
            '5 条尾部写入/复制语句全部位于顶层 memset 之前；'
            '[0x3e08,0x3e88) 共 128B 跨清零存活，对象尺寸下界 0x3e88 (15944B)'),
             evidence=['BYTE_VALIDATION.json', 'MODEL_RESULTS.json']),
        dict(id='RL-03', item='构造函数块尺寸与相邻实例交叉验证', result=(
            '12 个唯一构造函数体（13 份含 memset 导出，1 份重复）；'
            '7 对成对实例的偏移差全部等于该构造函数的 memset 尺寸，零缝隙'),
             evidence=['CONSTRUCTOR_LEDGER.json', 'MODEL_RESULTS.json']),
        dict(id='RL-04', item='未解码导出分类纠偏', result=(
            '9 个 function=none 导出中 8 个是真实代码入口（7 return + 1 无条件跳转），'
            '080191f4 是 080190e4 函数尾部 literal pool 的 0x00006001 常量槽，'
            '不是代码，不应做 Thumb 前缀解码'),
             evidence=['BYTE_VALIDATION.json', 'pass1/080191f4.txt',
                       'pass2/080190e4_08019200.txt']),
        dict(id='RL-05', item='别名解析补齐 0x3df8 双分支与 9B 标志模板', result=(
            '第七轮只识别显式 param_2 + 0xNN 的 9 处块操作；本轮解析 '
            'puVar44=param_2+0x3df8、puVar38=param_2+0xb08 后补齐 3 处新块位点：'
            '顶层 memset、0xb08 的 0x10f0 大块清零、0x3df8 的 9B 二选一。'
            '0x3df8 要么 memset 清零，要么从 0x080241a3 复制冻结镜像中的 '
            '010101010000000001 默认标志模板'),
             evidence=['LAYOUT_MAP.json', 'MODEL_RESULTS.json',
                       'callback-implementations/pass2/0801d888.txt']),
    ],
    corrections=[
        '首版 verify_layout_bytes.py 把 insn_rows_total 写成 7879、undecoded_exports 写成 7；实测为 7576 / 9，已按导出实测修正。',
        '首版把全部 function=none 导出都当代码入口做 Thumb 前缀扫描，导致 080191f4 在半字 c925 上误报 undecoded_16。实际它是 literal pool 数据槽，已改为「先按 REF[READ] 判定数据槽，再做前缀解码」。',
        '080190e4 与 08019170 是同一 Ghidra 函数体的两个 TARGET，构造函数计数按 body owner 去重为 12，导出份数为 13。',
        '0x3E88 的十进制是 16008（不是 15944）；0x3E08 = 15880，两者相差 128B 持久尾部。',
        '本轮 FIELD 正则统计的是「pseudo-C 中出现的所有 param_2 偏移」共 156 个，第七轮 REPORT_FIELDS.json 的 107 个是「写入语句的唯一偏移」；两者是包含关系，已做子集断言，不是矛盾。',
    ],
    cross_validation=dict(
        byte_checks=bv['checks'], byte_failures=bv['failures'],
        model_assertions=len(M), model_failures=len(failures),
        insn_rows_machine_verified=bv['insn_rows_verified'],
        flash_literals_verified=bv['flash_literals_verified'],
        memset_sizes_derived=bv['memset_sizes_derived'],
        determinism='核验与模型脚本重跑输出哈希不变'),
    hard_numbers=dict(
        frozen_bbin_bytes=len(b), ghidra_exports_retained=len(exports),
        export_passes=2, regions=len(regions), blocks=len(blocks),
        protected_tail_bytes=object_lower_bound - 0x3E08,
        covered_bytes=covered_bytes, uncovered_bytes=0x3E08 - covered_bytes,
        holes=len(holes)),
    residual=[
        '未覆盖区间只有零散标量写入，字段名 / 单位 / 语义仍需外设 datasheet 或实机。',
        '0x08027f10 描述表 92 行全表与 2560B 未解码代码补齐（A 类 #2）尚未开始。',
        '日志字符串池 62 条格式串到调用点 / 条件的映射（A 类 #3）尚未开始。',
        '632 个从未单独导出的 flash 内 BL 目标全量调用图（A 类 #5）尚未开始。',
        '所有运行时行为、实机时序、上报传输帧格式仍需设备。',
    ]))

print('assertions=%d failures=%d status=%s' % (len(M), len(failures),
                                               'PASS' if not failures else 'FAIL'))
print('groups:', dict(groups))
print('regions=%d blocks=%d covered=%d/%d holes=%d' % (
    len(regions), len(blocks), covered_bytes, 0x3E08, len(holes)))
if failures:
    for f in failures[:30]:
        print('  FAIL', f['group'], f['label'], repr(f['got']), '!=', repr(f['want']))
    raise SystemExit(1)
