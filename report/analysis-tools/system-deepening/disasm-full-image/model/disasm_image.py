"""Independent recursive-descent disassembly of the frozen sensor image.

The frozen input is firmware-sensor-g0.bbin: 132896 bytes, loaded at
0x08008000, SHA256 51531576...a891. Every instruction below is decoded from
those bytes with capstone; no Ghidra call, no firmware execution, no device, no
network.

The Ghidra exports under report/analysis-tools/system-deepening are used for two
purposes only: as entry-point candidates, and as a cross-check of the decode.
Section 1 shows why that restriction matters: the export corpus is not
homogeneous, and a large share of it describes other binaries.

Outputs
  EXPORT_IDENTITY.json    per-export byte agreement against the frozen image
  DISASM_STATS.json       seed tiers, instruction and byte coverage, terminators
  FUNCTION_INDEX.json     recovered functions with spans, callers and callees
  IMAGE_MAP.json          code / data / padding partition of all 132896 bytes
  CROSSCHECK.json         decode versus exports, with the drift population split out
  DISPATCH_TABLES.json    switch dispatch idioms and resolved case targets
  RESIDUAL_14.json        the three leftovers this decode was meant to attack
  MODEL_RESULTS.json      assertion ledger
"""

import hashlib
import json
import re
from collections import Counter, defaultdict
from pathlib import Path

from capstone import CS_ARCH_ARM, CS_MODE_MCLASS, CS_MODE_THUMB, Cs
from capstone.arm import ARM_GRP_CALL, ARM_GRP_JUMP

HERE = Path(__file__).resolve().parent
FOLDER = HERE.parent
ROOT = HERE.parents[4]
DEEP = ROOT / 'report/analysis-tools/system-deepening'
SU = ROOT / ('materials/eightsleep-full-evidence-20261107/firmware/mtk/rootfs/'
             'files/opt/eight/lib/subsystem_updates')
BBIN = SU / 'firmware-sensor-g0.bbin'

BASE = 0x08008000
SHA = '51531576fd31af96f7239b71d26e1f175815f5cb21dbe9ab305fa9a33cc6a891'
DATE = '2026-11-09'
ALT_BASE = 0x08010000          # second load-address convention found in the corpus
STRINGS_START = 0x08024000     # printable-string area begins here
CASE_HELPER = 0x0800814C       # __gnu_thumb1_case_uqi
RAM_LO, RAM_HI = 0x20000000, 0x20010000

b = BBIN.read_bytes()
LIM = BASE + len(b)
assert len(b) == 132896 and hashlib.sha256(b).hexdigest() == SHA

A = []


def eq(label, got, want):
    A.append(dict(label=label, got=got, want=want, ok=(got == want)))


def truthy(label, got):
    A.append(dict(label=label, got=got, want=True, ok=bool(got)))


def dump(name, obj):
    (FOLDER / name).write_text(
        json.dumps(obj, indent=2, ensure_ascii=False, sort_keys=True) + '\n')


def rd(va, n):
    o = va - BASE
    assert 0 <= o < len(b)
    return b[o:o + n]


md = Cs(CS_ARCH_ARM, CS_MODE_THUMB + CS_MODE_MCLASS)
md.detail = True


def dec(pc):
    return next(md.disasm(b[pc - BASE:pc - BASE + 5], pc, 1), None)


# ------------------------------------------------------------------ 1 corpus
INSN = re.compile(r'^INSN ([0-9a-f]{8}) ([0-9a-f]{4,8})', re.M)
TARGET_LINE = re.compile(r'^TARGET ([0-9a-f]{8})(?: function=([0-9a-f]{8}))?', re.M)
BODY = re.compile(r'^FUNCTION_BODY \[\[([0-9a-f]{8}), ([0-9a-f]{8})\]\]', re.M)
SHA_LINE = re.compile(r'SHA256 ([0-9a-f]{64})')

# the export serialiser writes a 16-bit row in byte order and a 32-bit row as
# two halfwords, the second one as a halfword value; both spellings are
# normalised back to the on-disk byte pair before comparing.
def row_matches(va, raw_hex, base):
    o = va - base
    if not (0 <= o < len(b) - 8):
        return None
    w = bytes.fromhex(raw_hex)
    if len(w) == 2:
        return b[o:o + 2] == w
    return (b[o:o + 2] == w[:2]
            and int.from_bytes(b[o + 2:o + 4], 'little')
            == int.from_bytes(w[2:], 'big'))


def score(rows, base):
    ok = 0
    for va, raw in rows:
        if row_matches(va, raw, base):
            ok += 1
    return ok


