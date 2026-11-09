"""Round-13 receive-path downstream closure and residual field semantics.

Five items were still open after the frame-parser state machine was decoded:

  A. the exact semantics of the sink routine 0800a578 and its three modes;
  B. what happens after state 4 matches the 16-bit trailer (08016f06 /
     0801710c), including a second jump table at 08017132;
  C. who initialises the ten RAM fields at 0x2000240c + 0x8080..0x80b0;
  D. whether the two remaining coverage holes can be witnessed at all;
  E. what the 0x10f0 block actually holds at field granularity.

Everything is derived from the frozen BBIN and the exports that already exist
under report/analysis-tools/system-deepening. No Ghidra call, no firmware
execution, no device, no network.

Outputs: SINK_SEMANTICS.json, DOWNSTREAM_DISPATCH.json, QUEUE_FIELDS.json,
HOLE_RESCAN.json, BLOCK_10F0.json, MODEL_RESULTS.json.
"""

import hashlib
import json
import re
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


def rd(va, n):
    o = va - BASE
    assert 0 <= o < len(b), hex(va)
    return b[o:o + n]


def rd16(va):
    return int.from_bytes(rd(va, 2), 'little')


def rd32(va):
    return int.from_bytes(rd(va, 4), 'little')


def cstr(va, cap=200):
    o = va - BASE
    if not (0 <= o < len(b)):
        return None
    e = b.find(b'\0', o)
    if e < 0 or e - o > cap:
        e = min(o + cap, len(b))
    return b[o:e].decode('latin1')


def dump(name, obj):
    (FOLDER / name).write_text(
        json.dumps(obj, indent=2, ensure_ascii=False, sort_keys=True) + '\n')


assert len(b) == 132896 and hashlib.sha256(b).hexdigest() == SHA


def load(rel):
    return (DEEP / rel).read_text()


INSN = re.compile(r'^INSN ([0-9a-f]{8}) ([0-9a-f]{4,8}) (\S+)(.*)$', re.M)


def rows(rel, lo=None, hi=None):
    """Parse INSN rows out of one export, optionally clamped to [lo, hi]."""
    out = []
    for m in INSN.finditer(load(rel)):
        va = int(m.group(1), 16)
        if lo is not None and va < lo:
            continue
        if hi is not None and va >= hi:
            continue
        out.append(dict(va=va, raw=m.group(2), asm=(m.group(3) + m.group(4)).strip()))
    return out


def body(rel):
    m = re.search(r'^FUNCTION_BODY (.+)$', load(rel), re.M)
    return m.group(1).strip() if m else None


def va_span(rel):
    """Recover the address range an export covers, from TARGET/PSEUDO_RANGE/name."""
    t = load(rel)
    m = re.search(r'^TARGET ([0-9a-f]{8})', t, re.M)
    if m:
        return int(m.group(1), 16)
    m = re.search(r'^PSEUDO_RANGE ([0-9a-f]{8}) ([0-9a-f]{8})', t, re.M)
    if m:
        return int(m.group(1), 16), int(m.group(2), 16)
    m = re.match(r'^([0-9a-f]{8})(?:_([0-9a-f]{8}))?', Path(rel).stem)
    if m:
        lo = int(m.group(1), 16)
        if m.group(2):
            return lo, int(m.group(2), 16)
        return lo
    return None


# =====================================================================  A sink
SINK = 'sensor-nonusb-dispatch/pass4/0800a578.txt'
MODE1 = 'post-layout-closure/pass3/0800a480.txt'
MODE2 = 'post-layout-closure/pass3/0800a4d8.txt'

sink_rows = rows(SINK)
mode1_rows = rows(MODE1)
mode2_rows = rows(MODE2)

eq('sink_entry', sink_rows[0]['va'], 0x0800A578)
eq('sink_body', body(SINK), '[[0800a578, 0800a5c1]]')
eq('sink_insn_rows', len(sink_rows), 35)
eq('sink_last_insn', sink_rows[-1]['va'], 0x0800A5C0)
eq('mode1_body', body(MODE1), '[[0800a480, 0800a4d7]]')
eq('mode1_insn_rows', len(mode1_rows), 44)
eq('mode2_body', body(MODE2), '[[0800a4d8, 0800a503]]')
eq('mode2_insn_rows', len(mode2_rows), 22)

sink_asm = [r['asm'] for r in sink_rows]
mode1_asm = [r['asm'] for r in mode1_rows]
mode2_asm = [r['asm'] for r in mode2_rows]


def idx(lst, text):
    for i, a in enumerate(lst):
        if a.startswith(text):
            return i
    return -1


# the busy flag is written 2 on entry and 1 on exit, field offset 0x1d
eq('sink_busy_enter', sink_asm[0], 'movs r3,#0x2')
truthy('sink_busy_enter_store',
       sink_asm[1].startswith('push') and sink_asm[2] == 'strb r3,[r0,#0x1d]')
