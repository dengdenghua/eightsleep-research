from pathlib import Path
import re,json,hashlib,shutil,zipfile,collections
O=Path(__file__).resolve().parents[1];N=O.parent;R=N.parents[1];L=N/'local-accessory-closure'
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def dump(n,x):(O/n).write_text(json.dumps(x,ensure_ascii=False,indent=2)+'\n')
input_specs={'keeson':(R/'analysis/finishable-20261107/accessories-c11/extracted/OTA_KS8S08C010000001_V10211_nRF52832_202602070917/nrf52832_xxaa.bin',0x26000),'trimix':(R/'analysis/finishable-20261107/accessories-c11/extracted/8Sleep_H6_SW-V25-2025-07-24/payload.bin',0x8008000),'neighbor':(O/'historical-V10208/nrf52832_xxaa.bin',0x26000)}
inputs=[];blobs={}
for k,(p,base) in input_specs.items():blobs[k]=(p.read_bytes(),base);inputs.append({'family':k,'path':str(p),'bytes':p.stat().st_size,'sha256':sha(p),'mapping_base':f'{base:08x}'})
dump('INPUTS.json',inputs)
src=[]
for fam,names in {'keeson':['keeson1/0002f28c.txt','keeson4/0002f2b0.txt','keeson3/00034d78.txt','keeson3/00034d94.txt','keeson3/0003553c.txt','keeson3/00036a48.txt','keeson4/0002fdd0.txt','source/keeson-startup/STARTUP_DATA.json','source/keeson-startup/FINDINGS_ZH.txt'],'trimix':['trimix6/0801914c_0801918b.txt','trimix5/0801918c.txt','trimix3/0800eb94_0800ebcc.txt','trimix3/0801099c.txt','trimix1/08014822.txt']}.items():
 for name in names:
  p=L/name;d=O/'reference'/fam/p.name;d.parent.mkdir(parents=True,exist_ok=True);shutil.copyfile(p,d);src.append({'source':str(p),'copy':str(d.relative_to(O)),'sha256':sha(p)})
dump('SOURCE_INDEX.json',src)
def parse(p):
 rows=[]
 for line in p.read_text().splitlines():
  m=re.match(r'INSN ([0-9a-f]{8}) ([0-9a-f]+) ',line) or re.match(r'([0-9a-f]{8})\t[^\t]+\t([0-9a-f]+)\t',line)
  if m:rows.append((int(m[1],16),bytes.fromhex(m[2]),line))
 return rows
checks=[];uniq={k:{} for k in blobs};lit={k:{} for k in blobs}
for k,(b,base) in blobs.items():
 files=list((O/'reference'/k).glob('*.txt'))
 pattern={'keeson':'k[12]*/**/*.txt','trimix':'t1*/**/*.txt','neighbor':'neighbor[123]/**/*.txt'}[k]
 files+=list(O.glob(pattern))
 if k in ['keeson','trimix']:files+=list(O.glob(('k1' if k=='keeson' else 't1')+'-scan-all/*.tsv'))
 for p in sorted(set(files)):
  count=0
  for a,bs,line in parse(p):
   assert b[a-base:a-base+len(bs)]==bs,(p,hex(a));uniq[k][a]=bs;count+=1
   for m in re.finditer(r'REF\[(?:READ|DATA|PARAM):([0-9a-f]{8})=([0-9a-f]+)\]',line):
    addr=int(m[1],16)
    if base<=addr<=base+len(b)-4:
     v=int.from_bytes(b[addr-base:addr-base+4],'little');assert v==int(m[2],16),(p,m.group());lit[k][addr]=v
  if count:checks.append({'path':str(p.relative_to(O)),'instruction_occurrences':count,'status':'PASS'})
dump('BYTE_VALIDATION.json',{'files':checks,'unique_instruction_addresses':{k:len(x) for k,x in uniq.items()},'unique_instruction_bytes':{k:sum(map(len,x.values())) for k,x in uniq.items()},'unique_flash_literal_words':{k:len(x) for k,x in lit.items()},'scope':'All retained decoded listing bytes match original image; does not prove each database instruction interpretation/function boundary valid. Already-known merged fragments use caller/range asm rather than whole pseudo.'})
# Full image literal search records exact-value appearances, not an arbitrary-alias proof.
queries={'keeson':[0x20003c68,0x20003c78,0x20003c7c,0x20003c80,0x20003c84,0x20003fc0,0x3253c,0x3253d,0x369f8,0x369f9,0x76000,0x75fe0,0x4001e504,0x1000120c],'trimix':[0x20007fd0,0x20007fd8,0x20007fda,0x20007fdc,0x080ff800]}
rr=[]
for k,vals in queries.items():
 b,base=blobs[k]
 for value in vals:
  needle=value.to_bytes(4,'little');start=0;hits=[]
  while (i:=b.find(needle,start))>=0:hits.append(f'{base+i:08x}');start=i+1
  rr.append({'family':k,'value':f'{value:08x}','raw_all_byte_matches':hits})
