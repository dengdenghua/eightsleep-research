#!/usr/bin/env python3
"""Finite fault/recovery -> 0x3c -> Frank -> prepublish queue chain.

This is a SYNTHETIC, offline model. It never loads or executes vendor binaries,
never opens a device/account/network, and never generates malformed frames or
exploit inputs. Every state transition below is a restatement of a contract that
was already established by a prior read-only code audit; the source of each is
named inline. Times are software ticks, not measured rates.

The point of this model is to join two previously separate pieces of work:
  * local-sensor-recovery-followup: MCU-side fault/recovery state chain,
    which stopped at the produced 0x3c / 0x39 payload;
  * integrated-capture-model / prepublish-queue: synthetic sampling through
    Frank CBOR and into the prepublish queue, whose "retained old value" cases
    were INJECTED rather than produced by an upstream fault state machine.
Here the fault state machine drives the packets and every row keeps a source tag.
"""
from __future__ import annotations

import hashlib
import json
from collections import Counter

BASE_TICK = 10000
FREQUENCY = 500
ROW_STEP = 1000 // FREQUENCY          # host-payload-boundaries: integer 1000/frequency
ADC_ROWS = 5
QUEUE_CAPACITY = 16                   # prepublish-queue: ring N=17 -> capacity 16
PAYLOAD_LEN = 8 + 64 * ADC_ROWS + 48  # 376, normal 5-ADC 0x3c payload


def classify_origin(origin, source_tick, row_tick):
    """Distinguish a value written by THIS callback from a retained old one.

    The origin label alone is not enough: after a CRC failure the channel still
    carries the label 'new_conversion' from the LAST successful read. Only a
    source_tick equal to this row's tick proves a fresh conversion.
    """
    if origin == 'initial':
        return 'initial_unset'
    if 'backup_copy' in origin:
        return 'backup_copy'
    if origin.startswith('new_conversion'):
        return 'new_this_callback' if source_tick == row_tick else 'retained_current'
    return 'other'


class TracedSampling:
    """MCU sampling state, with a per-row provenance ledger added.

    Mirrors local-sensor-recovery-followup/model/recovery_contracts.py::Sampling:
      0801d7dc  age<8 -> copy object backup to destination, return early
      0801d7dc  DRDY false / SPI or receive-CRC failure / ready mask 0 -> no write
      0801d7dc  CRC ok + ready -> overwrite only ready channels, then back up 32B
      080233f4  copies current into the ADC queue unconditionally; no active guard,
                no per-read CRC or success-sequence check; every 5th row also
                stores 48B IMU
      main 0x3c requires only queue counts (ADC>=5, IMU>=1), NOT sampling active
      0x29 stop: active=0 + timer setter(0,0,0); no current/queue/IMU clear
      0x28 start (080268c8): 08026722 pops both software queues, phase=0,
                active=1, sync/drain; does NOT reset shared current or IMU
      08027008 reinit: saves active, stops setter, per-device init clears device
                objects (including backup) but NOT the whole SamplingState/current;
                calls 268c8 (start) only if the saved active was non-zero
    """

    def __init__(self):
        self.current = list(range(10, 18))
        self.backup = self.current[:]
        self.imu = [100] * 24
        self.adc = []
        self.iq = []
        self.phase = 0
        self.active = True
        self.crc_fail = 0
        self.origin = ['initial'] * 8
        self.source_tick = [0] * 8
        self.events = []
        self.device_object_clears = 0

    def adc_read(self, tick, event):
        if event == 'ok':
            values = [tick % 251 + i for i in range(8)]
            for i in range(8):
                self.current[i] = values[i]
                self.origin[i] = 'new_conversion'
                self.source_tick[i] = tick
            self.backup = self.current[:]
            return 'wrote_all_channels'
        if event == 'crc_fail':
            self.crc_fail += 1
            return 'receive_crc_failed_no_write'
        if event == 'no_drdy':
            return 'drdy_false_no_write'
        if event == 'no_ready':
            return 'ready_mask_zero_no_write'
        if event == 'backup':
            # Synchronous-timing age<8 path: object backup -> destination.
            self.current = self.backup[:]
            self.origin = [f'backup_copy_from_{o}' for o in self.origin]
            return 'backup_copy_to_current'
        if event == 'partial_ready':
            values = [tick % 251 + i for i in range(8)]
            for i in range(4):  # only low four channels marked ready
                self.current[i] = values[i]
                self.origin[i] = 'new_conversion'
                self.source_tick[i] = tick
            self.backup = self.current[:]
            return 'wrote_ready_channels_only'
        raise ValueError(f'unknown sampling event: {event}')

    def snapshot(self, tick):
        if not self.active:
            return False
        self.adc.append({'tick': tick, 'values': self.current[:],
                         'origins': self.origin[:], 'source_ticks': self.source_tick[:]})
        self.phase = (self.phase + 1) % 5
        if self.phase == 0:
            self.iq.append(self.imu[:])
        return True

    def take_normal_batch(self):
        if len(self.adc) < ADC_ROWS or not self.iq:
            return None
        rows = self.adc[:ADC_ROWS]
        del self.adc[:ADC_ROWS]
        imu = self.iq.pop(0)
        return {'rows': rows, 'imu': imu,
                'reported_crc_marker': False, 'freshness_marker': False}

    def stop(self):
        before_queues = (len(self.adc), len(self.iq))
        before_current = self.current[:]
        self.active = False
        after_queues = (len(self.adc), len(self.iq))
        self.events.append({'event': 'stop', 'adc_queue': after_queues[0],
                            'imu_queue': after_queues[1],
                            'queues_unchanged': before_queues == after_queues,
                            'current_retained': self.current[:],
                            'current_unchanged': before_current == self.current})

    def start(self):
        before_current = self.current[:]
        self.adc.clear()
        self.iq.clear()
        self.phase = 0
        self.active = True
        self.events.append({'event': 'start', 'queues_cleared': True,
                            'current_retained': self.current[:],
                            'current_unchanged': before_current == self.current,
                            'note': 'sync/drain does not run hardware; current retained '
                                    'until a later producer write'})

    def reinitialize(self):
        prior_active = self.active
        self.active = False
        self.backup = [-1] * 8          # ADC/IMU device objects cleared
        self.imu = [0] * 24
        self.device_object_clears += 1
        self.events.append({'event': 'reinitialize', 'prior_active': prior_active,
                            'current_retained': self.current[:],
                            'device_backup_cleared': True,
                            'note': 'not a whole-SamplingState/current clear'})
        if prior_active:
            self.start()