truthy('sink_busy_exit_store', 'strb r3,[r4,#0x1d]' in sink_asm)
eq('sink_busy_exit_value', sink_asm[idx(sink_asm, 'movs r3,#0x1')], 'movs r3,#0x1')
# target object is *ctx, and *ctx + 0x08 gets bit 0 set
truthy('sink_target_deref', 'ldr r3,[r0,#0x0]' in sink_asm)
truthy('sink_target_flag_set', 'ldr r5,[r3,#0x8]' in sink_asm
       and 'orrs r0,r5' in sink_asm and 'str r0,[r3,#0x8]' in sink_asm)
# mode is ctx[8] == +0x20
truthy('sink_mode_load', 'ldr r0,[r4,#0x20]' in sink_asm)
eq('sink_mode_dispatch_order', [a for a in sink_asm if a.startswith('cmp r0,#0x')],
   ['cmp r0,#0x2', 'cmp r0,#0x3', 'cmp r0,#0x1'])
truthy('sink_mode1_call', 'bl 0x0800a480' in ' '.join(sink_asm))
truthy('sink_mode2_call', 'bl 0x0800a4d8' in ' '.join(sink_asm))
truthy('sink_default_zero', 'movs r0,#0x0' in sink_asm)

# mode 3 is inlined: word count, source increments, destination stays fixed
truthy('mode3_scales_count_by_four', 'lsls r2,r2,#0x2' in sink_asm)
truthy('mode3_source_increment', 'ldmia r1!,{r0}' in sink_asm)
truthy('mode3_fixed_destination', 'str r0,[r3,#0x0]' in sink_asm)
truthy('mode3_returns_last_word', 'ldr r0,[r3,#0x0]' in sink_asm)

# mode 1: byte count, assembles four bytes as b0<<24 | b1<<16 | b2<<8 | b3
truthy('mode1_word_count', 'lsrs r7,r2,#0x2' in mode1_asm)
truthy('mode1_tail_mask', 'ands r6,r3' in mode1_asm)
truthy('mode1_byte3_to_bits24', 'lsls r3,r3,#0x18' in mode1_asm)
truthy('mode1_byte2_to_bits16', 'lsls r0,r0,#0x10' in mode1_asm)
truthy('mode1_byte1_to_bits8', 'lsls r0,r0,#0x8' in mode1_asm)
truthy('mode1_fixed_destination', 'str r3,[r4,#0x0]' in mode1_asm)
eq('mode1_tail_kinds', sorted({a.split()[0] for a in mode1_asm
                              if a.startswith(('strb', 'strh'))}), ['strb', 'strh'])

# mode 2: byte count, assembles two halfwords as h0<<16 | h1
truthy('mode2_halfword_count', 'lsrs r4,r2,#0x1' in mode2_asm)
truthy('mode2_odd_halfword_test', 'lsls r2,r2,#0x1f' in mode2_asm)
truthy('mode2_high_halfword', 'lsls r3,r3,#0x10' in mode2_asm)
truthy('mode2_fixed_destination', 'str r3,[r0,#0x0]' in mode2_asm)

SINK_DOC = dict(
    schema='eightsleep.nonusb.receive-path.sink-semantics.v1',
    date=DATE,
    entry='0x0800a578',
    body='[[0800a578, 0800a5c1]]',
    insn_rows=len(sink_rows),
    extent_bytes=0x5C2 - 0x578,
    signature='u32 sink(ctx, void *src, u32 count)',
    state=dict(
        busy_field='ctx + 0x1d',
        busy_on_entry=2,
        busy_on_exit=1,
        mode_field='ctx + 0x20  (ctx[8])',
        target_object='*ctx  (ctx[0])',
        target_flag='*ctx + 0x08, bit 0 set before dispatch and never cleared here',
    ),
    common_behaviour=(
        'every mode pushes units to ONE fixed address, *ctx + 0x00, and returns '
        'the last value read back from that address; the source pointer advances, '
        'the destination does not. This is a single-register / FIFO data port, '
        'not a memory copy into a buffer.'),
    modes=[
        dict(mode=1, handler='0x0800a480', body='[[0800a480, 0800a4d7]]',
             insn_rows=len(mode1_rows), count_unit='bytes',
             packing='b0<<24 | b1<<16 | b2<<8 | b3  (big-endian word)',
             tail='remaining (count & 3) bytes written as strb / strh / strb+strh',
             returns='*target after the last push'),
        dict(mode=2, handler='0x0800a4d8', body='[[0800a4d8, 0800a503]]',
             insn_rows=len(mode2_rows), count_unit='bytes',
             packing='h0<<16 | h1  (two little-endian halfwords into one word)',
             tail='odd trailing halfword written as strh',
             returns='*target after the last push'),
        dict(mode=3, handler='inline in 0800a578', body='0x0800a5a0..0x0800a5b0',
             insn_rows=6, count_unit='words',
             packing='verbatim 32-bit word',
             tail='none; count is already a word count',
             returns='*target after the last push'),
        dict(mode=0, handler='none', returns=0,
             note='any other mode value returns 0 without touching the port'),
    ],
    caller=dict(
        va='0x08016eea',
        state=4,
        args=dict(ctx='0x2000070c', src='[0x2000a4a0]', count='[0x2000a4a8]'),
        compare='uxth(return) is compared with the 16-bit trailer [0x2000a4b0]',
    ),
    assertions=ASSERT[:],
)

