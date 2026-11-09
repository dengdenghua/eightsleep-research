"""Compare exported AArch64 instructions against the unmodified ELF.

The ELF is PIE. Ghidra image base 0x100000 is subtracted before PT_LOAD
mapping. Data references with ELF RELATIVE relocations are compared against
the relocated value, with both original bytes and relocation recorded.
"""
import hashlib
import json
import re
import struct
from pathlib import Path

OUT = Path(__file__).resolve().parent.parent
RESEARCH = OUT.parents[2]
SOURCE = RESEARCH/'mediatek/rootfs-selected/opt/eight/bin/frankenfirmware'
BASE = 0x100000


class Elf:
    def __init__(self):
        self.blob = SOURCE.read_bytes()
        h = struct.unpack_from('<16sHHIQQQIHHHHHH', self.blob)
        assert self.blob[:6] == b'\x7fELF\x02\x01' and h[2] == 183
        self.segments = [struct.unpack_from('<IIQQQQQQ', self.blob, h[5]+i*h[9])
                         for i in range(h[10])]
        self.loads = [s for s in self.segments if s[0] == 1]
        self.relocs = {}
        self.sections = [struct.unpack_from('<IIQQQQIIQQ', self.blob, h[6]+i*h[11])
                         for i in range(h[12])]
        for s in self.sections:
            if s[1] == 4:
                for off in range(s[4], s[4]+s[5], s[9]):
                    at, info, addend = struct.unpack_from('<QQq', self.blob, off)
                    self.relocs[at+BASE] = dict(type=info & 0xffffffff, symbol=info >> 32,
                                              addend=addend, file_offset=off)

    def offset(self, addr, count):
        va = addr - BASE
        for s in self.loads:
            if s[3] <= va and va+count <= s[3]+s[5]:
                return s[2]+va-s[3]
        raise ValueError(f'Not file backed: {addr:x}+{count}')

    def read(self, addr, count):
        off = self.offset(addr, count)
        return self.blob[off:off+count]


def signed(value, bits):
    return value-(1 << bits) if value & (1 << (bits-1)) else value


def branch_target(addr, data):
    word = int.from_bytes(data, 'little')
    if word & 0x7c000000 == 0x14000000:  # B/BL
        return addr + 4*signed(word & 0x3ffffff, 26)
    if word & 0xff000010 == 0x54000000:  # B.cond
        return addr + 4*signed((word >> 5) & 0x7ffff, 19)
    if word & 0x7e000000 == 0x34000000:  # CBZ/CBNZ
        return addr + 4*signed((word >> 5) & 0x7ffff, 19)
    if word & 0x7e000000 == 0x36000000:  # TBZ/TBNZ
        return addr + 4*signed((word >> 5) & 0x3fff, 14)
    return None


def main():
    elf = Elf()
    instructions, branches, literals, skipped = [], [], [], []
    failures = []
    for path in sorted(OUT.glob('pass*/*.txt')):
        for line in path.read_text().splitlines():
            match = re.match(r'INSN ([0-9a-f]+) ([0-9a-f]+) (.*)', line)
            if not match:
                continue
            addr = int(match[1], 16); actual = bytes.fromhex(match[2])
            raw = elf.read(addr, len(actual))
            item = dict(export=str(path.relative_to(OUT)), address=f'{addr:08x}',
                        file_offset=elf.offset(addr, len(actual)), hex=raw.hex(), matches=raw==actual)
            instructions.append(item)
            if raw != actual:
                failures.append(item)
            target = branch_target(addr, raw)
            refs = re.findall(r'REF\[(?:UNCONDITIONAL_CALL|UNCONDITIONAL_JUMP|CONDITIONAL_JUMP):([0-9a-f]+)\]', line)
            if target is not None:
                item = dict(address=f'{addr:08x}', decoded_target=f'{target:08x}',
                            export_targets=refs, matches=f'{target:08x}' in refs)
                branches.append(item)
                if not item['matches']:
                    failures.append(item)
            for at_text, val_text in re.findall(r'REF\[[A-Z_]+:([0-9a-f]+)=([0-9a-f]+)\]', line):
                at = int(at_text, 16); value = int(val_text, 16)
                item = dict(instruction=f'{addr:08x}', address=at_text, exported_low32=val_text)
                try:
                    raw_data = elf.read(at, 4)
                except ValueError:
                    skipped.append(dict(**item, reason='Ghidra external/uninitialized address; no original file bytes'))
                    continue
                item.update(file_offset=elf.offset(at,4), original_hex=raw_data.hex())
                relocation = elf.relocs.get(at)
                if relocation:
                    item['relocation'] = relocation
                    if relocation['type'] != 1027:
                        skipped.append(dict(**item, reason='Dynamic symbol relocation; synthetic Ghidra external mapping not an original pointer'))
                        continue
                    expected = (relocation['addend']+BASE) & 0xffffffff
                else:
                    expected = int.from_bytes(raw_data, 'little')
                item.update(expected_low32=f'{expected:x}', matches=expected==value)
                literals.append(item)
                if expected != value:
                    failures.append(item)
    result = dict(source=str(SOURCE.relative_to(RESEARCH)),
                  source_sha256=hashlib.sha256(elf.blob).hexdigest(), source_size=len(elf.blob),
                  ghidra_base=hex(BASE),
                  mapping='ELF VA = Ghidra address - 0x100000; PT_LOAD file offset + VA - segment VA',
                  load_segments=[dict(offset=hex(s[2]),vaddr=hex(s[3]),filesz=hex(s[5]),memsz=hex(s[6])) for s in elf.loads],
                  instruction_occurrences=len(instructions),
                  unique_instruction_addresses=len({x['address'] for x in instructions}),
                  unique_instruction_bytes=len({x['address'] for x in instructions})*4,
                  branch_occurrences=len(branches), literal_occurrences=len(literals),
                  explicit_skipped_reference_count=len(skipped), failures=failures,
                  all_compared_passed=not failures, instructions=instructions,
                  branches=branches,literals=literals,skipped_references=skipped)
    (OUT/'BYTE_VALIDATION.json').write_text(json.dumps(result,ensure_ascii=False,indent=2)+'\n')
    print(json.dumps({k:result[k] for k in ['instruction_occurrences','unique_instruction_addresses','unique_instruction_bytes','branch_occurrences','literal_occurrences','explicit_skipped_reference_count','all_compared_passed']}))
    if failures:
        print(json.dumps(failures[:5],ensure_ascii=False)); raise SystemExit(1)


if __name__ == '__main__':
    main()
