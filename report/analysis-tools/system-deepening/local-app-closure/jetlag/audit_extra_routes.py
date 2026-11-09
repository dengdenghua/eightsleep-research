import sqlite3,json,re
from pathlib import Path
N=Path(__file__).resolve().parent;W=Path('/Users/dangbei/Downloads/eightsleep-firmware-research-20261107/analysis/android-volume/cn-7.63.5')
C=sqlite3.connect('file:'+str(W/'index.sqlite')+'?mode=ro',uri=True);C.row_factory=sqlite3.Row;C.execute('PRAGMA case_sensitive_like=ON')
queries=['Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;->toEntity','Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;->getProgress','Lcom/eightsleep/data_jetlag/data/repository/JetLagTripRepository;->updateTrip','Lhc/a0;->a','Lcom/eightsleep/data_jetlag/data/repository/JetLagTripRepository;->deleteTrip','Lhc/n;->a']
results={q:[dict(r) for r in C.execute('SELECT * FROM calls WHERE callee GLOB ? ORDER BY file,line',(q+'*',))] for q in queries}
rows=C.execute("SELECT * FROM calls WHERE caller GLOB 'Lcom/eightsleep/*jetlag*' OR caller GLOB 'Lhc/*' OR caller GLOB 'Lec/*' OR caller GLOB 'Lgc/*' OR caller GLOB 'Ljc/*' OR caller GLOB 'Lkc/*'").fetchall()
timers=[dict(r) for r in rows if re.search(r'AlarmManager|WorkManager|NotificationManager|PendingIntent|androidx/work',r['callee'])]
(N/'EXTRA_ROUTE_SEARCH.json').write_text(json.dumps({'scope':'Existing 4-DEX indexed direct invoke edges; no reflection/interface reachability proof','index_id':'462a22f663ae482ea93bab3130b96eaf','callers':results,'jetlag_declared_namespace_direct_calls':len(rows),'timer_notification_direct_hits':timers,'negative_result_limit':'Zero direct hits is not whole-program absence; generic push route audited separately.'},ensure_ascii=False,indent=2)+'\n')
print('direct edges checked',len(rows),'timer/notification hits',len(timers))
