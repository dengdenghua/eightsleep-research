"""Independent re-derivation of every round-14 claim.

This script does not import the model and does not read any file the model wrote
other than the JSON evidence it is checking.  It re-extracts the export corpus,
re-runs the recursive descent with its own bookkeeping, and recomputes the decode
digest from the frozen bytes alone.  Any disagreement is a failure.

Usage:  python3 scripts/verify_round14.py
"""

import hashlib
import json
import re
import sys
from pathlib import Path

from capstone import CS_ARCH_ARM, CS_MODE_MCLASS, CS_MODE_THUMB, Cs
from capstone.arm import ARM_GRP_CALL, ARM_GRP_JUMP, ARM_OP_IMM, ARM_OP_MEM, ARM_REG_PC

HERE = Path(__file__).resolve().parent
FOLDER = HERE.parent
ROOT = HERE.parents[4]
DEEP = ROOT / 'report/analysis-tools/system-deepening'
SU = ('materials/eightsleep-full-evidence-20261107/firmware/mtk/rootfs/files/'
      'opt/eight/lib/subsystem_updates')
BASE = 0x08008000
ALT = 0x08010000
STRINGS_START = 0x08024000
SHA = '51531576fd31af96f7239b71d26e1f175815f5cb21dbe9ab305fa9a33cc6a891'

CHECKS = []


def ck(label, got, want):
    CHECKS.append(dict(label=label, got=got, want=want, ok=(got == want)))


def ok(label, cond):
    CHECKS.append(dict(label=label, got=bool(cond), want=True, ok=bool(cond)))


raw = (ROOT / SU / 'firmware-sensor-g0.bbin').read_bytes()
LIM = BASE + len(raw)
ck('image_bytes', len(raw), 132896)
ck('image_sha256', hashlib.sha256(raw).hexdigest(), SHA)


def load(name):
    return json.loads((FOLDER / name).read_text())


ident = load('EXPORT_IDENTITY.json')
stats = load('DISASM_STATS.json')
findex = load('FUNCTION_INDEX.json')
imap = load('IMAGE_MAP.json')
xcheck = load('CROSSCHECK.json')
disp = load('DISPATCH_TABLES.json')
resid = load('RESIDUAL_14.json')
model = load('MODEL_RESULTS.json')

# ---------------------------------------------------------------- corpus
ROW = re.compile(r'^INSN ([0-9a-f]{8}) ([0-9a-f]{4,8})', re.M)
TGT = re.compile(r'^TARGET ([0-9a-f]{8})(?: function=([0-9a-f]{8}))?', re.M)
BODY = re.compile(r'^FUNCTION_BODY \[\[([0-9a-f]{8}), ([0-9a-f]{8})\]\]', re.M)


def agrees(rows, base):
    hit = 0
    for va, rawh in rows:
        off = va - base
        if not (0 <= off < len(raw) - 8):
            continue
        want = bytes.fromhex(rawh)
        if len(want) == 2:
            hit += raw[off:off + 2] == want
        else:
            hit += (raw[off:off + 2] == want[:2]
                    and int.from_bytes(raw[off + 2:off + 4], 'little')
                    == int.from_bytes(want[2:], 'big'))
    return hit


classes = dict(exact_primary=0, partial_primary=0, exact_alt_base=0,
               partial_alt_base=0, foreign=0)
rows_total = 0
ent_a, ent_b = set(), set()
OWN = FOLDER.name
for p in sorted(DEEP.rglob('*.txt')):
    if OWN in p.parts:
        continue
    text = p.read_text(errors='replace')
    rows = [(int(v, 16), r) for v, r in ROW.findall(text)]
    if not rows:
        continue
    rows_total += len(rows)
    a, bb = agrees(rows, BASE), agrees(rows, ALT)
    if a == len(rows):
        cls = 'exact_primary'
    elif a > 0 and a >= bb:
        cls = 'partial_primary'
    elif bb == len(rows):
        cls = 'exact_alt_base'
    elif bb > 0:
        cls = 'partial_alt_base'
    else:
        cls = 'foreign'
    classes[cls] += 1
    held = {int(m.group(2), 16) & ~1 for m in TGT.finditer(text) if m.group(2)}
    held |= {int(m.group(1), 16) & ~1 for m in BODY.finditer(text)}
    if cls == 'exact_primary':
        ent_a |= held
    elif cls == 'partial_primary':
        ent_b |= held

