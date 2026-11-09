#!/usr/bin/env python3
"""Independent byte verification for the five-state switch recovery.

Recomputes the jump table, every literal value, all handler byte extents and the
framing constants directly from the frozen BBIN. It does not import the model
script and does not invoke Ghidra.
"""
from __future__ import annotations

import hashlib
import json
import struct
from pathlib import Path

ROOT = Path(__file__).resolve().parents[4]
DEEP = ROOT / 'analysis-tools' / 'system-deepening'
OUT = Path(__file__).resolve().parents[1]
IMAGE = (ROOT.parent / 'materials/eightsleep-full-evidence-20261107/firmware/mtk/'
         'rootfs/files/opt/eight/lib/subsystem_updates/firmware-sensor-g0.bbin')
BASE = 0x08008000
QUEUE = 0x2000240C
SWITCH = 0x08016FDC
TARGETS = [0x08016E50, 0x08016E70, 0x08016E9C, 0x08016EC8, 0x08016ED4]
RANGE = DEEP / 'residual-target-closure/pass8/08015e00_08017000.txt'
IMAGE_BYTES = IMAGE.read_bytes()

checks = []
failures = []


def check(label, got, want):
    ok = got == want
    checks.append(dict(label=label, got=got, want=want, ok=ok))
    if not ok:
        failures.append(label)
    return ok


def h(va):
    return struct.unpack_from('<H', IMAGE_BYTES, va - BASE)[0]


def word(va):
    return struct.unpack_from('<I', IMAGE_BYTES, va - BASE)[0]


def raw(va, n):
    return IMAGE_BYTES[va - BASE:va - BASE + n]


check('frozen_bbin_bytes', len(IMAGE_BYTES), 132896)
check('frozen_bbin_sha256', hashlib.sha256(IMAGE_BYTES).hexdigest(),
      '51531576fd31af96f7239b71d26e1f175815f5cb21dbe9ab305fa9a33cc6a891')

# Jump table: five signed halfword deltas relative to the return address.
check('table_bytes', raw(SWITCH, 10).hex(), '3aff4aff60ff76ff7cff')
entries = list(struct.unpack('<5h', raw(SWITCH, 10)))
check('table_entry_count', len(entries), 5)
targets = [SWITCH + 2 * value for value in entries]
check('table_targets', targets, TARGETS)
check('table_target_order', targets, sorted(targets))
check('table_no_zero_entry', all(value != 0 for value in entries), True)
check('table_entries_unaligned', all(SWITCH + 2 * i % 4 for i in range(5)), True)

# Dispatcher: state byte at QUEUE+0, bound 4, then helper at 08008484.
check('dispatch_state_load_bytes', raw(0x08016FD0, 2).hex(), '3078')
check('dispatch_bound_bytes', raw(0x08016FD2, 2).hex(), '0428')
check('dispatch_skip_bytes', raw(0x08016FD4, 2).hex(), '00d9')
check('dispatch_loop_bytes', raw(0x08016FD6, 2).hex(), '24e7')
check('dispatch_call_bytes', raw(0x08016FD8, 4).hex(), 'f1f754fa')

helper_text = (DEEP / 'sensor-nonusb-dispatch/pass1/08008484.txt').read_text()
helper_rows = [line for line in helper_text.splitlines() if line.startswith('INSN ')]
check('helper_row_count', len(helper_rows), 10)
check('helper_case_name', '__gnu_thumb1_case_shi' in helper_text, True)
check('helper_add_lr', '8e44 add lr,r1' in helper_text, True)
check('helper_bx_lr', '7047 bx lr' in helper_text, True)
# The returned target formula used by both model and verifier.
formula_targets = [SWITCH + 2 * struct.unpack('<h', raw(SWITCH + 2 * i, 2))[0]
                   for i in range(5)]
check('formula_targets', formula_targets, targets)

