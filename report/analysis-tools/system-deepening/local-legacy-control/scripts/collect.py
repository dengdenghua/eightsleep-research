from pathlib import Path
import hashlib,json,struct,shutil,re
R=Path('/Users/dangbei/Downloads/eightsleep-firmware-research-20261107')
N=R/'analysis/system-deepening-20261108';O=N/'local-legacy-control';S=O/'sources';S.mkdir(exist_ok=True)
manifest=[]
def copy(p,v):
 q=S/v/p.parent.name/p.name;q.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(p,q)
 manifest.append(dict(source=str(p),copy=str(q.relative_to(O)),sha256=hashlib.sha256(p.read_bytes()).hexdigest()))
v3=N/'legacy-sensor-closure/final-functions'
for a in '080084ec 08008bf4 08009014 08009058 08009068 0800907c 080090ac 080090c8 080090d0 08009c3c 0800b560 0800b6e4 0800b884 0800bedc 080095c8 080095e8 0800965c 08009748 08009774 080097e0 0800a588 08008a1c 08008a34 08008a50 08008a64 0800e144 0800e170 080089d0 080089f8'.split():
 p=v3/(a+'.txt')
 if p.exists():copy(p,'42292')
v2=N/'local-legacy-sensor-closure'
for folder,addrs in [('pass7','08008fd8 08009070 0800908c 08009040 0800902c 08009974 080090f0'),('pass8','0800901c 08008b6c 0800a238 08009394 08009434 080094a0 0800a350'),('configure','0800ba70 0800b448'),('pass2','0800ba70_0800d997 080089a4')]:
 for a in addrs.split():
  p=v2/folder/(a+'.txt')
  if p.exists():copy(p,'39704')
raw={}
for ver,name,gpio,pins,motortables,pwmconfig,timertables in [
 ('39704','firmware-sensor-legacy.bbin',0x800de18,[0x800e436,0x800e52a,0x800e70f,0x800e8b3],[0x800e6d3,0x800e877],[0x800e6dd,0x800e881],[0x800e72c,0x800e8d0]),
 ('42292','firmware-sensor.bbin',0x800e59c,[0x800ee02,0x800eef6,0x800f0db,0x800f27f],[0x800f09f,0x800f243],[0x800f0a9,0x800f24d],[0x800f0f8,0x800f29c])]:
 p=R/'mediatek/rootfs-selected/opt/eight/lib/subsystem_updates'/name;b=p.read_bytes();spans=[]
 def read(a,n):
  flash=a
  if ver=='42292' and 0x20000100<=a<0x20000198:flash=0x800f49c+a-0x20000100
  off=flash-0x8005000;d=b[off:off+n];assert len(d)==n
  spans.append(dict(address=f'{a:08x}',flash_address=f'{flash:08x}',offset=off,length=n,hex=d.hex()))
  return d
 def u32(a):return struct.unpack('<I',read(a,4))[0]
 def gp(i):
  port,mask,number=struct.unpack('<IHH',read(gpio+8*i,8));return dict(table_index=i,port=f'{port:08x}',mask=mask,pin_number=number)
 item=dict(original=str(p),sha256=hashlib.sha256(b).hexdigest(),size=len(b),power=[],pwm=[])
 for a,band in zip(pins,['<0x100','0x100..0x2ff','0x300..0x4ff','>=0x500']):
  ids=read(a,3);item['power'].append(dict(hwrev=band,selector_table=f'{a:08x}',selected_1=gp(ids[1]),selected_2=gp(ids[2])))
 for mt,pc,tt,band in zip(motortables,pwmconfig,timertables,['<0x500','>=0x500']):
  m=read(mt,8);rows=[]
  for i in range(6):
   config=read(pc+5*m[i],5);enabled,tidx,ch,pin,af=config
   t=read(tt+20*tidx,20);timer=struct.unpack_from('<I',t,4)[0];a,z=struct.unpack_from('<HH',t,16)
   rows.append(dict(slot=i,config_index=m[i],enabled=enabled,timer_index=tidx,timer_base=f'{timer:08x}',channel_zero_based=ch,ccr_address=f'{timer+0x34+4*ch:08x}',pin=gp(pin),alternate_function=af,divisor_a=a,divisor_b=z,cached_period=48000000//(a*z)))
  item['pwm'].append(dict(hwrev=band,slots=rows,enable_pins=[gp(m[6]),gp(m[7])]))
 if ver=='39704':
  item['alarm_patterns']=[list(read(0x800e367+i*8,8)) for i in range(2)]
  item['alarm_contexts']=[]
  for a in [0x800dfd8,0x800e9d8]:
   t=read(a,12);item['alarm_contexts'].append(dict(address=f'{a:08x}',slots=list(t[:3]),nominal_step_ms=struct.unpack_from('<I',t,4)[0],count=struct.unpack_from('<I',t,4)[0]//50))
 else:
  item['ramp_ms']=list(struct.unpack('<III',read(0x800e32c,12)))
  item['alarm_contexts']=[dict(address=f'{a:08x}',slots=list(read(a,8)[:3])) for a in [0x800e814,0x800f3bc]]
  item['alarm_patterns']=[]
  for j in range(2):
   ptn=u32(0x800e338+4*j);count,arr=struct.unpack('<II',read(ptn,8));seqs=[]
   for k in range(count):
    seq=u32(arr+4*k);num,min_ms,steps=struct.unpack('<III',read(seq,12));ss=[]
    for i in range(num):
     st=read(steps+8*i,8);ss.append(dict(duration_ms=struct.unpack_from('<I',st)[0],flags=list(st[4:7]),channel=0 if st[6] else 1 if st[5] else 2 if st[4] else None))
    seqs.append(dict(address=f'{seq:08x}',min_elapsed_ms=min_ms,steps=ss))
   item['alarm_patterns'].append(dict(index=j,address=f'{ptn:08x}',sequence_pointer_array=f'{arr:08x}',sequences=seqs))
  item['pattern_index_2_raw_word']=f'{u32(0x800e340):08x}'
 item['raw_spans']=spans;raw[ver]=item
(O/'RAW_TABLES.json').write_text(json.dumps(raw,indent=2)+'\n')
(O/'SOURCE_INDEX.json').write_text(json.dumps(manifest,indent=2)+'\n')
print('copied',len(manifest),'raw_spans',sum(len(v['raw_spans']) for v in raw.values()))
