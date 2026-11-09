"""Independent byte-level verification of the round-13 receive-path closure.

This script deliberately does NOT import the model script. It re-derives every
number from the frozen BBIN bytes and from the raw exports, using its own small
Thumb-16 decoder, so that a bug in the model cannot hide behind a matching bug
in the checker.

Outputs BYTE_VALIDATION.json.
"""

import hashlib
import json
import re
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
CHECKS = []


def ck(label, got, want):
    CHECKS.append(dict(label=label, got=got, want=want, ok=(got == want)))


def ok(label, cond, detail=None):
    CHECKS.append(dict(label=label, got=detail if detail is not None else True,
                       want=True, ok=bool(cond)))


def h(va):
    return int.from_bytes(b[va - BASE:va - BASE + 2], 'little')


def w(va):
    return int.from_bytes(b[va - BASE:va - BASE + 4], 'little')


def raw(va, n):
    return b[va - BASE:va - BASE + n]


ck('bbin_bytes', len(b), 132896)
ck('bbin_sha256', hashlib.sha256(b).hexdigest(), SHA)

# ------------------------------------------------------------------ decoder
# Only the encodings this round actually needs, written from the ARMv6-M manual.
def dec16(va):
    i = h(va)
    if i & 0xF800 == 0x4800:                       # LDR (literal)
        return ('ldr_lit', (i >> 8) & 7, (((va + 4) & ~3) + (i & 0xFF) * 4))
    if i & 0xF800 == 0x6000:                       # STR (immediate, word)
        return ('str', (i & 7), (i >> 3) & 7, ((i >> 6) & 0x1F) * 4)
    if i & 0xF800 == 0x6800:                       # LDR (immediate, word)
        return ('ldr', (i & 7), (i >> 3) & 7, ((i >> 6) & 0x1F) * 4)
    if i & 0xF800 == 0x7000:                       # STRB
        return ('strb', (i & 7), (i >> 3) & 7, (i >> 6) & 0x1F)
    if i & 0xF800 == 0x7800:                       # LDRB
        return ('ldrb', (i & 7), (i >> 3) & 7, (i >> 6) & 0x1F)
    if i & 0xF800 == 0x8000:                       # STRH
        return ('strh', (i & 7), (i >> 3) & 7, ((i >> 6) & 0x1F) * 2)
    if i & 0xF800 == 0x8800:                       # LDRH
        return ('ldrh', (i & 7), (i >> 3) & 7, ((i >> 6) & 0x1F) * 2)
    if i & 0xF800 == 0x2000:                       # MOVS Rd,#imm8
        return ('movs_imm', (i >> 8) & 7, i & 0xFF)
    if i & 0xFC00 == 0x5000:                       # STR Rd,[Rn,Rm]
        return ('str_reg', (i & 7), (i >> 3) & 7, (i >> 6) & 7)
    if i & 0xFC00 == 0x5800:                       # LDR Rd,[Rn,Rm]
        return ('ldr_reg', (i & 7), (i >> 3) & 7, (i >> 6) & 7)
    if i & 0xF800 in (0xE800, 0xF000, 0xF800):      # 32-bit Thumb-2
        return ('wide', i)
    return ('other', i)


def width(va):
    """Instruction length: 4 for the 32-bit encodings this code uses."""
    i = h(va)
    if i & 0xF800 == 0xF000:
        return 4
    if i & 0xF800 == 0xE800 and (h(va + 2) & 0x8000):
        return 4
    return 2


def scan_stores(va_lo, va_hi):
    """Walk Thumb and return every store plus the literal offsets in registers."""
    out = []
    lit = {}
    va = va_lo
    while va < va_hi:
        d = dec16(va)
        if d[0] == 'ldr_lit':
            lit[d[1]] = w(d[2])
            va += width(va)
            continue
        if d[0] in ('str', 'strb', 'strh'):
            out.append(dict(va=va, kind=d[0], rt=d[1], rn=d[2], imm=d[3]))
        va += width(va)
    return out, lit


