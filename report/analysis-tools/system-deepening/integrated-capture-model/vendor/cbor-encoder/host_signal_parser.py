#!/usr/bin/env python3
"""Offline parser derived from MTK frankenfirmware SHA256 84727b57...c375.

lsp: captured UART/USB serial byte stream, including escaping, length and CRC.
usb: input is ONLY an already-extracted opcode 0x3c payload, not USB/LSP framing.
cbor: input is a concatenation of CBOR values, as in raw.x.sens.stealth.
No device communication. Validated against synthetic fixtures, not a live capture.
All values remain uncalibrated counts. Physical sensor placement is unknown.
"""
import argparse
import json
import struct
from pathlib import Path


def parse_usb(data, side=None):
    # FUN_0027e7b0: 8-byte header, N*64-byte ADC frames, 48-byte IMU.
    if len(data) < 120:
        raise ValueError('0x3c payload must contain at least one ADC frame (120 bytes)')
    tick, flags, frequency = struct.unpack_from('>IHH', data)
    if not frequency:
        raise ValueError('zero frequency, rejected by host')
    count, remainder = divmod(len(data) - 56, 64)
    if remainder:
        # Host floors count and may ignore residual bytes; reject ambiguity here.
        raise ValueError(f'non-canonical payload length: {remainder} trailing bytes')
    imu = struct.unpack_from('>24h', data, 8 + count * 64)
    imu_groups = [list(imu[i*6:i*6+6]) if flags & (1 << (12+i)) else None
                  for i in range(4)]
    samples = []
    for i in range(count):
        wire_adc = struct.unpack_from('>16i', data, 8 + i*64)
        adc = [v if flags & (1 << (8+j//8)) else None for j, v in enumerate(wire_adc)]
        samples.append({
            'device_tick_ms': (tick + i * (1000 // frequency)) & 0xffffffff,
            'adc': adc,
            'logger_routes': {
                'piezo-buzzer': adc[8:13],
                'legacy_ext_adc': adc[13],
                'piezo-multi-channel': adc[14:16],
            },
        })
    return {
        'kind': 'usb_opcode_0x3c_payload',
        'side_from_capture_context': side,
        'device_tick_ms': tick, 'flags': flags, 'flags_hex': f'0x{flags:04x}',
        'frequency_hz': frequency, 'sample_step_ms_integer': 1000 // frequency,
        'adc_frame_count': count,
        'imu_groups_wire_order': imu_groups,
        'samples': samples,
        'notes': [
            'Each payload belongs to one host-assigned side; the 16 ADC slots are not left/right halves.',
            'The same trailing IMU block is attached to every ADC frame in the packet.',
            'Wall time requires host reference-marker state and cannot be derived from this payload alone.',
            'Null groups have their enable flag clear; host stores its missing-data sentinel instead.',
            'legacy_ext_adc and piezo-multi-channel are emitted only when host all-types mode is enabled.',
        ],
    }


def lsp_crc(data):
    # FUN_001d9dc0. This is NOT the ADS SPI CRC (which has a different seed).
    value = 0x1d0f
    for byte in data:
        value ^= byte << 8
        for _ in range(8):
            value = ((value << 1) ^ (0x1021 if value & 0x8000 else 0)) & 0xffff
    return value


def parse_lsp(data, length_bytes=2, side=None):
    if length_bytes not in (1, 2):
        raise ValueError('LSP length field must be 1 or 2 bytes')
    frames, buffer, escaped, start = [], None, False, None
    for offset, byte in enumerate(data):
        if buffer is None:
            if byte == 0x7e:
                buffer, escaped, start = bytearray(), False, offset
            continue
        if escaped:
            byte ^= 0x20
            escaped = False
        elif byte == 0x7d:
            escaped = True
            continue
        elif byte == 0x7e:
            if buffer:
                raise ValueError(f'LSP frame at {start} interrupted by a new marker at {offset}')
            start = offset
            continue
        buffer.append(byte)
        if len(buffer) < length_bytes:
            continue
        size = int.from_bytes(buffer[:length_bytes], 'big')
        if not 1 <= size <= 0x800:
            raise ValueError(f'LSP body length {size} out of supported host range at {start}')
        if len(buffer) < length_bytes + size + 2:
            continue
        body = bytes(buffer[length_bytes:length_bytes+size])
        expected = int.from_bytes(buffer[-2:], 'big')
        actual = lsp_crc(body)
        if expected != actual:
            raise ValueError(f'LSP CRC mismatch at {start}: wire {expected:04x}, computed {actual:04x}')
        record = {'offset': start, 'wire_length': offset-start+1, 'body_length': size,
                  'opcode': body[0] & 0x7f, 'opcode_hex': f'0x{body[0]&0x7f:02x}',
                  'header_bit_7': bool(body[0] & 0x80), 'crc16': f'0x{actual:04x}',
                  'side_from_capture_context': side}
        if record['opcode'] == 0x3c:
            record['stealth'] = parse_usb(body[1:], side)
        else:
            record['payload_hex'] = body[1:].hex()
        frames.append(record)
        buffer, escaped = None, False
    if buffer is not None and (buffer or escaped):
        raise ValueError(f'truncated LSP frame at {start}')
    return frames


class CBORReader:
    """Small bounded CBOR reader; supports definite/indefinite containers used here."""
    def __init__(self, data):
        self.data, self.pos, self.nodes = data, 0, 0

    def take(self, n):
        if n < 0 or self.pos + n > len(self.data):
            raise ValueError(f'truncated CBOR at offset {self.pos}')
        out = self.data[self.pos:self.pos+n]
        self.pos += n
        return out

    def read(self, depth=0):
        self.nodes += 1
        if depth > 64 or self.nodes > 1000000:
            raise ValueError('CBOR resource limit exceeded')
        initial = self.take(1)[0]
        major, ai = initial >> 5, initial & 31
        if ai < 24:
            n = ai
        elif ai in (24, 25, 26, 27):
            n = int.from_bytes(self.take(1 << (ai-24)), 'big')
        elif ai == 31:
            n = None
        else:
            raise ValueError('reserved CBOR additional information')
        if major in (0, 1):
            if n is None:
                raise ValueError('indefinite integer')
            return n if major == 0 else -1-n
        if major in (2, 3):
            if n is None:
                chunks = []
                while self.data[self.pos:self.pos+1] != b'\xff':
                    chunks.append(self.read(depth+1))
                self.take(1)
                typ = bytes if major == 2 else str
                if not all(isinstance(c, typ) for c in chunks):
                    raise ValueError('invalid indefinite string chunk')
                return (b'' if major == 2 else '').join(chunks)
            value = self.take(n)
            return value if major == 2 else value.decode('utf-8')
        if major in (4, 5):
            out = [] if major == 4 else {}
            count = 0
            while n is None or count < n:
                if n is None and self.data[self.pos:self.pos+1] == b'\xff':
                    self.take(1)
                    break
                key = self.read(depth+1)
                if major == 4:
                    out.append(key)
                else:
                    if not isinstance(key, (str, int, bytes)):
                        raise ValueError('unsupported CBOR map key')
                    if key in out:
                        raise ValueError('duplicate CBOR map key')
                    out[key] = self.read(depth+1)
                count += 1
            return out
        if major == 6:
            return {'cbor_tag': n, 'value': self.read(depth+1)}
        if major == 7:
            if ai in (20, 21):
                return ai == 21
            if ai in (22, 23):
                return None
            if ai in (25, 26, 27):
                width, fmt = {25: (2, '>e'), 26: (4, '>f'), 27: (8, '>d')}[ai]
                return struct.unpack(fmt, n.to_bytes(width, 'big'))[0]
        raise ValueError(f'unsupported CBOR item 0x{initial:02x}')


def unpack_samples(blob, bits, samples):
    if not isinstance(blob, bytes) or len(blob) % (bits//8):
        raise ValueError('invalid sample byte string length')
    values = list(struct.unpack('<' + ('i' if bits == 32 else 'h') * (len(blob)//(bits//8)), blob))
    sentinel = (1 << (bits-1))-1
    if samples:
        return [None if v == sentinel else v for v in values]
    valid = [v for v in values if v != sentinel]
    return {'encoding': f'int{bits} little-endian', 'count': len(values),
            'missing_sentinel_count': len(values)-len(valid),
            'min': min(valid) if valid else None, 'max': max(valid) if valid else None}


def describe_record(record, samples=False):
    if not isinstance(record, dict):
        return record
    kind = record.get('type')
    if kind in ('piezo-buzzer', 'piezo-multi-channel'):
        for side in ('left', 'right'):
            if side in record and 'data' in record[side]:
                record[side]['data'] = [unpack_samples(b, 32, samples) for b in record[side]['data']]
    elif kind == 'imu-multi-channel':
        for side in ('left', 'right'):
            for group in record.get(side, []):
                for axes in group.values():
                    for axis, blob in axes.items():
                        axes[axis] = unpack_samples(blob, 16, samples)
    return record


def parse_cbor(data, samples=False):
    reader = CBORReader(data)
    out = []
    while reader.pos < len(data):
        start = reader.pos
        value = reader.read()
        out.append({'offset': start, 'length': reader.pos-start,
                    'record': describe_record(value, samples)})
    return out


def json_default(value):
    if isinstance(value, bytes):
        return {'bytes_hex': value.hex(), 'length': len(value)}
    raise TypeError(type(value).__name__)


def self_test():
    tick, flags, hz = 0x10203040, 0xf300, 500
    adc = [-8000000, -1, 0, 1] + list(range(4, 16))
    payload = struct.pack('>IHH16i24h', tick, flags, hz, *adc, *range(-12, 12))
    parsed = parse_usb(payload)
    assert parsed['samples'][0]['adc'] == adc
    assert parsed['samples'][0]['logger_routes']['piezo-buzzer'] == [8, 9, 10, 11, 12]
    assert parsed['imu_groups_wire_order'][0] == [-12, -11, -10, -9, -8, -7]
    disabled = bytearray(payload)
    disabled[4:6] = b'\x02\x00'
    parsed = parse_usb(disabled)
    assert parsed['samples'][0]['adc'][:8] == [None]*8
    assert parsed['imu_groups_wire_order'] == [None]*4
    # CBOR indefinite map followed immediately by a definite map.
    sequence = bytes.fromhex('bf64667265711901f4646461746148ffffffffffffff7fffa162747301')
    reader = CBORReader(sequence)
    first, second = reader.read(), reader.read()
    assert first['freq'] == 500 and second == {'ts': 1} and reader.pos == len(sequence)
    assert unpack_samples(first['data'], 32, True) == [-1, None]
    assert unpack_samples(struct.pack('<hh', -1000, 32767), 16, True) == [-1000, None]
    # Independent CRC known input; escape both control values in a real 0x3c payload.
    assert lsp_crc(b'123456789') == 0xe5cc
    def wire(body, width=2):
        unescaped = len(body).to_bytes(width, 'big') + body + lsp_crc(body).to_bytes(2, 'big')
        return b'\x7e' + b''.join(bytes([0x7d, b ^ 0x20]) if b in (0x7d, 0x7e) else bytes([b]) for b in unescaped)
    escaped_payload = bytearray(payload)
    escaped_payload[0:4] = b'\x7e\x7d\x12\x34'
    stream = wire(b'\xbc' + escaped_payload) + wire(b'\x02\x7d\x7e')
    frames = parse_lsp(stream, side='left')
    assert len(frames) == 2 and frames[0]['header_bit_7']
    assert frames[0]['stealth']['device_tick_ms'] == 0x7e7d1234
    assert frames[1]['payload_hex'] == '7d7e'
    five_payload = (struct.pack('>IHH', tick, flags, hz)
                    + b''.join(struct.pack('>16i', *[v+i*100 for v in adc]) for i in range(5))
                    + struct.pack('>24h', *range(-12, 12)))
    assert len(five_payload) == 376
    five_frames = parse_lsp(wire(b'\xbc' + five_payload), side='right')
    assert five_frames[0]['body_length'] == 377
    assert [s['device_tick_ms'] for s in five_frames[0]['stealth']['samples']] == [tick+i*2 for i in range(5)]
    assert five_frames[0]['stealth']['samples'][4]['adc'][8] == 408
    assert parse_lsp(wire(b'\x02\x01', 1), 1)[0]['opcode'] == 2
    corrupted = bytearray(wire(b'\x02\x01'))
    corrupted[-1] ^= 1
    for invalid in (corrupted, stream[:-1]):
        try:
            parse_lsp(invalid)
        except ValueError:
            pass
        else:
            raise AssertionError('invalid LSP frame accepted')
    # A small synthetic left/right CBOR object verifies side separation, without
    # pretending to reproduce host scheduling or its entire sync algorithm.
    def cbor(value):
        def head(major, n):
            return bytes([major << 5 | n]) if n < 24 else bytes([major << 5 | 24, n])
        if isinstance(value, str):
            b = value.encode(); return head(3, len(b)) + b
        if isinstance(value, bytes):
            return head(2, len(value)) + value
        if isinstance(value, int):
            return head(0, value)
        if isinstance(value, list):
            return head(4, len(value)) + b''.join(cbor(v) for v in value)
        if isinstance(value, dict):
            return head(5, len(value)) + b''.join(cbor(k)+cbor(v) for k,v in value.items())
        raise TypeError(type(value))
    fixture = {'type': 'piezo-buzzer',
               'left': {'data': [struct.pack('<ii', 10, 0x7fffffff)]},
               'right': {'data': [struct.pack('<ii', -20, 21)]}}
    result = parse_cbor(cbor(fixture), samples=True)[0]['record']
    assert result['left']['data'][0] == [10, None]
    assert result['right']['data'][0] == [-20, 21]
    for invalid in (b'', payload[:-1], payload[:6]+b'\0\0'+payload[8:]):
        try:
            parse_usb(invalid)
        except ValueError:
            pass
        else:
            raise AssertionError('invalid payload accepted')
    print('12 checks passed: wire endian, ADC routing, enable flags, CBOR sequence, blob endian/sentinels, malformed payloads, LSP CRC vector, escaping/multiple frames, 5-frame 376-byte payload, 1-byte length, corrupt/truncated frames, left/right CBOR separation')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('format', nargs='?', choices=('usb', 'lsp', 'cbor'))
    parser.add_argument('input', nargs='?', type=Path)
    parser.add_argument('--samples', action='store_true', help='expand CBOR sample blobs to JSON arrays')
    parser.add_argument('--length-bytes', type=int, choices=(1, 2), default=2,
                        help='LSP length width: 2 for running high-speed firmware, 1 for bootloader')
    parser.add_argument('--side', choices=('left', 'right'),
                        help='side known from capture context; never inferred from packet contents')
    parser.add_argument('--self-test', action='store_true')
    args = parser.parse_args()
    if args.self_test:
        self_test()
        return
    if not args.format or not args.input:
        parser.error('format and input are required')
    if args.input.stat().st_size > 16*1024*1024:
        parser.error('input limit is 16 MiB; split larger CBOR streams first')
    data = args.input.read_bytes()
    try:
        if args.format == 'usb':
            result = parse_usb(data, args.side)
        elif args.format == 'lsp':
            result = parse_lsp(data, args.length_bytes, args.side)
        else:
            result = parse_cbor(data, args.samples)
    except (ValueError, UnicodeDecodeError, IndexError, struct.error) as error:
        parser.error(str(error))
    print(json.dumps(result, indent=2, ensure_ascii=False, default=json_default))


if __name__ == '__main__':
    main()