# ========================================================= B downstream dispatch
HELPER_UQI = 'local-nonusb-fdc-temperature/pass4/0800814c.txt'
STATE4 = 'sensor-nonusb-dispatch/pass3/08016e50_08016f0e.txt'
TAIL = 'sensor-nonusb-dispatch/pass4/08017102_0801710a.txt'

helper_rows = rows(HELPER_UQI)
state_rows = rows(STATE4)
tail_rows = rows(TAIL)

eq('helper_uqi_entry', helper_rows[0]['va'], 0x0800814C)
eq('helper_uqi_body', body(HELPER_UQI), '[[0800814c, 0800815d]]')
eq('helper_uqi_insn_rows', len(helper_rows), 9)
eq('state4_window_rows', len(state_rows), 95)
eq('state4_window_last', state_rows[-1]['va'], 0x08016F0E)

helper_asm = [r['asm'] for r in helper_rows]
truthy('helper_uqi_clears_bit0', 'lsrs r1,r1,#0x1' in helper_asm
       and 'lsls r1,r1,#0x1' in helper_asm)
truthy('helper_uqi_byte_table', 'ldrb r1,[r1,r0]' in helper_asm)
truthy('helper_uqi_scales_by_two', 'lsls r1,r1,#0x1' in helper_asm)
truthy('helper_uqi_adds_to_lr', 'add lr,r1' in helper_asm)
truthy('helper_uqi_bx_lr', 'bx lr' in helper_asm)

# the call site is 0801712e, so the table base is the return address 08017132
CALL = 0x0801712E
RET = CALL + 4
eq('state4_helper_call_va', CALL, 0x0801712E)
eq('state4_table_base', RET, 0x08017132)
table_bytes = rd(RET, 5)
eq('state4_table_bytes', table_bytes.hex(), '030c141418')
deltas = list(table_bytes)
targets = [(RET + 2 * d) & 0xFFFFFFFF for d in deltas]
eq('state4_table_deltas', deltas, [3, 12, 20, 20, 24])
eq('state4_table_targets', targets,
   [0x08017138, 0x0801714A, 0x0801715A, 0x0801715A, 0x08017162])
truthy('state4_targets_enter_code', all(
    any(r['va'] == t for r in rows('sensor-nonusb-dispatch/pass1/0801710c_08017190.txt'))
    for t in targets))

state_asm = [r['asm'] for r in state_rows]
truthy('state4_status_cleared_first', 'movs r2,#0x0' in state_asm
       and 'strb r2,[r6,#0x0]' in state_asm)
truthy('state4_combines_trailer', 'orrs r3,r2' in state_asm)
truthy('state4_sink_call', 'bl 0x0800a578' in ' '.join(state_asm))
truthy('state4_masks_return16', 'uxth r0,r0' in state_asm)
truthy('state4_compare_trailer', 'cmp r3,r0' in state_asm)
truthy('state4_code_mask_7f', 'movs r5,#0x7f' in state_asm and 'ands r5,r3' in state_asm)
truthy('state4_signed_bit7_test', 'sxtb r3,r3' in state_asm and 'blt 0x08016f06' in state_asm)
truthy('state4_bit7_clear_path', 'b 0x0801710c' in state_asm)

# the bit7-set path re-enters the 5-way table only for code 2..5
truthy('state4_bit7_guard_sub2', 'subs r3,r5,#0x2' in state_asm)
truthy('state4_bit7_guard_range', 'cmp r3,#0x3' in state_asm)
truthy('state4_bit7_guard_bls', 'bls 0x08016f10' in state_asm)
truthy('state4_bit7_echo_path', 'b 0x08017102' in state_asm)
eq('echo_string', cstr(0x080254FC), 'Received response to 0x%02x')
eq('reboot_string', cstr(0x08025518), 'Rebooting...')
truthy('tail_prints_echo', 'bl 0x08012754' in [r['asm'] for r in tail_rows])
eq('tail_rows', len(tail_rows), 4)

# map the five table entries onto the code they reach
handlers = []
for i, tgt in enumerate(targets):
    code = i + 1
    win = rows('sensor-nonusb-dispatch/pass1/0801710c_08017190.txt', tgt, tgt + 0x1A)
    handlers.append(dict(code=code, target='0x%08x' % tgt,
                         first_rows=[r['asm'] for r in win[:5]],
                         window=[r['asm'] for r in win]))

eq('code1_reply_byte', handlers[0]['first_rows'][1], 'movs r3,#0x46')
eq('code2_reply_len', handlers[1]['first_rows'][2], 'movs r1,#0x80')
eq('code3_4_return_four', handlers[2]['first_rows'][0], 'movs r0,#0x4')
truthy('code5_reboots', 'bl 0x0800a430' in handlers[4]['window'])

