from pathlib import Path
import subprocess,os,json,time
O=Path(__file__).resolve().parents[1]
a=['/opt/homebrew/opt/ghidra/libexec/support/analyzeHeadless','/Volumes/My Passport/eightsleep-analysis-work-20261108/persistence/Keeson10211','Keeson10211','-process','nrf52832_xxaa.bin','-readOnly','-noanalysis','-scriptPath',str(O/'scripts'),'-postScript','SlicePersistence.java',str(O/'pass1'),'1856c1baec5f9bca7151e5b550fdf0a8d749e87f889d963a3a343293a4160966','00029840','000298bc','0002b6a8','00029658','0002969c','0003098c','0002be1c']
e=os.environ.copy();e['JAVA_HOME']='/opt/homebrew/opt/openjdk@21/libexec/openjdk.jdk/Contents/Home';j={'args':a,'start_unix':time.time()}
with (O/'pass1.log').open('w') as f:p=subprocess.run(a,env=e,stdout=f,stderr=subprocess.STDOUT)
j.update(exit_code=p.returncode,end_unix=time.time());(O/'pass1-command.json').write_text(json.dumps(j,indent=2)+'\n');print(json.dumps(j));print((O/'pass1.log').read_text()[-1000:])
