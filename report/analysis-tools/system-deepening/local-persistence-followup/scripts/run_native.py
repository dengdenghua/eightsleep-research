from pathlib import Path
import sys,os,json,subprocess,time
O=Path(__file__).resolve().parents[1];W=Path('/Volumes/My Passport/eightsleep-analysis-work-20261108/persistence');family,batch,*entries=sys.argv[1:]
name,prog,sha,lo,hi={'keeson':('Keeson10211','nrf52832_xxaa.bin','1856c1baec5f9bca7151e5b550fdf0a8d749e87f889d963a3a343293a4160966','20003b00','20004000'),'trimix':('TriMixV25','payload.bin','b5099dad86bd475a3e0fc5a208d6921eccb3302e176bc9876d795475f875f239','20007f00','20008000')}[family]
a=['/opt/homebrew/opt/ghidra/libexec/support/analyzeHeadless',str(W/name),name,'-process',prog,'-readOnly','-noanalysis','-scriptPath',str(O/'scripts'),'-postScript','ExportAccessoryClosure.java',str(O/batch),sha]+entries
if batch.endswith('scan'):a+=['-postScript','ScanPersistence.java',str(O/(batch+'-all')),lo,hi]
e=os.environ.copy();e['JAVA_HOME']='/opt/homebrew/opt/openjdk@21/libexec/openjdk.jdk/Contents/Home';j={'args':a,'start_unix':time.time()}
with (O/(batch+'.log')).open('w') as f:p=subprocess.run(a,env=e,stdout=f,stderr=subprocess.STDOUT)
j.update(exit_code=p.returncode,end_unix=time.time());(O/(batch+'-command.json')).write_text(json.dumps(j,indent=2)+'\n');s=(O/(batch+'.log')).read_text();print('exit',p.returncode,'errors','SCRIPT ERROR'in s or 'Error running script'in s);print(s[-500:])
