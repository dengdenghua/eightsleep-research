#!/usr/bin/env python3
"""Retain reviewed caller bounds and source anchors; does not disassemble or execute target."""
from pathlib import Path
import json,re
O=Path(__file__).resolve().parent.parent
rows=[
 ('raw_0x3c','0801f9aa -> 0801f374',377,377,'9 + 5*64 + 48; shared branch enters wrapper BL directly; not a separate BL xref',['pass5/0801f900_0801fa10.txt','pass5/080266dc.txt','pass6/refs_0801f374.txt']),
 ('batch_0x34','0801f374 fallthrough',216,216,'6 + 4 + 4 + 2 + 25*(4+4)',['pass3/0801f2a0_0801f31a.txt','pass2/0801f31a_0801f38c.txt','pass3/0801bca0.txt']),
 ('batch_0x35','080253b8',176,176,'12 + 4 + 10*(4+4+4+4)',['pass2/08025324.txt','pass3/0801bca0.txt']),
 ('status_main_A','0801fd8c',19,36,'one or two 17-byte records after 2-byte header',['pass3/0801fc82_0801fd20.txt','pass2/0801fd20_0801fdb0.txt','pass3/08020bf4_08020c1a.txt']),
 ('status_main_B','0801fe92',20,25,'4 + (16 or 21)',['pass2/0801fe20_0801feb0.txt']),
 ('button_event','08023a26',4,4,'fixed 4',['pass2/08023a14.txt']),
 ('gesture_event','0801ec9c',3,3,'fixed 3',['pass2/0801ec10.txt']),
 ('five_byte_event','08026dd4',5,5,'fixed 5',['pass2/08026d70_08026e00.txt']),
 ('helper_status','08027636',19,21,'4 + 26ec8 return (15 or 17)',['pass2/080275c0_08027660.txt','pass3/08026ec8.txt']),
 ('logger_wrapper','0801c948',2,514,'strnlen(source,512)+2; conservative cap, NOT attainable-length proof',['pass2/0801c8f8.txt','pass3/0802ad7a.txt','pass3/0802ad90.txt','pass4/0802acf8.txt']),
 ('pending_reply','0801d5b0',2,130,'reviewed normal reset/build/flush command paths: opcode + status + at most 128 data; separate append capacity512',['pass3/08020f94_08021036.txt','pass3/0801bcbc.txt','pass4/0801bcec.txt','pass4/08026130.txt','pass7/0802607c.txt','pass6/refs_0802100c.txt','pass6/refs_08021010.txt','pass6/refs_0802122e.txt'])]
a=[]
for name,site,lo,hi,reason,files in rows:
 a.append({'name':name,'callsite_or_predecessor':site,'body_min':lo,'body_max':hi,'basis':reason,
 'encoded_loose_max_width4':1+2*(4+hi+2),'can_reach1024_by_length_alone':False if 1+2*(4+hi+2)<1024 else 'not excluded; contents and producer reachability unproved',
 'files':files,'preconditions':'ordinary reviewed paths, no memory corruption or reentrant global mutation'})
(O/'CALLER_BOUNDS.json').write_text(json.dumps({'rows':a,'bound_formula':'T=1+w+N+2+E; E counts 0x7d/0x7e in length/body/CRC bytes; T<=1+2*(w+N+2); w in {1,2,4}',
 'reply_data_lengths':[0,1,3,4,5,8,9,15,17,33,45,47,128],
 'reply_note':'Some branches add an extra one-byte field; maximum remains opcode+status+128=130. List counts 11 or15 give33/45. 26130 emits status+9. 2607c emits one status on returning.',
 'excluded':'Not all possible indirect calls, corrupt state, log argument contents, reentrant schedules, real CRC/timing.'},ensure_ascii=False,indent=2)+'\n')
anchors=[
 ('framer','pass1/0801c764.txt',['0801c7be','0801c80e','0801c816','0801c82e','0801c832']),
 ('escape','pass1/080292a0.txt',['080292cc','080292d8','080292e8']),
 ('threshold','pass1/08029280.txt',['0802928c','08029290']),
 ('flush','pass1/08029254.txt',['0802926e','08029272']),
 ('callback','pass3/0801d6fc.txt',['0801d6fc']),
 ('init','pass2/08027834.txt',['0802793e']),
 ('reply_cap','pass3/0801bcbc.txt',['0801bcc8','0801bce0']),
 ('reply_max','pass3/08020f94_08021036.txt',['08020fd4','08021008','0802100c']),
 ('logger_cap','pass2/0801c8f8.txt',['0801c928','0801c92c','0801c946']),
 ('raw_shared_tail','pass5/0801f900_0801fa10.txt',['0801f9aa'])]
ev=[]
for claim,f,addresses in anchors:
 lines=(O/f).read_text().splitlines();found=[]
 for addr in addresses:
  hits=[i for i,l in enumerate(lines,1) if l.startswith('INSN '+addr+' ')]
  assert len(hits)==1,(addr,hits);found.append({'va':'0x'+addr,'line':hits[0]})
 ev.append({'id':claim,'path':f,'anchors':found})
(O/'EVIDENCE_MAP.json').write_text(json.dumps({'kind':'local static source anchors, not REA server Evidence IDs','rows':ev},ensure_ascii=False,indent=2)+'\n')
refs=[]
for line in (O/'pass2/0801c8f8.txt').read_text().splitlines():
 if line.startswith('REF_TO '):refs.append(line)
(O/'COVERAGE.json').write_text(json.dumps({
 'mode':'REA MCP unavailable; existing Ghidra readOnly/noanalysis; no target execution',
 'completed':['framer two direct callers','wrapper nine direct BL sites plus shared raw tail','reply append five direct callers and byte helper17 direct callers','reply shared tails incoming refs and all shown length sources','both escape values and threshold/reset/pointer retention','callback ownership records; ordinary caller-length bounds','original BBIN instruction/literal/branch verification','10 synthetic model tests'],
 'logger_direct_call_references':len(refs),'logger_call_reference_source':'pass2/0801c8f8.txt',
 'logger_note':'All recognized logger callsites retained as refs; generic cap audited. Individual format/argument content paths were NOT all reconstructed.',
 'not_closed':['logging body actual maximum escaping and format-argument reachability','all indirect/computed frame entry calls outside recognized refs','interrupt/reentrant global buffer mutations','exact deployed length-width configuration; universal1/2/4 bound used','specific CRC bytes of synthetic oversized cases','physical USB completion ordering and actual corruption'],
 'state_preconditions':['initial reply length0 or valid<=512; normal dispatcher clears before each reply','non-reentrant framer and valid slot globals','returned callback retains pointers for send/queue; no implied time guarantee'],
 'next_steps':['Resolve only logger formats/argument sources that can make near-limit long strings; do not retest normal377B as proof','If a valid over1024 producer is found, replay with original CRC configuration in offline model, then seek passive real-device USB evidence separately']},ensure_ascii=False,indent=2)+'\n')
print('reviewed bounds',len(rows),'logger refs',len(refs))
