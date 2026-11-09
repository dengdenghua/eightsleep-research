#!/usr/bin/env python3
"""Verify read-only Ghidra exports and statically decode the startup data stream.
No firmware, peripheral, account, or network execution.
"""
from pathlib import Path
import hashlib,json,re,struct,subprocess,zipfile
ROOT=Path('/Users/dangbei/Downloads/eightsleep-firmware-research-20261107')
OUT=Path(__file__).resolve().parents[1]
APP=ROOT/'analysis/finishable-20261107/accessories-c11/extracted/OTA_KS8S08C010000001_V10211_nRF52832_202602070917/nrf52832_xxaa.bin'
ZIP=ROOT/'mediatek/rootfs-selected/opt/eight/firmware/Keeson/OTA_KS8S08C010000001_V10211_nRF52832_202602070917.zip'
BASE=0x26000
EXPECTED='1856c1baec5f9bca7151e5b550fdf0a8d749e87f889d963a3a343293a4160966'
def sha(b):return hashlib.sha256(b).hexdigest()
def rec(p):
 b=p.read_bytes();return {'path':str(p.relative_to(ROOT)),'bytes':len(b),'sha256':sha(b)}
def save(n,d):(OUT/n).write_text(json.dumps(d,ensure_ascii=False,indent=2)+'\n')
def main():
 b=APP.read_bytes();assert len(b)==73656 and sha(b)==EXPECTED
 with zipfile.ZipFile(ZIP) as z:
  member=[n for n in z.namelist() if n.endswith('nrf52832_xxaa.bin')]
  assert len(member)==1 and z.read(member[0])==b
 unique={};functions=[];pools={};all_rows=[]
 for p in sorted((OUT/'export').glob('*.asm.tsv')):
  rows=[]
  for lineno,line in enumerate(p.read_text().splitlines(),1):
   va,raw,insn=line.split('\t',2);v=int(va,16);r=bytes.fromhex(raw)
   assert 0<=v-BASE<=len(b)-len(r) and b[v-BASE:v-BASE+len(r)]==r,(p,lineno)
   if v in unique:assert unique[v]==r
   unique[v]=r
   row={'line':lineno,'va':va,'source_offset':v-BASE,'bytes':raw,'instruction':insn,'classification':'literal_data_misdecoded_by_database' if 0x26578 <= v < 0x26580 else 'instruction_listing'};rows.append(row)
   m=re.match(r'ldr(?:\.\w+)?\s+[^,]+,\[(0x[0-9a-f]+)\]',insn)
   if m:
    a=int(m.group(1),16)
    if BASE<=a<=BASE+len(b)-4:
     data=b[a-BASE:a-BASE+4];pools[hex(a)]={'source_offset':a-BASE,'bytes':data.hex(),'u32le':struct.unpack('<I',data)[0]}
  functions.append({'entry':p.stem.split('.')[0],'path':str(p.relative_to(OUT)),'instructions':rows});all_rows+=rows
 pseudo=[]
 for p in sorted((OUT/'pseudo').glob('*.txt')):
  for lineno,line in enumerate(p.read_text().splitlines(),1):
   m=re.match(r'INSN ([0-9a-f]+) ([0-9a-f]+) (.*)',line)
   if not m:continue
   va,raw,insn=m.groups();v=int(va,16);r=bytes.fromhex(raw);assert b[v-BASE:v-BASE+len(r)]==r
   unique[v]=r;pseudo.append({'path':str(p.relative_to(OUT)),'line':lineno,'va':va,'source_offset':v-BASE,'bytes':raw,'instruction':insn})
 # Scatter record fields and decompress routine are independently exported above.
 records=[struct.unpack_from('<4I',b,a-BASE) for a in [0x37b68,0x37b78]]
 assert records==[(0x37d3c,0x20002aa8,0xcc8,0x26580),(0x37fb8,0x20003770,0x4898,0x2c490)]
 src=records[0][0]-BASE;start=src;ram=bytearray();segments=[]
 while len(ram)<records[0][2]:
  spos=src;dst=len(ram);tag=b[src];src+=1;lit=tag&7
  if lit==0:lit=b[src];src+=1
  run=tag>>4
  if run==0:run=b[src];src+=1
  assert lit>0
  ram.extend(b[src:src+lit-1]);src+=lit-1
  distance=None
  if tag&8:
   distance=b[src];src+=1;assert 0<distance<=len(ram)
   for _ in range(run+2):ram.append(ram[-distance])
  else:ram.extend(bytes(run))
  segments.append({'source_va':hex(spos+BASE),'source_bytes':src-spos,'destination_va':hex(records[0][1]+dst),'decoded_bytes':len(ram)-dst,'tag':hex(tag),'literal_bytes':lit-1,'copy_distance':distance,'tail_bytes':run+2 if tag&8 else run})
 assert len(ram)==0xcc8 and src+BASE==0x37fb6
 pin_offset=0x20003539-records[0][1];assert ram[pin_offset:pin_offset+4]==bytes([21,22,23,24])
 assert ram[0x20003496-records[0][1]]==0x11
 (OUT/'decoded').mkdir(exist_ok=True)
 (OUT/'decoded/ram_20002aa8_20003770.bin').write_bytes(ram)
 (OUT/'decoded/compressed_00037d3c_00037fb6.bin').write_bytes(b[start:src])
 save('STARTUP_DATA.json',{'records':[{'record_va':hex(0x37b68+16*i),'source':hex(v[0]),'destination':hex(v[1]),'length':v[2],'handler':hex(v[3])} for i,v in enumerate(records)],'decoded':rec(OUT/'decoded/ram_20002aa8_20003770.bin'),'source':rec(OUT/'decoded/compressed_00037d3c_00037fb6.bin'),'source_offset':start,'end_source_va_exclusive':hex(src+BASE),'segments':segments,'pins':{'ram_va':'0x20003539','bytes':'15161718','logical_axis_gpio':{'0':'P0.21','1':'P0.22','2':'P0.23','3':'P0.24'}},'initial_selftest_stage':{'ram_va':'0x20003496','byte':'11'},'bss_zero_range':['0x20003770','0x20008008'],'warning':'Recovered startup initial values, not a live RAM dump; no board wiring or hardware behavior inferred.'})
 rom=[]
 for a,size,label in [(0x26000,8,'SP/reset vector'),(0x26058,4,'GPIOTE vector index22/IRQ6'),(0x37b68,32,'scatter records'),(0x2c490,14,'zero-fill handler')]:
  data=b[a-BASE:a-BASE+size];rom.append({'label':label,'va':hex(a),'source_offset':a-BASE,'bytes':data.hex(),'sha256':sha(data)})
 assert struct.unpack_from('<I',b,0x58)[0]==0x26659
 save('RAW_EVIDENCE.json',{'input':rec(APP),'mtk_zip':rec(ZIP),'zip_member':member[0],'mapping_base':BASE,'functions':functions,'transient_pseudo':pseudo,'literal_pools':pools,'rom':rom})
 expanded=ROOT/'analysis/finishable-20261107/accessories/keeson-mcu/expanded'
 pattern='DAT_20003bc8|DAT_20003bcc|DAT_20003bd0|DAT_20003539|DAT_20003fb7'
 cmd=['rg','-n',pattern,str(expanded),'-g','*.c']
 r=subprocess.run(cmd,text=True,capture_output=True);assert r.returncode in (0,1)
 (OUT/'SOURCE_SEARCH.txt').write_text('COMMAND: '+repr(cmd)+'\nSCOPE: existing decompiled C corpus; misses aliases/derived pointers, not a proof of all writers.\n'+r.stdout)
 known_data=[x for x in all_rows if x['classification']=='literal_data_misdecoded_by_database']
 validation={'functions':len(functions),'known_literal_data_listing_rows':len(known_data),'known_literal_data_listing_bytes':sum(len(bytes.fromhex(x['bytes'])) for x in known_data),'listing_records':len(all_rows),'listing_bytes':sum(len(bytes.fromhex(x['bytes'])) for x in all_rows),'instruction_records_excluding_known_data':len(all_rows)-len(known_data),'instruction_bytes_excluding_known_data':sum(len(bytes.fromhex(x['bytes'])) for x in all_rows if x['classification']=='instruction_listing'),'transient_pseudo_instructions':len(pseudo),'transient_pseudo_bytes':sum(len(bytes.fromhex(x['bytes'])) for x in pseudo),'unique_verified_listing_addresses':len(unique),'unique_verified_listing_bytes':sum(map(len,unique.values())),'instruction_count_excluding_known_data_including_pseudo':len(unique)-4,'instruction_bytes_excluding_known_data_including_pseudo':sum(map(len,unique.values()))-8,'all_instruction_bytes_match':True,'literal_words':len(pools),'selected_rom_regions':len(rom),'mtk_member_equal':True,'startup_decoded_bytes':len(ram),'startup_compressed_bytes':src-start,'startup_chunks':len(segments),'pin_table_verified':True,'mapping':['0x26000','0x37fb8'],'readonly_noanalysis':True,'target_executed':False,'hardware_accessed':False}
 save('VALIDATION.json',validation)
 save('SOURCE_MANIFEST.json',{'inputs':[rec(APP),rec(ZIP),rec(ROOT/'analysis/system-deepening-20261108/keeson-sampling-fault/FINDINGS_ZH.txt')],'exports':[rec(p) for folder in ['export','pseudo','decoded'] for p in sorted((OUT/folder).iterdir()) if p.is_file()],'scripts':[rec(p) for p in sorted((OUT/'scripts').iterdir()) if p.is_file()],'known_decompiler_caveat':'0002655c listing misdecodes literal pool 26578..2657f as four instructions, and its pseudocode includes false fallthrough into adjacent decoder; this data is classified separately. Startup is proven with 2655c..26577 and scatter records, not inaccurate trailing pseudocode. Other shared noncontiguous bodies retained.'})
 print(json.dumps(validation,ensure_ascii=False))
if __name__=='__main__':main()
