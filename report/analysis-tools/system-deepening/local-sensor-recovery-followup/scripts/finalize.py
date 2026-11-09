#!/usr/bin/env python3
import re,json,hashlib,struct
from pathlib import Path
D=Path(__file__).resolve().parents[1];R=D.parents[2]
rel='mediatek/rootfs-selected/opt/eight/lib/subsystem_updates/firmware-sensor-g0-usb.bbin';p=R/rel;b=p.read_bytes();base=0x08010000
expected='1a125674542934f36266f88d9f8ca378a6a5ca696d9e58305d1b0e533f795563'
assert hashlib.sha256(b).hexdigest()==expected
def put(n,x):(D/n).write_text(json.dumps(x,ensure_ascii=False,indent=2)+'\n')
def branch(a,v):
 h1,h2=struct.unpack('<HH',v);s=h1>>10&1;i1=1^((h2>>13&1)^s);i2=1^((h2>>11&1)^s);n=s<<24|i1<<23|i2<<22|(h1&1023)<<12|(h2&2047)<<1
 return (a+4+n-(1<<25 if s else 0))&0xffffffff
seen={};occ=branches=lits=0;entries=[]
for f in sorted(set(D.glob('pass*/*.txt'))|set((D/'source').glob('*.txt'))):
 t=f.read_text();m=re.search(r'^TARGET (\w+) function=(\w+)',t,re.M)
 if m:entries.append({'path':str(f.relative_to(D)),'target':m[1],'function':m[2],'first_instruction_line':next((i for i,l in enumerate(t.splitlines(),1) if l.startswith('INSN ')),None)})
 for ln,line in enumerate(t.splitlines(),1):
  m=re.match(r'INSN ([0-9a-f]{8}) ([0-9a-f]+) (.*)',line)
  if not m:continue
  a=int(m[1],16);v=bytes.fromhex(m[2]);off=a-base
  assert off>=0 and b[off:off+len(v)]==v,(f,ln,hex(a));assert a not in seen or seen[a]==v
  seen[a]=v;occ+=1
  m2=re.match(r'bl 0x([0-9a-f]{8})\b',m[3])
  if m2:assert branch(a,v)==int(m2[1],16);branches+=1
  for aa,vv in re.findall(r'REF\[READ:([0-9a-f]{8})=([0-9a-f]+)\]',m[3]):
   aa=int(aa,16)
   if base<=aa<=base+len(b)-4:assert int.from_bytes(b[aa-base:aa-base+4],'little')==int(vv,16);lits+=1
