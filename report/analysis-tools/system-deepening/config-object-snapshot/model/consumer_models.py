#!/usr/bin/env python3
"""Model the six groups of previously unexported consumers, instruction-level.

Read-only. Combines the pass1/pass3 exports with the frozen BBIN to produce:

  1. 0800cf10  -> PCLK = DAT_20000250 >> APB_PRESCALER_TABLE[(RCC+8 >> 12) & 7]
  2. 0800e8b4  -> the full USART clock-source selection matrix (four sources,
                  three mask groups, OVER8=0x8000 choosing BRR path A or B)
  3. 0x0802420c -> exact 16 divisors and a parameterised legality scan of the
                   last four packed-looking entries
  4. a consumer inventory, including the correction that four listed
     "consumers" (and 0800fc00) are literal-pool slots, not callable code

All clocks and baud rates are EXPLICIT PARAMETERS, not measured hardware
values. Outputs CONSUMER_MODELS.json. No firmware is executed, no Ghidra
project is modified, no device or network is contacted.

Usage:
  python3 model/consumer_models.py
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

APB_VA = 0x080241ac
AHB_VA = 0x080241cc
DIV_VA = 0x0802420c
E8B4 = TOOL / 'pass1' / '0800e8b4.txt'

# Instruction-anchored USART clock-source matrix. The four goto labels are
# read directly from the exported INSN rows (see KEY_ANCHORS below).
CLOCK_MATRIX = [
    dict(group='USART1', base=0x40013800, mask=0x3,
         cases={0: ('0800e914', 'PCLK via 0800cf10'),
                1: ('0800e9b2', 'SYSCLK via 0800cd24'),
                2: ('0800e964', 'HSI16 16000000'),
                3: ('0800e958', '32768 (0x8000)')}),
    dict(group='group_2', base=0x40004400, mask=0xc,
         cases={0x0: ('0800e914', 'PCLK via 0800cf10'),
                0x4: ('0800e9b2', 'SYSCLK via 0800cd24'),
                0x8: ('0800e964', 'HSI16 16000000'),
                0xc: ('0800e958', '32768 (0x8000)')}),
    dict(group='group_3', base=0x40004800, mask=0x30,
         cases={0x00: ('0800e914', 'PCLK via 0800cf10'),
                0x10: ('0800e9b2', 'SYSCLK via 0800cd24'),
                0x20: ('0800e964', 'HSI16 16000000'),
                0x30: ('0800e958', '32768 (0x8000)')}),
    dict(group='group_4_always_pclk',
         bases=[0x40004c00, 0x40005000, 0x40013c00], mask=None,
         cases={'any': ('0800e914', 'PCLK via 0800cf10')}),
]

# Exact instruction anchors from pass1/0800e8b4.txt (address, mnemonic).
KEY_ANCHORS = [
    (0x0800e900, 'movs r2,#0x3'),
    (0x0800e902, 'ldr r3,[0x0800ea38]'),
    (0x0800e904, 'ldr r3,[r3,#0x54]'),
    (0x0800e906, 'ands r3,r2'),
    (0x0800e908, 'cmp r3,#0x2'),
    (0x0800e90a, 'beq 0x0800e964'),
    (0x0800e910, 'cmp r3,#0x1'),
    (0x0800e912, 'beq 0x0800e9b2'),
    (0x0800e914, 'movs r3,#0x80'),
    (0x0800e916, 'lsls r3,r3,#0x8'),
    (0x0800e918, 'cmp r0,r3'),
    (0x0800e91e, 'bl 0x0800cf10'),
    (0x0800e93e, 'ldr r3,[r3,#0x54]'),
    (0x0800e960, 'movs r0,r3'),
    (0x0800e964, 'movs r3,#0x80'),
    (0x0800e96c, 'ldr r0,[0x0800ea44]'),
    (0x0800e970, 'ldr r3,[0x0800ea48]'),
    (0x0800e974, 'ldrh r1,[r2,r3]'),
    (0x0800e976, 'bl 0x08008174'),
    (0x0800e982, 'bl 0x08008174'),
    (0x0800e988, 'ldr r3,[0x0800ea4c]'),
    (0x0800e98a, 'subs r2,#0x10'),
    (0x0800e9a0, 'ldr r3,[r3,#0x54]'),
    (0x0800e9ba, 'bl 0x0800cd24'),
    (0x0800e9b2, 'movs r3,#0x80'),
    (0x0800e9b4, 'lsls r3,r3,#0x8'),
    (0x0800e9b6, 'cmp r0,r3'),
    (0x0800e9b8, 'bne 0x0800ea20'),
    (0x0800e9c0, 'cmp r3,#0x30'),
    (0x0800e9c6, 'ldr r2,[0x0800ea54]'),
    (0x0800e958, 'movs r3,#0x80'),
    (0x0800e9da, 'ldr r0,[0x0800ea44]'),
    (0x0800e9e4, 'bl 0x08008174'),
    (0x0800e9f2, 'bl 0x08008174'),
    (0x0800e9f8, 'ldr r3,[0x0800ea4c]'),
    (0x0800ea14, 'bl 0x0800cf10'),
    (0x0800ea18, 'cmp r0,#0x0'),
    (0x0800ea20, 'bl 0x0800cd24'),
]

CONSUMERS = [
    dict(name='080110f6', kind='function',
         finding='calls FUN_0801fdd0(0); 0801fdd0 indexes a 12-byte '
                 'descriptor table at 0x08027f0c (+4 = 0x50000000, '
                 '+8 = 1) and calls 0800acbc',
         source='pass1/080110f6.txt + pass3/0801fdd0.txt'),
    dict(name='0800cf10', kind='function',
         finding='APB/peripheral clock selector: PCLK = DAT_20000250 >> '
                 'APB_TABLE[(0x40021008 >> 12) & 7]',
         source='pass1/0800cf10.txt'),
    dict(name='0800ea60', kind='function',
         finding='USART CR1/CR2/CR3 bit-field configuration driven by '
                 'param_1[10] flags (bits 31..25)',
         source='pass1/0800ea60.txt'),
    dict(name='0800ebf8', kind='function',
         finding='USART follow-up setup; param_1[0x24]=0, 0x1ffffff mask, '
                 'BRR/CR1 writes and a 0x20 timeout field',
         source='pass1/0800ebf8.txt'),
    dict(name='08020f94', kind='function',
         finding='the 8-byte copy helper: a byte loop from r1 to r0 of r2 '
                 'bytes (9 INSN rows, exact)',
         source='pass1/08020f94.txt'),
    dict(name='08019c90', kind='function',
         finding='driver handle-block initialiser: DSB/DMB, clears '
                 'param_1[7], zero-fills 0x100 bytes, sets 0x40/4/0',
         source='pass1/08019c90.txt'),
    dict(name='0801273c', kind='function',
         finding='wraps 080124f8 with a stack pair and stores the result',
         source='pass1/0801273c.txt'),
    dict(name='08012754', kind='function',
         finding='formats a log line through 08020fbc / 08020f7c using '
                 'DAT_20000264 and the 0x0802426c format string',
         source='pass1/08012754.txt'),
    dict(name='08012ad8', kind='function',
         finding='reads hwrev 0x20001cfc and calls 080110f6 when it is not '
                 '0xa32; also consumes the 0x08025f28 tail array',
         source='pass3/08012b5e.txt + 08012b40_08012d10.txt'),
    dict(name='080124f8', kind='function',
         finding='indexes the 0x08025ec0 mask table with a bounded value',
         source='pass3/08012538.txt'),
    dict(name='0800fd94', kind='function',
         finding='clamps (value & 0x1f) - 0x18 to <= 3 and indexes the '
                 '0x08025ec0 [1,2,4,8] mask table',
         source='pass3/0800fdaa.txt'),
    dict(name='08011100', kind='function',
         finding='post-init callback: hwrev == 0xa35 and devicesn/sku gate '
                 'selects 08025ef8 or 08025ef0 into config +0x1a4',
         source='pass3/08011100.txt'),
]

LITERAL_CORRECTIONS = [
    dict(address='0800fbcc', pointer=0x08025ed0, reader='0800fbc0',
         meaning='peripheral address table A pointer'),
    dict(address='0800fdc0', pointer=0x08025ec0, reader='0800fdaa',
         meaning='[1,2,4,8] mask table pointer'),
    dict(address='080125a4', pointer=0x08025ec0, reader='08012538',
         meaning='[1,2,4,8] mask table pointer'),
    dict(address='08012cf0', pointer=0x08025f28, reader='08012b5e',
         meaning='8-byte tail index array pointer'),
    dict(address='0800fc00', pointer=None, reader='0800fbf4',
         meaning='literal-pool slot, not a callable consumer'),
]


def rd(data, va, n):
    return data[va - BASE:va - BASE + n]


def u32(data, va):
    return struct.unpack_from('<I', data, va - BASE)[0]


def u16(data, va):
    return struct.unpack_from('<H', data, va - BASE)[0]


def load_image():
    data = BBIN.read_bytes()
    assert len(data) == 132896
    assert hashlib.sha256(data).hexdigest() == SHA256
    return data


def insn_rows(path):
    rows = []
    for line in path.read_text(errors='replace').splitlines():
        m = re.match(r'INSN ([0-9a-f]{8}) ([0-9a-f]+) (.*)', line)
        if m:
            rows.append((int(m[1], 16), m[3].split(' REF[', 1)[0].strip()))
    return rows


def brr(clock, divisor, baud, over8):
    """The two BRR paths of 0800e8b4, computed with integer (unsigned) division."""
    q = clock // divisor
    if not over8:                       # 16x oversampling, path A
        n = (q + (baud >> 1)) // baud
        return n, (0x10 <= n <= 0xffff)
    n = (2 * q + (baud >> 1)) // baud  # 8x oversampling, path B
    enc = (n & 0xfff0) | ((n & 0xf) >> 1)
    return enc, (0x10 <= n <= 0xffff)


def main():
    data = load_image()
    rows = insn_rows(E8B4)
    by_addr = dict(rows)
    checks, failures = [], []

    def eq(name, got, want):
        checks.append(dict(name=name, got=str(got), expected=str(want),
                           status='PASS' if got == want else 'FAIL'))
        if got != want:
            failures.append(dict(name=name, got=got, expected=want))

    # ---- exact in-image tables -----------------------------------------------
    apb = [u32(data, APB_VA + i * 4) for i in range(8)]
    ahb = [u32(data, AHB_VA + i * 4) for i in range(16)]
    div = [u16(data, DIV_VA + i * 2) for i in range(16)]
    eq('apb_prescaler_table', apb, [0, 0, 0, 0, 1, 2, 3, 4])
    eq('ahb_prescaler_table', ahb,
       [0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 3, 4, 6, 7, 8, 9])
    eq('usart_divisor_table', div,
       [1, 2, 4, 6, 8, 10, 12, 16, 32, 64, 128, 256,
        0x408, 0x402, 0x108, 0x101])
    eq('first_12_divisors_are_monotonic',
       all(div[i] < div[i + 1] for i in range(11)), True)
    eq('last_4_divisors_are_all_above_256',
       all(v > 256 for v in div[12:]), True)
    packed = [dict(value=v, high=v >> 8, low=v & 0xff,
                   split=f'0x{v >> 8:x}00|0x{v & 0xff:x}') for v in div[12:]]
    eq('last_4_high_nibbles', [p['high'] for p in packed], [4, 4, 1, 1])
    eq('last_4_low_bytes', [p['low'] for p in packed], [8, 2, 8, 1])

    # ---- 0800e8b4 instruction anchors ----------------------------------------
    for addr, want in KEY_ANCHORS:
        eq(f'anchor_{addr:08x}', by_addr.get(addr, '').startswith(want), True)
    eq('bl_08008174_count',
        sum(1 for _, a in rows if a.startswith('bl 0x08008174')), 4)
    eq('bl_0800cf10_count',
        sum(1 for _, a in rows if a == 'bl 0x0800cf10'), 2)
    eq('bl_0800cd24_count',
        sum(1 for _, a in rows if a == 'bl 0x0800cd24'), 2)
    eq('rcc_0x54_read_count',
        sum(1 for _, a in rows if a.startswith('ldr r3,[r3,#0x54]')), 3)
    over8_sites = [f'0x{ad:08x}' for ad, a in rows
                   if a == 'lsls r3,r3,#0x8']
    eq('over8_0x8000_construction_count', len(over8_sites), 4)
    eq('four_clock_source_branches_each_test_OVER8', over8_sites,
       ['0x0800e916', '0x0800e95a', '0x0800e966', '0x0800e9b4'])
    eq('hsi16_literal_value', u32(data, 0x0800ea44), 16000000)
    eq('brr_upper_bound_literal', u32(data, 0x0800ea4c), 0xffef)
    eq('rcc_base_literal', u32(data, 0x0800ea38), 0x40021000)
    eq('divisor_table_literal', u32(data, 0x0800ea48), DIV_VA)

    # ---- 0800cf10 PCLK model --------------------------------------------------
    pclk = {}
    for sysclk_name, sysclk in [('computed_64MHz', 64_000_000),
                                ('HSI_16MHz', 16_000_000),
                                ('LSE_32768', 32768)]:
        pclk[sysclk_name] = [
            dict(index=i, shift=apb[i], pclk=sysclk >> apb[i])
            for i in range(8)]
    eq('pclk_shift_0_is_sysclk', pclk['computed_64MHz'][0]['pclk'], 64_000_000)
    eq('pclk_shift_4_is_sysclk_div16',
       pclk['computed_64MHz'][7]['pclk'], 4_000_000)
    eq('pclk_index_0_to_3_all_no_division',
       [pclk['computed_64MHz'][i]['shift'] for i in range(4)], [0, 0, 0, 0])

    # ---- BRR parameterisation -------------------------------------------------
    eq('brr_64MHz_115200_div1_pathA', brr(64_000_000, 1, 115200, False)[0],
       0x22c)
    eq('brr_64MHz_115200_div1_pathB', brr(64_000_000, 1, 115200, True)[0],
       0x453)
    eq('brr_16MHz_115200_div1_pathA', brr(16_000_000, 1, 115200, False)[0],
       0x8b)
    eq('brr_64_vs_16_ratio_4x',
       brr(64_000_000, 1, 115200, False)[0] //
       brr(16_000_000, 1, 115200, False)[0], 4)   # 0x22c // 0x8b == 4
    eq('brr_pathB_bit3_clear',
       all((brr(c, d, b, True)[0] & 8) == 0
           for c in (16_000_000, 64_000_000) for d in div
           for b in (9600, 115200, 921600)), True)

    # Last four divisors: a parameterised legality scan.
    bauds = [1200, 2400, 4800, 9600, 19200, 38400, 57600, 115200,
             230400, 460800, 921600]
    scan = []
    for d in div[12:]:
        for clock in (16_000_000, 64_000_000):
            legal = [b for b in bauds if brr(clock, d, b, False)[1]]
            scan.append(dict(divisor=d, clock=clock,
                             legal_bauds=legal, legal_count=len(legal)))
    eq('last4_115200_never_legal_at_16_or_64MHz',
       all(not brr(c, d, 115200, False)[1]
           for c in (16_000_000, 64_000_000) for d in div[12:]), True)
    eq('last4_9600_legal_for_at_least_one_pair',
       any(9600 in s['legal_bauds'] for s in scan), True)
    eq('last4_are_not_standard_baud_divisors',
       all(d not in (1, 2, 4, 6, 8, 10, 12, 16, 32, 64, 128, 256)
           for d in div[12:]), True)

    # ---- literal-pool corrections --------------------------------------------
    for c in LITERAL_CORRECTIONS:
        va = int(c['address'], 16)
        if c['pointer'] is not None:
            eq(f'literal_{c["address"]}', u32(data, va), c['pointer'])
        f = TOOL / 'pass1' / f'{c["address"]}.txt'
        eq(f'no_function_body_{c["address"]}',
            'function=none' in f.read_text() if f.exists() else False, True)

    out = dict(
        schema='eightsleep.nonusb.consumer-models.v1',
        date=DATE,
        status='PASS' if not failures else 'FAIL',
        method='instruction-anchored modelling from pass1/pass3 read-only '
               'exports plus exact in-image table bytes',
        bbin_sha256=SHA256,
        apb_clock=dict(
            function='0800cf10',
            formula='PCLK = DAT_20000250 >> APB_TABLE[((reg@0x40021008 '
                    '>> 12) & 7)]',
            table_address=f'0x{APB_VA:08x}', table=apb,
            call_sites=['0x0800e91e', '0x0800ea14'],
            parameterised_results=pclk,
            note='DAT_20000250 is the software SYSCLK field written by '
                 '0800cdb4; 64MHz is the conditional computed value from '
                 'the previous round, not a measurement.'),
        ahb_prescaler=dict(address=f'0x{AHB_VA:08x}', table=ahb),
        usart_clock_source_matrix=dict(
            register='0x40021054 (selected by three ldr r3,[r3,#0x54] rows)',
            over8_flag='param_1[7] == 0x8000 built by movs r3,#0x80 / '
                       'lsls r3,r3,#0x8 / cmp r0,r3',
            over8_meaning='OVER8 selects BRR path B (8x oversampling); '
                          'otherwise path A (16x)',
            groups=CLOCK_MATRIX,
            sources=dict(PCLK='0800cf10()', SYSCLK='0800cd24()',
                         HSI16='literal 0xf42400 = 16000000',
                         LSE32768='movs r0,r3 where r3 = 0x8000 = 32768'),
            note='0800e8b4 param_1 is a USART configuration descriptor built '
                 'by 0800ec64, NOT the hwrev config object of 0801d888.'),
        usart_brr=dict(
            path_A='BRR = (clock // divisor + (baud >> 1)) // baud',
            path_B='N = (2 * (clock // divisor) + (baud >> 1)) // baud; '
                   'BRR = (N & 0xfff0) | ((N & 0xf) >> 1)',
            range_check='0x10 <= N <= 0xffff, else 0800e8b4 returns 1',
            range_literal=f'0x{u32(data, 0x0800ea4c):x} = 0xffef',
            divisor_index='param_1[9], also written into a 4-bit register field'),
        divisor_table=dict(address=f'0x{DIV_VA:08x}', values=div,
                           last_four_split=packed,
                           legal_baud_scan=scan,
                           conclusion='The last four entries are passed WHOLE '
                                      'to the 08008174 division helper (ldrh '
                                      'then bl); no instruction splits the '
                                      'high bits off. "Packed" describes the '
                                      'byte pattern only, not a proven field '
                                      'layout. At 16/64 MHz and 115200 baud '
                                      'none of them yields a legal BRR.'),
        consumers=CONSUMERS,
        literal_pool_corrections=LITERAL_CORRECTIONS,
        totals=dict(assertions=len(checks), failures=len(failures),
                    consumers=len(CONSUMERS),
                    literal_corrections=len(LITERAL_CORRECTIONS),
                    instruction_anchors=len(KEY_ANCHORS),
                    brr_scan_cases=len(scan)),
        checks=checks,
        failures=failures,
        limits=[
            'Clock values, baud rates and the divisor index are explicit '
            'parameters; no runtime RCC state, baud setting or hardware '
            'measurement is available in the frozen image.',
            'Peripheral register names are deliberately NOT asserted: without '
            'a datasheet or schematic the 0x4000xxxx addresses stay unnamed.',
            'The four (plus one) literal-pool addresses are data slots, not '
            'callable functions; the earlier candidate list mis-classified them.',
        ],
        executes_firmware=False,
    )
    (TOOL / 'CONSUMER_MODELS.json').write_text(
        json.dumps(out, ensure_ascii=False, indent=1, sort_keys=True) + '\n')
    print(json.dumps(dict(status=out['status'], totals=out['totals'],
                          first_failures=failures[:10]), indent=1))
    return 0 if not failures else 1


if __name__ == '__main__':
    raise SystemExit(main())
