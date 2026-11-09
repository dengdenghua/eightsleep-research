#!/usr/bin/env python3
"""Index this owned static analysis and verify every manifested file by re-read."""
import hashlib,json,re
from pathlib import Path
O=Path(__file__).resolve().parents[1]
def put(n,x):(O/n).write_text(json.dumps(x,ensure_ascii=False,indent=2)+'\n')
entries=[]
for p in sorted(set(O.glob('*pass*/*.txt'))|set((O/'source').glob('*.txt'))):
 t=p.read_text();m=re.search(r'^TARGET (\w+) function=(\w+)',t,re.M)
 if m:entries.append({'path':str(p.relative_to(O)),'target':m[1],'function':m[2],'first_instruction_line':next((i for i,l in enumerate(t.splitlines(),1) if l.startswith('INSN ')),None)})
put('EVIDENCE_MAP.json',{'entries':entries,'line_convention':'1-based retained text file lines','type':'Ghidra C pseudocode with original INSN bytes, retained full exported function context','normal_flow':['08027834→08023958→080236c8/08022e90','08022908→080231f0→08029574;08022948→08022d14','0801f0d0→39→0027e7b0→00212280','001e2420→001e67b0→001e9e44→001fe910/001f74c0','00200960→001f5320;001e9390→raw.sens.blanket']})
put('COVERAGE_RESIDUAL.json',{'closed_normal_processing':['USB TMAG enable and identity/config/range selection','two valid CRC I2C blocks→cached signed-axis/internal-temperature arithmetic','separate TMP cache→0x39 canonical single/bilateral body','Host connection/orientation/flow/error classification and first-map copy identity','per-object-side deque, persistent maps, timestamp, CBOR type and local subject'], 'available_static_not_expanded':['persistent aggregate output version construction initial value (not assigned from incoming wire flags on this route)','full error-recovery and updater command combinations; outside normal numerical flow'], 'requires_new_material_or_measurement':['physical units and board placement/calibration','current deployed firmware/modes and UsbSensor object side assignment','actual asynchronous cache ages or achieved cadence','cloud production algorithms'], 'no_target_execution':True,'normal_model_case_count':16,'not_claimed':'Parser two-map same-source does not establish final left/right equality. Final side selection is perUsbSensor object.'})
logs=[]
for p in sorted(O.glob('*.log')):
 t=p.read_text();logs.append({'path':p.name,'lines':len(t.splitlines()),'reported_script_error':bool(re.search(r'^ERROR .*SCRIPT|Exception in thread',t,re.M)),'script_invocations':re.findall(r'^.*Execute script: (.*)$',t,re.M)})
assert all(not x['reported_script_error'] for x in logs)
put('JOBS.json',{'environment':{'JAVA_HOME':'/opt/homebrew/opt/openjdk@21/libexec/openjdk.jdk/Contents/Home','analyzeHeadless':'/opt/homebrew/Cellar/ghidra/12.1.4/libexec/support/analyzeHeadless'},'commands':['analyzeHeadless R/analysis/sensor-mcu/ghidra sensor -readOnly -noanalysis -process firmware-sensor-g0-usb.bbin -scriptPath this/scripts -postScript ExportLegacySamples.java output targets','analyzeHeadless R/analysis/signal-host/ghidra SignalHost -readOnly -noanalysis -process frankenfirmware -scriptPath this/scripts -postScript ExportLegacySamples.java output targets'],'exit_codes':'All10 retained headless invocations completed exit0; exact targets recorded in logs and entries. No vendor process executed.','logs':logs,'targets':entries,'offline_checks':['python3 model/normal_contracts.py','python3 scripts/validate_evidence.py','python3 scripts/finalize.py'],'date_timezone':'2026-11-08 Asia/Shanghai'})
files=[]
for p in sorted(O.rglob('*')):
 if not p.is_file() or p.name=='SOURCE_MANIFEST.json' or '__pycache__' in p.parts:continue
 b=p.read_bytes();files.append({'path':str(p.relative_to(O)),'bytes':len(b),'sha256':hashlib.sha256(b).hexdigest()})
put('SOURCE_MANIFEST.json',{'files':files,'excluded':['SOURCE_MANIFEST.json self','__pycache__'],'scope':'Owned normalTMAG/TMP/39 static exports, reused original context, finite model and provenance only'})
for x in files:
 b=(O/x['path']).read_bytes();assert len(b)==x['bytes'] and hashlib.sha256(b).hexdigest()==x['sha256']
print(json.dumps({'status':'PASS','manifest_files':len(files),'bytes':sum(x['bytes'] for x in files)}))