ck('corpus_rows', rows_total, ident['totals']['rows'])
ck('corpus_files', sum(classes.values()), ident['totals']['files_with_insn_rows'])
for k, v in classes.items():
    ck('class_%s' % k, v, ident['totals']['classes'][k])

# ------------------------------------------------------- independent descent
md = Cs(CS_ARCH_ARM, CS_MODE_THUMB + CS_MODE_MCLASS)
md.detail = True
image = {}


def one(pc):
    out = next(md.disasm(raw[pc - BASE:pc - BASE + 5], pc, 1), None)
    return out


RET = ('bx', 'pop', 'ldr', 'mov', 'add')
decoded = {}
flat = set()


def ends(ins):
    m = ins.mnemonic
    if m == 'bx':
        return ins.op_str.strip() in ('lr', 'r14')
    if m == 'pop':
        return 'pc' in ins.op_str
    if m in ('ldr', 'mov', 'add'):
        return ins.op_str.split(',')[0].strip() == 'pc'
    return m in ('udf', 'svc', 'bkpt', 'hlt')


CASE_HELPER = 0x0800814C
CASE_TABLE = {}


def learn_cases():
    for va in range(BASE, LIM - 4, 2):
        ins = one(va)
        if ins is None or ins.mnemonic not in ('bl', 'blx'):
            continue
        if not (ins.operands and ins.operands[0].type == ARM_OP_IMM):
            continue
        if ins.operands[0].imm != CASE_HELPER:
            continue
        window, probe = [], va
        while len(window) < 12:
            prev = None
            for back in (2, 4):
                cand = one(probe - back)
                if cand is not None and cand.size == back:
                    prev = cand
                    break
            if prev is None:
                break
            window.append(prev)
            probe -= prev.size
        reg = 'r0'
        if window and window[0].mnemonic == 'movs' and window[0].op_str.startswith('r0,'):
            reg = window[0].op_str.split(',')[1].strip()
        bound = next((int(w.op_str.split('#')[1], 0) for w in window
                      if w.mnemonic == 'cmp' and w.op_str.startswith(reg + ',')
                      and '#' in w.op_str), None)
        if bound is not None:
            base = va + ins.size
            CASE_TABLE[base] = list(raw[base - BASE:base - BASE + bound + 1])


learn_cases()


def walk(seeds):
    stack = [(s, True) for s in seeds]
    pending = set(seeds)
    while stack:
        pc, first = stack.pop()
        pending.discard(pc)
        while True:
            if pc in decoded or pc in flat or not (BASE <= pc < LIM):
                break
            ins = one(pc)
            if ins is None:
                break
            if any(x in flat for x in range(pc + 2, pc + ins.size)):
                break
            decoded[pc] = ins
            flat.update(range(pc, pc + ins.size))
            if ARM_GRP_CALL in ins.groups:
                if ins.operands and ins.operands[0].type == ARM_OP_IMM:
                    tgt = ins.operands[0].imm
                    if BASE <= tgt < LIM and tgt not in decoded and tgt not in pending:
                        stack.append((tgt, True))
                        pending.add(tgt)
                    if tgt == CASE_HELPER:
                        base = pc + ins.size
                        for d in CASE_TABLE.get(base, []):
                            ent = base + 2 * d
                            if ent not in decoded and ent not in pending:
                                stack.append((ent, True))
                                pending.add(ent)
                        break
                pc += ins.size
                continue
            if ends(ins):
                break
            if ARM_GRP_JUMP in ins.groups and ins.operands \
                    and ins.operands[0].type == ARM_OP_IMM:
                tgt = ins.operands[0].imm
                if ins.cc == 15:
                    if BASE <= tgt < LIM:
                        pc = tgt
                        continue
                    break
                if BASE <= tgt < LIM and tgt not in decoded and tgt not in pending:
                    stack.append((tgt, False))
                    pending.add(tgt)
            pc += ins.size
            first = False


