#!/usr/bin/env python3
"""Bundle the current report and the exact frozen evidence ZIP in one portable project."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import shutil
import tempfile
import zipfile

ROOT = Path(__file__).resolve().parents[1]

LAUNCHER = '''#!/bin/zsh
cd -- "${0:A:h}" || exit 1
materials_root="materials/eightsleep-full-evidence-20261107"
if [[ ! -f "$materials_root/index.html" ]]; then
  print '首次使用：核对完整材料SHA256并解包，约需4GB空间。'
  python3 report/tools/prepare_full_materials.py --archive "$materials_root.zip" --destination materials || exit 1
fi
open report/index.html
print '报告已打开。材料服务：http://127.0.0.1:58766/'
print '保留此终端窗口以浏览完整材料。若58766已有服务，请先核对该服务对应的目录。'
python3 report/tools/evidence_server.py --root "$materials_root" --port 58766
'''

README = '''Eight Sleep 完整研究项目
=======================

report/：本次最新版HTML、Wiki、模型、全部增量证据、工具与校验记录。
materials/eightsleep-full-evidence-20261107.zip：未改字节的2026-11-07完整证据归档。
  内含官方SWU、完整rootfs.tar及普通文件视图、APK、107095文件的研究TAR、Ghidra和索引。
RELEASE_MANIFEST.json：本包每个文件的大小与SHA256。

macOS双击“启动完整项目.command”。首次会先核对完整证据ZIP的SHA256，
再解包至materials/eightsleep-full-evidence-20261107（约4GB），然后打开报告和只读材料服务。
其他系统可直接打开report/index.html；材料解包及服务用Python 3.9+：
  python3 report/tools/prepare_full_materials.py --archive materials/eightsleep-full-evidence-20261107.zip --destination materials
  python3 report/tools/evidence_server.py --root materials/eightsleep-full-evidence-20261107 --port 58766

原始研究树仍以research-evidence.tar.gz保留，Android大小写冲突需区分大小写文件系统；
rootfs普通文件视图不能替代原始TAR刷写。更多限制见report/wiki/full-evidence.md。
验证已解包文件可给prepare_full_materials.py追加--verify-existing；不会覆盖已有目录。
材料服务只读且仅绑定127.0.0.1。启动完整项目不会登录账号或开始实时采集。

实时工具仍需用户自行登录；本包不包含密码、令牌或当前会话。
换机需另行指定运行用客户端配置。冻结研究TAR保留APK内置参数研究副本，
但工具不会自动从TAR读取配置；见report/wiki/live-capture-tool.md。
生产算法、实机版本绑定与硬件测量的缺口按report/wiki/reverse-plan.md保留。
'''


def file_digest(path):
    value = hashlib.sha256()
    with path.open('rb') as handle:
        for block in iter(lambda: handle.read(1024 * 1024), b''):
            value.update(block)
    return value.hexdigest()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--output', type=Path, required=True)
    parser.add_argument('--frozen-archive', type=Path, required=True)
    args = parser.parse_args()
    output, frozen = args.output.resolve(), args.frozen_archive.resolve()
    if ROOT == output or ROOT in output.parents or output == frozen:
        raise ValueError('Output must be outside the report and different from the source archive')
    package = json.loads((ROOT / 'data/full-evidence.json').read_text())['package']
    if frozen.stat().st_size != package['archive_bytes']:
        raise ValueError('Frozen source size differs')
    report_manifest = json.loads((ROOT / 'project-manifest.json').read_text())
    actual_files = {str(path.relative_to(ROOT)) for path in ROOT.rglob('*')
                    if path.is_file() and path != ROOT / 'project-manifest.json'
                    and not any(part in ('.git', '__pycache__', '.DS_Store') or part.startswith('._')
                                for part in path.relative_to(ROOT).parts)}
    if actual_files != {item['path'] for item in report_manifest['files']}:
        raise ValueError('Report file set changed; run package_project.py first')
    for item in report_manifest['files']:
        path = ROOT / item['path']
        if path.is_symlink() or file_digest(path) != item['sha256']:
            raise ValueError('Report differs from its release manifest: ' + item['path'])
    output.parent.mkdir(parents=True, exist_ok=True)
    if shutil.disk_usage(output.parent).free < frozen.stat().st_size + 512 * 1024 * 1024:
        raise ValueError('Insufficient free space for complete project')
    prefix = 'eightsleep-complete-project-20261108/'
    records = []
    # A private, exclusively created directory prevents a pre-existing fixed
    # .tmp symlink from redirecting writes into the frozen source or other files.
    # Keep it beside the output so publication remains an atomic rename.
    with tempfile.TemporaryDirectory(prefix='.' + output.name + '.staging-',
                                     dir=output.parent) as staging:
        temporary = Path(staging) / 'project.zip'
        with zipfile.ZipFile(temporary, 'w', zipfile.ZIP_DEFLATED, allowZip64=True) as archive:
            for item in report_manifest['files']:
                rel = 'report/' + item['path']
                archive.write(ROOT / item['path'], prefix + rel)
                records.append(dict(path=rel, bytes=item['bytes'], sha256=item['sha256']))
            for rel, data, mode in [
                ('report/project-manifest.json', (ROOT / 'project-manifest.json').read_bytes(), 0o644),
                ('README.txt', README.encode(), 0o644),
                ('启动完整项目.command', LAUNCHER.encode(), 0o755),
            ]:
                info = zipfile.ZipInfo(prefix + rel)
                info.create_system = 3
                info.external_attr = (0o100000 | mode) << 16
                info.compress_type = zipfile.ZIP_DEFLATED
                archive.writestr(info, data)
                records.append(dict(path=rel, bytes=len(data), sha256=hashlib.sha256(data).hexdigest()))
            rel = 'materials/' + frozen.name
            if frozen.name != Path(package['archive_path']).name:
                raise ValueError('Frozen archive filename differs from pinned package')
            print('Copying pinned full evidence archive without recompression...', flush=True)
            info = zipfile.ZipInfo(prefix + rel)
            info.create_system = 3
            info.external_attr = 0o100644 << 16
            info.compress_type = zipfile.ZIP_STORED
            digest = hashlib.sha256()
            with frozen.open('rb') as source, archive.open(info, 'w', force_zip64=True) as target:
                for block in iter(lambda: source.read(1024 * 1024), b''):
                    target.write(block)
                    digest.update(block)
            if digest.hexdigest() != package['archive_sha256']:
                raise ValueError('Frozen evidence bytes differ from the pinned SHA256')
            records.append(dict(path=rel, bytes=frozen.stat().st_size, sha256=digest.hexdigest()))
            manifest = {'date': '2026-11-08', 'report_revision': report_manifest['revision'],
                        'scope': 'Current report plus exact frozen full evidence; user credentials/current session excluded; shipped APK client parameters retained in frozen research.',
                        'self_excluded': 'RELEASE_MANIFEST.json', 'files': records}
            archive.writestr(prefix + 'RELEASE_MANIFEST.json', json.dumps(manifest, ensure_ascii=False, indent=2) + '\n')
        print('Verifying every complete-project member...', flush=True)
        with zipfile.ZipFile(temporary) as archive:
            if len(archive.infolist()) != len(records) + 1:
                raise ValueError('Member count differs')
            if json.loads(archive.read(prefix + 'RELEASE_MANIFEST.json')) != manifest:
                raise ValueError('Release manifest differs')
            for item in records:
                digest, size = hashlib.sha256(), 0
                with archive.open(prefix + item['path']) as source:
                    for block in iter(lambda: source.read(1024 * 1024), b''):
                        digest.update(block)
                        size += len(block)
                if size != item['bytes'] or digest.hexdigest() != item['sha256']:
                    raise ValueError('Member content differs: ' + item['path'])
        os.replace(temporary, output)
        receipt = {'date': '2026-11-08', 'path': str(output), 'bytes': output.stat().st_size,
                   'sha256': file_digest(output), 'report_revision': report_manifest['revision'],
                   'members': len(records) + 1, 'member_hashes_and_crc_verified': True,
                   'frozen_archive_sha256': package['archive_sha256']}
        receipt_temporary = Path(staging) / 'verification.json'
        receipt_temporary.write_text(json.dumps(receipt, ensure_ascii=False, indent=2) + '\n')
        os.replace(receipt_temporary, Path(str(output) + '.verification.json'))
    print(json.dumps(receipt, ensure_ascii=False, indent=2))


if __name__ == '__main__':
    main()
