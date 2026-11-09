#!/usr/bin/env python3
"""Rebind the historical literal-field candidates to raw Thumb-1 bytes.
Only selected opcode forms are decoded; other cases stay unresolved.
"""
import re,json,hashlib,collections
from pathlib import Path
HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[2];DEEP=ROOT/'report/analysis-tools/system-deepening'
FIRM=ROOT/'materials/eightsleep-full-evidence-20261107/firmware/mtk/rootfs/files/opt/eight/lib/subsystem_updates'
LIT=re.compile(r'^INSN ([0-9a-f]{8}) (\w+) ldr r(\d),\[0x([0-9a-f]{8})\] REF\[READ:([0-9a-f]{8})=([0-9a-f]+)\]',re.M)
MEM=re.compile(r'\[(r\d),r(\d)(?:,#0x[0-9a-f]+)?\]')
ROW=re.compile(r'^INSN ([0-9a-f]{8}) ([0-9a-f]{4,8})(?=\s|$)(.*)$',re.M)
ledger=json.loads((DEEP/'literal-field-access/FIELD_ACCESS_LEDGER.json').read_text());expected={f['export']:f for f in ledger['functions']}
def sha(b):return hashlib.sha256(b).hexdigest()
def raw(w):b=bytes.fromhex(w);return b if len(b)==2 else b[:2]+b[2:][::-1]
images=[('g0',FIRM/'firmware-sensor-g0.bbin',0x08008000),('g0-usb',FIRM/'firmware-sensor-g0-usb.bbin',0x08010000),('legacy',FIRM/'firmware-sensor-legacy.bbin',0x08005000),('sensor',FIRM/'firmware-sensor.bbin',0x08005000),('pillow',FIRM/'firmware-pillow.bbin',0x08008000)]
loaded=[(name,p.read_bytes(),base) for name,p,base in images]
def at(b,base,addr,n):i=addr-base;return b[i:i+n] if 0<=i and i+n<=len(b) else None
ops=['str','strh','strb','ldrsb','ldr','ldrh','ldrb','ldrsh']
def check_site(b,base,loadva,lraw,reg,litva,value,useva,uraw,base_reg):
 l=at(b,base,loadva,len(lraw));u=at(b,base,useva,len(uraw));v=at(b,base,litva,4)
 flags={'load_bytes_match':l==lraw,'use_bytes_match':u==uraw,'literal_value_match':v is not None and int.from_bytes(v,'little')==value}
 decoded={}
 if l and len(lraw)==2:
  h=int.from_bytes(l,'little');decode_load=(h&0xf800)==0x4800
  decoded['literal_opcode_supported']=decode_load
  if decode_load:
   decoded.update(literal_address=hex(((loadva+4)&~3)+(h&255)*4),loaded_reg='r'+str((h>>8)&7))
   flags['literal_address_and_register_match']=int(decoded['literal_address'],16)==litva and decoded['loaded_reg']==reg
 if u and len(uraw)==2:
  h=int.from_bytes(u,'little');supported=(h&0xf000)==0x5000;decoded['consumer_opcode_supported']=supported
  if supported:
   decoded.update(operation=ops[(h>>9)&7],base_reg='r'+str((h>>3)&7),offset_reg='r'+str((h>>6)&7),value_reg='r'+str(h&7))
   flags['consumer_registers_match']=decoded['base_reg']==base_reg and decoded['offset_reg']==reg
 required=['load_bytes_match','use_bytes_match','literal_value_match','literal_address_and_register_match','consumer_registers_match']
 compatible=all(flags.get(k,False) for k in required)
 status=('exact_adjacent_access' if useva==loadva+2 else 'matching_nonadjacent_requires_dataflow') if compatible else 'unbound_or_mismatching_site'
 return {'status':status,'flags':flags,'decoded':decoded,'actual_literal_word':None if v is None else hex(int.from_bytes(v,'little'))}
records=[];sources=[]
for name,fn in sorted(expected.items()):
 p=DEEP/name;text=p.read_text();sources.append({'path':name,'sha256':sha(p.read_bytes())});count=0
 for m in LIT.finditer(text):
  value=int(m[6],16)
  if value>=0x3e88:continue
  tail=text[m.start():m.start()+400];mm=MEM.search(tail)
  if not(mm and mm[2]==m[3]):continue
  # Locate the actual INSN row that contains the first matched register access.
  use=next((z for z in ROW.finditer(tail) if z.start()<=mm.start()<z.end()),None)
  assert use,(name,tail)
  lv=int(m[1],16);uv=int(use[1],16);lr=raw(m[2]);ur=raw(use[2]);reg='r'+m[3]
  per={n:check_site(b,base,lv,lr,reg,int(m[4],16),value,uv,ur,mm[1]) for n,b,base in loaded}
  records.append({'export':name,'literal_load':hex(lv),'literal_address':hex(int(m[4],16)),'offset':hex(value),'consumer':hex(uv),'exported_load_bytes':lr.hex(),'exported_consumer_bytes':ur.hex(),'textual_base_reg':mm[1],'offset_reg':reg,'historical_object_heuristic':fn['bound'],'images':per,'scope':'local instruction/literal compatibility; does not prove report-object base identity'})
  count+=1
 assert count==fn['accesses'],(name,count,fn['accesses'])
assert len(records)==2609
counts={n:dict(collections.Counter(x['images'][n]['status'] for x in records)) for n,_,_ in loaded}
dedup={}
for x in records:
 key=(x['literal_load'],x['consumer'],x['offset']);dedup.setdefault(key,x)
focus={}
for lo,hi in [(0x234,0x258),(0x1c08,0x1c0c),(0x27c,0x2a0),(0x3e01,0x3e08)]:
 rs=[x for x in records if lo<=int(x['offset'],16)<hi]
 focus[f'{lo:04x}..{hi:04x}']={'historical_records':len(rs),'g0_local_counts':dict(collections.Counter(x['images']['g0']['status'] for x in rs)),'g0_usb_local_counts':dict(collections.Counter(x['images']['g0-usb']['status'] for x in rs)),'records':rs}
result={'schema':'eightsleep.field-sites.byte-binding.v1','records':records,'counts':counts,'unique_literal_consumer_offset_triples':len(dedup),'frozen_g0_distinct_adjacent_sites':len({(x['literal_load'],x['consumer'],x['offset']) for x in records if x['images']['g0']['status']=='exact_adjacent_access'}),'sources':sources,'images':[{'name':name,'path':str(p.relative_to(ROOT)),'base':hex(base),'sha256':sha(p.read_bytes())} for name,p,base in images],'focus_holes':focus,'limitations':['Historical object heuristic (two covered offsets per export) is not object pointer identity.','Exact adjacent access proves a local constant-offset register memory operation, not field meaning or the main object.','Nonadjacent matching needs intervening register/control-flow analysis; no Thumb-2/new opcode inference is made.','Five explicitly based images are tested here; the attribution audit has a broader nine-image base search.']}
(HERE/'FIELD_SITE_AUDIT.json').write_text(json.dumps(result,ensure_ascii=False,indent=2)+'\n')
print(json.dumps({'records':len(records),'unique_triples':len(dedup),'counts':counts,'focus':{k:{kk:vv for kk,vv in v.items() if kk!='records'} for k,v in focus.items()}},ensure_ascii=False,indent=2))