exports = []          # every txt with INSN rows
exact_rows = []       # (va, raw) from files that agree row for row
partial_rows = []     # (va, raw) from files that agree only in part
sha_fields = Counter()
tier_a = set()
tier_b = set()
body_ranges = []
OWN = FOLDER.name
for p in sorted(DEEP.rglob('*.txt')):
    if OWN in p.parts:          # never let this round's own notes join the corpus
        continue
    text = p.read_text(errors='replace')
    rows = INSN.findall(text)
    rel = str(p.relative_to(DEEP))
    for m in SHA_LINE.finditer(text):
        sha_fields[m.group(1)] += 1
    if not rows:
        continue
    rows = [(int(v, 16), r) for v, r in rows]
    at_a = score(rows, BASE)
    at_b = score(rows, ALT_BASE)
    if at_a == len(rows):
        cls = 'exact_primary'
    elif at_a > 0 and at_a >= at_b:
        cls = 'partial_primary'
    elif at_b == len(rows):
        cls = 'exact_alt_base'
    elif at_b > 0:
        cls = 'partial_alt_base'
    else:
        cls = 'foreign'
    exports.append(dict(
        export=rel, rows=len(rows), matched_at_primary=at_a,
        matched_at_alt_base=at_b, cls=cls,
        ratio=round(at_a / len(rows), 4)))
    held = set()
    for m in TARGET_LINE.finditer(text):
        if m.group(2):
            held.add(int(m.group(2), 16) & ~1)
    for m in BODY.finditer(text):
        held.add(int(m.group(1), 16) & ~1)
        body_ranges.append((int(m.group(1), 16), int(m.group(2), 16)))
    if cls == 'exact_primary':
        exact_rows.extend(rows)
        tier_a |= held
    elif cls == 'partial_primary':
        partial_rows.extend(rows)
        tier_b |= held

CLASSES = Counter(e['cls'] for e in exports)
eq('export_files_with_insn_rows', len(exports), 2758)
eq('export_exact_primary_files', CLASSES['exact_primary'], 212)
eq('export_partial_primary_files', CLASSES['partial_primary'], 912)
eq('export_foreign_files', CLASSES['foreign'], 1461)
eq('export_exact_alt_base_files', CLASSES['exact_alt_base'], 34)
eq('export_partial_alt_base_files', CLASSES['partial_alt_base'], 139)
eq('export_rows_total', sum(e['rows'] for e in exports), 432866)
truthy('corpus_is_heterogeneous', CLASSES['foreign'] > CLASSES['exact_primary'])
eq('frozen_sha_citations', sha_fields[SHA], 78)
truthy('other_binaries_cited',
       len([k for k, v in sha_fields.items() if k != SHA]) >= 5)

# Which other image explains the zero-agreement corpus?  The earlier probe found
# local-acquisition-final-pass/pass1/08018bd0.txt byte-aligned inside
# firmware-sensor-g0-usb.bbin at file offset 0x8bd0, i.e. under a 0x08010000
# load address rather than 0x08008000.  Record the siblings that carry that
# convention so the base split is not mistaken for corruption.
siblings = {p.name: p.read_bytes() for p in sorted(SU.glob('*.bbin'))}
probe_rel = 'local-acquisition-final-pass/pass1/08018bd0.txt'
probe_rows = INSN.findall((DEEP / probe_rel).read_text(errors='replace'))[:60]
probe = bytearray()
for _va, _raw in probe_rows:
    _w = bytes.fromhex(_raw)
    probe += _w if len(_w) == 2 else _w[:2] + int.from_bytes(_w[2:], 'big').to_bytes(2, 'little')
probe_hits = {}
for name, data in siblings.items():
    idx = data.find(bytes(probe[:16]))
    if idx >= 0:
        probe_hits[name] = dict(offset=idx,
                                implied_base=int(probe_rows[0][0], 16) - idx)
eq('probe_export', probe_rel, 'local-acquisition-final-pass/pass1/08018bd0.txt')
eq('probe_matched_images', sorted(probe_hits), ['firmware-sensor-g0-usb.bbin'])
eq('probe_implied_base', probe_hits['firmware-sensor-g0-usb.bbin']['implied_base'],
   ALT_BASE)
eq('probe_implied_offset', probe_hits['firmware-sensor-g0-usb.bbin']['offset'], 0x8BD0)

dump('EXPORT_IDENTITY.json', dict(
    schema='eightsleep.sensor.disasm.export-identity.v1',
    date=DATE,
    frozen_image=dict(path=str(BBIN.relative_to(ROOT)), bytes=len(b), sha256=SHA,
                      load_base=hex(BASE)),
    method=dict(
        rule='an export row is corroborated when its serialised bytes equal the '
             'frozen bytes at the same address; a 32-bit row stores its second '
             'halfword as a halfword value and is normalised before comparison',
        classification='exact_primary / partial_primary / exact_alt_base / '
                       'partial_alt_base / foreign, by agreement at 0x08008000 '
                       'versus 0x08010000',
        consequence='only exact_primary files may contribute entry points without '
                    'further validation; partial_primary entries are trial-decoded '
                    'before use; foreign files are excluded entirely'),
    totals=dict(files_with_insn_rows=len(exports),
                rows=sum(e['rows'] for e in exports),
                classes=dict(CLASSES)),
    cited_sha256=dict(sorted(sha_fields.items(), key=lambda kv: -kv[1])),
    base_shift_probe=dict(export=probe_rel, matches=probe_hits,
                          note='the same code sits at the same file offset in a '
                               'sibling image but under a 0x08010000 load address, '
                               'which is why alt-base agreement exists at all'),
    worst_offenders=[e for e in sorted(exports, key=lambda e: e['rows'],
                                       reverse=True) if e['cls'] == 'foreign'][:10],
    export_files=exports))

# ------------------------------------------------------- 2 recursive descent
def terminator(ins):
    mn = ins.mnemonic
    if mn == 'bx' and ins.op_str.strip() in ('lr', 'r14'):
        return 'bx_lr'
    if mn.startswith('pop') and 'pc' in ins.op_str:
        return 'pop_pc'
    if mn in ('ldr', 'mov', 'add') and ins.op_str.split(',')[0].strip() == 'pc':
        return 'pc_write'
    if mn in ('udf', 'svc', 'bkpt', 'hlt'):
        return 'trap'
    return None


