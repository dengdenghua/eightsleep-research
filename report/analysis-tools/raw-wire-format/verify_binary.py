#!/usr/bin/env python3
"""Verify retained AArch64 instruction bytes against the frozen ELF, no execution."""
from pathlib import Path
import argparse,hashlib,json,re,struct
ROOT=Path(__file__).resolve().parent
EXPECTED='a93fef74e2bb1d61e36979a9d1997afecf1b4655ebe6190e2887dac95262fe06'
def main():
 p=argparse.ArgumentParser();p.add_argument('binary',type=Path);a=p.parse_args();b=a.binary.read_bytes()
 assert hashlib.sha256(b).hexdigest()==EXPECTED,'unexpected firmware build'
 assert b[:6]==b'\x7fELF\x02\x01' and struct.unpack_from('<H',b,18)[0]==183
 po=struct.unpack_from('<Q',b,32)[0];pe,pn=struct.unpack_from('<HH',b,54);segs=[]
 for i in range(pn):
  t,flags,off,va,pa,fs,ms,align=struct.unpack_from('<IIQQQQQQ',b,po+i*pe)
  if t==1:segs.append((off,va,fs))
 def read(ghidra_va,n):
  va=ghidra_va-0x100000
  for off,start,size in segs:
   if start<=va and va+n<=start+size:return b[off+va-start:off+va-start+n]
  raise ValueError(hex(ghidra_va))
 seen={};files=[]
 for f in sorted(ROOT.glob('*/*.asm')):
  count=0
  for line in f.read_text().splitlines():
   m=re.match(r'^([0-9a-f]{8}) ([0-9a-f]+) ',line)
   assert m,'invalid assembly record'
   va=int(m[1],16);raw=bytes.fromhex(m[2]);assert read(va,len(raw))==raw,f'{f.name}:{va:x}'
   assert len(raw)==4;seen[va]=raw;count+=1
  files.append({'path':str(f.relative_to(ROOT)),'instructions':count,'sha256':hashlib.sha256(f.read_bytes()).hexdigest()})
 probes=list(struct.unpack('<11H',read(0x797072,22)));assert probes==[0,1,6,32,16,32,128,256,512,768,1500]
 assert read(0x27dbc0,12).hex()=='c0008052e1031f2ad7d80694'
 em=json.loads((ROOT/'FLAGS_EMULATION.json').read_text());assert em['binary_sha256']==EXPECTED and em['result']=='PASS' and em['total']==28
 production=next(c for c in em['cases'] if c['level']==6 and not c['header_enabled']);assert production['flags']==0x80
 result={'result':'PASS','binary_sha256':EXPECTED,'image_base':'0x00100000','unique_instructions_verified':len(seen),'instruction_bytes_verified':len(seen)*4,'assembly_files':files,'probe_table_va':'0x00797072','probe_table':probes,'production_flags':128,'zlib_header_bit_set':False,'adler32_bit_set':False,'scope':'Exact exported instruction bytes plus source-bound emulation receipt. Not full compressor or live transport validation.'}
 (ROOT/'BINARY_VERIFICATION.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps({k:v for k,v in result.items() if k!='assembly_files'}))
if __name__=='__main__':main()
