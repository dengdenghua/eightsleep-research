from pathlib import Path
import re,json,hashlib,shutil,struct
O=Path(__file__).resolve().parents[1];N=O.parent;R=N.parents[1];U=N/'local-signal-closure';B=R/'mediatek/rootfs-selected/opt/eight/lib/subsystem_updates'
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def dump(n,x):(O/n).write_text(json.dumps(x,ensure_ascii=False,indent=2)+'\n')
def parse(p):
 d={}
 for l in p.read_text().splitlines():
  m=re.match(r'INSN ([0-9a-f]{8}) ([0-9a-f]+) (.*?)(?: REF\[|$)',l)
  if m:d[int(m[1],16)]=(m[2],m[3],l)
 return d
blobs={};inputs=[]
for k,name,base in [('nonusb','firmware-sensor-g0.bbin',0x8008000),('usb','firmware-sensor-g0-usb.bbin',0x8010000)]:
 p=B/name;blobs[k]=(p.read_bytes(),base);inputs.append({'role':k,'path':str(p),'size':p.stat().st_size,'sha256':sha(p),'base':f'{base:08x}'})
dump('INPUTS.json',inputs)
source=[]
def copy(p,kind='usb'):
 d=O/'reference'/kind/p.name;d.parent.mkdir(parents=True,exist_ok=True);shutil.copyfile(p,d);source.append({'source':str(p),'copy':str(d.relative_to(O)),'sha256':sha(p)});return d
pairs={x['usb_entry']:x['candidates'][0]['nonusb_candidate_start'] for x in json.loads((O/'CANDIDATE_BYTE_MATCH.json').read_text())['results']}
pairs.update({'08022694':'080188e8','080226b4':'08018908','08022784':'080189d8','08022c2c':'08018e80','0801c4ec':'080134be','0801c4d6':'080134a8','08010288':'08008288','080104c4':'080084c4','08010500':'08008500','08010568':'08008568','08010574':'08008574','08010588':'08008588','0801059c':'0800859c','080105b0':'080085b0','08029c8c':'0801feb8','08029c4c':'0801fe78','08029d10':'0801ff3c','0802a344':'08020570','0802ab50':'08020d7c','0802abe0':'08020e0c','0802b49c':'080216c8','0802bdb8':'08021fe4','0802c348':'08022574','0802d1cc':'080233f8','0802d4e0':'0802370c','0802d8ac':'08023ad8','0802db28':'08023d54','0802de9c':'080240c8'})
reports=[];callmap={};literals=[]
for ua,na in pairs.items():
 us=list(U.glob('mcu-pass*/'+ua+'.txt'));ns=list(O.glob('pass*/'+na+'.txt'))
 if not us or not ns:continue
 up=max(us,key=lambda p:len(parse(p)));np=max(ns,key=lambda p:len(parse(p)));up=copy(up);ui=parse(up);ni=parse(np);diff=[];shared=0;exact=0
 for a,(h,t,line) in ui.items():
  offset=a-int(ua,16);b=int(na,16)+offset
  if b not in ni:diff.append({'offset':hex(offset),'reason':'not_exported_at_nonusb_offset'});continue
  h2,t2,line2=ni[b];shared+=1;exact+=h==h2
  normal=lambda s:re.sub('0x[0-9a-f]{7,8}','ADDR',s)
  if normal(t)!=normal(t2):diff.append({'offset':hex(offset),'usb':t,'nonusb':t2})
  if t.startswith('bl 0x') and t2.startswith('bl 0x'):callmap[t[5:]]=t2[5:]
  m=re.search(r'REF\[READ:([0-9a-f]{8})=([0-9a-f]+)\]',line);m2=re.search(r'REF\[READ:([0-9a-f]{8})=([0-9a-f]+)\]',line2)
  if m and m2:
   x=int(m[2],16);y=int(m2[2],16);same=x==y;category='same_literal' if same else ('relocated_flash_pointer' if 0x8010000<=x<0x8032620 and 0x8008000<=y<0x8028720 else 'relocated_RAM_pointer' if 0x20000000<=x<0x20024000 and 0x20000000<=y<0x20024000 else 'different_value')
   literals.append({'usb_instruction':f'{a:08x}','nonusb_instruction':f'{b:08x}','usb_pool_address':m[1],'nonusb_pool_address':m2[1],'usb_value':m[2],'nonusb_value':m2[2],'category':category})
 reports.append({'usb':ua,'nonusb':na,'usb_source':str(up.relative_to(O)),'nonusb_source':str(np.relative_to(O)),'usb_instruction_count':len(ui),'nonusb_instruction_count':len(ni),'same_offset_compared':shared,'exact_instruction_bytes':exact,'address_normalized_differences':diff})
