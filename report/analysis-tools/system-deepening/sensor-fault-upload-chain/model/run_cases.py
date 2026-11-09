#!/usr/bin/env python3
"""Fixed-input scenarios for the fault -> 0x3c -> Frank -> upload-queue chain.

Synthetic offline model only. Run:
    python3 model/run_cases.py
Writes model/RESULTS.json. No firmware execution, no device/account/network,
no malformed frames, no clinical data, no shared-log reentrancy investigation.
"""
from __future__ import annotations

import hashlib
import json
import sys
from collections import Counter
from pathlib import Path

sys.dont_write_bytecode = True
HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))

from fault_chain import (  # noqa: E402
    BASE_TICK, FREQUENCY, ROW_STEP, PAYLOAD_LEN, QUEUE_CAPACITY,
    TracedSampling, FrankDecoder, PrepublishQueue, classify_origin,
)

SAMPLING_EVENTS = {'ok', 'crc_fail', 'no_drdy', 'no_ready', 'backup', 'partial_ready'}
CONTROL_EVENTS = {'stop', 'start', 'reinit', 'drain', 'skip_consume', 'retry'}

OK = ['ok']
CASES = {
    'baseline': {
        'events': OK * 20,
        'intent': 'All callbacks succeed; no stale rows.',
    },
    'crc_fail_3_then_recover': {
        'events': OK * 3 + ['crc_fail'] * 3 + OK * 14,
        'intent': 'Short continuous receive-CRC failure, then recovery.',
    },
    'crc_fail_10_then_recover': {
        'events': OK * 3 + ['crc_fail'] * 10 + OK * 12,
        'intent': 'Long continuous CRC failure spanning two full 5-row packets.',
    },
    'no_drdy_burst_then_recover': {
        'events': OK * 2 + ['no_drdy'] * 5 + OK * 13,
        'intent': 'DRDY-false burst: destination untouched, snapshots still taken.',
    },
    'backup_copy_window': {
        'events': OK * 3 + ['backup'] * 5 + OK * 12,
        'intent': 'age<8 path re-copies the object backup into current.',
    },
    'partial_ready_mixed': {
        'events': OK * 3 + ['partial_ready'] * 5 + OK * 12,
        'intent': 'Only four channels overwritten; other four keep prior current.',
    },
    'stop_with_residual_batch': {
        'events': OK * 4 + ['skip_consume', 'ok'] + ['stop', 'drain'],
        'intent': 'A complete batch is already queued when stop arrives; main still consumes it.',
    },
    'stop_start_stale_first_batch': {
        'events': OK * 5 + ['stop'] + ['start'] + ['crc_fail'] * 5 + OK * 10,
        'intent': 'start clears software queues but not current; first post-start packet is all stale.',
    },
    'reinit_while_active': {
        'events': OK * 5 + ['reinit'] + ['crc_fail'] * 5 + OK * 10,
        'intent': 'Whole-device reinit with prior active=1 triggers start (queue clear); current retained.',
    },
    'reinit_while_stopped': {
        'events': OK * 5 + ['stop'] + ['reinit'] + ['start'] + ['crc_fail'] * 5 + OK * 10,
        'intent': 'Reinit with prior active=0 does NOT take the start/queue-clear branch.',
    },
    'interleaved_failure_recovery_stop_start': {
        'events': (OK * 5 + ['crc_fail'] * 3 + ['stop'] + ['start'] +
                   ['crc_fail'] * 5 + OK * 5 + ['reinit'] + ['no_drdy'] * 5 + OK * 7),
        'intent': 'Continuous failure, recovery, stop/start and reinit interleaved.',
    },
    'queue_full_during_recovery': {
        'events': OK * 5 + ['crc_fail'] * 5 + OK * 10,
        'preload': QUEUE_CAPACITY,
        'intent': 'Preloaded 16 external fixtures; recovered packets cannot enter the queue.',
    },
    'publish_failure_then_retry': {
        'events': OK * 5 + ['crc_fail'] * 5 + OK * 10,
        'publish_returns': [False, True],
        'retry_after': True,
        'intent': 'js_Publish non-zero keeps the same head; retry publishes the identical body.',
    },
    'frequency_zero_at_host': {
        'events': OK * 10,
        'frequency': 0,
        'intent': 'Frank frequency=0 early exit: header present, no per-row mapper/queue body.',
    },
}


