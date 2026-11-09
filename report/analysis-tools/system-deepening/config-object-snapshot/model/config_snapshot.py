#!/usr/bin/env python3
"""Build the complete per-hwrev configuration-object snapshot.

Read-only. Reads the retained pass2 setter exports (and the frozen BBIN for
literal values) and runs a small Thumb constant propagator over each setter:

    movs / mov / ldr literal / adds / subs / lsls / str / strb / bl

The config object is r0 on entry; aliases created with `movs rX,r0` and
moved with `adds rX,#imm` / `subs rX,#imm` stay INSIDE the object, so the
offset delta is accumulated (this is the +0xfc pattern that the previous
round's slot ledger had to correct by hand).

Two setters (K10, K33) begin with an inline BL that replays a whole earlier
setter; two (K87, K90) have no decoded function body in the retained project
and are reconstructed from their raw Thumb-1 halfwords. K34 selects one of two
table pointers from the runtime sku value; that write stays conditional.

The 14 threshold rows are then applied cumulatively for 16 hwrev boundaries,
producing the FINAL value of every written slot, not just its offset.

No firmware is executed, no Ghidra project is modified, no device or network
is contacted. Outputs CONFIG_SNAPSHOT.json and MODEL_RESULTS.json.

Usage:
  python3 model/config_snapshot.py
"""
from __future__ import annotations

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
DATE = '2026-11-08'
STRINGS_VA = 0x08024234

# row, threshold, version, string index, setter file, inline replay target
SETTERS = [
    dict(row=0,  threshold=0x0000, version='I00', si=0,  file='0800f58d.txt', replay=None),
    dict(row=1,  threshold=0x0805, version='I05', si=1,  file='0800f719.txt', replay=None),
    dict(row=2,  threshold=0x0900, version='J00', si=2,  file='0800f761.txt', replay=None),
    dict(row=3,  threshold=0x0A00, version='K00', si=3,  file='0800f969.txt', replay=None),
    dict(row=4,  threshold=0x0A05, version='K05', si=5,  file='0800fafd.txt', replay=None),
    dict(row=5,  threshold=0x0A10, version='K10', si=4,  file='0800fae1.txt', replay=3),
    dict(row=6,  threshold=0x0A30, version='K30', si=6,  file='0800fc05.txt', replay=None),
    dict(row=7,  threshold=0x0A33, version='K33', si=7,  file='0800fc65.txt', replay=4),
    dict(row=8,  threshold=0x0A34, version='K34', si=8,  file='0800fc99.txt', replay=None),
    dict(row=9,  threshold=0x0A35, version='K35', si=9,  file='0800fcc1.txt', replay=None),
    dict(row=10, threshold=0x0A36, version='K36', si=10, file='0800fce1.txt', replay=None),
    dict(row=11, threshold=0x0A37, version='K37', si=11, file='0800fd0d.txt', replay=None),
    dict(row=12, threshold=0x0A87, version='K87', si=12, file=None,          replay=None),
    dict(row=13, threshold=0x0A90, version='K90', si=13, file=None,          replay=None),
]

REPLAY_ENTRY_TO_ROW = {0x0800f968: 3, 0x0800fafc: 4}

# Raw Thumb-1 halfwords for the two setters with no decoded function body.
RAW = {
    'K87': dict(
        at=0x0800fd24,
        bytes='014b03607047c046',
        writes=[('ldr', 0x0800fd2c, 0x000)],
        note='ldr r3,[pc,#4] / str r3,[r0,#0] / bx lr'),
    'K90': dict(
        at=0x0800fd30,
        bytes='034b00220360c6235b00c2547047c046',
        writes=[('ldr', 0x0800fd40, 0x000)],
        byte_writes=[(0x18c, 0)],
        note='ldr r3,[pc,#12] / movs r2,#0 / str r3,[r0,#0] / '
             'movs r3,#0xc6 / lsls r3,r3,#1 / strb r2,[r0,r3] / bx lr'),
}