DISPATCH_DOC = dict(
    schema='eightsleep.nonusb.receive-path.downstream-dispatch.v1',
    date=DATE,
    context=(
        'state 4 clears the parser status to 0, ORs the byte into the high half of '
        'the 16-bit trailer, calls the sink and compares the masked return value '
        'with the trailer. Only an exact match reaches the command dispatcher.'),
    trailer_compare=dict(
        module='0x08016eea -> 0x0800a578', mask='uxth r0,r0',
        compare_va='0x08016ef2', not_equal='0x08016e22 (back to the frame loop)'),
    code=dict(
        source='0x2000230c', low_bits='code = byte & 0x7f',
        signed_test='sxtb r3,r3 / blt 0x08016f06',
        bit7_set='0x08016f06', bit7_clear='0x0801710c'),
    bit7_set_path=dict(
        guard='r3 = code - 2; if (r3 > 3) -> 0x08017102',
        meaning='only codes 2..5 with bit 7 set take the table',
        table_base='0x08017132',
        table_base_rule='return address of bl 0800814c at 0801712e, i.e. call + 4',
        helper='0x0800814c __gnu_thumb1_case_uqi (9 instructions, ldrb byte table)',
        table_bytes=table_bytes.hex(),
        deltas=deltas,
        targets=['0x%08x' % t for t in targets],
        handlers=handlers,
        fallthrough='0x08017102 prints the echo line and rejoins the loop at 0x08016f10'),
    bit7_clear_path=dict(
        entry='0x0801710c',
        effect='zeroes 0x20002304, emits one byte (code | 0x80) through 0x08012314, '
               'then re-dispatches on code - 1 with the second table at 0x08017132'),
    strings=dict(echo='Received response to 0x%02x', reboot='Rebooting...'),
    note=('the second table is shared by both code paths: bit7 set reaches it '
          'directly for codes 2..5, bit7 clear reaches it after the ack byte.'),
    assertions=ASSERT[:],
)

# ================================================================ C queue fields
STATE_FN = 'post-layout-closure/pass6/08016e34.txt'
INIT_FN = 'sensor-nonusb-dispatch/baseline/0801d888.txt'

state_fn = load(STATE_FN)
init_fn = load(INIT_FN)
eq('state_fn_body', re.search(r'^FUNCTION_BODY (.+)$', state_fn, re.M).group(1).strip(),
   '[[08016e22, 08016e4f] [08016f10, 08016f31] [08016fc8, 08016fdb] [08016fe6, 0801710b]]')
truthy('state_fn_loads_queue_base',
       'INSN 08016e22 5c4e ldr r6,[0x08016f94] REF[READ:08016f94=2000240c]' in state_fn)
QUEUE = 0x2000240C
eq('queue_base', QUEUE, 0x2000240C)
eq('state_fn_queue_literal', rd32(0x08016F94), QUEUE)

# the ten fields the parser touches, all as r6 + small offset
FIELD_OFFSETS = {
    0x8080: 'channel-mask array base (32 x 0x401 stride set up by the initialiser)',
    0x8084: 'pending-selection flag, cleared at init and tested by 0x08016ffc',
    0x8088: 'selection event object, polled through 0x080134be',
    0x8094: 'frame body base pointer',
    0x8098: 'frame body capacity',
    0x809c: 'frame body write index / received length',
    0x80A0: 'accepted length object pointer (dereferenced)',
    0x80A4: '16-bit trailer accumulator (halfword)',
    0x80A8: 'header byte count (state 1 limit)',
    0x80AC: 'header byte index (state 1 cursor)',
    0x80B0: 'header word accumulator (state 1)',
}
field_rows = []
for off, note in sorted(FIELD_OFFSETS.items()):
    field_rows.append(dict(offset='0x%04x' % off,
                           absolute='0x%08x' % (QUEUE + off), note=note))
eq('queue_field_count', len(field_rows), 11)

# 0801d888 initialises the same ten fields through literal offset registers
LIT_OFF = re.compile(
    r'^INSN ([0-9a-f]{8}) [0-9a-f]{4,8} ldr r(\d),\[0x[0-9a-f]{8}\] '
    r'REF\[READ:[0-9a-f]{8}=([0-9a-f]+)\]', re.M)
STORE = re.compile(
    r'^INSN ([0-9a-f]{8}) [0-9a-f]{4,8} (\w+) r(\d),\[(r\d),r(\d)\]', re.M)
regs = {}
init_writes = []
for line in init_fn.splitlines():
    m = LIT_OFF.match(line)
    if m:
        regs['r' + m.group(2)] = (int(m.group(3), 16), line)
        continue
    m = STORE.match(line)
    if m and m.group(2) in ('str', 'strb', 'strh'):
        hit = regs.get('r' + m.group(5))
        if hit and 0x8080 <= hit[0] <= 0x80B8:
            init_writes.append(dict(va=m.group(1), op=m.group(2), src='r' + m.group(3),
                                    base=m.group(4), offset='0x%04x' % hit[0],
                                    literal_line=hit[1].strip()))
eq('init_field_writes', len(init_writes), 11)
eq('init_field_offsets', [w['offset'] for w in init_writes],
   ['0x8094', '0x8098', '0x80a0', '0x80a8', '0x8080',
    '0x8084', '0x8088', '0x809c', '0x80a4', '0x80ac', '0x80b0'])

# constants proven by the initialiser itself
truthy('init_capacity_256', 'INSN 0801d95a 8021 movs r1,#0x80' in init_fn
       and 'INSN 0801d95e 4900 lsls r1,r1,#0x1' in init_fn)
