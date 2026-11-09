#!/usr/bin/env python3
from pathlib import Path
import hashlib,json,re,struct,zipfile,shutil
O=Path(__file__).resolve().parents[1];R=O.parents[2];N=O.parent
def sha(b):return hashlib.sha256(b).hexdigest()
def save(n,d):(O/n).write_text(json.dumps(d,ensure_ascii=False,indent=2)+'\n')
def rec(p):
 b=p.read_bytes();return {'path':str(p.relative_to(R)),'bytes':len(b),'sha256':sha(b)}
T=R/'analysis/finishable-20261107/accessories-c11/extracted/8Sleep_H6_SW-V25-2025-07-24/payload.bin';K=R/'analysis/finishable-20261107/accessories-c11/extracted/OTA_KS8S08C010000001_V10211_nRF52832_202602070917/nrf52832_xxaa.bin'
TB=R/'mediatek/rootfs-selected/opt/eight/firmware/8Sleep_H6_SW-V25-2025-07-24.bin';KZ=R/'mediatek/rootfs-selected/opt/eight/firmware/Keeson/OTA_KS8S08C010000001_V10211_nRF52832_202602070917.zip'
t=T.read_bytes();k=K.read_bytes();assert sha(t)=='b5099dad86bd475a3e0fc5a208d6921eccb3302e176bc9876d795475f875f239';assert sha(k)=='1856c1baec5f9bca7151e5b550fdf0a8d749e87f889d963a3a343293a4160966';assert TB.read_bytes()[128:]==t
with zipfile.ZipFile(KZ) as z:
 m=[n for n in z.namelist() if n.endswith('nrf52832_xxaa.bin')];assert len(m)==1 and z.read(m[0])==k
inputs=[dict(rec(T),mapping_base='0x08008000',original_container=rec(TB),container_header_bytes=128),dict(rec(K),mapping_base='0x26000',original_container=rec(KZ),zip_member=m[0])];save('INPUTS.json',{'inputs':inputs,'read_only_originals':True,'target_executed':False})
reused=[]
for rel,dest in [('keeson-position-source/STARTUP_DATA.json','source/keeson-startup/STARTUP_DATA.json'),('keeson-position-source/decoded/ram_20002aa8_20003770.bin','source/keeson-startup/ram_20002aa8_20003770.bin'),('keeson-position-source/FINDINGS_ZH.txt','source/keeson-startup/FINDINGS_ZH.txt'),('trimix-position-protection/pass3/0800a000.txt','source/trimix/0800a000.txt')]:
 src=N/rel;dst=O/dest;dst.parent.mkdir(parents=True,exist_ok=True)
 if not dst.exists():shutil.copyfile(src,dst)
 assert src.read_bytes()==dst.read_bytes();reused.append({'source':rec(src),'copy':dest,'sha256':sha(dst.read_bytes())})
save('REUSED_SOURCES.json',reused)
unique={'trimix':{},'keeson':{}};files=[];literals={};refs=[]
for p in sorted(O.rglob('*.txt')):
 rel=str(p.relative_to(O))
 if not (rel.startswith('trimix') or rel.startswith('keeson') or rel=='source/trimix/0800a000.txt'):continue
 kind='trimix' if rel.startswith('trimix') or rel.startswith('source/trimix') else 'keeson';b,base=(t,0x8008000) if kind=='trimix' else (k,0x26000);rows=[]
 for ln,line in enumerate(p.read_text().splitlines(),1):
  m=re.match(r'INSN ([0-9a-f]+) ([0-9a-f]+) (.*)',line)
  if not m:continue
  a=int(m[1],16);raw=bytes.fromhex(m[2]);assert 0<=a-base<=len(b)-len(raw) and b[a-base:a-base+len(raw)]==raw,(rel,ln)
  if a in unique[kind]:assert unique[kind][a]==raw
  unique[kind][a]=raw;rows.append({'line':ln,'va':hex(a),'file_offset':a-base,'hex':m[2]})
  for rm in re.finditer(r'REF\[READ:([0-9a-f]+)=([0-9a-f]+)\]',line):
   a2=int(rm[1],16);val=int(rm[2],16)
   if base<=a2<=base+len(b)-4:
    actual=struct.unpack_from('<I',b,a2-base)[0];assert actual==val,(rel,ln,'literal');literals[(kind,a2)]=actual
  if 'UNCONDITIONAL_CALL:' in line or 'COMPUTED_CALL:' in line:refs.append({'source':rel,'line':ln,'instruction':line})
 files.append({'path':rel,'sha256':sha(p.read_bytes()),'listing_rows':len(rows),'rows':rows})
