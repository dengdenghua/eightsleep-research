from pathlib import Path
import json,hashlib,re,shutil,struct
N=Path('/Users/dangbei/Downloads/eightsleep-firmware-research-20261107/analysis/system-deepening-20261108');R=N.parents[1];O=N/'local-legacy-commands';L=N/'local-legacy-sensor-closure';S=N/'legacy-sensor-closure/final-functions'
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def dump(n,x):(O/n).write_text(json.dumps(x,ensure_ascii=False,indent=2)+'\n')
records=[]
selections={ '39704':[(L/x) for x in ['configure/0800b448.txt','configure/0800a14c.txt','configure/0800a0ec.txt','pass3/080091fc.txt','pass4/0800b408.txt','pass2/0800ba70_0800d997.txt']], '42292':[S/(a+'.txt') for a in ['0800b884','0800bedc','0800a840','0800ab32','0800ab7a','08009ba0','08009bd0','08008c3c','08009228','0800b840']]}
for version,paths in selections.items():
 for p in paths:
  d=O/'sources'/version/p.name;d.parent.mkdir(parents=True,exist_ok=True);shutil.copyfile(p,d)
  records.append({'version':version,'source':str(p),'copy':str(d.relative_to(O)),'sha256':sha(p)})
dump('SOURCE_INDEX.json',records)
inputs=[];blobs={}
for version,name in [('39704','firmware-sensor-legacy.bbin'),('42292','firmware-sensor.bbin')]:
 p=R/'mediatek/rootfs-selected/opt/eight/lib/subsystem_updates'/name;b=p.read_bytes();blobs[version]=b
 inputs.append({'version':version,'path':str(p),'size':len(b),'sha256':sha(p),'base':'08005000','mapped_end_inclusive':f'{0x8005000+len(b)-1:08x}'})
dump('INPUTS.json',inputs)
checks=[];seen={v:{} for v in blobs}
for version in blobs:
 fs=list((O/'sources'/version).glob('*.txt'))
 if version=='39704':fs+=list((O/'legacy-hw').glob('*.txt'))+list((O/'legacy-routes').glob('*.txt'))
 for p in fs:
  count=0
  for line in p.read_text().splitlines():
   m=re.match(r'INSN ([0-9a-f]{8}) ([0-9a-f]+) ',line) or re.match(r'([0-9a-f]{8}) .*? BYTES ([0-9a-f]+)(?: |$)',line)
   if not m:continue
   a=int(m[1],16);b=bytes.fromhex(m[2]);actual=blobs[version][a-0x8005000:a-0x8005000+len(b)];assert b==actual,(p,line)
   seen[version][a]=b;count+=1
  checks.append({'path':str(p.relative_to(O)),'instruction_occurrences':count,'status':'pass'})
for v in seen:assert seen[v]
dump('BYTE_VALIDATION.json',{'input_bytes_only':True,'base':'08005000','files':checks,'unique_instructions':{v:len(x) for v,x in seen.items()},'unique_instruction_bytes':{v:sum(map(len,x.values())) for v,x in seen.items()},'limitations':'Checks exported instruction bytes. Pseudocode is not independently executed; duplicated/out-of-function main pseudocode is navigation only.'})
rows=[]
def add(op,normal,action,reply,diff='same normal contract'):
 rows.append({'opcode':f'0x{op:02x}','normal_request_data':normal,'local_action':action,'reply_after_response_opcode':reply,'version_difference':diff,'sources':['sources/39704/0800b448.txt','sources/42292/0800b884.txt'] if op not in [2,3,4,5] else ['legacy-routes/0800cf48_0800cf8f.txt','legacy-routes/0800cfd8_0800d005.txt','sources/42292/0800bedc.txt']})
