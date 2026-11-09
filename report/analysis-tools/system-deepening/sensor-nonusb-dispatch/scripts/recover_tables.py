"""Recover bounded dispatch tables as data from original BBIN; no target execution."""
from pathlib import Path
import argparse,hashlib,json
B=Path(__file__).resolve().parents[1]
p=argparse.ArgumentParser();p.add_argument('--research-root',type=Path,default=B.parents[2]);args=p.parse_args()
source=args.research_root/'mediatek/rootfs-selected/opt/eight/lib/subsystem_updates/firmware-sensor-g0.bbin'
data=source.read_bytes();digest=hashlib.sha256(data).hexdigest();assert digest=='51531576fd31af96f7239b71d26e1f175815f5cb21dbe9ab305fa9a33cc6a891'
base=0x08008000
spec=[('special',0x8017132,1,5,1,False,0x801712e,0x800814c),('main',0x80171a4,6,42,2,True,0x80171a0,0x8008484),('extended',0x801720a,0x40,9,2,True,0x8017206,0x8008484),('frame_parser_state',0x8016fdc,0,5,2,True,0x8016fd8,0x8008484)]
tables=[]
for name,addr,lo,count,width,signed,call,helper in spec:
 raw=data[addr-base:addr-base+count*width];assert len(raw)==count*width
 entries=[]
 for i in range(count):
  part=raw[i*width:(i+1)*width];value=int.from_bytes(part,'little',signed=signed)
  target=addr+2*value
  assert base<=target<base+len(data) and target%2==0
  entries.append({'index':i,'opcode_or_state':lo+i,'opcode_or_state_hex':hex(lo+i),'entry_address':hex(addr+i*width),'file_offset':addr+i*width-base,'raw_hex':part.hex(),'value':value,'target':hex(target),'target_first4_hex':data[target-base:target-base+4].hex()})
 tables.append({'name':name,'call_address':hex(call),'helper':hex(helper),'table_address':hex(addr),'width':width,'signed':signed,'count':count,'raw_hex':raw.hex(),'sha256':hashlib.sha256(raw).hexdigest(),'target_rule':'(LR & ~1) + 2 * entry; LR points to table plus Thumb bit; byte unsigned or LE16 signed as stated','entries':entries})
by_name={t['name']:t for t in tables}
def entry(name,i):return by_name[name]['entries'][i]['target']
# Restate the observed range guards; this is arithmetic checking, not firmware execution.
routes=[]
for c in range(128):
 if 1<=c<=5:name='special';i=c-1
 elif 6<=c<=0x2f:name='main';i=c-6
 elif 0x40<=c<=0x48:name='extended';i=c-0x40
 else:name=None;i=None
 target=entry(name,i) if name else hex(0x801718e)
 routes.append({'opcode':c,'opcode_hex':hex(c),'table':name,'index':i,'target':target})
assert routes[0x28]['target']=='0x801721c';assert routes[0x2b]['target']=='0x801747e'
assert by_name['frame_parser_state']['entries'][4]['target']=='0x8016ed4'
report={'schema':'eightsleep.nonusb.dispatch-tables.v1','input':str(source),'input_sha256':digest,'image_base':hex(base),'header_bytes_already_in_mapping':128,'tables':tables,'command_routes_low7bits':routes,'high_bit_boundary':'body[0]&0x80 !=0 follows response branch before these command tables; routes apply to command branch only.','semantic_scope':'Raw table entry, range guards and computed target only; non-targeted handlers are not decoded/semantically validated.'}
(B/'DISPATCH_TABLES.json').write_text(json.dumps(report,indent=2)+'\n')
# Reset copy constants are tied to pass4 original instruction literals; preserve raw source values.
load=0x8028464;ram=0x20000200;end=0x200004bc
facts=[]
for name,addr,n in [('clock_frequency_variable',0x20000250,4),('tick_step',0x20000258,1),('tick_priority',0x2000025c,4)]:
 off=load-base+addr-ram;raw=data[off:off+n]
 facts.append({'role':name,'ram_address':hex(addr),'file_offset':off,'raw_hex':raw.hex(),'value':int.from_bytes(raw,'little')})
init={'input_sha256':digest,'mapping_base':hex(base),'vector_header_bytes':128,'vectors':{'reset':{'file_offset':132,'raw_hex':data[132:136].hex(),'value':hex(int.from_bytes(data[132:136],'little'))},'systick':{'file_offset':188,'raw_hex':data[188:192].hex(),'value':hex(int.from_bytes(data[188:192],'little'))}},'data_copy':{'flash':hex(load),'ram_start':hex(ram),'ram_end_exclusive':hex(end)},'bss_zero':{'start':hex(end),'end_exclusive':'0x2000ac14','covers_tick_20001144':True},'initialized_values':facts,'scope':'Startup bytes only; not current device frequency calibration.'}
(B/'RAW_INIT_FACTS.json').write_text(json.dumps(init,indent=2)+'\n')
print(json.dumps({'tables':len(tables),'table_entries':sum(t['count'] for t in tables),'command_routes':len(routes),'start':routes[0x28],'gain':routes[0x2b],'init':facts}))
