from pathlib import Path
import hashlib, json, re, struct, math

OUT = Path(__file__).resolve().parent
ROOT = OUT.parents[2]
SOURCE = ROOT / 'mediatek/rootfs-selected/opt/eight/lib/subsystem_updates/firmware-sensor.bbin'
BASE = 0x08005000
raw = SOURCE.read_bytes()
sha = lambda b: hashlib.sha256(b).hexdigest()
def save(name, obj):
    (OUT / name).write_text(json.dumps(obj, ensure_ascii=False, indent=2) + '\n')
def lines_for(path, patterns):
    return [{'line': i, 'text': line} for i, line in enumerate(path.read_text().splitlines(), 1)
            if any(p in line for p in patterns)]

functions = sorted((OUT / 'final-functions').glob('*.txt'))
errors, counted, unique = [], 0, set()
for p in functions:
    for line in p.read_text().splitlines():
        m = re.match(r'^([0-9a-f]{8}) .* BYTES ([0-9a-f]+)(?: REF|$)', line)
        if not m: continue
        a, expected = int(m[1], 16), bytes.fromhex(m[2])
        off = a - BASE
        counted += 1
        unique.add((a, expected.hex()))
        if off < 0 or raw[off:off+len(expected)] != expected:
            errors.append({'path': str(p), 'address': m[1], 'expected': m[2]})
save('BYTE_VERIFICATION.json', {'input': str(SOURCE), 'sha256': sha(raw), 'base': hex(BASE),
    'function_exports': len(functions), 'instruction_records': counted,
    'unique_instruction_records': len(unique), 'mismatch_count': len(errors), 'mismatches': errors,
    'meaning': 'Exported instruction bytes match original file bytes. Does not validate decompiler semantics or runtime behavior.'})

groups = [
 ('load_and_main', ['0800e084','0800b1f0','0800b2fc','0800bedc'], 'Reset, clock counter, initialization and normal main loop; long-BL metadata repair. Exceptions and every command not exhaustive.'),
 ('internal_adc', ['08008f48','08009b64','08009b30','080099c4','0800a49c','08008af4'], 'ADC RAM selection/scaling, timer callback, ring and 0x32 packing.'),
 ('mcp3564', ['0800b30c','0800a2b8','08009868','0800a43c'], 'ISR callback, status/data admission, sign extension, grouped stale values, packet 0x34/0x41; peripheral retry internals not exhaustive.'),
 ('fdc', ['0800a64c','080081dc','08009398','080092f0','080094b0','08009528','080095b4'], 'Configuration and main-loop read, convert, snapshot, status and packet serialization; physical wiring unverified.'),
 ('temperature', ['0800b400','0800b354','0800b710','0800b7c8','0800b840','08008da0','08008e2c','08008ef4','08008c5c'], 'NTC equations/profile maps, local temperature combination, cache gate and query serialization.'),
 ('environment_and_feedback', ['080081b0','0800b560','0800b6e4','080090ac','080090c8','080090d0','0800b884'], 'Main-loop temperature/humidity conversion; feedback thresholds to state and query/status output. All electrical protections not exhaustive.'),
 ('transport_and_scheduler', ['08008330','080082f0','08008124','0800810c','080080e8','0800af2c','080089f8','080089d0'], 'Framing, escaping, CRC, callback r0/r1, UART/DMA output boundary and period scheduler.'),
 ('numeric_helpers', ['08005180','0800518c','080051a0','080051b4','080051c8','0800522c','080052c8','0800569c','080056a8','080056bc','080056d0','080056e4','08005728','080062a8','080062e8','0800637c','08007e28','08005764','08005f20','08005a98','08005cbc','080063fc','08006a34','08007248','0800772c','08007f00','08007fa4'], 'Soft-float ABI/operation/compare/conversion semantics used by reviewed callsites; no exhaustive IEEE-754 conformance claim.')]
reviewed = set(a for _, aa, _ in groups for a in aa)
ledger = [{'path': str(p), 'sha256': sha(p.read_bytes()), 'function_address': p.stem,
           'reviewed_in_named_scope': p.stem in reviewed} for p in functions]
save('SOURCE_LEDGER.json', {'source': {'path':str(SOURCE),'size':len(raw),'sha256':sha(raw)},
      'artifact_type':'Ghidra pseudocode plus byte-backed assembly, not original C source',
      'functions':ledger, 'scripts':[{'path':str(p),'sha256':sha(p.read_bytes())} for p in sorted((OUT/'scripts').glob('*.java'))]})
save('COVERAGE.json', {'target':'firmware-sensor.bbin 42292 bytes, startup version 3.3.1',
 'normal_numeric_sampling_chains':'statically closed within named scope',
 'function_inventory_count':len(functions), 'reviewed_named_function_count':len(reviewed),
 'groups':[{'id':g,'functions':aa,'scope':note} for g,aa,note in groups],
 'not_claimed':['all functions read','physical sensor wiring known','current user Pod runs this file','production sleep/HRV algorithms recovered','all alarm/motor/electrical-fault controls audited'],
 'remaining_static_scope':['all alarm and motor timing','all command-error/recovery branches','all peripheral I2C/SPI timeout paths','complete electrical protection combinations'],
 'remaining_external_evidence':['active hardware revision and firmware','physical channel mapping','real sample gaps/duplicates/timing frequency','cloud receipt and subsequent processing']})

