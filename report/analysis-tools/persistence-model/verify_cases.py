#!/usr/bin/env python3
"""Hand-authored binary fixtures and expected edge cases, not device records."""
import copy
import hashlib
import json
from pathlib import Path
from state_file_model import load_state, overlay_prefix

ROOT = Path(__file__).resolve().parent
INITIAL = {'dirty': False,
           'left': {'expiry': 777, 'mode': 9, 'target': 22.0, 'extra_byte': 88, 'schedule': {'unchanged': True}},
           'right': {'expiry': 888, 'mode': 8, 'target': 23.0, 'extra_byte': 99, 'schedule': {'unchanged': True}}}
# Explicit byte order from serializer call sequence, no model encoder used.
SCHEDULE_L = '01 01 00 01 00 01 00 01 00000016 0000001e 00000000 00000e10 00000000'
SCHEDULE_R = '00 00 01 00 01 00 01 00 00000006 0000002d 0000000a 00001c20 000000c8'
V2 = bytes.fromhex('00000002 00000064 000000c8 00000001 00000000 00000a8c 00000bb8 00000064 00000032 ' + SCHEDULE_L + SCHEDULE_R)
V1 = bytes.fromhex('00000001 00000064 000000c8 00000a8c 00000bb8 ' + SCHEDULE_L + SCHEDULE_R)


def main():
    fixtures = ROOT / 'fixtures'
    fixtures.mkdir(exist_ok=True)
    (ROOT / 'initial_state.json').write_text(json.dumps(INITIAL, indent=2)+'\n')
    cases = {}

    def run(name, data, now=(100, 100)):
        result = load_state(data, INITIAL, now)
        if data is not None:
            (fixtures / (name+'.bin')).write_bytes(data)
        cases[name] = dict(input_hex=None if data is None else data.hex(),
                           input_sha256=None if data is None else hashlib.sha256(data).hexdigest(),
                           now_by_side=list(now), result=result)
        return result

    assert len(V1) == 76 and len(V2) == 92
    v2 = run('complete_v2', V2)
    assert v2['state']['left']['target'] == 27 and v2['state']['right']['target'] == 30
    assert v2['state']['right']['schedule']['minute'] == 45
    assert v2['state']['right']['mode'] == 0  # no expiry rewrite in v2 loader
    assert (v2['consumed'], v2['trailing']) == (92, 0)
    v1 = run('complete_v1', V1)
    assert [v1['state'][s]['mode'] for s in ('left', 'right')] == [0, 1]  # strict <
    assert v1['state']['left']['extra_byte'] == 88  # absent in v1, preserved
    failed = run('open_failed', None)
    assert failed['state'] == INITIAL and not failed['loaded_log']
    for name, data in [('empty', b''), ('unknown_version', bytes.fromhex('00000063')),
                       ('partial_version', V2[:3])]:
        result = run(name, data)
        expected = copy.deepcopy(INITIAL); expected['dirty'] = True
        assert result['state'] == expected and result['loaded_log']
    partial = run('partial_expiry_two_bytes', V2[:4]+bytes.fromhex('1234'))
    assert partial['state']['left']['expiry'] == 0x12340000
    assert partial['state']['right']['expiry'] == 0
    assert partial['state']['left']['schedule']['enabled'] is None
    header = run('only_v2_header', V2[:36])
    assert header['state']['left']['schedule']['days'] == [None]*7
    assert header['state']['left']['schedule']['hour'] == 0
    boolean = bytearray(V2); boolean[36] = 2; boolean[37] = 255
    noncanonical = run('noncanonical_boolean', bytes(boolean))
    assert noncanonical['state']['left']['schedule']['enabled'] is False
    assert noncanonical['state']['left']['schedule']['days'][0] is False
    bad = bytearray(V2); bad[20:24] = bytes.fromhex('deadffff');bad[28:32] = bytes.fromhex('00000123')
    malformed = run('low_halfword_and_low_byte', bytes(bad))
    assert abs(malformed['state']['left']['target'] - (-0.01)) < 1e-8
    assert malformed['state']['left']['extra_byte'] == 0x23
    trailing = run('extra_tail', V2+b'OLDTAIL')
    assert trailing['state'] == v2['state'] and trailing['trailing'] == 7
    newer = bytearray(V2);newer[4:8] = bytes.fromhex('0000012c');newer[24:28] = bytes.fromhex('00000fa0')
    mixed = run('new_prefix_old_tail', overlay_prefix(V2, bytes(newer), 8))
    assert mixed['state']['left']['expiry'] == 300
    assert mixed['state']['right']['target'] == 30  # attempted new value 40 not written
    assert mixed['loaded_log'] and mixed['trailing'] == 0
    # Every byte cut exercises field boundaries, EOF word fill, and unknown bools.
    prefix_summary = []
    for version, data in [(1, V1), (2, V2)]:
        for n in range(len(data)+1):
            result = load_state(data[:n], INITIAL, (100, 100))
            assert result['loaded_log'] and result['consumed'] <= n
            unknown = sum(t['status']=='unknown_stack_byte' for t in result['trace'])
            if n < 4: assert result['outcome'] == 'unknown_version'
            prefix_summary.append(dict(version=version, length=n, unknown_bools=unknown,
                                       zero_filled_words=sum(t['status']=='zero_padded_word' for t in result['trace'])))
    assert INITIAL['dirty'] is False
    output = dict(kind='synthetic-model-only', passed=True, named_cases=len(cases),
                  prefix_cases=len(prefix_summary), limitations=[
                      'No firmware execution, physical power loss, or device records',
                      'Missing bool uses null, not an assumed false or simulated stack value',
                      'No downstream schedule/thermostat/actuator simulation'],
                  cases=cases, prefix_summary=prefix_summary)
    (ROOT/'RESULTS.json').write_text(json.dumps(output, ensure_ascii=False, indent=2)+'\n')
    print(json.dumps({k:output[k] for k in ('passed','named_cases','prefix_cases')}))


if __name__ == '__main__':
    main()
