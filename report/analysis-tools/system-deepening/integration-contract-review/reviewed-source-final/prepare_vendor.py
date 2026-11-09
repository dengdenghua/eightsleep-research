#!/usr/bin/env python3
"""Copy retained offline models; never load or execute target firmware."""
import argparse
import ast
import hashlib
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parent
FILES = {
    'analysis/finishable-20261107/host-model/model.py': 'host-model/model.py',
    'analysis/finishable-20261107/host-model/previous_model.py': 'host-model/previous_model.py',
    'analysis/finishable-20261107/cbor-encoder/encode_buffers.py': 'cbor-encoder/encode_buffers.py',
    'analysis/finishable-20261107/cbor-encoder/host_signal_parser.py': 'cbor-encoder/host_signal_parser.py',
    'analysis/prepublish-queue-20261108/model/model.py': 'prepublish-queue/model.py',
    'analysis/device-side-followup/upload-distortion/model.py': 'reference/upload-distortion-model.py',
    'analysis/system-deepening-20261108/host-usb-receiver/model/parser_model.py': 'host-receiver/parser_model.py',
}


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--research-root', type=Path, required=True)
    args = ap.parse_args()
    records = []
    for source, target in FILES.items():
        data = (args.research_root / source).read_bytes()
        path = ROOT / 'vendor' / target
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_bytes(data)
        records.append({'source': source, 'copy': str(path.relative_to(ROOT)),
                        'sha256': hashlib.sha256(data).hexdigest(), 'bytes': len(data)})
    original = (ROOT / 'vendor/reference/upload-distortion-model.py').read_text()
    node = next(x for x in ast.parse(original).body if isinstance(x, ast.ClassDef) and x.name == 'Queues')
    segment = ast.get_source_segment(original, node)
    path = ROOT / 'vendor/ordinal_queues.py'
    path.write_text('"""Exact retained Queues class; ordinals only, not hardware execution.\n'
                    'Extracted by prepare_vendor.py; full source in vendor/reference.\n"""\n'
                    'from collections import Counter, deque\n\n' + segment + '\n')
    originals = []
    for source in ['mediatek/rootfs-selected/opt/eight/bin/frankenfirmware',
                   'mediatek/rootfs-selected/opt/eight/lib/subsystem_updates/firmware-sensor-g0-usb.bbin']:
        data = (args.research_root / source).read_bytes()
        originals.append({'source': source, 'bytes': len(data),
                          'sha256': hashlib.sha256(data).hexdigest(), 'executed': False})
    report = {'kind': 'retained_model_inputs_not_vendor_source', 'files': records,
              'originals': originals, 'derived_class': {'source': 'vendor/reference/upload-distortion-model.py',
              'start_line': node.lineno, 'end_line': node.end_lineno,
              'path': str(path.relative_to(ROOT)), 'sha256': hashlib.sha256(path.read_bytes()).hexdigest()}}
    (ROOT / 'INPUTS.json').write_text(json.dumps(report, ensure_ascii=False, indent=2) + '\n')
    print(json.dumps({'copied_models': len(records), 'original_inputs': len(originals)}))


if __name__ == '__main__':
    main()
