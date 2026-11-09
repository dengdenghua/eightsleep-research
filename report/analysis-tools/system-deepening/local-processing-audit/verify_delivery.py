#!/usr/bin/env python3
"""Verify retained local-processing evidence; never load or execute vendor code."""
import hashlib
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parent
ROUND = ROOT.parent


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main():
    coverage = json.loads((ROOT / 'FUNCTIONAL_COVERAGE.json').read_text())
    reports, manifests, inputs, errors = [], [], [], []
    versions = json.loads((ROOT / 'INPUT_VERSION_COVERAGE.json').read_text())
    research_root = ROUND.parent.parent
    for item in versions['firmwares']:
        target = research_root / item['path']
        matched = target.is_file() and target.stat().st_size == item['bytes'] and sha(target) == item['sha256']
        inputs.append({'path': item['path'], 'sha256': item['sha256'], 'matched': matched})
        if not matched:
            errors.append('Input identity differs: ' + item['path'])
        for path in item['normal_processing_reports']:
            if not (research_root / path).is_file():
                errors.append('Missing version report: ' + path)
    for row in coverage['covered'] + coverage.get('bounded_format_audits', []):
        report = ROUND / row['report']
        if not report.is_file():
            errors.append('Missing report: ' + row['report'])
            continue
        reports.append({'id': row['id'], 'path': row['report'],
                        'bytes': report.stat().st_size, 'sha256': sha(report)})
        for name in ('SOURCE_MANIFEST.json', 'MANIFEST.json', 'MANIFEST_SHA256.json'):
            manifest = report.parent / name
            if not manifest.is_file():
                continue
            payload = json.loads(manifest.read_text())
            items = payload.get('files', [])
            if not items:
                errors.append('Empty manifest: ' + str(manifest.relative_to(ROUND)))
            count = 0
            for item in items:
                relative = Path(item['path'])
                if relative.is_absolute() or '..' in relative.parts:
                    errors.append('Unsafe manifest path: ' + str(relative))
                    continue
                target = manifest.parent / relative
                if not target.is_file() or sha(target) != item['sha256']:
                    errors.append('Manifest differs: ' + str(target.relative_to(ROUND)))
                elif target.stat().st_size != item.get('bytes', item.get('size', target.stat().st_size)):
                    errors.append('Size differs: ' + str(target.relative_to(ROUND)))
                else:
                    count += 1
            manifests.append({'path': str(manifest.relative_to(ROUND)),
                              'sha256': sha(manifest), 'entries_verified': count})
    result = {'scope': 'Delivery report identity and available source-manifest hashes, not semantic proof or device execution.',
              'ok': not errors, 'inputs': inputs, 'reports': reports, 'manifests': manifests, 'errors': errors}
    (ROOT / 'DELIVERY_VERIFICATION.json').write_text(json.dumps(result, ensure_ascii=False, indent=2) + '\n')
    print(json.dumps({'ok': result['ok'], 'reports': len(reports),
                      'manifests': len(manifests), 'errors': errors}, ensure_ascii=False))
    if errors:
        raise SystemExit(1)


if __name__ == '__main__':
    main()
