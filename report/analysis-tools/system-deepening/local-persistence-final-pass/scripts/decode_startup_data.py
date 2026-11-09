"""Reimplementation of bounded normal data decompression at 26580, not target execution."""
from pathlib import Path
import struct,json,hashlib
O=Path(__file__).resolve().parents[1]
def decode(b,outlen):
 p=0;o=bytearray();trace=[]
 while len(o)<outlen:
  start=p;before=len(o);tag=b[p];p+=1;lit=tag&7
  if lit==0:lit=b[p];p+=1
  run=tag>>4
  if run==0:run=b[p];p+=1
  assert lit>=1
  o.extend(b[p:p+lit-1]);p+=lit-1
  if tag&8:
   off=b[p];p+=1;assert off and off<=len(o)
   for _ in range(run+2):o.append(o[-off])
   kind='backref'
  else:o.extend(bytes(run));kind='zero'
  trace.append({'input_start':start,'input_end':p,'output_start':before,'output_end':len(o),'literal_bytes':lit-1,'run_kind':kind,'run_bytes':run+(2 if tag&8 else 0)})
  assert len(o)<=outlen
 return bytes(o),p,trace
# Small normal tokens: literals+zeros; overlapping distance-one back-reference.
assert decode(bytes([0x23])+b'AB',4)[0]==b'AB\0\0'
assert decode(bytes([0x1a])+b'Z'+bytes([1]),4)[0]==b'ZZZZ'
i=json.loads((O/'INPUTS.json').read_text())[0];b=Path(i['path']).read_bytes();table=struct.unpack_from('<8I',b,0x37b68-0x26000)
src,dst,n,helper=table[:4];assert helper==0x26580
out,consumed,trace=decode(b[src-0x26000:],n);(O/'startup-data.bin').write_bytes(out)
ranges={'record':[0x20003c68,0x20003c88],'position_flash':[0x75000,0x78000],'fstorage_primary':[0x20003748,0x2000375c]};hits=[]
for off in range(len(out)-3):
 v=struct.unpack_from('<I',out,off)[0]
 for name,(lo,hi) in ranges.items():
  if lo<=v<hi:hits.append({'ram_address':f'{dst+off:08x}','value':f'{v:08x}','range':name,'aligned4':off%4==0})
objects=[]
for a in [0x20003748,0x2000375c]:
 off=a-dst;objects.append({'base':f'{a:08x}','words':[f'{x:08x}' for x in struct.unpack_from('<5I',out,off)]})
r={'input_sha256':i['sha256'],'startup_table_address':'00037b68','startup_table_words':[f'{x:08x}' for x in table],'decoder':'00026580 finite reconstruction; no firmware execution','source':'00037d3c','compressed_bytes_consumed':consumed,'output_base':f'{dst:08x}','output_bytes':len(out),'output_sha256':hashlib.sha256(out).hexdigest(),'small_normal_cases':2,'fstorage_initial_objects':objects,'address_hits':hits,'tokens':trace,'limits':['Initial .data only; not later runtime RAM. BSS zero helper is a separate entry.','Small normal-token checks are not proof of all compressed-input behavior.']}
(O/'STARTUP_DATA.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps({k:v for k,v in r.items() if k!='tokens'},indent=2))