def pw(off):
    if off < 0 or off + 4 > len(raw):
        return False
    w = int.from_bytes(raw[off:off + 4], 'little')
    if BASE <= w < LIM and w & 1:
        return True
    return 0x20000000 <= w < 0x20010000


def pratio(lo, hi):
    if hi - lo < 16:
        return 0.0
    n = (hi - lo) // 4
    return sum(1 for k in range(n) if pw(lo - BASE + 4 * k)) / n


def spec(va, budget=1200):
    pc, steps, tails = va, 0, 0
    while steps < budget and BASE <= pc < LIM:
        if pc in decoded:
            return steps, 'hit_decoded'
        if pc in flat:
            return steps, 'mid'
        ins = one(pc)
        if ins is None:
            return steps, 'bad'
        steps += 1
        if ARM_GRP_CALL in ins.groups:
            pc += ins.size
            continue
        if ends(ins):
            return (steps, 'table') if pratio(va, pc) >= 0.5 else (steps, 'end')
        if ARM_GRP_JUMP in ins.groups and ins.operands \
                and ins.operands[0].type == ARM_OP_IMM:
            tgt = ins.operands[0].imm
            if ins.cc == 15:
                if not (BASE <= tgt < LIM):
                    return steps, 'out'
                if tgt in decoded:
                    return (steps, 'table') if pratio(va, pc) >= 0.5 \
                        else (steps, 'tail')
                tails += 1
                if tails > 3:
                    return steps, 'tail_limit'
                pc = tgt
                continue
        pc += ins.size
    return steps, 'budget'


ACCEPT = {'end', 'tail', 'hit_decoded'}

walk(sorted(a for a in ent_a if BASE <= a < LIM))
tier_b = [a for a in sorted(ent_b) if BASE <= a < LIM and a not in flat]
walk([a for a in tier_b if spec(a)[0] >= 2 and spec(a)[1] in ACCEPT])

for _ in range(8):
    cand = [va for va in range(BASE, LIM - 2, 2)
            if va not in flat and one(va) is not None
            and one(va).mnemonic == 'push' and 'lr' in one(va).op_str]
    take = [a for a in cand if spec(a)[0] >= 3 and spec(a)[1] in ACCEPT]
    if not take:
        break
    walk(take)

for _ in range(4):
    runs = []
    for x in range(BASE, STRINGS_START):
        if x not in flat:
            if runs and runs[-1][1] == x:
                runs[-1][1] = x + 1
            else:
                runs.append([x, x + 1])
    take = []
    for lo, hi in runs:
        if hi - lo < 24:
            continue
        for off in range(0, min(64, hi - lo), 2):
            n, why = spec(lo + off)
            if n >= 6 and why in ACCEPT:
                take.append(lo + off)
                break
    if not take:
        break
    walk(take)

# control-flow audit and data-shape guard, re-derived
for addr in [a for a in decoded
             if ARM_GRP_CALL in decoded[a].groups or ARM_GRP_JUMP in decoded[a].groups]:
    ins = decoded[addr]
    if not (ins.operands and ins.operands[0].type == ARM_OP_IMM):
        continue
    tgt = ins.operands[0].imm
    if BASE <= tgt < LIM and addr < tgt < addr + ins.size:
        del decoded[addr]
flat = set()
for a in decoded:
    flat.update(range(a, a + decoded[a].size))

windows = []
start = None
for off in range(0, len(raw) - 3, 4):
    if pw(off):
        if start is None:
            start = off
    else:
        if start is not None and (off - start) // 4 >= 4:
            windows.append((BASE + start, BASE + off))
        start = None
if start is not None and (len(raw) - start) // 4 >= 4:
    windows.append((BASE + start, BASE + len(raw)))
inwin = set()
for lo, hi in windows:
    inwin.update(range(lo, hi))
for a in [a for a in decoded if a in inwin]:
    del decoded[a]
flat = set()
for a in decoded:
    flat.update(range(a, a + decoded[a].size))

mine = hashlib.sha256(
    ('\n'.join('%08x %s %s %d' % (a, decoded[a].mnemonic, decoded[a].op_str,
                                  decoded[a].size)
               for a in sorted(decoded)) + '\n').encode()).hexdigest()

