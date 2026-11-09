import hashlib,json,re,shutil,sqlite3,sys
from pathlib import Path
R=Path('/Users/dangbei/Downloads/eightsleep-firmware-research-20261107')
W=R/'analysis/android-volume/cn-7.63.5'
N=R/'analysis/system-deepening-20261108/local-app-closure/jetlag'
N.mkdir(parents=True,exist_ok=True)
C=sqlite3.connect('file:'+str(W/'index.sqlite')+'?mode=ro',uri=True)
C.row_factory=sqlite3.Row
C.execute('PRAGMA case_sensitive_like=ON')
ledger_path=N/'SOURCE_LEDGER.json'
ledger=json.loads(ledger_path.read_text()) if ledger_path.exists() else {'workspace':str(W),'index_id':'462a22f663ae482ea93bab3130b96eaf','sources':{},'reads':[]}
def capture(rel):
 p=W/rel;data=p.read_bytes();sha=hashlib.sha256(data).hexdigest()
 row=C.execute('select sha256 from files where path=?',(rel,)).fetchone()
 assert row and row[0]==sha,rel
 out=N/'source_by_sha'/(sha+'.smali');out.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(p,out)
 ledger['sources'][rel]={'sha256':sha,'bytes':len(data),'indexed_hash_matches':True,'copy':str(out.relative_to(N))}
 return data.decode().splitlines()
def done():ledger_path.write_text(json.dumps(ledger,ensure_ascii=False,indent=2)+'\n')
mode=sys.argv[1];q=sys.argv[2]
if mode=='methods':
 rows=C.execute('select * from methods where symbol like ? order by symbol',('%'+q+'%',)).fetchall()
 for r in rows:print(r['symbol'],r['start_line'],r['end_line'])
elif mode=='read':
 method=sys.argv[3] if len(sys.argv)>3 else ''
 rows=C.execute('select * from methods where symbol like ? order by start_line',(q+'->'+method+'%',)).fetchall()
 for r in rows:
  lines=capture(r['file']);print('\n'+r['symbol']+' '+r['file'])
  print('\n'.join(str(i+1)+': '+lines[i] for i in range(r['start_line']-1,r['end_line']) if lines[i].strip()))
  ledger['reads'].append(dict(r))
 done()
elif mode in ('callers','callees'):
 col='callee' if mode=='callers' else 'caller'
 rows=C.execute('select * from calls where '+col+' like ? order by file,line',(q+'%',)).fetchall()
 for r in rows:print(dict(r))
elif mode=='refs':
 hits=[];files=list((W/'decoded').rglob('*.smali'));pat=re.compile(q)
 for p in files:
  text=p.read_text();rel=str(p.relative_to(W));matches=[(i+1,l) for i,l in enumerate(text.splitlines()) if pat.search(l)]
  if matches:
   capture(rel)
   for line,s in matches:hits.append({'file':rel,'line':line,'text':s});print(rel,line,s)
 out=N/('SEARCH_'+hashlib.sha256(q.encode()).hexdigest()[:10]+'.json')
 out.write_text(json.dumps({'pattern':q,'scope':'all retained four-DEX decoded Smali files','files_searched':len(files),'hits':hits},ensure_ascii=False,indent=2)+'\n');done();print('Saved',out)
