"""Minimal read-only Thumb decoder for the config-object callback prefix scan.

Scope: only the instruction forms that actually occur at the 80 callback entry
points of firmware-sensor-g0.bbin. It never executes firmware. It decodes bytes
from the frozen BBIN and resolves PC-relative literal loads against that image.

The decoder stops at the first return/pop-pc, at an unconditional branch that
leaves the entry, or at the first form it does not model. A prefix is enough:
the published ledger records the decoded prefix plus the reason it stopped, and
never claims a full decompilation of an undecoded region.
"""

import struct


def bl_target(addr, h1, h2):
    """Thumb-2 BL (T1) target; addr is the address of the first halfword."""
    s = (h1 >> 10) & 1
    imm10 = h1 & 0x3FF
    imm11 = h2 & 0x7FF
    j1 = (h2 >> 13) & 1
    j2 = (h2 >> 11) & 1
    i1 = 1 - (j1 ^ s)
    i2 = 1 - (j2 ^ s)
    imm = (s << 24) | (i1 << 23) | (i2 << 22) | (imm10 << 12) | (imm11 << 1)
    if s:
        imm -= 1 << 25
    return (addr + 4 + imm) & 0xFFFFFFFF


def bw_target(addr, h1, h2, conditional=False):
    """Thumb-2 B.W (T4) / B<cond>.W (T3) target, best effort."""
    s = (h1 >> 10) & 1
    imm10 = h1 & 0x3FF
    if conditional:
        imm6 = h2 & 0x3F
        j1 = (h2 >> 13) & 1
        j2 = (h2 >> 11) & 1
        imm = (s << 20) | (j2 << 19) | (j1 << 18) | (imm6 << 12) | (imm10 << 1)
        if s:
            imm -= 1 << 21
    else:
        imm11 = h2 & 0x7FF
        j1 = (h2 >> 13) & 1
        j2 = (h2 >> 11) & 1
        imm = (s << 25) | (j2 << 24) | (j1 << 23) | (imm10 << 12) | (imm11 << 1)
        if s:
            imm -= 1 << 26
    return (addr + 4 + imm) & 0xFFFFFFFF


ALU16 = {
    0: 'ands', 1: 'eors', 2: 'lsls', 3: 'lsrs', 4: 'asrs', 5: 'adcs',
    6: 'sbcs', 7: 'rors', 8: 'tst', 9: 'rsbs', 10: 'cmps', 11: 'cmns',
    12: 'orrs', 13: 'muls', 14: 'bics', 15: 'mvns',
}
COND16 = {0: 'beq', 1: 'bne', 2: 'bcs', 3: 'bcc', 4: 'bmi', 5: 'bpl',
          6: 'bvs', 7: 'bvc', 8: 'bhi', 9: 'bls', 10: 'bge', 11: 'blt',
          12: 'bgt', 13: 'ble'}


def _r(x):
    return 'r%d' % x


