#!/usr/bin/env python3
"""Normal 0x34/0x35 producer layouts and selected legacy consumer contract only.
No malformed packets, firmware execution, live device, full scheduler or native CBOR execution.
"""
from pathlib import Path
import json,struct,copy,hashlib
O=Path(__file__).resolve().parents[1]
SENTINEL=0x7fffffff
def u32(v):return struct.pack('>I',v&0xffffffff)
def read32(b,p):return int.from_bytes(b[p:p+4],'big')
def signed(v):return v-(1<<32) if v&(1<<31) else v
def write(p,x):p.write_text(json.dumps(x,ensure_ascii=False,indent=2)+'\n')
def fixture34():
 rows=[{'id':i,'record_0x30':1000+i,'record_0x0c':-2000-i} for i in range(25)]
 # Actual producer: 34 42; BE32 frequency; first record tick, gain32, gain16.
 b=bytes([0x34,0x42])+u32(500)+u32(100000)+u32(100)+struct.pack('>H',400)
 for r in rows:b+=u32(r['record_0x30'])+u32(r['record_0x0c'])
 assert len(b)==216
 return rows,b
def fixture35():
 rows=[{'id':i,**{f'record_0x{k:02x}':(j+1)*10000+i for j,k in enumerate([12,16,20,24])}} for i in range(10)]
 b=bytes([0x35,2])+bytes(8)+struct.pack('>H',200)+u32(100000)
 for r in rows:
  for k in [12,16,20,24]:b+=u32(r[f'record_0x{k:02x}'])
 assert len(b)==176
 return rows,b