save('BYTE_VALIDATION.json',{'status':'PASS','unique_listing_addresses':{x:len(v) for x,v in unique.items()},'unique_listing_bytes':{x:sum(len(b) for b in v.values()) for x,v in unique.items()},'export_files':len(files),'literal_u32_checks':len(literals),'original_container_matches':True,'notes':['Counts cover retained listing, not complete firmware semantics.','Unused listing at TriMix19258/1925a is possible data; not used as executable proof.','Ephemeral Thumb decode ranges bound by raw table/callback addresses; no Ghidra database changes.']})
save('SOURCE_INDEX.json',files)
# Explicit raw tables/entry words supplement original listings without invented REA IDs.
raw=[]
for kind,a,size,label in [('trimix',0x80191ac,40,'scatter relative directory and two records'),('trimix',0x80149a4,8,'binary64 normal scaling constant'),('keeson',0x36f98,32,'fstorage backend function table'),('keeson',0x2fae4,2,'callback ordinary return, manual Thumb 7047=bx lr'),('trimix',0x8008000,8,'application SP/reset vector')]:
 b,base=(t,0x8008000) if kind=='trimix' else (k,0x26000);chunk=b[a-base:a-base+size];assert len(chunk)==size;raw.append({'input':kind,'va':hex(a),'file_offset':a-base,'label':label,'hex':chunk.hex(),'sha256':sha(chunk)})
assert struct.unpack_from('<4I',t,0x80191b4-0x8008000)==(0xffffff99,0x2ba4,0x200054b8,0)
assert k[0x2fae4-0x26000:0x2fae6-0x26000]==bytes.fromhex('7047')
startup=(O/'source/keeson-startup/ram_20002aa8_20003770.bin').read_bytes()
fs=[{'address':hex(a),'u32':hex(struct.unpack_from('<I',startup,a-0x20002aa8)[0])} for a in range(0x20003748,0x20003770,4)]
save('RAW_FACTS.json',{'bytes':raw,'trimix_zero_init':{'entry':'0x0801914c ->0x08019182','length':0x2ba4,'start':'0x200054b8','end_exclusive':hex(0x200054b8+0x2ba4),'includes_five_sample_arrays_and_smoothing_history':True,'qualification':'This application runtime path executes before main. Later writers and real boot execution are not observed.'},'keeson_fstorage_startup_words':fs,'keeson_backend_slots':[{'offset':off,'thumb_pointer':hex(struct.unpack_from('<I',k,0x36f98+off-0x26000)[0])} for off in range(0,32,4)]})
# Direct callsite inventory of API; names/arguments verified in retained native exports.
api=[{'caller':'0x299aa','source':'keeson2/000284e4.txt','fs':'0x20003748','length':164,'destination':'configured +0xc = recovered startup 0x74000','source_buffer':'0x20003dc0','category':'application configuration'}, {'caller':'0x34d86','source':'keeson3/00034d78.txt','fs':'0x2000375c','length':8,'category':'FDS marker'}, {'caller':'0x34da4','source':'keeson3/00034d94.txt','fs':'0x2000375c','length':8,'category':'FDS marker'}, {'caller':'0x3554c','source':'keeson3/0003553c.txt','fs':'0x2000375c','length':4,'category':'FDS field'}, {'caller':'0x36af8','source':'keeson3/00036a48.txt','fs':'0x2000375c','length':'state dependent','category':'FDS generic record'}, {'caller':'0x2fefa','source':'keeson4/0002fdd0.txt','fs':'0x2000375c','length':'variable','category':'FDS record copy'}]
save('KEESON_APPEND_SEARCH.json',{'status':'position_append_not_bound','normal_position_region':'0x76000','normal_record_bytes':32,'snapshot_buffer':'0x20003c68','all_six_identified_direct_calls_to_0x3253c':api,'backend_write':'0x369f8 selected by raw table0x36f98+0xc; queues operation then351d8','backend_erase':'0x2f67c selected table+0x10','application_completion_callback':'startup fs+8=0x2faac; inspected callback logs normal completion, no record append or P/E/T store','callback_dispatch_source':'keeson5/0002f99c.txt','snapshot_trigger_sources':['keeson3/00029e00.txt','keeson1/0002b908.txt','keeson1/0002b6a8.txt'],'direct_record_extra_word_refs':'20003c78/7c/80 returned no direct refs; not whole-program absence proof','limits':['Computed/aliased API invocations, arbitrary bulk writes, other firmware versions and missing SoftDevice/bootloader not exhaustively excluded.','No ordinary append producer identified in covered source and direct callsite set. This does not prove the current real device never saves position.','No power-loss/attack/race testing or target execution.']})
# Scoped search ledger: exact tokens in prior named corpus only; preserve file/line, no unrelated dirs.
search=[];prior=R/'analysis/finishable-20261107/accessories/keeson-mcu/expanded'
for p in sorted(prior.glob('*.c')):
 for ln,line in enumerate(p.read_text().splitlines(),1):
  if any(x in line for x in ['20003fc0','20003c68','20003c80','20003c84','0x76000']):search.append({'file':str(p.relative_to(R)),'line':ln,'text':line.strip(),'sha256':sha(p.read_bytes())})
save('BOUNDED_SOURCE_SEARCH.json',{'scope':str(prior.relative_to(R))+'/*.c','terms':['20003fc0','20003c68','20003c80','20003c84','0x76000'],'matches':search,'absence_not_proof':True})
print(json.dumps({'status':'PASS','files':len(files),'unique_instructions':sum(len(x) for x in unique.values()),'bytes':sum(sum(len(b) for b in x.values()) for x in unique.values()),'literals':len(literals)}))
