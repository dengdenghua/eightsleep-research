from pathlib import Path
import hashlib,json,re,shlex
B=Path(__file__).resolve().parents[1];R=B.parents[2]
def h(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def write(n,v):(B/n).write_text(json.dumps(v,ensure_ascii=False,indent=2)+'\n')
claims=[('NU-01','接收正文/长度、校验比较和高位命令响应分流', [('baseline/0801d888.txt','DAT_2000a4a0 = &DAT_2000230c'),('baseline/0801d888.txt','DAT_2000a4ac = &DAT_20002308'),('pass4/08016fc8_08016fd8.txt','08016fd8'),('pass3/08016e50_08016f0e.txt','08016ef4'),('pass3/08016e50_08016f0e.txt','08016efa'),('pass3/08016e50_08016f0e.txt','08016f02'),('pass3/08017138_080171a0.txt','08017184')]),
('NU-02','原表算法、范围、原始项与两个目标编号', [('pass1/08008484.txt','ld r1'),('pass2/0800814c.txt','ldrb r1'),('pass3/08017138_080171a0.txt','0801719a'),('pass3/080171f8_08017206.txt','08017204'),('DISPATCH_TABLES.json','"opcode_or_state_hex": "0x28"'),('DISPATCH_TABLES.json','"opcode_or_state_hex": "0x2b"'),('pass3/0801721c_080172b6.txt','08017222'),('pass3/0801747e_080174d8.txt','080174ae')]),
('NU-03','start调用、status0与本地响应发送不等于采样/远端确认', [('pass3/0801c91c.txt','FUN_0801c776'),('pass3/0801c91c.txt','param_1 + 0xe40'),('pass3/0801c91c.txt','param_1 + 0xbd8'),('pass3/0801721c_080172b6.txt','08017226'),('pass3/0801710c_0801712e.txt','0801711c'),('pass4/08012344_08012354.txt','08012348'),('pass3/080175b8_080175f4.txt','080175b8'),('pass4/0800fed8.txt','FUN_0801f2d4')]),
('NU-04','gain四字节BE16、0回退、门限与无条件status0回显', [('pass3/0801747e_080174d8.txt','0801747e'),('pass3/0801747e_080174d8.txt','08017498'),('pass3/0801747e_080174d8.txt','080174ce'),('pass3/0801747e_080174d8.txt','080174b2'),('pass3/0801747e_080174d8.txt','080174be'),('pass3/0801c7ac.txt','99 < param_2'),('pass3/0801c7ac.txt','99 < param_3'),('pass3/0801721c_080172b6.txt','0801725e'),('pass4/08012314_0801233a.txt','08012330')]),
('NU-05','nonUSB独立tick向量、reset映射、整除配置与局部失败回滚边界', [('pass3/080094a2.txt','FUN_080099d4'),('pass2/080099d4.txt','080099da'),('pass1/080099ec.txt','DAT_20001144'),('pass4/0801fd00_0801fd3e.txt','0801fd10'),('RAW_INIT_FACTS.json','"tick_step"'),('pass2/0800995c.txt','08009970'),('pass2/0800995c.txt','0800997a'),('pass2/0800a44c.txt','0800a45e'),('pass4/080099bc.txt','FUN_0800995c(3)'),('pass3/080099f8.txt','08009a14'),('../sensor-diff/nonusb-pass1/080139e4.txt','uVar3 < 8'),('../sensor-diff/nonusb-pass6/08013658.txt','FUN_080099ec')])]
# Fix explicit helper anchor to literal instruction, not its misleading decompiled stub.
claims[1][2][0]=('pass1/08008484.txt','ldrsh r1,[r1,r0]')
out=[]
for cid,claim,refs in claims:
 rr=[]
 for f,needle in refs:
  p=B/f;lines=[i for i,s in enumerate(p.read_text().splitlines(),1) if needle in s]
  assert lines,(f,needle)
  rr.append({'file':f,'lines':lines,'locator':needle,'sha256':h(p)})
 out.append({'id':cid,'claim':claim,'references':rr})
write('EVIDENCE_MAP.json',{'schema':'eightsleep.nonusb.dispatch-evidence.v1','claims':out})
write('COVERAGE.json',{'status':'bounded static audit complete','completed':['raw signed16 and unsigned8 switch-table arithmetic with all 56 command entries + 5 parser-state entries','range guards and 128 command low7bit routes; high-bit response split','normal finite valid-frame gate to body opcode and gain/start','start software path and response; gain length/numeric/write/echo boundaries','nonUSB tick vector, default initialization bytes, config arithmetic and limited rollback boundary'],'still_unknown':['host first 0x2B producer','current device deployment and real control traffic','register application/readback and physical channels','full semantics of other command handlers','all malformed-frame and transport recovery cases','complete RCC/PLL state switching and actual sampling clocks'],'not_claimed':['whole main decompilation fixed','firmware or protocol executed','all command handlers audited','real millisecond deadlines or ADC rate measured'],'failed_attempts':['pass2 pseudo range entered signed16 table and stopped; exit0 was not treated as successful script completion'],'excluded_as_data':['08017132..08017137 special table/padding','080171a4..080171f7 main table','0801720a..0801721b extended table']})
exports=[]
for log in sorted(B.glob('pass[1-9].log')):
 for line in log.read_text().splitlines():
  m=re.search(r'Execute script: (\S+) (.*)',line)
  if m:
   args=re.findall("'([^']*)'",m[2]);exports.append({'log':log.name,'script':m[1],'args':args})
write('EXPORT_COMMANDS.json',{'headless':'/opt/homebrew/Cellar/ghidra/12.1.4/libexec/support/analyzeHeadless','java_home':'/opt/homebrew/opt/openjdk@21/libexec/openjdk.jdk/Contents/Home','project':str(R/'analysis/account-readonly/k60-binding/nonusb-flow/ghidra/NonUsbSensor.gpr'),'program':'firmware-sensor-g0.bbin','flags':['-readOnly','-noanalysis'],'exports':exports})
repro='''复现前先验证原BBIN SHA256。所有工具仅静态分析，不运行固件。
1. 需已有Ghidra12.1.4、Java21、原NonUsbSensor只读工程；路径见EXPORT_COMMANDS.json。
2. 对其中每条exports使用其script与args，通过 analyzeHeadless <项目目录> NonUsbSensor -process firmware-sensor-g0.bbin -readOnly -noanalysis -scriptPath <本目录/scripts> -postScript <script> <args>。
   将args[0]改为一个新的输出目录；勿覆盖已保留证据。导出执行顺序和预期失败见JOBS.json。
   pass2原始线性范围会遇表数据而报错，属于保留失败；最终有效代码分段以pass3/4为准。
3. 在本目录运行 python3 scripts/recover_tables.py --research-root /path/to/full-research 与 python3 scripts/verify_bytes.py --research-root /path/to/full-research。
   前者直接读取原BBIN表项与reset初值，后者比对保留导出的字节、literal和分支目标。
4. scripts/finalize_evidence.py 重建引用/清单时使用当前完整研究目录的旧baseline源和ARM参考；原始位置见SOURCE_MANIFEST.json。
无网络、设备或目标执行步骤；表路由枚举不等于实机协议测试。
'''
(B/'REPRODUCE.txt').write_text(repro)
validation=json.loads((B/'BYTE_VALIDATION.json').read_text());assert validation['status']=='PASS'
assert len(json.loads((B/'DISPATCH_TABLES.json').read_text())['command_routes_low7bits'])==128
inputs=[(R/'mediatek/rootfs-selected/opt/eight/lib/subsystem_updates/firmware-sensor-g0.bbin','original binary'),(B.parent/'sensor-diff/nonusb-pass1/0801d888.txt','copied previous initializer'),(B.parent/'sensor-diff/nonusb-pass1/080139e4.txt','previous ADC/cache timing evidence'),(B.parent/'sensor-diff/nonusb-pass6/08013658.txt','previous elapsed-to-tick helper'),(B.parent/'sensor-diff/scripts/ExportSensorDiff.java','exporter original, extended SHA guard'),(B.parent/'sensor-diff/scripts/ExportPseudoRange.java','decoder original, extended SHA guard'),(B.parent/'sensor-timebase/reference/PROVENANCE.json','reference origin'),(B.parent/'sensor-timebase/reference/core_cm0plus.h','ARM register semantics reference')]
assert h(B/'baseline/0801d888.txt')==h(inputs[1][0])
for n in ['PROVENANCE.json','core_cm0plus.h']:assert h(B/'reference'/n)==h(B.parent/'sensor-timebase/reference'/n)
outputs=[{'path':str(p.relative_to(B)),'bytes':p.stat().st_size,'sha256':h(p)} for p in sorted(B.rglob('*')) if p.is_file() and p.name!='SOURCE_MANIFEST.json' and not p.name.startswith('._') and '__pycache__' not in p.parts]
write('SOURCE_MANIFEST.json',{'schema':'eightsleep.nonusb.dispatch-sources.v1','inputs':[{'path':str(p),'role':role,'bytes':p.stat().st_size,'sha256':h(p)} for p,role in inputs],'outputs':outputs,'self_exclusion':'Manifest cannot self-hash; host ._* and Python caches excluded.','no_target_execution':True})
print(json.dumps({'evidence_claims':len(out),'files_hashed':len(outputs),'input_count':len(inputs),'byte_validation':'PASS','table_route_count':128}))
