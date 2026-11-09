#!/usr/bin/env python3
"""Inspect a fixed allowlist of shipped configuration, symlinks and Go buildinfo.
Does not contact a device, read authentication material, or execute firmware.
"""
from pathlib import Path
import json,hashlib,tarfile
ROOT=Path(__file__).resolve().parent
PROJECT=ROOT.parents[2]
PACKAGE=PROJECT/'materials/eightsleep-full-evidence-20261107/firmware/mtk'
FILES=['etc/nats.conf','etc/ssh/sshd_config','etc/ssh/sshd_config_readonly','etc/systemd/network/usb.network','lib/systemd/usbgadget-net.sh','lib/systemd/system/usbnet.service','lib/systemd/system/sshd.socket','lib/systemd/system/sshd@.service','lib/systemd/system-preset/98-openssh-sshd.preset','etc/modules-load.d/usbgadget.conf','lib/systemd/system/serial-getty@.service']
LINKS=['etc/systemd/system/multi-user.target.wants/usbnet.service','etc/systemd/system/sockets.target.wants/sshd.socket']
def sha(b):return hashlib.sha256(b).hexdigest()
def buildinfo(b):
 off=b.find(b'\xff Go buildinf:');assert off>=0 and b[off+15]&2
 i=off+32
 def read():
  nonlocal i
  n=shift=0
  while True:
   x=b[i];i+=1;n|=(x&127)<<shift
   if x<128:break
   shift+=7
  out=b[i:i+n];i+=n;return out
 version=read().decode();module=read().decode(errors='replace')
 lines=[x for x in module.splitlines() if x.startswith(('mod\t','build\tvcs','build\tGOOS','build\tGOARCH'))]
 return {'offset':off,'go_version':version,'module_and_build':lines}
def main():
 rows=[];links=[];matches={p:[] for p in FILES+LINKS}
 with tarfile.open(PACKAGE/'rootfs.tar','r:') as tar:
  for item in tar:
   p=item.name.removeprefix('./')
   if p in matches:matches[p].append(item)
  for p in FILES:
   fs=[i for i in matches[p] if i.isfile()];assert len(fs)==1,(p,len(fs))
   b=tar.extractfile(fs[0]).read();encoded=p.replace('@','%40');material=(PACKAGE/'rootfs/files'/encoded).read_bytes();assert material==b,p
   out=ROOT/'source'/p;out.parent.mkdir(parents=True,exist_ok=True);out.write_bytes(b)
   rows.append({'path':p,'snapshot':'source/'+p,'sha256':sha(b),'bytes':len(b),'tar_offset':fs[0].offset_data,'exact_materialized_match':True})
  for p in LINKS:
   syms=[i for i in matches[p] if i.issym()];assert len(syms)==1
   links.append({'path':p,'target':syms[0].linkname,'tar_header_offset':syms[0].offset})
  overrides=[i.name for i in tar.getmembers() if i.name.removeprefix('./').startswith('etc/ssh/sshd_config.d/') and i.isfile() and i.name.endswith('.conf')]
  b=tar.extractfile('./usr/bin/nats-server').read()
 result={'scope':'Frozen MTK package only; actual Pod6 deployment and physical port exposure unverified','firmware':json.loads((PACKAGE/'source-identity.json').read_text()),'files':rows,'enabled_symlinks':links,'ssh_dropin_conf_files':overrides,'nats_server':{'sha256':sha(b),'bytes':len(b),'buildinfo':buildinfo(b)},'device_or_network_operations':0}
 (ROOT/'ACCESS_INVENTORY.json').write_text(json.dumps(result,ensure_ascii=False,indent=2)+'\n')
 print(json.dumps({'verified_config_files':len(rows),'enabled_links':links,'ssh_dropins':overrides,'nats_buildinfo':result['nats_server']['buildinfo']},ensure_ascii=False))
if __name__=='__main__':main()
