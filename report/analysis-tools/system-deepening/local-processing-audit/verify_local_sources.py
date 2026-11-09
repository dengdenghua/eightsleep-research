#!/usr/bin/env python3
"""Verify selected retained source copies and freeze only these new analysis folders."""
import hashlib
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
NAMES = ('local-calibration-closure', 'local-control-closure', 'local-snore-control',
         'local-audio-closure', 'local-managed-telemetry')


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main():
    summaries = []
    for name in NAMES:
        base = ROOT / name
        ledger = json.loads((base/'SOURCE_LEDGER.json').read_text())
        for row in ledger['files']:
            local = base / row['path']
            original = Path(row['origin'])
            assert digest(local) == row['sha256'], local
            assert digest(original) == row['sha256'], original
        commands = base/'il/COMMANDS.json'
        il_count = 0
        if commands.exists():
            for row in json.loads(commands.read_text()):
                assert row['exit_code'] == 0
                assert digest(base/'il'/row['output']) == row['sha256']
                il_count += 1
        model = base/'MODEL_RESULTS.json'
        cases = 0
        if model.exists():
            x = json.loads(model.read_text())
            if 'checks' in x:
                assert all(row['passed'] for row in x['checks'])
                assert len(x['checks']) == x['count']
                cases = x['count']
            else:
                assert x['passed'] is True
                assert all(row['actual'] == row['expected'] for row in x['cases'])
                cases = len(x['cases'])
        result = {'source_files_verified':len(ledger['files']), 'IL_exports_verified':il_count,
                  'independent_formula_examples':cases,
                  'scope':'Source integrity and existing bounded checks; no semantic completeness or hardware validation claim.'}
        (base/'VERIFICATION.json').write_text(json.dumps(result,ensure_ascii=False,indent=2)+'\n')
        files=[]
        for path in sorted(base.rglob('*')):
            if not path.is_file() or path.name == 'SOURCE_MANIFEST.json' or '__pycache__' in path.parts:
                continue
            files.append({'path':str(path.relative_to(base)),'bytes':path.stat().st_size,'sha256':digest(path)})
        (base/'SOURCE_MANIFEST.json').write_text(json.dumps({'files':files},ensure_ascii=False,indent=2)+'\n')
        summaries.append({'folder':name,**result,'manifest_files':len(files)})
    print(json.dumps(summaries,ensure_ascii=False))


if __name__ == '__main__':
    main()
