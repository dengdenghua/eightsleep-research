#!/usr/bin/env python3
"""Static recovery of the 0x08016fdc switch table and its five state handlers.

Reads only the frozen BBIN and retained Ghidra exports. It does not invoke
Ghidra, disassemble with an external engine, execute firmware, or touch a
device. The five handler entries lie in a Ghidra-undecoded gap; their bytes are
decoded here with the public instruction forms they actually use.
"""
from __future__ import annotations

import hashlib
import json
import re
import struct
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[4]
DEEP = ROOT / 'analysis-tools' / 'system-deepening'
OUT = Path(__file__).resolve().parents[1]
IMAGE = (ROOT.parent / 'materials/eightsleep-full-evidence-20261107/firmware/mtk/'
         'rootfs/files/opt/eight/lib/subsystem_updates/firmware-sensor-g0.bbin')
BASE = 0x08008000
QUEUE = 0x2000240C
SWITCH_RETURN = 0x08016FDC
RANGE_EXPORT = DEEP / 'residual-target-closure/pass8/08015e00_08017000.txt'

ASSERT = []
IMAGE_BYTES = IMAGE.read_bytes()


def check(label, got, want):
    ok = got == want
    ASSERT.append(dict(label=label, got=got, want=want, ok=ok))
    if not ok:
        raise AssertionError('%s: got %r want %r' % (label, got, want))


def truthy(label, value):
    check(label, bool(value), True)


def rd16(va):
    return struct.unpack_from('<H', IMAGE_BYTES, va - BASE)[0]


def rd32(va):
    return struct.unpack_from('<I', IMAGE_BYTES, va - BASE)[0]


def bytes_at(va, size):
    return IMAGE_BYTES[va - BASE:va - BASE + size]


def dump(name, payload):
    text = json.dumps(payload, ensure_ascii=False, indent=2) + '\n'
    (OUT / name).write_text(text)
    print(name, len(text))


sys.path.insert(0, str(DEEP / 'report-object-layout' / 'scripts'))
import thumb_lite  # noqa: E402


def decode_prefix(va, limit=80):
    rows, reason = thumb_lite.scan(IMAGE_BYTES, BASE, va, rd32, max_halfwords=limit)
    result = []
    for row in rows:
        addr = int(row['addr'], 16)
        h = rd16(addr)
        item = dict(addr=row['addr'], halfword='0x%04x' % h,
                    bytes=bytes_at(addr, row['width']).hex(),
                    asm=row['asm'], width=row['width'], kind=row['kind'])
        if row['kind'] == 'literal':
            lit = ((addr + 4) & ~3) + ((h & 0xFF) * 4)
            value = rd32(lit)
            item['literal_va'] = '0x%08x' % lit
            item['literal_value'] = '0x%08x' % value
            if value < 0x9000:
                item['queue_relative'] = '0x%02x' % value
                item['global_va'] = '0x%08x' % (QUEUE + value)
            elif 0x20000000 <= value < 0x20040000:
                item['global_va'] = '0x%08x' % value
        result.append(item)
    return result, reason


