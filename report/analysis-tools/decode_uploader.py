#!/usr/bin/env python3
"""Offline Eight Sleep raw uploader decoder; reconstructed format, not a client.

Inputs must already be stripped of TLS and reassembled in ONE direction for ONE
connection. session-stream begins at the first client session CBOR byte; it does
not contain the server ACK. After the session object, remaining client bytes
are one persistent deflate stream. See DECODER_USAGE.txt for boundaries/limits.
No firmware execution, networking, keys, authentication, or server probing.
"""
import argparse
import hashlib
import importlib.util
import json
import struct
import sys
import zlib
from pathlib import Path


class DecodeError(ValueError):
    pass


class CBORReader:
    """Bounded subset needed by recovered envelopes; strict indefinite strings.

    Adapted from ../signal-host/host_signal_parser.py's CBORReader. Inner producer
    payload bytes are opaque unless the separate --decode-stealth option is used.
    """
    def __init__(self, data, max_nodes=1000000):
        self.data, self.pos, self.nodes = data, 0, 0
        self.max_nodes = max_nodes

    def take(self, n):
        if n < 0 or self.pos + n > len(self.data):
            raise DecodeError(f'truncated CBOR at offset {self.pos}; need {n} bytes')
        out = self.data[self.pos:self.pos+n]
        self.pos += n
        return out

    def read(self, depth=0):
        self.nodes += 1
        if depth > 64 or self.nodes > self.max_nodes:
            raise DecodeError('CBOR depth/node limit exceeded')
        initial = self.take(1)[0]
        major, ai = initial >> 5, initial & 31
        if ai < 24:
            n = ai
        elif ai in (24, 25, 26, 27):
            n = int.from_bytes(self.take(1 << (ai-24)), 'big')
        elif ai == 31:
            n = None
        else:
            raise DecodeError('reserved CBOR additional information')
        if major in (0, 1):
            if n is None:
                raise DecodeError('indefinite integer')
            return n if major == 0 else -1-n
        if major in (2, 3):
            if n is None:
                chunks = []
                while self.data[self.pos:self.pos+1] != b'\xff':
                    if self.pos >= len(self.data):
                        raise DecodeError('unterminated indefinite CBOR string')
                    header = self.data[self.pos]
                    if header >> 5 != major or header & 31 == 31:
                        raise DecodeError('indefinite string requires definite chunks of same type')
                    chunks.append(self.read(depth+1))
                self.take(1)
                return (b'' if major == 2 else '').join(chunks)
            raw = self.take(n)
            if major == 2:
                return raw
            try:
                return raw.decode('utf-8')
            except UnicodeDecodeError as exc:
                raise DecodeError(f'invalid CBOR UTF-8: {exc}') from exc
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
                    if type(key) not in (str, int, bytes):
                        raise DecodeError('unsupported CBOR map key')
                    if key in out:
                        raise DecodeError('duplicate CBOR map key')
                    out[key] = self.read(depth+1)
                count += 1
            return out
        if major == 7 and ai in (20, 21, 22):
            return {20: False, 21: True, 22: None}[ai]
        raise DecodeError(f'unsupported envelope CBOR item 0x{initial:02x}')


def sequence(data):
    reader = CBORReader(data)
    while reader.pos < len(data):
        start = reader.pos
        value = reader.read()
        yield start, reader.pos-start, value


def exact_fields(value, required, optional=()):
    if not isinstance(value, dict):
        raise DecodeError('expected CBOR map')
    keys = set(value)
    missing, extra = set(required)-keys, keys-set(required)-set(optional)
    if missing or extra:
        raise DecodeError(f'unrecognized map fields; missing={missing!r}, extra={extra!r}')


def uint(value, field):
    # bool is an int subclass in Python, but is not an integer on the CBOR wire.
    if type(value) is not int or not 0 <= value <= 0xffffffffffffffff:
        raise DecodeError(f'{field} must be an unsigned CBOR integer')


def check_session(value):
    exact_fields(value, ('proto', 'part', 'dev', 'specialization', 'version'), ('compression',))
    if value['proto'] != 'raw' or value['part'] != 'session' or value['version'] != '2':
        raise DecodeError('expected raw/session with text version "2"')
    if type(value['dev']) is not str or type(value['specialization']) is not str:
        raise DecodeError('session dev and specialization must be text')
    if 'compression' in value and value['compression'] != 'zlib':
        raise DecodeError('only recovered compression declaration "zlib" is supported')
    return value


