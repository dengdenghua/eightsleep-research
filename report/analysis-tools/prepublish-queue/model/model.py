"""Synthetic, deterministic model of the recovered Frank pre-publish queue.

Not firmware execution, a NATS client, a transport simulator, or a sensor model.
Opaque fixture bytes stand for already encoded bodies. Only the explicit caller,
ring and worker branches named in CLAIMS are transcribed. Allocation exceptions,
concurrency memory ordering, worker maintenance gates, timings, the NATS server,
deduplication and shutdown owner cleanup are outside the initial model.
"""
from dataclasses import dataclass
import hashlib


CLAIMS = {
    'capacity': 'FUN_0019a970: raw/log/third JS slots=17/1025/33; usable=N-1; core slots=17',
    'ring_full': 'FUN_001f49b0: next(write)==refreshed read returns 0 before copies',
    'ring_copy': 'FUN_001f49b0: copy subject/body, then publish write index',
    'caller': 'FUN_001e9390: non-mask1 -> raw queue; false logs; release temporaries; sequence++; ready=0',
    'publish': 'FUN_001afe00: js_Publish uses head subject/body; return 0 frees/pop; other returns retain head',
    'round_robin': 'FUN_001afe00: scan three JS queues; only success sets cursor=(selected+1)%3',
    'failure': 'FUN_001afe00: failed publish destroys contexts/connection, requests 1 second sleep, loops',
    'core_priority': 'FUN_001afe00: core Publish+Flush success pops then restarts loop before JS',
    'worker_exit': 'FUN_001afe00: cleared running flag returns; this branch does not drain queues',
    'observation_boundary': 'libnats implementation and remote outcome not modeled; API return is not an observed ACK packet',
}
JS_SLOT_COUNTS = (0x11, 0x401, 0x21)
JS_NAMES = ('raw', 'log', 'third')


@dataclass(frozen=True)
class Record:
    record_id: str
    subject: bytes
    body: bytes
    caller_sequence_at_flush: int = 0

    def facts(self):
        return {'record_id': self.record_id,
                'subject': self.subject.decode('ascii'),
                'body_length': len(self.body),
                'body_sha256': hashlib.sha256(self.body).hexdigest(),
                'caller_sequence_at_flush': self.caller_sequence_at_flush}


class Trace:
    def __init__(self):
        self.events = []

    def emit(self, action, claims, record=None, **fields):
        entry = {'step': len(self.events) + 1, 'action': action,
                 'source_claims': list(claims), 'synthetic': True, **fields}
        if record is not None:
            entry.update(record.facts())
        self.events.append(entry)


class Ring:
    """N slots with one permanently reserved position; logical owned objects.

    Clearing a Python slot means ownership release, not zeroing original memory.
    Cached indices are represented; no claim about threaded memory ordering.
    """
    def __init__(self, name, slots, trace):
        if type(slots) is not int or slots < 2:
            raise ValueError('ring needs at least two slots')
        self.name, self.slots, self.trace = name, slots, trace
        self.storage = [None] * slots
        self.write = self.read = self.cached_read = self.cached_write = 0

    @property
    def usable_capacity(self):
        return self.slots - 1

    def snapshot(self):
        return {'queue': self.name, 'slots': self.slots,
                'usable_capacity': self.usable_capacity, 'write': self.write,
                'read': self.read, 'cached_read': self.cached_read,
                'cached_write': self.cached_write,
                'record_ids': [r.record_id for r in self.records()],
                'owned_body_bytes': sum(len(r.body) for r in self.records())}

    def records(self):
        out, index = [], self.read
        while index != self.write:
            out.append(self.storage[index])
            index = (index + 1) % self.slots
        return out

    def enqueue(self, record):
        following = (self.write + 1) % self.slots
        if following == self.cached_read:
            self.cached_read = self.read
            if following == self.cached_read:
                self.trace.emit('enqueue_rejected_full', ('ring_full',), record,
                                queue=self.name, state=self.snapshot())
                return False
        owned = Record(record.record_id, bytes(record.subject), bytes(record.body),
                       record.caller_sequence_at_flush)
        self.storage[self.write] = owned
        self.write = following
        self.trace.emit('enqueue_copied', ('ring_copy',), owned,
                        queue=self.name, state=self.snapshot())
        return True

    def peek(self):
        if self.read == self.cached_write:
            self.cached_write = self.write
            if self.read == self.cached_write:
                return None
        return self.storage[self.read]

    def pop_success(self):
        record = self.peek()
        if record is None:
            raise ValueError('cannot pop an empty ring')
        self.storage[self.read] = None
        self.read = (self.read + 1) % self.slots
        self.trace.emit('publish_return_ok_pop', ('publish',), record,
                        queue=self.name, state=self.snapshot())
        return record