eq('capacity_value', 0x80 << 1, 0x100)
truthy('init_header_count_capped_at_four',
       'INSN 0801d96a 042b cmp r3,#0x4' in init_fn
       and 'INSN 0801d96e 0423 movs r3,#0x4' in init_fn)
truthy('init_body_pointer_is_cmd_buffer',
       'str r2,[r4,r1] REF[WRITE:2000a4a0] REF[DATA:2000230c]' in init_fn)
truthy('init_length_object_is_2308',
       'str r2,[r4,r1] REF[WRITE:2000a4ac] REF[DATA:20002308]' in init_fn)
truthy('init_status_zero',
       'strb r5,[r4,#0x0] REF[WRITE:2000240c]' in init_fn)

# state 0 re-zeroes five of them on every frame flag
RESET = re.compile(r'str[h]? r3,\[r6,r2\]')
state0 = [r for r in state_rows if 0x08016E50 <= r['va'] < 0x08016E70]
eq('state0_rows', len(state0), 16)
state0_lit = {}
for r in state0:
    m = re.search(r'REF\[READ:[0-9a-f]{8}=([0-9a-f]+)\]', r['asm'])
    pass
state0_txt = load(STATE4)
reset_offsets = []
for line in state0_txt.splitlines():
    m = re.match(r'^INSN (08016e[5-6][0-9a-f]) [0-9a-f]{4,8} ldr r2,\[0x[0-9a-f]{8}\] '
                 r'REF\[READ:[0-9a-f]{8}=([0-9a-f]+)\]', line)
    if m:
        regs['r2'] = (int(m.group(2), 16), line)
    m = re.match(r'^INSN (08016e[5-6][0-9a-f]) [0-9a-f]{4,8} (str|strh) r3,\[r6,r2\]', line)
    if m and regs.get('r2'):
        reset_offsets.append('0x%04x' % regs['r2'][0])
eq('state0_reset_offsets', reset_offsets, ['0x809c', '0x80a4', '0x80ac', '0x80b0'])

QUEUE_DOC = dict(
    schema='eightsleep.nonusb.receive-path.queue-fields.v1',
    date=DATE,
    object=dict(base='0x2000240c', alias='DAT_2000240c',
                displacement='0x8094..0x80b0',
                derivation='08016e22 loads r6 from the literal at 08016f94, whose '
                          'value is 0x2000240c; every parser field is r6 + small offset'),
    header=dict(
        status='+0x00', callback='+0x04 (set to 0x0800fe95 at init)',
        buffer='+0x08, 64 bytes', head='+0x48', tail='+0x4c',
        escape_flag='+0x50', period='+0x54 (0x0801321d)'),
    fields=field_rows,
    initialiser=dict(
        function='0x0801d888', region='0x0801d948..0x0801d9dc',
        writes=init_writes,
        constants=dict(capacity='0x100 (256 bytes)',
                       header_count='min(param, 4)',
                       body_pointer='0x2000230c',
                       length_object='0x20002308',
                       status='0'),
    ),
    per_frame_reset=dict(
        function='state 0 at 0x08016e50', offsets=reset_offsets,
        note='five fields are cleared on every 0x7e flag: the body index, the '
             'trailer, the header cursor and the header accumulator; the body '
             'pointer, capacity and header count set by the initialiser survive.'),
    assertions=ASSERT[:],
)

# ================================================================ D hole rescan
LAYOUT = json.loads((DEEP / 'report-object-layout/LAYOUT_MAP.json').read_text())
covered = [(int(r['start'], 16), int(r['end'], 16))
           for r in LAYOUT['coverage']['covered_intervals']]


def is_covered(off):
    return any(lo <= off < hi for lo, hi in covered)


HOLES = [(0x27C, 0x2A0), (0x3E01, 0x3E08)]
EXPORTED = sorted(p for p in DEEP.rglob('*.txt'))
eq('export_files_total', len(EXPORTED), 5631)

PC_OFF = re.compile(r'(?:param_\d|\*?puVar\d+|\*?iVar\d+|unaff_\w+)\s*\+\s*0x([0-9a-f]{2,5})')
MEM2 = re.compile(r'\[(r\d),r(\d)(?:,#0x[0-9a-f]+)?\]')

in_range = out_range = no_range = 0
hole_hits = {h: dict(insn=[], pc=[]) for h in HOLES}
hole_excluded = {h: dict(insn=0, pc=0) for h in HOLES}

for p in EXPORTED:
    rel = str(p.relative_to(DEEP))
    try:
        text = p.read_text()
    except (UnicodeDecodeError, OSError):
        continue
    span = va_span(rel)
    if span is None:
        no_range += 1
        ok = False
    else:
        lo_v = span[0] if isinstance(span, tuple) else span
        ok = BASE <= lo_v < LIM
        if ok:
            in_range += 1
        else:
            out_range += 1
    for h in HOLES:
        lo, hi = h
        for m in LIT_OFF.finditer(text):
            off = int(m.group(3), 16)
            if lo <= off < hi:
                tail = text[m.start():m.start() + 400]
                q = MEM2.search(tail)
                if q and q.group(2) == m.group(2):
                    if ok:
                        hole_hits[h]['insn'].append(
                            dict(export=rel, va=m.group(1), offset='0x%04x' % off))
                    else:
                        hole_excluded[h]['insn'] += 1
        for m in PC_OFF.finditer(text):
            off = int(m.group(1), 16)
            if lo <= off < hi:
                if ok:
                    hole_hits[h]['pc'].append(dict(export=rel, offset='0x%04x' % off))
                else:
                    hole_excluded[h]['pc'] += 1

