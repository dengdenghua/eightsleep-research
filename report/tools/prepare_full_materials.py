#!/usr/bin/env python3
"""Verify and unpack the pinned complete evidence archive into a new directory."""
import argparse
import hashlib
import json
import os
from pathlib import Path, PurePosixPath
import shutil
import stat
import tempfile
import zipfile

PROJECT = Path(__file__).resolve().parents[1]


def digest_file(path):
    digest = hashlib.sha256()
    with Path(path).open('rb') as stream:
        for block in iter(lambda: stream.read(1024 * 1024), b''):
            digest.update(block)
    return digest.hexdigest()


def members(archive, root_name):
    seen = set()
    result = []
    for info in archive.infolist():
        name = info.filename
        path = PurePosixPath(name)
        parts = name.rstrip('/').split('/')
        mode = info.external_attr >> 16
        if (not name or '\\' in name or path.is_absolute() or parts[0] != root_name
                or any(p in ('', '.', '..') for p in parts) or name in seen
                or stat.S_ISLNK(mode) or info.flag_bits & 1):
            raise ValueError('Unsupported or unsafe archive member: ' + name)
        if parts == [root_name] and not info.is_dir():
            raise ValueError('Archive root must be a directory')
        if mode and stat.S_IFMT(mode) not in (0, stat.S_IFREG, stat.S_IFDIR):
            raise ValueError('Non-regular archive member: ' + name)
        seen.add(name)
        result.append(info)
    return result


def prepare(archive_path, destination, expected_hash, root_name, expected_bytes=None,
            verify_only=False, verify_existing=False):
    archive_path, destination = Path(archive_path).resolve(), Path(destination).resolve()
    if PurePosixPath(root_name).name != root_name or root_name in ('', '.', '..'):
        raise ValueError('Invalid root name')
    if expected_bytes is not None and archive_path.stat().st_size != expected_bytes:
        raise ValueError('Archive size differs from pinned manifest')
    if digest_file(archive_path) != expected_hash:
        raise ValueError('Archive SHA256 differs from pinned manifest')
    target = destination / root_name
    with zipfile.ZipFile(archive_path) as archive:
        entries = members(archive, root_name)
        total = sum(info.file_size for info in entries)
        summary = {'archive_sha256': expected_hash, 'entries': len(entries),
                   'uncompressed_bytes': total, 'target': str(target)}
        if verify_only:
            return dict(summary, action='archive identity and member paths verified; not extracted')
        if verify_existing:
            if not target.is_dir() or target.is_symlink():
                raise ValueError('Existing extracted root is absent or a symlink')
            for info in entries:
                path = destination / info.filename
                if path.is_symlink() or not path.resolve().is_relative_to(target.resolve()):
                    raise ValueError('Existing member escapes root: ' + info.filename)
                if info.is_dir():
                    if not path.is_dir():
                        raise ValueError('Missing directory: ' + info.filename)
                    continue
                if not path.is_file() or path.stat().st_size != info.file_size:
                    raise ValueError('Existing member size differs: ' + info.filename)
                expected = hashlib.sha256()
                with archive.open(info) as source:
                    for block in iter(lambda: source.read(1024 * 1024), b''):
                        expected.update(block)
                if digest_file(path) != expected.hexdigest():
                    raise ValueError('Existing member hash differs: ' + info.filename)
            return dict(summary, action='existing member bytes verified')
        if target.exists() or target.is_symlink():
            raise FileExistsError('Destination already exists; use --verify-existing or another destination')
        destination.mkdir(parents=True, exist_ok=True)
        if shutil.disk_usage(destination).free < total + 64 * 1024 * 1024:
            raise ValueError('Insufficient free space for full extraction')
        staging = Path(tempfile.mkdtemp(prefix='.eightsleep-unpack-', dir=destination))
        try:
            for info in entries:
                path = staging / info.filename
                if info.is_dir():
                    path.mkdir(parents=True, exist_ok=True)
                    continue
                path.parent.mkdir(parents=True, exist_ok=True)
                with archive.open(info) as source, path.open('xb') as output:
                    shutil.copyfileobj(source, output, 1024 * 1024)
                mode = (info.external_attr >> 16) & 0o777
                if mode:
                    path.chmod(mode)
            if target.exists() or target.is_symlink():
                raise FileExistsError('Destination appeared during extraction')
            os.rename(staging / root_name, target)
        finally:
            shutil.rmtree(staging)
        receipt = dict(summary, action='extracted to new directory; ZIP CRC verified while reading')
        (destination / (root_name + '.extraction.json')).write_text(
            json.dumps(receipt, ensure_ascii=False, indent=2) + '\n')
        return receipt


def main():
    package = json.loads((PROJECT / 'data/full-evidence.json').read_text())['package']
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--archive', type=Path, required=True)
    parser.add_argument('--destination', type=Path, required=True)
    parser.add_argument('--verify-only', action='store_true')
    parser.add_argument('--verify-existing', action='store_true')
    args = parser.parse_args()
    result = prepare(args.archive, args.destination, package['archive_sha256'],
                     Path(package['root_path']).name, package['archive_bytes'],
                     args.verify_only, args.verify_existing)
    print(json.dumps(result, ensure_ascii=False, indent=2))


if __name__ == '__main__':
    main()
