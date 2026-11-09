#!/usr/bin/env python3
from pathlib import Path
import ast,hashlib,json,datetime
R=Path('/Users/dangbei/Downloads/eightsleep-firmware-research-20261107');A=R/'analysis';O=Path(__file__).resolve().parents[1]
paths=['device-side-followup/upload-distortion/model.py','finishable-20261107/host-model/model.py','finishable-20261107/host-model/previous_model.py','finishable-20261107/host-model/FINDINGS_ZH.txt','finishable-20261107/cbor-encoder/encode_buffers.py','finishable-20261107/cbor-encoder/host_signal_parser.py','prepublish-queue-20261108/model/model.py','prepublish-queue-20261108/model/README.txt','sensor-mcu/freshness/freshness_model.py','sensor-mcu/freshness/freshness_pseudocode.c','sensor-mcu/adc_spi_decoder.py','sensor-mcu/SENSOR_ANALYSIS_ZH.txt','signal-host/timing/caller/0027e7b0.c','signal-host/timing/001ffa70.asm.txt']
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def save(n,x):(O/n).write_text(json.dumps(x,ensure_ascii=False,indent=2)+'\n')
records=[{'path':str((A/p).relative_to(R)),'bytes':(A/p).stat().st_size,'sha256':sha(A/p),'lines':len((A/p).read_text().splitlines())} for p in paths]
originals=[]
for p,expected in [('mediatek/rootfs-selected/opt/eight/bin/frankenfirmware','84727b57ef8b226c78618f9fa9257df7d8ae771c78d8a51e6f3cabf0acc0c375'),('mediatek/rootfs-selected/opt/eight/lib/subsystem_updates/firmware-sensor-g0-usb.bbin','1a125674542934f36266f88d9f8ca378a6a5ca696d9e58305d1b0e533f795563')]:
 f=R/p;actual=sha(f);assert actual==expected;originals.append({'path':p,'sha256':actual,'bytes':f.stat().st_size,'verified_this_review':True})
save('SOURCE_MANIFEST.json',{'scope':'read-only source-contract review; not a new full binary audit','read_files':records,'bound_originals':originals})
index=[]
for rel in paths:
 if not rel.endswith('.py'):continue
 tree=ast.parse((A/rel).read_text())
 def walk(nodes,prefix=''):
  for n in nodes:
   if isinstance(n,(ast.FunctionDef,ast.AsyncFunctionDef,ast.ClassDef)):
    name=prefix+n.name;index.append({'file':str((A/rel).relative_to(R)),'symbol':name,'lines_inclusive':[n.lineno,n.end_lineno]})
    if isinstance(n,ast.ClassDef):walk(n.body,name+'.')
 walk(tree.body)
save('EVIDENCE_MAP.json',{'python_symbols':index,'important_joins':[{'boundary':'flags/version','source':'analysis/signal-host/timing/caller/0027e7b0.c','lines_inclusive':[385,413],'local_copy':'source-context/version-from-flags.txt'},{'boundary':'loader sample+0x7a','source':'analysis/signal-host/timing/001ffa70.asm.txt','lines_inclusive':[140,164],'local_copy':'source-context/version-loader-field.txt'}],'note':'Symbol line ranges are evidence locations, not proof all runtime callers were audited.'})
(O/'source-context').mkdir(exist_ok=True)
for name,rel,lo,hi in [('version-from-flags.txt','signal-host/timing/caller/0027e7b0.c',385,413),('version-loader-field.txt','signal-host/timing/001ffa70.asm.txt',140,164)]:
 p=A/rel;lines=p.read_text().splitlines()
 (O/'source-context'/name).write_text('SOURCE '+str(p)+'\nSHA256 '+sha(p)+'\nLINES '+str(lo)+'..'+str(hi)+' (1-based)\n'+''.join(f'{i}: {lines[i-1]}\n' for i in range(lo,hi+1)))
(O/'COMMANDS.txt').write_text('No old main scripts executed. Imports set sys.dont_write_bytecode=True.\nPYTHONDONTWRITEBYTECODE=1 python3 '+str(O/'scripts/probe_contracts.py')+'\npython3 '+str(O/'scripts/write_metadata.py')+'\n')
for p in (O/'scripts').glob('*.py'):compile(p.read_text(),str(p),'exec')
for p in O.glob('*.json'):json.loads(p.read_text())
files=[]
for p in sorted(O.rglob('*')):
 if p.is_file() and p.name!='DELIVERY_MANIFEST.json':files.append({'path':str(p.relative_to(O)),'bytes':p.stat().st_size,'sha256':sha(p)})
save('DELIVERY_MANIFEST.json',{'created':datetime.datetime.now(datetime.timezone(datetime.timedelta(hours=8))).isoformat(),'files':len(files),'bytes':sum(r['bytes'] for r in files),'self_excluded':True,'records':files})
print(json.dumps({'inputs':len(records),'original_hashes_verified':len(originals),'files':len(files),'bytes':sum(r['bytes'] for r in files)}))
if __name__=='__main__':pass
