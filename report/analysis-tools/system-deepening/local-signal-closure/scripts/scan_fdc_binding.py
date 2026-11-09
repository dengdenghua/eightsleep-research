"""Bounded normal-entry inventory; reads bytes only, never executes the target."""
from pathlib import Path
import json,struct,hashlib
O=Path(__file__).resolve().parents[1];R=O.parents[2]
p=R/'mediatek/rootfs-selected/opt/eight/lib/subsystem_updates/firmware-sensor-g0-usb.bbin';b=p.read_bytes();base=0x8010000
from validate_evidence import thumb_bl
out=[]
for target in [0x80240e4,0x801df84,0x801e1e8]:
 calls=[]
 for off in range(128,len(b)-3,2):
  h1,h2=struct.unpack_from('<HH',b,off)
  if h1&0xf800==0xf000 and h2&0xd000==0xd000 and thumb_bl(base+off,b[off:off+4])==target:
   calls.append({'file_offset':off,'va':hex(base+off),'raw_hex':b[off:off+4].hex()})
 ptr=[]
 for value in (target,target|1):
  pattern=struct.pack('<I',value);at=0
  while True:
   at=b.find(pattern,at)
   if at<0:break
   ptr.append({'file_offset':at,'va':hex(base+at),'value':hex(value),'alignment':at%4});at+=1
 out.append({'entry':hex(target),'thumb_BL_encoding_candidates':calls,'literal_u32_address_occurrences':ptr})
res={'input_sha256':hashlib.sha256(b).hexdigest(),'input_bytes':len(b),'base':hex(base),'scan':'all halfword-aligned 32-bit Thumb BL encodings from BBIN offset128; all byte-aligned literal32 entry and entry|1 patterns across full BBIN','entries':out,'limits':['raw pattern candidates are not automatically executable callsites; retained Ghidra exports classify known positive callback literals','original database had no recognized REF_TO for080240e4, but raw scan found two BL sites08025746/08025754 in undefined0802572c; must recover/classify this caller before any reachability conclusion','init08023d28 installs low-level I2C completion0801df84, not the high-level080240e4 processing function','only binding inventory; no firmware execution and no malformed input']}
(O/'FDC_BINDING_SCAN.json').write_text(json.dumps(res,ensure_ascii=False,indent=2)+'\n');print(json.dumps(out))
