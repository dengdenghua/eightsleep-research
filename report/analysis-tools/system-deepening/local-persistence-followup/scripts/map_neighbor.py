from pathlib import Path
import json,hashlib,re,collections
O=Path(__file__).resolve().parents[1];N=O.parent;R=N.parents[1];L=N/'local-accessory-closure';p=R/'analysis/finishable-20261107/accessories-c11/extracted/OTA_KS8S08C010000001_V10211_nRF52832_202602070917/nrf52832_xxaa.bin';n=O/'historical-V10208/nrf52832_xxaa.bin';b=p.read_bytes();v=n.read_bytes();base=0x26000
idx=collections.defaultdict(list)
for i in range(0,len(v)-15,2):idx[v[i:i+16]].append(i)
rows=[]
for a in ['00029840','000298bc','0002b6a8','0002f28c','0003253c','000351d8','000369f8']:
 paths=list(L.glob('keeson*/'+a+'.txt'))+list((O/'k1-scan').glob(a+'.txt'))
 if not paths:continue
 s=max(paths,key=lambda p:p.stat().st_size).read_text();addrs=[int(m[1],16) for line in s.splitlines() if (m:=re.match(r'INSN ([0-9a-f]{8}) ',line))]
 if not addrs:continue
 start=int(a,16);end=max(addrs)+2;cs=collections.Counter()
 for at in range(start,end,2):
  bs=b[at-base:at-base+16]
  for i in idx.get(bs,[]):
   if len(idx[bs])<=2:cs[base+i-at]+=1
 row={'primary_entry':a,'neighbor_candidates':[{'entry':f'{start+d:08x}','matching_windows':c} for d,c in cs.most_common(3)]};rows.append(row);print(row)
(O/'NEIGHBOR_LOCATORS.json').write_text(json.dumps({'primary_sha256':hashlib.sha256(b).hexdigest(),'neighbor_sha256':hashlib.sha256(v).hexdigest(),'scope':'candidate locators, not yet semantic proof','results':rows},indent=2)+'\n')
print('neighbor_vectors',v[:16].hex())
