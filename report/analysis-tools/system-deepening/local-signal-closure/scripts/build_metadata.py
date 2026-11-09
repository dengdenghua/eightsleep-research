#!/usr/bin/env python3
"""Index actual retained sources and bounded coverage. Does not run firmware."""
from pathlib import Path
import hashlib,json,re,struct
O=Path(__file__).resolve().parents[1];R=O.parents[2]
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def put(name,data):(O/name).write_text(json.dumps(data,ensure_ascii=False,indent=2)+'\n')
usb=R/'mediatek/rootfs-selected/opt/eight/lib/subsystem_updates/firmware-sensor-g0-usb.bbin';raw=usb.read_bytes()
def table(a,n,meaning):
 b=raw[a-0x8010000:a-0x8010000+n]
 return {'va':f'{a:08x}','file_offset':a-0x8010000,'bytes_hex':b.hex(),'meaning':meaning}
maps=[table(a,n,label) for a,n,label in [(0x8031c60,4,'A27 mode0 channel map'),(0x8031c64,8,'J01+ extended map'),(0x8031c6c,8,'J01+ queen map'),(0x8031c74,8,'J00 extended map')]]
assert [x['bytes_hex'] for x in maps]==['01000203','0040014102420343','0040014102424303','4202400043034101']
thresholds=table(0x8031c38,20,'status 0..4 age thresholds in tick');thresholds['u32_values']=list(struct.unpack('<5I',bytes.fromhex(thresholds['bytes_hex'])))
assert thresholds['u32_values']==[0,60000,3000,3000,60000]
policy=table(0x8031c32,6,'status index1..4 uses any/any/all/any');assert bytes.fromhex(policy['bytes_hex'])[1:5]==b'\x01\x01\x00\x01'
ptrs=table(0x8031c4c,20,'MCU status strings');strings=[]
for v in struct.unpack('<5I',bytes.fromhex(ptrs['bytes_hex'])):
 s=raw[v-0x8010000:raw.index(b'\0',v-0x8010000)].decode('ascii');strings.append(table(v,len(s)+1,s))
assert [x['meaning'] for x in strings]==['good','railed','locked','converged','too low']
main=table(0x801f618,14,'main state0..6 u16 jump offsets');main['targets']=[f'{0x801f618+2*x:08x}' for x in struct.unpack('<7H',bytes.fromhex(main['bytes_hex']))]
getter=table(0x80226d6,8,'mode0 getter channel0..7 u8 jump offsets');getter['targets']=[f'{0x80226d6+2*x:08x}' for x in bytes.fromhex(getter['bytes_hex'])]
put('MCU_TABLES.json',{'input':str(usb.relative_to(R)),'sha256':sha(usb),'maps':maps,'status_thresholds':thresholds,'status_policy':policy,'status_pointers':ptrs,'strings':strings,'main_switch':main,'getter_switch':getter})

prior=O/'source/usb/main-full.txt';after=O/'mcu-pass8/0801f0d0.txt'
def unknowns(p):return sorted(set(re.findall(r'func_0x([0-9a-f]{8})',p.read_text().split('\nINSN ')[0])))
meaning={'0802572c':'FDC aggregate progression, status timer, normal 33/44 producer','0802769c':'ADC/NTC numerical conversion','0802766c':'bounded temperature FIFO push; oldest replaced on full','08024f3c':'driver enabled and status bit getter','08028b3c':'temperature missing-value selection and weighted combination'}
put('UNDEFINED_NORMAL_MAIN_CALLS.json',{'before':{'path':str(prior.relative_to(O)),'sha256':sha(prior),'undefined':unknowns(prior)},'after':{'path':str(after.relative_to(O)),'sha256':sha(after),'undefined':unknowns(after)},'restored':[{'address':a,'meaning':meaning.get(a),'retained':f'mcu-pass8/{a}.txt'} for a in unknowns(prior)],'limits':'Only func_0x calls printed by this recovered main decompilation; zero remaining is not whole-program coverage or proof all indirect callees are recovered.'})

identities=[]
covered={
'firmware-frozen.bbin':('reused_scope','analysis/thermal-deep/THERMAL_REPORT_ZH.txt','MTK Frozen thermal feedback/calibration/control; do not substitute historical selected-rootfs/NXP MCU_FINDINGS.'),
'firmware-pillow.bbin':('next_owned','analysis/system-deepening-20261108/local-pillow-closure','90,220 B distinct firmware. New independent entry/main/normal sensor-processing analysis to follow; not completed by G0 findings.'),
'firmware-sensor-g0-usb.bbin':('this_scope','analysis/system-deepening-20261108/local-signal-closure/FINDINGS_ZH.txt','Normal 35/FDC33/44/NTC/config contracts; earlier0x3c/front-end/tap/lifecycle evidence reused. Magnetic auxiliary0x39 MCU drivers not fully followed here.'),
'firmware-sensor-g0.bbin':('partial_reused','analysis/system-deepening-20261108/sensor-nonusb-dispatch/FINDINGS_ZH.txt','Separate132,896 B input. Existing startup/K60 map/ADC dispatch and comparative audit; exact FDC/temp equivalence not inferred from USB.'),
'firmware-sensor.bbin':('parallel_active','analysis/system-deepening-20261108/legacy-sensor-closure','42,292 B independent project owned by report_language_finish; evidence state must be read from that report, not assumed completed here.'),
'firmware-sensor-legacy.bbin':('parallel_assigned','analysis/system-deepening-20261108/local-legacy-sensor-closure','39,704 B assigned to live_backend_tests after Jetlag; no claimed whole-file coverage from name.')}
for p in sorted(usb.parent.glob('*.bbin')):
 st,report,note=covered[p.name];identities.append({'name':p.name,'path':str(p.relative_to(R)),'bytes':p.stat().st_size,'sha256':sha(p),'status_at_this_report':st,'evidence_or_assigned_output':report,'notes':note})
