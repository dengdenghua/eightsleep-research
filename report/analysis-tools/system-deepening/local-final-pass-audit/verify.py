#!/usr/bin/env python3
"""Verify the four retained final-pass directories without altering them."""
from pathlib import Path
import hashlib
import json

OUT = Path(__file__).resolve().parent
BASE = OUT.parent


def sha(data):
    return hashlib.sha256(data).hexdigest()


def main():
    results = []
    for name in ['local-config-final-pass', 'local-control-final-pass',
                 'local-acquisition-final-pass', 'local-persistence-final-pass']:
        root = BASE / name
        manifest = json.loads((root / 'SOURCE_MANIFEST.json').read_text())
        entries = manifest.get('files', manifest.get('items'))
        assert entries, name
        total = 0
        for row in entries:
            path = root / row['path']
            assert not path.is_symlink()
            data = path.read_bytes()
            assert len(data) == row['bytes'] and sha(data) == row['sha256'], str(path)
            total += len(data)
        model = json.loads((root / 'MODEL_RESULTS.json').read_text())
        cases = model.get('cases')
        if cases is not None:
            assert all(c['observed'] == c['expected'] and c['status'] == 'PASS' for c in cases)
            model_check = {'persisted_observed_expected': len(cases)}
        elif 'tests' in model:
            assert all(c['passed'] for c in model['tests'])
            assert model['count'] == len(model['tests'])
            model_check = {'retained_pass_flags': len(model['tests']),
                           'scope': 'Detailed numerical assertions remain in the model script; no independent reimplementation here.'}
        else:
            assert model['status'] == 'PASS'
            assert all(c['pass'] for c in model['actual_artifact_assertions'])
            model_check = {'normal_token_fixtures': model['synthetic_normal_token_cases'],
                           'artifact_assertions': len(model['actual_artifact_assertions'])}
        results.append({'directory': name, 'manifest_files_verified': len(entries),
                        'bytes': total, 'model_record_checks': model_check})
    reviews = []
    for path in sorted(BASE.glob('REVIEW_*FINAL_PASS.json')):
        obj = json.loads(path.read_text())
        assert str(obj['status']).startswith('PASS'), path.name
        reviews.append({'file': path.name, 'sha256': sha(path.read_bytes()), 'status': obj['status']})
    result = {'status': 'PASS', 'directories': results,
              'manifest_files_verified': sum(x['manifest_files_verified'] for x in results),
              'reviews': reviews,
              'limits': 'Identity and persisted model record checks. Each independent review states its narrower scope. Not vendor execution, physical testing or whole-program coverage.'}
    (OUT / 'VERIFICATION.json').write_text(json.dumps(result, ensure_ascii=False, indent=2) + '\n')
    print(json.dumps(result, ensure_ascii=False))


if __name__ == '__main__':
    main()