def parse_batches(data):
    batches = []
    for start, length, value in sequence(data):
        exact_fields(value, ('proto', 'part', 'id', 'stream'))
        if value['proto'] != 'raw' or value['part'] != 'batch':
            raise DecodeError(f'expected raw/batch at decoded offset {start}')
        uint(value['id'], 'batch id')
        if type(value['stream']) is not bytes:
            raise DecodeError('batch stream must be a CBOR byte string')
        chunks = []
        for inner_start, inner_length, chunk in sequence(value['stream']):
            exact_fields(chunk, ('seq', 'topic', 'data'))
            uint(chunk['seq'], 'chunk seq')
            if type(chunk['topic']) is not str or not chunk['topic'].startswith('raw.'):
                raise DecodeError('chunk topic must be canonical raw.* text')
            if type(chunk['data']) is not bytes:
                raise DecodeError('chunk data must be a CBOR byte string')
            chunks.append({
                'offset_in_batch_stream': inner_start, 'encoded_length': inner_length,
                'seq': chunk['seq'], 'topic': chunk['topic'], 'data': chunk['data'],
                'data_length': len(chunk['data']),
                'data_sha256': hashlib.sha256(chunk['data']).hexdigest(),
            })
        batches.append({'decoded_offset': start, 'encoded_length': length,
                        'id': value['id'], 'stream_length': len(value['stream']),
                        'chunks': chunks})
    if not batches:
        raise DecodeError('no complete batches found')
    return batches


def inflate_batches(data, wrapper, allow_open_stream, max_decoded):
    """Try only the plausible zlib and raw-DEFLATE wrappers, schema validating each.

    One decompressobj covers the ENTIRE connection suffix, never one per batch.
    Reconnects/concatenated completed streams are deliberately not resynchronized.
    """
    candidates = ('zlib', 'raw') if wrapper == 'auto' else (wrapper,)
    successes, errors = [], {}
    for candidate in candidates:
        try:
            dec = zlib.decompressobj(15 if candidate == 'zlib' else -15)
            decoded = dec.decompress(data, max_decoded+1)
            if len(decoded) > max_decoded or dec.unconsumed_tail:
                raise DecodeError('decoded size limit exceeded')
            if dec.unused_data:
                raise DecodeError('trailing bytes after compressed stream; split reconnects explicitly')
            if not dec.eof and not allow_open_stream:
                raise DecodeError('compressed stream has no end marker; use --allow-open-stream only for a known complete capture boundary')
            batches = parse_batches(decoded)
            meta = {'wrapper': candidate, 'compressed_bytes': len(data),
                    'decoded_bytes': len(decoded), 'end_marker_seen': dec.eof,
                    'checksum_verified': candidate == 'zlib' and dec.eof}
            successes.append((batches, meta))
        except (DecodeError, zlib.error) as exc:
            errors[candidate] = str(exc)
    if len(successes) != 1:
        if successes:
            raise DecodeError('ambiguous wrapper; select --wrapper explicitly')
        raise DecodeError(f'no supported compressed batch stream: {errors}')
    return successes[0]


def parse_acks(data):
    acks = []
    for start, length, value in sequence(data):
        exact_fields(value, ('proto', 'part'), ('id',))
        if value['proto'] != 'raw' or value['part'] not in ('session', 'batch'):
            raise DecodeError('only recovered raw session/batch ACK forms are supported')
        if 'id' in value and value['id'] is not None:
            uint(value['id'], 'ACK id')
        if value['part'] == 'batch':
            uint(value.get('id'), 'batch ACK id')
        acks.append({'offset': start, 'encoded_length': length, **value})
    if not acks:
        raise DecodeError('no ACKs found')
    return acks


