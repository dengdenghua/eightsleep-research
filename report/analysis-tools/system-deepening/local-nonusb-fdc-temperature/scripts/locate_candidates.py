from pathlib import Path
import re,collections,json,hashlib
R=Path('/Users/dangbei/Downloads/eightsleep-firmware-research-20261107');N=R/'analysis/system-deepening-20261108';O=N/'local-nonusb-fdc-temperature';O.mkdir(exist_ok=True)
B=R/'mediatek/rootfs-selected/opt/eight/lib/subsystem_updates';u=(B/'firmware-sensor-g0-usb.bbin').read_bytes();n=(B/'firmware-sensor-g0.bbin').read_bytes();U=N/'local-signal-closure'
# Exact 16-byte matches are candidate locators only; no semantic equivalence claim.
idx=collections.defaultdict(list)
for i in range(0,len(n)-16,2):idx[n[i:i+16]].append(i)
out=[]
for name in ['0801df84','08023d28','080240e4','0802572c','08027834','0802769c','0802766c','08028b3c','08028bf4','08028c88','0802241c','08027790']:
 ps=list(U.glob('mcu-pass*/'+name+'.txt'));p=max(ps,key=lambda x:x.read_text().count('INSN '));s=p.read_text();addrs=[]
 for l in s.splitlines():
  m=re.match(r'(?:INSN )?([0-9a-f]{8})\b',l)
  if m:addrs.append(int(m[1],16))
 start=int(name,16);end=max(addrs)+2;counts=collections.Counter()
 # USB input map base is08010000; nonUSB is08008000; both verified by retained metadata.
 for a in range(start,min(end,start+1600),2):
  bs=u[a-0x8010000:a-0x8010000+16]
  if len(bs)!=16:continue
  for i in idx.get(bs,[]):
   if len(idx[bs])<=3:counts[(0x8008000+i)-a]+=1
 c=[{'nonusb_candidate_start':f'{start+d:08x}','delta':d,'matched_windows':v} for d,v in counts.most_common(3)]
 out.append({'usb_entry':name,'usb_evidence':str(p),'usb_end':f'{end:08x}','candidates':c});print(name,c)
(O/'CANDIDATE_BYTE_MATCH.json').write_text(json.dumps({'method':'exact16-byte halfword-aligned unique/low-multiplicity windows; locator only','results':out},indent=2)+'\n')