add(1,'none','constant identity byte','00 46')
add(2,'none','copy first 128 bytes from selected hardware-info flash region','00 + 128 bytes')
add(3,'none','unsupported built-in','04')
add(4,'none','unsupported built-in','04')
add(5,'none','flush success reply then delay(10) and reset helper; not executed','00')
add(0x20,'none','read sampling rate field +0x10c','00 + BE32 rate')
add(0x21,'4 bytes: BE32 rate','hwrev < 0x700 changes rate; if active stop/start and restore previous +0x108 tick; >=0x700 leaves rate unchanged','00')
add(0x25,'6 bytes: mode0,mode1,target0:BE16,target1:BE16; 8 adds power0,power1; both mode0 allow2','normal modes 0/1; unsigned targets /100 float32 capped40; optional power capped100 or default100; enable triggers thermostat; disable clears state/power','00 + state0,state1,current:BE16,power_selector')
add(0x26,'none','hwrev <0x700 reads two gain control bytes, >=0x700 returns zero pair','00 + code0,code1')
add(0x27,'2 bytes: code0,code1 (code also accepts3)','hwrev <0x700 invokes two setters; >=0x700 does nothing','00')
add(0x28,'none','start sampling','00')
add(0x29,'none','stop sampling','00')
add(0x2a,'1 byte: logical temperature id0..10, or ff','per-value float32*100 then signed truncate, low16 BE; -100 sentinel maps id10 to00ff, all others8000','00 + (id,BE16) once or all11')
add(0x2b,'4 bytes: two BE16 requested gains','hw<0x700 each request>=100 quantized through control byte and reply actual recorded gains; hw>=0x700 first request selects one MCP gain, second not independent; success conditional on normal hardware transaction','00 + two BE16; MCP repeats first requested value')
add(0x2c,'7 bytes: side,power,pattern,duration_seconds:BE32; normal side0/1 pattern0/1; index2 is not established as a valid mode','zero duration stops; idle nonzero power starts with duration*1000 u32, running start request preserves ongoing state','00 + original side','39704 contexts+218/+244; 42292+2ac/+2fc, extra counters/timers reset and pattern>2 normalizes0; index2 is not established valid (not executed or modeled)')
add(0x2d,'2 bytes: logical output,power','passes to local output setter; physical GPIO/PWM mapped separately in local-legacy-control','00')
add(0x2e,'none','logical GPIO assert then success append falls through default status append','00 02','39704 always invokes GPIO; 42292 only if hwrev<0x720; both append two statuses')
add(0x2f,'same as2a','same temperature query','same as2a')
dump('COMMAND_ROUTES.json',{'scope':'normal request payloads only; lengths are selected supported examples, not proof of all accepted shapes','hardware_threshold_notation':'0x700 and 0x720 are hexadecimal comparisons, not decimal700/720','dispatch':'CRC-valid packet: highbit response handled as response/log-only; request appends opcode|0x80 then builtins2..5 or normal handler; no command sent','routes':rows})
keys=[('devicesn',4,32),('pn',8,32),('sku',12,32),('hwrev',16,16),('factoryline',18,16),('datecode',20,32)]
dump('HARDWARE_INFO.json',{'selection':'u16@1ffff7cc <0x81 ? 0800fc00 : 0803f800','startup_reader_window_bytes':512,'command_02_returned_bytes':128,'command_02_total_body_bytes_including_opcode_status':130,'keys':[{'key':k,'struct_offset':o,'stored_bits':b,'value_major_type':0} for k,o,b in keys],'destinations':{'39704':'200001d4','42292':'20000218'},'normal_map':'CBOR major5 map; text keys, unsigned integer values decoded then low32/low16 stored. Per-key return codes not checked by startup caller; this is not an authenticated configuration format claim.','raw_main_table39704':{'address':'0800cf44','bytes':blobs['39704'][0xcf44-0x5000:0xcf48-0x5000].hex(),'target_formula':'0800cf44+2*table[opcode-2]','targets':['0800cf48','0800cf70','0800cf70','0800cfd8']},'actual_device_config':'not present: both firmware images end before 0800fc00; only synthetic values used','sources':['legacy-hw/0800c9d0.txt','legacy-hw/0800a7ce.txt','legacy-hw/0800a816.txt','legacy-hw/0800a43c.txt','sources/39704/0800ba70_0800d997.txt','sources/42292/0800bedc.txt','sources/42292/0800ab32.txt','sources/42292/0800ab7a.txt']})
print('copied',len(records),'instruction checks', {v:len(x) for v,x in seen.items()},'routes',len(rows))
