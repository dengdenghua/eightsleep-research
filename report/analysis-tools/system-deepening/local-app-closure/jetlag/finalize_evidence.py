"""Validate selected persistent sources and freeze this finite local-processing study."""
from pathlib import Path
import json,hashlib,sqlite3,datetime,subprocess,sys
N=Path(__file__).resolve().parent
W=Path('/Users/dangbei/Downloads/eightsleep-firmware-research-20261107/analysis/android-volume/cn-7.63.5')
def sha(p):
 h=hashlib.sha256()
 with p.open('rb') as f:
  for b in iter(lambda:f.read(1048576),b''): h.update(b)
 return h.hexdigest()
def write(n,x):(N/n).write_text(json.dumps(x,ensure_ascii=False,indent=2)+'\n')
L=json.loads((N/'SOURCE_LEDGER.json').read_text());S=L['sources'];by={v['descriptor']: (k,v) for k,v in S.items() if 'descriptor' in v}
contracts=[
 ('plan group/state/time','com/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel',['groupTasksByPhaseAndDate','groupByTaskDate','groupPostFlights','mapPlanToUiModel','calculateTimeAtDestination','formatTimeUntilDeparture']),
 ('draft editing/validation/permission','com/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel',['mapFlightToDestinationUiModel','selectFlightSearchResult','showFlightSearchResults','onScheduleDateChanged$lambda$36','onScheduleTimeChanged$lambda$39','onDeleteDestinationClicked$lambda$43','validateSchedule','validateLocations','checkNotificationsPermissions']),
 ('time representation','Ga/s',['n','k','l','equals','r','c','a']),
 ('current phase','gc/c',['a']),('cached task date','gc/e',['<init>']),
 ('nonforced home plan','hc/z',['invokeSuspend']),('selected active trip','hc/v',['invokeSuspend']),('flight offsets','hc/q',['invokeSuspend']),
 ('plan repository','com/eightsleep/data_jetlag/data/repository/JetLagPlanRepository',['createPlan','getPlan','observePlan','updateTasks']),
 ('trip repository','com/eightsleep/data_jetlag/data/repository/JetLagTripRepository',['createTrip','updateTrip','deleteTrip','findFlights']),
 ('ordinary push display/click','com/eightsleep/eight/push/EightJPushMessageReceiver',['onMessage','onNotifyMessageArrived','onNotifyMessageOpened']),
 ('push ID handoff','jh/f',['a']),('group fraction','mg/g',['invoke']),
]
anchors=[]
for claim,cls,names in contracts:
 rel,v=by['L'+cls+';']
 for m in v['methods']:
  if m['symbol'].split('->')[1].split('(')[0] in names: anchors.append(dict(claim=claim,source=rel,copy=v['copy'],sha256=v['sha256'],**m))
# Coroutine/mapping helpers: their finite branch scope is stated in the report, not the entire framework.
helpers=['ec/a','ec/b','ec/d','ec/g','ec/h','ec/i','ec/j','ec/t','ec/u','ec/k','hc/Z','hc/m','hc/U','hc/N','hc/M','hc/y']
for cls in helpers:
 rel,v=by['L'+cls+';']
 for m in v['methods']:
  if m['symbol'].split('->')[1].startswith('invokeSuspend('):anchors.append(dict(claim='normal coroutine/helper route in FINDINGS',source=rel,copy=v['copy'],sha256=v['sha256'],**m))
shared=[('Ga/s',868,900,'wallclock reinterpretation'),('Ga/s',654,698,'equals accepts Ga/s only'),('P2/n',9196,9328,'POST progress argument routing'),('j0/y3',1081,1093,'POST counts routing'),('mg/h',274,391,'completed/total route to mg/g'),('Hb/h',1180,1254,'empty cached plan fetch branch'),('kc/d',490,520,'task association query without ORDER BY'),('com/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel',1658,1675,'Ga/s versus LocalDate isToday comparison'),('com/eightsleep/eight/push/EightJPushMessageReceiver',558,850,'ordinary non-OTP display branch'),('com/eightsleep/eight/push/EightJPushMessageReceiver',1021,1108,'ordinary click branch')]
for cls,start,end,claim in shared:
 rel,v=by['L'+cls+';'];anchors.append(dict(claim=claim,source=rel,copy=v['copy'],sha256=v['sha256'],start_line=start,end_line=end))