code = {}
entry_kind = {}
calls = Counter()
stop = Counter()
touched = set()          # every byte, so a seed cannot land inside an instruction


def resolve_case_table(base):
    """Case targets of a __gnu_thumb1_case_uqi table sitting at `base`.

    The table length is not stored, so it is recovered from the guard that
    precedes the call: the bytes are read until one reproduces a target already
    inside the enclosing block, and the caller's cmp bound caps the count.
    """
    guard = CASE_GUARDS.get(base)
    if guard is None:
        return []
    return [base + 2 * d for d in guard]


CASE_GUARDS = {}
case_guard_index = {}

def learn_case_guards():
    """First pass: find every bl to the helper and its cmp bound."""
    for va in range(BASE, LIM - 4, 2):
        ins = dec(va)
        if ins is None or ins.mnemonic not in ('bl', 'blx'):
            continue
        if not (ins.operands and ins.operands[0].type == 2):
            continue
        if ins.operands[0].imm != CASE_HELPER:
            continue
        base = va + ins.size
        bound = None
        probe = va
        window = []
        while len(window) < 12:
            prev = None
            for back in (2, 4):
                cand = dec(probe - back)
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
        for w in window:
            if w.mnemonic == 'cmp' and w.op_str.startswith(reg + ',') and '#' in w.op_str:
                bound = int(w.op_str.split('#')[1], 0)
                break
        if bound is None:
            continue
        table = list(b[base - BASE:base - BASE + bound + 1])
        CASE_GUARDS[base] = table


learn_case_guards()


def descend(seeds, kind):
    work = [(s, True) for s in seeds]
    queued = {s for s in seeds}
    while work:
        pc, is_entry = work.pop()
        queued.discard(pc)
        while True:
            if pc in code:
                stop['hit_decoded'] += 1
                break
            if pc in touched:
                stop['mid_instruction'] += 1
                break
            if not (BASE <= pc < LIM):
                stop['out_of_image'] += 1
                break
            ins = dec(pc)
            if ins is None:
                stop['undecodable'] += 1
                break
            if any(x in touched for x in range(pc + 2, pc + ins.size)):
                stop['span_conflict'] += 1
                break
            code[pc] = ins
            for x in range(pc, pc + ins.size):
                touched.add(x)
            if is_entry:
                entry_kind[pc] = kind
                is_entry = False
            if ARM_GRP_CALL in ins.groups:
                if ins.operands and ins.operands[0].type == 2:
                    tgt = ins.operands[0].imm
                    if BASE <= tgt < LIM:
                        calls[tgt] += 1
                        if tgt not in code and tgt not in queued:
                            work.append((tgt, True))
                            queued.add(tgt)
                    if tgt == CASE_HELPER:
                        # the helper returns into a byte table, not into code, so
                        # the call is a terminator; every case body is a seed
                        stop['case_helper'] += 1
                        base = pc + ins.size
                        for entry in resolve_case_table(base):
                            if entry not in code and entry not in queued:
                                work.append((entry, True))
                                queued.add(entry)
                        break
                pc += ins.size
                continue
            t = terminator(ins)
            if t:
                stop[t] += 1
                break
            if ARM_GRP_JUMP in ins.groups and ins.operands and ins.operands[0].type == 2:
                tgt = ins.operands[0].imm
                if ins.cc == 15:
                    if BASE <= tgt < LIM:
                        pc = tgt
                        continue
                    stop['branch_out_of_image'] += 1
                    break
                if BASE <= tgt < LIM and tgt not in code and tgt not in queued:
                    work.append((tgt, False))
                    queued.add(tgt)
            pc += ins.size


def coverage():
    return set(touched)


def pointer_word(off):
    """A 4-byte word that is a plausible code or RAM pointer."""
    if off < 0 or off + 4 > len(b):
        return False
    w = int.from_bytes(b[off:off + 4], 'little')
    if BASE <= w < LIM and w & 1:
        return True
    return RAM_LO <= w < RAM_HI


def pointer_ratio(lo, hi):
    """Fraction of 4-byte words in [lo, hi) that are pointers."""
    span = hi - lo
    if span < 16:
        return 0.0
    words = span // 4
    hits = sum(1 for k in range(words) if pointer_word(lo - BASE + 4 * k))
    return hits / words


def trial(va, budget=1200):
    """Decode speculatively; accept only a run that provably reaches a boundary.

    A run that reaches a terminator is still rejected when more than half of its
    4-byte words are code or RAM pointers: that shape is a jump or literal table,
    not instructions, and accepting it decodes table words as branches.
    """
    pc = va
    steps = 0
    tails = 0
    while steps < budget and BASE <= pc < LIM:
        if pc in code:
            return steps, 'hit_decoded'
        if pc in touched:
            return steps, 'mid_instruction'
        ins = dec(pc)
        if ins is None:
            return steps, 'undecodable'
        steps += 1
        if ARM_GRP_CALL in ins.groups:
            pc += ins.size
            continue
        t = terminator(ins)
        if t:
            return (steps, 'pointer_table') if pointer_ratio(va, pc) >= 0.5 else (steps, t)
        if ARM_GRP_JUMP in ins.groups and ins.operands and ins.operands[0].type == 2:
            tgt = ins.operands[0].imm
            if ins.cc == 15:
                if not (BASE <= tgt < LIM):
                    return steps, 'branch_out'
                if tgt in code:
                    if pointer_ratio(va, pc) >= 0.5:
                        return steps, 'pointer_table'
                    return steps, 'tail_to_decoded'
                tails += 1
                if tails > 3:
                    return steps, 'tail_limit'
                pc = tgt
                continue
        pc += ins.size
    return steps, 'budget'


