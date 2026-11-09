"""Byte / instruction / literal verification for the callback-implementations round.

Everything is checked against the frozen firmware-sensor-g0.bbin plus the
read-only Ghidra exports retained in pass1/pass2/pass3 of this folder.
No firmware is executed, no network/device/account access.
"""

import hashlib
import json
import re
import struct
import sys
from collections import Counter, defaultdict
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import thumb_lite

HERE = Path(__file__).resolve().parent          # .../callback-implementations/scripts
FOLDER = HERE.parent
ROOT = HERE.parents[4]                          # delivery root
BBIN = ROOT / ('materials/eightsleep-full-evidence-20261107/firmware/mtk/'
               'rootfs/files/opt/eight/lib/subsystem_updates/firmware-sensor-g0.bbin')
BASE = 0x08008000
SHA = '51531576fd31af96f7239b71d26e1f175815f5cb21dbe9ab305fa9a33cc6a891'
SNAPSHOT = ROOT / 'report/analysis-tools/system-deepening/config-object-snapshot/CONFIG_SNAPSHOT.json'

CHECKS = []


def eq(label, got, want, group):
    CHECKS.append(dict(group=group, label=label, got=got, want=want,
                       ok=(got == want)))


def truthy(label, got, group):
    CHECKS.append(dict(group=group, label=label, got=got, want=True,
                       ok=bool(got)))


b = BBIN.read_bytes()


def read32(va):
    o = va - BASE
    if 0 <= o <= len(b) - 4:
        return struct.unpack_from('<I', b, o)[0]
    return None


# ---------------------------------------------------------------- frozen input
eq('bbin_size', len(b), 132896, 'frozen_input')
eq('bbin_sha256', hashlib.sha256(b).hexdigest(), SHA, 'frozen_input')

# ---------------------------------------------------------------- export metadata
for passname in ('pass1', 'pass2', 'pass3', 'pass4'):
    p = FOLDER / passname / 'program.txt'
    t = p.read_text() if p.exists() else ''
    eq('%s_program_sha' % passname, ('EXECUTABLE_SHA256 ' + SHA) in t, True,
       'export_metadata')
    eq('%s_program_language' % passname, 'LANGUAGE ARM:LE:32:Cortex' in t, True,
       'export_metadata')

# ---------------------------------------------------------------- pointer set
snap = json.loads(SNAPSHOT.read_text())
ptr_records = defaultdict(set)
for key in ('snapshots', 'snapshots_sku4'):
    for hwrev, boundary in snap[key].items():
        for off, rec in boundary['slots'].items():
            if rec.get('kind') == 'thumb_function_pointer':
                ptr_records[int(rec['value'], 16)].add(off)
ptrs = sorted(ptr_records)
eq('unique_thumb_pointers', len(ptrs), 80, 'pointer_set')
eq('all_pointers_have_thumb_bit', all(v & 1 for v in ptrs), True, 'pointer_set')
eq('all_pointers_in_flash', all(BASE <= (v & ~1) < BASE + len(b) for v in ptrs),
   True, 'pointer_set')

entries = {v: v & ~1 for v in ptrs}
for v, e in entries.items():
    p = FOLDER / 'pass1' / ('%08x.txt' % e)
    eq('pass1_file_%08x' % e, p.exists(), True, 'pointer_set')
    if p.exists():
        m = re.search(r'TARGET (\w+) function=(\w+)', p.read_text())
        eq('pass1_target_%08x' % e, m.group(1) if m else None, '%08x' % e,
           'pointer_set')

export_files = {}
for passname in ('pass1', 'pass2', 'pass3', 'pass4'):
    for p in sorted((FOLDER / passname).glob('*.txt')):
        export_files['%s/%s' % (passname, p.name)] = p.read_text()

decoded, undecoded = {}, {}
for v, e in entries.items():
    t = export_files['pass1/%08x.txt' % e]
    m = re.search(r'TARGET (\w+) function=(\w+)', t)
    (decoded if m.group(2) != 'none' else undecoded)[v] = (e, t)
eq('decoded_callback_exports', len(decoded), 19, 'ghidra_split')
eq('undecoded_callback_exports', len(undecoded), 61, 'ghidra_split')

