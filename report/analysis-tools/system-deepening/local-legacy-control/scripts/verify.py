from pathlib import Path
import hashlib,json,re
O=Path(__file__).resolve().parents[1]
raw=json.loads((O/'RAW_TABLES.json').read_text());src=json.loads((O/'SOURCE_INDEX.json').read_text());counts={}
for v,meta in raw.items():
 b=Path(meta['original']).read_bytes();assert hashlib.sha256(b).hexdigest()==meta['sha256'];n=0
 for span in meta['raw_spans']:assert b[span['offset']:span['offset']+span['length']].hex()==span['hex']
 for folder in [O/'sources'/v,O/('new'+v)]:
  for p in folder.rglob('*.txt'):
   for line in p.read_text().splitlines():
    m=re.match(r'INSN ([0-9a-f]{8}) ([0-9a-f]+) ',line)
    if not m:m=re.match(r'([0-9a-f]{8}) .*? BYTES ([0-9a-f]+)',line)
    if not m:continue
    addr=int(m[1],16);data=bytes.fromhex(m[2]);off=addr-0x8005000
    assert b[off:off+len(data)]==data,(p,line);n+=1
 counts[v]=dict(instruction_rows_matched=n,table_spans_matched=len(meta['raw_spans']))
for s in src:
 a=Path(s['source']).read_bytes();b=(O/s['copy']).read_bytes()
 assert hashlib.sha256(a).hexdigest()==s['sha256'] and a==b
result=dict(status='passed',copied_sources_unchanged=len(src),versions=counts,model=json.loads((O/'MODEL_RESULTS.json').read_text())['count'],vendor_execution=False,device_requests=False,scope='retained instruction bytes, referenced raw tables, unchanged source copies, analyst normal models; no real hardware claim')
(O/'VALIDATION.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(result,indent=2))