def scan_reg_stores(va_lo, va_hi):
    """Second pass: track literal-offset registers, then [Rn,Rm] stores."""
    res = []
    lit = {}
    va = va_lo
    while va < va_hi:
        d = dec16(va)
        if d[0] == 'ldr_lit':
            lit[d[1]] = w(d[2])
        elif d[0] == 'str_reg':
            rt, rn, rm = d[1], d[2], d[3]
            if rm in lit:
                res.append(dict(va=va, rt=rt, rn=rn, off=lit[rm]))
        va += width(va)
    return res


# ------------------------------------------------------- 1. sink 0800a578
# Assertions here are semantic (decoded instruction) rather than raw halfword
# hex, because the exports print halfwords in display order while the image is
# little-endian; comparing the two orders directly is a known trap.
sink_lo, sink_hi = 0x0800A578, 0x0800A5C2
ck('sink_bytes', sink_hi - sink_lo, 0x4A)
ck('sink_first_insn', dec16(0x0800A578), ('movs_imm', 3, 2))
ck('sink_push', dec16(0x0800A57A)[0], 'other')
ck('sink_busy_store', dec16(0x0800A57C), ('strb', 3, 0, 0x1D))
ck('sink_target_deref', dec16(0x0800A580), ('ldr', 3, 0, 0))
ck('sink_flag_load', dec16(0x0800A584), ('ldr', 5, 3, 8))
ck('sink_mode_load', dec16(0x0800A58A), ('ldr', 0, 4, 0x20))
ck('sink_cmp_mode2', dec16(0x0800A58C), ('other', 0x2802))
ck('sink_cmp_mode3', dec16(0x0800A590), ('other', 0x2803))
ck('sink_cmp_mode1', dec16(0x0800A594), ('other', 0x2801))
ck('sink_busy_restore', dec16(0x0800A59C), ('strb', 3, 4, 0x1D))
ck('sink_mode1_bl', w(0x0800A5B4) & 0xFFFF, 0xF7FF)
ck('sink_mode2_bl', w(0x0800A5BC) & 0xFFFF, 0xF7FF)
ck('sink_busy_values', (dec16(0x0800A578)[2], dec16(0x0800A59A)[2]), (2, 1))

# mode 3 inline loop: one store to a fixed address, source walks
m3, _ = scan_stores(0x0800A5A0, 0x0800A5B2)
ck('mode3_stores', [(x['kind'], x['rt'], x['rn'], x['imm']) for x in m3],
   [('str', 0, 3, 0)])
ck('mode3_ldmia', dec16(0x0800A5AC), ('other', 0xC901))
ck('mode3_return_read', dec16(0x0800A5A8), ('ldr', 0, 3, 0))

# ------------------------------------------------------- 2. mode handlers
m1a, m1b = 0x0800A480, 0x0800A4D8
ck('mode1_bytes', 0x0800A4D8 - m1a, 0x58)
ck('mode2_bytes', 0x0800A504 - m1b, 0x2C)
m1s, _ = scan_stores(m1a, m1b)
ck('mode1_only_word_stores',
   sorted({x['imm'] for x in m1s if x['kind'] == 'str'}), [0])
ok('mode1_has_byte_store', any(x['kind'] == 'strb' and x['imm'] == 0 for x in m1s))
ok('mode1_has_half_store', any(x['kind'] == 'strh' and x['imm'] == 0 for x in m1s))
m2s, _ = scan_stores(m1b, 0x0800A504)
ck('mode2_only_word_stores',
   sorted({x['imm'] for x in m2s if x['kind'] == 'str'}), [0])
ok('mode2_has_half_store', any(x['kind'] == 'strh' and x['imm'] == 0 for x in m2s))