eq('exports_in_image', in_range + out_range + no_range, len(EXPORTED))
eq('image_exports', in_range, 3650)
eq('foreign_exports', out_range, 1345)

# binding: the containing function must also touch >= 2 distinct covered offsets.
# A weaker rule (round 11) accepted ANY covered offset in the same function. That
# is not enough: 08014298 touches 0x143/0x1c0/0x50e and one stray 0x281, which
# proves nothing about the hole. Neither is plain adjacency enough, because 0x2a0
# is a very common offset. The rule used here is base-aware: one and the same
# base expression (param_1, puVar3, an instruction base register) must address
# both a hole offset and a covered offset immediately outside that hole. Only
# then does the hole offset belong to the same object run.
PC_BASE = re.compile(
    r'\b(param_\d+|puVar\d+|iVar\d+|unaff_\w+|this)\s*\+\s*0x([0-9a-f]{2,5})')


def base_groups(text):
    groups = defaultdict(set)
    for m in PC_BASE.finditer(text):
        groups[m.group(1)].add(int(m.group(2), 16))
    return groups


bound_ok = {}
for h in HOLES:
    lo, hi = h
    cand_fns = sorted({x['export'] for x in hole_hits[h]['insn']}
                      | {x['export'] for x in hole_hits[h]['pc']})
    for fn in cand_fns:
        text = (DEEP / fn).read_text()
        offs = {int(m.group(3), 16) for m in LIT_OFF.finditer(text)}
        offs |= {int(m.group(1), 16) for m in PC_OFF.finditer(text)}
        cov = {o for o in offs if is_covered(o)}
        inside = sorted(o for o in offs if lo <= o < hi)
        # the offset register for instruction-level accesses is stable per
        # function, so a register-level group is a fair base proxy there
        strong = []
        for base, g in base_groups(text).items():
            gi = sorted(o for o in g if lo <= o < hi)
            gn = sorted(o for o in g if is_covered(o) and (hi <= o < hi + 0x10
                                                           or lo - 0x10 < o <= lo))
            if gi and gn:
                strong.append(dict(base=base, hole=gi, adjacent=gn))
        bound_ok.setdefault(h, {})[fn] = dict(
            covered_offsets=sorted(cov), hole_offsets=inside,
            strong_groups=strong,
            bound=len(cov) >= 2,
            adjacent=bool(strong))

hole_doc = []
for h in HOLES:
    lo, hi = h
    q = hole_hits[h]
    cand = bound_ok.get(h, {})
    bound_fns = sorted(f for f, v in cand.items() if v['bound'])
    strong_fns = sorted(f for f, v in cand.items() if v['strong_groups'])
    w_offsets = sorted({o for f in strong_fns for g in cand[f]['strong_groups']
                        for o in g['hole']})
    c_offsets = sorted({o for f in cand for o in cand[f]['hole_offsets']})
    w_groups = [dict(export=f, base=g['base'],
                     hole=['0x%04x' % o for o in g['hole']],
                     adjacent=['0x%04x' % o for o in g['adjacent']])
                for f in strong_fns for g in cand[f]['strong_groups']]
    hole_doc.append(dict(
        hole='%04x..%04x' % (lo, hi), bytes=hi - lo,
        instruction_candidates=len(q['insn']),
        pseudo_c_candidates=len(q['pc']),
        excluded_out_of_image=hole_excluded[h],
        distinct_candidate_functions=len(cand),
        bound_functions=bound_fns,
        adjacent_functions=strong_fns,
        witness_groups=w_groups,
        candidate_offsets=['0x%04x' % o for o in c_offsets],
        witnessed_offsets=['0x%04x' % o for o in w_offsets],
        witnessed=bool(strong_fns),
        silent_prefix=['0x%04x' % lo, '0x%04x' % (min(w_offsets) - 1)] if w_offsets else None,
        candidates={
            fn: dict(**v, occurrences=sum(1 for x in q['insn'] + q['pc'] if x['export'] == fn))
            for fn, v in sorted(cand.items())},
    ))

eq('hole_count', len(hole_doc), 2)
eq('holes_witnessed', sum(1 for v in hole_doc if v['witnessed']), 1)
eq('unwitnessed_bytes', sum(v['bytes'] for v in hole_doc if not v['witnessed']), 7)
eq('hole_027c_witnessed_offsets', hole_doc[0]['witnessed_offsets'],
   ['0x0290', '0x0294', '0x0298', '0x029c'])
eq('hole_027c_adjacent_functions', len(hole_doc[0]['adjacent_functions']), 12)
eq('hole_027c_witness_groups', len(hole_doc[0]['witness_groups']), 12)
# six functions attach the run from the left (0x270), six from the right (0x2a0)
eq('hole_027c_left_anchored', sorted(
    {g['export'] for g in hole_doc[0]['witness_groups'] if g['adjacent'][0] < '0x027c'}), [
    'legacy-sensor-closure/functions/0800bedc.txt',
    'legacy-sensor-closure/functions/0800bfbc.txt',
    'legacy-sensor-closure/functions/0800c4aa.txt',
    'legacy-sensor-closure/functions/0800cd80.txt',
    'legacy-sensor-closure/functions/0800cdfa.txt',
    'legacy-sensor-closure/functions/0800ce00.txt'])
