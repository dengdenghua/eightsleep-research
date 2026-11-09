from pathlib import Path
import json,re,hashlib,datetime,struct,shutil,subprocess,sys,zipfile
O=Path(__file__).resolve().parents[1];R=O.parents[2]
# O is R/analysis/system-deepening-20261108/local-legacy-sensor-closure
R=O.parent.parent.parent
inp=R/'mediatek/rootfs-selected/opt/eight/lib/subsystem_updates/firmware-sensor-legacy.bbin'
raw=inp.read_bytes();base=0x08005000
sha=lambda b:hashlib.sha256(b).hexdigest()
assert len(raw)==39704 and sha(raw)=='c92b8b8dce2290955c21d6030efe0323d21fad1cc6ba51d54f31756840e2a597'
def write(n,x):(O/n).write_text(json.dumps(x,ensure_ascii=False,indent=2)+'\n')
ins={};literal={};exports=[];errors=[]
for p in sorted(O.glob('*/*.txt')):
 text=p.read_text();count=0
 for line in text.splitlines():
  m=re.match(r'INSN ([0-9a-f]+) ([0-9a-f]+) ',line)
  if not m:continue
  addr=int(m[1],16);b=bytes.fromhex(m[2]);off=addr-base
  if not(0<=off<=len(raw)-len(b)) or raw[off:off+len(b)]!=b:errors.append({'source':str(p.relative_to(O)),'address':m[1],'kind':'instruction mismatch'})
  if addr in ins:assert ins[addr]['bytes']==m[2]
  ins[addr]={'address':m[1],'file_offset':off,'bytes':m[2]};count+=1
  for a,v in re.findall(r'REF\[[^:]+:([0-9a-f]+)=([0-9a-f]+)\]',line):
   aa=int(a,16);oo=aa-base
   if 0<=oo<=len(raw)-4:
    actual=struct.unpack_from('<I',raw,oo)[0]
    if actual!=int(v,16):errors.append({'source':str(p.relative_to(O)),'address':a,'kind':'literal mismatch'})
    literal[aa]={'address':a,'file_offset':oo,'value_u32':actual}
 exports.append({'path':str(p.relative_to(O)),'sha256':sha(p.read_bytes()),'instruction_lines':count,'decompile_error': 'DECOMPILE_ERROR' in text})
assert not errors,errors
write('BYTE_VALIDATION.json',{'input_sha256':sha(raw),'base':hex(base),'unique_instruction_addresses':len(ins),'instruction_bytes':sum(len(bytes.fromhex(v['bytes'])) for v in ins.values()),'unique_u32_literal_addresses':len(literal),'all_compared_bytes_match':True,'semantic_limit':'Byte agreement does not validate every Ghidra code boundary. Erroneous decompiler/table tails retained but not used as functional proof.','exports':exports,'instructions':list(ins.values()),'literals':list(literal.values()),'errors':errors})
(O/'input').mkdir(exist_ok=True);shutil.copy2(inp,O/'input'/inp.name)
write('INPUTS.json',{'input':str(inp),'bytes':len(raw),'sha256':sha(raw),'copy':'input/'+inp.name,'complete_file_base':hex(base),'vector_file_offset':128,'vector_address':'08005080','reset_thumb':'0800d999','sp':'20002000','data_copy_flash':'0800eabc','data_copy_ram':'20000100..2000015b','bss_clear':'2000015c..200016cf','project':'/Volumes/My Passport/eightsleep-analysis-work-20261108/legacy/Legacy39704.gpr','project_setup':'New independent project; complete BBIN import, Cortex/Thumb. Analyst RAM writable setup corrected after import. Subsequent reads are -readOnly -noanalysis with explicit transient callback entry definitions.','target_executed':False,'network_or_device_used':False,'REA':'MCP unavailable; existing local Ghidra fallback; no invented evidence IDs'})
subprocess.run([sys.executable,str(O/'model/normal_contracts.py')],check=True)
model=json.loads((O/'MODEL_RESULTS.json').read_text());assert model['pass']
write('COVERAGE.json',{'scope':'39704 B historical legacy sensor normal sampling/calculation/report path only','completed':['mapping/reset/data/bss and hardware branch','timer callback -> 12B sample -> 256-record queue -> 0x32','external ADC callback -> 24B record -> 128-record queue -> selected pair 0x34','cap-sense normal read/cache/status -> 0x33 producer','normal finite NTC/logarithm/local temperature fusion/hysteresis and final guarded state/power GPIO path/0x31','framing/CRC/escaping and normal serial/DMA handoff'], 'existing_material_static_residual':['Alarm motor pattern/PWM tables and complete normal sequences (delegated to local-legacy-control)' ,'Full command routing/hardware-info decoding','Exhaustive indirect writer/reachability enumeration','All sentinel combinations of multi-input fusion'], 'requires_new_evidence':['Physical ADC slot/sensor placement/board wiring','Actual hardware config/calibration and boot chain outside supplied image','Measured timebase and throughput/concurrent runtime behavior','Whether this legacy image runs on the specific user device'], 'not_claimed':['Whole firmware equivalence or all local processing complete','Physical left/right from flags','Production sleep staging or sleep fusion recovered','Synthetic checks are real firmware runs'], 'selected_raw_validation_count':len(ins),'synthetic_normal_cases':len(model['cases']),'all_normal_cases_pass':True})
write('VALIDATION.json',{'created_utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'input_current_sha_matches':True,'unique_instruction_addresses':len(ins),'instruction_bytes':sum(len(bytes.fromhex(v['bytes'])) for v in ins.values()),'literal_count':len(literal),'synthetic_normal_cases':len(model['cases']),'model_sha256':sha((O/'model/normal_contracts.py').read_bytes()),'source_functions_not_whole_program':True,'known_decompiler_error_exports':[e['path']for e in exports if e['decompile_error']]})
print(json.dumps({'instructions':len(ins),'bytes':sum(len(bytes.fromhex(v['bytes']))for v in ins.values()),'literals':len(literal),'exports':len(exports),'cases':len(model['cases'])}))