ck('decode_digest', mine, stats['coverage']['decode_digest'])
ck('instruction_count', len(decoded), stats['coverage']['instructions'])
ck('code_bytes', len(flat), stats['coverage']['code_bytes'])
ck('coverage_percent',
   round(100.0 * len(flat) / len(raw), 2), stats['coverage']['percent'])
ck('no_overlap', sum(i.size for i in decoded.values()), len(flat))

# every branch and call must land on an instruction start
bad = []
for addr, ins in decoded.items():
    if not (ARM_GRP_CALL in ins.groups or ARM_GRP_JUMP in ins.groups):
        continue
    if not (ins.operands and ins.operands[0].type == ARM_OP_IMM):
        continue
    tgt = ins.operands[0].imm
    if BASE <= tgt < LIM and tgt not in decoded:
        bad.append((hex(addr), hex(tgt)))
ck('all_targets_are_instruction_starts', bad, [])

# ------------------------------------------------------------ function index
ck('function_entries', findex['counts']['entries'], len(findex['functions']))
ck('function_entries_match_stat', len(findex['functions']),
   stats['entry_point_origins'] and sum(stats['entry_point_origins'].values()))
first_bad = []
for f in findex['functions']:
    entry = f['entry']
    ins = decoded.get(entry)
    if ins is None:
        first_bad.append((hex(entry), 'not decoded'))
        continue
    again = one(entry)
    if (again.mnemonic, again.op_str, again.size) != \
            (ins.mnemonic, ins.op_str, ins.size):
        first_bad.append((hex(entry), 'unstable'))
ck('function_entries_decode_stably', first_bad, [])
ck('call_edges', findex['call_edges'],
   sum(1 for a, i in decoded.items() if ARM_GRP_CALL in i.groups
       and i.operands and i.operands[0].type == ARM_OP_IMM
       and BASE <= i.operands[0].imm < LIM))
ck('unresolved_call_targets', findex['unresolved_call_targets'], [])

# --------------------------------------------------------------- image map
total = sum(r['size'] for r in imap['regions'])
ck('image_map_total', total, len(raw))
ck('image_map_code', imap['totals']['code'], len(flat))
ck('image_map_totals_sum', sum(imap['totals'].values()), len(raw))
for r in imap['regions']:
    if r['hi'] - r['lo'] != r['size']:
        ck('region_size_%x' % r['lo'], r['size'], r['hi'] - r['lo'])
ck('code_area_bytes', imap['code_area']['bytes'], STRINGS_START - BASE)
covered_in_area = len([x for x in flat if x < STRINGS_START])
ck('code_area_decoded', imap['code_area']['decoded'], covered_in_area)

# -------------------------------------------------------------- cross-check
def bucket(rows):
    out = dict(total=0, on_start=0, same=0, inside=0, outside=0)
    for va, rawh in rows:
        out['total'] += 1
        if not (BASE <= va < LIM):
            out['outside'] += 1
            continue
        if va in decoded:
            out['on_start'] += 1
            want = bytes.fromhex(rawh)
            if len(want) == 2:
                out['same'] += raw[va - BASE:va - BASE + 2] == want
            else:
                out['same'] += (raw[va - BASE:va - BASE + 2] == want[:2]
                                and int.from_bytes(raw[va - BASE + 2:va - BASE + 4],
                                                   'little')
                                == int.from_bytes(want[2:], 'big'))
        elif va in flat:
            out['inside'] += 1
    return out


exact_rows, partial_rows = [], []
for p in sorted(DEEP.rglob('*.txt')):
    if OWN in p.parts:
        continue
    text = p.read_text(errors='replace')
    rows = [(int(v, 16), r) for v, r in ROW.findall(text)]
    if not rows:
        continue
    a, bb = agrees(rows, BASE), agrees(rows, ALT)
    if a == len(rows):
        exact_rows.extend(rows)
    elif a > 0 and a >= bb:
        partial_rows.extend(rows)
