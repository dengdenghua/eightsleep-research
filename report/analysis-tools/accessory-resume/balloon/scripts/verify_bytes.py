from pathlib import Path
import json,hashlib,re,struct
w=Path('/Volumes/My Passport/EightSleep/workspace/accessory-resume-20261108/balloon')
r=Path('/Users/dangbei/Downloads/eightsleep-firmware-research-20261107')
p=r/'mediatek/rootfs-selected/opt/eight/lib/subsystem_updates/balloon/A02/firmware-balloon-g0.bbin'
if not p.exists():
 matches=list((r/'mediatek/rootfs-selected').rglob('firmware-balloon-g0.bbin'))
 p=next(q for q in matches if hashlib.sha256(q.read_bytes()).hexdigest()=='0a2fa991c548478fa614d227777222f3f0914594f8db779bcc3837f30cd2e67a')
b=p.read_bytes();assert hashlib.sha256(b).hexdigest()=='0a2fa991c548478fa614d227777222f3f0914594f8db779bcc3837f30cd2e67a'
checks=[];literals=[]
for f in sorted(w.glob('pass*/*.txt')):
 for addr,h in re.findall(r'^INSN ([0-9a-f]+) ([0-9a-f]+) ',f.read_text(),re.M):
  i=int(addr,16)-0x8010000;raw=bytes.fromhex(h);assert b[i:i+len(raw)]==raw,(f.name,addr)
  checks.append({'file':str(f.relative_to(w)),'address':addr,'bytes':h})
 for addr,h in re.findall(r'REF\[(?:READ|DATA):([0-9a-f]+)=([0-9a-f]+)\]',f.read_text()):
  i=int(addr,16)-0x8010000
  if 0<=i<=len(b)-4:
   got=int.from_bytes(b[i:i+4],'little');assert got==int(h,16),(f.name,addr)
   literals.append({'file':str(f.relative_to(w)),'address':addr,'word':h})
# Half-open normal object extents, and every possible software bag fault byte.
faults=[0x2000aa30+0x1558+i*0xe0+0xa2 for i in range(5)]
regions=[]
for base in [0x2000a5e8,0x2000a754,0x2000a8c0]:regions.append({'role':'I2C request queue storage normal init','start':base+0x30,'end_exclusive':base+0x130})
regions.append({'role':'SHT40 read scratch after normal initialization','start':0x2000b184,'end_exclusive':0x2000b18c})
for i in range(6):regions.append({'role':'LPS pressure object clear, normal mapping index 0..5','start':0x2000aa30+i*0x104,'end_exclusive':0x2000aa30+i*0x104+0xec})
for x in regions:assert not any(x['start']<=a<x['end_exclusive'] for a in faults)
(w/'VERIFICATION.json').write_text(json.dumps({'result':'PASS','sample':str(p),'sample_sha256':hashlib.sha256(b).hexdigest(),'instruction_records':len(checks),'flash_literal_records':len(literals),'records_include_duplicate_merged_function_exports':True,'instruction_records_detail':checks,'literals':literals,'normal_regions':regions,'fault_bytes':[hex(x) for x in faults],'scope':'Every retained instruction/literal record rebound to original BBIN; interval exclusion applies only to bound normal contexts and mappings, not arbitrary aliases or all callers.'},indent=2)+'\n')
print(json.dumps({'result':'PASS','instructions':len(checks),'literals':len(literals),'regions':len(regions)}))
