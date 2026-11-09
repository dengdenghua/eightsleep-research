#!/usr/bin/env python3
"""Create indexes for retained normal-protocol evidence. No target operations."""
from pathlib import Path
import json,hashlib,shlex
O=Path(__file__).resolve().parents[1];R=O.parents[2]
def put(name,x):(O/name).write_text(json.dumps(x,ensure_ascii=False,indent=2)+'\n')
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def anchor(path,needle):
 lines=(O/path).read_text().splitlines();hits=[i+1 for i,l in enumerate(lines) if needle in l]
 assert hits,(path,needle)
 return {'path':path,'line':hits[0],'match':needle,'file_sha256':sha(O/path)}
items=[
 ('USB object binding','source/host/0017ae00_0017afb0.txt','0017aeb4'),
 ('USB constructor/vptr','source/host/0019e7f0.txt','005c79f8'),
 ('USB opcode comparison','source/host/0027e7b0.txt','INSN 0027eb40'),
 ('USB ordinary completion','source/host/0027e7b0.txt','INSN 0027eac8'),
 ('USB runtime state gate','source/host/00236174.txt','00236174'),
 ('command body/opcode split','source/host/00219b34.txt','00219b34'),
 ('legacy config startup','pass5/00185920.txt','FUN_00205a20'),
 ('legacy update activation','pass5/0018a510.txt','FUN_00205520'),
 ('legacy handle1 endpoint/read callback','pass4/00205a20.txt','FUN_00237470(1'),
 ('legacy byte stream read wrapper','pass5/00202a50.txt','FUN_00237a60'),
 ('endpoint abstraction','pass5/00237470.txt','subsystem/uart.cpp'),
 ('legacy LSP/command update','pass3/0020b574.txt','FUN_00219b34'),
 ('legacy command coroutine creation','pass2/0020b400.txt','FUN_002097a0'),
 ('legacy state/opcode gate','pass4/002097a0.txt','if (*(int *)(lVar22 + 0x2088) == 2)'),
 ('normal34 producer tick','source/usb/main-full.txt','0801f2fc'),
 ('normal34 producer A','source/usb/main-full.txt','0801f340'),
 ('normal34 producer B','source/usb/main-full.txt','0801f352'),
 ('normal35 producer','source/usb/08025324.txt','08025324'),
 ('normal34 header','pass1/0021a960.txt','0021a960'),
 ('normal35 header','pass1/0021c210.txt','0021c210'),
 ('normal34 size gate','pass1/0021aa70.txt','INSN 0021aa78'),
 ('normal34 untouched-return','pass1/0021aa70.txt','INSN 0021ab64'),
 ('caller only clears duplicate flag','pass4/002097a0.txt','INSN 0020a3e4'),
 ('caller reused sample pointer','pass4/002097a0.txt','INSN 0020a3ec'),
 ('caller mode0','pass4/002097a0.txt','INSN 0020a408'),
 ('caller separate tick/byte advancement','pass4/002097a0.txt','INSN 0020a410'),
 ('caller submission','pass4/002097a0.txt','INSN 00209e38'),
 ('normal35 row mapping','pass1/0021c2c0.txt','INSN 0021c334'),
 ('time mapper','pass1/0021a5c0.txt','LAB_0021a630:'),
 ('34 packed enqueue','pass1/001e7960.txt','FUN_001eef70'),
 ('34 buffer','pass1/001eef70.txt','raw_ext_adc_buffer.h'),
 ('35 packed enqueue','pass1/001e7c64.txt','FUN_001eeaf0'),
 ('35 buffer','pass1/001eeaf0.txt','INSN 001eeaf0'),
 ('conditional extADC encoder','pass1/00200960.txt','FUN_001fb0b0'),
 ('piezo-dual encoder','pass1/001fb0b0.txt','piezo-dual'),
 ('lps encoder','pass2/001fce40.txt','DAT_0046b958'),
 ('raw byte span','pass3/001fcdb0.txt','001fcdb0'),
 ('CBOR byte writer call','pass3/001fcde0.txt','FUN_001d78d0'),
 ('piezo subject','pass1/001e9390.txt','raw.sens.piezo'),
 ('lps subject','pass1/001e9390.txt','raw.sens.lps')]
