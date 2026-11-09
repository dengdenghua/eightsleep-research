from pathlib import Path
import subprocess,json,os,time
O=Path(__file__).resolve().parents[1];W=Path('/Volumes/My Passport/eightsleep-analysis-work-20261108/persistence/neighbor');W.mkdir(exist_ok=True)
entries=['00029a60','00029adc','0002b704','0002f410','000326c0','000353f0','00036c10']
a=['/opt/homebrew/opt/ghidra/libexec/support/analyzeHeadless',str(W),'Keeson10208','-import',str(O/'historical-V10208/nrf52832_xxaa.bin'),'-loader','BinaryLoader','-loader-baseAddr','0x26000','-processor','ARM:LE:32:Cortex','-noanalysis','-scriptPath',str(O/'scripts'),'-preScript','InitNeighbor.java']+entries+['-postScript','ExportAccessoryClosure.java',str(O/'neighbor1'),'327da40373ac54593e8cba6662d2368192355490d269a8b59894b648636613ea']+entries
j={'args':a,'start_unix':time.time(),'new_project_only':True};e=os.environ.copy();e['JAVA_HOME']='/opt/homebrew/opt/openjdk@21/libexec/openjdk.jdk/Contents/Home'
with (O/'neighbor1.log').open('w') as f:p=subprocess.run(a,stdout=f,stderr=subprocess.STDOUT,env=e)
j.update(exit_code=p.returncode,end_unix=time.time());(O/'neighbor1-command.json').write_text(json.dumps(j,indent=2)+'\n');s=(O/'neighbor1.log').read_text();print('exit',p.returncode,'errors','SCRIPT ERROR'in s or 'Error running script'in s);print(s[-600:])