def run_case(name, cfg):
    sampling = TracedSampling()
    queue = PrepublishQueue(preload=cfg.get('preload', 0))
    decoder = FrankDecoder()
    frequency = cfg.get('frequency', FREQUENCY)
    publish_returns = cfg.get('publish_returns')
    attempt_no = 0
    skip_consume = 0
    tick = BASE_TICK
    packets = []
    timeline = []
    row_origin_counter = {}
    staleness_values = []

    def do_publish():
        nonlocal attempt_no
        if publish_returns is None or attempt_no >= len(publish_returns):
            ok = True
        else:
            ok = publish_returns[attempt_no]
        attempt_no += 1
        return queue.publish_once(ok=ok)

    def emit_batch(batch):
        header_tick = batch['rows'][0]['tick']
        decoded = decoder.decode(header_tick, frequency, batch['rows'])
        for row in batch['rows']:
            for origin, src_tick in zip(row['origins'], row['source_ticks']):
                key = classify_origin(origin, src_tick, row['tick'])
                row_origin_counter[key] = row_origin_counter.get(key, 0) + 1
        for s in decoded['stale_rows']:
            if s['staleness_ticks'] is not None:
                staleness_values.append(s['staleness_ticks'])

        record = {
            'packet_index': len(packets),
            'header_tick': header_tick,
            'rows': len(batch['rows']),
            'row_ticks': decoded['row_ticks'],
            'row_origins': [r['origins'] for r in batch['rows']],
            'freshness_marker_in_payload': False,
            'crc_marker_in_payload': batch['reported_crc_marker'],
            'frank_early_exit': decoded['early_exit'],
            'mapper_rows': decoded['mapper_rows'],
            'stale_rows': len(decoded['stale_rows']),
            'stale_kinds': dict(Counter(s['kind'] for s in decoded['stale_rows'])),
            'max_staleness_ticks': max((s['staleness_ticks'] for s in decoded['stale_rows']
                                        if s['staleness_ticks'] is not None), default=0),
            'body_emitted': False,
        }
        if decoded['early_exit']:
            record['note'] = ('header fields marked present in coroutine-local object; '
                              'this branch emits no per-row mapper output')
            packets.append(record)
            timeline.append({'event': 'emit', 'packet': record['packet_index'],
                             'result': 'frank_early_exit_no_body'})
            return
        payload = {'header_tick': header_tick, 'frequency': frequency,
                   'rows': [r['values'] for r in batch['rows']],
                   'origins': [r['origins'] for r in batch['rows']]}
        body = {
            'id': f'{name}-body-{record["packet_index"]}',
            'sha256': hashlib.sha256(json.dumps(payload, sort_keys=True).encode()).hexdigest(),
            'stale_rows': len(decoded['stale_rows']),
            'external': False,
        }
        record['body_emitted'] = True
        record['body_sha256'] = body['sha256']
        record['enqueue'] = queue.enqueue(body)
        record['publish'] = do_publish() if record['enqueue'] == 'enqueued' else 'no_attempt'
        packets.append(record)
        timeline.append({'event': 'emit', 'packet': record['packet_index'],
                         'enqueue': record['enqueue'], 'publish': record['publish']})

    def consume():
        batch = sampling.take_normal_batch()
        if batch is not None:
            emit_batch(batch)

    for ev in cfg['events']:
        if ev == 'skip_consume':
            skip_consume += 1
            timeline.append({'event': 'skip_consume', 'note': 'main not scheduled this slot'})
            continue
        if ev == 'drain':
            timeline.append({'event': 'drain', 'active': sampling.active,
                             'adc_queue': len(sampling.adc)})
            consume()
            continue
        if ev == 'retry':
            timeline.append({'event': 'retry', 'head': queue.items[0]['id'] if queue.items else None})
            do_publish()
            continue
        if ev == 'stop':
            sampling.stop()
            timeline.append({'event': 'stop', 'active': sampling.active})
            continue
        if ev == 'start':
            sampling.start()
            timeline.append({'event': 'start', 'active': sampling.active})
            continue
        if ev == 'reinit':
            sampling.reinitialize()
            timeline.append({'event': 'reinit', 'active': sampling.active})
            continue
        if ev in SAMPLING_EVENTS:
            outcome = sampling.adc_read(tick, ev)
            snapped = sampling.snapshot(tick)
            timeline.append({'event': ev, 'tick': tick, 'adc_read': outcome,
                             'snapshotted': snapped, 'active': sampling.active,
                             'current': sampling.current[:]})
            tick += ROW_STEP
            if skip_consume > 0:
                skip_consume -= 1
            else:
                consume()
            continue
        raise ValueError(f'unknown event {ev!r}')

    if cfg.get('retry_after'):
        timeline.append({'event': 'worker_retry_cycle'})
        do_publish()

    contract_checks = []
    def check(label, condition, detail):
        contract_checks.append({'check': label, 'ok': bool(condition), 'detail': detail})

    emitted = [p for p in packets if p['body_emitted']]
    check('every 0x3c carries no freshness or CRC-success marker',
          all(not p['freshness_marker_in_payload'] and not p['crc_marker_in_payload']
              for p in packets),
          'local-sensor-recovery-followup: main 0x3c/0x39 reads caches without per-read CRC/ready sequence')
    check('Frank row ticks are header_tick + i*floor(1000/frequency)',
          all(p['row_ticks'] == [p['header_tick'] + i * (1000 // frequency)
                                 for i in range(len(p['row_ticks']))]
              for p in packets if not p['frank_early_exit']),
          'host-payload-boundaries 0027e7b0')
    check('stale rows are assigned new continuous Frank ticks',
          all(s > 0 for s in staleness_values) if staleness_values else True,
          f'{len(staleness_values)} stale row/channel pairs, '
          f'staleness range {min(staleness_values) if staleness_values else 0}..'
          f'{max(staleness_values) if staleness_values else 0} ticks')
    check('frequency=0 emits no per-row mapper output',
          all(p['mapper_rows'] == 0 for p in packets) if frequency == 0 else True,
          'host-payload-boundaries frequency=0 early exit')
    check('queue never exceeds capacity 16',
          len(queue.items) <= QUEUE_CAPACITY,
          f'preload={cfg.get("preload", 0)}, residual={len(queue.items)}, capacity={QUEUE_CAPACITY}')
    check('rejected new bodies never replace the old head',
          all(p['publish'] == 'no_attempt' for p in emitted if p['enqueue'] == 'rejected_full'),
          'prepublish-queue 001f49b0 full check precedes body copy')
    check('publish failure keeps the identical head for retry',
          cfg.get('publish_returns') is None or queue.retry_kept >= 1,
          f'retry_kept={queue.retry_kept}, published={len(queue.published)}')
    stops = [e for e in sampling.events if e['event'] == 'stop']
    starts = [e for e in sampling.events if e['event'] == 'start']
    check('stop does not clear queues or current',
          all(e.get('queues_unchanged') and e.get('current_unchanged') for e in stops),
          f'{len(stops)} stop event(s); 0x29 leaves both software queues and shared current intact')
    check('start clears software queues but retains current',
          all(e.get('queues_cleared') and e.get('current_unchanged') for e in starts),
          f'{len(starts)} start event(s); 080268c8/08026722 pop queues, no current reset')

    return {
        'intent': cfg['intent'],
        'events_count': len(cfg['events']),
        'frequency': frequency,
        'preload': cfg.get('preload', 0),
        'sampling_events': sampling.events,
        'packets': packets,
        'summary': {
            'packets_total': len(packets),
            'bodies_emitted': len(emitted),
            'rows_total': sum(p['rows'] for p in packets),
            'row_origin_counts': row_origin_counter,
            'stale_row_channel_pairs': len(staleness_values),
            'staleness_min_ticks': min(staleness_values) if staleness_values else None,
            'staleness_max_ticks': max(staleness_values) if staleness_values else None,
            'frank_mapper_rows': decoder.mapper_rows,
            'frank_0x3c80_counter': decoder.count_0x3c80,
            'enqueued': sum(1 for p in emitted if p['enqueue'] == 'enqueued'),
            'rejected_full': len(queue.rejected),
            'published': len(queue.published),
            'publish_attempts': queue.publish_attempts,
            'retry_kept': queue.retry_kept,
            'queue_residual': len(queue.items),
            'logger_seq': queue.logger_seq,
            'crc_fail_events': sampling.crc_fail,
            'device_object_clears': sampling.device_object_clears,
        },
        'contract_checks': contract_checks,
        'timeline': timeline,
    }


def main():
    results = {name: run_case(name, cfg) for name, cfg in CASES.items()}
    all_checks = [c for r in results.values() for c in r['contract_checks']]
    totals = {
        'cases': len(results),
        'contract_checks': len(all_checks),
        'contract_checks_failed': sum(1 for c in all_checks if not c['ok']),
        'packets_total': sum(r['summary']['packets_total'] for r in results.values()),
        'bodies_emitted': sum(r['summary']['bodies_emitted'] for r in results.values()),
        'stale_row_channel_pairs': sum(r['summary']['stale_row_channel_pairs'] for r in results.values()),
        'rejected_full': sum(r['summary']['rejected_full'] for r in results.values()),
        'published': sum(r['summary']['published'] for r in results.values()),
    }
    out = {
        'date': '2026-11-08',
        'kind': 'synthetic_finite_model_not_device_measurement',
        'method': 'MCU fault state machine drives 0x3c packets; each row keeps a provenance tag; '
                  'Frank payload boundary rebuilds row ticks; prepublish queue decides what enters upload.',
        'constants': {'base_tick': BASE_TICK, 'frequency': FREQUENCY,
                      'row_step_ticks': ROW_STEP, 'payload_len': PAYLOAD_LEN,
                      'queue_capacity': QUEUE_CAPACITY},
        'totals': totals,
        'cases': results,
        'scope_limits': [
            'Abstract body objects stand in for the 30,128-byte CBOR encoding; byte-level '
            'CBOR/LSP/CRC reproduction is already covered by integrated-capture-model and is not repeated here.',
            'No core-queue messages, KV coordination, libnats ACK semantics, TLS, uploader or cloud receiver.',
            'Publish return codes, CRC/DRDY outcomes, stop/start/reinit events are explicit inputs, '
            'not observed device behavior or fault rates.',
            'No shared-log formatting/reentrancy, no malformed payloads, no vendor binary execution.',
            'No physical timing: ticks are software counts, not wall-clock measurements.',
        ],
    }
    target = HERE / 'RESULTS.json'
    target.write_text(json.dumps(out, ensure_ascii=False, indent=2) + '\n')
    print(json.dumps({'totals': totals,
                      'per_case': {k: v['summary'] for k, v in results.items()}},
                     ensure_ascii=False, indent=2))
    return 0 if totals['contract_checks_failed'] == 0 else 1


if __name__ == '__main__':
    raise SystemExit(main())