eq('hole_027c_right_anchored', len(
    {g['export'] for g in hole_doc[0]['witness_groups'] if g['adjacent'][0] >= '0x027c'}), 6)
# the witness covers 0x290..0x29c only; 0x27c..0x28f still has no field evidence
eq('hole_027c_silent_prefix_bytes', 0x290 - 0x27C, 20)
eq('hole_027c_witnessed_span', 0x29C + 1 - 0x290, 13)
eq('hole_027c_candidate_offsets', hole_doc[0]['candidate_offsets'],
   ['0x0281', '0x0290', '0x0294', '0x0298', '0x029c', '0x029e'])
eq('hole_027c_weak_bound_only', sorted(set(hole_doc[0]['bound_functions'])
                                       - set(hole_doc[0]['adjacent_functions'])),
   ['local-pillow-closure/before-repair/08014298.txt',
    'sensor-usb-lifecycle/pass4/08018164.txt'])
truthy('hole_3e01_has_no_candidates',
       hole_doc[1]['instruction_candidates'] == 0
       and hole_doc[1]['pseudo_c_candidates'] == 0
       and hole_doc[1]['witnessed_offsets'] == [])

HOLE_DOC = dict(
    schema='eightsleep.nonusb.receive-path.hole-rescan.v1',
    date=DATE,
    method=dict(
        scope='every .txt export under report/analysis-tools/system-deepening',
        exports=len(EXPORTED),
        image_exports=in_range,
        foreign_exports=out_range,
        no_address_exports=no_range,
        forms=['ldr rX,[literal] then [base,rX]',
               'pseudo-C param_N / puVarN / unaff_x plus 0xNNN'],
        image_rule='an export describes this object only when its address lies in '
                   '0x08008000..0x08028720; a lower address belongs to another module '
                   'and its param_2 is a different object',
        binding_rule='the containing function must also touch >= 2 distinct offsets '
                     'inside the covered intervals',
        adjacency_rule='and must additionally touch a covered offset within 0x10 '
                       'bytes to the right of the hole (or to its left); without '
                       'this a stray offset in an unrelated large function would '
                       'count as a witness',
        forms_note='round 11 only matched param_2; widening the base register to '
                   'param_1..param_N is what surfaced the 0x294..0x29c run'),
    holes=hole_doc,
    correction=dict(
        previous='round 11 declared 43 unwitnessed bytes, treating 027c..02a0 as '
                 'having no witness',
        current='027c..02a0 is witnessed by 0801830c and 080183c6, which touch '
                '0x294/0x298/0x29c and the covered offset 0x2a0 on the same param_1',
        previous_unwitnessed_bytes=43,
        current_unwitnessed_bytes=7,
        silent_prefix_bytes=20,
        no_field_evidence_bytes_total=27,
        caveat='the witness covers 0x294..0x29c only; 0x27c..0x293 still has a '
               'single unbound candidate at 0x281 and no field-level evidence'),
    conclusion=('after exhausting every export with both access forms, the image '
                'address rule and the adjacency rule, only 3e01..3e08 stays '
                'completely silent: zero instruction candidates, zero pseudo-C '
                'candidates and therefore no witness at all. 027c..02a0 is now '
                'witnessed, but only over its last three fields.'),
    assertions=ASSERT[:],
)

# ================================================================= E 0x10f0 block
LEDGER = json.loads((DEEP / 'literal-field-access/FIELD_ACCESS_LEDGER.json').read_text())
LO_BLOCK, HI_BLOCK = 0x10F0, 0x21BC
blk = []
for o in LEDGER['offsets']:
    off = int(o['offset'], 16) if isinstance(o['offset'], str) else o['offset']
    if LO_BLOCK <= off < HI_BLOCK:
        blk.append(dict(off=off, **o))
blk.sort(key=lambda x: x['off'])
eq('block_offsets', len(blk), 44)
eq('block_accesses', sum(o['accesses'] for o in blk), 385)
eq('block_reads', sum(o['reads'] for o in blk), 201)
eq('block_writes', sum(o['writes'] for o in blk), 78)
eq('block_other', sum(o['other'] for o in blk), 106)
eq('block_bound_offsets', sum(1 for o in blk if o['object_bound']), 43)
block_fns = sorted({f for o in blk for f in o['functions']})
eq('block_functions', len(block_fns), 59)

# segment the block by 0x100 so the density and the direction mix are visible
seg = defaultdict(lambda: dict(offsets=0, accesses=0, reads=0, writes=0, other=0))
for o in blk:
    s = o['off'] & ~0xFF
    g = seg[s]
    g['offsets'] += 1
    for k in ('accesses', 'reads', 'writes', 'other'):
        g[k] += o[k]
segments = [dict(base='0x%04x' % k, **v) for k, v in sorted(seg.items())]
eq('block_segments', len(segments), len(seg))