residuals=[
 {'id':'physical-binding','kind':'needs-hardware-or-board-material','detail':'Actual electrode/thermistor pad wiring, units of FDC values, sensor tolerances, achieved timing and target currently installed firmware/config.'},
 {'id':'g0-nonusb-equivalence','kind':'available-static','detail':'Bind nonUSB FDC/temp implementation separately or byte-normalized equivalence; USB findings alone do not establish it.'},
 {'id':'g0-aux39-mcu','kind':'available-static','detail':'Main normal0x39 auxiliary sensor drivers080294b0/08029574 and callbacks; Host TMAG thresholds already in LOCAL_PHYSIOLOGY_AUDIT, MCU numerical setup not all covered here.'},
 {'id':'three-small-bbins','kind':'available-static-parallel','detail':'pillow90220 next here; sensor42292 parallel; legacy39704 assigned. Not needs-device for static normal processing.'},
 {'id':'production-physiology','kind':'component-not-obtained','detail':'No recovered production sleep stages/HR/HRV/occupancy model in the closed routes; do not substitute patents or cloud result version numbers.'},
 {'id':'runtime-config','kind':'needs-runtime-or-config-material','detail':'Per-device label/config may choose legacy Sensor or USB; bundle-default conditional enable is proved, target selection not.'}]
put('COVERAGE_RESIDUAL.json',{'scope':'bounded normal MCU/Frank processing; no target execution','firmwares':identities,'closed_this_round':['legacy configuration and actual handle1 read/write callbacks','35 mean/range/Z/status producer-to-CBOR mapping and initialization','FDC normal33/44 producer, arithmetic/cache/status/map and Host type','NTC conversion/rolling valid mean/weighted selection and normal output'],'inherited_not_new':['0x3c timing/CBOR/queues','16->25 formula itself','16bit+10d8 physiological absence audit','Host magnetic connection/orientation and TTC action distinctions'],'residuals':residuals})

claims=[('legacy-enable','pass1/0024abe0.txt','source/host/00185920.txt'),('read-write','pass1/00202a64.txt','pass1/002379a0.txt'),('35-range','mcu-pass2/080253c8.txt','source/host/001fce40.txt'),('FDC-registers','mcu-pass8/0801df84.txt','mcu-pass6/080240e4.txt'),('FDC-producer','mcu-pass8/0802572c.txt','mcu-pass9/08020028_08020227.txt'),('FDC-status','mcu-pass7/08022c2c.txt','mcu-pass8/08022694.txt'),('33-consumer','pass3/0021abe0.txt','pass4/001f2c20.txt'),('44-consumer','pass3/0021ad74.txt','pass3/001f5b80.txt'),('NTC-filter','mcu-pass8/0802769c.txt','mcu-pass11/08028bf4.txt'),('NTC-merge','mcu-pass10/0802241c.txt','mcu-pass8/08028b3c.txt')]
put('EVIDENCE_MAP.json',[{'claim':claim,'sources':[{'path':s,'sha256':sha(O/s),'lines':len((O/s).read_text().splitlines()),'instruction_start_line':next((i for i,l in enumerate((O/s).read_text().splitlines(),1) if l.startswith('INSN ')),None)} for s in sources]} for claim,*sources in claims])
jobs=[]
for p in sorted(O.glob('*.log')):
 t=p.read_text();jobs.append({'log':p.name,'sha256':sha(p),'success_evidence':'Discarding changes' in t and 'error:' not in t,'script_invocations':[l.strip() for l in t.splitlines() if 'REPORT: Execute script:' in l],'limits':'Exit status alone is not used; Java script errors override shell0.'})
put('JOBS.json',{'host_project':str(R/'analysis/signal-host/ghidra/SignalHost.gpr'),'sensor_project':str(R/'analysis/sensor-mcu/ghidra/sensor.gpr'),'read_only':True,'no_analysis':True,'jobs':jobs})
print(json.dumps({'tables':len(maps)+len(strings)+5,'firmware_inputs':len(identities),'before_undefined':unknowns(prior),'after_undefined':unknowns(after),'jobs':len(jobs)}))
