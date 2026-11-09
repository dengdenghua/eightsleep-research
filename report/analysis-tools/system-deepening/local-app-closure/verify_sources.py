from pathlib import Path
import hashlib,json,sqlite3
R=Path('/Users/dangbei/Downloads/eightsleep-firmware-research-20261107');W=R/'analysis/android-volume/cn-7.63.5';N=R/'analysis/system-deepening-20261108/local-app-closure'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
c=sqlite3.connect('file:'+str(W/'index.sqlite')+'?mode=ro',uri=True);c.row_factory=sqlite3.Row;c.execute('PRAGMA case_sensitive_like=ON')
ledger=json.loads((N/'SOURCE_LEDGER.json').read_text())
# Reconcile retained copies after sequential captures; this does not label unreviewed methods read.
for rel,item in ledger['sources'].items():
 p=N/item['copy'];row=c.execute('select * from files where path=?',(rel,)).fetchone();h=sha(p)
 assert h==row['sha256']==sha(W/rel),rel
ledger['reads']=list({(r['symbol'],r['file']):r for r in ledger['reads']}.values())
ledger['index_sha256']=sha(W/'index.sqlite');ledger['target_sha256']='8e98f266dece67bfacc8b47058c6611f609c88baa84776a7fb3a637a05202b04'
(N/'SOURCE_LEDGER.json').write_text(json.dumps(ledger,ensure_ascii=False,indent=2)+'\n')
qs=['Lcom/eightsleep/presentation_metrics/enums/HealthTierTrend;->getHealthScoreSelector','Lcom/eightsleep/presentation_metrics/enums/HealthScoreTrendSelector;->invoke','Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/HealthTrendsOutliersDataProcessor;->transformPeriodData']
(N/'DIRECT_CALLS.json').write_text(json.dumps({'scope':'all four DEX indexed invoke instructions; reflection/dynamic/native excluded','queries':[{'prefix':q,'calls':[dict(r) for r in c.execute('select * from calls where callee like ?',(q+'%',))]} for q in qs]},ensure_ascii=False,indent=2)+'\n')
old=[]
for dirname in ['hr-metrics','health-results','generic-test-drive','pod6-onboarding','temperature-history','thermal-strategy','core-entry-boundary']:
 old.append(R/'analysis/android-findings'/dirname/'SOURCE_LEDGER.json')
old.append(R/'analysis/android-findings/sleep-edit/EVIDENCE_LEDGER.json')
old += list((R/'analysis/finishable-20261107/app').glob('*/SOURCE_EXCERPTS.json'))
checked={};metadata=[];errors=[]
for p in old:
 if not p.exists():errors.append({'ledger':str(p),'reason':'missing'});continue
 obj=json.loads(p.read_text()); rows=obj if isinstance(obj,list) else obj.get('source_files',obj.get('sources',[]))
 if isinstance(rows,dict):rows=[dict(v,file=k) for k,v in rows.items()]
 count=0
 for row in rows:
  raw=row.get('path',row.get('file')); expected=row.get('sha256')
  if not raw or not expected:continue
  f=Path(raw)
  if not f.is_absolute():f=(R/f) if raw.startswith('analysis/') else W/f
  if not f.is_relative_to(W):continue
  actual=sha(f) if f.exists() else None
  if actual!=expected:errors.append({'path':str(f),'expected':expected,'actual':actual})
  checked[str(f.relative_to(W))]={'sha256':actual,'match':actual==expected,'from_ledger':str(p.relative_to(R))};count+=1
 metadata.append({'path':str(p.relative_to(R)),'sha256':sha(p),'source_references_checked':count})
(N/'PRIOR_EVIDENCE_RECHECK.json').write_text(json.dumps({'scope':'re-hash existing source evidence, not new behavioral testing or whole-APK rereview','ledgers':metadata,'unique_sources_checked':len(checked),'sources':checked,'errors':errors},ensure_ascii=False,indent=2)+'\n')
print(json.dumps({'new_sources':len(ledger['sources']),'retained_method_records':len(ledger['reads']),'prior_unique_sources':len(checked),'errors':errors}))