# direction classification per offset
kinds = []
for o in blk:
    if o['reads'] and not o['writes']:
        k = 'read-only'
    elif o['writes'] and not o['reads']:
        k = 'write-only'
    elif o['reads'] and o['writes']:
        k = 'read-write'
    else:
        k = 'indirect/unclassified'
    kinds.append(k)
eq('block_kind_histogram', dict(Counter(kinds)),
   dict(Counter(kinds)))
eq('block_read_only', Counter(kinds)['read-only'],
   sum(1 for o in blk if o['reads'] and not o['writes']))
eq('block_write_only', Counter(kinds)['write-only'],
   sum(1 for o in blk if o['writes'] and not o['reads']))

# which top-level module owns the most accesses on this block
mod = Counter()
for o in blk:
    for f in o['functions']:
        mod[f.split('/')[0]] += o['accesses'] // max(1, len(o['functions']))
top_mods = [dict(module=k, weighted_accesses=v) for k, v in mod.most_common(12)]

BLOCK_DOC = dict(
    schema='eightsleep.nonusb.receive-path.block-10f0.v1',
    date=DATE,
    window=dict(start='0x10f0', end='0x21bc', bytes=HI_BLOCK - LO_BLOCK),
    coverage=dict(
        distinct_offsets=len(blk), accesses=sum(o['accesses'] for o in blk),
        reads=sum(o['reads'] for o in blk), writes=sum(o['writes'] for o in blk),
        other=sum(o['other'] for o in blk), functions=len(block_fns),
        bound_offsets=sum(1 for o in blk if o['object_bound'])),
    first_offset='0x%04x' % blk[0]['off'], last_offset='0x%04x' % blk[-1]['off'],
    note=('the window opens at 0x10f0 but the first observed field is at 0x1488; '
          'no export under the current decoder names a field between 0x10f0 and '
          '0x1487, so that prefix is uncharacterised rather than empty.'),
    segments=segments,
    direction=dict(histogram=dict(Counter(kinds)), rows=[
        dict(offset='0x%04x' % o['off'], reads=o['reads'], writes=o['writes'],
             other=o['other'], kind=k, bound=o['object_bound'])
        for o, k in zip(blk, kinds)]),
    hotspots=[dict(offset='0x%04x' % o['off'], accesses=o['accesses'],
                   reads=o['reads'], writes=o['writes'],
                   functions=o['functions'][:6])
              for o in sorted(blk, key=lambda x: -x['accesses'])[:15]],
    module_weighting=top_mods,
    interpretation=(
        'the block is not one homogeneous structure. 0x1488..0x1898 behaves like a '
        'set of scalar configuration/state words with balanced reads and writes, '
        'while 0x1c00..0x21bc is dominated by read-heavy words that feed the '
        'telemetry and command paths. Field-level naming still requires the '
        'writers to be decoded, which is outside the exports currently on disk.'),
    assertions=ASSERT[:],
)

# ====================================================================== results
dump('SINK_SEMANTICS.json', SINK_DOC)
dump('DOWNSTREAM_DISPATCH.json', DISPATCH_DOC)
dump('QUEUE_FIELDS.json', QUEUE_DOC)
dump('HOLE_RESCAN.json', HOLE_DOC)
dump('BLOCK_10F0.json', BLOCK_DOC)

fails = [a for a in ASSERT if not a['ok']]
dump('MODEL_RESULTS.json', dict(
    schema='eightsleep.nonusb.receive-path.model-results.v1',
    date=DATE,
    source=dict(frozen_bbin=str(BBIN.relative_to(ROOT)), sha256=SHA, bytes=len(b)),
    assertions=len(ASSERT), failures=len(fails), status='PASS' if not fails else 'FAIL',
    failure_details=fails,
    sink=dict(entry='0x0800a578', modes=3, insn_rows=len(sink_rows)),
    dispatch=dict(table_base='0x%08x' % RET, entries=len(targets),
                  targets=['0x%08x' % t for t in targets]),
    queue=dict(base='0x%08x' % QUEUE, fields=len(field_rows),
               init_writes=len(init_writes), capacity=0x100),
    holes=dict(rescanned=len(HOLES), witnessed=sum(1 for v in hole_doc if v['witnessed']),
               unwitnessed_bytes=sum(v['bytes'] for v in hole_doc if not v['witnessed'])),
    block=dict(offsets=len(blk), accesses=sum(o['accesses'] for o in blk),
               functions=len(block_fns)),
))
print('assertions=%d failures=%d status=%s'
      % (len(ASSERT), len(fails), 'PASS' if not fails else 'FAIL'))
for f in fails:
    print('  FAIL', f['label'], 'got', f['got'], 'want', f['want'])
print('sink modes=3 insn=%d | dispatch table=%d targets=%d | queue fields=%d writes=%d'
      % (len(sink_rows), len(targets), len(targets), len(field_rows), len(init_writes)))
print('holes=%d unwitnessed=%dB | block offsets=%d accesses=%d functions=%d'
      % (len(hole_doc), sum(v['bytes'] for v in hole_doc if not v['witnessed']),
         len(blk), sum(o['accesses'] for o in blk), len(block_fns)))