def decode_16(h, addr, read32):
    """Return (asm, kind, extra) for one 16-bit halfword."""
    if h == 0x46C0:
        return 'nop', 'nop', {}
    if h == 0x4770:
        return 'bx lr', 'return', {}
    if h & 0xFF87 == 0x4700:
        return 'bx %s' % _r((h >> 3) & 7), 'return', {}
    if h & 0xFF00 == 0xB500:                             # PUSH with LR
        regs = [i for i in range(8) if h & (1 << i)]
        return 'push {%s,lr}' % ','.join(_r(i) for i in regs), 'push', {'reglist': regs}
    if h & 0xFF00 == 0xB400:                             # PUSH without LR
        regs = [i for i in range(8) if h & (1 << i)]
        return 'push {%s}' % ','.join(_r(i) for i in regs), 'push', {'reglist': regs}
    if h & 0xFE00 == 0xBC00:                             # POP
        pc = bool(h & 0x100)
        regs = [i for i in range(8) if h & (1 << i)]
        return 'pop {%s%s}' % (','.join(_r(i) for i in regs), ',pc' if pc else ''), \
               ('return' if pc else 'pop'), {'reglist': regs}
    if h & 0xF800 == 0x4800:                             # LDR literal
        rt = (h >> 8) & 7
        lit = ((addr + 4) & ~3) + (h & 0xFF) * 4
        val = read32(lit)
        return 'ldr %s,[pc,#0x%x]' % (_r(rt), (h & 0xFF) * 4), 'literal', \
               {'literal_va': lit, 'literal_value': val}
    if h & 0xF800 == 0x2000:                             # MOVS imm8
        return 'movs %s,#0x%x' % (_r((h >> 8) & 7), h & 0xFF), 'immediate', \
               {'imm': h & 0xFF}
    if h & 0xF800 == 0x3000:                             # ADDS imm8
        return 'adds %s,#0x%x' % (_r((h >> 8) & 7), h & 0xFF), 'immediate', \
               {'imm': h & 0xFF}
    if h & 0xF800 == 0x3800:                             # SUBS imm8
        return 'subs %s,#0x%x' % (_r((h >> 8) & 7), h & 0xFF), 'immediate', \
               {'imm': h & 0xFF}
    if h & 0xF800 == 0x2800:                             # CMP imm8
        return 'cmp %s,#0x%x' % (_r((h >> 8) & 7), h & 0xFF), 'compare', \
               {'imm': h & 0xFF}
    if h & 0xF000 == 0xD000 and (h >> 8) & 0xF <= 13:    # conditional branch
        cond = (h >> 8) & 0xF
        off = h & 0xFF
        if off & 0x80:
            off -= 0x100
        return '%s 0x%08x' % (COND16[cond], (addr + 4 + off * 2) & 0xFFFFFFFF), \
               'branch', {'target': (addr + 4 + off * 2) & 0xFFFFFFFF}
    if h & 0xF800 == 0xE000:                             # unconditional B
        off = h & 0x7FF
        if off & 0x400:
            off -= 0x800
        return 'b 0x%08x' % ((addr + 4 + off * 2) & 0xFFFFFFFF), 'branch', \
               {'target': (addr + 4 + off * 2) & 0xFFFFFFFF}
    if h & 0xF000 == 0x5000:                             # STR/STRB/STRH/LDRSB reg
        op = (h >> 9) & 7
        name = {0: 'str', 1: 'strh', 2: 'strb', 3: 'ldrsb', 4: 'ldr',
                5: 'ldrh', 6: 'ldrb', 7: 'ldrsh'}[op]
        return '%s %s,[%s,%s]' % (name, _r(h & 7), _r((h >> 3) & 7),
                                  _r((h >> 6) & 7)), 'memory', {}
    if h & 0xF000 == 0x6000:                             # STR/LDR immediate (word)
        op = (h >> 11) & 3
        name = 'str' if op == 0 else 'ldr'
        imm = ((h >> 6) & 0x1F) * (4 if op < 2 else 1)
        return '%s %s,[%s,#0x%x]' % (name, _r(h & 7), _r((h >> 3) & 7), imm), \
               'memory', {'imm': imm}
    if h & 0xF000 == 0x7000:                             # STRB/LDRB immediate
        op = (h >> 11) & 1
        name = 'strb' if op == 0 else 'ldrb'
        return '%s %s,[%s,#0x%x]' % (name, _r(h & 7), _r((h >> 3) & 7),
                                     (h >> 6) & 0x1F), 'memory', {}
    if h & 0xF000 == 0x8000:                             # STRH/LDRH immediate
        op = (h >> 11) & 1
        name = 'strh' if op == 0 else 'ldrh'
        return '%s %s,[%s,#0x%x]' % (name, _r(h & 7), _r((h >> 3) & 7),
                                     ((h >> 6) & 0x1F) * 2), 'memory', {}
    if h & 0xF000 == 0x9000:                             # STR SP-relative
        return 'str %s,[sp,#0x%x]' % (_r((h >> 8) & 7), (h & 0xFF) * 4), 'memory', {}
    if h & 0xF000 == 0xA000:                             # ADD rd,PC/SP,#imm*4
        base = 'sp' if (h >> 11) & 1 else 'pc'
        return 'add %s,%s,#0x%x' % (_r((h >> 8) & 7), base, (h & 0xFF) * 4), \
               'address', {}
    if h & 0xF000 == 0xB000:                             # misc (SUB SP, SXTH, etc.)
        op = (h >> 8) & 0xF
        if op == 0:
            return 'add sp,#0x%x' % ((h & 0x7F) * 4), 'stack', {}
        if op == 8:
            return 'sub sp,#0x%x' % ((h & 0x7F) * 4), 'stack', {}
        if op == 2:
            return 'sxth %s,%s' % (_r(h & 7), _r((h >> 3) & 7)), 'extend', {}
        if op == 4:
            return 'uxtb %s,%s' % (_r(h & 7), _r((h >> 3) & 7)), 'extend', {}
        if op == 5:
            return 'uxth %s,%s' % (_r(h & 7), _r((h >> 3) & 7)), 'extend', {}
    if h & 0xF000 == 0x4000:                             # data-processing register
        op = (h >> 6) & 0xF
        rd = h & 7
        rs = (h >> 3) & 7
        return '%s %s,%s' % (ALU16[op], _r(rd), _r(rs)), 'alu', {}
    if h & 0xE000 == 0x0000:                             # shift / add / sub
        op = (h >> 11) & 7
        rd, rm, imm = h & 7, (h >> 3) & 7, (h >> 6) & 0x1F
        if op in (0, 1, 2):
            name = {0: 'lsls', 1: 'lsrs', 2: 'asrs'}[op]
            if op == 0 and imm == 0:
                return 'movs %s,%s' % (_r(rd), _r(rm)), 'alu', {}
            return '%s %s,%s,#0x%x' % (name, _r(rd), _r(rm), imm), 'alu', \
                   {'imm': imm}
        name = 'adds' if ((h >> 9) & 1) == 0 else 'subs'
        imm3 = (h >> 6) & 7
        if (h >> 10) & 1:
            return '%s %s,%s,#0x%x' % (name, _r(rd), _r(rm), imm3), 'alu', \
                   {'imm': imm3}
        return '%s %s,%s,%s' % (name, _r(rd), _r(rm), _r(imm3)), 'alu', {}
    return 'UNDECODED16 %04x' % h, 'unknown', {}