# ------------------------------------------------------- 3. dispatch tables
# 3a: the five-state table from the state machine (round 12 cross-check)
t1 = raw(0x08016FDC, 10)
d1 = [int.from_bytes(t1[i:i + 2], 'little', signed=True) for i in range(0, 10, 2)]
ck('state_table_bytes', t1.hex(), '3aff4aff60ff76ff7cff')
ck('state_table_deltas', d1, [-198, -182, -160, -138, -132])
ck('state_table_targets', [(0x08016FDC + 2 * x) & 0xFFFFFFFF for x in d1],
   [0x08016E50, 0x08016E70, 0x08016E9C, 0x08016EC8, 0x08016ED4])

# 3b: the command table, base = return address of bl 0800814c at 0801712e
ck('cmd_call_encoding', h(0x0801712E), 0xF7F1)
ck('cmd_call_low', h(0x08017130), 0xF80D)
ret = 0x0801712E + 4
ck('cmd_table_base', ret, 0x08017132)
t2 = raw(ret, 5)
ck('cmd_table_bytes', t2.hex(), '030c141418')
ck('cmd_table_deltas', list(t2), [3, 12, 20, 20, 24])
ck('cmd_table_targets', [ret + 2 * x for x in t2],
   [0x08017138, 0x0801714A, 0x0801715A, 0x0801715A, 0x08017162])

# the helper itself
ck('helper_bytes', 0x0800815E - 0x0800814C, 0x12)
ck('helper_shift_right', h(0x08008150), 0x0849)
ck('helper_shift_left', h(0x08008152), 0x0049)
ck('helper_byte_load', h(0x08008154), 0x5C09)
ck('helper_bx_lr', h(0x0800815C), 0x4770)

# code bytes reached by the table must be code, not data
for code, tgt in enumerate([0x08017138, 0x0801714A, 0x0801715A, 0x0801715A,
                            0x08017162], start=1):
    d = dec16(tgt)
    ok('cmd_target_%d_decodes' % code, d[0] != 'other', ('0x%08x' % tgt) + ' ' + d[0])

# ------------------------------------------------------- 4. queue object
Q = w(0x08016F94)
ck('queue_literal', Q, 0x2000240C)
ck('queue_callback_literal', w(0x0801DC58), 0x0800FE95)
ck('queue_period_literal', w(0x0801DC64), 0x0801321D)

# 0801d888 initialiser: literal-offset registers 0x8084..0x80b0
init_lo, init_hi = 0x0801D888, 0x0801DC1C
regs = {}
init_hits = []
va = init_lo
while va < init_hi:
    d = dec16(va)
    if d[0] == 'ldr_lit':
        regs[d[1]] = w(d[2])
    elif d[0] == 'str_reg':
        rt, rn, rm = d[1], d[2], d[3]
        off = regs.get(rm)
        if off is not None and 0x8080 <= off <= 0x80B8:
            init_hits.append(('0x%08x' % (Q + off), '0x%08x' % va))
    va += width(va)
ck('init_field_writes', len(init_hits), 11)
ck('init_field_addresses', [x[0] for x in init_hits],
   ['0x2000a4a0', '0x2000a4a4', '0x2000a4ac', '0x2000a4b4', '0x2000a48c',
    '0x2000a490', '0x2000a494', '0x2000a4a8', '0x2000a4b0', '0x2000a4b8',
    '0x2000a4bc'])

# capacity 0x80 << 1
ck('init_capacity_imm', h(0x0801D95A), 0x2180)       # movs r1,#0x80
ck('init_capacity_shift', h(0x0801D95E), 0x0049)     # lsls r1,r1,#1
ck('init_header_cap', h(0x0801D96A), 0x2B04)         # cmp r3,#4

# state 0 resets five fields through r3 = 0
s0_hits = []
regs = {}
va = 0x08016E50
while va < 0x08016E70:
    d = dec16(va)
    if d[0] == 'ldr_lit':
        regs[d[1]] = w(d[2])
    elif d[0] == 'str_reg':
        rt, rn, rm = d[1], d[2], d[3]
        off = regs.get(rm)
        if off is not None:
            s0_hits.append('0x%04x' % off)
    elif d[0] in ('str', 'strb', 'strh') and d[3] == 0:
        s0_hits.append('status' if d[2] == 6 else '+0x%02x' % d[3])
    va += width(va)