# K34 chooses between two channel-remap tables using a runtime sku value.
K34_LITS = dict(default=0x0800fcb8, sku4=0x0800fcbc, slot=0x1a4)
# K35 backs up the previous +0x194 value into this RAM address.
K35_BACKUP_RAM = 0x2000135c


def rd(data, va, n):
    return data[va - BASE:va - BASE + n]


def u32(data, va):
    return struct.unpack_from('<I', data, va - BASE)[0]


def load_image():
    data = BBIN.read_bytes()
    assert len(data) == 132896
    assert hashlib.sha256(data).hexdigest() == SHA256
    return data


def classify(v):
    if not isinstance(v, int):
        return 'runtime_value'
    if 0x08000000 <= v < 0x08040000:
        return 'thumb_function_pointer' if v & 1 else 'flash_data_pointer'
    if 0x20000000 <= v < 0x20020000:
        return 'ram_pointer'
    if 0x40000000 <= v < 0x50000000:
        return 'peripheral_pointer'
    return 'integer'


def version_of(v, data):
    if isinstance(v, int) and STRINGS_VA <= v < STRINGS_VA + 56 and \
            (v - STRINGS_VA) % 4 == 0:
        return rd(data, v, 3).decode('ascii', 'replace')
    return None


def parse_rows(path: Path):
    out = []
    for line in path.read_text(errors='replace').splitlines():
        m = re.match(r'INSN ([0-9a-f]{8}) ([0-9a-f]+) (.*)', line)
        if not m:
            continue
        addr, raw = int(m[1], 16), m[3]
        asm = raw.split(' REF[', 1)[0].strip()
        refs = re.findall(r'REF\[([^\]]+)\]', raw)
        out.append((addr, asm, refs))
    return out


