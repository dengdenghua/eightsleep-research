#!/usr/bin/env python3
from pathlib import Path
import hashlib,json,struct
O=Path(__file__).resolve().parents[1];R=O.parents[2];S=R/'analysis/sleep-pipeline'
def sha(b):return hashlib.sha256(b).hexdigest()
ledger=json.loads((O/'SOURCE_LEDGER.json').read_text());inv=json.loads((S/'bundle-inventory.json').read_text());data=Path(inv['source']).read_bytes();assert sha(data)==inv['sha256']
members=0
for x in ledger:
 b=Path(x['source']).read_bytes();assert len(b)==x['bytes'] and sha(b)==x['sha256'],x['source']
 if 'copy' in x:assert (O/x['copy']).read_bytes()==b,x['copy']
 if x['kind']=='original-managed-member':
  assert data[x['bundle_offset']:x['bundle_offset']+x['bytes']]==b
  members+=1
commands=json.loads((O/'il/COMMANDS.json').read_text())
for c in commands:assert c['exit_code']==0 and sha((O/c['output']).read_bytes())==c['sha256'],c['output']
anchors={
 'initial_sources':['Eight.Capybara__Program.il.txt','Program::LoadConfiguration','IConfigurationSource>::Clear()','ChainedBuilderExtensions::AddConfiguration'],
 'provider_precedence':['Microsoft.Extensions.Configuration__ConfigurationRoot.il.txt','ConfigurationRoot::GetConfiguration','IConfigurationProvider::TryGet'],
 'option_order':['Microsoft.Extensions.Options__OptionsFactory.il.txt','IPostConfigureOptions`1<!TOptions>::PostConfigure','OptionsFactory`1::Create'],
 'machine_postconfigure':['Eight.Capybara__HostExtensions.il.txt','MachineConfig::ResolveSectionKey','BalloonOptions::set_UsbPortConfig','BalloonOptions::set_UsbRoots'],
 'ram_before_save':['Eight.Capybara.Config__PodConifgurationManager.il.txt','::set_Configuration','::Save()','FileStream::Flush(bool)','File::Move(string, string, bool)'],
 'request_selection':['Eight.Firmness__FirmnessReadyState.il.txt','<RunTick>d__','SaveTargetFirmness','SaveTargetMode','SendFirmnessCommand'],
 'request_acceptance':['Eight.Firmness__FirmnessController.il.txt','FirmnessReadyState::MakeRequest','FirmnessController::SetDynamicMode'],
 'dynamic_shared_queue':['Eight.Firmness__DynamicModeService.il.txt','File::GetLastWriteTimeUtc','FirmnessReadyState::MakeRequest','NonActionableThreshold'],
}
evidence=[]
for claim,entry in anchors.items():
 p=O/'il'/entry[0];lines=p.read_text().splitlines()
 for needle in entry[1:]:
  matches=[dict(line=n,text=line.strip()) for n,line in enumerate(lines,1) if needle in line]
  assert matches,(claim,needle)
  evidence.append(dict(claim=claim,path=str(p.relative_to(O)),needle=needle,matches=matches))
(O/'IL_ANCHORS.json').write_text(json.dumps(evidence,ensure_ascii=False,indent=2)+'\n')
binary=S/'capybara-bundle/Eight.Firmness.dll';raw=binary.read_bytes();values=[0.,.05,.4,.9,1.45,2.05,2.65,3.6,4.8,6.8,8.5];table=struct.pack('<11d',*values);offset=raw.find(table);assert offset>=0 and raw.find(table,offset+1)<0
(O/'RAW_PRESSURE_TABLE.json').write_text(json.dumps(dict(assembly=str(binary),assembly_sha256=sha(raw),file_offset=offset,bytes_hex=table.hex(),double_values=list(struct.unpack('<11d',raw[offset:offset+88])),scope='Literal table identity, not physical calibration or device measurements.'),indent=2)+'\n')
model=json.loads((O/'MODEL_RESULTS.json').read_text());assert all(x['status']=='PASS' and x['observed']==x['expected'] for x in model['cases'])
result=dict(status='PASS',source_files=len(ledger),embedded_managed_members_rechecked=members,static_exports=len(commands),IL_anchor_groups=len(anchors),finite_model_cases=len(model['cases']),persisted_expected_comparisons=len(model['cases']),limits='Bundle slice and source/export identity plus retained IL anchors. Not a second full IL decoder, native execution, complete global scheduling proof or device observation.')
(O/'VERIFICATION.json').write_text(json.dumps(result,ensure_ascii=False,indent=2)+'\n');print(json.dumps(result))
