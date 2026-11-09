"""Finite normal record relationships. No vendor execution, Flash writes or device I/O."""
from pathlib import Path
import json,struct
O=Path(__file__).resolve().parents[1]
def crc32_no_final(data):
 c=0xffffffff
 for b in data:
  c^=b
  for _ in range(8):c=(c>>1)^(0xedb88320 if c&1 else 0)
 return c&0xffffffff
def crc16_wire(data):
 c=0xffff
 for b in data:
  c^=b
  for _ in range(8):c=(c>>1)^(0xa001 if c&1 else 0)
 return c&65535
def record32(positions,extra=(0x11223344,0x55667788),index=5):
 first=struct.pack('<6I',*positions,*extra)
 return first+struct.pack('<II',index,crc32_no_final(first))
def snapshot32(record,positions):
 r=bytearray(record);r[:16]=struct.pack('<4I',*positions)
 # Normal all-stopped / software gate clear branch only.
 new_crc=crc32_no_final(r[:24]);changed=new_crc!=struct.unpack_from('<I',r,28)[0]
 if changed:struct.pack_into('<I',r,28,new_crc)
 return bytes(r),changed
def dump196(config,flash_records):
 # Normal nonempty valid list, followed by the erased marker in actual scan.
 assert len(config)==164 and flash_records
 return config+flash_records[-1]
def record14(positions,extra=(0x1234,0x5678)):
 words=(*positions,*extra);c=crc16_wire(struct.pack('>6H',*words))
 return struct.pack('<7H',*words,c)
def snapshot14(record,positions):
 r=bytearray(record);r[:8]=struct.pack('<4H',*positions)
 words=struct.unpack_from('<6H',r);struct.pack_into('<H',r,12,crc16_wire(struct.pack('>6H',*words)))
 return bytes(r)
def main():
 cases=[]
 def ok(n,v,s):cases.append({'case':n,'status':'PASS','synthetic':True,'result':v,'source':s})
 flash=record32([10,20,30,40]);ram,changed=snapshot32(flash,[11,22,33,44]);assert changed and ram[16:28]==flash[16:28]
 ok('Keeson_snapshot_preserves_two_words_and_marker',{'extra_and_marker_hex':ram[16:28].hex()},'k1-scan/0002b6a8.txt')
 assert struct.unpack('<4I',ram[:16])==(11,22,33,44);assert struct.unpack_from('<I',ram,28)[0]==crc32_no_final(ram[:24])
 ok('Keeson_snapshot_crc_covers_extra_words',{'crc':struct.unpack_from('<I',ram,28)[0]},'k1-scan/0002b6a8.txt + local-accessory-closure/2f28c')
 other=record32([11,22,33,44],(0x11223345,0x55667788));assert other[:16]==ram[:16] and other[28:]!=ram[28:]
 ok('Keeson_opaque_word_changes_crc_not_restored_four_positions',True,'k1-scan/0002b680.txt +0002b6a8.txt')
 unchanged,changed=snapshot32(ram,[11,22,33,44]);assert not changed and unchanged==ram
 ok('Keeson_normal_same_snapshot_no_crc_change',True,'k1-scan/0002b6a8.txt')
 config=bytes(range(164));out=dump196(config,[flash]);assert len(out)==196 and out[164:]==flash and out[164:180]!=ram[:16]
 ok('Keeson_diagnostic_uses_Flash_not_new_RAM',{'total_bytes':196,'flash_positions':list(struct.unpack('<4I',out[164:180])),'ram_positions':[11,22,33,44]},'k1-scan/000298bc.txt + k2/00026e9c.txt')
 newer=record32([50,60,70,80],index=6);assert dump196(config,[flash,newer])[164:]==newer
 ok('Keeson_normal_last_record_selected',{'index':6},'k1-scan/000298bc.txt')
 old=record14([10,20,30,40]);new=snapshot14(old,[11,22,33,44]);assert len(new)==14 and new[8:12]==old[8:12]
 ok('TriMix_four_position_snapshot_preserves_extra_halfwords',{'extra_hex':new[8:12].hex()},'t1-scan/0800824a.txt +0800fd54.txt')
 words=struct.unpack('<7H',new);assert words[-1]==crc16_wire(struct.pack('>6H',*words[:6]))
 ok('TriMix_flash_little_endian_crc_input_big_endian',{'words':list(words)},'t1-scan/0800fd9e.txt +0800a7dc.txt')
 r={'status':'PASS','case_count':len(cases),'cases':cases,'limits':['Synthetic normal records only; no malformed-input, concurrency, power-loss or fault testing.','No actual32B append is simulated or claimed. dump reads explicitly supplied Flash records.','Opaque fields deliberately given artificial values; not real device configuration.','Only record-local preservation/CRC/normal read relationships, not full boot/runtime proof.']}
 (O/'MODEL_RESULTS.json').write_text(json.dumps(r,ensure_ascii=False,indent=2)+'\n');print(len(cases),'PASS')
if __name__=='__main__':main()