def propagate(path: Path, data, version: str):
    """Tiny Thumb constant propagator. Returns writes, side-effects, calls."""
    # register -> ('const', value) | ('base', offset) | ('unknown', why)
    regs = {'r0': ('base', 0)}
    writes, external, calls, replays = [], [], [], []

    def get(r):
        return regs.get(r, ('unknown', 'uninitialised'))

    def put(r, val):
        regs[r] = val

    for addr, asm, refs in parse_rows(path):
        # ---- literals -------------------------------------------------
        m = re.match(r'ldr (r\d),\[0x([0-9a-f]{8})\]', asm)
        if m:
            lit_va = int(m[2], 16)
            value = None
            for ref in refs:
                r = re.match(r'READ:([0-9a-f]{8})=([0-9a-f]+)', ref)
                if r and int(r[1], 16) == lit_va:
                    value = int(r[2], 16)
                    break
            if value is None and BASE <= lit_va < BASE + len(data):
                value = u32(data, lit_va)
            put(m[1], ('const', value) if value is not None
                else ('unknown', f'literal@{lit_va:08x}'))
            continue
        m = re.match(r'ldr (r\d),\[(pc|r\d)', asm)
        if m:
            put(m[1], ('unknown', 'runtime memory read'))
            continue

        # ---- moves / arithmetic --------------------------------------
        m = re.match(r'movs? (r\d),#0x([0-9a-f]+)', asm)
        if m:
            put(m[1], ('const', int(m[2], 16)))
            continue
        m = re.match(r'movs? (r\d),(r\d)$', asm)
        if m:
            put(m[1], get(m[2]))
            continue
        m = re.match(r'adds (r\d),#0x([0-9a-f]+)', asm)
        if m:
            r, imm = m[1], int(m[2], 16)
            kind, val = get(r)
            if kind == 'base':
                put(r, ('base', val + imm))
            elif kind == 'const':
                put(r, ('const', (val + imm) & 0xffffffff))
            continue
        m = re.match(r'adds (r\d),(r\d),#0x([0-9a-f]+)', asm)
        if m:
            kind, val = get(m[2])
            put(m[1], ('const', (val + int(m[3], 16)) & 0xffffffff)
                if kind == 'const' else ('unknown', 'derived'))
            continue
        m = re.match(r'subs (r\d),#0x([0-9a-f]+)', asm)
        if m:
            r, imm = m[1], int(m[2], 16)
            kind, val = get(r)
            if kind == 'base':
                put(r, ('base', val - imm))
            elif kind == 'const':
                put(r, ('const', (val - imm) & 0xffffffff))
            continue
        m = re.match(r'lsls (r\d),(r\d),#0x([0-9a-f]+)', asm)
        if m:
            kind, val = get(m[2])
            put(m[1], ('const', (val << int(m[3], 16)) & 0xffffffff)
                if kind == 'const' else ('unknown', 'derived'))
            continue

        # ---- stores ---------------------------------------------------
        m = re.match(r'(str|strb) (r\d),\[(r\d),#0x([0-9a-f]+)\]', asm)
        if m:
            op, src, breg, imm = m[1], m[2], m[3], int(m[4], 16)
            bkind, bval = get(breg)
            skind, sval = get(src)
            width = 4 if op == 'str' else 1
            if bkind == 'base':
                writes.append(dict(offset=bval + imm, width=width,
                                   value=sval if skind == 'const' else None,
                                   unknown=('runtime' if skind != 'const' else None),
                                   at=f'0x{addr:08x}', asm=asm))
            elif bkind == 'const':
                external.append(dict(target=f'0x{bval:08x}', width=width,
                                     value=sval if skind == 'const' else 'runtime',
                                     at=f'0x{addr:08x}', asm=asm))
            continue
        m = re.match(r'(str|strb) (r\d),\[(r\d),(r\d)\]', asm)
        if m:
            op, src, breg, oreg = m[1], m[2], m[3], m[4]
            bkind, bval = get(breg)
            okind, oval = get(oreg)
            skind, sval = get(src)
            width = 4 if op == 'str' else 1
            if bkind == 'base' and okind == 'const':
                writes.append(dict(offset=bval + oval, width=width,
                                   value=sval if skind == 'const' else None,
                                   unknown=('runtime' if skind != 'const' else None),
                                   at=f'0x{addr:08x}', asm=asm))
            elif bkind == 'const' and okind == 'const':
                external.append(dict(target=f'0x{bval + oval:08x}', width=width,
                                     value=sval if skind == 'const' else 'runtime',
                                     at=f'0x{addr:08x}', asm=asm))
            continue

        # ---- calls ----------------------------------------------------
        m = re.match(r'bl 0x([0-9a-f]{8})', asm)
        if m:
            target = int(m[1], 16)
            calls.append(dict(at=f'0x{addr:08x}', target=f'0x{target:08x}'))
            if target in REPLAY_ENTRY_TO_ROW:
                replays.append(dict(at=f'0x{addr:08x}',
                                    target=f'0x{target:08x}',
                                    replays_row=REPLAY_ENTRY_TO_ROW[target]))
            # BL clobbers r0-r3; r4+ aliases survive (as in K10 / K33).
            for r in ('r0', 'r1', 'r2', 'r3'):
                regs.pop(r, None)
            regs['r0'] = ('base', 0)
            continue
        # everything else (cmp / branches / push / pop / ...) is ignored.

    return dict(writes=writes, external=external, calls=calls, replays=replays)