tables=[]
for a, rev in [(0x800ed54,'0..2'),(0x800ed60,'3'),(0x800ef04,'4..0x1ff'),(0x800effc,'0x200..0x2ff'),(0x800f0ec,'0x300..0x4ff'),(0x800f290,'0x500..0x71f'),(0x800f35c,'>=0x720')]:
    blob=raw[a-BASE:a-BASE+12]
    mode,pad,beta,r1,r2,ptr=struct.unpack('<BBHHHI',blob)
    tables.append({'address':hex(a),'file_offset':hex(a-BASE),'raw_hex':blob.hex(),'hwrev':rev,
       'mode':mode,'beta':beta,'r1':r1,'r2':r2,'adc_map_address':hex(ptr),'adc_map':list(raw[ptr-BASE:ptr-BASE+11])})
save('TABLES.json', {'source_sha256':sha(raw),'temperature_profiles':tables,
 'sampler_adc_maps':[{'hwrev':rev,'address':hex(a),'indices':list(raw[a-BASE:a-BASE+2])} for a,rev in [(0x800ee00,'<0x100'),(0x800eef4,'0x100..0x2ff'),(0x800f0a7,'0x300..0x4ff'),(0x800f24b,'0x500..0x6ff')]]})

f32=lambda x:struct.unpack('<f',struct.pack('<f',x))[0]
def fdcsigned(n):
    n = n-0x1000000 if n & 0x800000 else n
    x=f32(n/524288.0); y=-1.0 if x<0 else x
    v=int(f32(y*100.0));v=(v+32768)%65536-32768
    return {'raw_signed24':n,'pf':x,'processed_pf':y,'packet_i16':v}
def ntc(adc,mode,beta,r1,r2):
    if adc<50 or (mode==1 and adc>4050): return -100.0
    den=f32(f32(4095.0/adc)-1.0)
    r=f32(r2*den) if mode==0 else f32(r1/den)
    ratio=f32(r/10000.0)
    return f32(f32(1.0/(math.log(ratio)/beta+1/298.15))-273.15)
def pack_count(n,threshold,limit):
    return {'queued':n,'first_packet_samples':min(n,limit) if n>=threshold else 0,
            'remaining_after_first':n-min(n,limit) if n>=threshold else n}
def crc16(data):
    c=0x1d0f
    for byte in data:
        c ^= byte<<8
        for _ in range(8): c=((c<<1)^0x1021)&65535 if c&32768 else (c<<1)&65535
    return c
payload=bytes([0x33,0x7e,0x7d,0])
enc=bytes([0x7e])+b''.join(bytes([0x7d,x^0x20]) if x in (0x7d,0x7e) else bytes([x]) for x in bytes([len(payload)])+payload+crc16(payload).to_bytes(2,'big'))
save('NUMERIC_EXAMPLES.json', {'kind':'finite analyst models, NOT firmware execution or device measurements',
 'float_note':'NTC model uses math.log for the recovered ln mathematical function; it does not reproduce series stopping iteration or every soft-float edge.',
 'internal_adc_packet_counts':[pack_count(n,31,60) for n in [30,31,60,61]],
 'mcp_packet_counts':[pack_count(n,8,15) for n in [7,8,15,16]],
 'mcp_missing_group':{'previous_slots':[10,20,30,40],'new_ch0_ch1':[110,120],'elapsed_ms':3,'pushed_slots':[110,120,30,40],'serialized_slots_2_3':[30,40]},
 'mcp_full_timestamp_rule':[{'start':100,'dt':dt,'stored_timestamp':100+2-dt if dt<2 else 100} for dt in [0,1,2]],
 'fdc_cases':[fdcsigned(n) for n in [0,1,0x7fffff,0x800000,0xffffff]],
 'ntc_mode1_beta3380_r7150':[{'adc':x,'temperature_c':ntc(x,1,3380,7150,10000)} for x in [49,50,2388,4050,4051]],
 'weighted_pair':{'a':30,'b':34,'reference':32,'output':f32((34+.2*30+.1*32)/1.3)},
 'framing_example':{'payload_hex':payload.hex(),'crc16':hex(crc16(payload)),'frame_hex':enc.hex()},
 'full_ring':{'capacity':256,'used_before':256,'accepted':False,'used_after':256}})

anchors={}
for a, patterns in {'0800e084':['0800e08c','0800e094','0800e0b6'],
 '0800bedc':['DAT_20000338 =','DAT_2000033c =','DAT_20000358 =','0x33','0800dd90','Firmware initialized'],
 '08009b64':['08009b7a','08009b7c','08009b84','08009b88','08009b8c'],
 '0800a2b8':['0x1ffffff','*pbVar6','param_1 + 0x58'],
 '080099c4':['0x1f','0x232','0x3b'],
 '08009868':['< 8','0x4134','0x86'],
 '080080e8':['080080f0','080080fa'],
 '0800b400':['4095.0','4050.0','10000.0','273.15'],
 '08008c5c':['08008ce0']}.items():
    p=OUT/'final-functions'/(a+'.txt');anchors[a]={'path':str(p),'anchors':lines_for(p,patterns)}
save('ANCHORS.json',anchors)
save('VALIDATION.json', {'source_hash_expected':sha(raw)=='a377d1be27d868c65fa4c90a34f70e9d3d45580236f67905ec56fe84cc595ba2',
 'byte_mismatches':len(errors),'firmware_executed':False,'device_or_account_accessed':False,
 'outputs':[{'path':str(OUT/n),'sha256':sha((OUT/n).read_bytes())} for n in ['FINDINGS_ZH.txt','COVERAGE.json','SOURCE_LEDGER.json','TABLES.json','NUMERIC_EXAMPLES.json','BYTE_VERIFICATION.json','ANCHORS.json']]})
print(json.dumps({'functions':len(functions),'reviewed_named':len(reviewed),'instructions':counted,'byte_errors':len(errors),'findings_sha256':sha((OUT/'FINDINGS_ZH.txt').read_bytes())}))
