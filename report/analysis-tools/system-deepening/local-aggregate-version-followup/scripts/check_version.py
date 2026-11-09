#!/usr/bin/env python3
"""Original-byte verification and a bounded model of the identified version path."""
import hashlib, json, re, struct
from pathlib import Path
O=Path(__file__).resolve().parents[1]
R=O.parents[2]
relative='mediatek/rootfs-selected/opt/eight/bin/frankenfirmware'
b=(R/relative).read_bytes()
expected='84727b57ef8b226c78618f9fa9257df7d8ae771c78d8a51e6f3cabf0acc0c375'
assert hashlib.sha256(b).hexdigest()==expected
h=struct.unpack_from('<16sHHIQQQIHHHHHH',b)
loads=[x for n in range(h[10]) if (x:=struct.unpack_from('<IIQQQQQQ',b,h[5]+n*h[9]))[0]==1]
def offset(a,n):
 v=a-0x100000
 for x in loads:
  if x[3]<=v and v+n<=x[3]+x[5]: return x[2]+v-x[3]
 raise AssertionError(hex(a))
seen={}; branches=occ=0
for p in sorted(O.glob('host-pass*/*.txt')):
 for line in p.read_text().splitlines():
  m=re.match(r'INSN ([0-9a-f]{8}) ([0-9a-f]+) (.*)',line)
  if not m: continue
  a=int(m[1],16); bb=bytes.fromhex(m[2]); off=offset(a,len(bb))
  assert b[off:off+len(bb)]==bb,(p,hex(a))
  assert a not in seen or seen[a]==bb
  seen[a]=bb; occ+=1
  direct=re.match(r'(?:b|bl) 0x([0-9a-f]{8})\b',m[3])
  if direct:
   imm=int.from_bytes(bb,'little')&0x3ffffff
   imm-=1<<26 if imm&(1<<25) else 0
   assert a+imm*4==int(direct[1],16)
   branches+=1
validation={'status':'PASS','input':relative,'sha256':expected,'instruction_occurrences':occ,'unique_instructions':len(seen),'unique_bytes':sum(map(len,seen.values())),'direct_branch_targets':branches,'limits':'Instruction identity and direct branch targets; not firmware execution or exhaustive alias proof.'}
(O/'BYTE_VALIDATION.json').write_text(json.dumps(validation,indent=2)+'\n')

class VersionSlice:
 def __init__(self): self.version=0; self.queues=[[],[]]
 def start_firmware(self,rev,side):
  if rev>0x9ff:
   self.queues[side].clear(); self.version=0x82
 def receive(self,side,wire_version):
  # This field is intentionally absent from the identified 64-byte queue record.
  self.queues[side].append({'map':'synthetic','ts':1})
 def snapshot(self): return self.version

cases=[]
def check(name,actual,expected):
 assert actual==expected,(name,actual,expected)
 cases.append({'case':name,'actual':actual,'expected':expected,'status':'PASS'})
s=VersionSlice(); check('constructor',s.snapshot(),0)
s.start_firmware(0x9ff,0); check('below_rev_gate',s.snapshot(),0)
s.start_firmware(0xa00,0); check('rev_gate_equal_a00',s.snapshot(),130)
s.receive(0,0x02); check('wire_02_not_copied',s.snapshot(),130)
s.receive(1,0x82); check('wire_82_not_needed_for_130',s.snapshot(),130)
s.start_firmware(0xa30,0); check('second_mode_also_130',s.snapshot(),130)
check('only_selected_queue_cleared',[len(x) for x in s.queues],[0,1])
s.start_firmware(0xa30,1); check('other_side_setup_same_global_version',s.snapshot(),130)
check('both_selected_in_sequence_clear',[len(x) for x in s.queues],[0,0])
s2=VersionSlice(); s2.receive(0,0x82); check('receive_alone_does_not_initialize_version',s2.snapshot(),0)
check('cbor_unsigned_130',bytes([0x18,130]).hex(),'1882')
(O/'MODEL_RESULTS.json').write_text(json.dumps({'scope':'Finite synthetic transitions for the recovered version and selected-side queue-clear slice. Constructor-only reception is a dependency illustration, not a claimed reachable device lifecycle. No original firmware executed.','cases':cases},indent=2)+'\n')
print(json.dumps({'validation':validation,'finite_cases':len(cases)}))
