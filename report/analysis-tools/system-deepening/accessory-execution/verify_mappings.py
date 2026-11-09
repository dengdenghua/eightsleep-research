#!/usr/bin/env python3
"""Read-only verification of the retained 24-file mapping comparison."""
from pathlib import Path
import hashlib,json

ROOT=Path('/Users/dangbei/Downloads/eightsleep-firmware-research-20261107')
HERE=Path(__file__).resolve().parent
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def main():
    data=json.loads((HERE/'MAPPING_DIFF.json').read_text())
    for c in data['config_sources']:assert sha(Path(c['source']))==c['sha256']
    for s in data['samples']:
        assert sha(ROOT/s['old_source'])==s['old_now_sha256']==s['old_record_sha256']
        assert (ROOT/s['mtk_source']).is_file()==s['mtk_exists']
        if s['mtk_exists']:assert sha(ROOT/s['mtk_source'])==s['mtk_sha256']
        assert s['shared_same_sha']==(s['mtk_sha256']==s['old_now_sha256'])
    old=json.loads(Path(data['config_sources'][0]['source']).read_text())
    mtk=json.loads(Path(data['config_sources'][1]['source']).read_text())
    def get(d,key):
        for k in key.split('.'):d=d[k]
        return d
    for c in data['mapping_comparisons']:
        assert get(old,c['section'])==c['historical_nxp']
        assert get(mtk,c['section'])==c['mtk']
        assert c['identical']==(c['historical_nxp']==c['mtk'])
    for s in data['mtk_extra_files_in_examined_family_dirs']:assert sha(ROOT/s['path'])==s['sha256']
    print('PASS: 24 original/MTK SHA pairs, 4 configuration sections, retained extra-file identities')
if __name__=='__main__':main()