ex = bucket(exact_rows)
ck('xcheck_exact_total', ex['total'], xcheck['exact_primary_exports']['total'])
ck('xcheck_exact_on_start', ex['on_start'],
   xcheck['exact_primary_exports']['on_instruction_start'])
ck('xcheck_exact_same', ex['same'], xcheck['exact_primary_exports']['same_bytes'])
ck('xcheck_exact_inside', ex['inside'], 0)
ck('xcheck_exact_percent', 100.0,
   xcheck['exact_primary_exports']['agreement_percent'])
pa = bucket(partial_rows)
ck('xcheck_partial_total', pa['total'], xcheck['partial_primary_exports']['total'])
ck('xcheck_partial_inside', pa['inside'],
   xcheck['partial_primary_exports']['inside_instruction'])

# ---------------------------------------------------------- dispatch tables
ck('case_site_count', len(disp['case_sites']), 5)
for site in disp['case_sites']:
    base = int(site['table_base'], 16)
    count = site['entry_count']
    table = list(raw[base - BASE:base - BASE + (count or 8)])
    ck('case_deltas_%s' % site['call'], site['deltas'], table)
    ck('case_targets_%s' % site['call'], site['targets'],
       [hex(base + 2 * d) for d in table])
    ck('case_targets_decoded_%s' % site['call'], site['targets_decoded'],
       sum(1 for d in table if base + 2 * d in decoded))
ck('case_targets_total', sum(len(s['targets']) for s in disp['case_sites']),
   disp['case_targets'])
ck('case_targets_decoded_total',
   sum(s['targets_decoded'] for s in disp['case_sites']),
   disp['case_targets_decoded'])
ck('case_helper_in_decode', disp['case_helper']['addr'],
   hex(0x0800814C))
ck('dropped_blocks', [d['decoded'] for d in disp['ghidra_dropped_blocks']],
   [True, True, True])
for d in disp['ghidra_dropped_blocks']:
    va = int(d['addr'], 16)
    ins = one(va)
    ck('dropped_insn_%s' % d['addr'], d['instruction'],
       ins.mnemonic + ' ' + ins.op_str)

# --------------------------------------------------------------- residuals
win_hits = 0
hole_hits = 0
for addr, ins in decoded.items():
    for op in ins.operands:
        if op.type == ARM_OP_MEM and op.mem.base != ARM_REG_PC:
            if 0x10F0 <= op.mem.disp < 0x21BC:
                win_hits += 1
            if 0x027C <= op.mem.disp < 0x02A8:
                hole_hits += 1
        elif op.type == ARM_OP_IMM:
            if 0x10F0 <= op.imm < 0x21BC:
                win_hits += 1
            if 0x027C <= op.imm < 0x02A8:
                hole_hits += 1
ck('field_window_10f0_hits', win_hits, resid['field_window_10f0'][
    'memory_displacement_hits'] + resid['field_window_10f0']['immediate_hits'])
ck('field_hole_027c_hits', hole_hits, resid['field_hole_027c'][
    'memory_displacement_hits'] + resid['field_hole_027c']['immediate_hits'])

# --------------------------------------------------------------- assertions
ok('model_assertion_count', isinstance(model['assertions'], int)
   and model['assertions'] >= 30)
ck('model_status', model['status'], 'PASS')
ck('model_failures', model['failures'], [])

fails = [c for c in CHECKS if not c['ok']]
summary = dict(
    schema='eightsleep.sensor.disasm.verification.v1',
    date='2026-11-09',
    checks=len(CHECKS),
    failures=len(fails),
    status='PASS' if not fails else 'FAIL',
    decode_digest=mine,
    independent_instructions=len(decoded),
    independent_code_bytes=len(flat),
    failed=fails,
    ledger=CHECKS)
(FOLDER / 'VERIFICATION.json').write_text(
    json.dumps(summary, indent=2, ensure_ascii=False, sort_keys=True) + '\n')
print('checks=%d failures=%d status=%s'
      % (len(CHECKS), len(fails), summary['status']))
print('independent digest %s insn %d bytes %d'
      % (mine[:16], len(decoded), len(flat)))
for f in fails[:12]:
    print('  FAIL', f['label'], f['got'], '!=', f['want'])
sys.exit(0 if not fails else 1)
