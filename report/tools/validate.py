#!/usr/bin/env python3
"""Check local links, module/task relations, bundled evidence and offline payload."""
from pathlib import Path
import hashlib
import json
import re
from html.parser import HTMLParser

ROOT=Path(__file__).resolve().parents[1]

class Links(HTMLParser):
    def __init__(self):super().__init__();self.links=[];self.assets=[]
    def handle_starttag(self,tag,attrs):
        attrs=dict(attrs)
        if 'href' in attrs:self.links.append(attrs['href'])
        if 'src' in attrs:self.assets.append(attrs['src'])

def main():
    errors=[];warnings=[];checks=0
    def check(ok,message):
        nonlocal checks
        checks+=1
        if not ok:errors.append(message)
    html=(ROOT/'index.html').read_text()
    payload=re.search(r'<script id="report-data" type="application/json">(.*?)</script>',html,re.S)
    check(bool(payload),'Missing embedded data')
    data=json.loads(payload[1]);modules={m['id']:m for m in data['modules']};tasks={t['id']:t for t in data['tasks']}
    pages={p['id'] for p in data['pages']};evidence={e['source']:e for e in data['evidence']}
    check(len(modules)==len(data['modules'])==12,'Module duplicate or incomplete')
    check(len(tasks)==len(data['tasks']),'Duplicate task IDs')
    for m in modules.values():
        check(m['status'] in ['recovered','partial','boundary'],'Unknown module status '+m['id'])
        check('modules/'+m['id'] in pages,'Missing module Wiki '+m['id'])
        for key in ['title','summary','inputs','outputs','findings','unknowns','evidence','next']:
            check(bool(m.get(key)),'Empty '+key+' in '+m['id'])
        for src in m['evidence']:check(src in evidence,'Evidence not bundled '+src)
        for tid in m['next']:check(tid in tasks,'Missing task '+tid)
    for t in tasks.values():
        check(t['module'] in modules,'Unknown task module '+t['id'])
        check(t['state'] in ['ready','needs-device','needs-artifact','completed'],'Unknown task state '+t['id'])
        for key in ['action','needs','acceptance']:check(bool(t.get(key)),'Missing task '+key)
        if t.get('result_page'):check(t['result_page'] in pages,'Missing task result page '+t['id'])
        if t['state']=='completed':check(bool(t.get('progress')) and bool(t.get('result_page')),'Completed task lacks result '+t['id'])
    for flow in data['flows']:
        for step in flow['steps']:check(step['module'] in modules,'Broken flow module')
    full=data.get('fullEvidence',{})
    check(full==json.loads((ROOT/'data/full-evidence.json').read_text()),'Full evidence payload differs')
    check(full.get('material_base')=='http://127.0.0.1:58766/','Unexpected evidence service origin')
    pkg=full.get('package',{})
    check(pkg.get('entries')==pkg.get('files',0)+pkg.get('directories',0),'Archive entry counts differ')
    mappings=full.get('evidence_map',[])
    check(len(mappings)==pkg.get('original_snapshots'),'Incomplete frozen evidence mapping')
    check(len({m['source'] for m in mappings})==len(mappings),'Duplicate frozen evidence source')
    for item in full.get('materials',[])+full.get('indexes',[]):
        path=Path(item['path'])
        check(not path.is_absolute() and '..' not in path.parts and ':' not in item['path'],'Unsafe material path')
        if 'sha256' in item:check(bool(re.fullmatch('[0-9a-f]{64}',item['sha256'])),'Invalid material hash')
    for item in mappings:
        check(item['source'] in evidence,'Frozen source absent from current report')
        check(item['archive_member']=='research/'+item['source'],'Incorrect archive source path')
        for key in ('sha256','original_sha256','snapshot_sha256'):
            check(bool(re.fullmatch('[0-9a-f]{64}',item[key])),'Invalid source mapping hash')
    round_info=full.get('new_round',{})
    check(round_info.get('page') in pages,'Missing new evidence Wiki page')
    for source in round_info.get('evidence_sources',[]):
        check(source in evidence,'Missing new evidence snapshot')
        check(source not in {m['source'] for m in mappings},'New evidence mixed into frozen mapping')
    incremental=ROOT/'analysis-tools/system-deepening/PACKAGE_MANIFEST.json'
    if any(source.startswith('analysis/system-deepening-20261108/')
           for source in round_info.get('evidence_sources', [])):
        check(incremental.is_file(),'Missing system research incremental manifest')
        if incremental.is_file():
            package=json.loads(incremental.read_text())
            archive=incremental.parent/package['archive']
            check(archive.is_file(),'Missing incremental archive')
            if archive.is_file():
                check(archive.stat().st_size==package['archive_bytes'],'Incremental archive size differs')
                check(hashlib.sha256(archive.read_bytes()).hexdigest()==package['archive_sha256'],'Incremental archive hash differs')
            check(len(package['files'])==package['members_verified'],'Incremental member count differs')
            for item in package['files']:
                relative=Path(item['path'])
                safe=not relative.is_absolute() and '..' not in relative.parts
                check(safe,'Unsafe incremental member path')
                if safe and item['browsable']:
                    target=incremental.parent/relative
                    check(target.is_file(),'Missing incremental file '+item['path'])
                    if target.is_file():
                        check(hashlib.sha256(target.read_bytes()).hexdigest()==item['sha256'],'Incremental file hash differs '+item['path'])
    for algorithm in data['algorithms']:
        check(algorithm['page'] in pages,'Missing algorithm detail page '+algorithm['id'])
        check(algorithm['evidence'] in evidence,'Missing algorithm evidence '+algorithm['id'])
        check(algorithm['status'] in ['recovered','partial','boundary'],'Unknown algorithm evidence status')
    curve=data['algorithmFilter']
    check(len({t['id'] for t in data['terms']})==len(data['terms']),'Duplicate glossary IDs')
    for term in data['terms']:
        for key in ['id','term','plain','example','caution']:check(bool(term.get(key)),'Empty glossary '+key)
        check(isinstance(term.get('aliases'),list),'Invalid glossary aliases')
    check(len(curve['points'])==201,'Incomplete filter curve')
    check(curve['points'][0]['r']==0 and curve['points'][-1]['r']==.5,'Unexpected normalized frequency range')
    check(curve['max_reference_amplitude_error']<1e-12,'Filter reference check failed')
    for e in evidence.values():
        path=ROOT/e['path']
        check(path.is_file(),'Missing evidence '+e['path'])
        if path.is_file():
            check(hashlib.sha256(path.read_bytes()).hexdigest()==e['snapshot_sha256'],'Evidence checksum mismatch '+e['path'])
            check(e['text']==path.read_text(),'Evidence payload differs '+e['path'])
    for f in [ROOT/'README.md',*(p for p in (ROOT/'wiki').rglob('*.md') if not p.name.startswith('._'))]:
        for url in re.findall(r'\]\(([^)]+)\)',f.read_text()):
            if re.match(r'^[a-z]+://',url) or url.startswith('#'):continue
            target=(f.parent/url.split('#')[0]).resolve()
            check(target.is_file(),'Broken Markdown link '+str(f.relative_to(ROOT))+' -> '+url)
    for page in data['pages']:
        parsed=Links();parsed.feed(page['html'])
        for url in parsed.links:
            if url.startswith('#wiki/'):check(url[6:] in pages,'Broken compiled Wiki link '+url)
            elif url.startswith('#evidence/'):check(url[10:] in evidence,'Broken compiled evidence '+url)
            elif not url.startswith('#') and not re.match(r'^[a-z]+://',url):
                check(url.split('/')[0] in ('wiki','data','evidence','analysis-tools','reconstructions'),'File not served by report route '+url)
    parsed=Links();parsed.feed(html)
    check(not parsed.assets,'HTML unexpectedly loads external/subresource assets')
    for e in data['artifacts']:check(len(e['sha256'])==64 and bool(re.fullmatch('[0-9a-f]{64}',e['sha256'])),'Invalid artifact digest')
    for a in json.loads((ROOT/'data/analysis-artifacts.json').read_text()):
        target=ROOT/a['path']
        check(target.is_file(),'Missing copied analysis artifact '+a['path'])
        if target.is_file():check(hashlib.sha256(target.read_bytes()).hexdigest()==a['sha256'],'Copied analysis artifact differs '+a['path'])
    # Only report categories, never print candidate sensitive values.
    for name,pattern in [('email',r'[A-Za-z0-9._%+*-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}'),('jwt',r'\beyJ[A-Za-z0-9_-]{12,}\.[A-Za-z0-9_-]+\.[A-Za-z0-9_-]+'),('bearer',r'(?i)Bearer\s+[A-Za-z0-9._~-]{16,}')]:
        check(not re.search(pattern,html),'Potential sensitive pattern in HTML: '+name)
    check(not re.search(r'\b(fetch|XMLHttpRequest|WebSocket|EventSource)\s*\(', (ROOT/'assets/report.js').read_text()),'Unexpected network API')
    # Inline code token preservation and local link rewriting are exercised by the authored pages.
    check('\x00' not in html,'Unresolved inline rendering token')
    result={'ok':not errors,'checks':checks,'modules':len(modules),'wiki_pages':len(pages),'tasks':len(tasks),'evidence':len(evidence),'errors':errors,'warnings':warnings,'scope':'Structure, local links, checksums, static privacy patterns and offline payload; browser interaction is recorded separately.'}
    (ROOT/'validation/structural-checks.json').write_text(json.dumps(result,ensure_ascii=False,indent=2)+'\n')
    print(json.dumps(result,ensure_ascii=False,indent=2))
    if errors:raise SystemExit(1)

if __name__=='__main__':main()
