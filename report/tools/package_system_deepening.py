#!/usr/bin/env python3
"""Package this retained research round; keep the older full release untouched."""
import argparse
import hashlib
import json
import shutil
import zipfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--research-root', type=Path, required=True)
    args = ap.parse_args()
    source = args.research_root.resolve() / 'analysis/system-deepening-20261108'
    dest = ROOT / 'analysis-tools/system-deepening'
    dest.mkdir(parents=True, exist_ok=True)
    records = []
    for path in sorted(source.rglob('*')):
        rel = path.relative_to(source)
        if any(p in ('__pycache__', '.git', '.DS_Store') or p.startswith('._') or p.endswith('.lock') for p in rel.parts):
            continue
        if path.is_symlink():
            raise ValueError('Unexpected symlink: ' + str(rel))
        if not path.is_file():
            continue
        data = path.read_bytes()
        # Persistent analysis databases remain in the incremental ZIP. Text,
        # tools and target inputs are also individually browsable in the report.
        browse = 'ghidra' not in rel.parts
        if browse:
            target = dest / rel
            target.parent.mkdir(parents=True, exist_ok=True)
            shutil.copy2(path, target)
        records.append({'path': str(rel), 'archive_member': 'research/analysis/system-deepening-20261108/' + str(rel),
                        'bytes': len(data), 'sha256': hashlib.sha256(data).hexdigest(), 'browsable': browse})
    archive = dest / 'source-evidence.zip'
    with zipfile.ZipFile(archive, 'w', zipfile.ZIP_DEFLATED) as z:
        for item in records:
            z.write(source / item['path'], item['archive_member'])
    with zipfile.ZipFile(archive) as z:
        assert z.testzip() is None
        assert len(z.namelist()) == len(records)
        for item in records:
            assert hashlib.sha256(z.read(item['archive_member'])).hexdigest() == item['sha256'], item['path']
    result = {'date': '2026-11-08', 'source_relative': 'analysis/system-deepening-20261108',
              'scope': 'Incremental static analysis; not device observations or original vendor source. Earlier full release is unchanged.',
              'archive': archive.name, 'archive_bytes': archive.stat().st_size,
              'archive_sha256': hashlib.sha256(archive.read_bytes()).hexdigest(),
              'members_verified': len(records), 'files': records}
    (dest / 'PACKAGE_MANIFEST.json').write_text(json.dumps(result, ensure_ascii=False, indent=2) + '\n')
    print(json.dumps({k: result[k] for k in ('archive_bytes', 'archive_sha256', 'members_verified')}))


if __name__ == '__main__':
    main()
