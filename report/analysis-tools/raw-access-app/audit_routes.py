#!/usr/bin/env python3
"""Read only retained APK decompilation; no runtime, accounts, or networking."""
import argparse,hashlib,json,re,subprocess
from pathlib import Path
ROOT=Path(__file__).resolve().parent
EXPECTED='8e98f266dece67bfacc8b47058c6611f609c88baa84776a7fb3a637a05202b04'
def main():
 p=argparse.ArgumentParser();p.add_argument('workspace',type=Path);a=p.parse_args();w=a.workspace
 js=next((w/'java').iterdir());dec=next((w/'decoded').iterdir());apk=next((w/'inputs').rglob('*.apk'))
 assert hashlib.sha256(apk.read_bytes()).hexdigest()==EXPECTED
 def query(pattern,scope,glob):
  x=subprocess.run(['rg','--json','-i','-e',pattern,'--glob',glob,str(scope)],capture_output=True,text=True)
  assert x.returncode in (0,1),x.stderr
  hits=[]
  for row in x.stdout.splitlines():
   v=json.loads(row)
   if v['type']=='match':
    q=v['data'];hits.append({'path':str(Path(q['path']['text']).relative_to(w)),'line':q['line_number'],'matches':[m['match']['text'] for m in q['submatches']]})
  return hits
 terms=['debugnats','remoteconnectivity','addauthorizedkeys','startssh','jetstream','rawmem','rawApiUpload','raw-api','research-data','192\\.168\\.96',r'\b8822\b',r'\bHubConnection\b',r'\bSignalR\b']
 searches=[]
 for scope,glob in [(js,'*.java'),(dec,'*.smali')]:
  hits=query('|'.join(terms),scope,glob)
  searches.append({'scope':str(scope.relative_to(w)),'file_glob':glob,'regex_terms':terms,'matches':hits})
 endpoints=[];dynamic=[]
 # All extracted Retrofit literal routes. Annotation symbol is retained without inferred method names.
 raw=subprocess.run(['rg','--json','@Zq\\.[a-z]\\(','--glob','*.java',str(js)],capture_output=True,text=True);assert raw.returncode==0
 for row in raw.stdout.splitlines():
  v=json.loads(row)
  if v['type']!='match':continue
  d=v['data'];s=d['lines']['text']
  for m in re.finditer(r'@Zq\.([a-z])\("([^"\n]*)"\)',s):
   # Method-level Retrofit annotations only; exclude body, query and header params.
   if m[1] in ['f','o','p','n','b'] and s.lstrip().startswith('@Zq.'):
    endpoints.append({'path':str(Path(d['path']['text']).relative_to(js)),'line':d['line_number'],'annotation':m[1],'route':m[2]})
 for hit in query('@Zq\\.y',js,'*.java'):dynamic.append(hit)
 reads=[]
 for f in sorted((js/'com/eightsleep/data_device/data/model/ble').glob('ReadCharacteristic$*.java')):
  if '$Companion' in f.name:continue
  for n,line in enumerate(f.read_text().splitlines(),1):
   if 'super(' in line:reads.append({'class':f.stem,'line':n,'constructor':line.strip()})
 selected=['Da/E.java','Da/I.java','p011ab/InterfaceC2341o.java','p058cb/Q0.java','p058cb/S0.java','p058cb/R0.java','p058cb/M0.java','p011ab/O.java','p011ab/P.java','Bc/a.java','Cc/c.java','com/eightsleep/data_device/data/repository/OfflineRepository.java','com/eightsleep/data_device/data/model/ble/GetDeviceKeyRequest.java','com/eightsleep/data_device/data/model/ble/DeviceKeyResponse.java','com/eightsleep/data_core/enums/BleAddress.java','com/eightsleep/data_notifications/data/repository/EightNotificationsRepository.java']
 selected += ['L8/r.java','com/eightsleep/data_notifications/data/model/EightNotificationActionResponse.java','com/eightsleep/data_notifications/enums/NotificationClickAction.java']
 selected += [str(f.relative_to(js)) for f in sorted((js/'com/eightsleep/data_device/data/model/ble').glob('ReadCharacteristic$*.java'))]
 ledger=[]
 for rel in selected:
  f=js/rel;dest=ROOT/'source/java'/rel;dest.parent.mkdir(parents=True,exist_ok=True);b=f.read_bytes();dest.write_bytes(b);ledger.append({'source':str(f.relative_to(w)),'copy':str(dest.relative_to(ROOT)),'bytes':len(b),'sha256':hashlib.sha256(b).hexdigest()})
 for rel in ['ab/o.smali','cb/Q0.smali','cb/S0.smali','cb/R0.smali','ab/O.smali','ab/P.smali','Da/E.smali','Bc/a.smali','L8/r.smali']:
  f=dec/'smali_classes2'/rel;safe_rel=rel.replace('/o.smali','/lower_o.smali').replace('/O.smali','/upper_O.smali');dest=ROOT/'source/smali'/safe_rel;dest.parent.mkdir(parents=True,exist_ok=True);b=f.read_bytes();dest.write_bytes(b);ledger.append({'source':str(f.relative_to(w)),'copy':str(dest.relative_to(ROOT)),'bytes':len(b),'sha256':hashlib.sha256(b).hexdigest()})
 for entry in ledger: assert hashlib.sha256((ROOT/entry['copy']).read_bytes()).hexdigest()==entry['sha256'],entry['copy']
 for name,obj in [('SOURCE_LEDGER.json',{'apk_sha256':EXPECTED,'sources':ledger}),('ROUTE_AUDIT.json',{'apk_sha256':EXPECTED,'scope':'Retained CN APK 7.63.5 Java + full Smali; no account/network calls. Decompiled Java is partial (350 reported errors), Smali corroborates selected chains.','targeted_literal_searches':searches,'literal_retrofit_route_count':len(endpoints),'literal_retrofit_routes':endpoints,'dynamic_url_annotation_uses':dynamic,'read_characteristic_count':len(reads),'read_characteristics':reads,'limitations':['Absence of named route literals does not exclude remote-generated paths, different builds, reflection or backend-only routes.','BLE read-type list describes this APK client, not all device GATT services.','No real raw, live event, exported data attachment or device access obtained.']})]:
  (ROOT/name).write_text(json.dumps(obj,ensure_ascii=False,indent=2)+'\n')
 print(json.dumps({'literal_routes':len(endpoints),'dynamic_url_uses':len(dynamic),'read_characteristics':len(reads),'targeted_matches':[len(s['matches']) for s in searches],'source_files':len(ledger)}))
if __name__=='__main__':main()
