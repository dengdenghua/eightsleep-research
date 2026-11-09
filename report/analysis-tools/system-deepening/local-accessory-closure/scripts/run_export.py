#!/usr/bin/env python3
import json,os,subprocess,sys,time
from pathlib import Path
O=Path(__file__).resolve().parents[1];R=O.parents[2]
kind,label=sys.argv[1:3]
config={'trimix':('analysis/finishable-20261107/trimix/ghidra','TriMixV25','payload.bin','b5099dad86bd475a3e0fc5a208d6921eccb3302e176bc9876d795475f875f239'),'keeson':('analysis/finishable-20261107/accessories/keeson-mcu/ghidra','Keeson10211','nrf52832_xxaa.bin','1856c1baec5f9bca7151e5b550fdf0a8d749e87f889d963a3a343293a4160966')}
path,project,program,sha=config[kind]
args=['/opt/homebrew/opt/ghidra/libexec/support/analyzeHeadless',str(R/path),project,'-process',program,'-readOnly','-noanalysis','-scriptPath',str(O/'scripts'),'-postScript','ExportAccessoryClosure.java',str(O/label),sha,*sys.argv[3:]]
j=json.loads((O/'COMMANDS.json').read_text());record={'args':args,'environment':{'JAVA_HOME':'/opt/homebrew/opt/openjdk@21/libexec/openjdk.jdk/Contents/Home'},'start_unix':time.time()};j.append(record);(O/'COMMANDS.json').write_text(json.dumps(j,indent=2)+'\n')
with (O/(label+'.log')).open('x') as f:r=subprocess.run(args,env={**os.environ,'JAVA_HOME':record['environment']['JAVA_HOME']},stdout=f,stderr=subprocess.STDOUT)
record['exit_code']=r.returncode;record['end_unix']=time.time();(O/'COMMANDS.json').write_text(json.dumps(j,indent=2)+'\n');print(json.dumps({'exit':r.returncode,'label':label,'seconds':record['end_unix']-record['start_unix']}));sys.exit(r.returncode)