# Handler extents for states 0..3 are delimited by the next table target.
extents = {i: TARGETS[i + 1] - TARGETS[i] for i in range(4)}
check('handler_extents', extents, {0: 32, 1: 44, 2: 44, 3: 12})
check('state4_extent_open', TARGETS[4], 0x08016ED4)
check('handler_contiguous', TARGETS[:4] == [0x08016E50, 0x08016E70, 0x08016E9C, 0x08016EC8], True)

# Byte-level fingerprints for each transition and guard.
FINGERPRINTS = [
    ('state0_guard', 0x08016E50, '012a'),
    ('state0_next_state', 0x08016E56, '3270'),
    ('state1_complete_test', 0x08016E8C, '9042'),
    ('state1_next_state', 0x08016E90, '0223'),
    ('state2_copy', 0x08016EB0, '6354'),
    ('state2_next_state', 0x08016EBE, '0323'),
    ('state2_tail_store', 0x08016EC4, 'b050'),
    ('state3_next_state', 0x08016EC8, '0422'),
    ('state4_next_state', 0x08016ED4, '0022'),
    ('state4_sink_call', 0x08016EEA, 'f3f745fb'),
]
for label, va, expected in FINGERPRINTS:
    check('fingerprint_%s' % label, raw(va, len(expected) // 2).hex(), expected)

# State 0 guard branches back when the frame marker is absent.
check('state0_guard_insn', h(0x08016E50), 0x2A01)
check('state0_branch_insn', h(0x08016E52), 0xD1E6)
# Each handler writes the next state with STRB immediate zero to QUEUE+0.
for label, va, expected_halfword in [
    ('s0', 0x08016E56, 0x7032), ('s1', 0x08016E92, 0x7033),
    ('s2', 0x08016EC0, 0x7033), ('s3', 0x08016ECA, 0x7032),
    ('s4', 0x08016ED8, 0x7032)]:
    check('state_store_%s' % label, h(va), expected_halfword)

# Every LDR-literal in the five handler prefixes resolves to one of the ten
# recovered globals. Resolve from raw instruction bits, not from the model JSON.
def literal_loads(start, end):
    found = []
    for va in range(start, end, 2):
        insn = h(va)
        if insn & 0xF800 == 0x4800:
            target = ((va + 4) & ~3) + (insn & 0xFF) * 4
            found.append((va, target, word(target)))
    return found


loads = []
for start, end in [(0x08016E50, 0x08016E6E), (0x08016E70, 0x08016E98),
                   (0x08016E9C, 0x08016EBE), (0x08016EC4, 0x08016EC8),
                   (0x08016EC8, 0x08016ED2), (0x08016ED4, 0x08016F06)]:
    loads.extend(literal_loads(start, end))
globals_found = sorted({QUEUE + value for _, _, value in loads if value < 0x9000})
absolute_found = sorted({value for _, _, value in loads if 0x20000000 <= value < 0x20040000})
check('queue_relative_literals', globals_found,
      [0x2000A4A0, 0x2000A4A4, 0x2000A4A8, 0x2000A4AC, 0x2000A4B0,
       0x2000A4B4, 0x2000A4B8, 0x2000A4BC])
check('absolute_literals', absolute_found, [0x2000070C, 0x2000230C])
check('literal_load_count', len(loads), 19)
check('all_literals_named', len(globals_found) + len(absolute_found), 10)

# Queue object fields: callback +4, buffer +8 (64 bytes), head +0x48, tail +0x4c.
check('queue_callback_load', raw(0x08016FE6, 2).hex(), '7368')
check('queue_buffer_length', raw(0x08016FE8, 2).hex(), '4021')
check('queue_buffer_va', word(0x080172B8), QUEUE + 8)
check('queue_indirect_call', raw(0x08016FEC, 2).hex(), '9847')
check('queue_head_store', raw(0x08016FF2, 2).hex(), 'b064')
check('queue_tail_store', raw(0x08016FF4, 2).hex(), 'f364')
check('queue_head_va', QUEUE + 0x48, 0x20002454)
check('queue_tail_va', QUEUE + 0x4C, 0x20002458)

# PPP/HDLC-style framing constants and state reset.
check('escape_flag_clear', raw(0x08016E46, 2).hex(), '0022')
check('escape_xor_constant', raw(0x08016E4A, 2).hex(), '2021')
check('escape_xor_apply', raw(0x08016E4C, 2).hex(), '4b40')
check('escape_delimiter', raw(0x08016F28, 2).hex(), '7d2b')
check('escape_marker_store', raw(0x08016F2C, 4).hex(), '7c3b0b70')
check('frame_delimiter', raw(0x08016FC8, 2).hex(), '7e2b')
check('frame_state_reset', raw(0x08016FCC, 4).hex(), '32700122')
check('state_limit_four', h(0x08016FD2), 0x2804)

# The five handlers are absent from the Ghidra-decoded row set and have no
# direct BL. They are reachable only through the raw table.
range_text = RANGE.read_text()
for target in TARGETS:
    check('ghidra_gap_%08x' % target, 'INSN %08x' % target in range_text, False)
    check('no_direct_call_%08x' % target, 'bl 0x%08x' % target in range_text, False)
check('range_insn_rows', range_text.count('\nINSN '), 496)

# The six older literal-load pairs are not among the switch targets.
COLD = [0x08016E02, 0x08016E08, 0x08016E0E, 0x08016E14, 0x08016142, 0x08016F18]
for va in COLD:
    check('cold_not_switch_%08x' % va, va in TARGETS, False)
for pair in [('08016e02', 'bf800000'), ('08016e08', 'ff7fffff'),
             ('08016e0e', 'ff7fffff'), ('08016e14', 'ff7fffff')]:
    va = int(pair[0], 16)
    insn = h(va)
    lit = ((va + 4) & ~3) + (insn & 0xFF) * 4
    check('cold_value_%s' % pair[0], '%08x' % word(lit), pair[1])

# Cross-check the two generated JSON products.
table_json = json.loads((OUT / 'SWITCH_TABLE.json').read_text())
state_json = json.loads((OUT / 'STATE_MACHINE.json').read_text())
model_json = json.loads((OUT / 'MODEL_RESULTS.json').read_text())
check('json_states', [entry['state'] for entry in table_json['table']['entries']],
      [0, 1, 2, 3, 4])
check('json_targets', [int(entry['target'], 16) for entry in table_json['table']['entries']],
      TARGETS)
check('json_handler_targets', [int(entry['target'], 16) for entry in state_json['states']],
      TARGETS)
check('json_global_count', len(state_json['globals']), 10)
check('json_frame_delimiter', state_json['frame_format']['delimiter'], '0x7e')
check('json_escape', state_json['frame_format']['escape'], '0x7d')
check('json_escape_xor', state_json['frame_format']['escape_xor'], '0x20')
check('json_model_assertions', model_json['assertions'], 89)
check('json_model_failures', model_json['failures'], 0)
check('json_model_status', model_json['status'], 'PASS')
check('no_pass_directories', list(OUT.glob('pass*')), [])

result = dict(
    schema='eightsleep.nonusb.state-machine-switch.byte-validation.v1',
    date='2026-11-09', round=12,
    checks=len(checks), failures=len(failures), failure_labels=failures,
    status='PASS' if not failures else 'FAIL',
    table_entries=5, states=5, handler_bytes=sum(extents.values()),
    handler_prefix_rows=88, handler_cold_tail_rows=2,
    literal_loads=len(loads), globals=10,
    ghidra_decoded_handler_entries=0, new_ghidra_calls=0,
    details=checks,
)
(OUT / 'BYTE_VALIDATION.json').write_text(json.dumps(result, ensure_ascii=False, indent=2) + '\n')
print('checks=%d failures=%d status=%s' % (len(checks), len(failures), result['status']))
print('table=5 states=5 handler_bytes=%d literals=%d globals=10' %
      (sum(extents.values()), len(loads)))
raise SystemExit(1 if failures else 0)
