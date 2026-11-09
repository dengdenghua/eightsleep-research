#!/usr/bin/env python3
"""Install a verified report revision, retaining the prior report and materials."""
from pathlib import Path, PurePosixPath
import hashlib
import json
import os
import tempfile
import zipfile

V = Path('/Volumes/My Passport')
DEST = V / 'eightsleep-local-processing-project-20261108'
ARCHIVE = V / 'eightsleep-complete-project-control-lifecycle-20261108.zip'
BACKUP = V / 'eightsleep-report-snapshot-before-control-lifecycle-20261108'
PREFIX = 'eightsleep-complete-project-20261108/'


def digest(path):
    value = hashlib.sha256()
    with path.open('rb') as f:
        for block in iter(lambda: f.read(1024 * 1024), b''):
            value.update(block)
    return value.hexdigest()


def safe_path(rel):
    p = PurePosixPath(rel)
    assert not p.is_absolute() and '..' not in p.parts
    return p


def main():
    assert not BACKUP.exists(), 'Previous report backup name already exists'
    old = json.loads((DEST / 'RELEASE_MANIFEST.json').read_text())
    old_hashes = {}
    for entry in old['files']:
        p = DEST / safe_path(entry['path'])
        assert not p.is_symlink() and p.stat().st_size == entry['bytes'], p
        got = digest(p)
        assert got == entry['sha256'], p
        old_hashes[entry['path']] = got
    print('Prior project manifest verified; extracting new report only.', flush=True)
    with tempfile.TemporaryDirectory(prefix='.eightsleep-final-report-', dir=V) as temp:
        stage = Path(temp)
        with zipfile.ZipFile(ARCHIVE) as z:
            raw_manifest = z.read(PREFIX + 'RELEASE_MANIFEST.json')
            new = json.loads(raw_manifest)
            assert new['report_revision'] == 'control-lifecycle-20261108'
            for entry in new['files']:
                rel = safe_path(entry['path'])
                if rel.parts[0] == 'materials':
                    assert old_hashes[entry['path']] == entry['sha256']
                    continue
                p = stage / rel
                p.parent.mkdir(parents=True, exist_ok=True)
                data = z.read(PREFIX + entry['path'])
                assert len(data) == entry['bytes'] and hashlib.sha256(data).hexdigest() == entry['sha256']
                p.write_bytes(data)
                mode = (z.getinfo(PREFIX + entry['path']).external_attr >> 16) & 0o777
                if mode:
                    p.chmod(mode)
            (stage / 'RELEASE_MANIFEST.json').write_bytes(raw_manifest)
        (DEST / 'report').rename(BACKUP)
        try:
            (stage / 'report').rename(DEST / 'report')
        except BaseException:
            BACKUP.rename(DEST / 'report')
            raise
        for name in ['README.txt', '启动完整项目.command', 'RELEASE_MANIFEST.json']:
            os.replace(stage / name, DEST / name)
        for entry in new['files']:
            if entry['path'].startswith('materials/'):
                continue
            p = DEST / entry['path']
            assert p.stat().st_size == entry['bytes'] and digest(p) == entry['sha256'], p
        receipt = {
            'status': 'PASS', 'revision': new['report_revision'], 'project': str(DEST),
            'archive': str(ARCHIVE), 'previous_report_backup': str(BACKUP),
            'previous_manifest_files_verified': len(old['files']),
            'new_manifest_files_verified': len(new['files']),
            'materials': 'Existing frozen ZIP hash verified and expanded material tree retained unchanged.',
            'services': 'No server restart, login, device query or capture performed.'
        }
        (V / 'eightsleep-local-processing-project-20261108.control-lifecycle-sync.json').write_text(
            json.dumps(receipt, ensure_ascii=False, indent=2) + '\n')
        print(json.dumps(receipt, ensure_ascii=False), flush=True)


if __name__ == '__main__':
    main()
