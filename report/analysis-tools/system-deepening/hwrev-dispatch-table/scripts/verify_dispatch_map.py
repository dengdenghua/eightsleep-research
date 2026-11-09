#!/usr/bin/env python3
"""Verify the complete 14-row hwrev dispatch table against the frozen BBIN.

Read-only. Re-reads retained Ghidra -readOnly -noanalysis exports, the frozen
firmware image, the two in-image tables, every setter's slot0/slot1 literal,
two setters that the retained project never disassembled (decoded here from
raw Thumb halfwords), and a whole-image BL scan of the clock-config call graph.

Never executes firmware, never modifies the Ghidra project, never contacts a
device, account or network.

Usage:
  python3 scripts/verify_dispatch_map.py
"""
from __future__ import annotations

import argparse
import hashlib
import json
import re
import struct
from pathlib import Path

HERE = Path(__file__).resolve().parent
TOOL = HERE.parent
PROJECT = TOOL.parents[3]
BBIN = (PROJECT / 'materials/eightsleep-full-evidence-20261107/firmware/mtk/'
        'rootfs/files/opt/eight/lib/subsystem_updates/firmware-sensor-g0.bbin')

BASE = 0x08008000
SHA256 = '51531576fd31af96f7239b71d26e1f175815f5cb21dbe9ab305fa9a33cc6a891'

TABLE_VA = 0x08025da4
STRINGS_VA = 0x08024234
LOOP_CMP_VA = 0x0801d8cc
CONFIG_16_32 = 0x080108ac
CONFIG_8 = 0x08010960

VERSION_STRINGS = ['I00', 'I05', 'J00', 'K00', 'K10', 'K05', 'K30', 'K33',
                   'K34', 'K35', 'K36', 'K37', 'K87', 'K90']