put('EVIDENCE_MAP.json',[{'claim':c,**anchor(p,n)} for c,p,n in items])
common={'source_kind':'static canonical producer layout / legacy consumer contract','wire_endian':'big','integer_payload_output':'raw little-endian int32 byte strings; no scaling established','deployment':'unknown; UsbSensor path does not consume these opcodes','legacy_gate':{'command_flag':0,'sensor_runtime_state_offset':'0x2088','sensor_runtime_state':2,'config_string_nonempty':'config+0x28 string length at +0x30'},'time':{'decoder':'0021a5c0','tick_argument':'first_record_tick + caller_offset','epoch':'mapper+0x2c','relative':'tick - mapper+0x30','bucket':'epoch + uint32(relative)/1000','model_assumption':'stable anchor, no gaps/resync, sequential coroutine completion'},'cloud_delivery_proven':False}
contracts={'scope':common,'normal34':{'body_bytes':216,'payload_bytes':215,'opcode':52,'tag':66,'header_payload_bytes':15,'rows':25,'row_bytes':8,'fields':[{'body_offset':0,'bytes':1,'value':52},{'body_offset':1,'bytes':1,'value':66},{'body_offset':2,'bytes':4,'value':500,'meaning':'nominal software frequency'},{'body_offset':6,'bytes':4,'source':'first record+0x00','meaning':'tick'},{'body_offset':10,'bytes':4,'source':'first record+0x04','meaning':'gain1 field'},{'body_offset':14,'bytes':2,'source':'low16(first record+0x08)','meaning':'gain2 field'}],'row_fields':[{'body_offset':'16+8*i','source':'record[i]+0x30','alias':'A'},{'body_offset':'20+8*i','source':'record[i]+0x0c','alias':'B'}],'decoder':'0021aa70','caller_mode':0,'decoder_update_gate':'remaining>=16','normal_update_bytes':8,'output_values_at_0c_10_14_18':['B','B','A','A'],'normal_final_iteration':{'remaining':8,'decoder_return':8,'updates_output':False,'caller_reuses_previous_sample':True,'decoder_updates':24,'caller_submissions':25,'unique_slots_in_model':24,'last_slot_in_model':23,'unwritten_slot_in_model':24},'buffer':{'raw_logger_offset':'0x10e0','array_lengths':[500,500,500,500],'internal_arrays':['B','A','B','A'],'slot':'(relative%1000)>>1','missing_int32':2147483647},'encoder':{'address':'001fb0b0','mask':16,'selected_if':'raw_logger+0x10d8 null and +0x10e0 present','type':'piezo-dual','freq':500,'adc':66,'version':2,'fields_emitted':{'left1':'record+0x0c','right1':'record+0x30'},'bytes_each':2000,'internal_left2_right2_emitted':False},'subject':'raw.sens.piezo'},'normal35':{'body_bytes':176,'payload_bytes':175,'opcode':53,'version':2,'header_payload_bytes':15,'rows':10,'row_bytes':16,'fields':[{'body_offset':0,'bytes':1,'value':53},{'body_offset':1,'bytes':1,'value':2},{'body_offset':[2,4,6,8],'bytes_each':2,'value_each':0,'meaning':'literal metadata, not readings in this producer'},{'body_offset':10,'bytes':2,'value':200,'meaning':'nominal software frequency'},{'body_offset':12,'bytes':4,'source':'first record+0x00','meaning':'tick'}],'row_fields':[{'body_offset':f'{16+4*i}+16*i','wire_index':i,'source':f'record[i]+0x{k:02x}'} for i,k in enumerate([12,16,20,24])],'decoder':'0021c2c0','output_values_at_0c_10_14_18':['W3','W1','W2','W0'],'decoded_rows':10,'buffer':{'raw_logger_offset':'0x10f8','array_lengths':[200,200,200,200],'internal_arrays':['W3','W2','W1','W0'],'slot':'(relative%1000)/5','missing_int32':2147483647},'encoder':{'address':'001fce40','mask':128,'type':'lps','temp':{'left1':'wire m2=0','left2':'wire m3=0','right1':'wire m0=0','right2':'wire m1=0'},'pres':{'adc':'fresh buffer defaults1; no wire version copy in reviewed enqueue; other writers not excluded','freq':200,'left1':'record+0x18','left2':'record+0x10','right1':'record+0x14','right2':'record+0x0c'},'bytes_per_array':800},'subject':'raw.sens.lps'},'limits':['does not establish physical channels/units or current deployment','does not execute native CBOR or publish','only canonical producer layouts; no malformed payloads','legacy handle1 read wrapper target known; actual endpoint/config/open outcome unknown']}
put('CONTRACTS.json',contracts)
# Store reproducible argv and shell syntax corresponding to the five completed readOnly exports.
plans=[['002097a0:0020b3ff','0021a960','0021aa70','0021c210','0021c2c0','0021a5c0','001e01b0','001e0350','001e7960','001e7c64','001eef70','001eeaf0','001fb0b0','00200960','001e9390','002020f0','0045f6e0','0045f6b4'],['001fce40','0020b400','0020be80','0021a370','001f4ca0'],['001fcdb0','001fcde0','001f2380','0020b574'],['002097a0','00205520','00205a20','00203500','00203b40','00460d60','00460d88'],['00202a50','00237470','00185920','0018a510']]
commands=[]
for i,args in enumerate(plans,1):
 argv=['/opt/homebrew/Cellar/ghidra/12.1.4/libexec/support/analyzeHeadless',str(R/'analysis/signal-host/ghidra'),'SignalHost','-process','frankenfirmware','-readOnly','-noanalysis','-scriptPath',str(O/'scripts')]
 if i==4:argv+=['-preScript','FixLegacySensorSwitch.java']
 argv+=['-postScript','ExportLegacySamples.java',str(O/f'pass{i}'),*args]
 commands.append({'pass':i,'env':{'JAVA_HOME':'/opt/homebrew/opt/openjdk@21/libexec/openjdk.jdk/Contents/Home'},'argv':argv,'recorded_exit_code':0,'log':f'pass{i}.log','shell':'JAVA_HOME='+shlex.quote('/opt/homebrew/opt/openjdk@21/libexec/openjdk.jdk/Contents/Home')+' '+shlex.join(argv)+' >'+shlex.quote(str(O/f'pass{i}.log'))+' 2>&1'})
put('COMMANDS.json',{'exports':commands,'offline_checks':[['python3',str(O/'model/normal_contracts.py')],['python3',str(O/'scripts/validate_evidence.py')]],'notes':['These commands describe completed exports, not an instruction to rerun against an active shared project.','pass4 transiently repaired bounded switch in readOnly session; project changes discarded.','All target programs were inspected only, never executed.']})
validation=json.loads((O/'BYTE_VALIDATION.json').read_text())
put('COVERAGE.json',{'scope':'normal 0x34/0x35 producers and legacy consumers through local output subject; UsbSensor distinction','completed_exports':5,'input_families':validation['inputs'],'model':{'normal_layouts':2,'check_groups':8,'native_execution':False,'native_cbor_execution':False,'live_observation':False},'retained_evidence_map_entries':len(items),'gaps':['pass1 legacy function incomplete, superseded for caller claims by bounded repaired pass4 original-byte-verified export','actual config values, selected mode, endpoint and deployed firmware not observed','00237a60 read target not expanded this round','physical fields/units/calibration and other raw-buffer writers not established','cloud receipt/storage and physiological processing not examined']})
print(json.dumps({'evidence_anchors':len(items),'commands':len(commands)}))