dump('RAW_LITERAL_SCAN.json',{'method':'full original-image exact 4-byte literal search; matches may be data, code or unaligned coincidence','results':rr,'does_not_exclude':'register-computed addresses, overlapping bulk access, arbitrary runtime aliases'})
# Explicit accessor shortlist, derived from original current decoded reference lists.
record_refs={}
for fam,p,lo,hi in [('keeson',O/'k1-scan-all/decoded-instructions.tsv',0x20003c68,0x20003c87),('trimix',O/'t1-scan-all/decoded-instructions.tsv',0x20007fd0,0x20007fdd)]:
 found=[]
 for line in p.read_text().splitlines():
  vs=[]
  for m in re.finditer(r'REF\[[^:]+:([0-9a-f]{8})(?:=([0-9a-f]+))?\]',line):
   vals=[int(m[1],16)]+([int(m[2],16)] if m[2] else [])
   if any(lo<=v<=hi for v in vals):vs+=vals
  if vs:found.append(line)
 record_refs[fam]=found
(O/'RECORD_ACCESSORS.json').write_text(json.dumps({'scope':'All existing decoded listing references whose resolved address/literal falls in selected record range; not arbitrary alias coverage','ranges':{'keeson':'20003c68..20003c87','trimix':'20007fd0..20007fdd'},'references':record_refs},indent=2)+'\n')
packages=[]
for name in ['OTA_KS8S08C010000001_V10211_nRF52832_202602070917.zip','KS8S08C010000001_dfufile_V10208_202601072135.zip']:
 p=R/'mediatek/rootfs-selected/opt/eight/firmware/Keeson'/name
 with zipfile.ZipFile(p) as z:members=[{'path':i.filename,'bytes':i.file_size,'sha256':hashlib.sha256(z.read(i.filename)).hexdigest()} for i in z.infolist() if not i.is_dir()];manifest=json.loads(z.read('manifest.json'))
 packages.append({'path':str(p),'sha256':sha(p),'members':members,'manifest':manifest,'contains_only_application_component':list(manifest['manifest'])==['application']})
dump('PACKAGE_BOUNDARIES.json',{'packages':packages,'primary_application_VA':'00026000..00037fb7','neighbor_application_VA':'00026000..000381d7','outside_application_material_not_provided_in_these_two_zips':['complete lower-address system service implementation','complete bootloader image','76000 actual position record page','74000 actual device configuration page'],'caution':'Missing service/bootloader is an evidence boundary, not evidence the missing32B producer is located there.'})
# Compare bounded exact-byte layouts, leaving intentional semantic address/flag changes explicit.
compare=[]
for a,old in [('00029840','00029a60'),('000298bc','00029adc'),('0002b6a8','0002b704'),('0002f28c','0002f410'),('0003253c','000326c0'),('000351d8','000353f0'),('000369f8','00036c10')]:
 ps=list((O/'k1-scan').glob(a+'.txt'))
 if not ps:ps=list((O/'reference/keeson').glob(a+'.txt'))
 pp=ps[0];np=O/'neighbor1'/(old+'.txt');pdict={x:(bs,l) for x,bs,l in parse(pp)};ndict={x:(bs,l) for x,bs,l in parse(np)};common=0;exact=0;diff=[]
 for x,(bs,l) in pdict.items():
  off=x-int(a,16);y=int(old,16)+off
  if y not in ndict:continue
  bs2,l2=ndict[y];common+=1;exact+=bs==bs2
  t=l.split(' ',3)[3].split(' REF[')[0];t2=l2.split(' ',3)[3].split(' REF[')[0]
  norm=lambda s:re.sub(r'0x[0-9a-f]{5,8}','ADDR',s)
  if norm(t)!=norm(t2):diff.append({'primary':f'{x:08x}','neighbor':f'{y:08x}','primary_instruction':t,'neighbor_instruction':t2})
 compare.append({'primary':a,'neighbor':old,'compared_instructions_same_relative_offset':common,'byte_identical_instructions':exact,'address_normalized_differences':diff,'primary_source':str(pp.relative_to(O)),'neighbor_source':str(np.relative_to(O))})
dump('NEIGHBOR_COMPARISON.json',{'scope':'V10208 seven targeted functions, not all behavior/version equivalence; incomplete merged function bodies are not treated as entire code coverage','results':compare,'record_RAM':{'V10211':'20003c68','V10208':'20003c60'},'CRC_clear_flag':{'V10211':'20003fc0','V10208':'20003fb4'},'same_normal_contract':['32B scan at76000','196B configuration+position Flash diagnostic copy','first4 P snapshot; first24B CRC; no append call in that snapshot function'],'wrapper_contexts':{'V10208_application_config':'neighbor3/00029ba8.txt: 164B source20003db8; fs20003744','V10208_FDS_other_five':'neighbor2/00034f90,00034fac,00035754; neighbor3/0003005e,00036cec use fs20003758'},'no_new_position_writer_identified_in_targeted_neighbor_paths':True})
print('validation', {k:len(x) for k,x in uniq.items()},'literal',{k:len(x) for k,x in lit.items()},'accessors',{k:len(x) for k,x in record_refs.items()})
