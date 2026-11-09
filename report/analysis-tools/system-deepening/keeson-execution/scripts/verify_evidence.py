#!/usr/bin/env python3
"""Verify retained Ghidra instruction bytes against the same original MTK ZIP member."""
from pathlib import Path
import hashlib,json,struct,zipfile
ROOT=Path('/Users/dangbei/Downloads/eightsleep-firmware-research-20261107')
OUT=Path(__file__).resolve().parents[1]
APP=ROOT/'analysis/finishable-20261107/accessories-c11/extracted/OTA_KS8S08C010000001_V10211_nRF52832_202602070917/nrf52832_xxaa.bin'
ZIP=ROOT/'mediatek/rootfs-selected/opt/eight/firmware/Keeson/OTA_KS8S08C010000001_V10211_nRF52832_202602070917.zip'
BASE=0x26000
def sha(b):return hashlib.sha256(b).hexdigest()
def rec(p):
    b=p.read_bytes();return {'path':str(p.relative_to(ROOT)),'bytes':len(b),'sha256':sha(b)}
def main():
    b=APP.read_bytes();assert len(b)==73656 and sha(b)=='1856c1baec5f9bca7151e5b550fdf0a8d749e87f889d963a3a343293a4160966'
    with zipfile.ZipFile(ZIP) as z:
        members=[x for x in z.namelist() if x.endswith('nrf52832_xxaa.bin')];assert len(members)==1
        assert z.read(members[0])==b
    regions=[];unique={};total=0
    for f in sorted((OUT/'export').glob('*.asm.tsv')):
        rows=[]
        for line in f.read_text().splitlines():
            addr,h,asm=line.split('\t',2);a=int(addr,16);raw=bytes.fromhex(h)
            assert 0<=a-BASE and a-BASE+len(raw)<=len(b)
            assert b[a-BASE:a-BASE+len(raw)]==raw,(f.name,addr)
            if a in unique:assert unique[a]==h
            unique[a]=h;total+=len(raw)
            rows.append({'va':addr,'source_offset':a-BASE,'bytes':h,'instruction':asm})
        regions.append({'entry':f.stem.split('.')[0],'listing':str(f.relative_to(OUT)),'instructions':rows})
    constants=[]
    for a,label in [(0x307a0,'filter q additive'),(0x307a4,'filter denominator additive'),(0x290e0,'second-stage new weight'),(0x290e8,'second-stage previous weight'),(0x2849c,'guard first scale'),(0x284a0,'guard divisor')]:
        raw=b[a-BASE:a-BASE+4];constants.append({'va':hex(a),'offset':a-BASE,'bytes':raw.hex(),'float32_le':struct.unpack('<f',raw)[0],'role':label})
    checks={'selected_functions':len(regions),'instruction_records':sum(len(x['instructions']) for x in regions),'instruction_bytes':total,'unique_instruction_addresses':len(unique),'all_instruction_bytes_match':True,'zip_member_byte_equal':True,'literal_values':constants,'application_region':[hex(BASE),hex(BASE+len(b))],'database_image_base_note':'Ghidra imageBase metadata is zero; selected application byte mapping is VA-0x26000. Noncontiguous shared tail at0x275c0 is retained.'}
    (OUT/'RAW_EVIDENCE.json').write_text(json.dumps({'input':rec(APP),'mtk_zip':rec(ZIP),'zip_member':members[0],'mapping_base':BASE,'regions':regions,'validation':checks},ensure_ascii=False,indent=2)+'\n')
    (OUT/'VALIDATION.json').write_text(json.dumps(checks,ensure_ascii=False,indent=2)+'\n')
    files=[rec(APP),rec(ZIP),rec(ROOT/'analysis/finishable-20261107/accessories/keeson-mcu/FINDINGS_ZH.txt')]
    exported=[rec(f) for f in sorted((OUT/'export').iterdir()) if f.is_file()]
    (OUT/'SOURCE_MANIFEST.json').write_text(json.dumps({'scope':'Keeson10211 global protection B producer/sample preprocessing/clear chain; existing read-only Ghidra DB','inputs':files,'exports':exported,'limitations':['Application image only; SoftDevice and bootloader absent.','No live attachment or physical calibration evidence.','Decompiled data types/calling convention may be inaccurate; key FP return and memory stores checked against assembly.']},ensure_ascii=False,indent=2)+'\n')
    print(json.dumps({k:v for k,v in checks.items() if k!='literal_values'},ensure_ascii=False))
    print('float32 constants',[(x['role'],x['float32_le']) for x in constants])
if __name__=='__main__':main()
