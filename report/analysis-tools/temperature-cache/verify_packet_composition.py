#!/usr/bin/env python3
"""Compose the queue/getter and packet-builder bounded models; record that
producer calls are still summarized, not one end-to-end vendor execution."""
from pathlib import Path
import runpy,contextlib,io,json,hashlib,struct
HERE=Path(__file__).resolve().parent
packet_script=HERE.parent/'state-output-chain/verify_packet.py';packet_receipt=packet_script.parent/'PACKET_VERIFICATION.json';prior=hashlib.sha256(packet_receipt.read_bytes()).hexdigest()
with contextlib.redirect_stdout(io.StringIO()):
 cmod=runpy.run_path(str(HERE/'verify_cache.py'));pmod=runpy.run_path(str(packet_script))
assert hashlib.sha256(packet_receipt.read_bytes()).hexdigest()==prior
CPU=cmod['CPU'];bits=cmod['bits'];flt=cmod['flt'];C=cmod['CBASE'];QB=cmod['QBASE'];cpu=CPU()
inputs=[[20,20],[30],[-100],[2,60],[],[61,59],[float('nan'),25],[10,-100]]
for slot,vs in enumerate(inputs):
 q=C+64+20*slot
 for off,v in [(0,QB+slot*256),(4,10),(8,4),(12,0),(16,0)]:cpu.put(q+off,v)
 for x in vs:
  cpu.put(0x20070000,bits(x));cpu.run(0x0801d6c0,[C,slot,0x20070000])
words=[];snapshots=[]
for slot in range(8):
 q=C+64+20*slot;before=cmod['items'](cpu,q);w=cpu.run(0x0801ecdc,[C,slot]);assert cmod['items'](cpu,q)==before;words.append(w);snapshots.append({'slot':slot,'input_words':[hex(x) for x in before],'output_word':hex(w)})
assert [flt(x) for x in words]==[20,30,-100,31,-100,59,25,10]
first=bits(1);tail=[bits(2),bits(3),bits(4)];packet,_,_=pmod['run'](first,words,tail,1);expected=b'\x3d\x00\x01'+struct.pack('>12I',first,*words,*tail);assert packet==expected
# Re-read with no pushes: rolling content and all eight outputs remain the same.
second=[cpu.run(0x0801ecdc,[C,i]) for i in range(8)];assert words==second
# Getter index8 is a raw field path, not this averaging route.
cpu.put(C+8*4,0x7fc00000);assert cpu.run(0x0801ecdc,[C,8])==0x7fc00000
r={'result':'PASS','models':[{'path':str(HERE/'verify_cache.py'),'sha256':hashlib.sha256((HERE/'verify_cache.py').read_bytes()).hexdigest()},{'path':str(packet_script),'sha256':hashlib.sha256(packet_script.read_bytes()).hexdigest()}],'cache_outputs':snapshots,'packet_hex':packet.hex(),'packet_bytes':len(packet),'repeat_without_push_same_outputs':True,'index8_raw_bypass_verified':True,'scope':'Composition of separately byte-interpreted models. Packet getter call uses precomputed getter results; not a single firmware run, no hardware/time/interleaving observation.'}
# Store package-relative paths, not workstation absolute paths.
for x in r['models']:x['path']=str(Path(x['path']).relative_to(HERE.parent))
(HERE/'PACKET_COMPOSITION.json').write_text(json.dumps(r,ensure_ascii=False,indent=2)+'\n');print('PASS 8 queue outputs -> 51-byte packet; repeated reads retain means; raw index8 path verified')