# ---------------------------------------------------------------- INSN machine bytes
INSN_RE = re.compile(r'^INSN ([0-9a-f]{8}) ([0-9a-f]+) (.*)$')
insn_rows = 0
insn_bad = []
for name, text in export_files.items():
    for line in text.splitlines():
        m = INSN_RE.match(line)
        if not m:
            continue
        insn_rows += 1
        va, hx = int(m.group(1), 16), m.group(2)
        o = va - BASE
        if o < 0 or o + len(hx) // 2 > len(b):
            insn_bad.append((name, m.group(1), 'out_of_range'))
            continue
        got = b[o:o + len(hx) // 2].hex()
        if got != hx:
            insn_bad.append((name, m.group(1), '%s!=%s' % (got, hx)))
eq('insn_rows_total', insn_rows, 17155, 'instruction_bytes')
eq('insn_bytes_mismatch', len(insn_bad), 0, 'instruction_bytes')

# ---------------------------------------------------------------- flash literals
lit_checked = 0
lit_bad = []
LIT_RE = re.compile(r'REF\[READ:([0-9a-f]{8})=([0-9a-f]+)\]')
for name, text in export_files.items():
    for line in text.splitlines():
        for m in LIT_RE.finditer(line):
            va, shown = int(m.group(1), 16), int(m.group(2), 16)
            if not (BASE <= va < BASE + len(b)):
                continue          # SRAM slots are not flash literals
            lit_checked += 1
            got = read32(va)
            if got is None or (got & 0xFFFFFFFF) != (shown & 0xFFFFFFFF):
                lit_bad.append((name, m.group(1), hex(shown),
                                None if got is None else hex(got)))
truthy('flash_literals_checked', lit_checked > 100, 'flash_literals')
eq('flash_literal_mismatch', len(lit_bad), 0, 'flash_literals')

# ---------------------------------------------------------------- embedded tables
THRESHOLDS = [0x0000, 0x0805, 0x0900, 0x0A00, 0x0A05, 0x0A10, 0x0A30,
              0x0A33, 0x0A34, 0x0A35, 0x0A36, 0x0A37, 0x0A87, 0x0A90]
CALLEES = [0x0800f58d, 0x0800f719, 0x0800f761, 0x0800f969, 0x0800fafd,
           0x0800fae1, 0x0800fc05, 0x0800fc65, 0x0800fc99, 0x0800fcc1,
           0x0800fce1, 0x0800fd0d, 0x0800fd25, 0x0800fd31]
for i, (th, ca) in enumerate(zip(THRESHOLDS, CALLEES)):
    o = 0x08025da4 + i * 8 - BASE
    got_th, pad, got_ca = struct.unpack_from('<HHI', b, o)
    eq('dispatch_row_%d_threshold' % i, got_th, th, 'dispatch_table')
    eq('dispatch_row_%d_pad' % i, pad, 0, 'dispatch_table')
    eq('dispatch_row_%d_callee' % i, got_ca, ca, 'dispatch_table')

VERSIONS = ['I00', 'I05', 'J00', 'K00', 'K10', 'K05', 'K30', 'K33',
            'K34', 'K35', 'K36', 'K37', 'K87', 'K90']
for i, s in enumerate(VERSIONS):
    o = 0x08024234 + i * 4 - BASE
    eq('version_string_%d' % i, b[o:o + 4], (s + '\0').encode(), 'version_strings')

DIVIDERS = [1, 2, 4, 6, 8, 10, 12, 16, 32, 64, 128, 256, 0x408, 0x402,
            0x108, 0x101]
for i, d in enumerate(DIVIDERS):
    o = 0x0802420c + i * 2 - BASE
    eq('divider_%d' % i, struct.unpack_from('<H', b, o)[0], d, 'divider_table')

# ---------------------------------------------------------------- 3-char identifier
IDENT_ASM = {
    0x0801dd62: ('0f20', 'movs r0,#0xf'),
    0x0801dd64: ('238a', 'ldrh r3,[r4,#0x10]'),
    0x0801dd66: ('5a4a', 'ldr r2,[0x0801ded0]'),
    0x0801dd68: ('1912', 'asrs r1,r3,#0x8'),
    0x0801dd6a: ('0140', 'ands r1,r0'),
    0x0801dd6c: ('4131', 'adds r1,#0x41'),
    0x0801dd6e: ('1170', 'strb r1,[r2,#0x0]'),
    0x0801dd70: ('1911', 'asrs r1,r3,#0x4'),
    0x0801dd72: ('0340', 'ands r3,r0'),
    0x0801dd74: ('3033', 'adds r3,#0x30'),
    0x0801dd76: ('9370', 'strb r3,[r2,#0x2]'),
    0x0801dd78: ('0123', 'movs r3,#0x1'),
    0x0801dd7a: ('0140', 'ands r1,r0'),
    0x0801dd7c: ('3031', 'adds r1,#0x30'),
    0x0801dd7e: ('5170', 'strb r1,[r2,#0x1]'),
    0x0801dd80: ('2370', 'strb r3,[r4,#0x0]'),
}
rng = export_files['pass3/0801dd40_0801def0.txt']
rng_lines = {m.group(1): (m.group(2), m.group(3))
             for m in (INSN_RE.match(l) for l in rng.splitlines()) if m}
for va, (hx, asm) in IDENT_ASM.items():
    key = '%08x' % va
    eq('ident_insn_%s_hex' % key, rng_lines.get(key, (None, None))[0], hx,
       'three_char_identifier')
    eq('ident_insn_%s_bytes' % key, b[va - BASE:va - BASE + 2].hex(), hx,
       'three_char_identifier')
eq('ident_literal_200014d8', read32(0x0801ded0), 0x200014d8,
   'three_char_identifier')
eq('ident_literal_20001cfc', read32(0x0801deb8), 0x20001cfc,
   'three_char_identifier')

# pointwise RAM literal references across the whole image
for needle, expected in ((0x200014d8, [0x08012a58, 0x08012d08, 0x08012ecc,
                                       0x0801cf14, 0x0801ded0]),
                         (0x200014d9, []), (0x200014da, [])):
    pat = struct.pack('<I', needle)
    hits = [BASE + m.start() for m in re.finditer(re.escape(pat), b)]
    eq('pointer_hits_%08x' % needle, hits, expected, 'pointer_literals')
pat = struct.pack('<I', 0x0802420c)
hits = [BASE + m.start() for m in re.finditer(re.escape(pat), b)]
eq('divider_table_pointer_hits', hits, [0x0800ea48], 'pointer_literals')

# ---------------------------------------------------------------- decoded prefixes
prefixes = {}
for v, (e, t) in undecoded.items():
    rows, stop = thumb_lite.scan(b, BASE, e, read32, max_halfwords=160)
    prefixes[v] = (rows, stop)
    eq('prefix_nonempty_%08x' % e, len(rows) > 0, True, 'undecoded_prefixes')
    for row in rows:
        va = int(row['addr'], 16)
        eq('prefix_raw_%08x_%s' % (e, row['addr']),
           b[va - BASE:va - BASE + row['width']].hex(), row['raw'],
           'undecoded_prefixes')
    eq('prefix_reaches_terminator_%08x' % e,
       stop in ('return', 'unconditional_branch'), True, 'undecoded_prefixes')
stop_counts = Counter(s for _, s in prefixes.values())
eq('prefix_stop_return', stop_counts['return'], 59, 'undecoded_prefixes')
eq('prefix_stop_branch', stop_counts['unconditional_branch'], 2,
   'undecoded_prefixes')
eq('prefix_no_undecoded', stop_counts['undecoded_16'] + stop_counts['undecoded_32'],
   0, 'undecoded_prefixes')

# BL target recomputation from raw halfwords
bl_checked, bl_bad = 0, []
for v, (rows, _) in prefixes.items():
    for row in rows:
        if row['kind'] != 'call':
            continue
        bl_checked += 1
        va = int(row['addr'], 16)
        h1 = struct.unpack_from('<H', b, va - BASE)[0]
        h2 = struct.unpack_from('<H', b, va - BASE + 2)[0]
        if thumb_lite.bl_target(va, h1, h2) != row['target']:
            bl_bad.append((row['addr'], row['asm']))
        if not (BASE <= row['target'] < BASE + len(b)):
            bl_bad.append((row['addr'], 'target_out_of_image'))
truthy('bl_targets_recomputed', bl_checked > 100, 'undecoded_prefixes')
eq('bl_target_mismatch', len(bl_bad), 0, 'undecoded_prefixes')

# ---------------------------------------------------------------- report-field anchors
FIELD_ANCHORS = {
    0x0801ddb4: ('4c4b', '3d9c pointer literal slot'),
    0x0801ddba: ('f4f7cbfc', 'log call with mode string'),
    0x0801ddc2: ('b354', '3d9a byte store'),
}
for va, (hx, note) in FIELD_ANCHORS.items():
    eq('report_anchor_%08x' % va, b[va - BASE:va - BASE + len(hx) // 2].hex(),
       hx, 'report_field_anchors')

# ------------------------------------------- GPIO descriptor table / clock chain
GPIO_TABLE = 0x08027F10
THUNK_IDS = [0x0D, 0x22, 0x26, 0x27, 0x28, 0x2D, 0x38, 0x3B, 0x3C, 0x3D,
             0x3F, 0x45, 0x46, 0x47, 0x48, 0x49, 0x4A, 0x50, 0x52, 0x53,
             0x54, 0x57, 0x59, 0x5A]
for idx in THUNK_IDS:
    p = GPIO_TABLE + idx * 12 - BASE
    base, pinenc, port = struct.unpack_from('<III', b, p)
    truthy('gpio_%02x_base_is_peripheral' % idx,
           0x50000000 <= base <= 0x50001FFF, 'gpio_descriptors')
    truthy('gpio_%02x_mask_nonzero' % idx, pinenc & 0xFFFF != 0,
           'gpio_descriptors')
    truthy('gpio_%02x_port_in_range' % idx, port <= 5, 'gpio_descriptors')
eq('gpio_row0', struct.unpack_from('<III', b, GPIO_TABLE - BASE),
   (0x50000000, 0x00000001, 0), 'gpio_descriptors')
eq('gpio_row_50', struct.unpack_from('<III', b, GPIO_TABLE + 0x50 * 12 - BASE),
   (0x50001400, 0x00030008, 5), 'gpio_descriptors')

for va, hz in ((0x08010954, 16000000), (0x0801095C, 32000000),
               (0x080109F0, 8000000)):
    eq('hse_literal_%08x' % va, read32(va), hz, 'clock_chain')
for name, needle in (
        ('pass4/080108ac.txt', 'DAT_20001cfc - 0xa87 < 0x79'),
        ('pass4/080108ac.txt', 'DAT_20000474 = 16000000'),
        ('pass4/080108ac.txt', 'DAT_20000474 = 32000000'),
        ('pass4/08010960.txt', 'DAT_20000474 = 8000000'),
        ('pass4/08010960.txt', 'FUN_0800c8dc'),
        ('pass4/0801fdf0.txt', 'DAT_08027f10 + param_1 * 0xc'),
        ('pass4/0801fdd0.txt', 'DAT_08027f10 + param_1 * 0xc'),
        ('pass4/0800acc8.txt', 'param_1 + 0x28'),
        ('pass4/0800acc8.txt', 'param_1 + 0x18'),
        ('pass4/0800acbc.txt', 'param_1 + 0x10'),
        ('pass4/08010020.txt', 'FUN_0801fdf0(param_1,1)')):
    eq('semantic_%s_%s' % (name.split('/')[-1], needle[:18]),
       needle in export_files[name], True, 'shared_callee_semantics')

# ---------------------------------------------------------------- result
groups = Counter(c['group'] for c in CHECKS)
failures = [c for c in CHECKS if not c['ok']]
out = dict(
    schema='eightsleep.nonusb.callback-implementations.byte-validation.v1',
    date='2026-11-08',
    source=dict(frozen_bbin=str(BBIN.relative_to(ROOT)), sha256=SHA,
                bytes=len(b), va_base=hex(BASE)),
    status='PASS' if not failures else 'FAIL',
    checks=len(CHECKS), failures=len(failures),
    groups=dict(groups),
    decoded_callbacks=len(decoded), undecoded_callbacks=len(undecoded),
    insn_rows_verified=insn_rows, flash_literals_verified=lit_checked,
    bl_targets_recomputed=bl_checked,
    failure_details=failures[:40],
)
(FOLDER / 'BYTE_VALIDATION.json').write_text(
    json.dumps(out, indent=2, ensure_ascii=False, sort_keys=True) + '\n')
print('checks=%d failures=%d status=%s' % (len(CHECKS), len(failures),
                                           out['status']))
print('groups:', dict(groups))
if failures:
    for f in failures[:20]:
        print('  FAIL', f['group'], f['label'], repr(f['got']), '!=',
              repr(f['want']))
    sys.exit(1)
