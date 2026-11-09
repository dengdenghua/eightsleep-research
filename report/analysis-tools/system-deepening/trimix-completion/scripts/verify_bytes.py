#!/usr/bin/env python3
import argparse,hashlib,json,re
from pathlib import Path
O=Path(__file__).resolve().parents[1]
def digest(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def branch32(address, raw, mnemonic):
    h1, h2 = int.from_bytes(raw[:2], "little"), int.from_bytes(raw[2:], "little")
    assert h1 & 0xF800 == 0xF000
    assert h2 & 0xD000 == (0xD000 if mnemonic == "bl" else 0x9000)
    s = h1 >> 10 & 1
    i1, i2 = 1 ^ ((h2 >> 13 & 1) ^ s), 1 ^ ((h2 >> 11 & 1) ^ s)
    displacement = s << 24 | i1 << 23 | i2 << 22 | (h1 & 1023) << 12 | (h2 & 2047) << 1
    if s:
        displacement -= 1 << 25
    return (address + 4 + displacement) & 0xFFFFFFFF
def main():
 ap=argparse.ArgumentParser();ap.add_argument('--research-root',type=Path,default=O.parents[2]);a=ap.parse_args();R=a.research_root
 inp=json.loads((O/'INPUTS.json').read_text());payload=R/inp['payload_path'];package=R/'mediatek/rootfs-selected/opt/eight/firmware/8Sleep_H6_SW-V25-2025-07-24.bin'
 raw=payload.read_bytes();outer=package.read_bytes();assert digest(payload)==inp['sha256'] and raw==outer[128:];base=int(inp['mapping_base'],16)
 totals={'instruction_occurrences':0,'instruction_bytes':0,'literal_occurrences':0,'branch32_occurrences':0};seen={};files=[]
 for p in sorted(O.glob('pass*/*.txt')):
  count=0
  for line in p.read_text().splitlines():
   m=re.match(r'INSN ([0-9a-f]{8}) ([0-9a-f]+) (.*)',line)
   if not m:continue
   address=int(m[1],16);b=bytes.fromhex(m[2]);off=address-base
   assert 0<=off<=len(raw)-len(b) and raw[off:off+len(b)]==b and outer[off+128:off+128+len(b)]==b,(p.name,m[1])
   if address in seen:assert seen[address]==b
   seen[address]=b;count+=1;totals['instruction_occurrences']+=1;totals['instruction_bytes']+=len(b)
   for x,v in re.findall(r'REF\[READ:([0-9a-f]{8})=([0-9a-f]+)\]',m[3]):
    lo=int(x,16)-base
    if 0<=lo<=len(raw)-4:
     assert int.from_bytes(raw[lo:lo+4],'little')==int(v,16);totals['literal_occurrences']+=1
   target=re.match(r'(bl|b\.w) 0x([0-9a-f]{8})\b',m[3])
   if target:assert branch32(address,b,target[1])==int(target[2],16);totals['branch32_occurrences']+=1
  files.append({'path':str(p.relative_to(O)),'instruction_occurrences':count,'sha256':digest(p)})
 out={'status':'PASS','scope':'Original payload/package byte identity and direct branch arithmetic; no target execution, hardware measurement or full-firmware coverage','totals':totals,'unique_instructions':len(seen),'unique_instruction_bytes':sum(map(len,seen.values())),'files':files,'inputs':[{'path':str(f.relative_to(R)),'bytes':f.stat().st_size,'sha256':digest(f)} for f in (payload,package)]}
 (O/'BYTE_VALIDATION.json').write_text(json.dumps(out,ensure_ascii=False,indent=2)+'\n')
 prior=[{'root':'research','path':rel,'bytes':(R/rel).stat().st_size,'sha256':digest(R/rel)} for rel in inp.get('prior_evidence',[])]
 sources=[{'root':'trimix-completion','path':str(f.relative_to(O)),'bytes':f.stat().st_size,'sha256':digest(f)} for f in sorted(O.rglob('*')) if f.is_file() and f.name!='SOURCE_MANIFEST.json' and '__pycache__' not in f.parts]
 (O/'SOURCE_MANIFEST.json').write_text(json.dumps({'self_excluded':True,'files':sources,'original_inputs':out['inputs'],'prior_evidence':prior},ensure_ascii=False,indent=2)+'\n')
 print(json.dumps({'status':'PASS',**totals,'unique_instructions':len(seen)}))
if __name__=='__main__':main()