def decode34(body):
 assert len(body)==216 and body[:6]==bytes.fromhex('3442000001f4')
 p=body[1:];ver=p[0];frequency=read32(p,1);tick=read32(p,5)
 gains=[read32(p,9),int.from_bytes(p[13:15],'big')]
 pos=15;offset=0;sample=None;events=[];bufs=[[SENTINEL]*500 for _ in range(4)]
 while pos<len(p):
  remaining=len(p)-pos;updated=remaining>=16 # mode argument is zero at actual legacy caller.
  if updated:
   a,b=signed(read32(p,pos)),signed(read32(p,pos+4))
   sample={'tick':tick+offset,'values_at_12_16_20_24':[b,b,a,a],'row':(pos-15)//8}
   consumed=8
  else:
   consumed=remaining # actual decoder leaves its output unchanged on this normal final iteration.
  assert sample is not None
  snap=copy.deepcopy(sample);slot=(snap['tick']-100000)%1000//2
  b,bcopy,a,acopy=snap['values_at_12_16_20_24']
  for arr,v in zip(bufs,[b,a,bcopy,acopy]):arr[slot]=v
  events.append({'payload_position':pos,'remaining':remaining,'decoder_updated':updated,'decoder_return':consumed,
   'caller_tick_offset_before':offset,'output':snap,'buffer_slot':slot,'source_row':snap['row']})
  pos+=consumed;offset+=1000//frequency
 assert pos==215 and len(events)==25 and sum(e['decoder_updated'] for e in events)==24
 assert events[-1]['output']==events[-2]['output'] and events[-1]['buffer_slot']==23
 assert all(bufs[0][k]!=SENTINEL for k in range(24)) and bufs[0][24]==SENTINEL
 return {'header':{'adc':ver,'frequency':frequency,'tick':tick,'gains':gains},'events':events,
  'buffer':{'left1':bufs[0],'right1':bufs[1],'left2_internal_only':bufs[2],'right2_internal_only':bufs[3]},
  'encoder_contract':{'type':'piezo-dual','ts':'anchor_epoch + relative//1000','freq':500,'adc':66,'gain':100,
    'version':2,'left':{'gain':100},'right':{'gain':400},'left1':'500 int32 LE /2000 bytes','right1':'500 int32 LE /2000 bytes',
    'selected_when':'raw_logger+0x10d8 is null and +0x10e0 is this buffer; mask0x10'},
  'subject':'raw.sens.piezo','boundary':'buffer contents from one normal packet under stable anchor; encoder contract only, no flush/upload execution'}
def decode35(body):
 assert len(body)==176 and body[:12]==bytes.fromhex('3502000000000000000000c8')
 p=body[1:];version=p[0];temps=[int.from_bytes(p[k:k+2],'big') for k in [1,3,5,7]]
 frequency=int.from_bytes(p[9:11],'big');tick=read32(p,11);pos=15;offset=0;events=[]
 bufs=[[SENTINEL]*200 for _ in range(4)]
 while pos<len(p):
  assert len(p)-pos>=16
  w=[signed(read32(p,pos+4*k)) for k in range(4)]
  sample={'tick':tick+offset,'values_at_12_16_20_24':[w[3],w[1],w[2],w[0]],'row':(pos-15)//16}
  # 001e7c64 repacks metadata+values; 001eeaf0 writes 0,200,400,600 order.
  slot=(sample['tick']-100000)%1000//5
  for a,v in zip(bufs,[w[3],w[2],w[1],w[0]]):a[slot]=v
  events.append({'payload_position':pos,'remaining':len(p)-pos,'decoder_updated':True,'decoder_return':16,
    'output':sample,'buffer_slot':slot})
  pos+=16;offset+=1000//frequency
 assert len(events)==10 and pos==175
 return {'header':{'version':version,'frequency':frequency,'tick':tick,'four_metadata_u16':temps},'events':events,
  'buffer':{'left1':bufs[0],'right1':bufs[1],'left2':bufs[2],'right2':bufs[3]},
  'encoder_contract':{'type':'lps','ts':'anchor_epoch + relative//1000',
   'temp':{'left1':'payload u16@5','left2':'payload u16@7','right1':'payload u16@1','right2':'payload u16@3'},
   'pres':{'adc':1,'freq':200,'left1':'200 int32 LE /800 bytes','left2':'200 int32 LE /800 bytes','right1':'200 int32 LE /800 bytes','right2':'200 int32 LE /800 bytes'},
   'adc_note':'fresh buffer initializes adc=1; reviewed enqueue does not copy header version2 into this field; no other writer assumed'},
  'subject':'raw.sens.lps','boundary':'code field names temp/pres do not establish physical units; one normal packet, stable anchor, fresh buffer'}
def usb_dispatch(op):
 # Only the original branch chain needed for normal34/35; not a generic dispatcher emulator.
 assert op in [0x34,0x35]
 path=['0027eb40 cmp39: lower','0027eb4c cmp36: unequal','0027eb54 cmp37: unequal','0027ef98 cmp33: unequal','0027eac8 -> 0027e968 complete']
 return {'opcode':hex(op),'path':path,'selected_sample_decoder':None,'sample_output':None,
  'condition':'actual UsbSensor handler selected, event flag0 and state2; no claim that this route received such a frame on device'}
def main():
 out=O/'model/results';out.mkdir(exist_ok=True)
 r34,b34=fixture34();r35,b35=fixture35();d34=decode34(b34);d35=decode35(b35)
 for i in range(24):
  assert d34['buffer']['left1'][i]==r34[i]['record_0x0c'] and d34['buffer']['right1'][i]==r34[i]['record_0x30']
 for i in range(10):
  for label,k in [('left1',24),('left2',16),('right1',20),('right2',12)]:assert d35['buffer'][label][i]==r35[i][f'record_0x{k:02x}']
 for name,b,rows,d in [('normal34',b34,r34,d34),('normal35',b35,r35,d35)]:
  (out/f'{name}.body.bin').write_bytes(b);write(out/f'{name}.producer.json',rows);write(out/f'{name}.decoded.json',d)
  for label,values in d['buffer'].items():(out/f'{name}.{label}.int32le.bin').write_bytes(b''.join(struct.pack('<i',v) for v in values))
 result={'status':'PASS','normal_layouts':2,'checks':['actual fixed prefix and body sizes','header values and metadata offsets','normal34: 25 caller iterations/24 decoder updates/last reused output','normal34: 48 decoded values map to24 output slots per emitted side','normal35: all40 values map to10 slots per four output arrays','stable-anchor normal tick steps2/5','UsbSensor34 default completion','UsbSensor35 default completion'],
   'usb_routes':[usb_dispatch(0x34),usb_dispatch(0x35)],'normal34':{'body_bytes':216,'payload_bytes':215,'caller_iterations':25,'decoder_updates':24,'unique_buffer_slots':24,'last_output_source_row_zero_based':23,'last_wire_row_zero_based':24,'subject_if_encoder_selected':'raw.sens.piezo'},
   'normal35':{'body_bytes':176,'payload_bytes':175,'caller_iterations':10,'decoder_updates':10,'unique_buffer_slots':10,'subject':'raw.sens.lps'},
   'assumptions':['legacy Sensor handler selected and runtime state2; this is not the UsbSensor handler','ordinary fixed producer34 flag42 and producer35 version2','stable time anchor, no missing ticks, no timer resync, sequential coroutine completions','raw buffer allocated as described; no unrelated writer or alternative encoder selection','no actual CBOR serialization, queue publishing, MCU or Frank execution','only normal216B/176B inputs; no malformed input exploration'],
   'artifacts':[{'path':str(p.relative_to(O)),'bytes':p.stat().st_size,'sha256':hashlib.sha256(p.read_bytes()).hexdigest()} for p in sorted(out.iterdir())]}
 write(O/'MODEL_RESULTS.json',result);print(json.dumps({'status':'PASS','normal_layouts':2,'checks':len(result['checks'])}))
if __name__=='__main__':main()
