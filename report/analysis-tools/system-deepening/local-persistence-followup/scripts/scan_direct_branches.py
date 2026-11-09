from pathlib import Path
import json
O=Path(__file__).resolve().parents[1];inputs=json.loads((O/'INPUTS.json').read_text());out=[]
for x in inputs:
 if x['family']=='trimix':continue
 b=Path(x['path']).read_bytes();base=int(x['mapping_base'],16);target=0x3253c if x['family']=='keeson' else 0x326c0;hits=[]
 for i in range(0,len(b)-3,2):
  a=int.from_bytes(b[i:i+2],'little');c=int.from_bytes(b[i+2:i+4],'little');kind=None;off=None
  if a&0xf800==0xf000 and c&0xd000 in [0xd000,0x9000]:
   kind='BL' if c&0xd000==0xd000 else 'B.W';s=(a>>10)&1;j1=(c>>13)&1;j2=(c>>11)&1
   off=(s<<24)|((1^(j1^s))<<23)|((1^(j2^s))<<22)|((a&1023)<<12)|((c&2047)<<1)
   if s:off-=1<<25
  elif a&0xf800==0xe000:
   kind='B16';off=(a&2047)<<1
   if off&2048:off-=4096
  if off is not None and base+i+4+off==target:hits.append({'address':f'{base+i:08x}','kind':kind,'bytes':b[i:i+(2 if kind=='B16' else 4)].hex()})
 out.append({'family':x['family'],'target':f'{target:08x}','candidates':hits})
(O/'DIRECT_BRANCH_SCAN.json').write_text(json.dumps({'scope':'Raw halfword-aligned BL/B.W/unconditional16B candidates to write wrapper. Candidate scan includes undecoded regions and possible data coincidences; no arbitrary computed-call proof.','results':out},indent=2)+'\n')
print([(r['family'],len(r['candidates'])) for r in out])
