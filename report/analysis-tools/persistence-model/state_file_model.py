#!/usr/bin/env python3
"""Bounded loadState model reconstructed from Frank; never executes firmware.

Regular-file EOF only: no I/O error injection, exceptions, concurrent mutation,
or subsequent thermostat/schedule execution. Unknown stack bytes stay unknown.
All temperatures emulate the explicit int16 -> float32 / 100 conversion.
"""
import argparse
import copy
import json
import struct
from pathlib import Path


def f32(value):
    return struct.unpack('<f', struct.pack('<f', value))[0]


class Reader:
    def __init__(self, data):
        self.data = data
        self.pos = 0
        self.trace = []

    def read(self, name, width, boolean=False):
        start = self.pos
        raw = self.data[start:start + width]
        self.pos += len(raw)
        if boolean:
            value = raw[0] == 1 if raw else None
        else:
            value = int.from_bytes(raw.ljust(4, b'\0'), 'big')
        self.trace.append(dict(field=name, offset=start, requested=width,
                               actual=len(raw), raw_hex=raw.hex(), value=value,
                               status='complete' if len(raw) == width else
                               'unknown_stack_byte' if boolean else 'zero_padded_word'))
        return value

    def word(self, name):
        return self.read(name, 4)

    def boolean(self, name):
        return self.read(name, 1, True)


def load_state(data, initial, now_by_side=(0, 0)):
    """data=None means fopen failed; initial is an explicit supplied state.

    No defaults are claimed for device boot. v1 now_by_side represents the
    separate time reads in expiry comparisons, masked to uint32 by the helper.
    v2 does not evaluate expiry while loading. Keys byte124/byte134 remain
    semantic-neutral because the loader merely writes their low bytes.
    """
    state = copy.deepcopy(initial)
    if data is None:
        return dict(state=state, version=None, loaded_log=False, trace=[],
                    outcome='open_failed', consumed=0, trailing=0)
    r = Reader(data)
    version = r.word('version')
    if version in (1, 2):
        for side in ('left', 'right'):
            state[side]['expiry'] = r.word(side + '.expiry')
        if version == 1:
            for side, now in zip(('left', 'right'), now_by_side):
                state[side]['mode'] = int((now & 0xffffffff) < state[side]['expiry'])
        else:
            for side in ('left', 'right'):
                state[side]['mode'] = r.word(side + '.mode')
        for side in ('left', 'right'):
            word = r.word(side + '.target100')
            signed = word & 0xffff
            if signed >= 0x8000:
                signed -= 0x10000
            state[side]['target'] = f32(f32(signed) / f32(100))
        if version == 2:
            for side in ('left', 'right'):
                state[side]['extra_byte'] = r.word(side + '.extra_byte') & 0xff
        for side in ('left', 'right'):
            prefix = side + '.schedule.'
            schedule = {'enabled': r.boolean(prefix + 'enabled')}
            schedule['days'] = [r.boolean(prefix + 'day' + str(i)) for i in range(7)]
            for field in ('hour', 'minute', 'second', 'duration', 'expiry'):
                schedule[field] = r.word(prefix + field)
            state[side]['schedule'] = schedule
    state['dirty'] = True
    return dict(state=state, version=version, loaded_log=True, trace=r.trace,
                outcome='recognized_version' if version in (1, 2) else 'unknown_version',
                consumed=r.pos, trailing=len(data)-r.pos)


def overlay_prefix(old, new, written):
    """Hypothetical r+ file image after exactly written prefix bytes, not a
    prediction of persistence after power loss or of failed fwrite behavior.
    """
    if not 0 <= written <= len(new):
        raise ValueError('written must lie within the new buffer')
    return new[:written] + old[written:]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('file', type=Path)
    parser.add_argument('--initial', type=Path, required=True)
    parser.add_argument('--now-left', type=int, default=0)
    parser.add_argument('--now-right', type=int, default=0)
    args = parser.parse_args()
    print(json.dumps(load_state(args.file.read_bytes(), json.loads(args.initial.read_text()),
                                (args.now_left, args.now_right)), ensure_ascii=False, indent=2))


if __name__ == '__main__':
    main()
