from pathlib import Path
import json,re,hashlib,struct
O=Path(__file__).resolve().parents[1]
def put(n,v):(O/n).write_text(json.dumps(v,ensure_ascii=False,indent=2)+'\n')
raw=json.loads((O/'INPUTS.json').read_text())[0];b=Path(raw['path']).read_bytes();assert hashlib.sha256(b).hexdigest()==raw['sha256']
lines=(O/'reference/decoded-instructions.tsv').read_text().splitlines();ins={int(x.split('\t')[0],16):x for x in lines}
pcode={}
for line in (O/'pass1/value-slices.tsv').read_text().splitlines():
 p=line.split('\t')
 if p[2] in ['CALLIND','BRANCHIND']:pcode.setdefault(p[1],[]).append(line)
api={'00032144':'r12 <- *( *(r0) + 0x10 ): erase API','0003224c':'r12 <- *(entry_r1), via r4: supplied API init','000322c0':'r1 <- *( *(r0) + 0x1c ): busy query','000322de':'r1 <- *( *(20003748 + index*20) + 0x1c ): busy query','00032362':'r12 <- *( *(r0) + 8 ): read API','00032604':'r4 <- *( *(r5) + 0xc ): write API; r5=entry r0','0002f9ea':'r1 <- *( *(queue_entry+0) + 8 ): completion callback; primary initial callback2faac/FDS2faa4'}
items=[]
for l in (O/'reference/indirect-and-svc.tsv').read_text().splitlines():
 p=l.split('\t');asm=p[3]
 if not (asm.startswith('blx ') or asm.startswith('bx ')):continue
 a=int(p[0],16);kind='runtime_target_unclosed';note='Retained target expression/register context; not proven to be a record writer or proven globally unrelated.'
 if p[0] in api:kind='storage_api_or_completion';note=api[p[0]]
 elif p[0]=='0002656c':kind='startup_scatter';note='two entries at37b68/37b78:26580 compressed .data and2c490 BSS zero; no append'
 elif 'COMPUTED_CALL:' in l or 'COMPUTED_JUMP:' in l:kind='existing_resolved_constant';note='Target from existing reference, original instruction/ROM literal retained; not an independently observed runtime target.'
 items.append({'address':p[0],'owner':p[1],'target_register':asm.split()[1],'classification':kind,'provenance':note,'high_pcode_rows':pcode.get(p[0],[]),'instruction_context':[v for k,v in ins.items() if a-32<=k<=a+4],'source_function':('pass1/'+p[1]+'.txt') if p[1]!='none' else 'pass1/ownerless-context.txt'})
put('INDIRECT_CALL_LEDGER.json',{'scope':'Every 77 BLX and16 non-return BX in the retained existing decoded listing; target ledger is not full target resolution. Does not count TBB as function calls.','counts':{'sites':len(items),'with_high_pcode':sum(bool(x['high_pcode_rows']) for x in items),'ownerless':sum(x['owner']=='none' for x in items)},'sites':items})
# Original-byte checks of all exported instructions and referenced ROM literal words.
addrs={};literals={};duplicates=0
for p in list((O/'pass1').glob('*.txt'))+list((O/'pass2').glob('*.txt'))+list((O/'pass3').glob('*.txt')):
 for l in p.read_text().splitlines():
  m=re.match(r'INSN ([0-9a-f]+) ([0-9a-f]+) ',l)
  if m:
   a=int(m[1],16);data=bytes.fromhex(m[2]);assert b[a-0x26000:a-0x26000+len(data)]==data,(p,a);addrs[a]=data
   for x in re.finditer(r'REF\[[^:]+:([0-9a-f]+)=([0-9a-f]+)\]',l):
    pos=int(x[1],16)
    if 0x26000<=pos<=0x37fb4:
     val=int(x[2],16)&0xffffffff;assert int.from_bytes(b[pos-0x26000:pos-0x26000+4],'little')==val;(literals.__setitem__(pos,val))
for l in lines:
 p=l.split('\t');a=int(p[0],16);data=bytes.fromhex(p[2]);assert b[a-0x26000:a-0x26000+len(data)]==data
put('BYTE_VALIDATION.json',{'input_sha256':raw['sha256'],'mapping':'file_offset=VA-0x26000','status':'PASS','exported_unique_instruction_addresses':len(addrs),'exported_instruction_bytes_sum':sum(map(len,addrs.values())),'exported_literal_words':len(literals),'retained_listing_instruction_addresses':len(lines),'limits':['Addresses are existing and newly selected exports together, not newly recovered instruction count.','Overlap/data misclassification is not eliminated by byte equality; semantics use named native anchors.']})
# Exact raw native source for unaligned address-like windows.
loc=json.loads((O/'RAW_ADDRESS_LOCATORS.json').read_text())
for x in loc['hits']:
 a=int(x['address'],16)
 x['overlapping_existing_instructions']=[v for k,v in ins.items() if k<=a+3 and k+len(bytes.fromhex(v.split('\t')[2]))>a]
 x['interpretation']='aligned raw value locator' if x['aligned4'] else 'unaligned windows overlap ordinary instruction bytes; not a proven pointer'
