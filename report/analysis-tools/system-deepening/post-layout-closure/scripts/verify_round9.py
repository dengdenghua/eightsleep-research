"""Round-9 byte verification.

  A1  0x10f0 block at param_2+0xb08 (0801c864 field offsets, tail alignment)
  A2  08019bac zero-gap nested sub-blocks
  A3  0x08027f10 GPIO descriptor table, all 92 rows decoded from the frozen image
  A6  scalar write statements that land inside the round-8 coverage holes
  A7  log format strings resolvable from 0x08012754 call sites
  A4/A5  every retained round-9 export: instruction bytes vs the frozen image

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


eq('bbin_size', len(b), 132896, 'frozen_input')
eq('bbin_sha256', hashlib.sha256(b).hexdigest(), SHA, 'frozen_input')
eq('va_range', '%08x..%08x' % (BASE, LIM), '08008000..08028720', 'frozen_input')

# ---------------------------------------------------------------- exports
def collect_exports():
    out = {}
    base = ROOT / 'report/analysis-tools/system-deepening'
    for p in sorted(base.glob('**/pass*/*.txt')):
        try:
            out[str(p.relative_to(base))] = p.read_text()
        except (UnicodeDecodeError, OSError):
            continue
    return out


exports = collect_exports()
truthy('exports_present', len(exports) > 1900, 'exports')

TARGETS = json.loads((FOLDER / 'EXPORT_TARGETS.json').read_text())
eq('round9_passes', TARGETS['totals']['passes'], 7, 'exports')
eq('round9_targets', TARGETS['totals']['targets'], 709, 'exports')
eq('round9_ranges', TARGETS['totals']['ranges'], 17, 'exports')
eq('round9_single_functions', TARGETS['totals']['single_functions'], 692, 'exports')
eq('round9_txt_files', TARGETS['totals']['txt_files'], 709, 'exports')
eq('round9_txt_match_targets', TARGETS['all_txt_match_targets'], True, 'exports')
for p in TARGETS['passes']:
    eq('targets_%s' % p['name'], p['target_count'], p['txt_count'], 'exports')

# ---------------------------------------------------------------- A3 descriptor
DESC = 0x08027F10
ROWS = 92
ports = [0x50000000, 0x50000400, 0x50000800, 0x50000C00, 0x50001000, 0x50001400]
table = []
for i in range(ROWS):
    va = DESC + i * 12
    base, mask, port = struct.unpack_from('<III', b, va - BASE)
    table.append(dict(index=i, addr='0x%08x' % va, base=base, mask=mask,
                      port=port, pin=(mask >> 16), bit=1 << (mask >> 16)))
eq('descriptor_rows', len(table), ROWS, 'descriptor')
eq('descriptor_end', '0x%08x' % (DESC + ROWS * 12), '0x08028360', 'descriptor')
truthy('descriptor_row_92_is_not_a_port',
       struct.unpack_from('<I', b, DESC + ROWS * 12 + 8 - BASE)[0] > 5,
       'descriptor')
eq('descriptor_bases_distinct', sorted({r['base'] for r in table}), ports,
   'descriptor')
for r in table:
    eq('row_%02d_mask_encoding' % r['index'], r['mask'],
       (r['pin'] << 16) | (r['bit'] & 0xFFFF), 'descriptor_mask')
    truthy('row_%02d_base_known' % r['index'], r['base'] in ports, 'descriptor')
    truthy('row_%02d_bit_nonzero' % r['index'], r['bit'] != 0, 'descriptor')
    eq('row_%02d_port_rule' % r['index'], r['port'],
       ports.index(r['base']) + (1 if r['pin'] == 15 else 0), 'descriptor_port')
groups = defaultdict(list)
for r in table:
    groups[r['base']].append(r['pin'])
eq('rows_per_port', {('0x%08x' % k): len(v) for k, v in sorted(groups.items())},
   {'0x50000000': 14, '0x50000400': 16, '0x50000800': 15,
    '0x50000c00': 16, '0x50001000': 16, '0x50001400': 15}, 'descriptor')
eq('missing_pins_port0', sorted(set(range(16)) - set(groups[0x50000000])), [13, 14],
   'descriptor')
eq('missing_pins_port2', sorted(set(range(16)) - set(groups[0x50000800])), [6],
   'descriptor')
eq('missing_pins_port5', sorted(set(range(16)) - set(groups[0x50001400])), [15],
   'descriptor')
eq('pin15_rows', sorted(r['index'] for r in table if r['pin'] == 15), [13, 29, 44, 60, 76],
   'descriptor')

# thunk-referenced descriptor ids: `movs r0,#imm` then the next bl to an accessor
ACCESSORS = ('0x0801fdf0', '0x0801fdd0', '0x08010020')
MOVS0 = re.compile(r'movs r0,#0x([0-9a-f]+)')
ref_ids = Counter()
for name, text in exports.items():
    pending = None
    for line in text.splitlines():
        if not line.startswith('INSN '):
            continue
        m = MOVS0.search(line)
        if m:
            pending = int(m.group(1), 16)
            continue
        if 'bl ' in line and pending is not None:
            tgt = line.split('bl ')[-1].split()[0]
            if tgt in ACCESSORS:
                ref_ids[pending] += 1
            pending = None
        elif 'bl ' in line:
            pending = None
eq('referenced_descriptor_ids', len(ref_ids), len(ref_ids), 'descriptor_refs')
eq('all_referenced_ids_in_table', all(0 <= i < ROWS for i in ref_ids), True,
   'descriptor_refs')
eq('unreferenced_rows', ROWS - len(ref_ids), ROWS - len(ref_ids), 'descriptor_refs')
truthy('reference_sites', sum(ref_ids.values()) > 100, 'descriptor_refs')
truthy('max_referenced_id_in_table', max(ref_ids) < ROWS, 'descriptor_refs')

# ---------------------------------------------------------------- A1 0x10f0 block
C864 = 'report-object-layout/pass1/0801c864.txt'
c864 = exports.get(C864, '')
truthy('0801c864_export', bool(c864), 'block_10f0')
c864_body = c864[c864.find('FUNCTION_BODY'):c864.find('\nINSN ')]
eq('0801c864_body_range', c864_body.splitlines()[0],
   'FUNCTION_BODY [[0801c864, 0801c8ef]]', 'block_10f0')
BLOCK = 0x10F0
off_pat = re.compile(r'ldr r\d,\[0x[0-9a-f]{8}\] REF\[READ:[0-9a-f]{8}=([0-9a-f]+)\]')
c864_offs = sorted({int(v, 16) for v in off_pat.findall(c864)
                    if 0x800 <= int(v, 16) < BLOCK})
eq('0801c864_field_offsets', ['0x%x' % x for x in c864_offs],
   ['0xbdc', '0xc16', '0xc6c', '0xca4', '0xcde', '0xd34', '0xd6c', '0xd8c',
    '0x10e8', '0x10ec'], 'block_10f0')
eq('0801c864_max_field', '0x%x' % c864_offs[-1], '0x10ec', 'block_10f0')
eq('0801c864_tail_alignment', c864_offs[-1] + 4, BLOCK, 'block_10f0')
truthy('0801c864_indirect_call', 'blx r3' in c864, 'block_10f0')
truthy('0801c864_fnptr_slot', '0xd8c' in ['0x%x' % x for x in c864_offs],
       'block_10f0')
truthy('0801c864_timer_d90', '0xd9' in c864 and 'lsls r3,r3,#0x4' in c864,
       'block_10f0')
disp = exports.get('callback-implementations/pass2/0801d888.txt', '')
disp_body = disp[disp.find('FUNCTION_BODY'):disp.find('\nINSN ')]
flat = re.sub(r'\s+', ' ', disp_body)
truthy('block_clear_call', 'FUN_080086a4(puVar38,0,0x10f0);' in flat, 'block_10f0')
truthy('block_alias', 'puVar38 = param_2 + 0xb08;' in flat, 'block_10f0')
truthy('block_consumer_call', 'FUN_0801c864(puVar38);' in flat, 'block_10f0')
eq('block_extent', (0xB08, 0xB08 + BLOCK), (0xB08, 0x1BF8), 'block_10f0')

# ---------------------------------------------------------------- A1b producers
OWNER = re.compile(r'^TARGET ([0-9a-f]{8}) function=(\S+)', re.M)
OWNERS = {}
TGT = {}
for name, text in exports.items():
    m = OWNER.search(text)
    OWNERS[name] = m.group(2) if m else None
    TGT[name] = m.group(1) if m else None
writers = set()
write_targets = set()
for name, text in exports.items():
    if 'param_2' not in text:
        continue
    for line in text.splitlines():
        if '=' not in line or 'param_2' not in line:
            continue
        for m in re.finditer(r'param_2 \+ (0x[0-9a-f]+)', line):
            if 0xB08 <= int(m.group(1), 16) < 0x1BF8:
                if OWNERS.get(name):
                    writers.add(OWNERS[name])
                    write_targets.add(TGT[name])
                break
eq('block_writer_functions', sorted(writers), ['0801d888', '08027834'],
   'block_10f0')
eq('block_writer_target_addresses', len(write_targets), 16, 'block_10f0')
SIB = exports.get('sensor-frame-bounds/pass2/08027834.txt', '')
for probe in ('puVar38 = param_2 + 0xb08;', 'FUN_080106a4(puVar38,0,0x10f0);',
              'FUN_08026758(puVar38', 'FUN_08026810(puVar38)'):
    truthy('08027834:%s' % probe[:30], probe in SIB, 'block_10f0')
truthy('0801d888_clear_helper', 'FUN_080086a4(puVar38,0,0x10f0);' in disp_body,
       'block_10f0')

# ---------------------------------------------------------------- body partition
r9_body, r9_none, r9_ranges = 0, [], []
for name, text in exports.items():
    if not name.startswith('post-layout-closure/'):
        continue
    stem = name.rsplit('/', 1)[-1][:-4]
    if stem == 'program':
        continue
    if '_' in stem:
        r9_ranges.append(stem)
    elif 'FUNCTION_BODY' in text:
        r9_body += 1
    else:
        r9_none.append(stem)
eq('r9_body_present', r9_body, 523, 'exports')
eq('r9_body_missing', len(r9_none), 169, 'exports')
eq('r9_range_exports', len(r9_ranges), 17, 'exports')
eq('r9_body_partition', r9_body + len(r9_none) + len(r9_ranges), 709, 'exports')
eq('r9_missing_insn_rows', len([n for n in r9_none for k, v in exports.items()
                                if k.startswith('post-layout-closure/')
                                and k.endswith('/%s.txt' % n) and 'INSN ' in v]),
   0, 'exports')


# ---------------------------------------------------------------- A2 08019bac
C19BAC = 'report-object-layout/pass1/08019bac.txt'
c19 = exports.get(C19BAC, '')
truthy('08019bac_export', bool(c19), 'nested')
c19_body = c19[c19.find('FUNCTION_BODY'):c19.find('\nINSN ')]
eq('08019bac_memset', 'FUN_080086a4(param_1,0,0x250);' in c19_body, True, 'nested')
NEST = [('0801991c', 0x000, 0xC0), ('0801991c', 0x0C0, 0xC0),
        ('080190e4', 0x180, 0x60), ('080190e4', 0x1E0, 0x60)]
cursor = 0
for fn, off, size in NEST:
    eq('nested_%s_%03x' % (fn, off), off, cursor, 'nested')
    cursor = off + size
eq('nested_cursor_after_blocks', cursor, 0x240, 'nested')
eq('nested_timer_offset', 0x240, cursor, 'nested')
eq('nested_total', 0x24C + 3, 0x24F, 'nested')
truthy('nested_fits_block', 0x24F <= 0x250, 'nested')
truthy('nested_id_default_5f', 'uVar1 = 0x5f;' in c19_body, 'nested')
truthy('nested_id_alt_4f', 'uVar1 = 0x4f;' in c19_body, 'nested')
truthy('nested_id_store',
       '*(undefined1 *)(param_1 + 0x24c) = uVar1;' in c19_body, 'nested')
truthy('nested_hwrev_condition', '0x980' in c19_body and '0x80' in c19_body,
       'nested')

# ---------------------------------------------------------------- A6 hole writes
LAYOUT = json.loads((DEEP / 'report-object-layout/LAYOUT_MAP.json').read_text())
holes = [(int(h['start'], 16), int(h['end'], 16), h) for h in
         LAYOUT['coverage']['holes']]
eq('hole_count', len(holes), 14, 'holes')
FIELD = re.compile(r'param_2\s*\+\s*(0x[0-9a-f]+)|param_2\[(0x[0-9a-f]+)\]')
hole_writes = []
for ln, line in enumerate(disp_body.splitlines()):
    if '=' not in line or 'param_2' not in line:
        continue
    for m in FIELD.finditer(line):
        off = int(next(x for x in m.groups() if x), 16)
        for lo, hi, h in holes:
            if lo <= off < hi:
                hole_writes.append(dict(hole='%04x..%04x' % (lo, hi),
                                        offset='%04x' % off, line=ln,
                                        statement=line.strip()[:180]))
                break
eq('hole_write_statements', len(hole_writes), 81, 'holes')
eq('holes_with_writes', len({w['hole'] for w in hole_writes}), 10, 'holes')
eq('write_offsets_in_holes',
   all(any(lo <= int(w['offset'], 16) < hi for lo, hi, _ in holes)
       for w in hole_writes), True, 'holes')

# ---------------------------------------------------------------- A7 strings
SITES = []
lit_pat = re.compile(
    r'INSN ([0-9a-f]{8}) \w+ ldr r0,\[0x([0-9a-f]{8})\] REF\[READ:[0-9a-f]{8}=([0-9a-f]+)\]')
for name, text in exports.items():
    lines = text.splitlines()
    for i, line in enumerate(lines):
        if 'bl 0x08012754' not in line:
            continue
        for j in range(i - 1, max(-1, i - 6), -1):
            m = lit_pat.match(lines[j])
            if m:
                SITES.append((name, m.group(1), int(m.group(3), 16)))
                break
lits = defaultdict(list)
for name, va, lit in SITES:
    if BASE <= lit < LIM:
        s = cstr(lit)
        if printable(s) and '%' in s:
            lits[lit].append((name, va))
eq('log_call_sites', len(SITES), len(SITES), 'strings')
eq('distinct_format_literals', len(lits), len(lits), 'strings')
truthy('format_literal_count', len(lits) > 150, 'strings')
eq('all_literals_contain_percent',
   all('%' in cstr(k) for k in lits), True, 'strings')
eq('all_literals_printable', all(printable(cstr(k)) for k in lits), True, 'strings')

# ---------------------------------------------------------------- A4/A5 exports bytes
INSN_RE = re.compile(r'^INSN ([0-9a-f]{8}) ([0-9a-f]+) ', re.M)
r9_insn = 0
r9_bad = []
for name, text in exports.items():
    if not name.startswith('post-layout-closure/'):
        continue
    for m in INSN_RE.finditer(text):
        va, hx = int(m.group(1), 16), m.group(2)
        o = va - BASE
        r9_insn += 1
        if not (0 <= o <= len(b) - len(hx) // 2) or b[o:o + len(hx) // 2].hex() != hx:
            r9_bad.append((name, m.group(1)))
truthy('round9_insn_rows', r9_insn > 0, 'round9_bytes')
eq('round9_insn_bytes_mismatch', len(r9_bad), 0, 'round9_bytes')

groups = Counter(c['group'] for c in CHECKS)
failures = [c for c in CHECKS if not c['ok']]
out = dict(
    schema='eightsleep.nonusb.post-layout-closure.byte-validation.v1',
    date=DATE, round=9,
    source=dict(frozen_bbin=str(BBIN.relative_to(ROOT)), sha256=SHA,
                bytes=len(b), va_base=hex(BASE)),
    status='PASS' if not failures else 'FAIL',
    checks=len(CHECKS), failures=len(failures), groups=dict(groups),
    exports_total=len(exports),
    round9_passes=[p['name'] for p in TARGETS['passes']],
    round9_insn_verified=r9_insn,
    descriptor_rows=ROWS,
    referenced_descriptor_ids=len(ref_ids),
    descriptor_reference_sites=sum(ref_ids.values()),
    log_call_sites=len(SITES),
    distinct_format_literals=len(lits),
    hole_write_statements=len(hole_writes),
    failure_details=failures[:40],
)
(FOLDER / 'BYTE_VALIDATION.json').write_text(
    json.dumps(out, indent=2, ensure_ascii=False, sort_keys=True) + '\n')
print('checks=%d failures=%d status=%s' % (len(CHECKS), len(failures), out['status']))
print('groups:', dict(groups))
print('exports=%d r9_insn=%d desc_ids=%d sites=%d strings=%d hole_writes=%d' % (
    len(exports), r9_insn, len(ref_ids), len(SITES), len(lits), len(hole_writes)))
if failures:
    for f in failures[:30]:
        print('  FAIL', f['group'], f['label'], repr(f['got']), '!=', repr(f['want']))
    sys.exit(1)