# The dispatcher helper is the compiler's __gnu_thumb1_case_shi.
HELPER = 0x08008484
helper_text = (DEEP / 'sensor-nonusb-dispatch/pass1/08008484.txt').read_text()
truthy('helper_name', 'FUNCTION_BODY [[08008484, 08008497]]' in helper_text)
helper_rows = []
for line in helper_text.splitlines():
    match = re.match(r'^INSN ([0-9a-f]{8}) ([0-9a-f]+) (.+)$', line)
    if not match:
        continue
    addr = int(match.group(1), 16)
    helper_rows.append(dict(addr=match.group(1), halfword=match.group(2),
                            bytes=bytes_at(addr, len(match.group(2)) // 2).hex(),
                            asm=match.group(3), width=len(match.group(2)) // 2,
                            kind='decoded'))
check('helper_row_count', len(helper_rows), 10)
check('helper_adds_table_base', helper_rows[7]['asm'], 'add lr,r1')
check('helper_branch', helper_rows[9]['asm'], 'bx lr')

# Five signed halfword deltas from the return address. Target = base + 2*delta.
table_bytes = bytes_at(SWITCH_RETURN, 10)
deltas = list(struct.unpack('<5h', table_bytes))
targets = [(SWITCH_RETURN + 2 * d) & 0xFFFFFFFF for d in deltas]
check('table_bytes', table_bytes.hex(), '3aff4aff60ff76ff7cff')
check('table_entries', len(deltas), 5)
check('table_deltas', deltas, [-198, -182, -160, -138, -132])
check('switch_targets', targets,
      [0x08016E50, 0x08016E70, 0x08016E9C, 0x08016EC8, 0x08016ED4])

range_text = RANGE_EXPORT.read_text()


def rows_by_addr(text):
    found = {}
    for line in text.splitlines():
        match = re.match(r'^INSN ([0-9a-f]{8}) ([0-9a-f]+) (.+)$', line)
        if not match:
            continue
        addr = int(match.group(1), 16)
        found[addr] = dict(addr=match.group(1), halfword=match.group(2),
                           bytes=bytes_at(addr, len(match.group(2)) // 2).hex(),
                           asm=match.group(3).split(' REF[')[0],
                           width=len(match.group(2)) // 2,
                           kind='decoded')
    return found


# The actual dispatch sequence: state 0..4 is loaded from QUEUE+0, compared with
# 4, then passed to the table helper. No direct BL reaches these five entries.
range_rows = rows_by_addr(range_text)
dispatch_rows = [range_rows[va] for va in
                 (0x08016FD0, 0x08016FD2, 0x08016FD4, 0x08016FD6, 0x08016FD8)]
check('dispatch_state_load', dispatch_rows[0]['asm'], 'ldrb r0,[r6,#0x0]')
check('dispatch_state_limit', dispatch_rows[1]['asm'], 'cmp r0,#0x4')
check('dispatch_skip', dispatch_rows[2]['asm'], 'bls 0x08016fd8')
check('dispatch_loop', dispatch_rows[3]['asm'], 'b 0x08016e22')
check('dispatch_helper_call', dispatch_rows[4]['asm'], 'bl 0x08008484')

for target in targets:
    truthy('handler_absent_from_ghidra_rows_%08x' % target,
           'INSN %08x' % target not in range_text)
    truthy('handler_has_no_direct_call_%08x' % target,
           'bl 0x%08x' % target not in range_text)

# Decode each handler. Cases 0..3 end in an unconditional branch back to the
# queue loop. Case 4's prefix ends at its first far branch.
handler_specs = [
    (0, 0x08016E50, 'reset-on-frame-delimiter', 16),
    (1, 0x08016E70, 'build-byte-lane-mask', 22),
    (2, 0x08016E9C, 'copy-payload-bytes', 20),
    (3, 0x08016EC8, 'capture-trailer-high-byte', 6),
    (4, 0x08016ED4, 'combine-trailer-and-compare', 24),
]
handlers = []
for state, va, role, expected_rows in handler_specs:
    rows, reason = decode_prefix(va, 100)
    check('handler_rows_%d' % state, len(rows), expected_rows)
    check('handler_stop_%d' % state, reason, 'unconditional_branch')
    if state < 4:
        check('handler_loop_%d' % state, rows[-1]['asm'], 'b 0x08016e22')
        extent = targets[state + 1] - va
    else:
        extent = None
    handlers.append(dict(state=state, target='0x%08x' % va, role=role,
                         extent_bytes=extent, prefix_rows=len(rows),
                         stop_reason=reason, rows=rows,
                         cold_tail=[]))

# State 2 has a four-byte cold tail after its linear terminator. The BCS at
# 08016ea8 targets 08016ec4, which is otherwise unreachable by linear scan.
tail_rows, tail_reason = decode_prefix(0x08016EC4, 4)
check('state2_tail_rows', len(tail_rows), 2)
check('state2_tail_stop', tail_reason, 'unconditional_branch')
handlers[2]['cold_tail'] = tail_rows
handlers[2]['cold_tail_entry'] = '0x08016ea8 bcs 0x08016ec4'
check('state2_tail_store', tail_rows[0]['asm'], 'str r0,[r6,r2]')
for h in handlers[:4]:
    covered = sum(r['width'] for r in h['rows'] + h['cold_tail'])
    check('handler_byte_coverage_%d' % h['state'], covered, h['extent_bytes'])

check('state0_guard', handlers[0]['rows'][0]['asm'], 'cmp r2,#0x1')
check('state0_guard_branch', handlers[0]['rows'][1]['asm'], 'bne 0x08016e22')
check('state0_writes_state', handlers[0]['rows'][3]['asm'], 'strb r2,[r6,#0x0]')
check('state1_builds_byte_lane', handlers[1]['rows'][6]['asm'], 'lsls r1,r1,#0x3')
check('state1_sets_lane', handlers[1]['rows'][7]['asm'], 'lsls r3,r1')
check('state1_writes_mask', handlers[1]['rows'][20]['asm'], 'str r1,[r3,#0x0]')
check('state2_copies_byte', handlers[2]['rows'][10]['asm'], 'strb r3,[r4,r1]')
check('state2_sets_state3', handlers[2]['rows'][18]['asm'], 'strb r3,[r6,#0x0]')
check('state3_shifts_high_byte', handlers[3]['rows'][3]['asm'], 'lsls r3,r3,#0x8')
check('state3_stores_halfword', handlers[3]['rows'][4]['asm'], 'strh r3,[r6,r2]')
check('state4_sink_argument', handlers[4]['rows'][4]['asm'], 'ldr r0,[pc,#0xd8]')
check('state4_sink_target', handlers[4]['rows'][4].get('literal_value'), '0x2000070c')
check('state4_helper_call', handlers[4]['rows'][11]['asm'], 'bl 0x0800a578')

# State transitions are the first stores after each handler entry.
check('state_writes', [
    handlers[0]['rows'][3]['asm'],
    handlers[1]['rows'][17]['asm'],
    handlers[2]['rows'][18]['asm'],
    handlers[3]['rows'][1]['asm'],
    handlers[4]['rows'][2]['asm'],
], ['strb r2,[r6,#0x0]', 'strb r3,[r6,#0x0]', 'strb r3,[r6,#0x0]',
    'strb r2,[r6,#0x0]', 'strb r2,[r6,#0x0]'])

# Named globally addressed fields reached through QUEUE-relative literals.
field_addrs = {
    0x2000A4A0: 'payload buffer pointer',
    0x2000A4A4: 'payload copy limit',
    0x2000A4A8: 'payload copy index',
    0x2000A4AC: 'pointer to lane mask / completion value',
    0x2000A4B0: '16-bit trailer accumulator',
    0x2000A4B4: 'lane count',
    0x2000A4B8: 'lane index',
    0x2000A4BC: 'lane mask accumulator',
    0x2000070C: 'sink/writer object passed to 0800a578',
    0x2000230C: 'status byte, bit 7 gate and low 7-bit code',
}
seen_globals = {}
for h in handlers:
    for row in h['rows']:
        va = row.get('global_va')
        if va:
            seen_globals.setdefault(va, set()).add(h['state'])
check('global_field_count', len(seen_globals), 10)
check('global_field_set', sorted(seen_globals), sorted('0x%08x' % x for x in field_addrs))
truthy('a4a8_zeroed_by_state0',
       any(r.get('global_va') == '0x2000a4a8' for r in handlers[0]['rows']))
truthy('a4b0_zeroed_by_state0',
       any(r.get('global_va') == '0x2000a4b0' for r in handlers[0]['rows']))
truthy('a4b8_zeroed_by_state0',
       any(r.get('global_va') == '0x2000a4b8' for r in handlers[0]['rows']))
truthy('a4bc_zeroed_by_state0',
       any(r.get('global_va') == '0x2000a4bc' for r in handlers[0]['rows']))
truthy('a4ac_pointer_zeroed_by_state0',
       any(r.get('global_va') == '0x2000a4ac' for r in handlers[0]['rows'])
       and any('str r3,[r2,#0x0]' in r['asm'] for r in handlers[0]['rows']))

# PPP/HDLC asynchronous framing: 0x7d escapes the next byte, which is XORed
# with 0x20; 0x7e resets the state and enters the frame-start handler.
FRAME = [
    ('08016e38', 'ldrb r2,[r1,#0x0]', 'escape flag'),
    ('08016e3e', 'cmp r2,#0x0', 'plain byte when flag is clear'),
    ('08016e46', 'movs r2,#0x0', 'clear escape flag'),
    ('08016e48', 'strb r2,[r1,#0x0]', 'clear escape flag in queue object'),
    ('08016e4a', 'movs r1,#0x20', 'escape XOR constant'),
    ('08016e4c', 'eors r3,r1', 'unescape byte'),
    ('08016f28', 'cmp r3,#0x7d', 'escape delimiter'),
    ('08016f2c', 'subs r3,#0x7c', '0x7d becomes the escape marker value 1'),
    ('08016fc8', 'cmp r3,#0x7e', 'frame delimiter'),
    ('08016fcc', 'strb r2,[r6,#0x0]', 'frame delimiter resets state 0'),
]
for addr, asm, _ in FRAME:
    check('frame_%s' % addr, decode_prefix(int(addr, 16), 1)[0][0]['asm'], asm)

# Queue object at 0x2000240c: callback, 64-byte buffer, head/tail and escape.
queue_rows = [range_rows[va] for va in
              (0x08016FE6, 0x08016FE8, 0x08016FEA, 0x08016FEC,
               0x08016FEE, 0x08016FF0, 0x08016FF2, 0x08016FF4)]
queue_rows[2]['literal_value'] = '0x%08x' % rd32(0x080172B8)
check('queue_callback_load', queue_rows[0]['asm'], 'ldr r3,[r6,#0x4]')
check('queue_buffer_argument', queue_rows[1]['asm'], 'movs r1,#0x40')
check('queue_buffer_pointer', queue_rows[2]['asm'], 'ldr r0,[0x080172b8]')
check('queue_buffer_pointer_value', queue_rows[2]['literal_value'], '0x20002414')
check('queue_indirect_call', queue_rows[3]['asm'], 'blx r3')
check('queue_head_store', queue_rows[6]['asm'], 'str r0,[r6,#0x48]')
check('queue_tail_reset', queue_rows[7]['asm'], 'str r3,[r6,#0x4c]')
check('queue_head_offset', 0x2000240C + 0x48, 0x20002454)
check('queue_tail_offset', 0x2000240C + 0x4C, 0x20002458)
check('queue_buffer_offset', 0x2000240C + 8, 0x20002414)

# The six literal-load pairs from the previous pass are cold-path materializers
# for serializer defaults/arguments, not switch cases. The real switch is the
# five-entry table above.
COLD_PATHS = [
    dict(pair='08016e02->08015f08', condition='08015f02 [r4]==0',
         value='0xbf800000', role='default -1.0f for serialized word'),
    dict(pair='08016e08->08015f28', condition='08015f22 [r2+0x1c]==0',
         value='0xff7fffff', role='default bit-23-clear mask'),
    dict(pair='08016e0e->08015f46', condition='08015f40 [sp+0x2c]==0',
         value='0xff7fffff', role='default bit-23-clear mask'),
    dict(pair='08016e14->08015f64', condition='08015f5e [sp+0x2c]==0',
         value='0xff7fffff', role='default bit-23-clear mask'),
]
for item in COLD_PATHS:
    va = int(item['pair'].split('->')[0], 16)
    h = rd16(va)
    lit = ((va + 4) & ~3) + ((h & 0xFF) * 4)
    check('cold_literal_%s' % item['pair'], '0x%08x' % rd32(lit), item['value'])

dump('SWITCH_TABLE.json', dict(
    schema='eightsleep.nonusb.state-machine-switch.switch-table.v1',
    date='2026-11-09', round=12,
    source=dict(frozen_bbin='materials/eightsleep-full-evidence-20261107/firmware/'
                'mtk/rootfs/files/opt/eight/lib/subsystem_updates/firmware-sensor-g0.bbin',
                sha256=hashlib.sha256(IMAGE_BYTES).hexdigest()),
    helper=dict(address='0x%08x' % HELPER, name='__gnu_thumb1_case_shi',
                return_address='0x%08x' % SWITCH_RETURN,
                semantics='target = return_address + 2*int16(table[index])',
                rows=helper_rows),
    dispatch=dict(address='0x%08x' % 0x08016FD0, index_expression='[0x2000240c]',
                  valid_states=5, rows=dispatch_rows),
    table=dict(address='0x%08x' % SWITCH_RETURN, bytes=table_bytes.hex(),
               entries=[dict(state=i, delta=d, delta_hex='%d' % d,
                             entry_va='0x%08x' % (SWITCH_RETURN + 2 * i),
                             target='0x%08x' % t)
                        for i, (d, t) in enumerate(zip(deltas, targets))]),
    handlers=handlers,
    reclassification=dict(
        previous_label='six-case chain',
        corrected_label='four cold-path literal materializers plus two ordinary literal/call sites',
        switch_owner='0x08016fd8 -> 0x08016fdc, five states',
        note='The six literal-load pairs are not switch cases. The real switch '
             'is reached from 08016fd0 and dispatches state 0..4 through 08016fdc.'),
    assertions=ASSERT,
))

dump('STATE_MACHINE.json', dict(
    schema='eightsleep.nonusb.state-machine-switch.state-machine.v1',
    date='2026-11-09', round=12,
    queue_object=dict(base='0x%08x' % QUEUE,
                      fields=[dict(offset='0x00', role='frame state, 0..4'),
                              dict(offset='0x04', role='transport read callback'),
                              dict(offset='0x08', size=0x40, role='byte buffer'),
                              dict(offset='0x48', role='filled byte count / head'),
                              dict(offset='0x4c', role='consumed byte index / tail'),
                              dict(offset='0x50', role='escape flag')],
                      refill='callback(buffer+8, 0x40); head=return; tail=0',
                      rows=queue_rows),
    states=[dict(state=h['state'], target=h['target'], role=h['role'],
                 extent_bytes=h['extent_bytes'], prefix_rows=h['prefix_rows'],
                 cold_tail_rows=len(h['cold_tail']),
                 stop_reason=h['stop_reason']) for h in handlers],
    globals=[dict(address='0x%08x' % a, role=r,
                  reached_by_states=sorted(seen_globals.get('0x%08x' % a, [])))
             for a, r in field_addrs.items()],
    frame_format=dict(
        delimiter='0x7e', escape='0x7d', escape_xor='0x20',
        family='PPP/HDLC-style asynchronous byte framing',
        evidence=[dict(address=a, instruction=i, role=r) for a, i, r in FRAME],
        state_limit='values above 4 are ignored and the byte is dropped'),
    state_semantics=[
        dict(state=0, meaning='wait for 0x7e delimiter, reset accumulators, enter state 1'),
        dict(state=1, meaning='construct a 32-bit mask with 0x01 in successive byte lanes'),
        dict(state=2, meaning='copy payload bytes into buffer up to limit; a BCS cold tail stores the final index'),
        dict(state=3, meaning='capture first trailer byte as the high half'),
        dict(state=4, meaning='combine second trailer byte, call the sink helper, compare'),
    ],
    cold_paths=COLD_PATHS,
    open_items=[
        'The exact comparison semantics of 0800a578 are not resolved; it streams words to a sink object and returns the last word.',
        'The downstream consumers of the lane mask and the status byte low 7-bit code are not resolved.',
        'State 2 has two control-flow entries: the linear path and the BCS cold tail at 08016ec4.',
    ],
    assertions=[a for a in ASSERT if a['label'].startswith(('state', 'queue', 'global', 'frame', 'a4'))],
))

dump('MODEL_RESULTS.json', dict(
    schema='eightsleep.nonusb.state-machine-switch.model-results.v1',
    date='2026-11-09', round=12,
    assertions=len(ASSERT), failures=sum(not a['ok'] for a in ASSERT),
    status='PASS' if all(a['ok'] for a in ASSERT) else 'FAIL',
    headline=dict(states=5, table_entries=5, handlers_decoded=5,
                  handler_prefix_rows=sum(h['prefix_rows'] for h in handlers),
                  handler_total_rows=sum(h['prefix_rows'] + len(h['cold_tail'])
                                         for h in handlers),
                  global_fields=len(field_addrs), frame_delimiters=2,
                  ghidra_undecoded_handlers=5, new_ghidra_calls=0),
    results=ASSERT,
))

print('assertions=%d failures=%d status=%s' %
      (len(ASSERT), sum(not a['ok'] for a in ASSERT),
       'PASS' if all(a['ok'] for a in ASSERT) else 'FAIL'))
print('states=5 table=5 handlers=5 rows=%d globals=%d' %
      (sum(h['prefix_rows'] + len(h['cold_tail']) for h in handlers),
       len(field_addrs)))