class RawCaller:
    """Only the reached encoded-body enqueue path of flushChunkToJetStream.

    Entry requires a successfully produced body and no allocation exception;
    sequence/ready changes model only the enqueue call's normal bool-return path.
    Does not decide when sensor loaders produce a body. The logger sequence is
    tracked separately from any payload sample/time/CBOR or uploader sequence.
    """
    def __init__(self, worker, initial_sequence=0):
        self.worker, self.sequence = worker, initial_sequence

    def flush(self, record_id, subject, body, mask=0x4000000):
        record = Record(record_id, bytes(subject), bytes(body), self.sequence)
        queue = self.worker.queues[1 if mask == 1 else 0]
        self.worker.trace.emit('caller_body_candidate', ('caller',), record,
                               mask=mask, selected_queue=queue.name)
        accepted = queue.enqueue(record)
        self.sequence += 1
        self.worker.trace.emit('caller_temporaries_released', ('caller',), record,
                               accepted=accepted, failure_logged=not accepted,
                               ready_flag_cleared=True,
                               next_caller_sequence=self.sequence,
                               retry_in_this_function=False)
        return accepted


@dataclass(frozen=True)
class PublishObservation:
    return_code: int
    # External fixture annotations, NOT inferred from return_code.
    ack_observed: object = None
    possible_remote_accept: str = 'unknown'

    def __post_init__(self):
        if type(self.return_code) is not int:
            raise ValueError('return code must be an integer')
        if self.ack_observed is not None and type(self.ack_observed) is not bool:
            raise ValueError('ACK observation must be bool or unknown')
        if self.possible_remote_accept not in ('unknown', 'scenario_may_have_accepted', 'scenario_not_accepted'):
            raise ValueError('remote acceptance is only a labeled scenario assumption')


class Worker:
    """Selected worker branches after its other maintenance gates permit them.

    Preloaded core records are an external starting fixture: core admission and
    its producer are not simulated. No automatic connection, retry, sleep or I/O.
    """
    def __init__(self, trace=None, slots=JS_SLOT_COUNTS, core_records=()):
        if len(slots) != 3 or len(core_records) > 16:
            raise ValueError('model requires three JS queues and <=16 preloaded core records')
        self.trace = trace if trace is not None else Trace()
        self.queues = [Ring(name, n, self.trace) for name, n in zip(JS_NAMES, slots)]
        self.cursor = 0
        self.connected = False
        self.running = True
        self.core = list(core_records)
        self.trace.emit('worker_fixture_initialized', ('capacity',),
                        slots=list(slots), core_preloaded_ids=[r.record_id for r in self.core],
                        notes='Synthetic starting state; maintenance gates and core enqueue omitted')

    def connection_result(self, success):
        self.connected = bool(success)
        self.trace.emit('connection_fixture_result', ('failure',), success=self.connected,
                        notes='Injected outcome; elapsed time and real connection behavior not simulated')

    def clear_running_flag(self):
        self.running = False
        self.trace.emit('running_flag_cleared', ('worker_exit',),
                        notes='Flag operation only; not a full owner stop/destructor model')

    def _disconnect(self, record):
        self.connected = False
        self.trace.emit('connection_cleanup_head_retained', ('failure',), record,
                        requested_sleep_seconds=1, cursor=self.cursor,
                        queue_state=[q.snapshot() for q in self.queues])

    def step(self, observation=None, core_publish_ok=None, core_flush_ok=None):
        if not self.running:
            self.trace.emit('worker_returned_without_drain', ('worker_exit',),
                            queue_state=[q.snapshot() for q in self.queues])
            return 'stopped'
        if not self.connected:
            self.trace.emit('connection_required', ('failure',))
            return 'connection_required'
        if self.core:
            if type(core_publish_ok) is not bool or type(core_flush_ok) is not bool:
                raise ValueError('core branch requires explicit synthetic Publish and Flush outcomes')
            record = self.core[0]
            ok = core_publish_ok and core_flush_ok
            self.trace.emit('core_priority_attempt', ('core_priority',), record,
                            publish_return_ok=core_publish_ok,
                            flush_attempted=core_publish_ok,
                            flush_return_ok=core_flush_ok if core_publish_ok else None)
            if ok:
                self.core.pop(0)
                self.trace.emit('core_pop_restart_loop', ('core_priority',), record,
                                cursor=self.cursor)
            else:
                self._disconnect(record)
            return 'core_success' if ok else 'core_failure'
        selected = next(((self.cursor+i) % 3 for i in range(3)
                         if self.queues[(self.cursor+i) % 3].peek() is not None), None)
        if selected is None:
            self.trace.emit('no_js_head', ('round_robin',))
            return 'empty'
        if not isinstance(observation, PublishObservation):
            raise ValueError('JS branch requires an explicit publish observation')
        queue = self.queues[selected]
        record = queue.peek()
        self.trace.emit('js_publish_attempt', ('publish', 'observation_boundary'), record,
                        queue=queue.name, submitted_to_js_publish=True,
                        publish_return_code=observation.return_code,
                        publish_return_ok=observation.return_code == 0,
                        ack_observed=observation.ack_observed,
                        possible_remote_accept=observation.possible_remote_accept,
                        remote_acceptance_is_fixture_assumption=True,
                        cursor_before=self.cursor)
        if observation.return_code == 0:
            queue.pop_success()
            self.cursor = (selected + 1) % 3
            self.trace.emit('js_cursor_advanced', ('round_robin',), record,
                            cursor=self.cursor)
            return 'js_success'
        self._disconnect(record)
        return 'js_failure'