for a in anchors: assert 0<a['start_line']<=a['end_line']<=len((N/a['copy']).read_text().splitlines())
write('SOURCE_ANCHORS.json',{'scope':'Selected report anchors and finite branches. Full file capture is not a claim that all methods were audited. Exact paths/case are preserved in ledger.', 'anchors':anchors})
C=sqlite3.connect('file:'+str(W/'index.sqlite')+'?mode=ro',uri=True)
checks=[]
for rel,v in S.items():
 src=W/rel;cp=N/v['copy'];a=sha(src);b=sha(cp);assert a==b==v['sha256'];assert src.stat().st_size==cp.stat().st_size==v['bytes']
 indexed=None
 if 'descriptor'in v:
  indexed=C.execute('SELECT sha256 FROM files WHERE path=?',(rel,)).fetchone()[0];assert indexed==a
 checks.append({'source':rel,'copy':v['copy'],'sha256':a,'bytes':v['bytes'],'index_matches':True if indexed else None,'matches':True})
w=json.loads((W/'workspace.json').read_text());inp=Path(w['source']['path']);ih=sha(inp);assert ih==w['source']['sha256']
write('INPUTS.json',{'input_apk':{'path':str(inp),'bytes':inp.stat().st_size,'sha256':ih},'persistent_workspace':str(W),'index_id':L['index_id'],'index_sha256':sha(W/'index.sqlite'),'dex_scope':['classes.dex','classes2.dex','classes3.dex','classes4.dex'],'execution':'No APK or native firmware executed; no account/device/network requests. Persistent original extraction reused. REA MCP unavailable; no invented EvidenceID.','jadx':'Navigation only; existing JADX partial/error warnings not suppressed. Smali is primary for key branches.'})
subprocess.run([sys.executable,str(N/'model/normal_contracts.py')],check=True,cwd=N)
r=json.loads((N/'MODEL_RESULTS.json').read_text());assert all(c['pass'] for c in r['cases'])
write('VALIDATION.json',{'created_utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'apk_current_sha_matches':True,'selected_source_count':len(checks),'smali_count':sum('descriptor'in v for v in S.values()),'java_navigation_count':sum('descriptor'not in v for v in S.values()),'anchor_count':len(anchors),'synthetic_cases':len(r['cases']),'synthetic_pass':True,'source_checks':checks,'limits':['Not a rerun of DEX extraction or whole-app disassembly.','No actual user trip, OS notification, Room transaction or server policy executed.','Direct-call negative searches do not exhaust indirect/reflection/framework routes.']})
write('COVERAGE.json',{'completed_finite_normal_paths':['draft dates/times/locations and flight mapping','trip create then server plan request','Room plan/task cache write/read/observe','PRE/IN/POST grouping and order','time offset helper, current/past/future/isToday branches','group completion fraction','optimistic completion update and inverse-status error update','end and delete normal API/cache/navigation routes','Home selected trip/phase/destination/departure-hours','notification permission gate and ordinary generic CN push display/click'], 'residual_static_scope':['Entire App indirect/reflective/dynamic route enumeration not exhausted.','Generic framework internals not wholly analyzed.','No identified direct Jetlag scheduler invocation in declared namespace; new concrete anchor can be followed.'], 'requires_new_evidence':['actual Jetlag task and notification payload binding','current rollout/feature state and runtime timezone presentation','server plan generation policy/model absent from this client chain'], 'not_claimed':['Full local App reverse engineering complete','local creation of production circadian plan','sleep staging algorithm from SLEEP task type','server summary field being active local completion calculation','actual account/API/device behavior'], 'source_files_are_not_method_coverage':True})
(N/'COMMANDS.txt').write_text('Reproduction (offline; source workspace paths in scripts):\npython3 capture_sources.py\npython3 audit_extra_routes.py\npython3 model/normal_contracts.py\npython3 finalize_evidence.py\n\nSource lookup: read-only SQLite index with case_sensitive_like=ON; exact class descriptors and direct invoke edges. SOURCE_SELECTION binds sources; SOURCE_ANCHORS gives selected methods/ranges; SOURCE_LEDGER retains original case-sensitive path names.\nJADX is navigation-only. All model inputs are synthetic; no target binary/APK is run.\n')
items=[]
for p in sorted(N.rglob('*')):
 if p.is_file() and p.name not in ['SOURCE_MANIFEST.json','.DS_Store'] and '__pycache__'not in p.parts:items.append({'path':str(p.relative_to(N)),'bytes':p.stat().st_size,'sha256':sha(p)})
write('SOURCE_MANIFEST.json',{'schema':1,'scope':'This Jetlag evidence directory only; manifest excludes itself and host cache files.','file_count':len(items),'files':items})
print(json.dumps({'sources':len(checks),'smali':sum('descriptor'in v for v in S.values()),'anchors':len(anchors),'cases':len(r['cases']),'manifest_files':len(items),'manifest_sha256':sha(N/'SOURCE_MANIFEST.json'),'findings_sha256':sha(N/'FINDINGS_ZH.txt')}))