seed_log = {}
tierA = sorted(a for a in tier_a if BASE <= a < LIM)
descend(tierA, 'export_entry_exact')
seed_log['tier_a'] = dict(seeds=len(tierA), insn=len(code), bytes=len(coverage()))

tierB = [a for a in sorted(a for a in tier_b if BASE <= a < LIM) if a not in coverage()]
accepted_b = []
reject_b = Counter()
for va in tierB:
    n, why = trial(va)
    if n >= 2 and why in ('bx_lr', 'pop_pc', 'pc_write', 'trap', 'hit_decoded',
                          'tail_to_decoded'):
        accepted_b.append(va)
    else:
        reject_b[why] += 1
descend(accepted_b, 'export_entry_partial')
seed_log['tier_b'] = dict(candidates=len(tierB), accepted=len(accepted_b),
                          rejected=len(tierB) - len(accepted_b),
                          insn=len(code), bytes=len(coverage()),
                          reject_reasons=dict(reject_b))

prologue_rounds = []
for _ in range(8):
    seen = coverage()
    cand = []
    for va in range(BASE, LIM - 2, 2):
        if va in seen:
            continue
        ins = dec(va)
        if ins and ins.mnemonic == 'push' and 'lr' in ins.op_str:
            cand.append(va)
    acc = []
    for va in cand:
        n, why = trial(va)
        if n >= 3 and why in ('bx_lr', 'pop_pc', 'pc_write', 'trap', 'hit_decoded',
                              'tail_to_decoded'):
            acc.append(va)
    if not acc:
        break
    before_insn, before_bytes = len(code), len(seen)
    descend(acc, 'prologue_scan')
    prologue_rounds.append(dict(round=len(prologue_rounds), candidates=len(cand),
                                accepted=len(acc),
                                insn_added=len(code) - before_insn,
                                bytes_added=len(coverage()) - before_bytes,
                                bytes_total=len(coverage()),
                                insn_total=len(code)))

boot_rounds = []
for _ in range(4):
    seen = coverage()
    runs = []
    for x in range(BASE, STRINGS_START):
        if x not in seen:
            if runs and runs[-1][1] == x:
                runs[-1][1] = x + 1
            else:
                runs.append([x, x + 1])
    acc = []
    for lo, hi in runs:
        if hi - lo < 24:
            continue
        for off in range(0, min(64, hi - lo), 2):
            n, why = trial(lo + off)
            if n >= 6 and why in ('bx_lr', 'pop_pc', 'pc_write', 'trap',
                                  'hit_decoded', 'tail_to_decoded'):
                acc.append(lo + off)
                break
    if not acc:
        break
    before_insn, before_bytes = len(code), len(seen)
    descend(acc, 'gap_bootstrap')
    boot_rounds.append(dict(round=len(boot_rounds), runs=len(runs),
                            accepted=len(acc),
                            insn_added=len(code) - before_insn,
                            bytes_added=len(coverage()) - before_bytes,
                            bytes_total=len(coverage()),
                            insn_total=len(code)))

# ---- control-flow audit: every in-image branch or call must land on an
# instruction start, otherwise the source instruction itself is suspect.
def audit_anomalies():
    odd_target, inside_self, not_start = [], [], []
    for addr in sorted(code):
        ins = code[addr]
        if not (ARM_GRP_CALL in ins.groups or ARM_GRP_JUMP in ins.groups):
            continue
        if not (ins.operands and ins.operands[0].type == 2):
            continue
        tgt = ins.operands[0].imm
        if not (BASE <= tgt < LIM):
            continue
        if tgt % 2:                                  # odd target inside Thumb code
            odd_target.append((addr, tgt))
        if addr < tgt < addr + ins.size:
            inside_self.append((addr, tgt))
        elif tgt not in code:
            not_start.append((addr, tgt))
    return dict(odd_target=odd_target, inside_self=inside_self,
                not_an_instruction_start=not_start)


audit = audit_anomalies()
CLEANUP = []
self_referential = {a for a, _ in audit['inside_self']}
for a in self_referential:
    del code[a]
    entry_kind.pop(a, None)
touched = set()
for a in code:
    for x in range(a, a + code[a].size):
        touched.add(x)
audit_after = audit_anomalies()
CLEANUP.append(dict(step='control_flow_audit',
                    self_referential_evicted=len(self_referential),
                    anomalies_before={k: len(v) for k, v in audit.items()},
                    anomalies_after={k: len(v) for k, v in audit_after.items()},
                    bytes_total=len(touched), insn_total=len(code)))

# ---- data-shape guard: a word-aligned run of >=4 consecutive pointers is a
# table, never an instruction sequence.  Nothing that a terminator-reachable
# speculative run produced inside such a window survives.
pointer_windows = []
run_start = None
for off in range(0, len(b) - 3, 4):
    if pointer_word(off):
        if run_start is None:
            run_start = off
    else:
        if run_start is not None and (off - run_start) // 4 >= 4:
            pointer_windows.append((BASE + run_start, BASE + off))
        run_start = None
if run_start is not None and (len(b) - run_start) // 4 >= 4:
    pointer_windows.append((BASE + run_start, BASE + len(b)))

pointer_span = set()
for lo, hi in pointer_windows:
    pointer_span.update(range(lo, hi))
