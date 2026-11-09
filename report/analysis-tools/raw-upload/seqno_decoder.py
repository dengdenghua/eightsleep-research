#!/usr/bin/env python3
"""Decoder for the recovered SEQNO.RAW state file only, not waveform *.RAW."""
from pathlib import Path
import struct,json,argparse
U64=(1<<64)-1
def decode_seqno(data):
    if len(data)<16:raise ValueError('SEQNO.RAW requires two 8-byte fields; file is incomplete')
    seq,checkpoint=struct.unpack_from('<QQ',data)
    return {'kind':'sequencer_state_NOT_sensor_waveform','sequence':seq,'checkpoint':checkpoint,
            'next_initial_sequence':(seq+1)&U64,'trailing_bytes':len(data)-16,
            'evidence':'001f85b0 init/read/save;001f8260 checkpoint;0017bdd0 slots0/1'}
def boot_state(data):
    # Deterministic read-size path, excluding filesystem error injection.
    seq=((struct.unpack_from('<Q',data)[0]+1)&U64) if len(data)>=8 else 0
    checkpoint=struct.unpack_from('<Q',data,8)[0] if len(data)>=16 else 0
    return seq,checkpoint
def legacy_label(seq):
    return (f'{seq:08X}.RAW')[:12]  # snprintf buffer13 includes terminating NUL
def selftest():
    fixture=struct.pack('<QQ',0x123456789abcdef0,0x102030405060708)
    d=decode_seqno(fixture)
    assert d['sequence']==0x123456789abcdef0 and d['checkpoint']==0x102030405060708
    assert boot_state(fixture)==(0x123456789abcdef1,0x102030405060708)
    assert boot_state(b'')==(0,0)
    assert boot_state(struct.pack('<Q',41))==(42,0)
    assert boot_state(struct.pack('<QQ',U64,7))==(0,7)
    assert legacy_label(42)=='0000002A.RAW'
    assert legacy_label(0x100000000)=='100000000.RA'
    try:decode_seqno(bytes(15));raise AssertionError('short file accepted')
    except ValueError:pass
    O=Path(__file__).resolve().parent
    (O/'SEQNO_SYNTHETIC.bin').write_bytes(fixture)
    result={'kind':'synthetic_fixture_only_no_real_SEQNO_or_waveform_file','passed':True,'checks':8,
            'decoded_synthetic':d,'waveform_RAW_decoder_available':False}
    (O/'HOST_03_VALIDATION.json').write_text(json.dumps(result,ensure_ascii=False,indent=2)+'\n')
    return result
if __name__=='__main__':
    ap=argparse.ArgumentParser();ap.add_argument('file',nargs='?');ap.add_argument('--selftest',action='store_true');args=ap.parse_args()
    if args.selftest:result=selftest()
    elif args.file:
        p=Path(args.file)
        if p.name!='SEQNO.RAW':ap.error('Only SEQNO.RAW is supported; no recovered waveform .RAW layout')
        result=decode_seqno(p.read_bytes())
    else:ap.error('supply SEQNO.RAW or --selftest')
    print(json.dumps(result,ensure_ascii=False,indent=2))