# row, threshold, callee (Thumb pointer), string-index, slot0 store, string literal,
# slot1 store, init literal, init pointer, inline BL target, note
SETTERS = [
    dict(row=0,  threshold=0x0000, callee=0x0800f58d, si=0,
         store=0x0800f590, slit=0x0800f694,
         slot1_store=0x0800f596, slot1_lit=0x0800f698, init=0x08010bf5,
         calls=None, note='full default config object; slot0x14=16000000, slot0x1a=8000000'),
    dict(row=1,  threshold=0x0805, callee=0x0800f719, si=1,
         store=0x0800f71a, slit=0x0800f734,
         slot1_store=None, slot1_lit=None, init=None,
         calls=None, note='name only + slots 0x40/0x58/0x11c/0x120/0x124; keeps previous init'),
    dict(row=2,  threshold=0x0900, callee=0x0800f761, si=2,
         store=0x0800f764, slit=0x0800f784,
         slot1_store=0x0800f768, slot1_lit=0x0800f78c, init=0x08010c6d,
         calls=None, note='new init 08010c6c + RAM pointers 2000a62c/2000a4c0/2000a798'),
    dict(row=3,  threshold=0x0A00, callee=0x0800f969, si=3,
         store=0x0800f96e, slit=0x0800fa5c,
         slot1_store=0x0800f974, slot1_lit=0x0800fa60, init=0x080114bd,
         calls=None, note='large rewrite; 4000000/2000000 constants, slot0x62=2'),
    dict(row=4,  threshold=0x0A05, callee=0x0800fafd, si=5,
         store=0x0800fb02, slit=0x0800fb70,
         slot1_store=0x0800fb08, slot1_lit=0x0800fb74, init=0x08011d91,
         calls=None, note='K05 -> string-table index 5 (NOT index 4); new init 08011d90'),
    dict(row=5,  threshold=0x0A10, callee=0x0800fae1, si=4,
         store=0x0800faea, slit=0x0800faf4,
         slot1_store=None, slot1_lit=None, init=None,
         calls=(0x0800fae4, 0x0800f968),
         note='K10 replays the whole K00 setter (BL 0800f968 with r0 preserved), then only overwrites the name'),
    dict(row=6,  threshold=0x0A30, callee=0x0800fc05, si=6,
         store=0x0800fc0a, slit=0x0800fc40,
         slot1_store=0x0800fc10, slot1_lit=0x0800fc44, init=0x08011915,
         calls=None, note='new init 08011914; slot0x194=08012ad9, slot0x118=30000'),
    dict(row=7,  threshold=0x0A33, callee=0x0800fc65, si=7,
         store=0x0800fc6e, slit=0x0800fc84,
         slot1_store=0x0800fc72, slot1_lit=0x0800fc88, init=0x08012009,
         calls=(0x0800fc68, 0x0800fafc),
         note='K33 replays K05, then overwrites name and init with 08012008'),
    dict(row=8,  threshold=0x0A34, callee=0x0800fc99, si=8,
         store=0x0800fc9a, slit=0x0800fcb0,
         slot1_store=None, slot1_lit=None, init=None,
         calls=None, note='K34 sku gate: sku==4 -> 08025f08 else 08025f00 written to slot0x1a4'),
    dict(row=9,  threshold=0x0A35, callee=0x0800fcc1, si=9,
         store=0x0800fcc8, slit=0x0800fcd4,
         slot1_store=None, slot1_lit=None, init=None,
         calls=None, note='K35 backs up slot0x194 into 2000135c and replaces it with 08011101'),
    dict(row=10, threshold=0x0A36, callee=0x0800fce1, si=10,
         store=0x0800fce2, slit=0x0800fcf8,
         slot1_store=0x0800fce6, slot1_lit=0x0800fcfc, init=0x08012275,
         calls=None, note='K36 installs a 7th init candidate 08012274 (BL 08012008 + extra setup)'),
    dict(row=11, threshold=0x0A37, callee=0x0800fd0d, si=11,
         store=0x0800fd12, slit=0x0800fd1c,
         slot1_store=None, slot1_lit=None, init=None,
         calls=None, note='K37 writes 08025ee8 into slot0x1a4'),
    dict(row=12, threshold=0x0A87, callee=0x0800fd25, si=12,
         store=None, slit=0x0800fd2c,
         slot1_store=None, slot1_lit=None, init=None,
         calls=None, raw=(0x0800fd24, '014b03607047c046'),
         note='K87 setter: project has NO function body; decoded from raw Thumb halfwords'),
    dict(row=13, threshold=0x0A90, callee=0x0800fd31, si=13,
         store=None, slit=0x0800fd40,
         slot1_store=None, slot1_lit=None, init=None,
         calls=None, raw=(0x0800fd30, '034b00220360c6235b00c2547047c046'),
         note='K90 setter: name + strb zero at byte offset 0x18c; decoded from raw Thumb halfwords'),
]

EXPECTED_BLS = {
    CONFIG_16_32: [0x08010bfa, 0x08010c72, 0x080119ce, 0x080120bc],
    CONFIG_8: [0x08011570, 0x08011e50],
    0x08012008: [0x0801227a],
    0x0800f968: [0x0800fae4],
    0x0800fafc: [0x0800fc68],
}


def load_image():
    data = BBIN.read_bytes()
    assert hashlib.sha256(data).hexdigest() == SHA256, 'frozen BBIN SHA256 mismatch'
    return data


def u32(data, va):
    return struct.unpack_from('<I', data, va - BASE)[0]


def u16(data, va):
    return struct.unpack_from('<H', data, va - BASE)[0]


def bl_target(addr, h1, h2):
    s = h1 >> 10 & 1
    i1 = 1 ^ ((h2 >> 13 & 1) ^ s)
    i2 = 1 ^ ((h2 >> 11 & 1) ^ s)
    n = (s << 24) | (i1 << 23) | (i2 << 22) | ((h1 & 1023) << 12) | ((h2 & 2047) << 1)
    if s:
        n -= 1 << 25
    return (addr + 4 + n) & 0xffffffff


