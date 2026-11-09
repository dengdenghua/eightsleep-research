#!/usr/bin/env python3
"""Read-only inspector for the seven observed TriMix containers. Never flashes."""
import argparse, hashlib, json, struct, zlib

def inspect(data):
    if len(data) < 136:
        raise ValueError('Need 128-byte container header plus reset vector')
    expected = struct.unpack_from('<I', data, 22)[0]
    actual = zlib.crc32(data[128:]) ^ 0xffffffff
    sp, reset = struct.unpack_from('<II', data, 128)
    return {'bytes': len(data), 'sha256':hashlib.sha256(data).hexdigest(),
            'payload_sha256':hashlib.sha256(data[128:]).hexdigest(),
            'header_bytes':128,'crc_offset':22,'crc_stored':f'{expected:08x}',
            'crc_computed':f'{actual:08x}','crc_matches':expected==actual,
            'initial_sp':f'0x{sp:08x}','reset_thumb':f'0x{reset:08x}',
            'candidate_payload_base':'0x08008000',
            'reset_within_payload': bool(reset&1) and 0x08008000 <= (reset&~1) < 0x08008000+len(data)-128,
            'scope':'container checksum and vectors only; not signature, compatibility or flash validation'}

if __name__=='__main__':
    parser=argparse.ArgumentParser();parser.add_argument('file');args=parser.parse_args()
    with open(args.file,'rb') as f: print(json.dumps(inspect(f.read()),ensure_ascii=False,indent=2))
