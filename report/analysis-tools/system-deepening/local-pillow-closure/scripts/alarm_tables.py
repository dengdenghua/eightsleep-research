#!/usr/bin/env python3
import struct,json,hashlib
from pathlib import Path
O=Path(__file__).resolve().parents[1];R=O.parents[2];b=(R/'mediatek/rootfs-selected/opt/eight/lib/subsystem_updates/firmware-pillow.bbin').read_bytes()
assert hashlib.sha256(b).hexdigest()=='1344d170a6c74f0aa0e38195b89d687ea9f69105980db0a83ddb5e3ee68661d1'
reads=[]
def addr(a,n):
 flash=a-0x20000200+0x801dc4c if 0x20000200<=a<0x20000620 else a
 x=b[flash-0x8008000:flash-0x8008000+n];assert len(x)==n
 reads.append({'logical_va':hex(a),'flash_va':hex(flash),'file_offset':flash-0x8008000,'bytes_hex':x.hex()});return x
def u(a):return struct.unpack('<I',addr(a,4))[0]
rows=[]
for pattern in range(7):
 a=u(0x801db60+pattern*4);count,amp,transform,array=struct.unpack('<4I',addr(a,16));ph=[]
 for i in range(count):
  ptr=u(array+i*4);n,dur,sp=struct.unpack('<3I',addr(ptr,12));ph.append({'descriptor':hex(ptr),'repeat_interval':dur,'step_count':n,'steps':[list(struct.unpack('<IBBBB',addr(sp+j*8,8))) for j in range(n)]})
 rows.append({'pattern':pattern,'descriptor':hex(a),'amplitude':hex(amp),'transform':hex(transform),'phases':ph})
(O/'ALARM_TABLES.json').write_text(json.dumps({'source':'BBIN startup data mapping, not runtime RAM','patterns':rows,'raw_reads':reads},indent=2)+'\n')
