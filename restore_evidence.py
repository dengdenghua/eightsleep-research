"""Reassemble frozen evidence Release parts, verifying every byte before install."""
import argparse
import hashlib
import json
from pathlib import Path
import tempfile
import os

ROOT = Path(__file__).resolve().parent

def digest(path):
    h = hashlib.sha256()
    with path.open('rb') as source:
        for block in iter(lambda: source.read(8 * 1024 * 1024), b''):
            h.update(block)
    return h.hexdigest()

def restore(parts, manifest, destination):
    spec = json.loads(manifest.read_text())
    archive = spec['archive']
    name = archive['name']
    if Path(name).name != name:
        raise ValueError('Invalid archive filename')
    destination.mkdir(parents=True, exist_ok=True)
    target = destination / name
    if target.exists():
        if target.stat().st_size == archive['bytes'] and digest(target) == archive['sha256']:
            print('Existing archive verified:', target)
            return target
        raise FileExistsError('Existing destination differs; preserve or move it before restoring.')
    temp = None
    try:
        total = 0
        full_hash = hashlib.sha256()
        with tempfile.NamedTemporaryFile(dir=destination, prefix='.restore-', delete=False) as output:
            temp = Path(output.name)
            for entry in spec['parts']:
                part_name = entry['name']
                if Path(part_name).name != part_name:
                    raise ValueError('Invalid part filename')
                source = parts / part_name
                part_hash = hashlib.sha256()
                size = 0
                with source.open('rb') as data:
                    for block in iter(lambda: data.read(8 * 1024 * 1024), b''):
                        size += len(block)
                        part_hash.update(block)
                        full_hash.update(block)
                        output.write(block)
                if size != entry['bytes'] or part_hash.hexdigest() != entry['sha256']:
                    raise ValueError('Part verification failed: ' + part_name)
                total += size
                print('Verified:', part_name)
        if total != archive['bytes'] or full_hash.hexdigest() != archive['sha256']:
            raise ValueError('Combined archive verification failed')
        # Atomic no-overwrite install, including if another process created the target.
        os.link(temp, target)
        print('Restored and verified:', target)
        return target
    finally:
        if temp is not None:
            temp.unlink(missing_ok=True)

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--parts', type=Path, default=ROOT / '.github-upload')
    parser.add_argument('--manifest', type=Path, default=ROOT / 'github-release-manifest.json')
    parser.add_argument('--destination', type=Path, default=ROOT / 'materials')
    args = parser.parse_args()
    restore(args.parts, args.manifest, args.destination)
