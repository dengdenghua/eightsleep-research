#!/usr/bin/env python3
import hashlib,json,re,zipfile
from pathlib import Path
O=Path(__file__).resolve().parents[1];R=O.parents[2]
def put(n,x):(O/n).write_text(json.dumps(x,ensure_ascii=False,indent=2)+'\n')
entries=[]
for p in sorted(O.glob('*pass*/*.txt')):
 t=p.read_text();m=re.search(r'^TARGET (\w+) function=(\w+)',t,re.M)
 if m:entries.append({'path':str(p.relative_to(O)),'target':m[1],'function':m[2],'first_instruction_line':next((i for i,l in enumerate(t.splitlines(),1) if l.startswith('INSN ')),None)})
put('EVIDENCE_MAP.json',{'entries':entries,'paths_relative_to':'this analysis','type':'Ghidra C is pseudocode; retained INSN lines are original bytes'})
put('COVERAGE_RESIDUAL.json',{'closed_normal_processing':['6 ICM caches→84B records→38→Host fixed200slot CBOR','FDC4 corrected caches→two values3a→Host capsense CBOR','SHT40/TMP1075/MCU/ICM temperatures→43→Host pillowTemp CBOR','LIS cached-axis mean→3b→Host orientation XYZ CBOR','LIS/button candidates→36 and Host gesture/guard','startup built-in selftest stages','7 local vibration pattern tables and amplitude selection'], 'not_claimed':['physical units/board wiring/current installed component','achieved sampling freshness and callback phase or queue occurrence rate','production physiology classification beyond these normal routes','every error combination, updater, communication standard library and MCU hardware driver instruction'], 'remaining_static_normal_signal_gap_in_reviewed_main':[], 'other_same_package_files':'Covered separately by local-signal-closure; legacy-sensor-closure; local-legacy-sensor-closure; forthcoming g0-remaining-local-closure; frozen prior audit.'})
put('JOBS.json',{'environment':{'JAVA_HOME':'/opt/homebrew/opt/openjdk@21/libexec/openjdk.jdk/Contents/Home','analyzeHeadless':'/opt/homebrew/Cellar/ghidra/12.1.4/libexec/support/analyzeHeadless'},'project':'/Volumes/My Passport/eightsleep-analysis-work-20261108/pillow/Pillow.gpr','input_import_options':'-loader BinaryLoader -loader-baseAddr 0x08008000 -processor ARM:LE:32:Cortex -cspec default -preScript InitPillow.java','new_project_repair':'-process firmware-pillow.bbin -noanalysis -postScript RepairPillowMain.java; own new database only; before/after retained','exports':'-process [firmware-pillow.bbin|frankenfirmware] -readOnly -noanalysis -scriptPath scripts -postScript [PrepareClosure.java optional explicit starts] -postScript ExportLegacySamples.java output targets','logs':[{'path':str(p.relative_to(O)),'saved_lines':len(p.read_text().splitlines()),'no_reported_error':not re.search(r'^ERROR .*SCRIPT|Exception in thread',p.read_text(),re.M)} for p in sorted(O.glob('*.log'))],'exact_export_targets':entries,'offline_checks':['python3 model/normal_contracts.py','python3 scripts/validate_evidence.py','python3 scripts/finalize.py'],'no_firmware_execution':True})
files=[]
for p in sorted(O.rglob('*')):
 if not p.is_file() or p.name=='SOURCE_MANIFEST.json' or '__pycache__' in p.parts:continue
 b=p.read_bytes();files.append({'path':str(p.relative_to(O)),'bytes':len(b),'sha256':hashlib.sha256(b).hexdigest()})
put('SOURCE_MANIFEST.json',{'files':files,'excluded':['SOURCE_MANIFEST.json self','__pycache__'],'scope':'new pillow analysis exports/model/new project only'})
for x in files:assert hashlib.sha256((O/x['path']).read_bytes()).hexdigest()==x['sha256']
print(json.dumps({'status':'PASS','manifest_files':len(files),'bytes':sum(x['bytes'] for x in files)}))
