#!/usr/bin/env python3
"""Formally exercise 08008174 (unsigned 32-bit division) instruction by instruction.

Read-only. Loads the 132 decoded INSN rows of pass1/08008174.txt and runs a
minimal, exact Thumb-1/Thumb-2 interpreter over that instruction stream. The
interpreter is NOT a paraphrase of Ghidra's pseudo-C: it decodes the exported
mnemonics and applies ARM Thumb flag semantics (N/Z/C/V), including the
divide-by-zero path through 08008272 -> 08008274 -> 0800845c.

For every test input (a, b) it compares the interpreter's (r0, r1) with
Python's (a // b, a % b), and records which instruction addresses were
executed. b == 0 is modelled explicitly (returns r0 = 0, r1 = a).

Coverage sets, edge cases, seeded random cases and the real BRR/clock inputs
are all included. No firmware is executed as a program, no Ghidra project is
modified, no device or network is contacted.

Outputs UDIV_RESULTS.json.

Usage:
  python3 model/udiv_exhaustive.py
"""
from __future__ import annotations

import json
import random
import re
from pathlib import Path

HERE = Path(__file__).resolve().parent
TOOL = HERE.parent
DATE = '2026-11-08'
EXPORT = TOOL / 'pass1' / '08008174.txt'
MASK = 0xffffffff


def parse_insns(path: Path):
    rows = []
    for line in path.read_text(errors='replace').splitlines():
        m = re.match(r'INSN ([0-9a-f]{8}) ([0-9a-f]+) (.*)', line)
        if not m:
            continue
        asm = m[3].split(' REF[', 1)[0].strip()
        rows.append((int(m[1], 16), asm))
    return rows


