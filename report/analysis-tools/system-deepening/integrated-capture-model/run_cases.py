#!/usr/bin/env python3
"""Trace synthetic MCU snapshots through canonical LSP, host CBOR and raw queue.

No firmware execution, network, device, account, clinical data or cloud model.
The schedule and publication return codes are explicit experimental inputs.
"""
from collections import Counter
from dataclasses import asdict
import argparse
import hashlib
import importlib.util
import json
from pathlib import Path
import struct
import sys

sys.dont_write_bytecode = True
ROOT = Path(__file__).resolve().parent
sys.path.insert(0, str(ROOT / 'vendor/host-model'))


def load(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


host = load('integrated_host_model', ROOT / 'vendor/host-model/model.py')
wire = load('integrated_wire_parser', ROOT / 'vendor/cbor-encoder/host_signal_parser.py')
queue = load('integrated_queue_model', ROOT / 'vendor/prepublish-queue/model.py')
ordinal = load('integrated_ordinal_queues', ROOT / 'vendor/ordinal_queues.py')
receiver_model = load('integrated_host_receiver', ROOT / 'vendor/host-receiver/parser_model.py')
EPOCH = 1700000000
BASE_TICK = 10000
FLAGS = 0xf200
FREQUENCY = 500
ADC_MISSING = 0x7fffffff
IMU_MISSING = 0x7fff


def sha(data):
    return hashlib.sha256(data).hexdigest()


def write_json(path, value):
    path.write_text(json.dumps(value, ensure_ascii=False, indent=2) + '\n')


def write_jsonl(path, values):
    with path.open('w') as stream:
        for value in values:
            stream.write(json.dumps(value, ensure_ascii=False, separators=(',', ':')) + '\n')


def frame(payload):
    """Canonical complete LSP frame only; no PMA/USB driver emulation."""
    body = b'\x3c' + payload
    raw = len(body).to_bytes(2, 'big') + body + wire.lsp_crc(body).to_bytes(2, 'big')
    escaped = bytearray(b'\x7e')
    for byte in raw:
        if byte in (0x7d, 0x7e):
            escaped.extend((0x7d, byte ^ 0x20))
        else:
            escaped.append(byte)
    return bytes(escaped)


class MCU:
    """Add explicit values/provenance to the retained ordinal FIFO model.

    ADC1 has eight synthetic signed24 values multiplied by four. No SPI,
    analog filter, IRQ timing, cache-age shortcut or actual clock is emulated.
    All four IMU groups enabled, inputs restricted below positive 32767.
    """
    def __init__(self, side):
        self.side = side
        self.name = ('left', 'right')[side]
        self.fifo = ordinal.Queues()
        self.callbacks = 0
        self.cache = [0] * 8
        self.origins = [None] * 8
        self.origin_slots = [None] * 8
        self.snapshots = {}
        self.imu = {}
        self.events = []
        self.packet_number = 0

    def sample(self, slot, ready=0xff):
        self.callbacks += 1
        seq = self.callbacks
        for ch in range(8):
            if ready & (1 << ch):
                raw = (self.side * 1000000 + ch * 10000 + slot) * (-1 if ch % 2 else 1)
                assert -(1 << 23) <= raw < (1 << 23)
                self.cache[ch] = raw * 4
                self.origins[ch] = f'{self.name}:adc1:{ch}:conversion-at-slot-{slot}'
                self.origin_slots[ch] = slot
        snapshot = {'id': f'{self.name}:snapshot-{seq}', 'side': self.side,
                    'callback_ordinal': seq, 'schedule_slot': slot,
                    'tick': BASE_TICK + (slot - 1) * 2, 'ready_mask_fixture': ready,
                    'adc_wire': [0] * 8 + list(self.cache),
                    'adc_origins': [None] * 8 + list(self.origins),
                    'adc_origin_slots': [None] * 8 + list(self.origin_slots)}
        self.snapshots[seq] = snapshot
        if seq % 5 == 0:
            values = [(self.side * 4000 + axis * 100 + seq) * (-1 if axis % 2 else 1)
                      for axis in range(24)]
            assert all(-32768 <= value <= 32766 for value in values)
            self.imu[seq] = {'id': f'{self.name}:imu-{seq}', 'callback_ordinal': seq,
                             'schedule_slot': slot, 'values': values,
                             'origins': [f'{self.name}:imu-{seq}:axis-{i}' for i in range(24)]}
        before = dict(self.fifo.drops)
        self.fifo.tick(seq)
        if before != dict(self.fifo.drops):
            self.events.append({'event': 'fifo_rejected_new', 'schedule_slot': slot,
                                'callback_ordinal': seq, 'drop_counters': dict(self.fifo.drops)})

    def drain(self, delivery_slot):
        records = []
        for batch in self.fifo.drain():
            self.packet_number += 1
            samples = [self.snapshots[n] for n in batch['adc']]
            imu = self.imu[batch['imu']]
            payload = struct.pack('>IHH', samples[0]['tick'], FLAGS, FREQUENCY)
            payload += b''.join(struct.pack('>16i', *sample['adc_wire']) for sample in samples)
            payload += struct.pack('>24h', *imu['values'])
            packet = {'id': f'{self.name}:packet-{self.packet_number}', 'side': self.side,
                      'packet_number': self.packet_number, 'adc_ordinals': batch['adc'],
                      'adc_schedule_slots': [sample['schedule_slot'] for sample in samples],
                      'imu_ordinal': batch['imu'], 'imu_schedule_slot': imu['schedule_slot'],
                      'imu_minus_last_adc_callbacks': batch['skew'],
                      'delivery_schedule_slot': delivery_slot,
                      'flags_at_grouping': FLAGS, 'frequency_field': FREQUENCY,
                      'payload_bytes': len(payload), 'payload_sha256': sha(payload)}
            encoded = frame(payload)
            packet.update(lsp_bytes=len(encoded), lsp_sha256=sha(encoded))
            records.append((packet, encoded))
        return records


def adapt(parsed, packet, mcu):
    """Make all parser/model boundaries explicit; never use Sample defaults."""
    assert parsed['opcode'] == 0x3c and parsed['header_bit_7'] is False
    data = parsed['stealth']
    assert data['adc_frame_count'] == len(packet['adc_ordinals']) == 5
    assert data['frequency_hz'] == FREQUENCY and data['flags'] == FLAGS
    imu = [value for group in data['imu_groups_wire_order']
           for value in (group if group is not None else [IMU_MISSING] * 6)]
    for index, sample in enumerate(data['samples']):
        adc = [ADC_MISSING if value is None else value for value in sample['adc']]
        snapshot = mcu.snapshots[packet['adc_ordinals'][index]]
        source = f'{packet["id"]}:record-{index}'
        provenance = {'source': source, 'packet': packet['id'], 'record_index': index,
                      'snapshot': snapshot['id'], 'snapshot_schedule_slot': snapshot['schedule_slot'],
                      'wire_tick': sample['device_tick_ms'], 'stored_snapshot_tick': snapshot['tick'],
                      'adc': adc, 'adc_origins': snapshot['adc_origins'],
                      'adc_origin_slots': snapshot['adc_origin_slots'],
                      'imu': imu, 'imu_source': mcu.imu[packet['imu_ordinal']]['id'],
                      'imu_origins': mcu.imu[packet['imu_ordinal']]['origins'],
                      'imu_schedule_slot': packet['imu_schedule_slot'],
                      'imu_minus_packet_last_adc_callbacks': packet['imu_minus_last_adc_callbacks'],
                      'version_flags': data['flags']}
        # A discrepancy would expose packet tick reconstruction; don't silently fix it.
        provenance['reconstructed_tick_matches_stored'] = provenance['wire_tick'] == provenance['stored_snapshot_tick']
        yield provenance


def decoded_values(record, stream, side, slot):
    name = ('left', 'right')[side]
    if stream == 'buzzer':
        values = [column[slot] for column in record[name]['data']]
        return [ADC_MISSING if value is None else value for value in values]
    values = [record[name][group][kind][axis][slot]
              for group in range(4) for kind in ('gyro', 'accel') for axis in ('x', 'y', 'z')]
    return [IMU_MISSING if value is None else value for value in values]


def output_ledger(pipeline, origins, messages):
    """Every encoded row, including absent/default-sentinel rows, gets a record."""
    ledger = []
    checked_cells = 0
    summaries = []
    for attempt, output in enumerate(pipeline.outputs):
        payload = pipeline.wire_payloads[attempt]['stealth']
        decoded = wire.parse_cbor(payload, samples=True)
        assert [part['record']['type'] for part in decoded] == ['piezo-buzzer', 'imu-multi-channel']
        stream_stats = {}
        for stream, decoded_part in zip(('buzzer', 'imu'), decoded):
            stage = output['streams'][stream]
            rows = {(row['side'], row['slot']): row for row in stage['points']}
            count, width, missing = (500, 5, ADC_MISSING) if stream == 'buzzer' else (100, 24, IMU_MISSING)
            per_side = []
            for side in (0, 1):
                stats = Counter()
                imu_sources = set()
                for slot in range(count):
                    row = rows.get((side, slot))
                    expected = row['values'] if row else [missing] * width
                    values = decoded_values(decoded_part['record'], stream, side, slot)
                    assert values == expected, (attempt, stream, side, slot)
                    checked_cells += width
                    source = row['source'] if row else None
                    origin = origins.get(source)
                    stats['non_sentinel_cells'] += sum(value != missing for value in values)
                    stats['sentinel_cells'] += sum(value == missing for value in values)
                    stats['copied_rows'] += bool(row and row['copied'])
                    component_ids = ([None] * width if origin is None else
                                     origin['adc_origins'][8:13] if stream == 'buzzer' else origin['imu_origins'])
                    retained = ([False] * width if origin is None or stream != 'buzzer' else
                                [value != origin['snapshot_schedule_slot']
                                 for value in origin['adc_origin_slots'][8:13]])
                    stats['retained_adc_cells'] += sum(retained)
                    if origin is not None and stream == 'imu':
                        imu_sources.add(origin['imu_source'])
                        stats['imu_rows_from_misaligned_packets'] += origin['imu_minus_packet_last_adc_callbacks'] != 0
                    ledger.append({'message': messages[attempt]['id'], 'attempt': attempt,
                                   'stream': stream, 'side': side, 'slot': slot,
                                   'values': values, 'source': source,
                                   'host_copy': bool(row and row['copied']),
                                   'packet': None if origin is None else origin['packet'],
                                   'snapshot': None if origin is None else origin['snapshot'],
                                   'component_origins': component_ids,
                                   'retained_adc_at_snapshot': retained,
                                   'imu_source': None if origin is None or stream != 'imu' else origin['imu_source'],
                                   'imu_minus_packet_last_adc_callbacks': None if origin is None or stream != 'imu'
                                   else origin['imu_minus_packet_last_adc_callbacks'],
                                   'queue_accepted': messages[attempt]['queue_accepted'],
                                   'publication_attempts': messages[attempt]['publication_attempts']})
                if stream == 'imu':
                    stats['unique_imu_sources'] = len(imu_sources)
                per_side.append(dict(stats))
            stream_stats[stream] = per_side
        summaries.append({'attempt': attempt, 'message': messages[attempt], 'streams': stream_stats,
                          'load_primary': pipeline.loads[attempt]['primary'],
                          'loader_break_at': pipeline.loads[attempt]['break_at']})
    return ledger, checked_cells, summaries


CASES = [
    {'id': 'baseline'},
    {'id': 'one_missing_callback_left', 'skip_left_slot': 101},
    {'id': 'retained_adc_channel_left', 'stale_left_slots': [100, 109]},
    {'id': 'lost_left_batch', 'drop_packet': [0, 21]},
    {'id': 'lost_right_batch', 'drop_packet': [1, 21]},
    {'id': 'adc_imu_fifo_stall_left', 'left_stall_callbacks': 60, 'schedule_slots': 1505},
    {'id': 'raw_queue_full', 'prefill_raw': 16},
    {'id': 'publish_failure_then_retry', 'publish_retry': True},
]


def run_case(config, out):
    out.mkdir(parents=True, exist_ok=True)
    mcus = [MCU(0), MCU(1)]
    pipeline = host.Pipeline(compat=False, auto_flush=True)
    worker = queue.Worker()
    caller = queue.RawCaller(worker)
    for i in range(config.get('prefill_raw', 0)):
        assert worker.queues[0].enqueue(queue.Record(f'external-prefill-{i}', b'raw.fixture',
                                                     b'EXPLICIT EXTERNAL QUEUE FIXTURE'))
    packets, origins, messages = [], {}, []
    delivered = [bytearray(), bytearray()]
    receivers = [receiver_model.Receiver(), receiver_model.Receiver()]

    def capture_outputs():
        while len(messages) < len(pipeline.outputs):
            attempt = len(messages)
            body = pipeline.wire_payloads[attempt]['stealth']
            assert body is not None
            mid = f'{config["id"]}:stealth-{attempt}'
            accepted = caller.flush(mid, b'raw.x.sens.stealth', body)
            path = out / f'stealth-{attempt}.cbor'
            path.write_bytes(body)
            messages.append({'id': mid, 'path': path.name, 'bytes': len(body), 'sha256': sha(body),
                             'queue_accepted': accepted, 'publication_attempts': [],
                             'cloud_receipt': 'unknown_not_simulated'})
            if accepted:
                stored = next(r for r in worker.queues[0].records() if r.record_id == mid)
                assert stored.body == body

    for slot in range(1, config.get('schedule_slots', 1005) + 1):
        for side, mcu in enumerate(mcus):
            if side == 0 and slot == config.get('skip_left_slot'):
                mcu.events.append({'event': 'injected_missing_callback', 'schedule_slot': slot,
                                   'cause': 'external_fixture_not_derived_IRQ_failure'})
                continue
            ready = 0xff
            stale = config.get('stale_left_slots')
            if side == 0 and stale and stale[0] <= slot <= stale[1]:
                ready &= ~1
            mcu.sample(slot, ready)
            if side == 0 and mcu.callbacks < config.get('left_stall_callbacks', 0):
                continue
            for packet, encoded in mcu.drain(slot):
                packet['delivered_fixture'] = config.get('drop_packet') != [side, packet['packet_number']]
                packets.append(packet)
                if not packet['delivered_fixture']:
                    (out / f'dropped-{side}-{packet["packet_number"]}.lsp').write_bytes(encoded)
                    continue
                packet['stream_offset'] = len(delivered[side])
                delivered[side].extend(encoded)
                reference = wire.parse_lsp(encoded, side=mcu.name)
                assert len(reference) == 1
                rx = receivers[side]
                before = len(rx.accepted)
                # Arbitrary userspace read chunks, not USB packet-size timing.
                for fragment in (encoded[:1], encoded[1:73], encoded[73:]):
                    rx.add(fragment)
                    rx.drain()
                assert len(rx.accepted) == before + 1
                body = rx.accepted[-1]
                parsed = {'opcode': body[0] & 0x7f, 'header_bit_7': bool(body[0] & 0x80),
                          'stealth': wire.parse_usb(body[1:], side=mcu.name)}
                assert parsed['stealth'] == reference[0]['stealth']
                for origin in adapt(parsed, packet, mcu):
                    assert origin['source'] not in origins
                    origins[origin['source']] = origin
                    pipeline.ingest(side, origin['wire_tick'], EPOCH + (slot - 1) // 500,
                                    source=origin['source'], adc=origin['adc'], imu=origin['imu'],
                                    version=origin['version_flags'])
                    capture_outputs()
    # Do not force a final flush: pending seconds remain pending as in this schedule.
    audit = pipeline.audit()
    assert len(messages) == len(pipeline.outputs) == len(pipeline.wire_payloads)
    if not config.get('prefill_raw'):
        worker.connection_result(True)
        for message in messages:
            returns = [1, 0] if config.get('publish_retry') else [0]
            for code in returns:
                if not worker.connected:
                    worker.connection_result(True)
                before = worker.queues[0].peek()
                assert before.record_id == message['id'] and sha(before.body) == message['sha256']
                result = worker.step(queue.PublishObservation(code))
                message['publication_attempts'].append({'synthetic_return_code': code, 'result': result,
                                                        'body_sha256': sha(before.body), 'ack_observed': None})
                if code:
                    assert worker.queues[0].peek().body == before.body
        assert not worker.queues[0].records()
    ledger, checked, summaries = output_ledger(pipeline, origins, messages)
    for side, name in enumerate(('left', 'right')):
        path = out / f'{name}.lsp'
        path.write_bytes(delivered[side])
        count = len(wire.parse_lsp(path.read_bytes(), side=name))
        assert count == sum(p['side'] == side and p['delivered_fixture'] for p in packets)
    write_jsonl(out / 'mcu-snapshots.jsonl', [s for mcu in mcus for s in mcu.snapshots.values()])
    write_jsonl(out / 'imu-snapshots.jsonl', [s for mcu in mcus for s in mcu.imu.values()])
    write_jsonl(out / 'packets.jsonl', packets)
    write_jsonl(out / 'host-inputs.jsonl', origins.values())
    write_jsonl(out / 'host-events.jsonl', pipeline.events)
    write_jsonl(out / 'output-provenance.jsonl', ledger)
    write_jsonl(out / 'queue-events.jsonl', worker.trace.events)
    write_jsonl(out / 'receiver-events.jsonl', [dict(side=side, **event)
                                              for side, rx in enumerate(receivers) for event in rx.events])
    write_jsonl(out / 'host-dispositions.jsonl', [
        {'token': token, 'reason': reason, 'sample': asdict(pipeline.samples[token]),
         'contributions': pipeline.contributions[token]} for token, reason in pipeline.disposition.items()])
    result = {'id': config['id'], 'configuration': config,
              'nature': 'synthetic_schedule_and_bytes_not_firmware_execution_or_capture',
              'host_audit': audit, 'encoded_cells_verified': checked,
              'messages': summaries, 'caller_sequence': caller.sequence,
              'mcu': [{'side': mcu.side, 'callbacks': mcu.callbacks,
                       'fifo_drops': dict(mcu.fifo.drops), 'pending_adc': list(mcu.fifo.adc),
                       'pending_imu': list(mcu.fifo.imu), 'events': mcu.events} for mcu in mcus],
              'packet_pairing_skews': [dict(Counter(p['imu_minus_last_adc_callbacks'] for p in packets
                                                  if p['side'] == side)) for side in (0, 1)],
              'generated_packets': len(packets), 'delivered_packets': sum(p['delivered_fixture'] for p in packets),
              'receiver_crc_accepted': [len(rx.accepted) for rx in receivers],
              'tick_reconstruction_mismatches': sum(not p['reconstructed_tick_matches_stored'] for p in origins.values()),
              'final_raw_queue': worker.queues[0].snapshot(), 'cloud_receipt': 'unknown_not_simulated'}
    write_json(out / 'SUMMARY.json', result)
    return result


def verify_differentials(results):
    byid = {r['id']: r for r in results}
    def b(name, side):
        return byid[name]['messages'][0]['streams']['buzzer'][side]
    for result in results:
        expected_outputs = 2 if result['id'] == 'adc_imu_fifo_stall_left' else 1
        assert result['host_audit']['output_batches'] == expected_outputs
        assert result['tick_reconstruction_mismatches'] == 0
        assert result['encoded_cells_verified'] == expected_outputs * 9800
    assert [b('baseline', i)['non_sentinel_cells'] for i in (0, 1)] == [2500, 2500]
    assert b('one_missing_callback_left', 0)['copied_rows'] == 1
    assert byid['one_missing_callback_left']['messages'][0]['streams']['imu'][0]['unique_imu_sources'] == 99
    assert b('retained_adc_channel_left', 0)['retained_adc_cells'] == 10
    assert [b('lost_left_batch', i)['non_sentinel_cells'] for i in (0, 1)] == [500, 500]
    assert [b('lost_right_batch', i)['non_sentinel_cells'] for i in (0, 1)] == [2500, 2475]
    stalled = byid['adc_imu_fifo_stall_left']
    assert stalled['mcu'][0]['fifo_drops'] == {'adc': 30}
    assert -30 in stalled['packet_pairing_skews'][0]
    assert [x['non_sentinel_cells'] for x in stalled['messages'][1]['streams']['buzzer']] == [2500, 2500]
    assert stalled['messages'][0]['streams']['imu'][0]['imu_rows_from_misaligned_packets'] == 0
    assert stalled['messages'][1]['streams']['imu'][0]['imu_rows_from_misaligned_packets'] == 100
    full = byid['raw_queue_full']
    assert full['messages'][0]['message']['queue_accepted'] is False
    assert full['messages'][0]['message']['publication_attempts'] == []
    assert full['caller_sequence'] == 1 and len(full['final_raw_queue']['record_ids']) == 16
    retried = byid['publish_failure_then_retry']['messages'][0]['message']
    assert [a['synthetic_return_code'] for a in retried['publication_attempts']] == [1, 0]
    assert len({a['body_sha256'] for a in retried['publication_attempts']}) == 1
    assert byid['publish_failure_then_retry']['caller_sequence'] == 1
    return {'status': 'PASS', 'cases': len(results), 'encoded_cells_verified': sum(r['encoded_cells_verified'] for r in results),
            'scope': 'Integration/differential checks between retained reconstructions and independent decoding; not target execution.'}


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--output', type=Path, default=ROOT / 'results')
    args = ap.parse_args()
    args.output.mkdir(parents=True, exist_ok=True)
    results = [run_case(config, args.output / config['id']) for config in CASES]
    validation = verify_differentials(results)
    write_json(args.output / 'RESULTS.json', {'validation': validation, 'cases': results})
    print(json.dumps(validation, ensure_ascii=False))


if __name__ == '__main__':
    main()
