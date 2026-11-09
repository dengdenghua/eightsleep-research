from pathlib import Path
import os,json,sys,subprocess,time
O=Path(__file__).resolve().parents[1];name=sys.argv[1];entries=sys.argv[2:]
args=['/opt/homebrew/opt/ghidra/libexec/support/analyzeHeadless','/Users/dangbei/Downloads/eightsleep-firmware-research-20261107/analysis/account-readonly/k60-binding/nonusb-flow/ghidra','NonUsbSensor','-process','firmware-sensor-g0.bbin','-noanalysis']
args+=['-readOnly']
args+=['-scriptPath',str(O/'scripts')]
prep=os.environ.get('LEGACY_PREP','').split(',')
if prep[0]:args+=['-preScript','PrepareLegacy.java']+prep
args+=['-postScript','ExportLegacy.java',str(O/name)]+entries
e=os.environ.copy();e['JAVA_HOME']='/opt/homebrew/opt/openjdk@21/libexec/openjdk.jdk/Contents/Home';j={'args':args,'start_unix':time.time(),'JAVA_HOME':e['JAVA_HOME']}
with (O/(name+'.log')).open('w') as f:p=subprocess.run(args,env=e,stdout=f,stderr=subprocess.STDOUT)
j.update(exit_code=p.returncode,end_unix=time.time());(O/(name+'-command.json')).write_text(json.dumps(j,indent=2)+'\n');s=(O/(name+'.log')).read_text();print('exit',p.returncode,'script_errors', 'SCRIPT ERROR'in s or 'Error running script'in s);print(s[-700:])
