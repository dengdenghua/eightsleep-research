#!/usr/bin/env python3
"""Offline synthetic queue scenarios; writes only beside this script.

No firmware execution or NATS/server access. Fixtures are opaque byte strings,
not measured sensor records and not claimed to be production CBOR bodies.
"""
from collections import Counter, deque
import copy
import hashlib
import itertools
import json
from pathlib import Path
import sys

sys.dont_write_bytecode = True
from model import CLAIMS, JS_SLOT_COUNTS, PublishObservation, RawCaller, Record, Ring, Trace, Worker

OUT = Path(__file__).resolve().parent
ROOT = OUT.parent / "source-inputs"
CASES = []


def fixture(record_id, size=None):
    body = ('synthetic-body:' + record_id).encode()
    if size is not None:
        body = (body * (size // len(body) + 1))[:size]
    return Record(record_id, b'raw.synthetic.fixture', body)


def attempted(trace, action='js_publish_attempt'):
    return [e['record_id'] for e in trace.events if e['action'] == action]


def save(name, worker, assertions, conclusions, assumptions=()):
    CASES.append({'name': name, 'synthetic': True, 'passed': True,
                  'assertions': assertions, 'conclusions': list(conclusions),
                  'external_fixture_assumptions': list(assumptions),
                  'queue_state': [q.snapshot() for q in worker.queues],
                  'core_record_ids': [r.record_id for r in worker.core],
                  'cursor': worker.cursor, 'connected': worker.connected,
                  'events': copy.deepcopy(worker.trace.events)})


def run_scenarios():
    worker = Worker(); caller = RawCaller(worker, initial_sequence=100)
    for i in range(16):
        assert caller.flush('full-%02d' % i, b'raw.x.sens.stealth', fixture(str(i)).body)
    before = worker.queues[0].snapshot()
    assert not caller.flush('full-rejected', b'raw.x.sens.stealth', b'not-admitted')
    assert worker.queues[0].snapshot()['record_ids'] == before['record_ids']
    assert caller.sequence == 117
    assert len(worker.queues[0].records()) == 16
    assert not attempted(worker.trace)
    save('actual_raw_capacity_rejects_new_17th', worker, 21,
         ('Raw ring admits 16 message bodies; full rejects the new record and preserves existing heads.',
          'All 17 normal enqueue-return caller paths advance the logger sequence and release temporaries.',
          'A caller sequence gap is not uniquely diagnostic of this failure in real captures.'))

    worker = Worker(); caller = RawCaller(worker)
    for i in range(16):
        mask, subject = ((0x4000000, b'raw.x.sens.stealth') if i % 2 == 0
                         else (0x8000000, b'raw.x.sens.bedtemp'))
        assert caller.flush('shared-%02d' % i, subject, fixture(str(i)).body, mask)
    assert not caller.flush('shared-extra', b'raw.x.sens.stealth', b'x')
    assert caller.flush('independent-log', b'raw.log', b'log-body', mask=1)
    assert len(worker.queues[0].records()) == 16 and len(worker.queues[1].records()) == 1
    assert [q.usable_capacity for q in worker.queues] == [16, 1024, 32]
    save('non_log_masks_share_raw_slots', worker, 20,
         ('Different non-1 raw masks share the 16-message raw ring.',
          'mask=1 uses the independent log ring; body size does not turn slot capacity into a time limit.'))

    worker = Worker(slots=(4, 4, 4)); q = worker.queues[0]
    mutable = bytearray(b'original-body'); subject = bytearray(b'raw.synthetic.fixture')
    assert q.enqueue(Record('copy', subject, mutable))
    mutable[:] = b'changed-value'; subject[:] = b'changed-subject'
    assert q.peek().body == b'original-body' and q.peek().subject == b'raw.synthetic.fixture'
    assert q.enqueue(fixture('tiny', 1)); assert q.enqueue(fixture('large', 4096))
    assert not q.enqueue(fixture('too-many', 1))
    assert q.snapshot()['owned_body_bytes'] == 13 + 1 + 4096
    worker.connection_result(True); assert worker.step(PublishObservation(0)) == 'js_success'
    assert q.enqueue(fixture('wrap', 3)); assert q.write == 0 and q.read == 1
    assert not q.enqueue(fixture('still-full'))
    assert [r.record_id for r in q.records()] == ['tiny', 'large', 'wrap']
    save('copy_ownership_sizes_and_index_wrap', worker, 12,
         ('Accepted subject/body values survive mutation of caller buffers.',
          'Pop followed by enqueue reuses the wrapped slot; a refreshed cached read prevents false-full.',
          'The ring counts records, not payload bytes.'),
         ('Reduced four-slot rings exercise the same index rule; not the shipped capacity.',))

    worker = Worker(); caller = RawCaller(worker)
    for i in range(16):assert caller.flush('blocked-%02d' % i, b'raw.x.sens.stealth', fixture(str(i)).body)
    for i in range(5):
        worker.connection_result(True)
        assert worker.step(PublishObservation(1)) == 'js_failure'
        assert not caller.flush('rejected-%02d' % i, b'raw.x.sens.stealth', b'new-body')
        assert worker.cursor == 0 and worker.queues[0].read == 0
    assert attempted(worker.trace) == ['blocked-00'] * 5
    assert worker.queues[0].snapshot()['record_ids'] == ['blocked-%02d' % i for i in range(16)]
    assert caller.sequence == 21
    save('persistent_failure_keeps_head_and_fills_capacity', worker, 34,
         ('Five nonzero returns retry the same head; none of the 15 following records is attempted.',
          'Five new raw bodies cannot enter the full ring on these normal caller paths.',
          'Remote receipt and elapsed time are unknown, despite five local API invocations.'))

    worker.connection_result(True)
    for _ in range(16):assert worker.step(PublishObservation(0)) == 'js_success'
    assert worker.step() == 'empty'
    assert attempted(worker.trace) == ['blocked-00'] * 5 + ['blocked-%02d' % i for i in range(16)]
    assert not any(r.startswith('rejected-') for r in attempted(worker.trace))
    assert not any(e['action'] == 'publish_return_ok_pop' for e in CASES[-1]['events'])
    save('recovery_drains_admitted_records_only', worker, 19,
         ('Sixteen later successful API returns pop the admitted records in order.',
          'Previously rejected bodies do not reappear automatically in this modeled path.',
          'Success count concerns the local publish return, not cloud delivery or disk persistence.'))

    worker = Worker()
    for i, q in enumerate(worker.queues):
        assert q.enqueue(fixture('q%d-head' % i)); assert q.enqueue(fixture('q%d-tail' % i))
    worker.connection_result(True)
    assert worker.step(PublishObservation(0)) == 'js_success'; assert worker.cursor == 1
    assert worker.step(PublishObservation(1)) == 'js_failure'; assert worker.cursor == 1
    worker.connection_result(True); assert worker.step(PublishObservation(1)) == 'js_failure'
    assert attempted(worker.trace) == ['q0-head', 'q1-head', 'q1-head']
    assert worker.queues[2].peek().record_id == 'q2-head'
    worker.connection_result(True); assert worker.step(PublishObservation(0)) == 'js_success'
    assert worker.cursor == 2; assert worker.step(PublishObservation(0)) == 'js_success'
    assert attempted(worker.trace)[-2:] == ['q1-head', 'q2-head']
    save('round_robin_advances_only_on_success', worker, 16,
         ('Failure holds the selected queue head and shared cursor across injected reconnection.',
          'A later nonempty queue gets no opportunity during this bounded failed-head scenario.',
          'Recovery then advances to the following queue; no global concurrency fairness claim.'))

    worker = Worker(core_records=tuple(fixture('core-%d' % i) for i in range(5)))
    caller = RawCaller(worker)
    for i in range(16):assert caller.flush('core-wait-%02d' % i, b'raw.x.sens.stealth', b'body')
    worker.connection_result(True)
    for i in range(5):
        assert worker.step(core_publish_ok=True, core_flush_ok=True) == 'core_success'
        assert not caller.flush('while-core-%d' % i, b'raw.x.sens.stealth', b'new-body')
    assert not attempted(worker.trace); assert worker.cursor == 0
    assert worker.step(PublishObservation(0)) == 'js_success'
    assert attempted(worker.trace) == ['core-wait-00']
    save('bounded_core_priority_delays_js', worker, 30,
         ('Five already-pending core messages take five loop opportunities before any JS attempt.',
          'The raw ring stays full during those opportunities and rejects five new raw candidates.',
          'A permanently nonempty core workload is a possible scheduling condition, not measured starvation.'),
         ('Five core records are preloaded; core producer/admission and real-time arrival rates are not simulated.',))

    worker = Worker(core_records=(fixture('core-head'),))
    assert worker.queues[0].enqueue(fixture('js-waits'))
    worker.connection_result(True)
    assert worker.step(core_publish_ok=True, core_flush_ok=False) == 'core_failure'
    assert [r.record_id for r in worker.core] == ['core-head'] and not attempted(worker.trace)
    worker.connection_result(True)
    assert worker.step(core_publish_ok=True, core_flush_ok=True) == 'core_success'
    assert worker.step(PublishObservation(0)) == 'js_success'
    save('core_flush_failure_retains_core_head', worker, 5,
         ('Successful core Publish followed by failed Flush retains the core head and clears the connection.',
          'A later successful Publish+Flush releases the head before JS is considered.',
          'Neither core Flush nor JS API return proves cloud acceptance.'))

    worker = Worker(); assert worker.queues[0].enqueue(fixture('uncertain'))
    worker.connection_result(True)
    assert worker.step(PublishObservation(1, ack_observed=False,
                       possible_remote_accept='scenario_may_have_accepted')) == 'js_failure'
    worker.connection_result(True)
    assert worker.step(PublishObservation(0, ack_observed=None)) == 'js_success'
    attempts = [e for e in worker.trace.events if e['action'] == 'js_publish_attempt']
    assert len(attempts) == 2 and attempts[0]['body_sha256'] == attempts[1]['body_sha256']
    assert attempts[0]['ack_observed'] is False and attempts[1]['ack_observed'] is None
    assert len(worker.queues[0].records()) == 0
    save('failed_return_remote_acceptance_is_unknown', worker, 6,
         ('The same body is supplied to two local publish calls.',
          'One call might already have reached the receiver before a local error; actual duplicate storage is not established.',
          'Return 0 controls the modeled pop but does not fabricate an observed ACK packet.'),
         ('First attempt may have been accepted remotely while the fixture observes no ACK.',
          'No server state, broker deduplication or exactly-once semantics is simulated.'))

    worker = Worker(); assert worker.queues[0].enqueue(fixture('pending-at-exit'))
    worker.connection_result(True); before = worker.queues[0].snapshot()
    worker.clear_running_flag(); assert worker.step() == 'stopped'
    assert worker.queues[0].snapshot() == before and not attempted(worker.trace)
    save('worker_flag_exit_is_not_a_queue_drain', worker, 3,
         ('The worker branch exits with pending ownership still represented.',
          'This case does not model normal owner stop, waiting, destructors or process termination.'))


def check_ring_against_independent_deque():
    scenarios = operations = 0
    for slots in (2, 3, 4, 5):
        for actions in itertools.product(('enqueue', 'pop'), repeat=8):
            q = Ring('exhaustive', slots, Trace()); oracle = deque()
            for index, action in enumerate(actions):
                if action == 'enqueue':
                    record = fixture('step-%d' % index)
                    expected = len(oracle) < slots - 1
                    assert q.enqueue(record) is expected
                    if expected:oracle.append(record.record_id)
                elif oracle:
                    assert q.pop_success().record_id == oracle.popleft()
                else:assert q.peek() is None
                assert [r.record_id for r in q.records()] == list(oracle)
                assert (q.peek().record_id if oracle else q.peek()) == (oracle[0] if oracle else None)
                operations += 1
            scenarios += 1
    return {'scenario_count': scenarios, 'operation_count': operations,
            'oracle': 'collections.deque with capacity=N-1; does not use ring indices',
            'synthetic': True, 'passed': True}


def source_manifest():
    paths = [
        'analysis/signal-host/pass2/001f49b0.c',
        'analysis/signal-host/pass5/001afe00.c',
        'analysis/signal-host/pass6/001e9390.c',
        'analysis/prepublish-queue-20261108/code-audit/pass1/0019a970.c',
        'analysis/prepublish-queue-20261108/code-audit/pass1/0019a970.asm.txt',
    ]
    return [{'path_relative_to_research': rel,
             'sha256': hashlib.sha256((ROOT/rel).read_bytes()).hexdigest(),
             'kind': 'static_decompilation_or_disassembly_not_original_source'} for rel in paths]


def main():
    run_scenarios()
    exhaustive = check_ring_against_independent_deque()
    trace_dir = OUT/'traces'; trace_dir.mkdir(exist_ok=True)
    summaries = []
    for case in CASES:
        events = case.pop('events')
        p = trace_dir/(case['name']+'.jsonl')
        p.write_text(''.join(json.dumps(e, ensure_ascii=False, sort_keys=True)+'\n' for e in events))
        by_record = {}
        for event in events:
            if 'record_id' in event:
                by_record.setdefault(event['record_id'], []).append(event)
        lineage = {'synthetic': True, 'case': case['name'],
                   'scope': 'fixture record to caller/queue/publish-return states, not server state',
                   'records': by_record}
        lp = trace_dir/(case['name']+'-records.json')
        lp.write_text(json.dumps(lineage, ensure_ascii=False, indent=2)+'\n')
        case['trace'] = str(p.relative_to(OUT)); case['record_lineage'] = str(lp.relative_to(OUT))
        case['event_counts'] = dict(Counter(e['action'] for e in events))
        case['trace_sha256'] = hashlib.sha256(p.read_bytes()).hexdigest()
        summaries.append(case)
    result = {'schema': 'frank-prepublish-queue-model-v1', 'synthetic': True,
              'not_real_device_data': True, 'firmware_executed': False,
              'network_operations': 0, 'passed': True,
              'case_count': len(summaries), 'cases': summaries,
              'ring_exhaustive_validation': exhaustive, 'claims': CLAIMS,
              'source_manifest': source_manifest(),
              'limitations': [
                  'Entry starts after a body candidate exists and allocations do not throw; only normal bool-return caller paths advance sequence/clear ready.',
                  'No physical sample timing, Hz, channel positions, number of seconds buffered or real transport rate is inferred.',
                  'Opaque synthetic bytes are neither sensor recordings nor validated production CBOR.',
                  'Thread synchronization, concurrent index visibility, maintenance gates and allocation failures are not simulated.',
                  'After failure the next scan starts at the unchanged cursor; an earlier queue that was empty can receive a new record and be selected before the previous failed queue. Blocking examples require the failed head to remain the first nonempty candidate.',
                  'Repeated API submissions are not proof of server duplicates; ACK observation and remote-acceptance labels are explicit external fixture annotations.',
                  'js_Publish return 0 is not converted into an observed ACK or a claim of disk/cloud persistence.',
                  'Worker running-flag exit is modeled separately from owner shutdown/destruction; lifecycle extensions require their own verified branches.',
                  'Logger sequence is distinct from uploader batch/chunk sequence and sample chronology.',
              ]}
    (OUT/'RESULTS.json').write_text(json.dumps(result, ensure_ascii=False, indent=2)+'\n')
    (OUT/'RESULTS_ZH.txt').write_text(
        'Frank 发布前队列：合成模型验证（不是实机测量）\n'
        '通过 '+str(len(summaries))+' 个场景及 '+str(exhaustive['scenario_count'])+' 个独立deque对照轨迹。\n'
        '原始raw环形队列可容纳16条消息，raw.log为1024条，第三JS队列为32条；不是字节或时间限额。\n'
        '正常bool返回路径中，满队列拒绝新正文，调用方记录失败、释放临时副本并推进自身序号；已排队正文不因此被覆盖。\n'
        '发布非0返回保留队首、清连接；合成重连后再次尝试同一队首。成功返回才释放队首并推进轮转游标。\n'
        'core队列优先；有限场景验证其可推迟JS机会，不声称实机永久饿死或固定吞吐。\n'
        '相同正文多次提交只证明本地重试。未观察ACK、远端可能已接受和实际重复落库必须分开。\n'
        'worker运行标志退出不是完整stop或析构；分配异常、并发、NATS内部及云端不在模型范围。\n'
        '每个场景的逐步轨迹及逐记录来源链位于traces，来源反编译/汇编SHA见RESULTS.json。\n')
    print(json.dumps({'passed': True, 'synthetic': True, 'cases': len(summaries),
                      'exhaustive_ring_scenarios': exhaustive['scenario_count'],
                      'exhaustive_ring_operations': exhaustive['operation_count']}))


if __name__ == '__main__':
    main()