put('RAW_ADDRESS_LOCATORS.json',loc)
# Evidence-based candidate disposition, explicit non-exhaustive dynamic boundary.
candidates=[]
for l in (O/'alias/alias-candidates.tsv').read_text().splitlines():
 p=l.split('\t');a=int(p[1],16);note='Adjacent object access; candidate range extends beyond record. No append from this operation alone.'
 if a in [0x29856,0x2988c,0x298ee,0x29920]:note='Flash read at76000+index*32 or last-slot arithmetic; no write. Bounded index from original read loops.'
 elif a==0x2986e:note='Page erase after invalid scanword; source record not appended.'
 elif a==0x29896:note='32B stack read result copied TO record RAM during restore.'
 elif a==0x298a8:note='Record RAM zeroed when scan found no usable entry.'
 elif a in [0x2b68c]:note='Record words read to restore four P slots; no Flash operation.'
 elif a in [0x2b6c0,0x2b6e4,0x2b6e8,0x2b6f0,0x2b6f4]:note='RAM snapshot/CRC comparison/cache update/changeflag store; no queue submission in function.'
 elif a in [0x297da,0x296d2,0x2970a,0x2a864,0x2b5b0]:note='Copy begins at adjacent20003c88, exactly after exclusive record end; lengths38/3c do not reach backward into record.'
 candidates.append({'site':p[1],'owner':p[0],'locator':l,'disposition':note})
put('ALIAS_CANDIDATES.json',{'locator_scope':'569 inherited function boundaries; depth20/set32 recursive P-code constant folding. 6138 selected ops,52 near-range locators. Partial retains unknown alternatives.','candidates':candidates,'manual_precision':['26b38 has path-merged inferred length1c/c4; original local instructions26b32=1c,26b34=20003ba8,26b36=200046ff identify this normal branch as28B reply. Do not cross-product unrelated P-code paths into a196B copy.','Whole copied source ranges and adjacent object starts were checked, not just exact base equality.','No READ of20003fc0 found in existing resolved refs or these constant-folded candidates; this does not exclude arbitrary computed aliases.']})
# Bulk helper calls with raw caller provenance; dynamic cases deliberately remain open.
bulk=[]
for l in (O/'alias/all-call-values.tsv').read_text().splitlines():
 p=l.split('\t')
 if any('target='+q in l for q in ['0002648c','000264be','000264b0','000264c2']):
  bulk.append({'site':p[1],'owner':p[0],'values':l,'scope':'bounded symbolic locator; original r0/r1/r2 instructions authoritative','source':('pass1/'+p[0]+'.txt') if (O/'pass1'/f'{p[0]}.txt').exists() else 'reference/decoded-instructions.tsv'})
put('BLOCK_COPY_LEDGER.json',{'scope':'High P-code occurrences for four identified memcpy/fill helpers; ownerless sites and omitted decompiler paths remain represented in original listing, not claimed absent.','entries':bulk,'normal32B_candidates':{'000279a0':'stack-built status -> another stack field ->31e2c sender; no Flash API in this producer','0003163a':'input event config -> stack32B -> peripheral setup33ec0/340f4; retains param2 source but is not a Flash submission here','00029896':'Flash read buffer -> position RAM','00029934':'Flash read buffer -> stack diagnostic aggregate','0002cc9c':'fixed ROM36d98 -> stack normal config; not position RAM'}})
put('COVERAGE.json',{'primary_only':True,'input':raw,'existing_functions_decompiled':569,'existing_indirect_sites':93,'bulk_and_indirect_selected_sites':184,'selected_native_function_exports_pass1':119,'alias_candidate_ops':52,'newly_bound_initial_data_callbacks':['0002faac','0002faa4'],'new_data_decoder':'634 compressed bytes ->3272 initial .data bytes; not runtime snapshot','unchanged_prior':'Six direct fstorage_write callsites remain prior evidence, not counted as new discoveries. No new historical version analysed.','unknown':['Computed runtime addresses and interprocedural callback arguments are not exhaustively resolved.','All inherited recognized functions were inspected by locator, not all firmware bytes proven code.','Service/bootloader code below0x26000 absent from selected application artifact; absence does not locate missing32B producer there.','No actual device deployment/save timing or physical event observations.']})
print(json.dumps({'indirect':len(items),'pcode_sites':sum(bool(x['high_pcode_rows']) for x in items),'candidates':len(candidates),'bulk_pcode':len(bulk),'bytecheck':len(addrs)}))
