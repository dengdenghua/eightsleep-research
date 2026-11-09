#!/usr/bin/env python3
"""Package the report project and verify every retained member against its manifest."""
import argparse
import hashlib
import json
import os
import zipfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]


def digest(data):
    return hashlib.sha256(data).hexdigest()


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--output', type=Path, required=True)
    ap.add_argument('--revision', required=True)
    ap.add_argument('--scope', required=True)
    args = ap.parse_args()
    output = args.output.resolve()
    if output == ROOT or ROOT in output.parents:
        raise ValueError('Output must be outside the project to avoid recursive packaging')
    manifest_path = ROOT / 'project-manifest.json'
    manifest = json.loads(manifest_path.read_text())
    manifest.update(revision=args.revision, scope=args.scope)
    records = []
    for path in sorted(ROOT.rglob('*')):
        rel = path.relative_to(ROOT)
        if any(part in ('.DS_Store', '__pycache__', '.git') or part.startswith('._') for part in rel.parts):
            continue
        if path.is_symlink():
            raise ValueError('Unexpected symlink: ' + str(rel))
        if not path.is_file() or path == manifest_path:
            continue
        data = path.read_bytes()
        records.append({'path': str(rel), 'bytes': len(data), 'sha256': digest(data)})
    manifest['files'] = records
    manifest_path.write_text(json.dumps(manifest, ensure_ascii=False, indent=2) + '\n')
    output.parent.mkdir(parents=True, exist_ok=True)
    temp = output.with_suffix(output.suffix + '.tmp')
    with zipfile.ZipFile(temp, 'w', zipfile.ZIP_DEFLATED) as archive:
        for record in records:
            archive.write(ROOT / record['path'], ROOT.name + '/' + record['path'])
        archive.write(manifest_path, ROOT.name + '/project-manifest.json')
    with zipfile.ZipFile(temp) as archive:
        assert archive.testzip() is None
        assert len(archive.infolist()) == len(records) + 1
        assert json.loads(archive.read(ROOT.name + '/project-manifest.json')) == manifest
        for record in records:
            data = archive.read(ROOT.name + '/' + record['path'])
            assert len(data) == record['bytes'] and digest(data) == record['sha256'], record['path']
    os.replace(temp, output)
    receipt = {'date': manifest['date'], 'revision': args.revision, 'path': str(output),
               'bytes': output.stat().st_size, 'sha256': digest(output.read_bytes()),
               'members': len(records) + 1, 'manifest_files_verified': len(records),
               'crc_test': 'passed', 'all_manifest_member_hashes_match': True,
               'scope': 'Project archive only; this command does not touch the frozen full evidence archive.'}
    Path(str(output) + '.verification.json').write_text(json.dumps(receipt, ensure_ascii=False, indent=2) + '\n')
    print(json.dumps(receipt, ensure_ascii=False, indent=2))


if __name__ == '__main__':
    main()
