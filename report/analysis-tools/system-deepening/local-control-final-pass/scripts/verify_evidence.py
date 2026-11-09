"""Read-only verification of retained source and raw firmware evidence."""
from pathlib import Path
import json, re, hashlib, struct
O=Path(__file__).resolve().parents[1]
ledger=json.loads((O/'SOURCE_LEDGER.json').read_text())
firmware=next(x for x in ledger if x['kind']=='original' and x['source'].endswith('.bbin'))
raw=Path(firmware['source']).read_bytes(); base=0x08010000
issues=[]; source_checks=[]
for row in ledger:
    src=Path(row['source']); digest=hashlib.sha256(src.read_bytes()).hexdigest()
    ok=digest==row['sha256']
    if 'copy' in row: ok=ok and hashlib.sha256((O/row['copy']).read_bytes()).hexdigest()==digest
    source_checks.append({'source':row['source'],'match':ok})
    if not ok: issues.append('source: '+str(src))
rows=0; unique={}; bl=[]
pattern=re.compile(r'^(08[0-9a-fA-F]{6}) ([0-9a-fA-F]+) (.+)$')
for folder in ('commands-pass1','consumers-pass2','ranges'):
    for path in sorted((O/folder).glob('*.txt')):
        for ln,line in enumerate(path.read_text().splitlines(),1):
            m=pattern.match(line)
            if not m: continue
            address=int(m[1],16); data=bytes.fromhex(m[2]); actual=raw[address-base:address-base+len(data)]
            rows+=1; unique[address]=data.hex()
            if data!=actual:issues.append(f'bytes: {path.name}:{ln}')
            target=re.fullmatch(r'bl 0x([0-9a-fA-F]+)',m[3])
            if target and len(data)==4:
                h1,h2=struct.unpack('<HH',data)
                s=(h1>>10)&1;j1=(h2>>13)&1;j2=(h2>>11)&1
                i1=1^(j1^s);i2=1^(j2^s)
                off=(s<<24)|(i1<<23)|(i2<<22)|((h1&1023)<<12)|((h2&2047)<<1)
                if s:off-=1<<25
                decoded=address+4+off; wanted=int(target[1],16)
                valid=decoded==wanted
                bl.append({'address':hex(address),'decoded':hex(decoded),'listed':hex(wanted),'match':valid})
                if not valid:issues.append('BL: '+hex(address))
tables=json.loads((O/'RAW_CONSTANTS.json').read_text()); slices=[]
def check_slice(v):
    if isinstance(v,dict):
        if {'address','file_offset','bytes','hex'}<=v.keys():
            a=int(v['address'],16);off=int(v['file_offset'],16)
            ok=a-base==off and raw[off:off+v['bytes']].hex()==v['hex']
            slices.append({'address':v['address'],'bytes':v['bytes'],'match':ok})
            if not ok:issues.append('table: '+v['address'])
        for x in v.values():check_slice(x)
    elif isinstance(v,list):
        for x in v:check_slice(x)
check_slice(tables)
il=json.loads((O/'il/COMMANDS.json').read_text())
for entry in il:
    if entry['exit_code']!=0 or hashlib.sha256((O/entry['output']).read_bytes()).hexdigest()!=entry['sha256']:issues.append('IL: '+entry['output'])
models=json.loads((O/'MODEL_RESULTS.json').read_text())
if not all(c['passed'] for c in models['tests']):issues.append('model')
result={'status':'PASS' if not issues else 'FAIL','firmware_sha256':hashlib.sha256(raw).hexdigest(),'instruction_rows':rows,'unique_instruction_addresses':len(unique),'original_bytes_match':not any(i.startswith('bytes') for i in issues),'independent_BL_count':len(bl),'BL_targets':bl,'raw_table_slices':slices,'source_count':len(source_checks),'source_checks':source_checks,'fresh_IL_type_count':len(il),'finite_model_cases':models['count'],'limitations':['Byte equality and independent BL targets are checked; not a second decoder of every mnemonic.','No target execution, peripheral or flash validation; models are synthetic normal finite contracts.'],'issues':issues}
(O/'VERIFICATION.json').write_text(json.dumps(result,ensure_ascii=False,indent=2)+'\n')
print(json.dumps({k:result[k] for k in ('status','instruction_rows','unique_instruction_addresses','independent_BL_count','source_count','fresh_IL_type_count','finite_model_cases','issues')},ensure_ascii=False))
if issues: raise SystemExit(1)
