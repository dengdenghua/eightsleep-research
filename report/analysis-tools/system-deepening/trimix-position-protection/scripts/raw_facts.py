#!/usr/bin/env python3
"""Check fixed original-byte vector/table facts; do not execute firmware."""
import hashlib, json, struct
from pathlib import Path
O=Path(__file__).resolve().parents[1]
R=O.parents[2]
info=json.loads((O/'INPUTS.json').read_text())
p=R/info['payload_path']
q=R/'mediatek/rootfs-selected/opt/eight/firmware/8Sleep_H6_SW-V25-2025-07-24.bin'
b=p.read_bytes(); outer=q.read_bytes(); base=int(info['mapping_base'],16)
assert hashlib.sha256(b).hexdigest()==info['sha256'] and b==outer[128:]
vectors=[]
expected={22:0x08018f3e,23:0x08018eec,24:0x08018eae,25:0x08018e6e,
          27:0x08018cfe,44:0x08018db2,60:0x08018e34,66:0x08018dd6,70:0x08018df0}
for slot,target in expected.items():
    offset=slot*4; value=struct.unpack_from('<I',b,offset)[0]
    assert value==target+1 and outer[128+offset:132+offset]==b[offset:offset+4]
    vectors.append({'slot':slot,'irq_number_if_arm_vector_layout':slot-16,'va':f'{base+offset:08x}',
        'payload_offset':offset,'outer_offset':offset+128,'bytes':b[offset:offset+4].hex(),
        'stored_thumb_pointer':f'{value:08x}','target':f'{target:08x}'})
# TBB uses PC=instruction address+4; each unsigned table byte scales by two.
table_va=0x08009f66; off=table_va-base; table=b[off:off+4]
assert table.hex()=='02143a27'
destinations=[0x08009f6a,0x08009f8e,0x08009fda,0x08009fb4]
switch=[]
for i,(v,t) in enumerate(zip(table,destinations)):
    assert table_va+v*2==t
    switch.append({'argument':i,'entry_va':f'{table_va+i:08x}',
       'outer_offset':off+i+128,'byte':v,'target':f'{t:08x}'})
out={'status':'PASS','original_package':{'path':str(q.relative_to(R)),
       'bytes':len(outer),'sha256':hashlib.sha256(outer).hexdigest()},
     'payload':{'path':str(p.relative_to(R)),'bytes':len(b),'sha256':hashlib.sha256(b).hexdigest()},
     'header_bytes':128,'header_sha256':hashlib.sha256(outer[:128]).hexdigest(),
     'mapping':'VA=0x08008000+payload_offset; original_offset=payload_offset+128',
     'vectors':vectors,'position_update_tbb':switch,
     'not_proven':'Vector bytes do not establish runtime NVIC enablement, physical pin function, edge rate, or mechanics.'}
(O/'RAW_FACTS.json').write_text(json.dumps(out,ensure_ascii=False,indent=2)+'\n')
print('PASS: 9 vector entries, 4 TBB entries, outer[128:]==payload')
