from pathlib import Path
import json
O=Path(__file__).resolve().parents[1];R=O.parents[2];p=R/'mediatek/rootfs-selected/opt/eight/lib/subsystem_updates/firmware-sensor-g0.bbin';b=p.read_bytes();base=0x8008000
want={int(x,16) for x in ['0801418c','08019f7c','0801a338','0801b834','0801d888','0801d6f0','0801eb90','0801ec48','0801ecdc','0801d6c0','0801d7e4']};out=[]
for i in range(0,len(b)-3,2):
 a=int.from_bytes(b[i:i+2],'little');c=int.from_bytes(b[i+2:i+4],'little')
 if a&0xf800!=0xf000 or c&0xd000!=0xd000:continue
 s=(a>>10)&1;j1=(c>>13)&1;j2=(c>>11)&1;v=(s<<24)|((1^(j1^s))<<23)|((1^(j2^s))<<22)|((a&0x3ff)<<12)|((c&0x7ff)<<1)
 if s:v-=1<<25
 dst=base+i+4+v
 if dst in want:out.append({'call':f'{base+i:08x}','target':f'{dst:08x}','bytes':b[i:i+4].hex()})
(O/'RAW_BL_CANDIDATES.json').write_text(json.dumps({'scope':'halfword-aligned raw BL candidate scan; caller instruction context required','calls':out},indent=2)+'\n')
for x in out:print(x)
