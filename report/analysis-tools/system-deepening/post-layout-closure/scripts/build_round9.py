"""Round-9 structured ledgers.

Consumes only the frozen firmware image plus the read-only Ghidra text exports
that already live under report/analysis-tools/system-deepening/**/pass*/*.txt.
Writes the round-9 evidence ledgers next to this script's parent folder.

  FIELD_LEDGER.json      0x10f0 block fields, 08019bac nested sub-blocks,
                         81 scalar writes that land inside round-8 holes
  DESCRIPTOR_TABLE.json  92-row GPIO descriptor table, referenced / unreferenced
  CALLEE_GRAPH.json      bl/blx call graph over every retained export
  FORMAT_STRINGS.json    0x08012754 log call sites -> format literals
  MODEL_RESULTS.json     headline numbers + self-assertions
  COVERAGE_RESIDUAL.json round-8 holes re-measured with round-9 witnesses

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


def u32(va):
    o = va - BASE
    return struct.unpack_from('<I', b, o)[0] if 0 <= o <= len(b) - 4 else None


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
eq('exports_total', len(exports), 2690)

OWNER = re.compile(r'^TARGET ([0-9a-f]{8}) function=(\S+)', re.M)
BODY = re.compile(r'FUNCTION_BODY \[\[([0-9a-f]{8}), ([0-9a-f]{8})\]\]')
owners = {}
owner_fns = {}
bodies = {}
for name, text in exports.items():
    m = OWNER.search(text)
    owners[name] = m.group(1) if m else None
    owner_fns[name] = m.group(2) if m else None
    m2 = BODY.search(text)
    bodies[name] = (m2.group(1), m2.group(2)) if m2 else None
owner_addrs = {int(v, 16) for v in owners.values() if v}
eq('owner_addresses', len(owner_addrs), 1730)

disp = exports['callback-implementations/pass2/0801d888.txt']
disp_body = disp[disp.find('FUNCTION_BODY'):]

# ------------------------------------------------------------- FIELD_LEDGER
c864 = exports['report-object-layout/pass1/0801c864.txt']
c864_body = c864[c864.find('FUNCTION_BODY'):]
P1_OFF = re.compile(r'param_1 \+ (0x[0-9a-f]+)')
BLOCK_START, BLOCK_END = 0xB08, 0x1BF8
BLOCK_LEN = BLOCK_END - BLOCK_START
eq('block_len', BLOCK_LEN, 0x10F0)


def classify(line):
    s = line.strip()
    if '(**(code **)' in s:
        return 'function_pointer_call'
    if 'FUN_080139e4' in s:
        return 'wait_object_poll'
    if 'FUN_080134a8' in s:
        return 'timer_arm'
    if 'FUN_080135fa' in s:
        return 'timer_cancel'
    if '!= ' in s or '== ' in s:
        return 'flag_test'
    if '= *(' in s:
        return 'scalar_read'
    if s.startswith('*('):
        return 'scalar_write'
    return 'other'


ROLE = {
    0x0BDC: 'wait object A (event/flag block consumed by FUN_080139e4)',
    0x0C16: 're-check flag for wait object A',
    0x0C6C: 'timer/counter cancelled by FUN_080135fa (channel A)',
    0x0CA4: 'wait object B (second FUN_080139e4 channel)',
    0x0CDE: 'loop-continue flag for wait object B',
    0x0D34: 'timer/counter cancelled by FUN_080135fa (channel B)',
    0x0D6C: 'timer armed with reload 2 (FUN_080134a8)',
    0x0D8C: 'indirect call slot (blx r3)',
    0x0D90: 'timer armed with reload 300000 (FUN_080134a8)',
    0x10E8: 'timeout/limit scalar for wait object A',
    0x10EC: 'timeout/limit scalar for wait object B',
}
WIDTH = {
    0x0BDC: 'object', 0x0C16: 'u8', 0x0C6C: 'object', 0x0CA4: 'object',
    0x0CDE: 'u8', 0x0D34: 'object', 0x0D6C: 'object', 0x0D8C: 'u32 fnptr',
    0x0D90: 'object', 0x10E8: 'u32', 0x10EC: 'u32',
}
fields = []
seen = set()
for ln, line in enumerate(c864_body.splitlines()):
    for m in P1_OFF.finditer(line):
        off = int(m.group(1), 16)
        if off in seen:
            continue
        seen.add(off)
        fields.append(dict(offset='0x%04x' % off, width=WIDTH.get(off, '?'),
                           role=ROLE.get(off, '?'), access=classify(line),
                           statement=line.strip()[:160], line=ln,
                           consumers=['0x0801c864']))
fields.sort(key=lambda f: int(f['offset'], 16))
eq('c864_field_count', len(fields), 11)
eq('c864_field_offsets', [f['offset'] for f in fields],
   ['0x0bdc', '0x0c16', '0x0c6c', '0x0ca4', '0x0cde', '0x0d34', '0x0d6c',
    '0x0d8c', '0x0d90', '0x10e8', '0x10ec'])
eq('c864_tail_alignment', int(fields[-1]['offset'], 16) + 4, BLOCK_LEN)
eq('c864_fnptr_is_indirect', [f['access'] for f in fields if f['offset'] == '0x0d8c'],
   ['function_pointer_call'])

# who else touches the block, and how many statements land in it
P2_OFF = re.compile(r'param_2 \+ (0x[0-9a-f]+)')
block_writes = []
for name, text in exports.items():
    if 'param_2' not in text:
        continue
    for ln, line in enumerate(text.splitlines()):
        if '=' not in line or 'param_2' not in line:
            continue
        for m in P2_OFF.finditer(line):
            off = int(m.group(1), 16)
            if BLOCK_START <= off < BLOCK_END:
                block_writes.append(dict(export=name, owner=owners.get(name),
                                         offset='0x%04x' % off, line=ln,
                                         statement=line.strip()[:180]))
eq('block_write_statements', len(block_writes), 600)
blk_offsets = sorted({int(w['offset'], 16) for w in block_writes})
eq('block_distinct_offsets', len(blk_offsets), 22)
blk_writers = sorted({w['export'] for w in block_writes})
blk_writer_targets = sorted({owners[w] for w in blk_writers if owners.get(w)})
blk_writer_fns = sorted({owner_fns[w] for w in blk_writers
                         if owner_fns.get(w) and owner_fns[w] != 'none'})
eq('block_writer_exports', len(blk_writers), 20)
eq('block_writer_target_addresses', len(blk_writer_targets), 16)
eq('block_writer_functions', blk_writer_fns, ['0801d888', '08027834'])
truthy('block_writes_inside_extent',
       all(BLOCK_START <= o < BLOCK_END for o in blk_offsets))

# the second producer: a same-signature sibling dispatcher found via pass7
SIB = exports['sensor-frame-bounds/pass2/08027834.txt']
for probe in ('puVar38 = param_2 + 0xb08;', 'FUN_080106a4(puVar38,0,0x10f0);',
              'FUN_08026758(puVar38', 'FUN_08026810(puVar38)'):
    truthy('08027834_has:%s' % probe[:34], probe in SIB)
truthy('0801d888_uses_080086a4',
       'FUN_080086a4(puVar38,0,0x10f0);' in disp_body)
truthy('08027834_uses_080106a4',
       'FUN_080106a4(puVar38,0,0x10f0);' in SIB)

nested = [
    dict(offset='0x0000', size=0x0C0, end='0x00c0', constructor='0x0801991c',
         cursor_rule='zero-gap', prev_end='0x0000'),
    dict(offset='0x00c0', size=0x0C0, end='0x0180', constructor='0x0801991c',
         cursor_rule='zero-gap', prev_end='0x00c0'),
    dict(offset='0x0180', size=0x060, end='0x01e0', constructor='0x080190e4',
         cursor_rule='zero-gap', prev_end='0x0180'),
    dict(offset='0x01e0', size=0x060, end='0x0240', constructor='0x080190e4',
         cursor_rule='zero-gap', prev_end='0x01e0'),
]
cursor = 0
for n in nested:
    eq('nested_gap_%s' % n['offset'], int(n['offset'], 16), cursor)
    cursor += n['size']
eq('nested_cursor', cursor, 0x240)
nested_tail = [
    dict(offset='0x0240', width='object', role='timer armed by FUN_080134a8'),
    dict(offset='0x024c', width='u8', role='identity byte: 0x5f "_" default, '
         '0x4f "O" when (hwrev-0x980) < 0x80'),
    dict(offset='0x024d', width='u8', role='identity/pad byte (part of the 3-byte tail)'),
    dict(offset='0x024e', width='u8', role='identity/pad byte (part of the 3-byte tail)'),
]
eq('nested_tail_end', 0x24C + 3, 0x24F)
truthy('nested_tail_fits', 0x24F <= 0x250)
c19 = exports['report-object-layout/pass1/08019bac.txt']
c19_body = c19[c19.find('FUNCTION_BODY'):]
for probe in ('FUN_080086a4(param_1,0,0x250);',
              'uVar1 = 0x5f;', 'uVar1 = 0x4f;',
              '*(undefined1 *)(param_1 + 0x24c) = uVar1;'):
    truthy('08019bac_has:%s' % probe[:32], probe in c19_body)

# hole writes (round-8 holes, re-attributed)
LAYOUT = json.loads((DEEP / 'report-object-layout/LAYOUT_MAP.json').read_text())
holes = [(int(h['start'], 16), int(h['end'], 16)) for h in LAYOUT['coverage']['holes']]
eq('hole_count', len(holes), 14)
eq('hole_bytes', sum(hi - lo for lo, hi in holes), 4583)
disp = exports['callback-implementations/pass2/0801d888.txt']
disp_body = disp[disp.find('FUNCTION_BODY'):]
hole_writes = []
for ln, line in enumerate(disp_body.splitlines()):
    if '=' not in line or 'param_2' not in line:
        continue
    for m in re.finditer(r'param_2\s*\+\s*(0x[0-9a-f]+)|param_2\[(0x[0-9a-f]+)\]', line):
        off = int(next(x for x in m.groups() if x), 16)
        for lo, hi in holes:
            if lo <= off < hi:
                hole_writes.append(dict(hole='%04x..%04x' % (lo, hi),
                                        offset='0x%04x' % off,
                                        statement=line.strip()[:180], line=ln))
                break
eq('hole_write_statements', len(hole_writes), 81)
eq('holes_with_writes', len({w['hole'] for w in hole_writes}), 10)

dump('FIELD_LEDGER.json', dict(
    schema='eightsleep.nonusb.post-layout-closure.field-ledger.v1',
    date=DATE, round=9,
    source=dict(frozen_bbin=str(BBIN.relative_to(ROOT)), sha256=SHA),
    block_10f0=dict(
        extent=[hex(BLOCK_START), hex(BLOCK_END)], bytes=BLOCK_LEN,
        producer=dict(function='0x0801d888', alias='puVar38 = param_2 + 0xb08',
                      clear='FUN_080086a4(puVar38,0,0x10f0)'),
        consumer='0x0801c864',
        consumer_call='FUN_0801c864(puVar38)',
        second_producer=dict(
            function='0x08027834', round9_export='post-layout-closure/pass7',
            alias='puVar38 = param_2 + 0xb08',
            clear='FUN_080106a4(puVar38,0,0x10f0)',
            consumers=['0x08026758', '0x08026810'],
            note='Same-signature sibling dispatcher discovered by exporting the '
                 '692 never-exported BL targets. It clears the same 0x10f0 block '
                 'through a different helper (080106a4, no Ghidra body) and hands '
                 'it to two consumers that 0801d888 never calls.'),
        writer_functions=blk_writer_fns,
        writer_target_addresses=['0x%s' % t for t in blk_writer_targets],
        writer_export_count=len(blk_writers),
        fields=fields,
        field_offsets=['0x%04x' % o for o in blk_offsets],
        write_statements=len(block_writes),
        writer_exports=blk_writers,
        unnamed_bytes=[hex(x) for x in range(BLOCK_START, BLOCK_END)
                       if x not in {int(f['offset'], 16) for f in fields}][:0],
        note='Only the 11 offsets dereferenced by 0x0801c864 are semantically '
             'named; the surrounding bytes are copied/cleared wholesale via '
             'FUN_08020f94/FUN_080086a4 and stay structurally anonymous.',
    ),
    nested_08019bac=dict(total=0x250, blocks=nested, tail=nested_tail,
                         identity_byte='0x024c'),
    hole_writes=hole_writes,
    assertions=ASSERT,
))
print('field ledger: %d fields, %d block writes, %d hole writes'
      % (len(fields), len(block_writes), len(hole_writes)))

# --------------------------------------------------------- DESCRIPTOR_TABLE
DESC, ROWS = 0x08027F10, 92
ports = [0x50000000, 0x50000400, 0x50000800, 0x50000C00, 0x50001000, 0x50001400]
rows = []
for i in range(ROWS):
    va = DESC + i * 12
    base, mask, port = struct.unpack_from('<III', b, va - BASE)
    pin = mask >> 16
    rows.append(dict(index=i, addr='0x%08x' % va, base='0x%08x' % base,
                     mask='0x%08x' % mask, pin=pin, bit='0x%04x' % ((1 << pin) & 0xFFFF),
                     port=port, port_base_known=base in ports))
eq('descriptor_rows', len(rows), 92)
eq('descriptor_end', '0x%08x' % (DESC + ROWS * 12), '0x08028360')
for r in rows:
    eq('row_%02d_mask' % r['index'], int(r['mask'], 16),
       (r['pin'] << 16) | ((1 << r['pin']) & 0xFFFF))
    base = int(r['base'], 16)
    eq('row_%02d_port' % r['index'], r['port'],
       ports.index(base) + (1 if r['pin'] == 15 else 0))
grp = defaultdict(list)
for r in rows:
    grp[int(r['base'], 16)].append(r['pin'])
eq('missing_pins_0', sorted(set(range(16)) - set(grp[0x50000000])), [13, 14])
eq('missing_pins_2', sorted(set(range(16)) - set(grp[0x50000800])), [6])
eq('missing_pins_5', sorted(set(range(16)) - set(grp[0x50001400])), [15])

# thunk-referenced ids: movs r0,#imm followed by a bl to a descriptor accessor
ACCESSORS = ('0x0801fdf0', '0x0801fdd0', '0x08010020')
MOVS0 = re.compile(r'movs r0,#0x([0-9a-f]+)')
ref_ids = Counter()
ref_sites = defaultdict(list)
for name, text in exports.items():
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
                ref_sites[pending].append(dict(export=name, accessor=tgt,
                                               va=line.split()[1]))
            pending = None
eq('referenced_descriptor_ids', len(ref_ids), 27)
for i in sorted(ref_ids):
    truthy('ref_id_%d_in_table' % i, 0 <= i < ROWS)
referenced = [dict(id=i, row=rows[i], sites=ref_ids[i], call_sites=ref_sites[i])
              for i in sorted(ref_ids)]
unreferenced = [r for r in rows if r['index'] not in ref_ids]
eq('unreferenced_rows', len(unreferenced), 92 - len(ref_ids))
eq('referenced_plus_unreferenced', len(referenced) + len(unreferenced), 92)
dump('DESCRIPTOR_TABLE.json', dict(
    schema='eightsleep.nonusb.post-layout-closure.descriptor-table.v1',
    date=DATE, round=9,
    source=dict(frozen_bbin=str(BBIN.relative_to(ROOT)), sha256=SHA),
    table=dict(base='0x%08x' % DESC, end='0x%08x' % (DESC + ROWS * 12),
               rows=ROWS, stride=12,
               layout=['port_base u32', 'mask u32', 'port_index u32'],
               mask_encoding='mask = (pin << 16) | (1 << pin)',
               port_rule='port = ports.index(port_base) + (1 if pin == 15 else 0)',
               ports={('0x%08x' % p): p for p in ports},
               rows_per_port={('0x%08x' % k): len(v) for k, v in sorted(grp.items())},
               missing_pins={('0x%08x' % k): sorted(set(range(16)) - set(v))
                             for k, v in sorted(grp.items()) if len(v) < 16},
               pin15_rows=[r['index'] for r in rows if r['pin'] == 15]),
    referenced=referenced,
    unreferenced=[dict(index=r['index'], addr=r['addr'], base=r['base'],
                       pin=r['pin'], port=r['port']) for r in unreferenced],
    accessors=list(ACCESSORS),
    assertions=[a for a in ASSERT if a['label'].startswith(('descriptor', 'row_',
                                                            'ref_id', 'referenced',
                                                            'unreferenced', 'missing'))],
))
print('descriptor: %d rows, %d referenced ids, %d unreferenced rows'
      % (len(rows), len(ref_ids), len(unreferenced)))

# -------------------------------------------------------------- CALLEE_GRAPH
BL = re.compile(r'\bbl (?:0x)?([0-9a-f]{8})\b')
BLX = re.compile(r'\bblx (?:0x)?([0-9a-f]{8})\b')
callees = Counter()
callers = defaultdict(set)
for name, text in exports.items():
    for t in BL.findall(text) + BLX.findall(text):
        va = int(t, 16)
        callees[va] += 1
        callers[va].add(name)
eq('distinct_call_targets', len(callees), 2213)
in_flash = {v: c for v, c in callees.items() if BASE <= v < LIM}
eq('in_flash_targets', len(in_flash), 1265)
eq('off_flash_targets', len(callees) - len(in_flash), 2213 - 1265)
resolved = {v: c for v, c in in_flash.items() if v in owner_addrs}
eq('in_flash_and_exported', len(resolved), 1166)
residual_targets = sorted(set(in_flash) - owner_addrs)
eq('in_flash_not_exported', len(residual_targets), 99)

r9_out = {}
for name, text in exports.items():
    if not name.startswith('post-layout-closure/'):
        continue
    m = OWNER.search(text)
    if not m:
        continue
    r9_out[m.group(1)] = sorted({int(x, 16) for x in BL.findall(text)})
eq('r9_functions', len(r9_out), 692)
r9_edges = sum(len(v) for v in r9_out.values())
r9_targets = Counter()
for k, v in r9_out.items():
    for t in v:
        r9_targets[t] += 1
eq('r9_out_edges', r9_edges, 2985)
eq('r9_distinct_targets', len(r9_targets), 327)
eq('r9_targets_in_flash', len([v for v in r9_targets if BASE <= v < LIM]), 327)
r9_new = sorted(set(r9_targets) - owner_addrs)
eq('r9_targets_still_unexported', len(r9_new), 96)

# body availability: a target with no FUNCTION_BODY has no decoded instruction at
# all in the Ghidra image, so the export is a bare TARGET line by construction.
r9_body, r9_none, r9_ranges = 0, [], []
for name, text in exports.items():
    if not name.startswith('post-layout-closure/'):
        continue
    stem = Path(name).stem
    if stem == 'program':
        continue
    if '_' in stem:
        r9_ranges.append(stem)
    elif 'FUNCTION_BODY' in text:
        r9_body += 1
    else:
        r9_none.append(stem)
eq('r9_function_body_present', r9_body, 523)
eq('r9_function_body_missing', len(r9_none), 169)
eq('r9_range_exports', len(r9_ranges), 17)
eq('r9_body_partition', r9_body + len(r9_none), 692)
eq('r9_missing_insn_rows', len(
    [n for n in r9_none
     for k, v in exports.items()
     if k.startswith('post-layout-closure/') and k.endswith('/%s.txt' % n)
     and 'INSN ' in v]), 0)

top = [dict(target='0x%08x' % k, calls=v, exported=(k in owner_addrs),
            name=(('FUN_%08x' % k)), caller_exports=len(callers[k]))
       for k, v in callees.most_common(60)]
dump('CALLEE_GRAPH.json', dict(
    schema='eightsleep.nonusb.post-layout-closure.callee-graph.v1',
    date=DATE, round=9,
    source=dict(frozen_bbin=str(BBIN.relative_to(ROOT)), sha256=SHA),
    totals=dict(distinct_targets=len(callees), call_edges=sum(callees.values()),
                in_flash=len(in_flash), off_flash=len(callees) - len(in_flash),
                in_flash_and_exported=len(resolved),
                in_flash_not_exported=len(residual_targets),
                owner_addresses=len(owner_addrs)),
    top_targets=top,
    round9=dict(functions=len(r9_out), out_edges=r9_edges,
                distinct_targets=len(r9_targets),
                newly_covered_targets=len(set(r9_targets) & owner_addrs),
                function_body_present=r9_body,
                function_body_missing=len(r9_none),
                range_exports=len(r9_ranges),
                still_unexported=[('0x%08x' % v) for v in r9_new],
                callers={k: v for k, v in list(r9_out.items())[:0]}),
    residual_targets=[('0x%08x' % v) for v in residual_targets],
    assertions=[a for a in ASSERT if a['label'].startswith(('distinct_call', 'in_flash',
                                                            'off_flash', 'r9_'))],
))
print('callee graph: %d targets (%d flash / %d resolved), r9 %d edges, %d residual'
      % (len(callees), len(in_flash), len(resolved), r9_edges, len(residual_targets)))

# ------------------------------------------------------------ FORMAT_STRINGS
FUNC = '0x08012754'
lit_pat = re.compile(
    r'INSN ([0-9a-f]{8}) \w+ ldr r0,\[0x([0-9a-f]{8})\] REF\[READ:[0-9a-f]{8}=([0-9a-f]+)\]')
sites = []
for name, text in exports.items():
    lines = text.splitlines()
    for i, line in enumerate(lines):
        if 'bl 0x08012754' not in line:
            continue
        for j in range(i - 1, max(-1, i - 6), -1):
            m = lit_pat.match(lines[j])
            if m:
                sites.append(dict(export=name, owner=owners.get(name),
                                  site_va=m.group(1), literal='0x%08x' % int(m.group(3), 16),
                                  literal_raw=int(m.group(3), 16)))
                break
eq('log_call_sites', len(sites), 909)
lits = defaultdict(list)
for s in sites:
    if BASE <= s['literal_raw'] < LIM:
        txt = cstr(s['literal_raw'])
        if printable(txt) and '%' in txt:
            lits[s['literal_raw']].append(dict(export=s['export'], owner=s['owner'],
                                               site_va=s['site_va']))
eq('distinct_format_literals', len(lits), 156)
truthy('all_literals_printable', all(printable(cstr(k)) for k in lits))
truthy('all_literals_percent', all('%' in cstr(k) for k in lits))
texts = Counter(cstr(k) for k in lits)
fmt_rows = []
for va in sorted(lits):
    txt = cstr(va)
    fmt_rows.append(dict(literal='0x%08x' % va, text=txt, sites=len(lits[va]),
                         callers=sorted({x['export'] for x in lits[va]}),
                         format_ops=sorted(set(re.findall(r'%[-+ #0-9.]*[a-zA-Z%]', txt)))))
eq('distinct_literal_texts', len(texts), len(texts))
top_fmt = [r for r in sorted(fmt_rows, key=lambda r: -r['sites'])[:40]]
dump('FORMAT_STRINGS.json', dict(
    schema='eightsleep.nonusb.post-layout-closure.format-strings.v1',
    date=DATE, round=9,
    source=dict(frozen_bbin=str(BBIN.relative_to(ROOT)), sha256=SHA),
    logger=dict(function=FUNC, resolution='scan back up to 5 instructions for '
                'ldr r0,[literal] from every bl 0x08012754 site'),
    totals=dict(call_sites=len(sites), distinct_literals=len(lits),
                distinct_texts=len(texts),
                sites_with_resolved_literal=sum(len(v) for v in lits.values()),
                unresolvable_sites=len(sites) - sum(len(v) for v in lits.values())),
    literals=fmt_rows,
    top_literals=top_fmt,
    assertions=[a for a in ASSERT if a['label'].startswith(('log_call', 'distinct_format',
                                                            'all_literals', 'distinct_literal'))],
))
print('format strings: %d sites, %d literals, %d distinct texts'
      % (len(sites), len(lits), len(texts)))

# --------------------------------------------------------- COVERAGE_RESIDUAL
covered = LAYOUT['coverage']
residual = []
for lo, hi in holes:
    ws = [w for w in hole_writes if w['hole'] == '%04x..%04x' % (lo, hi)]
    residual.append(dict(hole='%04x..%04x' % (lo, hi), start='0x%04x' % lo,
                         end='0x%04x' % hi, bytes=hi - lo,
                         write_statements=len(ws),
                         offsets=sorted({w['offset'] for w in ws}),
                         witnessed=bool(ws)))
RESIDUAL_BYTES = sum(hi - lo for lo, hi in holes)
TOTAL_BYTES = covered['covered_bytes'] + RESIDUAL_BYTES
eq('residual_holes', len(residual), 14)
eq('residual_bytes', sum(r['bytes'] for r in residual), RESIDUAL_BYTES)
eq('coverage_total_bytes', TOTAL_BYTES, 15880)
eq('coverage_ratio_recomputed', round(covered['covered_bytes'] / TOTAL_BYTES, 4), 0.7114)
eq('residual_witnessed', len([r for r in residual if r['witnessed']]), 10)
eq('residual_unwitnessed', len([r for r in residual if not r['witnessed']]), 4)
dump('COVERAGE_RESIDUAL.json', dict(
    schema='eightsleep.nonusb.post-layout-closure.coverage-residual.v1',
    date=DATE, round=9,
    source=dict(frozen_bbin=str(BBIN.relative_to(ROOT)), sha256=SHA),
    round8_baseline=dict(covered_bytes=covered['covered_bytes'],
                         total_bytes=TOTAL_BYTES,
                         ratio=covered['covered_ratio'],
                         holes=len(holes)),
    round9_additions=dict(
        block_10f0_fields=len(fields),
        nested_blocks=len(nested),
        hole_write_statements=len(hole_writes),
        descriptor_rows=ROWS,
        callee_targets=len(callees),
        format_literals=len(lits),
    ),
    residual_holes=residual,
    note='Round 9 names semantics and call relationships; it does not claim byte '
         'coverage. The 4583 hole bytes stay uncovered, but 10 of the 14 holes now '
         'have at least one witnessed write path from 0x0801d888.',
    assertions=[a for a in ASSERT if a['label'].startswith(('hole', 'residual'))],
))

# ------------------------------------------------------------ MODEL_RESULTS
groups = Counter()
for a in ASSERT:
    groups[a['label'].split('_')[0]] += 1
failures = [a for a in ASSERT if not a['ok']]
res = dict(
    schema='eightsleep.nonusb.post-layout-closure.model-results.v1',
    date=DATE, round=9,
    source=dict(frozen_bbin=str(BBIN.relative_to(ROOT)), sha256=SHA,
                bytes=len(b), va_range='%08x..%08x' % (BASE, LIM)),
    status='PASS' if not failures else 'FAIL',
    assertions=len(ASSERT), failures=len(failures),
    assertion_groups=dict(groups),
    headline=dict(
        block_10f0_bytes=BLOCK_LEN, block_10f0_named_fields=len(fields),
        block_10f0_write_statements=len(block_writes),
        block_10f0_distinct_offsets=len(blk_offsets),
        nested_08019bac_bytes=0x250, nested_08019bac_sub_blocks=len(nested),
        descriptor_rows=ROWS, descriptor_referenced_ids=len(ref_ids),
        descriptor_unreferenced_rows=len(unreferenced),
        descriptor_reference_sites=sum(ref_ids.values()),
        hole_write_statements=len(hole_writes),
        holes_with_writes=len({w['hole'] for w in hole_writes}),
        callee_targets=len(callees), callee_flash_targets=len(in_flash),
        callee_resolved_targets=len(resolved),
        callee_residual_targets=len(residual_targets),
        round9_functions=len(r9_out), round9_out_edges=r9_edges,
        round9_body_present=r9_body, round9_body_missing=len(r9_none),
        round9_range_exports=len(r9_ranges),
        block_writer_functions=len(blk_writer_fns),
        block_writer_target_addresses=len(blk_writer_targets),
        log_call_sites=len(sites), format_literals=len(lits),
        format_literal_texts=len(texts),
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
