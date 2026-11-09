"""Verify preserved exports, original code regions and selected Thumb/float32 facts."""
from pathlib import Path
import argparse,hashlib,json,struct
HERE=Path(__file__).resolve().parent
p=argparse.ArgumentParser()
p.add_argument('--firmware',type=Path,default=Path('/Users/dangbei/Downloads/eightsleep-firmware-research-20261107/mediatek/rootfs-selected/opt/eight/lib/subsystem_updates/firmware-frozen.bbin'))
a=p.parse_args();m=json.loads((HERE/'SOURCE_MANIFEST.json').read_text())
d=a.firmware.read_bytes();base=int(m['mapping_base'],16)
assert len(d)==m['sample_bytes'] and hashlib.sha256(d).hexdigest()==m['sample_sha256']
for src in m['sources']:
 b=(HERE/src['copy']).read_bytes();assert len(b)==src['bytes'] and hashlib.sha256(b).hexdigest()==src['sha256']
for region in m['code_regions']:
 off=int(region['start'],16)-base;b=d[off:off+region['bytes']]
 assert b.hex()==region['hex'] and hashlib.sha256(b).hexdigest()==region['sha256']
for c in m['instruction_checks']:
 addr=int(c['address'],16);raw=bytes.fromhex(c['hex']);assert d[addr-base:addr-base+len(raw)]==raw
 w=struct.unpack_from('<H',raw)[0];kind=c['kind']
 if kind=='thumb_word_memory':
  assert w&0xf800==(0x6800 if c['op']=='ldr' else 0x6000)
  assert (w&7,(w>>3)&7,((w>>6)&31)*4)==(c['rt'],c['rn'],c['offset'])
 elif kind=='thumb_bl':
  h1,h2=struct.unpack('<HH',raw);assert h1&0xf800==0xf000 and h2&0xd000==0xd000
  s=(h1>>10)&1;j1=(h2>>13)&1;j2=(h2>>11)&1
  off=s<<24|((j1^s)^1)<<23|((j2^s)^1)<<22|(h1&0x3ff)<<12|(h2&0x7ff)<<1
  if s:off-=1<<25
  assert addr+4+off==int(c['target'],16)
 elif kind=='thumb_b_cond':
  assert w&0xff00==0xd000|(c['condition']<<8);off=w&255
  if off&128:off-=256
  assert addr+4+2*off==int(c['target'],16)
 elif kind=='thumb_b':
  assert w&0xf800==0xe000;off=w&0x7ff
  if off&0x400:off-=0x800
  assert addr+4+2*off==int(c['target'],16)
 else:raise AssertionError(kind)
for c in m['float32_constants']:
 off=int(c['address'],16)-base;raw=d[off:off+4]
 assert raw.hex()==c['hex'] and struct.unpack('<f',raw)[0]==c['float32']
result={'result':'PASS','sample_sha256':m['sample_sha256'],'sources_verified':len(m['sources']),'code_regions_verified':len(m['code_regions']),'instructions_independently_decoded':len(m['instruction_checks']),'float32_constants_verified':len(m['float32_constants']),'scope':m['scope']}
(HERE/'BYTE_VERIFICATION.json').write_text(json.dumps(result,ensure_ascii=False,indent=2)+'\n')
print(json.dumps(result,ensure_ascii=False))
