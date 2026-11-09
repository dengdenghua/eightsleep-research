"""Read vtable and RTTI directly from the original PIE ELF, preserving relocations."""
import hashlib
import json
from validate_bytes import Elf, OUT, SOURCE, RESEARCH, BASE

e = Elf()


def pointer(at):
    raw = e.read(at,8)
    relocation = e.relocs.get(at)
    assert relocation and relocation['type'] == 1027 and relocation['symbol'] == 0
    return dict(address=f'{at:08x}', file_offset=e.offset(at,8), original_hex=raw.hex(),
                original_unsigned_value=f'{int.from_bytes(raw,"little"):x}',
                relocation=relocation,
                relocated_target=f'{relocation["addend"]+BASE:08x}')


slots = []
for offset in range(0,0x80,8):
    record = pointer(0x5c79f8+offset)
    record['vtable_offset'] = f'0x{offset:x}'
    slots.append(record)
name_pointer = pointer(0x5c79d8)
name_address = int(name_pointer['relocated_target'],16)
name = bytearray()
while e.read(name_address+len(name),1) != b'\0':
    name += e.read(name_address+len(name),1)
assert name == b'9UsbSensor'
result = dict(source=str(SOURCE.relative_to(RESEARCH)),source_sha256=hashlib.sha256(e.blob).hexdigest(),
              method='ELF bytes + AArch64 RELATIVE relocation addend + Ghidra image base, not runtime addresses',
              vtable_address='005c79f8', constructor_evidence='pass6/0019e7f0.txt:0019e8f8..0019e8fc',
              rtti_pointer=pointer(0x5c79f0),rtti_name_pointer=name_pointer,
              rtti_name=dict(address=f'{name_address:08x}',file_offset=e.offset(name_address,len(name)+1),
                             original_hex=(name+b'\0').hex(),ascii=name.decode()),slots=slots)
(OUT/'RAW_TABLES.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(dict(vtable_slots=len(slots),rtti_name=name.decode())))