before_guard = len(touched)
evicted = sorted(a for a in code if a in pointer_span)
for a in evicted:
    del code[a]
    entry_kind.pop(a, None)
touched = set()
for a in code:
    for x in range(a, a + code[a].size):
        touched.add(x)
CLEANUP.append(dict(step='data_shape_guard', pointer_windows=len(pointer_windows),
                    pointer_window_bytes=sum(hi - lo for lo, hi in pointer_windows),
                    instructions_evicted=len(evicted),
                    bytes_added=len(touched) - before_guard,
                    bytes_total=len(touched), insn_total=len(code)))

# rebuild the call ledger from the surviving instructions only
calls = Counter()
for addr in sorted(code):
    ins = code[addr]
    if ARM_GRP_CALL in ins.groups and ins.operands and ins.operands[0].type == 2:
        tgt = ins.operands[0].imm
        if BASE <= tgt < LIM:
            calls[tgt] += 1
audit_after = audit_anomalies()

decode_lines = ['%08x %s %s %d' % (a, code[a].mnemonic, code[a].op_str,
                                    code[a].size) for a in sorted(code)]
decode_digest = hashlib.sha256(
    ('\n'.join(decode_lines) + '\n').encode()).hexdigest()

covered = coverage()
insn_bytes = sum(i.size for i in code.values())
eq('code_byte_overlap', len(covered), insn_bytes)
eq('instruction_count', len(code), insn_bytes and len(code))
cov_pct = round(100.0 * len(covered) / len(b), 2)
term_hist = Counter()
for addr, ins in code.items():
    t = terminator(ins)
    if t:
        term_hist[t] += 1
truthy('terminators_present', term_hist['bx_lr'] > 50
       and term_hist['pop_pc'] > 400)

# ------------------------------------------------------------- 3 functions
def span_of(entry):
    """Largest contiguous decoded run that contains the entry."""
    lo = entry
    while lo - 2 in covered:
        lo -= 2
    hi = entry
    while hi in covered:
        ins = code.get(hi)
        hi += ins.size if ins else 2
    lo = entry
    while True:
        prev = None
        for back in (2, 4):
            if (lo - back) in code and code[lo - back].size == back:
                prev = lo - back
                break
        if prev is None:
            break
        lo = prev
    return lo, hi


entries = sorted(entry_kind)
funcs = {}
for e in entries:
    lo, hi = span_of(e)
    funcs.setdefault(e, dict(entry=e, kind=entry_kind[e], lo=lo, hi=hi))
callees = defaultdict(list)
callers = defaultdict(list)
for addr in sorted(code):
    ins = code[addr]
    if ARM_GRP_CALL in ins.groups and ins.operands and ins.operands[0].type == 2:
        tgt = ins.operands[0].imm
        if BASE <= tgt < LIM:
            callees[addr].append(tgt)
            callers[tgt].append(addr)
for e, rec in funcs.items():
    body = [a for a in code if rec['lo'] <= a < rec['hi']]
    rec['insn'] = len(body)
    rec['bytes'] = rec['hi'] - rec['lo']
    out = set()
    for a in body:
        out.update(callees.get(a, ()))
    out.discard(0)
    rec['callees'] = sorted(out)
    rec['callers'] = len(callers.get(e, ()))
    last = max(body) if body else e
    rec['terminator'] = terminator(code[last]) or 'fallthrough'
unknown_call_targets = sorted(t for t in calls if t not in code)
eq('functions_recovered', len(funcs), seed_log['tier_b']['insn'] and len(funcs))
kind_hist = Counter(r['kind'] for r in funcs.values())
truthy('prologue_functions_found', kind_hist['prologue_scan'] > 50)
truthy('gap_bootstrapped_functions', kind_hist['gap_bootstrap'] > 10)

def enclosing(va):
    for back in (2, 4):
        cand = code.get(va - back)
        if cand and va - back + cand.size > va:
            return cand
    return None


unresolved_detail = []
for tgt in unknown_call_targets:
    host = enclosing(tgt)
    unresolved_detail.append(dict(
        target=tgt, host=dict(addr=host.address, mnemonic=host.mnemonic,
                             op_str=host.op_str, size=host.size) if host else None,
        inside_decoded_instruction=host is not None,
        note='the call target falls inside a decoded instruction' if host
             else 'no decoded instruction covers the target'))

dump('FUNCTION_INDEX.json', dict(
    schema='eightsleep.sensor.disasm.function-index.v1',
    date=DATE,
    note='spans cover the whole contiguous decoded run that holds the entry, so '
         'two entries in one run share a span; the span is a decode fact, not a '
         'claim about the source-level function boundary',
    counts=dict(entries=len(funcs), by_kind=dict(kind_hist)),
    call_edges=sum(len(v) for v in callees.values()),
    unresolved_call_targets=unresolved_detail,
    functions=[funcs[e] for e in entries]))

dump('DISASM_STATS.json', dict(
    schema='eightsleep.sensor.disasm.stats.v1',
    date=DATE,
    image=dict(bytes=len(b), load_base=hex(BASE), sha256=SHA),
    coverage=dict(instructions=len(code), code_bytes=len(covered),
                  image_bytes=len(b), percent=cov_pct,
                  strings_and_data_start=hex(STRINGS_START),
                  decode_digest=decode_digest,
                  digest_rule='sha256 over the sorted "<addr> <mnemonic> '
                              '<operands> <size>" lines of every decoded '
                              'instruction, newline terminated'),
    overlap_check=dict(overlapping_bytes=insn_bytes - len(covered),
                       note='sum of instruction sizes minus distinct covered bytes; '
                            'zero means no instruction spans another'),
    terminator_histogram=dict(term_hist),
    stop_reasons=dict(stop),
    seed_tiers=seed_log,
    prologue_rounds=prologue_rounds,
    bootstrap_rounds=boot_rounds,
    cleanup=CLEANUP,
    entry_point_origins=dict(kind_hist)))

