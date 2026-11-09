#!/usr/bin/env python3
import json,os,subprocess,sys
from pathlib import Path
O=Path(__file__).resolve().parents[1]
R=O.parents[2]
label=sys.argv[1]
args=['/opt/homebrew/opt/ghidra/libexec/support/analyzeHeadless',str(R/'analysis/finishable-20261107/trimix/ghidra'),'TriMixV25','-process','payload.bin','-readOnly','-noanalysis','-scriptPath',str(O/'scripts'),'-postScript','ExportTriMixExecution.java',str(O/label),*sys.argv[2:]]
j=json.loads((O/'COMMANDS.json').read_text())
j.append({'args':args,'environment':{'JAVA_HOME':'/opt/homebrew/opt/openjdk@21/libexec/openjdk.jdk/Contents/Home'}})
(O/'COMMANDS.json').write_text(json.dumps(j,indent=2)+'\n')
with (O/(label+'.log')).open('w') as f:
 r=subprocess.run(args,env={**os.environ,'JAVA_HOME':'/opt/homebrew/opt/openjdk@21/libexec/openjdk.jdk/Contents/Home'},stdout=f,stderr=subprocess.STDOUT)
print('exit',r.returncode,'log',O/(label+'.log'))
sys.exit(r.returncode)
