from pathlib import Path
import json,hashlib,shutil
O=Path(__file__).resolve().parents[1];R=O.parents[2];N=O.parent
entries=json.loads((O/'REUSED_SOURCES.json').read_text())
def copy(rel,dst):
 p=R/rel;q=O/dst;q.parent.mkdir(parents=True,exist_ok=True);shutil.copyfile(p,q)
 item={'original':rel,'retained':dst,'sha256':hashlib.sha256(p.read_bytes()).hexdigest()}
 if not any(x['retained']==dst for x in entries):entries.append(item)
for name in ['TAP_SIGNAL_PROCESSING_ZH.txt','FRONTEND_DSP_ZH.txt','SENSOR_ANALYSIS_ZH.txt','SAMPLE_FRESHNESS_ZH.txt']:
 copy('analysis/sensor-mcu/'+name,'source/prior/'+name)
for rel,name in [('sensor-diff','sensor-diff'),('sensor-nonusb-dispatch','sensor-nonusb-dispatch'),('capsense-producer-binding','capsense-producer-binding'),('host-legacy-sample-consumers','host-legacy-sample-consumers')]:
 copy('analysis/system-deepening-20261108/'+rel+'/FINDINGS_ZH.txt','source/prior/'+name+'.txt')
copy('analysis/thermal-deep/THERMAL_REPORT_ZH.txt','source/prior/THERMAL_REPORT_ZH.txt')
copy('analysis/system-deepening-20261108/host-legacy-sample-consumers/source/usb/main-full.txt','source/usb/main-full.txt')
for file in ['0021ac58.txt','0021acbc.txt','001e7c64.txt','001eeaf0.txt','001fce40.txt','001e9390.txt']:
 matches=list((N/'host-legacy-sample-consumers').rglob(file))
 if len(matches)==1:copy(str(matches[0].relative_to(R)),'source/host/'+file)
 else: print('NEEDS SOURCE',file,[str(x) for x in matches])
copy('analysis/system-deepening-20261108/host-legacy-sample-consumers/model/normal_contracts.py','model/vendor/normal_contracts.py')
(O/'REUSED_SOURCES.json').write_text(json.dumps(entries,ensure_ascii=False,indent=2)+'\n')
inputs=[]
for family,name,base in [('host','frankenfirmware','00100000'),('usb','firmware-sensor-g0-usb.bbin','08010000')]:
 rel=('mediatek/rootfs-selected/opt/eight/bin/' if family=='host' else 'mediatek/rootfs-selected/opt/eight/lib/subsystem_updates/')+name;p=R/rel
 inputs.append({'family':family,'path':rel,'size':p.stat().st_size,'sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'mapping_base':base})
(O/'INPUTS.json').write_text(json.dumps(inputs,indent=2)+'\n')