put('INPUTS.json',{'input':rel,'bytes':len(b),'sha256':expected,'mapping':'GhidraVA=08010000+file_offset;128Bheader retained','scope':'G0 USB normal read/cache/recovery only','tool':'REA MCP unavailable; existing Ghidra readonly/noanalysis fallback; no generatedEvidenceID','no_target_execution':True})
put('BYTE_VALIDATION.json',{'status':'PASS','input_sha256':expected,'instruction_occurrences':occ,'unique_instructions':len(seen),'unique_bytes':sum(map(len,seen.values())),'direct_Thumb_BL_checks':branches,'file_backed_literal_checks':lits,'limits':'Original byte identity/BL/literal checks; not vendor execution or hardware state verification.'})
put('RAW_TABLES.json',{'tables':[{'va':hex(a),'file_offset':a-base,'label':label,'bytes_hex':b[a-base:a-base+n].hex()} for a,n,label in [(0x08018bc8,2,'no-op callback bx lr'),(0x08021082,84,'main command6..2f relative table'),(0x08020028,14,'main FDC state table')]],'note':'Tables retained for provenance; no new unsafe dispatch/payload experiments.'})
put('EVIDENCE_MAP.json',{'entries':entries,'line_numbers':'1-based first INSN; complete retained context','main_paths':['I2C1d128→1c52e→1c688/sensor_callback','ADC1d228→1d7dc→233f4/main3c','FDC1df84→240e4/22694→2572c','TMAG231f0→29574→main39;TMP22d14→294b0','2694c→main→28ec4→main→27008→268c8'], 'export_caveat':'pass2/0801a45c.txt=functionnone; superseded by pass4 explicit transient normal-function definition. No negative inference from empty export.'})
put('COVERAGE_RESIDUAL.json',{'closed':['I2C pending/success/timeout request-status→callback boundary','ADC read failure/partialready/cache replay→retained snapshots','stop/start/sync queue-vs-current distinction','FDC measurement timeout vs hardware-reset request vs fullobjectreinit/cacheage','TMAG transport failure vs perblockCRC failure→mixedcache/ready/netcounter','TMP no-callback→oldtemperature and retry cadence condition','global assessment gate and normal reset state graph to27008/restart'], 'finite_model_cases':30,'not_exhaustive':['low-level hardware IRQ generation for every bus fault code','all board-mode combinations and physical reset/power response','actual input timing, callback freshness and occurrence frequencies','full MCU/host reconnect lifecycle and cloud behavior'], 'excluded':['shared-log formatting/reentrancy investigation','malformed payloads, corruption, exploit development','device/account/API requests or vendor binary execution'], 'other_versions':'This140828BUSBinput only;132896BnonUSB and other BBINs have separate reports.'})
logs=[]
for f in sorted(D.glob('pass*.log')):
 t=f.read_text();logs.append({'path':f.name,'script_invocations':re.findall(r'^.*Execute script: (.*)$',t,re.M),'reported_error':bool(re.search(r'^ERROR .*SCRIPT|Exception in thread',t,re.M))})
assert all(not x['reported_error'] for x in logs)
put('JOBS.json',{'JAVA_HOME':'/opt/homebrew/opt/openjdk@21/libexec/openjdk.jdk/Contents/Home','analyzeHeadless':'/opt/homebrew/Cellar/ghidra/12.1.4/libexec/support/analyzeHeadless','project':'R/analysis/sensor-mcu/ghidra/sensor','options':'-readOnly -noanalysis -process firmware-sensor-g0-usb.bbin -scriptPath this/scripts -postScript [PrepareClosure.java explicitentry] -postScript ExportLegacySamples.java output targets','logs':logs,'headless_exit_codes':[0,0,0,0],'offline_commands':['python3 model/recovery_contracts.py','python3 scripts/finalize.py'],'timezone':'Asia/Shanghai'})
model=json.loads((D/'MODEL_RESULTS.json').read_text())
assert model['status']=='PASS' and model['case_count']==30 and len(model['cases'])==30
for c in model['cases']:
 assert c['status']=='PASS' and c['observed']==c['expected'],c['name']
for x in model['artifacts']:
 artifact=(D/x['path']).resolve();assert artifact.is_relative_to(D.resolve())
 bb=artifact.read_bytes();assert len(bb)==x['bytes'] and hashlib.sha256(bb).hexdigest()==x['sha256']
files=[]
for f in sorted(D.rglob('*')):
 if not f.is_file() or f.name=='SOURCE_MANIFEST.json' or '__pycache__' in f.parts:continue
 bb=f.read_bytes();files.append({'path':str(f.relative_to(D)),'bytes':len(bb),'sha256':hashlib.sha256(bb).hexdigest()})
put('SOURCE_MANIFEST.json',{'files':files,'exclusions':['SOURCE_MANIFEST.json self','__pycache__'],'scope':'New owned normal recovery analysis only'})
for x in files:
 bb=(D/x['path']).read_bytes();assert len(bb)==x['bytes'] and hashlib.sha256(bb).hexdigest()==x['sha256']
print(json.dumps({'status':'PASS','manifest_files':len(files),'bytes':sum(x['bytes'] for x in files),'unique_instructions':len(seen),'unique_bytes':sum(map(len,seen.values())),'branches':branches,'literals':lits}))