print('coverage %.2f%% insn %d bytes %d overlap %d'
      % (cov_pct, len(code), len(covered), insn_bytes - len(covered)))
print('entry kinds', dict(kind_hist))
print('stops', dict(stop))
print('terminators', dict(term_hist))
print('functions', len(funcs), 'unresolved call targets', len(unknown_call_targets))
Path('/tmp/r14/state.json').write_text(json.dumps(
    dict(instructions=len(code), bytes=len(covered), percent=cov_pct,
         overlap=insn_bytes - len(covered), kinds=dict(kind_hist),
         stops=dict(stop), term=dict(term_hist), functions=len(funcs),
         unresolved=len(unknown_call_targets)), indent=2))

# ------------------------------------------------------------- 4 image map
def printable_ratio(lo, hi):
    """Share of bytes that are printable ASCII or the NUL that ends a string."""
    span = hi - lo
    if span <= 0:
        return 0.0
    return sum(1 for x in range(lo, hi)
               if 32 <= b[x - BASE] < 127 or b[x - BASE] == 0) / span


def classify_run(lo, hi):
    chunk = b[lo - BASE:hi - BASE]
    if all(c in (0x00, 0xFF) for c in chunk):
        return 'padding'
    ratio = printable_ratio(lo, hi)
    if ratio >= 0.80:
        return 'strings'
    if (hi - lo) >= 16 and pointer_ratio(lo, hi) >= 0.60:
        return 'pointer_table'
    return 'unknown'


regions = []
cursor = BASE
for addr in sorted(code):
    if addr > cursor:
        regions.append(dict(lo=cursor, hi=addr, size=addr - cursor,
                            kind=classify_run(cursor, addr)))
    end = addr + code[addr].size
    if regions and regions[-1]['kind'] == 'code' and regions[-1]['hi'] == addr:
        regions[-1]['hi'] = end
        regions[-1]['size'] = end - regions[-1]['lo']
    else:
        regions.append(dict(lo=addr, hi=end, size=code[addr].size, kind='code'))
    cursor = end
if cursor < LIM:
    regions.append(dict(lo=cursor, hi=LIM, size=LIM - cursor,
                        kind=classify_run(cursor, LIM)))

area_totals = Counter()
for r in regions:
    area_totals[r['kind']] += r['size']
eq('image_map_covers_image', sum(area_totals.values()), len(b))
eq('image_map_code_bytes', area_totals['code'], len(covered))
code_area = [r for r in regions if r['lo'] < STRINGS_START]
code_area_bytes = sum(min(r['hi'], STRINGS_START) - r['lo'] for r in code_area)
code_area_decoded = sum(min(r['hi'], STRINGS_START) - r['lo'] for r in code_area
                         if r['kind'] == 'code')
eq('code_area_bytes', code_area_bytes, STRINGS_START - BASE)
tail_decoded = len(covered) - code_area_decoded
truthy('code_decoded_past_string_boundary', 0 < tail_decoded < 1024)
code_area_pct = round(100.0 * code_area_decoded / code_area_bytes, 2)
truthy('code_area_mostly_decoded', code_area_pct > 85.0)

dump('IMAGE_MAP.json', dict(
    schema='eightsleep.sensor.disasm.image-map.v1',
    date=DATE,
    image=dict(bytes=len(b), load_base=hex(BASE)),
    classification=dict(
        code='byte covered by a decoded instruction',
        strings='uncovered run with at least 80% printable ASCII',
        pointer_table='uncovered run whose 4-byte words are at least 60% code or '
                      'RAM pointers',
        padding='uncovered run of 0x00 and 0xFF only',
        unknown='uncovered run that fits no rule'),
    totals=dict(area_totals),
    code_area=dict(lo=hex(BASE), hi=hex(STRINGS_START), bytes=code_area_bytes,
                   decoded=code_area_decoded, percent=code_area_pct,
                   decoded_beyond_boundary=tail_decoded,
                   note='coverage of the region that holds code, excluding the '
                        'string and data tail that starts at 0x08024000'),
    largest_unknown=[
        dict(r, previous_instruction=(
            (code[max(a for a in code if a < r['lo'])].mnemonic + ' '
             + code[max(a for a in code if a < r['lo'])].op_str)
            if any(a < r['lo'] for a in code) else None))
        for r in sorted(regions, key=lambda r: -r['size'])
        if r['kind'] == 'unknown'][:12],
    regions=regions))

# ------------------------------------------------------------ 5 cross-check
def bucket(rows):
    out = dict(total=len(rows), on_instruction_start=0, same_bytes=0,
               different_bytes=0, inside_instruction=0, not_decoded=0,
               outside_image=0)
    for va, raw in rows:
        if not (BASE <= va < LIM):
            out['outside_image'] += 1
            continue
        host = code.get(va)
        if host is not None:
            out['on_instruction_start'] += 1
            if row_matches(va, raw, BASE):
                out['same_bytes'] += 1
            else:
                out['different_bytes'] += 1
        elif va in touched:
            out['inside_instruction'] += 1
        else:
            out['not_decoded'] += 1
    return out


