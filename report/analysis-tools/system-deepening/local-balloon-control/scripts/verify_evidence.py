"""Verify retained source hashes, original instruction bytes and BL targets."""
import hashlib,json,re,struct
from pathlib import Path
p=Path(__file__).resolve().parents[1]
def sha(b):return hashlib.sha256(b).hexdigest()
def save(name,obj):(p/name).write_text(json.dumps(obj,ensure_ascii=False,indent=2)+'\n')
ledger=json.loads((p/'SOURCE_LEDGER.json').read_text());raw=Path(ledger['binary']['path']).read_bytes();base=int(ledger['binary']['base'],16)
assert sha(raw)==ledger['binary']['sha256']
errors=[]
for item in ledger['sources']:
    for path in [Path(item['original']),p/item['retained']]:
        if sha(path.read_bytes())!=item['sha256']:errors.append(str(path))
branches=[];bound=[]
for item in ledger['sources']:
    path=p/item['retained']
    if not path.name.endswith('.asm.txt'):continue
    for line in path.read_text().splitlines():
        m=re.match(r'([0-9a-f]{8}) (.+)',line)
        if not m:continue
        a=int(m[1],16);off=a-base;h=struct.unpack_from('<H',raw,off)[0];size=4 if h>>11 in (29,30,31) else 2;b=raw[off:off+size]
        bound.append({'va':m[1],'bytes':b.hex(),'assembly':m[2],'source':path.name})
        c=re.fullmatch(r'bl 0x([0-9a-f]{8})',m[2])
        if c:
            h2=struct.unpack_from('<H',raw,off+2)[0];s=(h>>10)&1;i1=1^(((h2>>13)&1)^s);i2=1^(((h2>>11)&1)^s)
            v=(s<<24)|(i1<<23)|(i2<<22)|((h&1023)<<12)|((h2&2047)<<1)
            if v&(1<<24):v-=1<<25
            target=a+4+v
            branches.append({'va':m[1],'bytes':b.hex(),'decoded':f'{target:08x}','retained_target':c[1],'match':target==int(c[1],16)})
cb=[];cb_records=0;cb_errors=[]
for path in sorted((p/'callbacks').glob('*.txt')):
    cb.append({'path':str(path.relative_to(p)),'sha256':sha(path.read_bytes())})
    for line in path.read_text().splitlines():
        m=re.match(r'([0-9a-f]{8}) ([0-9a-f]+) (.+)',line)
        if not m:continue
        a=int(m[1],16);b=bytes.fromhex(m[2]);cb_records+=1
        if raw[a-base:a-base+len(b)]!=b:cb_errors.append(m[1])
constants=[]
for a in [0x801d0cc,0x801d0d0,0x801d0d4,0x801d0d8,0x801b8b0,0x801b878,0x801b87c,0x80223bc,0x80223c0,0x80223c4,0x80223c8,0x8024fec,0x8024ff4]:
    b=raw[a-base:a-base+4];constants.append({'va':f'{a:08x}','bytes':b.hex(),'u32':struct.unpack('<I',b)[0],'float32':struct.unpack('<f',b)[0]})
states=[]
for i in range(8):
    a=struct.unpack_from('<I',raw,0x802f9c8-base+i*4)[0];z=raw.index(0,a-base);states.append(raw[a-base:z].decode())
save('RAW_CONSTANTS.json',{'constants':constants,'state_names':states,'state_pointer_table':'0802f9c8'})
save('ORIGINAL_INSTRUCTION_BYTES.json',{'note':'Original bytes bound to retained addresses; only BL destinations are independently decoded, not every mnemonic.','instructions':bound})
save('RAW_BL_VERIFICATION.json',{'branch_count':len(branches),'mismatch_count':sum(not v['match'] for v in branches),'branches':branches})
save('CALLBACK_BYTE_VERIFICATION.json',{'instruction_records':cb_records,'mismatches':cb_errors,'sources':cb,'read_only_changes_discarded':True})
summary={'binary_matches':True,'source_hash_checks':len(ledger['sources'])*2,'source_hash_errors':errors,'retained_instruction_records':len(bound),'independently_decoded_BL':len(branches),'BL_mismatches':sum(not v['match'] for v in branches),'callback_instruction_byte_checks':cb_records,'callback_byte_errors':cb_errors,'scope':'Static evidence validation. Does not execute target or prove device behavior.'}
save('VALIDATION.json',summary);print(json.dumps(summary))
assert not errors and not cb_errors and not summary['BL_mismatches']
