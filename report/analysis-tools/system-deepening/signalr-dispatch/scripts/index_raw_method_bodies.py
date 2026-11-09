"""Index exported IL method ranges against their original PE bytes, without loading target code.
This checks headers and size consistency, not an independent re-disassembly of IL operands.
"""
from pathlib import Path
import struct,re,json,hashlib
B=Path(__file__).resolve().parents[1]
R=B.parents[2]
def sha(x):return hashlib.sha256(x).hexdigest()
def sections(data):
 pe=struct.unpack_from('<I',data,0x3c)[0]
 assert data[pe:pe+4]==b'PE\0\0'
 n=struct.unpack_from('<H',data,pe+6)[0];opts=struct.unpack_from('<H',data,pe+20)[0]
 start=pe+24+opts
 result=[]
 for i in range(n):
  p=start+40*i;vs,va,rs,raw=struct.unpack_from('<IIII',data,p+8)
  result.append((va,vs,rs,raw))
 return result
def offset(sec,rva,n):
 for va,vs,rs,raw in sec:
  if va<=rva and rva+n<=va+rs:return raw+rva-va
 raise ValueError(f'RVA {rva:x} not file backed for {n} bytes')
results=[]
for commandfile in sorted(B.glob('EXPORT_COMMANDS*.json')):
 for e in json.loads(commandfile.read_text())['exports']:
  il=B/e['output']
  if not il.name.endswith('.il.txt'):continue
  source=Path(e['command'][-1]);data=source.read_bytes();sec=sections(data)
  assert sha(data)==e['input_sha256'];assert sha(il.read_bytes())==e['output_sha256']
  lines=il.read_text().splitlines();current=None;methods=[]
  for no,line in enumerate(lines,1):
   m=re.search(r'Method begins at RVA 0x([0-9a-f]+)',line)
   if m:
    assert current is None
    current={'rva':int(m[1],16),'il_header_line':no};continue
   if current is None:continue
   m=re.search(r'Header size: (\d+)',line)
   if m:current['declared_header_bytes']=int(m[1])
   m=re.search(r'Code size: (\d+)',line)
   if m:current['declared_code_bytes']=int(m[1])
   m=re.search(r'end of method (.*)',line)
   if m:
    current['method']=m[1];current['il_end_line']=no
    p=offset(sec,current['rva'],1);first=data[p]
    if first&3==2:header=1;size=first>>2
    elif first&3==3:header=(struct.unpack_from('<H',data,p)[0]>>12)*4;size=struct.unpack_from('<I',data,p+4)[0]
    else:raise ValueError(f'bad method header {p:x}')
    assert header==current['declared_header_bytes'];assert size==current['declared_code_bytes']
    offset(sec,current['rva'],header+size)
    current.update({'pe_file_offset':p,'header_sha256':sha(data[p:p+header]),'code_sha256':sha(data[p+header:p+header+size]),'header_and_code_sha256':sha(data[p:p+header+size]),'range_size_consistent':True})
    methods.append(current);current=None
  assert current is None
  results.append({'il_file':str(il.relative_to(B)),'il_sha256':sha(il.read_bytes()),'assembly':str(source),'assembly_sha256':sha(data),'methods':methods,'method_count':len(methods)})
report={'schema':'eightsleep.signalr.raw-method-ranges.v1','verification_boundary':'Original PE headers/code ranges are hashed and sizes checked against ILSpy export; not an independent byte-for-byte verification of IL operand decoding. No assembly execution.','all_ranges_consistent':True,'exported_method_count':sum(x['method_count'] for x in results),'assemblies':results}
(B/'RAW_METHOD_RANGES.json').write_text(json.dumps(report,ensure_ascii=False,indent=2)+'\n')
print(json.dumps({'all_ranges_consistent':True,'exported_method_count':report['exported_method_count']}))
