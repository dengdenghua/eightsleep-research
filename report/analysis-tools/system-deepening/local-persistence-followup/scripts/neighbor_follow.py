from pathlib import Path
import os,json,subprocess,time
O=Path(__file__).resolve().parents[1];starts=['00029b8c','0002ff54','00034f90','00034fac','00035754','00036c60']
a=['/opt/homebrew/opt/ghidra/libexec/support/analyzeHeadless','/Volumes/My Passport/eightsleep-analysis-work-20261108/persistence/neighbor','Keeson10208','-process','nrf52832_xxaa.bin','-readOnly','-noanalysis','-scriptPath',str(O/'scripts'),'-preScript','DefineSelected.java']+starts+['-postScript','ExportAccessoryClosure.java',str(O/'neighbor2'),'327da40373ac54593e8cba6662d2368192355490d269a8b59894b648636613ea']+starts
j={'args':a,'start_unix':time.time()};e=os.environ.copy();e['JAVA_HOME']='/opt/homebrew/opt/openjdk@21/libexec/openjdk.jdk/Contents/Home'
with (O/'neighbor2.log').open('w') as f:p=subprocess.run(a,stdout=f,stderr=subprocess.STDOUT,env=e)
j.update(exit_code=p.returncode,end_unix=time.time());(O/'neighbor2-command.json').write_text(json.dumps(j,indent=2)+'\n');s=(O/'neighbor2.log').read_text();print('exit',p.returncode,'errors','SCRIPT ERROR'in s or 'Error running script'in s);print(s[-600:])