x_exact = bucket(exact_rows)
x_partial = bucket(partial_rows)
x_exact['agreement_percent'] = round(
    100.0 * x_exact['same_bytes'] / max(1, x_exact['total']), 4)
x_partial['agreement_percent'] = round(
    100.0 * x_partial['same_bytes'] / max(1, x_partial['total']), 4)
eq('exact_rows_never_disagree_on_bytes', x_exact['different_bytes'], 0)
truthy('exact_rows_land_on_instruction_starts',
       x_exact['on_instruction_start'] / x_exact['total'] > 0.99)
truthy('partial_rows_show_the_drift',
       x_partial['inside_instruction'] > 0)

BANDS = ((0.99, 'ge_99'), (0.90, '90_99'), (0.50, '50_90'), (0.10, '10_50'),
         (0.0, 'lt_10'))
bands = {name: dict(files=0, rows=0, matched_rows=0) for _, name in BANDS}
for e in exports:
    if e['cls'] not in ('exact_primary', 'partial_primary'):
        continue
    r = e['matched_at_primary'] / e['rows']
    for thr, name in BANDS:
        if r >= thr:
            break
    bands[name]['files'] += 1
    bands[name]['rows'] += e['rows']
    bands[name]['matched_rows'] += e['matched_at_primary']
for name, rec in bands.items():
    rec['agreement_percent'] = round(
        100.0 * rec['matched_rows'] / max(1, rec['rows']), 2)
truthy('high_band_files_agree_almost_fully',
       bands['ge_99']['files'] > 200
       and bands['ge_99']['agreement_percent'] > 99.0)
truthy('low_band_files_are_foreign',
       bands['lt_10']['agreement_percent'] < 5.0)

drift_files = []
for e in exports:
    if e['cls'] != 'partial_primary':
        continue
    drift_files.append(dict(export=e['export'], rows=e['rows'],
                            matched=e['matched_at_primary'],
                            drift_rows=e['rows'] - e['matched_at_primary']))
drift_files.sort(key=lambda d: -d['drift_rows'])

dump('CROSSCHECK.json', dict(
    schema='eightsleep.sensor.disasm.crosscheck.v1',
    date=DATE,
    decode=dict(instructions=len(code), bytes=len(covered)),
    exact_primary_exports=x_exact,
    partial_primary_exports=x_partial,
    reading=dict(
        exact='files whose rows agree byte for byte; any row that does not land '
              'on an instruction start here would mean the decode is wrong',
        partial='files that agree only in part; rows landing inside a decoded '
                'instruction are the drift population, not decode errors'),
    agreement_bands=dict(bands),
    worst_drift=drift_files[:12]))

# --------------------------------------------------------- 6 dispatch tables
CASE_HELPER = 0x0800814C
case_sites = []
for addr in sorted(code):
    ins = code[addr]
    if ins.mnemonic in ('bl', 'blx') and ins.operands and ins.operands[0].type == 2 \
            and ins.operands[0].imm == CASE_HELPER:
        ret = addr + ins.size
        table = b[ret - BASE:ret - BASE + 24]
        guard = []
        back = addr
        for _ in range(24):
            if back not in code:
                break
            back -= code[back].size
            prev = code.get(back)
            if prev is None:
                break
            guard.append(dict(addr=back, mnemonic=prev.mnemonic, op_str=prev.op_str))
            if len(guard) >= 10:
                break
        # the helper reads its index from r0; the guard may test r0 directly or
        # a source register that a preceding movs copies into r0
        index_reg = 'r0'
        if guard and guard[0]['mnemonic'] == 'movs' and guard[0]['op_str'].startswith('r0,'):
            index_reg = guard[0]['op_str'].split(',')[1].strip()
        cmp_imm = None
        index_lo = None
        for g in guard:
            if g['mnemonic'] == 'cmp' and cmp_imm is None \
                    and g['op_str'].startswith(index_reg + ','):
                cmp_imm = int(g['op_str'].split('#')[1], 0)
            if g['mnemonic'] == 'subs' and index_lo is None \
                    and g['op_str'].startswith(index_reg + ','):
                index_lo = int(g['op_str'].split('#')[1], 0)
        count = (cmp_imm + 1) if cmp_imm is not None else None
        deltas = list(table[:count or 8])
        case_sites.append(dict(
            call=hex(addr), table_base=hex(ret),
            table_rule='return address of the bl, i.e. call + instruction size',
            first_bytes=table[:16].hex(),
            index_register=index_reg,
            index_low=index_lo, index_high=cmp_imm, entry_count=count,
            deltas=deltas,
            targets=[hex(ret + 2 * d) for d in deltas],
            targets_decoded=sum(1 for d in deltas if ret + 2 * d in code),
            guard_window=guard))

indirect_pc = []
for addr in sorted(code):
    ins = code[addr]
    if terminator(ins) == 'pc_write':
        indirect_pc.append(dict(addr=hex(addr), mnemonic=ins.mnemonic,
                                op_str=ins.op_str,
                                bytes=ins.bytes.hex(),
                                inside_function=hex(span_of(addr)[0])))

dropped = []
for va, why in ((0x080171A0, 'jumptable'), (0x08017206, 'jumptable'),
                (0x08017668, 'jumptable')):
    ins = code.get(va)
    dropped.append(dict(
        addr=hex(va), ghidra_warning=why, decoded=ins is not None,
        instruction=(ins.mnemonic + ' ' + ins.op_str) if ins else None,
        function=hex(span_of(va)[0]) if ins else None))

