#!/usr/bin/env python3
"""Read back all retained instruction bytes and selected ROM data from the original app."""
from pathlib import Path
import hashlib, json, re, struct, zipfile

ROOT = Path('/Users/dangbei/Downloads/eightsleep-firmware-research-20261107')
OUT = Path(__file__).resolve().parents[1]
APP = ROOT/'analysis/finishable-20261107/accessories-c11/extracted/OTA_KS8S08C010000001_V10211_nRF52832_202602070917/nrf52832_xxaa.bin'
ZIP = ROOT/'mediatek/rootfs-selected/opt/eight/firmware/Keeson/OTA_KS8S08C010000001_V10211_nRF52832_202602070917.zip'
BASE = 0x26000
EXPECTED_SHA = '1856c1baec5f9bca7151e5b550fdf0a8d749e87f889d963a3a343293a4160966'

def sha(data):
    return hashlib.sha256(data).hexdigest()

def record(path):
    data = path.read_bytes()
    return {'path': str(path.relative_to(ROOT)), 'bytes': len(data), 'sha256': sha(data)}

def write(name, data):
    (OUT/name).write_text(json.dumps(data, ensure_ascii=False, indent=2)+'\n')

def main():
    binary = APP.read_bytes()
    assert len(binary) == 73656 and sha(binary) == EXPECTED_SHA
    with zipfile.ZipFile(ZIP) as archive:
        members = [name for name in archive.namelist() if name.endswith('nrf52832_xxaa.bin')]
        assert len(members) == 1 and archive.read(members[0]) == binary
    regions, unique, pools = [], {}, {}
    for path in sorted((OUT/'export').glob('*.asm.tsv')):
        rows = []
        for number, line in enumerate(path.read_text().splitlines(), 1):
            address, encoded, instruction = line.split('\t', 2)
            va, raw = int(address, 16), bytes.fromhex(encoded)
            offset = va-BASE
            assert 0 <= offset <= len(binary)-len(raw)
            assert binary[offset:offset+len(raw)] == raw, (path.name, number)
            if va in unique:
                assert unique[va] == raw
            unique[va] = raw
            rows.append({'line':number,'va':address,'source_offset':offset,'bytes':encoded,'instruction':instruction})
            match = re.search(r'^ldr(?:\.\w+)?\s+[^,]+,\[(0x[0-9a-f]+)\]', instruction)
            if match:
                literal = int(match.group(1),16)
                if BASE <= literal <= BASE+len(binary)-4:
                    data = binary[literal-BASE:literal-BASE+4]
                    pools[hex(literal)] = {'source_offset':literal-BASE,'bytes':data.hex(),'u32le':struct.unpack('<I',data)[0]}
        regions.append({'entry':path.name.split('.')[0],'listing':str(path.relative_to(OUT)),'instructions':rows})
    data_regions = []
    for va, size, label in [
        (0x26000,8,'SP and reset vector'),(0x26084,4,'vector index 33 / IRQ17'),
        (0x26090,4,'vector index 36 / IRQ20'),(0x295b0,8,'channel table and callback pointers'),
        (0x36c24,4,'default sampling global config'),(0x36c28,48,'four channel config records'),
        (0x36b70,4,'timer object pointer'),(0x358bc,2,'registered sample callback: Thumb bx lr, no database function')]:
        data = binary[va-BASE:va-BASE+size]
        data_regions.append({'label':label,'va':hex(va),'source_offset':va-BASE,'bytes':data.hex(),'length':size,'sha256':sha(data)})
    assert bytes.fromhex(data_regions[4]['bytes']) == bytes([1,0,6,0])
    configs = binary[0x36c28-BASE:0x36c58-BASE]
    assert len(configs)==48
    for channel in range(4):
        assert configs[12*channel:12*(channel+1)] == bytes([0,0,0,0,2,0,0,channel+1,0,0,0,0])
    assert binary[0x358bc-BASE:0x358bc-BASE+2] == bytes.fromhex('7047')
    count = sum(len(region['instructions']) for region in regions)
    checks = {
        'requested_function_entries':40,'exported_functions':len(regions),
        'missing_database_function':['0x358bc: raw 7047 retained; no function created'],
        'instruction_records':count,'instruction_bytes':sum(len(bytes.fromhex(row['bytes'])) for region in regions for row in region['instructions']),
        'unique_instruction_addresses':len(unique),'unique_instruction_bytes':sum(map(len,unique.values())),
        'all_instruction_bytes_match':True,'mtk_zip_member_byte_equal':True,
        'literal_pool_words':len(pools),'selected_rom_regions':len(data_regions),
        'application_region':[hex(BASE),hex(BASE+len(binary))],
        'mapping_note':'VA minus 0x26000, independent of Ghidra imageBase metadata zero. Shared/noncontiguous function bodies retained.',
        'target_executed':False,'database_analysis_rerun':False
    }
    write('RAW_EVIDENCE.json',{'input':record(APP),'mtk_zip':record(ZIP),'member':members[0],'mapping_base':BASE,'functions':regions,'selected_rom':data_regions,'literal_pools':pools})
    write('VALIDATION.json',checks)
    write('SOURCE_MANIFEST.json',{
        'inputs':[record(APP),record(ZIP),record(ROOT/'analysis/system-deepening-20261108/keeson-execution/FINDINGS_ZH.txt')],
        'exports':[record(path) for path in sorted((OUT/'export').iterdir()) if path.is_file()],
        'scripts':[record(path) for path in sorted((OUT/'scripts').iterdir()) if path.is_file()],
        'limitations':['Static application only; no full flash/SoftDevice/bootloader image.','No hardware sensor calibration or measured timing.','Decompiled types/arguments require assembly verification.']})
    print(json.dumps(checks,ensure_ascii=False))

if __name__ == '__main__':
    main()
