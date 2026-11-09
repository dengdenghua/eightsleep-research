#!/usr/bin/env python3
"""Recheck retained original bytes and build an evidence-only manifest."""
from pathlib import Path
import re, struct, json, hashlib, datetime
from zoneinfo import ZoneInfo

D=Path(__file__).resolve().parents[1]
R=D.parents[2]
REL='mediatek/rootfs-selected/opt/eight/lib/subsystem_updates/firmware-sensor-g0-usb.bbin'
BIN=(R/REL).read_bytes(); BASE=0x08010000
SHA='1a125674542934f36266f88d9f8ca378a6a5ca696d9e58305d1b0e533f795563'
assert hashlib.sha256(BIN).hexdigest()==SHA and len(BIN)==140828
def put(name,data):
    (D/name).write_text(json.dumps(data,ensure_ascii=False,indent=2)+'\n')
def digest(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def bl(a,b):
    hi,lo=struct.unpack('<HH',b);s=(hi>>10)&1
    i1=1^((lo>>13)&1)^s;i2=1^((lo>>11)&1)^s
    n=(s<<24)|(i1<<23)|(i2<<22)|((hi&1023)<<12)|((lo&2047)<<1)
    return (a+4+n-((1<<25) if s else 0))&0xffffffff
seen={};occ=branches=literals=0;entries=[];empty=[]
for p in sorted(set(D.glob('pass*/*.txt'))|set((D/'source').glob('*.txt'))):
    text=p.read_text();t=re.search(r'^TARGET (\w+) function=(\w+)',text,re.M)
    if t:
        row={'path':str(p.relative_to(D)),'target':t[1],'function':t[2],
             'first_instruction_line':next((i for i,l in enumerate(text.splitlines(),1) if l.startswith('INSN ')),None)}
        entries.append(row)
        if t[2]=='none':empty.append(row['path'])
    for line_no,line in enumerate(text.splitlines(),1):
        m=re.match(r'INSN ([0-9a-fA-F]{8}) ([0-9a-fA-F]+) (.*)',line)
        if not m:continue
        a=int(m[1],16);b=bytes.fromhex(m[2]);off=a-BASE
        assert off>=0 and BIN[off:off+len(b)]==b,(p,line_no,hex(a))
        assert a not in seen or seen[a]==b,(p,line_no)
        seen[a]=b;occ+=1
        q=re.match(r'bl 0x([0-9a-fA-F]{8})\b',m[3])
        if q:assert bl(a,b)==int(q[1],16),(p,line_no);branches+=1
        for ad,va in re.findall(r'REF\[READ:([0-9a-fA-F]{8})=([0-9a-fA-F]+)\]',m[3]):
            ad=int(ad,16)
            if BASE<=ad<=BASE+len(BIN)-4:
                assert int.from_bytes(BIN[ad-BASE:ad-BASE+4],'little')==int(va,16),(p,line_no)
                literals+=1
put('INPUTS.json',{'source_relative':REL,'bytes':len(BIN),'sha256':SHA,'mapping':'Ghidra VA = 0x08010000 + original file offset; 128-byte header retained','method':'Retained full exports plus existing Ghidra readonly/noanalysis project; REA MCP unavailable, no fabricated Evidence ID','target_execution':False,'device_account_network_requests':False,'network_scope':'Only public ST official source reference downloads; no device API'})
put('BYTE_VALIDATION.json',{'status':'PASS','input_sha256':SHA,'instruction_occurrences':occ,'unique_instructions':len(seen),'unique_bytes':sum(map(len,seen.values())),'direct_Thumb_BL_checks':branches,'file_backed_literal_checks':literals,'scope':'Retained instruction bytes, direct BL encodings and inline file-backed literal values. Does not execute firmware or prove hardware behavior.'})
put('EVIDENCE_MAP.json',{'entries':entries,'empty_process_exports':empty,'empty_export_rule':'Retained process artifacts, not absence evidence; later explicitly defined normal-entry exports supersede them. pass13/0801a8ec is an interior-address process export, excluded from call-entry proof; real MSP entry is pass14/0801a8cc.','line_numbers':'1-based first INSN; each file retains complete function and xref context.'})
tables=[]
def table(addr,n,label):
    assert BASE<=addr and addr+n<=BASE+len(BIN)
    tables.append({'va':f'{addr:08x}','file_offset':addr-BASE,'label':label,'bytes':n,'hex':BIN[addr-BASE:addr-BASE+n].hex()})
table(0x08010080,46*4,'vector table 16 core entries + 30 external entries; excludes following code')
table(0x0802fbc8,14*8,'14 cumulative board threshold/function records')
table(0x0802fd0c,40,'channel-map region; exact consumers distinguish individual 8-byte arrays')
for i in [0x38,0x3f,0x45,0x46,0x27,0x28,0x2d,0xd,0x54,0x22,0x3c]:
    table(0x08031d34+12*i,12,f'GPIO table index 0x{i:x}')
put('RAW_TABLES.json',{'tables':tables,'board_records':[{'threshold':hex(struct.unpack_from('<H',BIN,0x0802fbc8-BASE+8*i)[0]),'function_thumb':hex(struct.unpack_from('<I',BIN,0x0802fbc8-BASE+8*i+4)[0])}for i in range(14)]})
put('CONTRACTS.json',{
 'i2c':{
  'bus_bindings':[
   {'bus':'2000ac00','hal':'20000b50','peripheral':'40005400','irq':23,'rx_dma_handle':'200009e8','rx_dma':'DMA1_CH3','tx_dma_handle':'20000988','tx_dma':'DMA1_CH4','complete':'08018ab4','error':'0801c64c'},
   {'bus':'2000ad6c','hal':'20000acc','peripheral':'40005800','irq':24,'rx_dma_handle':'20000928','rx_dma':'DMA2_CH4','tx_dma_handle':'200008c8','tx_dma':'DMA2_CH5','complete':'08018d8c','error':'0801c660'},
   {'bus':'2000aed8','hal':'20000a48','peripheral':'40008800','irq':24,'rx_dma_handle':'20000868','rx_dma':'DMA1_CH5','tx_dma_handle':'20000808','tx_dma':'DMA1_CH6','complete':'08018a98','error':'0801c674'}],
  'start_hal_to_wrapper':{'0':'1, accepted','nonzero':'0801963c reset then 0, not accepted'},
  'normal': ['08013988/13ac0 DMA start','08012990 DMA IRQ','0801310c/1315c DMA completion','08013320 I2C events','0801301c normal STOP','installed bus completion→bus+20=1','0801c688 main request callback'],
  'error': ['08013c7a BERR/ARLO/OVR with ERRIE, or 08013320 NACK, or 080130f4 DMA error','08012f2c cleanup and optional asynchronous DMA abort','08012f0c/08012ee4 error callback','0801c598 writes bus+20=2; optional recovery when timer age>=10000','0801c688 skips sensor callback'],
  'error_masks':{'hardware_ISR_100':'HAL1 BERR','hardware_ISR_200':'HAL2 ARLO','hardware_ISR_400':'HAL8 OVR','transaction_NACK_10':'HAL4','DMA_error':'HAL16'},
  'boundary':'DMA completion, I2C completion and sensor callback are distinct; hardware event timing and all HAL modes are not simulated.'},
 'spi':{'wrappers':{'0801a134':{'handle':'20000c74','base':'40003800','name':'SPI2'},'0801a164':{'handle':'20000d00','base':'40013000','name':'SPI1'},'0801a194':{'handle':'20000be8','base':'40003c00','name':'SPI3'}},'transfer':'080158d4','timeout_argument_ticks':2,'hal_to_wrapper':{'0':0,'nonzero':1,'not_initialized':1},'end_checks':['TX_FIFO_level==0','BSY==0','RX_FIFO_level==0'],'meaning':'SPI wrapper 0 means success; inverse polarity to I2C start wrapper.'},
 'drdy':{'adc_legacy':['PD2 low','PB0 low'],'adc_new':['PD11 low','PE2 low'],'imu':['PE8 high','PE9 high','PC10 high','PC11 high'],'sensor_update_gates':['GPIO gate','successful SPI operation','register ready bits'],'physical_wiring_verified':False},
 'boards':{'table':'0802fbc8','records':14,'selection':'all threshold<=hwrev in file order','model':'Only six SPI device descriptors; not all SKU or mode gates.','production_info':'0807f804 outside supplied BBIN file-backed range'},
 'internal_adc':{'hal':'2000075c','peripheral':'40012400','dma_handle':'200006fc','dma_peripheral':'4002041c DMA2_CH2','irq':11,'chain':['080120bc','DMA2_CH2 TC→08012990','08011a64','ADC+64→080223a0','200026e8 completion_count++'],'error_chain':['DMA TE→08011aea','ADC state|=0x40/error|=4','ADC+70 error callback'],'boundary':'Separate internal thermal ADC; not external ADS SPI freshness.'},
 'spi_msp':{'default':'080112c0','selected_A00_A10_A30':'08019944 via each handle+84','selected_A05_A33_and_later_USB':'08019a20 via each handle+84','pins_19944':{'SPI1':'PB3/4/5','SPI2':'PD1/3/4'},'pins_19a20':{'SPI1':'PE13/14/15','SPI2':'PD1/3/4','SPI3':'PB3/4/5'},'physical_board_verified':False},
 'timebase':{'gettick':'080119ec reads2000121c','systick':'vector15→080114a2→080119d4 adds20000258','requested_step':1,'nominal_config':'SysTick reload based on SystemCoreClock/(1000/step), successful init; actual timing not measured'},
 'excluded':['shared-log formatting/reentrancy analysis','malformed protocol input','memory corruption or exploit development','hardware/account/API access']})
put('COVERAGE_RESIDUAL.json',{'rows':[
 {'entry':'I2C start and DMA/IRQ completion','status':'closed-selected-normal-master-DMA','evidence':['08013988','08013ac0','08010e54','08012990','0801310c','0801315c','08013320','0801301c'],'remaining':'All slave/memory/sequence modes and hardware concurrency combinations not enumerated.'},
 {'entry':'I2C hardware error to bus state2','status':'closed-selected-error-branches','evidence':['08013c7a','080130f4','08012f2c','08012ee4','0801c598'],'remaining':'Actual electrical causes, abort delay and simultaneous hardware events require hardware observations.'},
 {'entry':'SPI transfer and timeout return','status':'closed-normal-master-8bit-2line','evidence':['0801a134','0801a164','0801a194','080158d4','080156f8'],'remaining':'Actual SCK, real-time latency and nonselected SPI modes not claimed.'},
 {'entry':'ADC/IMU GPIO and register-ready gate','status':'closed-normal-main-producers','evidence':['0801f0d0','0801dd6c','0801d7dc','0801ef68','08029ba4'],'remaining':'Physical pin wiring, installation and actual missed events unknown.'},
 {'entry':'Board rule selection','status':'closed-table-and-selected-descriptors','evidence':['08027834','14 table functions','RAW_TABLES.json','model/results/selected-board-bindings.json'],'remaining':'Actual production flash hwrev/SKU and board deployment not present in BBIN.'},
 {'entry':'Internal thermal ADC DMA completion','status':'closed-selected-normal-start/completion','evidence':['080120bc','08010a5c','0801a8cc','08012990','08011a64','080223a0','08011aea'],'remaining':'Full internal ADC hardware error combinations and actual electrical conversion timing not simulated.'},
 {'entry':'Nominal driver tick','status':'closed-configured-timebase','evidence':['0801195c','0801244c','080119f8','080114a2','080119d4'],'remaining':'Configured tick does not prove wall-clock ISR timing.'}
 ],'previously_closed':['CRC arithmetic and retained sensor caches','FDC/TMAG/TMP recovery state machines','ADC/IMU queue and stop/start distinctions'],'no_whole_chip_exhaustion_claim':True})
model=json.loads((D/'MODEL_RESULTS.json').read_text())
assert model['status']=='PASS' and model['case_count']==33 and len(model['cases'])==33
for c in model['cases']:assert c['status']=='PASS' and c['observed']==c['expected'],c['name']
for row in model['artifacts']:
    p=(D/row['path']).resolve();assert p.is_relative_to(D.resolve())
    assert p.stat().st_size==row['bytes'] and digest(p)==row['sha256']
logs=[]
for f in sorted(D.glob('pass*.log'),key=lambda p:int(re.search(r'\d+',p.name)[0])):
    t=f.read_text()
    assert not re.search(r'ERROR .*SCRIPT|Exception in thread',t),f
    logs.append({'path':f.name,'script_invocations':re.findall(r'^.*Execute script: (.*)$',t,re.M),'process_exit_code':0,'note':'Exit code observed via exec session completion.'})
put('JOBS.json',{'JAVA_HOME':'/opt/homebrew/opt/openjdk@21/libexec/openjdk.jdk/Contents/Home','analyzeHeadless':'/opt/homebrew/Cellar/ghidra/12.1.4/libexec/support/analyzeHeadless','project':'R/analysis/sensor-mcu/ghidra/sensor','common_options':['-readOnly','-noanalysis','-process','firmware-sensor-g0-usb.bbin'],'scripts_path':'this/scripts','retained_logs':logs,'offline_reproduction':['python3 model/normal_driver_contracts.py','python3 scripts/finalize.py'],'no_saved_project_changes':True})
files=[]
for p in sorted(D.rglob('*')):
    if not p.is_file() or p.name=='SOURCE_MANIFEST.json' or '__pycache__' in p.parts:continue
    files.append({'path':str(p.relative_to(D)),'bytes':p.stat().st_size,'sha256':digest(p)})
put('SOURCE_MANIFEST.json',{'generated_at':datetime.datetime.now(ZoneInfo('Asia/Shanghai')).isoformat(),'files':files,'exclusions':['SOURCE_MANIFEST.json itself','__pycache__'],'scope':'New local-acquisition-final-pass only; no old evidence modified.'})
for row in files:
    p=D/row['path'];assert p.stat().st_size==row['bytes'] and digest(p)==row['sha256']
print(json.dumps({'status':'PASS','files':len(files),'bytes':sum(x['bytes'] for x in files),'unique_instructions':len(seen),'unique_bytes':sum(map(len,seen.values())),'BL':branches,'literals':literals,'cases':model['case_count']}))