class FrankDecoder:
    """Frank USB 0x3c payload boundary (host-payload-boundaries/FINDINGS_ZH.txt).

      0027e7b0: N = floor((payload_len - 8 - 48)/64); no 64-byte remainder check.
      frequency=0: header fields are written to the coroutine-local object and
                   marked present, then early exit; no per-row mapper/count update.
      frequency>0: each decoded row calls mapper 0021a5c0 with check/update=1 and
                   tick = header_tick + row_index*floor(1000/frequency), then the
                   owner+0x3c80 counter increments by one per decoded row.
      Each ADC row first copies the 0x7fffffff sentinel template; disabled fields
      are NOT previous values. No freshness / CRC / success-sequence check exists
      in this payload branch.
    """

    def __init__(self):
        self.count_0x3c80 = 0
        self.mapper_rows = 0

    def decode(self, header_tick, frequency, rows, payload_len=PAYLOAD_LEN):
        n = (payload_len - 8 - 48) // 64
        out = {'payload_len': payload_len, 'decoded_rows': n,
               'header_fields_written': True, 'header_tick': header_tick,
               'frequency': frequency, 'sentinel_template_applied': True,
               'freshness_checked': False, 'crc_marker_in_payload': False,
               'row_ticks': [], 'mapper_rows': 0, 'stale_rows': []}
        if frequency == 0:
            out['early_exit'] = True
            out['note'] = 'header present in local object; no per-row mapper or count update'
            return out
        out['early_exit'] = False
        step = 1000 // frequency
        for i, row in enumerate(rows[:n]):
            tick_param = header_tick + i * step
            out['row_ticks'].append(tick_param)
            self.mapper_rows += 1
            self.count_0x3c80 += 1
            for ch, (origin, src_tick) in enumerate(zip(row['origins'], row['source_ticks'])):
                kind = classify_origin(origin, src_tick, row['tick'])
                if kind != 'new_this_callback':
                    out['stale_rows'].append({
                        'row': i, 'channel': ch, 'origin': origin, 'kind': kind,
                        'source_tick': None if kind == 'initial_unset' else src_tick,
                        'frank_tick': tick_param,
                        'staleness_ticks': None if kind == 'initial_unset' else tick_param - src_tick,
                        'visible_to_host': False})
        out['mapper_rows'] = n
        return out


class PrepublishQueue:
    """Frank prepublish queue (prepublish-queue/code-audit/FINDINGS_ZH.txt).

      001f49b0: capacity N-1 = 16; full check happens BEFORE subject/body copy,
                so a rejected new message never overwrites the old head.
      001e9390: on enqueue failure the caller logs, frees the temporary copy and
                advances its own logger counter; no local retry in that branch.
      001afe00: core is handled first; js_Publish==0 frees the head and rotates
                the round-robin start; non-zero keeps the head, clears connection,
                waits ~1s and re-scans. Worker running flag 0 -> immediate return,
                NO queue drain (00189bb0 also shows no per-item free/reset).
    """

    def __init__(self, preload=0):
        self.items = [{'id': f'preload-{i}', 'external': True,
                       'sha256': hashlib.sha256(f'preload-{i}'.encode()).hexdigest()}
                      for i in range(preload)]
        self.rejected = []
        self.published = []
        self.logger_seq = 0
        self.retry_kept = 0
        self.publish_attempts = 0
        self.core_messages = 0   # deliberately zero; documented omission

    def enqueue(self, body):
        if len(self.items) >= QUEUE_CAPACITY:
            self.rejected.append(body['id'])
            self.logger_seq += 1
            return 'rejected_full'
        self.items.append(body)
        return 'enqueued'

    def publish_once(self, ok=True):
        if not self.items:
            return 'empty'
        self.publish_attempts += 1
        head = self.items[0]
        if ok:
            self.items.pop(0)
            self.published.append(head['id'])
            return 'published'
        self.retry_kept += 1
        return 'retained_head'