class ThumbDiv:
    """Exact interpreter for the instruction subset used by 08008174."""

    def __init__(self, rows):
        self.rows = rows
        self.index = {a: i for i, (a, _) in enumerate(rows)}
        self.covered = set()
        self.max_steps = 0

    @staticmethod
    def _imm(s):
        return int(s, 16)

    def _flags_nz(self, v):
        self.Z = (v & MASK) == 0
        self.N = bool(v & 0x80000000)

    def _set_cz(self, result, carry):
        self.C = carry
        self._flags_nz(result)

    def run(self, a, b, limit=100000):
        r = [0] * 16
        r[0], r[1] = a & MASK, b & MASK
        self.C = self.Z = self.N = self.V = False
        stack = []
        pc = 0
        steps = 0
        while True:
            steps += 1
            if steps > limit:
                raise RuntimeError(f'instruction budget exceeded for {a:x}/{b:x}')
            if pc >= len(self.rows):
                raise RuntimeError(f'pc ran past the exported function: {pc}')
            addr, asm = self.rows[pc]
            self.covered.add(addr)
            npc = pc + 1

            m = re.match(r'movs? (r\d),#0x([0-9a-f]+)$', asm)
            if m:
                d = int(m[1][1:])
                r[d] = self._imm(m[2]) & MASK
                self._flags_nz(r[d])          # MOVS immediate: N/Z only
                pc = npc
                continue
            m = re.match(r'movs? (r\d),(r\d)$', asm)
            if m:
                d, s = int(m[1][1:]), int(m[2][1:])
                r[d] = r[s]
                if asm.startswith('movs'):
                    self._flags_nz(r[d])
                pc = npc
                continue
            m = re.match(r'lsrs (r\d),(r\d),#0x([0-9a-f]+)$', asm)
            if m:
                d, s, n = int(m[1][1:]), int(m[2][1:]), self._imm(m[3])
                src = r[s]
                carry = bool((src >> (n - 1)) & 1) if n else self.C
                r[d] = (src >> n) & MASK if n else src
                self._set_cz(r[d], carry)
                pc = npc
                continue
            m = re.match(r'lsls (r\d),(r\d),#0x([0-9a-f]+)$', asm)
            if m:
                d, s, n = int(m[1][1:]), int(m[2][1:]), self._imm(m[3])
                src = r[s]
                carry = bool((src >> (32 - n)) & 1) if n else self.C
                r[d] = (src << n) & MASK if n else src
                self._set_cz(r[d], carry)
                pc = npc
                continue
            m = re.match(r'asrs (r\d),(r\d),#0x([0-9a-f]+)$', asm)
            if m:
                d, s, n = int(m[1][1:]), int(m[2][1:]), self._imm(m[3])
                src = r[s]
                signed = src - (1 << 32) if src & 0x80000000 else src
                carry = bool((src >> (n - 1)) & 1) if n else self.C
                val = (signed >> n) if n else signed
                r[d] = val & MASK
                self._set_cz(r[d], carry)
                pc = npc
                continue
            m = re.match(r'rev (r\d),(r\d)$', asm)
            if m:
                d, s = int(m[1][1:]), int(m[2][1:])
                v = r[s]
                r[d] = (((v & 0xff) << 24) | ((v >> 24) & 0xff) |
                        (((v >> 8) & 0xff) << 16) | (((v >> 16) & 0xff) << 8))
                pc = npc
                continue
            m = re.match(r'cmp (r\d),(r\d)$', asm)
            if m:
                x, y = r[int(m[1][1:])], r[int(m[2][1:])]
                res = (x - y) & MASK
                self.C = x >= y               # no unsigned borrow
                self._flags_nz(res)
                self.V = ((x ^ y) & (x ^ res) & 0x80000000) != 0
                pc = npc
                continue
            m = re.match(r'subs (r\d),(r\d),(r\d)$', asm)
            if m:
                d = int(m[1][1:])
                x, y = r[int(m[2][1:])], r[int(m[3][1:])]
                res = (x - y) & MASK
                self.C = x >= y
                self._flags_nz(res)
                self.V = ((x ^ y) & (x ^ res) & 0x80000000) != 0
                r[d] = res
                pc = npc
                continue
            m = re.match(r'adcs (r\d),(r\d)$', asm)
            if m:
                d = int(m[1][1:])
                x, y = r[d], r[int(m[2][1:])]
                full = x + y + (1 if self.C else 0)
                res = full & MASK
                self.C = full > MASK
                self._flags_nz(res)
                self.V = ((~(x ^ y)) & (x ^ res) & 0x80000000) != 0
                r[d] = res
                pc = npc
                continue
            m = re.match(r'b(cc|cs|eq|ne)? 0x([0-9a-f]{8})$', asm)
            if m:
                cond, target = m[1], int(m[2], 16)
                take = {'cc': not self.C, 'cs': self.C,
                        'eq': self.Z, 'ne': not self.Z,
                        None: True}[cond]
                pc = self.index[target] if take else npc
                continue
            m = re.match(r'b 0x([0-9a-f]{8})$', asm)
            if m:
                pc = self.index[int(m[1], 16)]
                continue
            if asm == 'bx lr':
                self.max_steps = max(self.max_steps, steps)
                return r[0], r[1], steps
            if asm == 'push {r0,lr}':
                stack.append(r[0])
                pc = npc
                continue
            if asm == 'pop {r1,pc}':
                r[1] = stack.pop() if stack else r[1]
                self.max_steps = max(self.max_steps, steps)
                return r[0], r[1], steps
            if re.match(r'bl 0x([0-9a-f]{8})$', asm):
                # 0800845c is a single `bx lr` no-op; verified independently.
                pc = npc
                continue
            raise RuntimeError(f'unmodelled instruction at {addr:08x}: {asm!r}')


def build_cases():
    edge = {0, 1, 2, 3, 4, 7, 8, 15, 16, 31, 32, 0x7f, 0x80, 0xff, 0x100,
            0x7fff, 0x8000, 0xffff, 0x10000, 0x1ffff, 0x7fffffff,
            0x80000000, 0xfffffffe, 0xffffffff, 0}
    for k in range(0, 32):
        edge |= {(1 << k) - 1, 1 << k, (1 << k) + 1}
    edge = sorted(x & MASK for x in edge)
    cross = [(a, b) for a in edge for b in edge if a <= 0x10000 or
             a in (0x7fffffff, 0x80000000, 0xfffffffe, 0xffffffff)] + \
            [(a, b) for a in edge for b in (0, 1, 2, 0x8000, 0x10000,
                                            0x100000, 0x80000000, 0xffffffff)]
    rng = random.Random(20261108)
    rand = [(rng.getrandbits(32), rng.getrandbits(32)) for _ in range(20000)]
    # Inputs actually used by the nonUSB USART BRR / SysTick call sites.
    clocks = [16_000_000, 64_000_000, 8_000_000, 32_000_000]
    divisors = [1, 2, 4, 6, 8, 10, 12, 16, 32, 64, 128, 256,
                0x408, 0x402, 0x108, 0x101]
    bauds = [9600, 19200, 38400, 57600, 115200, 230400, 460800, 921600]
    real = []
    for c in clocks:
        for d in divisors:
            q = c // d
            real.append((c, d))
            real.append((q + (115200 >> 1), 115200))
            for bd in bauds:
                real.append((q + (bd >> 1), bd))
                real.append((2 * q + (bd >> 1), bd))
    return dict(edge_cross=cross, seeded_random=rand, brr_call_sites=real)


