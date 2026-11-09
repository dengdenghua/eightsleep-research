"""Read-only persistent APK index -> hash-named evidence copies (case-safe)."""
import hashlib,json,sqlite3,shutil
from pathlib import Path
N=Path(__file__).resolve().parent
W=Path('/Users/dangbei/Downloads/eightsleep-firmware-research-20261107/analysis/android-volume/cn-7.63.5')
C=sqlite3.connect('file:'+str(W/'index.sqlite')+'?mode=ro',uri=True);C.row_factory=sqlite3.Row
C.execute('PRAGMA case_sensitive_like=ON')
config=json.loads((N/'SOURCE_SELECTION.json').read_text())
ledger={'workspace':str(W),'index_id':'462a22f663ae482ea93bab3130b96eaf','sources':{},'scope':'Selected Jetlag normal classes and shared functions. Full copies do not imply all methods audited.'}
for cls in config['classes']:
 rows=C.execute('SELECT * FROM methods WHERE symbol GLOB ? ORDER BY start_line',('L'+cls+';->*',)).fetchall()
 assert rows,cls
 for rel in sorted(set(r['file'] for r in rows)):
  data=(W/rel).read_bytes();sha=hashlib.sha256(data).hexdigest();r=C.execute('SELECT sha256 FROM files WHERE path=?',(rel,)).fetchone();assert r and r[0]==sha
  out=N/'source_by_sha'/(sha+'.smali');out.parent.mkdir(exist_ok=True);shutil.copy2(W/rel,out)
  ledger['sources'][rel]={'descriptor':'L'+cls+';','sha256':sha,'bytes':len(data),'indexed_hash_matches':True,'copy':str(out.relative_to(N)),'methods':[dict(r) for r in rows if r['file']==rel]}
for rel in config['java_navigation']:
 data=(W/rel).read_bytes();sha=hashlib.sha256(data).hexdigest();out=N/'java_by_sha'/(sha+'.java');out.parent.mkdir(exist_ok=True);shutil.copy2(W/rel,out)
 ledger['sources'][rel]={'sha256':sha,'bytes':len(data),'copy':str(out.relative_to(N)),'role':'JADX navigation; branches corroborated with Smali; not original source'}
(N/'SOURCE_LEDGER.json').write_text(json.dumps(ledger,ensure_ascii=False,indent=2)+'\n')
print('captured',len(ledger['sources']),'files')