def signed(n, width):
    return n - (1 << width) if n & (1 << (width - 1)) else n


def read_exports():
    """Retained instruction rows, indexed by address."""
    rows = {}
    per_file = []
    for path in sorted(TOOL.glob('pass*/*.txt')):
        if path.name == 'program.txt':
            continue
        n = 0
        for line in path.read_text().splitlines():
            m = re.match(r'INSN ([0-9a-f]{8}) ([0-9a-f]+) (.*)', line)
            if not m:
                continue
            addr = int(m[1], 16)
            raw = bytes.fromhex(m[2])
            rows[addr] = (raw, m[3], path.name)
            n += 1
        per_file.append({'path': str(path.relative_to(TOOL)), 'instruction_rows': n,
                         'sha256': hashlib.sha256(path.read_bytes()).hexdigest()})
    return rows, per_file


def decode_thumb16(addr, h, data):
    """Minimal, explicit Thumb-1 decoder covering only the halfwords used by the
    two setters that the retained Ghidra project never disassembled."""
    if h & 0xf800 == 0x4800:                       # LDR rt,[pc,#imm8*4]
        rt = (h >> 8) & 7
        target = ((addr + 4) & ~3) + 4 * (h & 0xff)
        return ('ldr_literal', rt, target, u32(data, target))
    if h & 0xf800 == 0x6000:                       # STR rt,[rn,#imm5*4]
        return ('str_immediate', h & 7, (h >> 3) & 7, ((h >> 6) & 0x1f) * 4)
    if h & 0xf800 == 0x2000:                       # MOVS rd,#imm8
        return ('movs_immediate', (h >> 8) & 7, h & 0xff)
    if h & 0xf800 == 0x0000 and (h >> 6) & 0x1f:  # LSLS rd,rm,#imm5
        return ('lsls_immediate', h & 7, (h >> 3) & 7, (h >> 6) & 0x1f)
    if h & 0xfe00 == 0x5400:                       # STRB rt,[rn,rm]
        return ('strb_register', h & 7, (h >> 3) & 7, (h >> 6) & 7)
    if h == 0x4770:
        return ('bx_lr',)
    if h == 0x46c0:
        return ('padding_nop',)
    return ('undecoded', hex(h))


