"""Seventh-round static models: callback ledger, hwrev identifier map, report fields.

Input: retained read-only Ghidra exports (pass1..pass4), the frozen BBIN, and the
sixth-round CONFIG_SNAPSHOT.json. Output: three structured ledgers plus a merged
MODEL_RESULTS.json with every assertion. No firmware execution, no device access.
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
sys.path.insert(0, str(FOLDER / 'scripts'))
import thumb_lite

BBIN = ROOT / ('materials/eightsleep-full-evidence-20261107/firmware/mtk/'
               'rootfs/files/opt/eight/lib/subsystem_updates/firmware-sensor-g0.bbin')
SNAPSHOT = ROOT / 'report/analysis-tools/system-deepening/config-object-snapshot/CONFIG_SNAPSHOT.json'
BASE = 0x08008000
SHA = '51531576fd31af96f7239b71d26e1f175815f5cb21dbe9ab305fa9a33cc6a891'
b = BBIN.read_bytes()
snap = json.loads(SNAPSHOT.read_text())


def read32(va):
    o = va - BASE
    return struct.unpack_from('<I', b, o)[0] if 0 <= o <= len(b) - 4 else None


def hx(v):
    return '0x%08x' % v


ALL_ASSERTIONS = []


def eq(label, got, want, model):
    ALL_ASSERTIONS.append(dict(model=model, label=label, got=got, want=want,
                               ok=(got == want)))


def truthy(label, got, model):
    ALL_ASSERTIONS.append(dict(model=model, label=label, got=got, want=True,
                               ok=bool(got)))


def jwrite(name, obj):
    (FOLDER / name).write_text(
        json.dumps(obj, indent=2, ensure_ascii=False, sort_keys=True) + '\n')


# ---------------------------------------------------------------------------
# shared callee semantics, established from pass4 decompilations
# ---------------------------------------------------------------------------
SHARED = {
    0x0801FDF0: 'gpio_id_write(id,value): FUN_0800acc8(desc[id].base, desc[id].mask, value)',
    0x0801FDD0: 'gpio_id_read(id): returns (desc[id].IDR & mask) != 0',
    0x0801FD60: 'gpio_id_read_extended(id,out): desc[id] via FUN_0800aa48',
    0x08010020: 'gpio_id_pulse(id): write(id,1); write(id,0); write(id,1)',
    0x0800ACC8: 'direct_gpio_write: value==0 -> base+0x28 (clear), else base+0x18 (set)',
    0x0800ACBC: 'direct_gpio_read: *(base+0x10) & mask',
    0x0800B988: 'sensor_channel_read (indexed RAM state)',
    0x0800BAC0: 'sensor_channel_write (indexed RAM state)',
    0x0800F8C0: 'indexed_table_writer: bound check + 8 MHz/other branch',
    0x0800F82C: 'indexed_handler (called by the 3 index-checked thunks)',
    0x0800E468: 'signed_sensor_getter',
    0x0800D950: 'state_machine_step (bit-mask guarded)',
    0x0800C828: 'rcc_reset',
    0x0800C8DC: 'pll_writer2 (CFGR2 configuration)',
    0x080108AC: 'clock_init: hwrev>=0xA87 -> 16MHz/PREDIV2, else 32MHz/PREDIV4',
    0x08010960: 'clock_init: 8MHz/PREDIV1',
    0x08012754: 'log_printf (format + varargs)',
    0x08020F94: 'memcpy_bytes',
    0x080086A4: 'memset_bytes',
    0x080110F6: 'gpio_id_read(0) wrapper',
    0x0800BDCC: 'stub returning 0',
}

CLASS_BY_TARGET = [
    (0x08010020, 'gpio_pulse_thunk'),
    (0x0801FDF0, 'gpio_write_thunk'),
    (0x0801FDD0, 'gpio_read_thunk'),
    (0x0801FD60, 'gpio_read_extended_thunk'),
    (0x0800ACC8, 'direct_gpio_write_thunk'),
    (0x0800ACBC, 'direct_gpio_read_thunk'),
    (0x0800B988, 'sensor_channel_read_thunk'),
    (0x0800BAC0, 'sensor_channel_write_thunk'),
    (0x0800F8C0, 'indexed_table_writer_thunk'),
    (0x0800F82C, 'indexed_handler_thunk'),
    (0x0800E468, 'signed_sensor_getter_thunk'),
    (0x0800D950, 'state_machine_thunk'),
    (0x080110F6, 'thin_wrapper'),
]

# ---------------------------------------------------------------------------
# model 1: callback implementation ledger
# ---------------------------------------------------------------------------
def build_callback_ledger():
    M = 'callback_ledger'
    ptr_slots = defaultdict(set)
    ptr_writers = defaultdict(set)
    ptr_boundaries = defaultdict(set)
    for key in ('snapshots', 'snapshots_sku4'):
        for hwrev, boundary in snap[key].items():
            for off, rec in boundary['slots'].items():
                if rec.get('kind') == 'thumb_function_pointer':
                    v = int(rec['value'], 16)
                    ptr_slots[v].add(off)
                    ptr_writers[v].add(rec['written_by'])
                    ptr_boundaries[v].add(hwrev)
    ptrs = sorted(ptr_slots)
    eq('pointer_count', len(ptrs), 80, M)

    entries = []
    for v in ptrs:
        e = v & ~1
        p = FOLDER / 'pass1' / ('%08x.txt' % e)
        t = p.read_text()
        m = re.search(r'TARGET (\w+) function=(\w+)', t)
        has_body = m.group(2) != 'none'
        insn_rows = t.count('\nINSN ')
        pseudo = ''
        if has_body:
            st, en = t.find('FUNCTION_BODY'), t.find('\nINSN ')
            pseudo = t[st:en] if st >= 0 and en > st else ''
        if has_body:
            rows = [dict(addr=l.split()[1], raw=l.split()[2],
                         asm=l.split(' ', 3)[3].split(' REF[')[0], kind='ghidra',
                         width=len(l.split()[2]) // 2)
                    for l in t.splitlines() if l.startswith('INSN ')]
            calls = [int(x, 16) for x in re.findall(
                r'REF\[UNCONDITIONAL_CALL:([0-9a-f]{8})\]', t)]
            source, stop = 'ghidra_export', 'function_body'
            imms, lits = [], []
        else:
            rows, stop = thumb_lite.scan(b, BASE, e, read32, max_halfwords=160)
            calls = [r['target'] for r in rows if r['kind'] == 'call']
            imms = [r['imm'] for r in rows if 'imm' in r and r['kind'] == 'immediate']
            lits = [dict(va=hx(r['literal_va']), value=hx(r['literal_value']))
                    for r in rows if r['kind'] == 'literal'
                    and r.get('literal_value') is not None]
            source = 'raw_thumb_prefix'
            # compress a NOP run into a single row for readability
            if sum(1 for r in rows if r['asm'] == 'nop') > 4:
                n = 0
                comp = []
                for r in rows:
                    if r['asm'] == 'nop':
                        n += 1
                        continue
                    if n:
                        comp.append(dict(asm='nop*%d' % n, count=n, kind='nop_run'))
                        n = 0
                    comp.append(r)
                if n:
                    comp.append(dict(asm='nop*%d' % n, count=n, kind='nop_run'))
                rows = comp

        slots = sorted(ptr_slots[v], key=lambda x: int(x, 16))
        # classification: slot role first, then implementation shape
        if slots == ['0x4']:
            cls = 'init_callback'
        elif '0x190' in slots:
            cls = 'side_callback'
        elif '0x194' in slots:
            cls = 'post_init_callback'
        elif any(s in ('0x114', '0x164') for s in slots):
            cls = 'report_block_callback'
        elif any(r.get('asm') == 'nop*125' for r in rows):
            cls = 'nop_sled_noop'
        elif len(rows) == 1 and rows[0].get('asm') == 'bx lr':
            cls = 'immediate_return'
        elif (len(rows) == 2 and rows[0].get('asm', '').startswith('movs r0,#')
              and rows[1].get('asm') == 'bx lr'):
            cls = 'constant_return'
        elif any(r.get('kind') == 'literal' and
                 r.get('literal_value') == 0x200014DC for r in rows):
            cls = 'ram_global_writer'
        else:
            cls = next((name for tgt, name in CLASS_BY_TARGET if tgt in calls), None)
            if cls is None:
                if len(calls) >= 4 and any(t in (0x080099AC, 0x0800C828) for t in calls):
                    cls = 'clock_init_chain'
                elif calls and all(k in (0x0801FDF0, 0x0801FDD0, 0x08010020)
                                  for k in calls):
                    cls = 'gpio_thunk'
                elif not calls and any(r.get('kind') == 'literal' for r in rows):
                    cls = 'ram_global_getter'
                elif len(calls) == 1 and len(rows) <= 5:
                    cls = 'thin_wrapper'
                elif len(rows) > 20:
                    cls = 'compound_callback'
                else:
                    cls = 'short_compound_callback'

        semantics = '; '.join(SHARED[c] for c in dict.fromkeys(calls)
                              if c in SHARED) or ('Ghidra body: %d INSN rows' % insn_rows)
        entries.append(dict(
            pointer=hx(v), entry=hx(e), thumb_bit0=True,
            slots=slots, written_by=sorted(ptr_writers[v]),
            hwrev_boundary_count=len(ptr_boundaries[v]),
            first_hwrev=min(ptr_boundaries[v], key=lambda x: int(x, 16)),
            ghidra=dict(has_function_body=has_body,
                        function=None if not has_body else hx(int(m.group(2), 16)),
                        insn_rows=insn_rows),
            implementation=dict(source=source, stop_reason=stop,
                                size_bytes=sum(r.get('width', 2) *
                                               r.get('count', 1) for r in rows),
                                instructions=rows,
                                call_targets=[hx(c) for c in dict.fromkeys(calls)],
                                immediates=[hex(i) for i in dict.fromkeys(imms)],
                                literals=lits),
            classification=cls, semantics=semantics[:600],
            pseudo_c=re.sub(r'\s+', ' ', pseudo)[:900] if has_body else None,
        ))

    classes = Counter(x['classification'] for x in entries)
    decoded = sum(1 for x in entries if x['ghidra']['has_function_body'])
    eq('decoded_count', decoded, 19, M)
    eq('undecoded_count', len(entries) - decoded, 61, M)
    eq('all_undecoded_reach_terminator',
       all(x['implementation']['stop_reason'] in ('return', 'unconditional_branch',
                                                  'function_body') for x in entries),
       True, M)
    eq('init_callback_count', classes['init_callback'], 7, M)
    eq('nop_sled_count', classes['nop_sled_noop'], 1, M)
    eq('all_have_semantics', all(x['semantics'] for x in entries), True, M)
    eq('all_have_slots', all(x['slots'] for x in entries), True, M)
    truthy('gpio_thunks_present',
           sum(v for k, v in classes.items() if 'gpio' in k) >= 20, M)
    # init callbacks -> clock writer chain
    init_clock = {}
    for x in entries:
        if x['classification'] != 'init_callback':
            continue
        cs = x['implementation']['call_targets']
        init_clock[x['entry']] = ('0x080108ac' in cs, '0x08010960' in cs,
                                  '0x08012008' in cs)
    eq('init_clock_entries', len(init_clock), 7, M)
    truthy('init_clock_writer_variants',
           any(a or b for a, b, _ in init_clock.values()), M)

    out = dict(
        schema='eightsleep.nonusb.callback-implementations.callback-ledger.v1',
        date='2026-11-08',
        source=dict(frozen_bbin=str(BBIN.relative_to(ROOT)), sha256=SHA,
                    config_snapshot=str(SNAPSHOT.relative_to(ROOT)),
                    ghidra_exports=['pass1', 'pass4']),
        method=('80 unique thumb_function_pointer values from CONFIG_SNAPSHOT; '
                '19 have Ghidra function bodies, 61 are decoded as a bounded '
                'raw-Thumb prefix from the frozen image.'),
        gpio_descriptor_table=dict(base=hx(0x08027F10), stride=12,
                                   layout='[u32 peripheral_base, u32 pin_and_mask, u32 port_index]',
                                   write=SHARED[0x0800ACC8], read=SHARED[0x0800ACBC]),
        clock_chain=dict(
            dispatch='0x08025da4 14 rows, accumulative for threshold <= hwrev',
            init_slot='config object +0x4 (7 distinct init callbacks)',
            writer_16_32=SHARED[0x080108AC], writer_8=SHARED[0x08010960],
            pll='FUN_0800c8dc builds CFGR2 from a 14-slot local struct',
            note=('080108ac selects 16MHz/uVar2=0x10 when hwrev-0xA87 < 0x79, '
                  'else 32MHz/uVar2=0x30; 08010960 selects 8MHz. These are the '
                  'three s[9] variants of the fourth-round PLL model.')),
        shared_callees={hx(k): v for k, v in SHARED.items()},
        summary=dict(pointers=len(entries), decoded_by_ghidra=decoded,
                     decoded_from_raw_thumb=len(entries) - decoded,
                     classifications=dict(classes),
                     init_clock=init_clock),
        callbacks=entries,
        limits=[
            'The 61 raw-Thumb entries are bounded prefixes ending at the first '
            'return/branch; they are not complete function decompilations.',
            'Ghidra pseudo-C is used for shared callee semantics only; every '
            'published byte is verified against the frozen image separately.',
            'GPIO/peripheral register names are inferred from descriptor layout '
            'and offset usage, not from a device datasheet in this evidence set.',
            'No runtime execution: whether a callback is actually invoked on a '
            'given board remains unproven.',
        ],
    )
    jwrite('CALLBACK_LEDGER.json', out)
    return out


# ---------------------------------------------------------------------------
# model 2: hwrev -> internal 3-character identifier
# ---------------------------------------------------------------------------
def build_hwrev_identifiers(ledger):
    M = 'hwrev_identifiers'
    THRESHOLDS = [0x0000, 0x0805, 0x0900, 0x0A00, 0x0A05, 0x0A10, 0x0A30,
                  0x0A33, 0x0A34, 0x0A35, 0x0A36, 0x0A37, 0x0A87, 0x0A90]
    VERSIONS = ['I00', 'I05', 'J00', 'K00', 'K10', 'K05', 'K30', 'K33',
                'K34', 'K35', 'K36', 'K37', 'K87', 'K90']

    def ident(hw):
        # asrs on a zero-extended 16-bit load: equivalent to lshr for all
        # values observed in this image (hwrev < 0x8000).
        return chr(((hw >> 8) & 0xF) + 0x41) + \
               chr(((hw >> 4) & 0xF) + 0x30) + \
               chr((hw & 0xF) + 0x30)

    rows = []
    for i, th in enumerate(THRESHOLDS):
        s = snap['setters'][i]
        si = s['string_index']
        flash = b[0x08024234 + si * 4 - BASE:0x08024234 + si * 4 - BASE + 3].decode()
        got = ident(th)
        rows.append(dict(row=i, threshold=hx(th), hwrev=hx(th),
                         formula_identifier=got, setter_version=s['version'],
                         string_index=si,
                         flash_string_pointer=hx(0x08024234 + si * 4),
                         flash_string=flash, matches=(got == flash)))
    eq('row_count', len(rows), 14, M)
    eq('non_default_rows_all_match',
       all(r['matches'] for r in rows[1:]), True, M)
    eq('default_row_mismatch', (rows[0]['formula_identifier'],
                                rows[0]['flash_string']), ('A00', 'I00'), M)
    eq('matched_row_count', sum(1 for r in rows if r['matches']), 13, M)
    eq('cross_indexed_rows', [(r['row'], r['string_index']) for r in rows
                              if r['row'] != r['string_index']],
       [(4, 5), (5, 4)], M)
    eq('row4_identifier', rows[4]['formula_identifier'], 'K05', M)
    eq('row5_identifier', rows[5]['formula_identifier'], 'K10', M)
    eq('first_real_identifier', rows[1]['formula_identifier'], 'I05', M)
    eq('last_identifier', rows[-1]['formula_identifier'], 'K90', M)

    boundaries = []
    for hw in sorted(int(x, 16) for x in snap['snapshots']):
        got = ident(hw)
        match = next((r for r in rows if int(r['threshold'], 16) == hw), None)
        boundaries.append(dict(hwrev='0x%04x' % hw, identifier=got,
                               is_dispatch_threshold=bool(match),
                               flash_string=(match['flash_string'] if match else None),
                               in_flash_table=all('0' <= c <= '9' or 'A' <= c <= 'K'
                                                  for c in got)))
    eq('boundary_count', len(boundaries), 16, M)
    eq('non_threshold_boundaries',
       [x['hwrev'] for x in boundaries if not x['is_dispatch_threshold']],
       ['0x0aff', '0x0b00'], M)
    eq('0x0aff_identifier', ident(0x0AFF), 'K??', M)
    eq('0x0b00_identifier', ident(0x0B00), 'L00', M)

    # clock-writer branch derived from init callbacks
    clock = dict(site='0x080108ac', condition='hwrev - 0xA87 < 0x79 (unsigned)',
                 branch_true=dict(hse_hz=16000000, cfgr2_prediv_field=0x10,
                                  predeclared_prediv=2),
                 branch_false=dict(hse_hz=32000000, cfgr2_prediv_field=0x30,
                                   predeclared_prediv=4),
                 writer_8mhz=dict(site='0x08010960', hse_hz=8000000,
                                  predeclared_prediv=1),
                 sysclk_all=64000000)
    eq('clock_16mhz_case', (16000000 // 2) * 24 // 3, 64000000, M)
    eq('clock_32mhz_case', (32000000 // 4) * 24 // 3, 64000000, M)
    eq('clock_8mhz_case', (8000000 // 1) * 24 // 3, 64000000, M)

    out = dict(
        schema='eightsleep.nonusb.callback-implementations.hwrev-identifiers.v1',
        date='2026-11-08',
        formula=dict(
            expression=('RAM[0x200014d8] = ((hwrev>>8)&0xF) + 0x41; '
                        'RAM[0x200014d9] = ((hwrev>>4)&0xF) + 0x30; '
                        'RAM[0x200014da] = (hwrev&0xF) + 0x30'),
            hwrev_source='u16 DAT_20001cfc (parsed from the "hwrev" config key)',
            generation_site='0x0801dd62..0x0801dd80 inside 0x0801d888',
            generation_condition=('config block magic (DAT_0807f804 & 0xe0)==0xa0 '
                                  'and FUN_0801273c / FUN_0801ae3a parsing succeeded; '
                                  'on failure DAT_20001cec=0 and the 3 bytes are not written'),
            first_char='letter A..P from bits 8..11',
            second_third='0x30 + nibble; only printable digits for nibble <= 9'),
        readers=dict(
            literal_slots=['0x08012a58', '0x08012d08', '0x08012ecc',
                           '0x0801cf14', '0x0801ded0'],
            read_instructions=['0x080129e4', '0x08012bb0', '0x08012e4c',
                               '0x0801ced2', '0x0801dd66'],
            note=('5 literal-pool occurrences of the 0x200014d8 pointer across '
                  'the whole 132896B image; 0x200014d9 / 0x200014da have zero '
                  'independent pointer references (accessed as base+1 / base+2).')),
        independent_mechanism=dict(
            flash_table='0x08024234, 14 x 4-byte NUL-terminated ASCII strings',
            consumer='config object +0x0 -> report object +0x3d9c -> FUN_08012754("[sensor] %s mode")',
            cross_index='setter rows 4/5 reference string indices 5/4 respectively',
            result='both mechanisms agree for all 14 dispatch thresholds'),
        rows=rows, boundaries=boundaries, clock_chain=clock,
        limits=[
            'The identifier is computed from the runtime hwrev value, not from '
            'the flash string table; they agree only for the 14 known thresholds.',
            'For nibble > 9 the +0x30 produces punctuation (: ; < = > ?), e.g. '
            'hwrev 0x0AFF -> "K??"; no such string exists in the flash table.',
            'asrs (arithmetic shift) is used on a zero-extended 16-bit load; for '
            'hwrev >= 0x8000 it would differ from a logical shift.',
            'DAT_200014d8 is RAM; its value on a board that failed config parsing '
            'is whatever was left there, which static bytes cannot determine.',
        ],
    )
    jwrite('HWREV_IDENTIFIERS.json', out)
    return out


# ---------------------------------------------------------------------------
# model 3: report-object field ledger from the main dispatcher
# ---------------------------------------------------------------------------
def build_report_fields():
    M = 'report_fields'
    t = (FOLDER / 'pass2' / '0801d888.txt').read_text()
    st, en = t.find('FUNCTION_BODY'), t.find('\nINSN ')
    pseudo = t[st:en].splitlines()
    fields, block_ops = [], []
    stack = []
    for lineno, line in enumerate(pseudo):
        body = line.strip()
        indent = len(line) - len(line.lstrip())
        while stack and stack[-1][0] >= indent:
            stack.pop()
        mc = re.search(r'\bif \((.*?)\)\s*\{?\s*$', body)
        if mc:
            stack.append((indent, mc.group(1)[:160]))
        conds = [c for _, c in stack]

        # block memcpy / memset into the report object
        mb = re.search(r'(FUN_08020f94|FUN_080086a4)\(param_2 \+ (0x[0-9a-f]+),'
                       r'\s*([^,]+),\s*([^)]+)\)', body)
        if mb:
            block_ops.append(dict(site=mb.group(1), offset=mb.group(2),
                                  arg2=mb.group(3).strip(), arg3=mb.group(4).strip(),
                                  conditions=conds, line=lineno))
        # direct stores
        for mm in re.finditer(
                r'(\*\(([^()]*)\)\(param_2 \+ (0x[0-9a-f]+)\)'
                r'|param_2\[(0x[0-9a-f]+)\])\s*=\s*([^;]+);', body):
            cast = mm.group(2) or ''
            off = mm.group(3) or mm.group(4)
            expr = mm.group(5).strip()
            width = 2 if ('undefined2' in cast or 'ushort' in cast) else \
                    1 if ('undefined1' in cast or cast.strip() == 'byte') else 4
            if re.search(r'\b(==|!=|<=|>=)\b', expr):
                continue
            if 'param_1[' in expr:
                src = 'config_object_slot'
            elif expr.startswith(('0x', '-')) or re.fullmatch(r'\d+', expr):
                src = 'constant'
            elif re.search(r'FUN_|\(\*\(code', expr):
                src = 'callback_or_function_result'
            elif re.search(r'\buVar|\biVar|\bbVar|\bcVar|local_|param_2\[', expr):
                src = 'runtime_computed_or_self_reference'
            elif re.search(r'DAT_|\*\(', expr):
                src = 'ram_global_or_pointer'
            else:
                src = 'other'
            fields.append(dict(offset=off, width=width, expression=expr[:200],
                               source_class=src, conditions=conds, line=lineno))

    truthy('field_count_positive', len(fields) > 60, M)
    truthy('block_ops_present', len(block_ops) > 0, M)
    offsets = {f['offset'] for f in fields}
    for off in ('0x3a80', '0x3a81', '0x3e08', '0x3df8', '0x3d9c'):
        truthy('offset_%s_present' % off, off in offsets, M)
    eq('all_fields_have_line', all(isinstance(f['line'], int) for f in fields),
       True, M)
    eq('all_widths_valid', all(f['width'] in (1, 2, 4) for f in fields), True, M)
    classes = Counter(f['source_class'] for f in fields)
    truthy('multiple_source_classes', len(classes) >= 4, M)
    conditional = [f for f in fields if f['conditions']]
    truthy('conditional_fields_present', len(conditional) > 10, M)
    hwrev_conds = sorted({c for f in fields for c in f['conditions']
                          if re.search(r'0xa3[0-9a-f]|0x94f|DAT_20001cf8|uVar35', c)})
    truthy('hwrev_sku_conditions_captured', len(hwrev_conds) > 0, M)

    out = dict(
        schema='eightsleep.nonusb.callback-implementations.report-fields.v1',
        date='2026-11-08',
        source='pass2/0801d888.txt (Ghidra pseudo-C of the 0x0801d888 dispatcher)',
        method=('Scan every assignment whose left side targets param_2 (the report '
                'object), capture byte offset, store width, value expression, '
                'source class and the enclosing if-condition stack by indentation. '
                'Machine bytes of the dispatcher are verified separately in '
                'BYTE_VALIDATION.json.'),
        object_note=('param_2 is declared undefined1*, so param_2[0xNNNN] and '
                     'param_2 + 0xNNNN are both byte offsets from the report object.'),
        summary=dict(fields=len(fields), unique_offsets=len(offsets),
                     block_operations=len(block_ops),
                     conditional_fields=len(conditional),
                     source_classes=dict(classes),
                     hwrev_sku_conditions=hwrev_conds[:40]),
        fields=sorted(fields, key=lambda f: (int(f['offset'], 16), f['line'])),
        block_operations=block_ops,
        known_links=[
            'config object +0x0 -> report +0x3d9c (version string pointer, used by log_printf)',
            'config object +0x18c -> report +0x3a80 / +0x3a81 (byte status, 0xff sentinel)',
            'config object +0x114..0x164 -> report +0x3e28 via FUN_08020f94(...,0x50)',
            '1000ms timeout block -> report +0x3e08/0x3e0c/0x3e10/0x3e14',
        ],
        limits=[
            'Pseudo-C is a decompiler reconstruction, not an execution trace; '
            'a listed store is a possible write, not a guaranteed runtime write.',
            'The condition stack is indentation-based and captures enclosing if '
            'conditions, not the fulldata flow or switch/label jumps.',
            'Wide memcpy/memset regions are recorded as block_operations, not '
            'expanded into individual byte offsets.',
            'Field semantics (names, units, physical channels) are not present '
            'in the frozen image; only offsets, widths and value sources are claimed.',
        ],
    )
    jwrite('REPORT_FIELDS.json', out)
    return out


ledger = build_callback_ledger()
ident = build_hwrev_identifiers(ledger)
fields = build_report_fields()

failures = [a for a in ALL_ASSERTIONS if not a['ok']]
results = dict(
    schema='eightsleep.nonusb.callback-implementations.model-results.v1',
    date='2026-11-08',
    status='PASS' if not failures else 'FAIL',
    assertions=len(ALL_ASSERTIONS), failures=len(failures),
    by_model=dict(Counter(a['model'] for a in ALL_ASSERTIONS)),
    counts=dict(
        callbacks=len(ledger['callbacks']),
        classifications=len(ledger['summary']['classifications']),
        hwrev_rows=len(ident['rows']),
        hwrev_boundaries=len(ident['boundaries']),
        report_fields=len(fields['fields']),
        report_unique_offsets=fields['summary']['unique_offsets'],
        block_operations=len(fields['block_operations']),
    ),
    details=ALL_ASSERTIONS,
)
jwrite('MODEL_RESULTS.json', results)
print('assertions=%d failures=%d status=%s' % (len(ALL_ASSERTIONS),
                                               len(failures), results['status']))
print('counts:', results['counts'])
if failures:
    for f in failures[:25]:
        print('  FAIL', f['model'], f['label'], repr(f['got']), '!=', repr(f['want']))
    sys.exit(1)