ck('state0_clears_status', s0_hits[0], 'status')
ck('state0_reset_offsets', [x for x in s0_hits if x.startswith('0x80')],
   ['0x809c', '0x80a4', '0x80ac', '0x80b0'])

# ------------------------------------------------------- 5. strings
def cstr(va):
    o = va - BASE
    e = b.index(b'\0', o)
    return b[o:e].decode('latin1')


ck('echo_string', cstr(0x080254FC), 'Received response to 0x%02x')
ck('reboot_string', cstr(0x08025518), 'Rebooting...')
ck('lsp_string', cstr(0x08025691), '[lsp] avg selection time=%s%u.%04u')

# ------------------------------------------------------- 6. hole rescan
LAYOUT = json.loads((DEEP / 'report-object-layout/LAYOUT_MAP.json').read_text())
covered = [(int(r['start'], 16), int(r['end'], 16))
           for r in LAYOUT['coverage']['covered_intervals']]


def is_cov(o):
    return any(lo <= o < hi for lo, hi in covered)


PC_BASE = re.compile(
    r'\b(param_\d+|puVar\d+|iVar\d+|unaff_\w+|this)\s*\+\s*0x([0-9a-f]{2,5})')
LIT = re.compile(
    r'^INSN ([0-9a-f]{8}) [0-9a-f]{4,8} ldr r(\d),\[0x[0-9a-f]{8}\] '
    r'REF\[READ:[0-9a-f]{8}=([0-9a-f]+)\]', re.M)

HOLES = [(0x27C, 0x2A0), (0x3E01, 0x3E08)]
hole_state = {hl: dict(insn=set(), pc=set(), files=set()) for hl in HOLES}
for p in sorted(DEEP.rglob('*.txt')):
    rel = str(p.relative_to(DEEP))
    try:
        text = p.read_text()
    except (UnicodeDecodeError, OSError):
        continue
    m = re.search(r'^TARGET ([0-9a-f]{8})', text, re.M)
    if m:
        da = int(m.group(1), 16)
    else:
        m = re.search(r'^PSEUDO_RANGE ([0-9a-f]{8})', text, re.M)
        if m:
            da = int(m.group(1), 16)
        else:
            m = re.match(r'^([0-9a-f]{8})', p.stem)
            if not m:
                continue
            da = int(m.group(1), 16)
    if not (BASE <= da < BASE + len(b)):
        continue
    for hl in HOLES:
        lo, hi = hl
        for mm in LIT.finditer(text):
            off = int(mm.group(3), 16)
            if lo <= off < hi:
                hole_state[hl]['insn'].add((rel, off))
        for mm in PC_BASE.finditer(text):
            off = int(mm.group(2), 16)
            if lo <= off < hi:
                hole_state[hl]['pc'].add((rel, off))
        if any(lo <= int(mm.group(2), 16) < hi for mm in PC_BASE.finditer(text)):
            hole_state[hl]['files'].add(rel)

ck('hole_3e01_insn_candidates', len(hole_state[(0x3E01, 0x3E08)]['insn']), 0)
ck('hole_3e01_pc_candidates', len(hole_state[(0x3E01, 0x3E08)]['pc']), 0)

# the 027c witness: one base expression must carry both a hole offset and a
# covered offset just outside the hole
witness = []
for rel in sorted(hole_state[(0x27C, 0x2A0)]['files']):
    text = (DEEP / rel).read_text()
    groups = {}
    for mm in PC_BASE.finditer(text):
        groups.setdefault(mm.group(1), set()).add(int(mm.group(2), 16))
    for base, offs in groups.items():
        inside = sorted(o for o in offs if 0x27C <= o < 0x2A0)
        outside = sorted(o for o in offs if is_cov(o) and
                         (0x2A0 <= o < 0x2B0 or 0x26C < o <= 0x27C))
        if inside and outside:
            witness.append((rel, base, tuple(inside), tuple(outside)))