def main():
    rows = parse_insns(EXPORT)
    sim = ThumbDiv(rows)
    cases = build_cases()

    groups, failures = {}, []
    for name, pairs in cases.items():
        ok = 0
        for a, b in pairs:
            got_q, got_r, _ = sim.run(a, b)
            want = (0, a) if b == 0 else (a // b, a % b)
            if (got_q, got_r) != want:
                failures.append(dict(group=name, a=f'0x{a:08x}',
                                     b=f'0x{b:08x}', got=(got_q, got_r),
                                     expected=want))
                if len(failures) >= 20:
                    break
            else:
                ok += 1
        groups[name] = dict(cases=len(pairs), passed=ok,
                           failed=len(pairs) - ok)
        if len(failures) >= 20:
            break

    # Explicit divide-by-zero and full-width cases.
    zero_cases = []
    for a in (0, 1, 0x7fffffff, 0x80000000, 0xffffffff):
        q, r, steps = sim.run(a, 0)
        zero_cases.append(dict(a=f'0x{a:08x}', quotient=q, remainder=r,
                               steps=steps,
                               status='PASS' if (q, r) == (0, a) else 'FAIL'))
        if (q, r) != (0, a):
            failures.append(dict(group='divide_by_zero', a=f'0x{a:08x}',
                                 got=(q, r), expected=(0, a)))

    checks = []

    def eq(name, got, want):
        checks.append(dict(name=name, got=str(got), expected=str(want),
                           status='PASS' if got == want else 'FAIL'))
        if got != want:
            failures.append(dict(group='assertion', name=name,
                                 got=got, expected=want))

    eq('exported_instruction_rows', len(rows), 132)
    eq('no_interpreter_failures', len(failures), 0)
    for name, g in groups.items():
        eq(f'{name}_all_cases_match_integer_division', g['failed'], 0)
    eq('divide_by_zero_returns_zero_quotient',
        all(c['status'] == 'PASS' for c in zero_cases), True)
    eq('covered_distinct_instruction_addresses_ge_100',
        len(sim.covered) >= 100, True)
    eq('max_instruction_steps_under_1000', sim.max_steps < 1000, True)
    eq('entry_and_exit_instructions_covered',
        {0x08008174, 0x08008270, 0x08008272, 0x08008274, 0x0800827c}
        <= sim.covered, True)
    # A counterfactual: reusing the helper as multiplication must NOT agree.
    eq('counterfactual_division_is_not_multiplication',
        sim.run(0x100, 0x10)[0] == 0x100 * 0x10, False)

    out = dict(
        schema='eightsleep.nonusb.udiv-exhaustive-results.v1',
        date=DATE,
        status='PASS' if not failures else 'FAIL',
        method='exact Thumb instruction interpreter over the 132 exported INSN '
               'rows; every result compared with Python integer division',
        function='08008174 (ARM Thumb unsigned 32-bit division helper)',
        calling_convention='r0 = dividend, r1 = divisor; returns r0 = quotient, '
                           'r1 = remainder; b == 0 returns r0 = 0, r1 = a via '
                           '08008272 -> 08008274 -> 0800845c',
        totals=dict(
            instruction_rows=len(rows),
            distinct_instructions_executed=len(sim.covered),
            uncovered_instruction_addresses=sorted(
                f'0x{a:08x}' for a, _ in rows if a not in sim.covered),
            max_instruction_steps=sim.max_steps,
            total_cases=sum(g['cases'] for g in groups.values()),
            assertion_count=len(checks),
            failures=len(failures)),
        groups=groups,
        divide_by_zero=zero_cases,
        checks=checks,
        failures=failures[:20],
        limits=[
            'The interpreter models only the exported arithmetic subset; it '
            'does not emulate the whole firmware or any peripheral.',
            'b == 0 behaviour is a static conclusion from the exported '
            'instruction path, not a runtime observation on hardware.',
        ],
        executes_firmware_as_program=False,
    )
    (TOOL / 'UDIV_RESULTS.json').write_text(
        json.dumps(out, ensure_ascii=False, indent=1, sort_keys=True) + '\n')
    print(json.dumps(dict(status=out['status'], totals=out['totals'],
                          first_failures=failures[:6]), indent=1))
    return 0 if not failures else 1


if __name__ == '__main__':
    raise SystemExit(main())