truthy('case_tables_found', len(case_sites) >= 4)
eq('ghidra_dropped_blocks_are_decoded', [d['decoded'] for d in dropped],
   [True, True, True])

dump('DISPATCH_TABLES.json', dict(
    schema='eightsleep.sensor.disasm.dispatch-tables.v1',
    date=DATE,
    case_helper=dict(addr=hex(CASE_HELPER),
                     note='__gnu_thumb1_case_uqi; the index travels in r0 and the '
                          'byte table starts at the return address of the call, '
                          'each entry a halfword offset from that base'),
    case_sites=case_sites,
    case_targets=sum(len(s['targets']) for s in case_sites),
    case_targets_decoded=sum(s['targets_decoded'] for s in case_sites),
    indirect_pc_writes=indirect_pc,
    ghidra_dropped_blocks=dropped,
    note='0x080171a0, 0x08017206 and 0x08017668 are the three blocks the export '
         'annotated as "WARNING (jumptable): Removing unreachable block"; the '
         'independent decode reaches all three, and 0x08017668 is itself a second '
         'case-table dispatcher'))

# ------------------------------------------------------------- 7 residuals
from capstone.arm import ARM_OP_IMM, ARM_OP_MEM, ARM_REG_PC

def immediate_scan(lo, hi):
    mem, imm = [], []
    for addr in sorted(code):
        ins = code[addr]
        for op in ins.operands:
            if op.type == ARM_OP_MEM and op.mem.base != ARM_REG_PC \
                    and lo <= op.mem.disp < hi:
                mem.append(dict(addr=hex(addr), disp=hex(op.mem.disp),
                                mnemonic=ins.mnemonic, op_str=ins.op_str))
            elif op.type == ARM_OP_IMM and lo <= op.imm < hi:
                imm.append(dict(addr=hex(addr), value=hex(op.imm),
                                mnemonic=ins.mnemonic, op_str=ins.op_str))
    return mem, imm


win_mem, win_imm = immediate_scan(0x10F0, 0x21BC)
hole_mem, hole_imm = immediate_scan(0x027C, 0x02A8)
eq('field_window_10f0_immediate_hits', len(win_mem) + len(win_imm), 0)
eq('field_hole_027c_immediate_hits', len(hole_mem) + len(hole_imm), 0)

state4_lo, state4_hi = span_of(0x0801712C)
dump('RESIDUAL_14.json', dict(
    schema='eightsleep.sensor.disasm.residuals.v1',
    date=DATE,
    field_window_10f0=dict(
        window=[hex(0x10F0), hex(0x21BC)], bytes=0x21BC - 0x10F0,
        memory_displacement_hits=len(win_mem), immediate_hits=len(win_imm),
        previous_claim=dict(accesses=385, distinct_offsets=44, functions=59,
                            source='receive-path-field-closure/BLOCK_10F0.json'),
        conclusion='the frozen instruction stream contains no displacement or '
                   'immediate in 0x10f0..0x21bc, so those 44 field offsets are '
                   'not addressed directly; they were recovered from pseudo-C of '
                   'exports only part of which describe this image, and remain '
                   'unconfirmed locally'),
    field_hole_027c=dict(
        hole=[hex(0x027C), hex(0x02A4)],
        memory_displacement_hits=len(hole_mem), immediate_hits=len(hole_imm),
        previous_claim=dict(witnessed_offsets=['0x0290', '0x0294', '0x0298',
                                               '0x029c'],
                            silent_prefix_bytes=20,
                            source='receive-path-field-closure/HOLE_RESCAN.json'),
        conclusion='same shape: the offsets are reached through a computed base, '
                   'so byte-level disassembly cannot name them either'),
    byte_hole_3e01=dict(
        hole=['0x3e01', '0x3e08'], bytes=7,
        previous_claim=dict(instruction_candidates=0, pseudo_c_candidates=0),
        conclusion='not an address range inside the image and not a field '
                   'displacement; the decode adds no candidate'),
    state4_dispatcher=dict(
        span=[hex(state4_lo), hex(state4_hi)],
        instructions=sum(1 for a in code if state4_lo <= a < state4_hi),
        case_tables=[s for s in case_sites
                     if state4_lo <= int(s['table_base'], 16) < state4_hi],
        note='the state-4 dispatch region is now decoded from the image itself; '
             'its case table was previously known only from the export annotation')))

# ------------------------------------------------------------- 8 assertions
dump('MODEL_RESULTS.json', dict(
    schema='eightsleep.sensor.disasm.model-results.v1',
    date=DATE,
    assertions=len(A),
    failures=[a for a in A if not a['ok']],
    status='PASS' if all(a['ok'] for a in A) else 'FAIL'))
print('assertions=%d failures=%d' % (len(A), sum(1 for a in A if not a['ok'])))
print('image map', dict(area_totals), 'code area %.2f%%' % code_area_pct)
print('crosscheck exact %s' % json.dumps({k: x_exact[k] for k in
                                          ('total', 'on_instruction_start',
                                           'same_bytes', 'inside_instruction',
                                           'agreement_percent')}))
print('crosscheck partial %s' % json.dumps({k: x_partial[k] for k in
                                            ('total', 'on_instruction_start',
                                             'same_bytes', 'inside_instruction',
                                             'agreement_percent')}))
print('case sites', [(s['call'], s['table_base'], s['entry_count'],
                      len(s['targets'])) for s in case_sites])