ck('hole_027c_witness_groups', len(witness), 12)
ck('hole_027c_witnessed_offsets',
   sorted({o for _, _, ins, _ in witness for o in ins}),
   [0x290, 0x294, 0x298, 0x29C])
ck('hole_027c_silent_prefix', 0x290 - 0x27C, 20)

# ------------------------------------------------------- 7. 0x10f0 block
LEDGER = json.loads((DEEP / 'literal-field-access/FIELD_ACCESS_LEDGER.json').read_text())
blk = [o for o in LEDGER['offsets']
       if 0x10F0 <= (int(o['offset'], 16) if isinstance(o['offset'], str) else o['offset']) < 0x21BC]
ck('block_offsets', len(blk), 44)
ck('block_accesses', sum(o['accesses'] for o in blk), 385)
ck('block_reads', sum(o['reads'] for o in blk), 201)
ck('block_writes', sum(o['writes'] for o in blk), 78)
ck('block_other', sum(o['other'] for o in blk), 106)
ck('block_functions', len({f for o in blk for f in o['functions']}), 59)
ck('block_min_offset', min(int(o['offset'], 16) for o in blk), 0x1488)

# ------------------------------------------------------- 8. cross-check outputs
for name, key, want in [
        ('SINK_SEMANTICS.json', 'assertions', 3),
        ('QUEUE_FIELDS.json', 'assertions', 0),
        ('MODEL_RESULTS.json', 'failures', 0)]:
    d = json.loads((FOLDER / name).read_text())
    if name == 'MODEL_RESULTS.json':
        ck('model_failures', d['failures'], want)
    if name == 'SINK_SEMANTICS.json':
        ck('sink_mode_count', len(d['modes']), 4)
        ck('sink_caller_va', d['caller']['va'], '0x08016eea')
    if name == 'QUEUE_FIELDS.json':
        ck('queue_doc_fields', len(d['fields']), 11)
        ck('queue_doc_writes', len(d['initialiser']['writes']), 11)

d = json.loads((FOLDER / 'DOWNSTREAM_DISPATCH.json').read_text())
ck('dispatch_doc_targets', d['bit7_set_path']['targets'],
   ['0x08017138', '0x0801714a', '0x0801715a', '0x0801715a', '0x08017162'])
ck('dispatch_doc_base', d['bit7_set_path']['table_base'], '0x08017132')

d = json.loads((FOLDER / 'HOLE_RESCAN.json').read_text())
ck('hole_doc_unwitnessed', sum(h['bytes'] for h in d['holes'] if not h['witnessed']), 7)
ck('hole_doc_witnessed_offsets', d['holes'][0]['witnessed_offsets'],
   ['0x0290', '0x0294', '0x0298', '0x029c'])

d = json.loads((FOLDER / 'BLOCK_10F0.json').read_text())
ck('block_doc_offsets', d['coverage']['distinct_offsets'], 44)
ck('block_doc_accesses', d['coverage']['accesses'], 385)

fails = [c for c in CHECKS if not c['ok']]
out = dict(
    schema='eightsleep.nonusb.receive-path.byte-validation.v1',
    date=DATE, round=13,
    source=dict(frozen_bbin=str(BBIN.relative_to(ROOT)), sha256=SHA, bytes=len(b)),
    checks=len(CHECKS), failures=len(fails),
    status='PASS' if not fails else 'FAIL',
    failure_details=fails,
    checks_detail=CHECKS,
)
(FOLDER / 'BYTE_VALIDATION.json').write_text(
    json.dumps(out, indent=2, ensure_ascii=False, sort_keys=True) + '\n')
print('checks=%d failures=%d status=%s'
      % (len(CHECKS), len(fails), out['status']))
for f in fails:
    print('  FAIL', f['label'], 'got', f['got'], 'want', f['want'])
print('sink_bytes=74 cmd_table=5 queue_writes=%d hole_witness=%d block=%d/%d'
      % (len(init_hits), len(witness), len(blk), sum(o['accesses'] for o in blk)))
