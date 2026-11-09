#!/usr/bin/env python3
"""Read one synthetic output row and its retained source chain; no network."""
import argparse
import json
from pathlib import Path


def find_one(path, predicate):
    matches = []
    with path.open() as stream:
        for line in stream:
            value = json.loads(line)
            if predicate(value):
                matches.append(value)
    if len(matches) != 1:
        raise ValueError(f'{path.name}: expected one match, found {len(matches)}')
    return matches[0]


def trace(case, stream, side, slot, attempt=0):
    row = find_one(case / 'output-provenance.jsonl', lambda v:
                   (v['stream'], v['side'], v['slot'], v['attempt']) == (stream, side, slot, attempt))
    source = row['source']
    if source is None:
        return {'synthetic': True, 'output': row, 'origin': 'no_source_sentinel_row'}
    origin = find_one(case / 'host-inputs.jsonl', lambda v: v['source'] == source)
    packet = find_one(case / 'packets.jsonl', lambda v: v['id'] == origin['packet'])
    snapshot = find_one(case / 'mcu-snapshots.jsonl', lambda v: v['id'] == origin['snapshot'])
    imu = find_one(case / 'imu-snapshots.jsonl', lambda v: v['id'] == origin['imu_source'])
    return {'synthetic': True, 'output': row, 'host_input': origin,
            'lsp_packet': packet, 'adc_snapshot': snapshot, 'shared_imu_snapshot': imu,
            'scope': 'Research provenance is external annotation, not fields present in production CBOR.'}


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--case', type=Path, required=True)
    ap.add_argument('--stream', choices=['buzzer', 'imu'], default='buzzer')
    ap.add_argument('--side', choices=['left', 'right'], default='left')
    ap.add_argument('--slot', type=int, required=True)
    ap.add_argument('--attempt', type=int, default=0)
    args = ap.parse_args()
    print(json.dumps(trace(args.case, args.stream, ('left', 'right').index(args.side), args.slot, args.attempt),
                     ensure_ascii=False, indent=2))


if __name__ == '__main__':
    main()