def build_setters(data):
    out = []
    for row in SETTERS:
        if row['file'] is None:
            raw = RAW[row['version']]
            writes = [dict(offset=off, width=4, value=u32(data, lit),
                           unknown=None, at=f"0x{raw['at'] + k * 2:08x}",
                           asm=raw['note'], source='raw_thumb16')
                      for k, (_, lit, off) in enumerate(raw['writes'])]
            for off, val in raw.get('byte_writes', []):
                writes.append(dict(offset=off, width=1, value=val,
                                   unknown=None, at=f"0x{raw['at'] + 10:08x}",
                                   asm='strb r2,[r0,r3]',
                                   source='raw_thumb16'))
            entry = dict(row=row['row'], threshold=f"0x{row['threshold']:04x}",
                         version=row['version'], string_index=row['si'],
                         source='raw Thumb-1 halfwords in the frozen BBIN',
                         raw_bytes=raw['bytes'], note=raw['note'],
                         writes=writes, external=[], calls=[], replays=[])
        else:
            p = TOOL / 'pass2' / row['file']
            r = propagate(p, data, row['version'])
            writes = r['writes']
            # K34: replace the linear propagated value with an explicit
            # runtime-sku conditional, justified by the exported cmp/bne/ldrs.
            conditional = None
            if row['version'] == 'K34':
                default = u32(data, K34_LITS['default'])
                sku4 = u32(data, K34_LITS['sku4'])
                for w in writes:
                    if w['offset'] == K34_LITS['slot']:
                        w['conditional'] = dict(test='sku == 4',
                                                true=sku4, false=default,
                                                basis='cmp r2,#0x4 / bne / '
                                                      'two literal loads')
                        w['value'] = None
                        w['unknown'] = 'runtime sku'
                conditional = dict(slot=f"0x{K34_LITS['slot']:x}",
                                   test='sku == 4', true=sku4, false=default)
            entry = dict(row=row['row'], threshold=f"0x{row['threshold']:04x}",
                         version=row['version'], string_index=row['si'],
                         source=f'pass2/{row["file"]}',
                         writes=writes, external=r['external'],
                         calls=r['calls'], replays=r['replays'],
                         conditional=conditional)
        for w in entry['writes']:
            w['kind'] = classify(w['value'])
            w['version_string'] = version_of(w['value'], data)
        out.append(entry)
    return out


def resolve(w, sku):
    if w.get('conditional'):
        c = w['conditional']
        return c['true'] if sku == 4 else c['false']
    return w['value']


def apply_boundary(hwrev, setters, sku, data):
    applied = [s for s in setters if int(s['threshold'], 16) <= hwrev]
    slots, side_effects, sequence = {}, [], []

    def consume(s, tag):
        sequence.append(dict(setter=s['version'], row=s['row'], tag=tag))
        for w in s['writes']:
            v = resolve(w, sku)
            key = f"0x{w['offset']:x}"
            slots[key] = dict(offset=key, width=w['width'],
                              value=None if v is None else f'0x{v:08x}'
                              if isinstance(v, int) else v,
                              kind=classify(v),
                              version_string=version_of(v, data),
                              written_by=s['version'], at=w['at'],
                              asm=w['asm'])
        for e in s['external']:
            side_effects.append(dict(**e, written_by=s['version']))

    for s in applied:
        for rp in s['replays']:
            consume(setters[rp['replays_row']], 'inline_bl_replay')
        consume(s, 'dispatch_row')

    last = applied[-1]['version'] if applied else 'none'
    return dict(hwrev=f'0x{hwrev:04x}',
                last_version=last,
                applied_distinct_rows=len(applied),
                applied_setter_calls=len(sequence),
                sequence=sequence,
                slot_count=len(slots),
                slots=dict(sorted(slots.items(),
                                  key=lambda kv: int(kv[0], 16))),
                side_effects=side_effects)