copy(N/'capsense-producer-binding/source/nonusb/080122b6.txt','nonusb')
copy(U/'FINDINGS_ZH.txt','prior-analysis');copy(U/'CONTRACTS.json','prior-analysis')
dump('SOURCE_INDEX.json',source)
dump('PAIR_COMPARISON.json',{'method':'Exact offset aligned instruction text with absolute branch/load addresses normalized; original bytes independently checked. Does not by itself prove semantic equivalence of all relocated targets.','pairs':reports,'call_target_mapping':callmap,'literal_comparisons':literals,'unexpected_literal_changes':[r for r in literals if r['category']=='different_value']})
checks=[];unique={k:{} for k in blobs};lits={k:{} for k in blobs}
for kind in blobs:
 files=list((O/'reference'/kind).glob('*.txt'))
 if kind=='nonusb':files+=list(O.glob('pass*/*.txt'))
 blob,base=blobs[kind]
 for p in files:
  count=0
  for a,(h,t,line) in parse(p).items():
   bs=bytes.fromhex(h);assert blob[a-base:a-base+len(bs)]==bs,(p,a)
   unique[kind][a]=bs;count+=1
   for m in re.finditer(r'REF\[(?:READ|DATA|PARAM):([0-9a-f]{8})=([0-9a-f]+)\]',line):
    adr=int(m[1],16)
    if base<=adr<=base+len(blob)-4:
     val=int.from_bytes(blob[adr-base:adr-base+4],'little');assert val==int(m[2],16),(p,m.group())
     lits[kind][adr]=val
  checks.append({'path':str(p.relative_to(O)),'instruction_occurrences':count,'status':'pass'})
dump('BYTE_VALIDATION.json',{'files':checks,'unique_instruction_addresses':{k:len(x) for k,x in unique.items()},'unique_instruction_bytes':{k:sum(map(len,x.values())) for k,x in unique.items()},'unique_literal_u32':{k:len(x) for k,x in lits.items()},'scope':'Exported instructions/literal words checked against each corresponding original BBIN, not firmware execution; pass2 range16350 interpretation is superseded by correct entry pass3.'})
n,base=blobs['nonusb']
def raw(a,count,meaning):return {'address':f'{a:08x}','file_offset':a-base,'bytes_hex':n[a-base:a-base+count].hex(),'meaning':meaning}
tables=[raw(0x8027e3c,4,'mode0 A27'),raw(0x8027e40,8,'extended J01+'),raw(0x8027e48,8,'extended J01+ queen'),raw(0x8027e50,8,'extended J00'),raw(0x8027e14,20,'u32 status thresholds 0..4'),raw(0x8027e0e,6,'status any/all policy'),raw(0x8015820,14,'main state0..6 u16 relative table'),raw(0x801892a,8,'mode0 getter u8 relative table')]
tables[-2]['targets']=[f'{0x8015820+2*x:08x}' for x in struct.unpack('<7H',bytes.fromhex(tables[-2]['bytes_hex']))]
tables[-1]['targets']=[f'{0x801892a+2*x:08x}' for x in bytes.fromhex(tables[-1]['bytes_hex'])]
dump('RAW_TABLES.json',tables)
dump('EXPORT_CAVEATS.json',{'pass2/080162e0_080164cf.txt':'Superseded main range: transient start16350 lay inside existing BL1634e, producing spurious 32-bit instruction. Its raw bytes match but interpretation not used. Correct state entry162f4 from raw table yields BL1634e + LDRB16352 in pass3/08016230_0801643f.txt.','getter':'pass2 mode0 table targets partly absent from function body; pass3/08018908_080189c3.txt explicitly disassembles raw-table targets. No saved project edits.','decompilation':'void return and missing arguments in pseudocode are not treated as ABI proof; body bytes and actual registers used.'})
print('paired',len(reports),'unexpected literals',len([r for r in literals if r['category']=='different_value']),'unique', {k:len(x) for k,x in unique.items()})
print('nonzero instruction pair differences',[(p['usb'],len(p['address_normalized_differences'])) for p in reports if p['address_normalized_differences']])
