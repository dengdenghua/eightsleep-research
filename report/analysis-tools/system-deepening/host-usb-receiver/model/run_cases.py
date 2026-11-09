"""Finite synthetic cases; not actual device observations or global proof."""
import copy
import json
from pathlib import Path
from parser_model import Receiver, UnsafeCrcRead, crc16, escape, frame

OUT = Path(__file__).resolve().parent
CASES = []


def save(name, receiver, claim, inputs, **extra):
    record = dict(name=name, kind='synthetic_contract_case', passed=True, claim=claim,
                  inputs=[x.hex() for x in inputs], snapshot=receiver.snapshot(), **extra)
    trace = copy.deepcopy(receiver.events)
    (OUT/'traces'/f'{name}.jsonl').write_text(''.join(json.dumps(x, ensure_ascii=False)+'\n' for x in trace))
    record['trace'] = f'model/traces/{name}.jsonl'
    CASES.append(record)


def feed(*items):
    r = Receiver()
    for item in items:
        r.add(item)
    r.drain()
    return r


def main():
    (OUT/'traces').mkdir(exist_ok=True)
    good = b'\x3c\x01\x7d\x7e\x00\xff'
    wire = frame(good)
    r = feed(wire)
    assert r.accepted == [good]
    save('valid_escaped_frame', r, 'Canonical escapes and BE16 length/CRC accepted.', [wire])

    # Includes boundaries inside the length, body escape pair and CRC fields.
    for cut in range(1, len(wire)):
        r = Receiver(); r.add(wire[:cut]); r.add(b'')
        assert r.receive() is None
        r.add(wire[cut:]); r.drain()
        assert r.accepted == [good]
    save('all_single_split_positions', r,
         'Every split in this finite frame survives a no-data return; parser is retained.',
         [wire], tested_split_count=len(wire)-1)

    changed = bytes([good[0], good[1] ^ 1]) + good[2:]
    damaged = b'\x7e' + escape(len(good).to_bytes(2, 'big') + changed + crc16(good).to_bytes(2, 'big'))
    r = feed(damaged + wire)
    assert r.accepted == [good] and any(e['event']=='crc_mismatch' for e in r.events)
    save('changed_body_with_old_crc', r, 'This specific body mutation fails CRC, then the next frame is accepted.', [damaged, wire])

    truncated = frame(b'\x3cabcdefghij')[:-4]
    r = feed(truncated + wire)
    assert r.accepted == [good]
    save('truncated_then_delimiter', r, 'A new unescaped delimiter abandons the partial frame.', [truncated, wire])

    inserted = b'\x7e\x00\x10abc\x7exyz'
    r = feed(inserted + wire)
    assert r.accepted == [good]
    save('extra_unescaped_delimiter', r, 'An extra delimiter restarts length parsing; the next intact frame recovers.', [inserted, wire])

    swallowed = b'\x7d' + frame(b'\x3cAB') + wire
    r = feed(swallowed)
    assert r.accepted == [good]
    assert any(e['event']=='escaped_byte' and e['wire_byte']==0x7e for e in r.events)
    save('pending_escape_swallows_next_delimiter', r, 'Pending escape converts the first next delimiter to data 0x5e; a later delimiter recovers.', [swallowed])

    body = b'\x3c\x00Q'
    # Noncanonical 7d20 represents 00; sender would simply send 00.
    noncanonical = b'\x7e\x00\x03\x3c\x7d\x20Q' + escape(crc16(body).to_bytes(2,'big'))
    r = feed(noncanonical)
    assert r.accepted == [body]
    save('noncanonical_escape_accepted', r, 'Receiver XORs any escaped byte without a canonical-escape check.', [noncanonical])

    zero = frame(b'')
    r = feed(zero)
    assert r.state == 3 and r.count == 2 and r.accepted == []
    snapshot_before = r.snapshot()
    r.add(wire); r.drain()
    assert r.accepted == [good]
    save('zero_length_waits_for_next_delimiter', r, 'Length zero goes to body state; nominal CRC bytes are consumed as body until a new delimiter.', [zero, wire], before_recovery=snapshot_before)

    body = b'\x3c' + b'A'*2047
    r = feed(frame(body))
    assert r.accepted == [body]
    save('capacity_exactly_2048', r, 'Configured body capacity is usable at 2048 bytes.', [frame(body)])

    body = b'\x3c' + b'A'*2048
    oversized = frame(body)
    r = Receiver(); r.add(oversized)
    try:
        r.receive()
        raise AssertionError('Expected unsafe CRC range marker')
    except UnsafeCrcRead:
        pass
    assert r.count == 2049 and r.accepted == []
    save('declared_2049_crc_range_unknown', r, '2049 body tokens produce count 2049; CRC requests 2049 bytes from a 2048-byte configured body. Stop before simulating adjacent memory.', [oversized])

    too_large_header = b'\x7e\xff\xffabcdef'
    r = feed(too_large_header + wire)
    assert r.accepted == [good]
    save('large_length_interrupted_by_delimiter', r, 'This large declaration is abandoned before reaching CRC; it does not imply every large declaration causes an overread.', [too_large_header, wire])

    other = b'\x3cXYZ'
    r = feed(frame(other))
    assert r.accepted == [other]
    save('self_consistent_replacement_frame', r, 'An intact alternative frame with its own matching CRC is accepted; CRC acceptance does not establish freshness or origin.', [frame(other)])

    result = dict(kind='synthetic_only', cases=CASES, case_count=len(CASES), all_passed=True,
                  limits=['No target execution or actual USB timing.',
                          'No frequency estimates; finite cases are not collision/exhaustive proofs.',
                          'CRC beyond capacity is marked unknown, never calculated from invented adjacent RAM.',
                          'Downstream opcode payload validation and reconnection policy are not modeled.',
                          'Each trace is frozen before subsequent mutation.'])
    (OUT/'RESULTS.json').write_text(json.dumps(result,ensure_ascii=False,indent=2)+'\n')
    print(json.dumps(dict(case_count=len(CASES),all_passed=True)))


if __name__ == '__main__':
    main()
