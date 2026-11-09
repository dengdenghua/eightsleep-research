#!/usr/bin/env python3
"""Bounded offline B13 FOT header/CRC audit. Does not execute firmware or use I/O devices."""
from pathlib import Path
import hashlib,json,struct,zlib

ROOT=Path('/Users/dangbei/Downloads/eightsleep-firmware-research-20261107')
OUT=Path(__file__).resolve().parent
BASE=ROOT/'analysis/sleep-pipeline'
FOT=ROOT/'mediatek/rootfs-selected/opt/eight/firmware/Speaker/B13'
def sha(b):return hashlib.sha256(b).hexdigest()
def u32(b,o):return struct.unpack_from('<I',b,o)[0]
def source_crc32(data):
    crc=0xffffffff
    for b in data:
        crc ^= b
        for _ in range(8):crc=(crc>>1)^ (0xedb88320 if crc&1 else 0)
    return (~crc)&0xffffffff
def file_record(path):
    b=path.read_bytes();return {'path':str(path.relative_to(ROOT)),'bytes':len(b),'sha256':sha(b)}
def main():
    OUT.mkdir(parents=True,exist_ok=True);(OUT/'headers').mkdir(exist_ok=True)
    samples=[]
    assert source_crc32(b'123456789')==zlib.crc32(b'123456789')==0xcbf43926
    for name in ['B13_SOFT_20260803_V37.fot','B13_SOFT_20260804_V38.fot','B13_SOFT_20260922_V42.fot']:
        f=FOT/name;b=f.read_bytes();records=[];offset=8
        for expected in [b'INFO',b'DEV\0',b'DATA']:
            tag=b[offset:offset+4];label=bytes(x&0x7f for x in tag);length=u32(b,offset+4)
            assert label==expected
            records.append({'offset':offset,'tag_hex':tag.hex(),'tag_low_7bits':label.decode('ascii').replace('\0','\\0'),'length':length,'body_start':offset+8,'end_exclusive':offset+8+length})
            offset+=8+length
        words=list(struct.unpack_from('<6I',b,0x5c))
        crc=source_crc32(b);assert crc==zlib.crc32(b)
        regions={'whole_file':(0,len(b)),'after_outer8':(8,len(b)),'after_512':(0x200,len(b)),'candidate_main_from_descriptor':(words[0],words[2])}
        candidates=[]
        for label,(a,e) in regions.items():
            checksum=zlib.crc32(b[a:e]);le=struct.pack('<I',checksum);be=struct.pack('>I',checksum)
            candidates.append({'name':label,'start':a,'end_exclusive':e,'crc32_hex':f'{checksum:08x}','header512_crc32_little_endian_occurrences':[i for i in range(509) if b[i:i+4]==le],'header512_crc32_big_endian_occurrences':[i for i in range(509) if b[i:i+4]==be]})
        hp=OUT/'headers'/(f.stem+'.header512.bin');hp.write_bytes(b[:512])
        text='\n'.join(f'{i:04x}  '+b[i:i+16].hex(' ') for i in range(0,512,16))+'\n'
        (OUT/'headers'/(f.stem+'.header512.txt')).write_text(text)
        windows=[]
        for o in sorted(set([0,0x74,0x200,*words[:4]])):
            if 0<=o<len(b):windows.append({'offset':o,'first32_hex':b[o:o+32].hex(),'first32_ascii':''.join(chr(x) if 32<=x<127 else '.' for x in b[o:o+32])})
        relations={'magic_FOT_zero':b[:4]==b'FOT\0','outer_size_equals_file_minus8':u32(b,4)==len(b)-8,'record_walk_ends_0x74':offset==0x74,'first_data_word_0x200':words[0]==0x200,'word2_equals_word0_plus_word1':words[2]==words[0]+words[1],'word3_equals_word2_plus0x200':words[3]==words[2]+0x200,'last_two_words_0x100':words[4:]==[0x100,0x100],'all_four_candidate_offsets_within_file':all(x<len(b) for x in words[:4]),'repeated_header512_at_word2':b[:512]==b[words[2]:words[2]+512],'tail_size_0x1000':len(b)-words[3]==0x1000,'body_starts_highbit_XCOD':bytes(x&0x7f for x in b[words[0]:words[0]+4])==b'XCOD'}
        assert all(relations.values())
        partition=[]
        for label,a,e in [('header',0,words[0]),('candidate_body',words[0],words[2]),('repeated_header',words[2],words[3]),('tail',words[3],len(b))]:
            partition.append({'name':label,'start':a,'end_exclusive':e,'length':e-a,'sha256':sha(b[a:e])})
        samples.append({**file_record(f),'outer_size_u32le_at4':u32(b,4),'records':records,'data_words_u32le_at_0x5c':words,'relations':relations,'observed_partition':partition,'updater_whole_file_crc32':f'{crc:08x}','crc32_independent_match':True,'header_snapshot':str(hp.relative_to(OUT)),'header_snapshot_sha256':sha(b[:512]),'candidate_checksum_checks':candidates,'candidate_windows':windows})
    refs=[('A01','Eight.Audio/Eight.Audio.StateMachine/SpeakerUpdater.cs'),('A02','Eight.Speaker/Eight.Speaker/MinamiSpeaker.cs'),('A03','Eight.Speaker/Eight.Speaker/BluetrumFotaUpdater.cs'),('A04','Eight.Speaker/Eight.Speaker/Rfcomm.cs')]
    sources=[];contexts=[]
    for sid,rel in refs:
        src=BASE/'decompiled'/rel;b=src.read_bytes();dest=OUT/'source'/rel;dest.parent.mkdir(parents=True,exist_ok=True);dest.write_bytes(b)
        sources.append({'id':sid,**file_record(src),'snapshot':str(dest.relative_to(OUT))})
        contexts.extend([f'=== {sid} {src.relative_to(ROOT)} ===',f'SHA256 {sha(b)}',*[f'{i:04d}: {line}' for i,line in enumerate(b.decode().splitlines(),1)]])
    cfg=ROOT/'mediatek/rootfs-selected/opt/eight/config/default.json';config=json.loads(cfg.read_text())
    old=json.loads((ROOT/'analysis/finishable-20261107/accessories-c11/SAMPLE_INVENTORY.json').read_text())
    inv=json.loads((BASE/'bundle-inventory.json').read_text());native=Path(inv['source']).read_bytes()
    assert sha(native)==inv['sha256']
    bindings=[]
    for name in ['Eight.Audio.dll','Eight.Speaker.dll']:
        entry=next(e for e in inv['entries'] if e['name']==name);blob=native[entry['offset']:entry['offset']+(entry['compressed_size'] or entry['size'])]
        if entry['compressed_size']:blob=zlib.decompress(blob,-15)
        actual=(BASE/'capybara-bundle'/name).read_bytes();assert blob==actual and sha(actual)==entry['sha256']
        bindings.append({'entry':entry,'matched_native_member_bytes':True,**file_record(BASE/'capybara-bundle'/name)})
    report={'scope':'MTK B13 FOT files and their host updater; not NXP config, not device loader','samples':samples,'configuration':{**file_record(cfg),'speakerFota':config['speakerFota']},'old_C11_config_identity':{'path':old['config_path'],'sha256':old['config_sha256'],'classification':'historical selected-rootfs/NXP context; do not substitute for MTK'},'native_bundle':{**file_record(Path(inv['source'])),'inventory':file_record(BASE/'bundle-inventory.json'),'members':bindings},'source_files':sources,'limitations':['Tag record interpretation is inferred from repeated byte layout, not a recovered FOT parser.','DATA word meanings/target addresses/checksum/key/encryption/compression/ISA remain unproven.','No MCU code executed, flashed or disassembled in this pass.','The CRC search is explicitly four candidate ranges vs first512 header bytes; no claim that internal checksums do not exist.'],'validation':{'files':3,'header_relation_assertions':sum(len(x['relations']) for x in samples),'crc32_source_algorithm_vs_zlib':3,'known_crc_test_vector_passed':True,'native_members_bound':2,'read_only_offline':True}}
    (OUT/'FOT_FORMAT_AUDIT.json').write_text(json.dumps(report,ensure_ascii=False,indent=2)+'\n')
    (OUT/'SOURCE_CONTEXTS.txt').write_text('\n'.join(contexts)+'\n')
    print(json.dumps(report['validation'],ensure_ascii=False))
if __name__=='__main__':main()
