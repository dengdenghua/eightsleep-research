"""Freeze this analysis directory's files, excluding this manifest itself."""
import hashlib
import json
from pathlib import Path

out = Path(__file__).resolve().parent.parent
files = []
for path in sorted(out.rglob('*')):
    if path.is_file() and path.name != 'SOURCE_MANIFEST.json' and '__pycache__' not in path.parts:
        content = path.read_bytes()
        files.append(dict(path=str(path.relative_to(out)),size=len(content),sha256=hashlib.sha256(content).hexdigest()))
manifest = dict(scope='Files in host-payload-boundaries only; external source hashes in SOURCES.json.',
                excluded=['SOURCE_MANIFEST.json (self)', '__pycache__ (generated Python cache, if present)'],
                file_count=len(files),files=files)
(out/'SOURCE_MANIFEST.json').write_text(json.dumps(manifest,ensure_ascii=False,indent=2)+'\n')
for record in files:
    assert hashlib.sha256((out/record['path']).read_bytes()).hexdigest() == record['sha256']
print(json.dumps(dict(file_count=len(files),all_manifest_records_match=True)))
