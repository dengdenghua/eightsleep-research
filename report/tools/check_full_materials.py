#!/usr/bin/env python3
"""Exercise extraction boundaries with small synthetic archives, never official materials."""
import hashlib
import json
from pathlib import Path
import tempfile
import zipfile
from prepare_full_materials import prepare


def main():
    results = []
    with tempfile.TemporaryDirectory(prefix='eightsleep-release-check-') as temporary:
        root = Path(temporary)

        def archive(name, members):
            path = root / name
            with zipfile.ZipFile(path, 'w') as output:
                for member, data in members:
                    output.writestr(member, data)
            return path, hashlib.sha256(path.read_bytes()).hexdigest()

        original, digest = archive('good.zip', [('fixture/index.html', b'fixture'),
                                                ('fixture/nested/raw.bin', bytes(range(256)))])
        result = prepare(original, root / 'out', digest, 'fixture')
        assert (root / 'out/fixture/nested/raw.bin').read_bytes() == bytes(range(256))
        assert result['entries'] == 2
        results.append('new-directory extraction preserves nested bytes')
        prepare(original, root / 'out', digest, 'fixture', verify_existing=True)
        results.append('existing member verification succeeds for matching content')
        try:
            prepare(original, root / 'out', digest, 'fixture')
            raise AssertionError('existing destination was overwritten')
        except FileExistsError:
            results.append('existing destination refused without modification')
        (root / 'out/fixture/index.html').write_bytes(b'changed')
        try:
            prepare(original, root / 'out', digest, 'fixture', verify_existing=True)
            raise AssertionError('changed file was accepted')
        except ValueError:
            results.append('modified existing content rejected')
        try:
            prepare(original, root / 'bad-hash', '0' * 64, 'fixture')
            raise AssertionError('incorrect identity was accepted')
        except ValueError:
            assert not (root / 'bad-hash').exists()
            results.append('hash mismatch rejected before destination creation')
        for index, unsafe in enumerate(['fixture/../../escape', '/absolute/file',
                                       'wrong-root/file', 'fixture/../escape']):
            path, unsafe_digest = archive(f'unsafe-{index}.zip', [(unsafe, b'bad')])
            try:
                prepare(path, root / f'unsafe-out-{index}', unsafe_digest, 'fixture')
                raise AssertionError('unsafe member was accepted')
            except ValueError:
                assert not (root / f'unsafe-out-{index}').exists()
        results.append('four traversal/root-mismatch carriers rejected')
    report = {'scope': 'Synthetic extraction and identity checks, not official archive extraction',
              'passed': True, 'checks': results}
    output = Path(__file__).resolve().parents[1] / 'validation/complete-materials-tool-checks.json'
    output.write_text(json.dumps(report, ensure_ascii=False, indent=2) + '\n')
    print(json.dumps(report, ensure_ascii=False, indent=2))


if __name__ == '__main__':
    main()