def check(cond, failures, check_name, **detail):
    if not cond:
        failures.append({'check': check_name, **detail})
    return bool(cond)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--validation', default=str(TOOL / 'BYTE_VALIDATION.json'))
    ap.add_argument('--map', default=str(TOOL / 'DISPATCH_TABLE_MAP.json'))
    args = ap.parse_args()

    data = load_image()
    rows, per_file = read_exports()
    failures = []
    checks = []

    def ck(name, cond, **detail):
        checks.append({'name': name, 'ok': bool(cond), **detail})
        return check(cond, failures, name, **detail)

    # --- 1. the two in-image tables -------------------------------------------------
    table = [(u16(data, TABLE_VA + 8 * i), u32(data, TABLE_VA + 8 * i + 4))
             for i in range(14)]
    expected_table = [(s['threshold'], s['callee']) for s in SETTERS]
    ck('hwrev_threshold_dispatch_14_rows', table == expected_table,
       rows=[{'threshold': hex(t), 'callee': hex(c)} for t, c in table])

    strings = [data[STRINGS_VA + 4 * i - BASE:STRINGS_VA + 4 * i - BASE + 3].decode('ascii')
               for i in range(14)]
    nul = all(data[STRINGS_VA + 4 * i + 3 - BASE] == 0 for i in range(14))
    ck('version_strings_14_entries', strings == VERSION_STRINGS and nul,
       values=strings, all_nul_terminated=nul)
    ck('dispatch_loop_cmp_r5_0xe',
       data[LOOP_CMP_VA - BASE:LOOP_CMP_VA - BASE + 2] == bytes.fromhex('0e2d'))
    ck('config_8mhz_constant', u32(data, 0x080109f0) == 8000000,
       value=u32(data, 0x080109f0))

    # --- 2. every exported instruction byte ---------------------------------------
    totals = {'instruction_rows': 0, 'unique_addresses': 0, 'flash_literals': 0,
              'bl_targets': 0, 'direct_branch_targets': 0}
    unique = set()
    for addr, (raw, asm, fname) in sorted(rows.items()):
        off = addr - BASE
        check(0 <= off <= len(data) - len(raw) and data[off:off + len(raw)] == raw,
              failures, 'instruction_bytes', address=hex(addr), file=fname)
        unique.add(addr)
        totals['instruction_rows'] += 1
        mb = re.match(r'bl 0x([0-9a-f]{8})\b', asm)
        if mb and len(raw) == 4:
            h1 = int.from_bytes(raw[:2], 'little')
            h2 = int.from_bytes(raw[2:], 'little')
            got = bl_target(addr, h1, h2)
            if got == int(mb[1], 16):
                totals['bl_targets'] += 1
            else:
                failures.append({'check': 'bl_target', 'address': hex(addr)})
        md = re.match(r'(b|beq|bne|bcs|bcc|bmi|bpl|bvs|bvc|bhi|bls|bge|blt|bgt|ble) '
                      r'0x([0-9a-f]{8})\b', asm)
        if md and len(raw) == 2:
            h = int.from_bytes(raw, 'little')
            if md[1] == 'b' and h & 0xf800 == 0xe000:
                dest = addr + 4 + signed(h & 0x7ff, 11) * 2
            elif md[1] != 'b' and h & 0xf000 == 0xd000:
                dest = addr + 4 + signed(h & 255, 8) * 2
            else:
                dest = None
            if dest is not None:
                if dest == int(md[2], 16):
                    totals['direct_branch_targets'] += 1
                else:
                    failures.append({'check': 'direct_branch_target', 'address': hex(addr)})
        for lit_addr, val in re.findall(r'REF\[READ:([0-9a-f]{8})=([0-9a-f]+)\]', asm):
            o = int(lit_addr, 16) - BASE
            if 0 <= o <= len(data) - 4 and int.from_bytes(data[o:o + 4], 'little') == int(val, 16):
                totals['flash_literals'] += 1
            else:
                failures.append({'check': 'flash_literal', 'address': lit_addr, 'file': fname})
    totals['unique_addresses'] = len(unique)

    # --- 3. the 14 setters ---------------------------------------------------------
    map_rows = []
    for s in SETTERS:
        entry = s['callee'] & ~1
        sva = STRINGS_VA + 4 * s['si']
        label = VERSION_STRINGS[s['si']]
        item = {
            'row': s['row'], 'threshold': hex(s['threshold']),
            'threshold_label': label, 'callee_thumb_pointer': hex(s['callee']),
            'callee_entry': hex(entry), 'version_string_index': s['si'],
            'version_string_address': hex(sva), 'version_string': label,
            'string_literal_address': hex(s['slit']), 'note': s['note'],
        }

        # the string pointer literal is unique in the whole image
        needle = struct.pack('<I', sva)
        hits = [BASE + i for i in range(0, len(data) - 3) if data[i:i + 4] == needle]
        item['string_literal_hits'] = [hex(h) for h in hits]
        ck(f'row{s["row"]}_string_literal_unique',
           hits == [s['slit']], expected=hex(s['slit']), got=[hex(h) for h in hits])
        ck(f'row{s["row"]}_string_literal_value', u32(data, s['slit']) == sva)

        if s.get('raw'):
            start, hexbytes = s['raw']
            raw = bytes.fromhex(hexbytes)
            ck(f'row{s["row"]}_raw_bytes',
               data[start - BASE:start - BASE + len(raw)] == raw,
               address=hex(start), hex=raw.hex())
            decoded = []
            for i in range(0, len(raw), 2):
                h = int.from_bytes(raw[i:i + 2], 'little')
                decoded.append({'address': hex(start + i), 'halfword': f'{h:04x}',
                                'semantics': list(decode_thumb16(start + i, h, data))})
            item['thumb_decoding'] = decoded
            sem = [tuple(x['semantics']) for x in decoded]
            if s['row'] == 12:
                expected_sem = [
                    ('ldr_literal', 3, s['slit'], sva), ('str_immediate', 3, 0, 0),
                    ('bx_lr',), ('padding_nop',),
                ]
            else:
                expected_sem = [
                    ('ldr_literal', 3, s['slit'], sva), ('movs_immediate', 2, 0),
                    ('str_immediate', 3, 0, 0), ('movs_immediate', 3, 0xc6),
                    ('lsls_immediate', 3, 3, 1), ('strb_register', 2, 0, 3),
                    ('bx_lr',), ('padding_nop',),
                ]
            ck(f'row{s["row"]}_raw_thumb_decode', sem == expected_sem,
               decoded=sem, expected=expected_sem)
            path = TOOL / 'pass1' / f'{s["callee"]:08x}.txt'
            ck(f'row{s["row"]}_project_has_no_function_body',
               path.exists() and 'function=none' in path.read_text().splitlines()[0],
               export=str(path.relative_to(TOOL)))
            item['slot1_init_pointer'] = None
            item['slot1_effect'] = 'inherited from earlier cumulative setters'
        else:
            store = s['store']
            raw, asm, _ = rows.get(store, (b'', '<missing>', ''))
            ck(f'row{s["row"]}_slot0_store_present', bool(raw), address=hex(store))
            ck(f'row{s["row"]}_slot0_store_asm',
               'str ' in asm and f'REF[DATA:{sva:08x}=' in asm,
               address=hex(store), asm=asm)
            ck(f'row{s["row"]}_slot0_store_bytes',
               data[store - BASE:store - BASE + len(raw)] == raw, address=hex(store))
            item['slot0_store_address'] = hex(store)
            item['slot0_store_instruction'] = asm
            item['slot1_init_pointer'] = hex(s['init']) if s['init'] else None
            item['slot1_effect'] = ('overwritten' if s['init'] else
                                    'inherited from earlier cumulative setters')
            if s['init']:
                ck(f'row{s["row"]}_slot1_literal_value',
                   u32(data, s['slot1_lit']) == s['init'],
                   address=hex(s['slot1_lit']), value=hex(u32(data, s['slot1_lit'])))
                store1 = s['slot1_store']
                raw1, asm1, _ = rows.get(store1, (b'', '<missing>', ''))
                ck(f'row{s["row"]}_slot1_store_present', bool(raw1), address=hex(store1))
                ck(f'row{s["row"]}_slot1_store_asm',
                   'str ' in asm1 and f'REF[DATA:{s["init"]:08x}=' in asm1,
                   address=hex(store1), asm=asm1)
                ck(f'row{s["row"]}_slot1_store_bytes',
                   data[store1 - BASE:store1 - BASE + len(raw1)] == raw1, address=hex(store1))
                item['slot1_store_address'] = hex(store1)
                item['slot1_literal_address'] = hex(s['slot1_lit'])
        if s['calls']:
            bl_addr, bl_dest = s['calls']
            raw, asm, _ = rows.get(bl_addr, (b'', '<missing>', ''))
            ck(f'row{s["row"]}_inline_bl',
               bool(raw) and asm.startswith(f'bl 0x{bl_dest:08x}'),
               address=hex(bl_addr), asm=asm)
            item['inline_call'] = {'at': hex(bl_addr), 'target': hex(bl_dest)}
        map_rows.append(item)

    # --- 4. whole-image call graph -------------------------------------------------
    found = {k: [] for k in EXPECTED_BLS}
    for o in range(0, len(data) - 3, 2):
        h1 = int.from_bytes(data[o:o + 2], 'little')
        h2 = int.from_bytes(data[o + 2:o + 4], 'little')
        if h1 & 0xf800 == 0xf000 and h2 & 0xd000 == 0xd000:
            t = bl_target(BASE + o, h1, h2)
            if t in found:
                found[t].append(BASE + o)
    callgraph = {}
    for target, expected in EXPECTED_BLS.items():
        got = found[target]
        ck(f'bl_callsites_{target:08x}', got == expected,
           expected=[hex(x) for x in expected], got=[hex(x) for x in got])
        callgraph[hex(target)] = [hex(x) for x in got]

    # --- 5. outputs ---------------------------------------------------------------
    validation = {
        'schema': 'eightsleep.nonusb.hwrev-dispatch-table-byte-validation.v1',
        'date': '2026-11-08',
        'status': 'PASS' if not failures else 'FAIL',
        'source': {'file': str(BBIN), 'bytes': len(data), 'sha256': SHA256,
                   'image_base': hex(BASE), 'mapping': 'file offset = VA - 0x08008000'},
        'method': 'Retained read-only Ghidra exports re-checked byte-for-byte; two '
                  'in-image tables, all 14 string literals, all slot0/slot1 stores, '
                  'two raw Thumb setters, and a whole-image BL scan asserted against '
                  'the frozen file.',
        'totals': totals,
        'checks': checks,
        'failures': failures,
        'callgraph': callgraph,
        'exports': per_file,
        'limits': [
            'Labels are in-image ASCII, not a mapping to a marketing product, board or oscillator.',
            'A setter named analyst_seed_* is an existing analyst-created function in the retained project.',
            'No firmware execution, no device/account/network access.',
        ],
        'executes_firmware': False,
    }
    Path(args.validation).write_text(json.dumps(validation, ensure_ascii=False, indent=2) + '\n')

    dispatch_map = {
        'schema': 'eightsleep.nonusb.hwrev-dispatch-table-map.v1',
        'date': '2026-11-08',
        'table_address': hex(TABLE_VA),
        'strings_address': hex(STRINGS_VA),
        'row_layout': '[u16 threshold][u16 pad][u32 callee_thumb_pointer]',
        'loop_count_instruction': {'address': hex(LOOP_CMP_VA), 'raw_hex': '0e2d',
                                   'meaning': 'cmp r5,#0xe -> exactly 14 rows'},
        'application': 'Every row with threshold <= hwrev is applied in table order; '
                       'later setters overwrite slots written by earlier ones.',
        'rows': map_rows,
        'string_table_order_vs_threshold_order': {
            'strings_table': VERSION_STRINGS,
            'threshold_table': [VERSION_STRINGS[s['si']] for s in SETTERS],
            'note': 'indices 4/5 are swapped: the string table lists K10 before K05, '
                    'while the threshold rows apply K05 (0x0A05) before K10 (0x0A10).',
        },
        'clock_config_entrances': {
            '080108ac': {'writes': 'DAT_20000474 = 16000000 when 0xA87 <= hwrev <= 0xAFF, else 32000000',
                         'callers': [hex(x) for x in EXPECTED_BLS[CONFIG_16_32]]},
            '08010960': {'writes': 'DAT_20000474 = 8000000',
                         'callers': [hex(x) for x in EXPECTED_BLS[CONFIG_8]]},
        },
        'limits': [
            'Static bytes only: the HSE field is a software input, not a measured oscillator.',
            'Runtime RCC register values, PLL lock and real tick rates are not proven here.',
        ],
    }
    Path(args.map).write_text(json.dumps(dispatch_map, ensure_ascii=False, indent=2) + '\n')

    print(json.dumps({'status': validation['status'], 'failures': len(failures),
                      'checks': len(checks), 'totals': totals,
                      'setters': len(map_rows), 'exports': len(per_file)},
                     ensure_ascii=False, indent=2))
    return 0 if not failures else 1


if __name__ == '__main__':
    raise SystemExit(main())