def decode(data, kind='batches', wrapper='auto', allow_open_stream=False,
           max_decoded=256*1024*1024):
    if kind not in ('batches', 'compressed-batches', 'session-stream', 'acks'):
        raise DecodeError('unsupported input kind')
    if wrapper not in ('auto', 'zlib', 'raw') or max_decoded <= 0:
        raise DecodeError('invalid wrapper or decoded size limit')
    result = {
        'format': 'eight-raw-uploader-offline-v1', 'input_kind': kind,
        'input_bytes': len(data), 'input_sha256': hashlib.sha256(data).hexdigest(),
        'validation': 'reconstructed static format; synthetic tests, no live capture validation',
        'warnings': [],
    }
    if kind == 'acks':
        if len(data) > max_decoded:
            raise DecodeError('decoded size limit exceeded')
        result['acks'] = parse_acks(data)
        result['warnings'].append('ACK ids are decoded, not correlated with a separate client capture.')
        return result
    offset, compressed = 0, kind == 'compressed-batches'
    if kind == 'session-stream':
        reader = CBORReader(data)
        result['session'] = check_session(reader.read())
        offset = reader.pos
        result['session_bytes'] = offset
        compressed = 'compression' in result['session']
        result['warnings'].append('Client-only stream: server session ACK/success is assumed from capture context, not present or verified here.')
    payload = data[offset:]
    if compressed:
        result['batches'], result['compression'] = inflate_batches(
            payload, wrapper, allow_open_stream, max_decoded)
        result['compression']['input_offset'] = offset
        if not result['compression']['end_marker_seen']:
            result['warnings'].append('Open deflate stream: CBOR is complete, but a valid capture cut cannot be distinguished from an omitted compressed suffix/checksum.')
    else:
        if len(payload) > max_decoded:
            raise DecodeError('decoded size limit exceeded')
        result['batches'] = parse_batches(payload)
        result['compression'] = None
    result['decoded_offset_space'] = 'uncompressed post-session CBOR bytes; not TLS/network offsets'
    return result


def interpret_stealth(result, parser_path=None, samples=False):
    """Load our neighboring offline parser, never a target firmware module."""
    path = Path(parser_path) if parser_path else Path(__file__).resolve().parent.parent / 'signal-host' / 'host_signal_parser.py'
    if not path.is_file():
        raise DecodeError(f'offline signal parser missing: {path}')
    spec = importlib.util.spec_from_file_location('offline_host_signal_parser', path)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    result['signal_parser'] = {'path': str(path.resolve()),
                              'sha256': hashlib.sha256(path.read_bytes()).hexdigest()}
    for batch in result.get('batches', []):
        for chunk in batch['chunks']:
            if chunk['topic'] == 'raw.x.sens.stealth':
                try:
                    chunk['stealth_records'] = module.parse_cbor(chunk['data'], samples)
                except (ValueError, TypeError, KeyError, IndexError, AttributeError, struct.error) as exc:
                    raise DecodeError(f'invalid stealth producer CBOR in batch {batch["id"]}, seq {chunk["seq"]}: {exc}') from exc
    return result


def json_default(value):
    if isinstance(value, bytes):
        return {'bytes_hex': value.hex(), 'length': len(value)}
    raise TypeError(type(value).__name__)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('input', help='local binary file, or - for stdin')
    parser.add_argument('--kind', choices=('batches', 'compressed-batches', 'session-stream', 'acks'), default='batches')
    parser.add_argument('--wrapper', choices=('auto', 'zlib', 'raw'), default='auto')
    parser.add_argument('--allow-open-stream', action='store_true')
    parser.add_argument('--max-input-bytes', type=int, default=128*1024*1024)
    parser.add_argument('--max-decoded-bytes', type=int, default=256*1024*1024)
    parser.add_argument('--decode-stealth', action='store_true')
    parser.add_argument('--samples', action='store_true', help='with --decode-stealth, include each signed sample instead of summaries')
    parser.add_argument('--signal-parser', type=Path, help='path to the companion host_signal_parser.py')
    parser.add_argument('--output', default='-', help='JSON output file, or - for stdout')
    args = parser.parse_args()
    try:
        if args.max_input_bytes <= 0 or args.max_decoded_bytes <= 0:
            raise DecodeError('size limits must be positive')
        if args.samples and not args.decode_stealth:
            raise DecodeError('--samples requires --decode-stealth')
        if args.input == '-':
            data = sys.stdin.buffer.read(args.max_input_bytes+1)
        else:
            if args.output != '-' and Path(args.input).resolve() == Path(args.output).resolve():
                raise DecodeError('input and output must differ')
            with open(args.input, 'rb') as stream:
                data = stream.read(args.max_input_bytes+1)
        if len(data) > args.max_input_bytes:
            raise DecodeError('input size limit exceeded')
        result = decode(data, args.kind, args.wrapper, args.allow_open_stream, args.max_decoded_bytes)
        if args.decode_stealth:
            interpret_stealth(result, args.signal_parser, args.samples)
        output = json.dumps(result, default=json_default, ensure_ascii=False, indent=2, allow_nan=False)+'\n'
        if args.output == '-':
            sys.stdout.write(output)
        else:
            Path(args.output).write_text(output, encoding='utf-8')
    except (OSError, ValueError) as exc:
        parser.exit(2, f'decode error: {exc}\n')


if __name__ == '__main__':
    main()