def scan(data, base_va, entry_va, read32, max_halfwords=64):
    """Decode a bounded prefix at entry_va. Returns (rows, stop_reason)."""
    rows = []
    off = entry_va - base_va
    if off < 0 or off + 4 > len(data):
        return rows, 'out_of_image'
    consumed = 0
    while consumed < max_halfwords:
        addr = entry_va + consumed * 2
        pos = addr - base_va
        if pos + 2 > len(data):
            return rows, 'out_of_image'
        h1 = struct.unpack_from('<H', data, pos)[0]
        is32 = (h1 & 0xF800) in (0xE800, 0xF000, 0xF800)
        if is32 and pos + 4 <= len(data):
            h2 = struct.unpack_from('<H', data, pos + 2)[0]
            raw = struct.pack('<HH', h1, h2).hex()
            if (h1 & 0xFFF0) == 0xF3B0 and h2 in (0x8F4F, 0x8F5F):
                asm, kind, extra = ('dsb #0xf' if h2 == 0x8F4F else 'dmb #0x1f'), 'barrier', {}
            elif (h2 & 0xD000) == 0xD000 and (h1 & 0xF800) == 0xF000:
                tgt = bl_target(addr, h1, h2)
                asm, kind, extra = 'bl 0x%08x' % tgt, 'call', {'target': tgt}
            elif (h2 & 0xD000) == 0x8000 and (h1 & 0xF800) == 0xF000:
                tgt = bw_target(addr, h1, h2, conditional=True)
                asm, kind, extra = 'b<cond>.w 0x%08x' % tgt, 'branch', {'target': tgt}
            elif (h2 & 0xD000) == 0x9000 and (h1 & 0xF800) == 0xF000:
                tgt = bw_target(addr, h1, h2, conditional=False)
                asm, kind, extra = 'b.w 0x%08x' % tgt, 'branch', {'target': tgt}
            else:
                asm, kind, extra = 'UNDECODED32 %s' % raw, 'unknown', {}
            rows.append(dict(addr='0x%08x' % addr, raw=raw, asm=asm,
                             kind=kind, width=4, **extra))
            consumed += 2
            if kind == 'unknown':
                return rows, 'undecoded_32'
            if kind == 'branch' and asm.startswith('b.w'):
                return rows, 'unconditional_branch'
            continue
        if is32:
            return rows, 'truncated_32'
        raw = struct.pack('<H', h1).hex()
        asm, kind, extra = decode_16(h1, addr, read32)
        rows.append(dict(addr='0x%08x' % addr, raw=raw, asm=asm,
                         kind=kind, width=2, **extra))
        consumed += 1
        if kind == 'return':
            return rows, 'return'
        if kind == 'unknown':
            return rows, 'undecoded_16'
        if kind == 'branch' and asm.startswith('b 0x'):
            return rows, 'unconditional_branch'
    return rows, 'prefix_limit'
