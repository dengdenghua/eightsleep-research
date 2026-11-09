from pathlib import Path
import json,hashlib,zipfile,datetime
O=Path(__file__).resolve().parents[1];project=Path('/Volumes/My Passport/eightsleep-analysis-work-20261108/legacy')
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
def write(n,x):(O/n).write_text(json.dumps(x,ensure_ascii=False,indent=2)+'\n')
source_map=[
 ('reset/data/BSS','pass1/0800d998.txt','0800d998..0800d9cf'),
 ('normal init and loop continuous instructions','pass2/0800ba70_0800d997.txt','0800ba70..0800d997 (selected claim ranges only; not all instructions semantically audited)'),
 ('main context navigation','configure/0800ba70.txt','merged decompiler navigation; instructions in preceding range are primary'),
 ('timer start','configure/0800a14c.txt','0800a14c..0800a1d1'),
 ('timer vector index2','pass6/0800ae6a.txt','0800ae6a..0800ae73'),
 ('timer dispatch','pass4/08008a84.txt','08008a84..08008aad'),
 ('12B producer','pass3/0800989c.txt','0800989c..080098d3'),
 ('ADC reference conversion','pass4/08008f0c.txt','08008f0c..08008f93'),
 ('unsigned double integer conversion','pass5/08005728.txt','08005728..0800575d'),
 ('external ADC callback vector','pass1/0800af44.txt','0800af44..0800af5d'),
 ('24B producer normal branch','pass2/08009f68.txt','08009f68..0800a0d9'),
 ('queue enqueue','pass2/080097fc.txt','080097fc..0800982f'),
 ('queue first dequeue','pass2/08009500.txt','08009500..08009527'),
 ('0x32 sender','pass2/08009654.txt','08009654..08009791'),
 ('0x34 sender','pass2/08009528.txt','08009528..08009641'),
 ('0x34 channel pair','pass2/08008ec0.txt','08008ec0..08008f07'),
 ('0x33 init bindings','pass5/0800c64e_0800c823.txt','0800c64e..0800c823'),
 ('cap-sense normal read/state/cache','pass3/0800d2e8_0800d6df.txt','0800d30c..0800d6df'),
 ('0x33 snapshot','pass2/080081b0.txt','080081b0..08008227'),
 ('0x33 serializer','pass5/0800d3a0_0800d485.txt','0800d3a0..0800d485'),
 ('cap-sense numerical equality','pass2/080092b4.txt','080092b4..080092e7'),
 ('cap-sense status','pass2/080092f0.txt','080092f0..08009389'),
 ('NTC conversion','pass4/0800b044.txt','0800b044..0800b13d'),
 ('logarithm positive finite path','pass4/0800af98.txt','0800af98..0800b03f'),
 ('temperature blend','pass3/08008d18.txt','08008d18..08008d8d'),
 ('temperature value routes','pass4/0800b344.txt','0800b344..0800b3ef'),
 ('temperature query routes','pass4/0800b408.txt','0800b408..0800b439'),
 ('hysteresis','pass4/0800b194.txt','0800b194..0800b2fd'),
 ('environment finite conversions','pass5/0800d87c_0800d997.txt','0800d87c..0800d8c9 and0800d928..0800d965 only; exclude misdecoded tails'),
 ('framer','pass2/08008304.txt','08008304..08008351'),
 ('escape','pass3/08008124.txt','08008124..0800817d'),
 ('CRC16','pass3/080082c4.txt','080082c4..080082f9'),
 ('flush callback','pass3/080080e8.txt','080080e8..08008101'),
 ('temperature guarded state','pass7/08009070.txt','08009070..08009087'),
 ('temperature selected input','pass7/0800b3fc.txt','0800b3fc..0800b407'),
 ('power selector','pass7/08009040.txt','08009040..0800906f'),
 ('normal two-request alternation','pass7/080090f0.txt','080090f0..08009119'),
 ('power GPIO wrapper','pass8/0800901c.txt','0800901c..0800902b'),
 ('GPIO register write','pass8/08008b6c.txt','08008b6c..08008b81'),
 ('0x31 status producer','pass7/080090a4.txt','080090a4..080090e9'),
 ('serial output','pass3/0800ab9c.txt','0800ab9c..0800accd'),
]
write('NORMAL_SOURCE_MAP.json',{'sources':[{'claim':claim,'file':rel,'range':ran,'sha256':sha(O/rel)}for claim,rel,ran in source_map]})
locks=[str(p)for p in project.iterdir() if p.name.endswith('.lock') or p.name.endswith('.lck')]
assert not locks,locks
files=[]
for top in [project/'Legacy39704.gpr',project/'Legacy39704.rep']:
 if top.is_file():files.append(top)
 else:files.extend(p for p in top.rglob('*') if p.is_file())
assert all(not p.is_symlink() for p in files)
with zipfile.ZipFile(O/'ghidra-project.zip','w',zipfile.ZIP_DEFLATED,compresslevel=6,allowZip64=True)as z:
 for p in sorted(files):z.write(p,p.relative_to(project).as_posix())
with zipfile.ZipFile(O/'ghidra-project.zip')as z:
 assert z.testzip()is None
 for p in files:assert sha(p)==hashlib.sha256(z.read(p.relative_to(project).as_posix())).hexdigest()
write('PROJECT_ARCHIVE.json',{'source_project_directory':str(project),'project_closed_before_pack':True,'archive':'ghidra-project.zip','archive_sha256':sha(O/'ghidra-project.zip'),'archive_bytes':(O/'ghidra-project.zip').stat().st_size,'member_count':len(files),'all_members_verified':True,'original_external_project_retained':True,'scope':'Only Legacy39704.gpr/.rep. No APK or target runtime.'})
(O/'REPRODUCE.txt').write_text('All actions are offline static analysis. No target code/device/account executed.\nIMPORT_COMMAND.json is the exact initial new-project import. configure-command.json records mutable RAM setup on the new owned analysis project. Later pass*-command.json commands are readOnly/noanalysis. PrepareLegacy only creates explicit entry functions transiently; changes are discarded.\npython3 scripts/verify_evidence.py\npython3 scripts/freeze_evidence.py  # only while analyst-owned project is closed\n\nThe retained ghidra-project.zip is a copy of the new analysis project, not a vendor source release. input/ contains an exact unchanged copy of the supplied official BBIN, identified in INPUTS.json.\n')
items=[]
for p in sorted(O.rglob('*')):
 if p.is_file() and p.name not in ['SOURCE_MANIFEST.json','.DS_Store'] and '__pycache__'not in p.parts:items.append({'path':str(p.relative_to(O)),'bytes':p.stat().st_size,'sha256':sha(p)})
write('SOURCE_MANIFEST.json',{'schema':1,'created_utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'scope':'This finite legacy closure evidence only; excludes manifest itself and host caches.','file_count':len(items),'files':items})
print(json.dumps({'manifest_files':len(items),'manifest_sha256':sha(O/'SOURCE_MANIFEST.json'),'findings_sha256':sha(O/'FINDINGS_ZH.txt'),'project_archive_bytes':(O/'ghidra-project.zip').stat().st_size}))