def main():
    data = load_image()
    setters = build_setters(data)
    boundaries = sorted(set([int(s['threshold'], 16) for s in setters]
                            + [0x0AFF, 0x0B00]))
    snapshots = {f'0x{b:04x}': apply_boundary(b, setters, sku=0, data=data)
                 for b in boundaries}
    snapshots_sku4 = {f'0x{b:04x}': apply_boundary(b, setters, sku=4, data=data)
                      for b in boundaries}

    checks = []

    def eq(name, got, want):
        checks.append(dict(name=name, got=str(got), expected=str(want),
                           status='PASS' if got == want else 'FAIL'))

    # --- structural assertions ------------------------------------------------
    eq('setter_rows', len(setters), 14)
    eq('hwrev_boundaries', len(boundaries), 16)
    top = snapshots['0x0b00']
    eq('top_applied_distinct_rows', top['applied_distinct_rows'], 14)
    eq('top_setter_calls_including_two_replays', top['applied_setter_calls'], 16)
    eq('top_sequence_has_two_replay_tags',
        sum(1 for x in top['sequence'] if x['tag'] == 'inline_bl_replay'), 2)
    eq('K10_replays_K00',
        setters[5]['replays'][0]['replays_row'], 3)
    eq('K33_replays_K05',
        setters[7]['replays'][0]['replays_row'], 4)

    # --- slot0 = newest version string pointer, straight from the BBIN ---------
    for b, snap in snapshots.items():
        if snap['last_version'] == 'none':
            continue
        row = int(b, 16)
        expected_row = max((s for s in setters
                            if int(s['threshold'], 16) <= row),
                           key=lambda s: s['row'])
        want = STRINGS_VA + expected_row['string_index'] * 4
        eq(f'slot0_{b}_points_to_{expected_row["version"]}',
           snap['slots']['0x0']['value'], f'0x{want:08x}')
        eq(f'slot0_{b}_decoded_string',
           snap['slots']['0x0']['version_string'], expected_row['version'])

    # --- two full default objects are much larger than the incremental setters -
    eq('I00_write_count_ge_60', len(setters[0]['writes']) >= 60, True)
    eq('K00_write_count_ge_45', len(setters[3]['writes']) >= 45, True)
    eq('K90_write_count', len(setters[13]['writes']), 2)

    # --- K10 replay restores the K00 object ------------------------------------
    k10 = snapshots['0x0a10']
    eq('K10_boundary_slot_count_matches_K00_base',
       k10['slot_count'] >= snapshots['0x0a00']['slot_count'], True)
    eq('K10_boundary_slot0_is_K10_string',
       k10['slots']['0x0']['version_string'], 'K10')
    # K10 overwrites +0x164 on top of the replayed K00 object.
    eq('K10_overwrites_0x164', k10['slots'].get('0x164', {}).get('written_by'),
       'K10')

    # --- K33 replay restores the K05 object ------------------------------------
    k33 = snapshots['0x0a33']
    eq('K33_boundary_slot_count_matches_K05_base',
       k33['slot_count'] >= snapshots['0x0a05']['slot_count'], True)
    eq('K33_overwrites_0x114', k33['slots'].get('0x114', {}).get('written_by'),
       'K33')
    eq('K33_overwrites_0x118', k33['slots'].get('0x118', {}).get('written_by'),
       'K33')

    # --- K34 runtime-sku conditional ------------------------------------------
    a0 = snapshots['0x0a34']['slots'].get('0x1a4', {})
    a4 = snapshots_sku4['0x0a34']['slots'].get('0x1a4', {})
    eq('K34_sku_other_selects_08025f00', a0.get('value'), '0x08025f00')
    eq('K34_sku4_selects_08025f08', a4.get('value'), '0x08025f08')
    eq('K37_overwrites_0x1a4_with_08025ee8',
       snapshots['0x0a37']['slots'].get('0x1a4', {}).get('value'),
       '0x08025ee8')

    # --- K35 backup and +0x194 --------------------------------------------------
    k35 = setters[9]
    eq('K35_backup_target', k35['external'][0]['target'],
       f'0x{K35_BACKUP_RAM:08x}')
    eq('K35_backup_value_is_runtime', k35['external'][0]['value'], 'runtime')
    eq('K35_replaces_0x194',
       snapshots['0x0a35']['slots'].get('0x194', {}).get('value'),
       f'0x{u32(data, 0x0800fcdc):08x}')

    # --- K90 clears the byte status flag ---------------------------------------
    eq('K90_clears_0x18c_byte',
       snapshots['0x0a90']['slots'].get('0x18c', {}).get('value'),
       '0x00000000')
    eq('K90_0x18c_is_a_byte_write',
       snapshots['0x0a90']['slots'].get('0x18c', {}).get('width'), 1)

    # --- known literal constants from the frozen image --------------------------
    # 4000000 / 2000000 / 30000 / 200 appear in the setter literal pools.
    for name, hexval in [('4000000', 0x3d0900), ('2000000', 0x1e8480),
                         ('30000', 0x7530), ('0xc000c', 0xc000c)]:
        lit = struct.pack('<I', hexval)
        eq(f'constant_{name}_present_in_image', lit in data, True)
    # 0xc8 is an 8-bit Thumb immediate (movs r3,#0xc8 => 23 c8), not a
    # literal-pool word; check the encoded instruction instead.
    eq('thumb_immediate_200_encoded_as_movs', b'\x23\xc8' in data, True)
    # every slot value that is a flash pointer must be inside the image
    bad = [k for k, v in top['slots'].items()
           if v['kind'] in ('flash_data_pointer', 'thumb_function_pointer')
           and not (BASE <= int(v['value'], 16) < BASE + len(data))]
    eq('top_snapshot_all_flash_pointers_in_image', len(bad), 0)

    failures = [c for c in checks if c['status'] != 'PASS']
    snapshot = dict(
        schema='eightsleep.nonusb.config-object-snapshot.v1',
        date=DATE,
        status='PASS' if not failures else 'FAIL',
        source=dict(
            bbin='materials/eightsleep-full-evidence-20261107/firmware/mtk/'
                 'rootfs/files/opt/eight/lib/subsystem_updates/firmware-sensor-g0.bbin',
            sha256=SHA256,
            export_pass='pass2 (14 setter read-only exports)',
            raw_thumb16=['K87', 'K90']),
        method='instruction-level Thumb constant propagation over each setter, '
               'then cumulative application of every dispatch row whose '
               'threshold <= hwrev, expanding the two inline BL replays',
        config_object='r0 on entry to the 0801d888 dispatcher; '
                      'offsets are byte offsets from that base',
        semantics=dict(
            inline_replays=['K10 replays K00', 'K33 replays K05'],
            conditional_writes=['K34 +0x1a4 depends on runtime sku'],
            external_writes=['K35 backs up the previous +0x194 into 0x2000135c'],
            byte_writes=['K90 clears +0x18c']),
        setters=setters,
        boundaries=[f'0x{b:04x}' for b in boundaries],
        snapshots=snapshots,
        snapshots_sku4=snapshots_sku4,
        limits=[
            'Values are the values a setter WRITES, not the runtime value of '
            'the object; callbacks invoked between dispatch rows may add more.',
            'sku / devicesn / hwrev are runtime fields; only the sku==4 branch '
            'is modelled explicitly (sku==0 and sku==4 snapshot pairs).',
            'K34 / K35 / 08011100 can further change +0x1a4 / +0x194 after '
            'the setter sequence; those callbacks are outside this snapshot.',
            'No firmware was executed and no device was contacted.',
        ],
        executes_firmware=False,
    )
    (TOOL / 'CONFIG_SNAPSHOT.json').write_text(
        json.dumps(snapshot, ensure_ascii=False, indent=1, sort_keys=True) + '\n')
    results = dict(
        schema='eightsleep.nonusb.config-snapshot-model-results.v1',
        date=DATE,
        status='PASS' if not failures else 'FAIL',
        totals=dict(assertions=len(checks), failures=len(failures),
                    setter_rows=len(setters), boundaries=len(boundaries),
                    top_slot_count=top['slot_count']),
        checks=checks,
        failures=failures,
        executes_firmware=False,
    )
    (TOOL / 'MODEL_RESULTS.json').write_text(
        json.dumps(results, ensure_ascii=False, indent=1, sort_keys=True) + '\n')
    print(json.dumps(dict(status=results['status'], totals=results['totals'],
                          first_failures=failures[:10],
                          per_setter_writes={s['version']: len(s['writes'])
                                             for s in setters}), indent=1))
    return 0 if not failures else 1


if __name__ == '__main__':
    raise SystemExit(main())
