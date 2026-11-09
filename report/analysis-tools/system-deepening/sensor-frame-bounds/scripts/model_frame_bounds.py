#!/usr/bin/env python3
"""Offline behavioral model. No firmware/device execution, CRC implementation or USB timing.
The two trailer bytes are synthetic fixture inputs, not claims about hardware CRC results.
"""
from pathlib import Path
import hashlib
import json
import unittest

OUT = Path(__file__).resolve().parent.parent

def escaped(data):
    out=bytearray()
    for x in data:
        out.extend((0x7d,x^0x20) if x in (0x7d,0x7e) else (x,))
    return bytes(out)

def loose_bound(n,w=4): return 1+2*(w+n+2)

class Framer:
    """Chosen slot exists and no reentrant mutation. Callback does not replace its pointer.
    retaining callback represents a pointer-owning send/queue; drop does not hold a pointer.
    No completion timing is simulated. Every actual write stays in offsets 0..1023.
    """
    def __init__(self,retains=True):
        self.slot=bytearray(1024);self.index=0;self.retains=retains
        self.submits=[];self.writes=[];self.trace=[];self.stream=bytearray()
    def flush(self):
        if not self.index:return
        n=self.index
        self.submits.append({'length':n,'snapshot':bytes(self.slot[:n]),'held':self.slot if self.retains else None})
        self.trace.append({'op':'submit','length':n,'slot':'same_slot','retained':self.retains})
        self.index=0
    def check(self):
        if self.index>=1024:self.flush()
    def byte(self,x):
        self.check();assert 0<=self.index<1024
        if self.submits:self.trace.append({'op':'post_submit_write','offset':self.index,'value':x,'slot':'same_slot'})
        self.slot[self.index]=x;self.writes.append(self.index);self.stream.append(x);self.index+=1
    def encode(self,src):
        for x in escaped(src):self.byte(x)
        self.check()
    def frame(self,body,w=2,trailer=b'\0\0'):
        assert w in (1,2,4) and len(trailer)==2
        self.byte(0x7e)
        self.encode((len(body)&((1<<(8*w))-1)).to_bytes(w,'big'))
        self.encode(body);self.encode(trailer);self.flush()
        return self
    def result(self):
        return {'encoded_size':len(self.stream),'submission_lengths':[x['length'] for x in self.submits],
                'post_submit_writes':sum(x['op']=='post_submit_write' for x in self.trace),
                'maximum_write_offset':max(self.writes,default=None),
                'retained_first_chunk_changed':bool(self.submits and self.submits[0]['held'] is not None and
                   self.submits[0]['snapshot']!=bytes(self.submits[0]['held'][:self.submits[0]['length']])),
                'stream_sha256':hashlib.sha256(self.stream).hexdigest()}

class Checks(unittest.TestCase):
    def test_escape_values(self):self.assertEqual(escaped(bytes([0x00,0x7d,0x7e,0xff])),bytes([0,0x7d,0x5d,0x7d,0x5e,255]))
    def test_raw_bound(self):
        for w in (1,2,4):
            f=Framer().frame(b'\x7d'*377,w,b'\x7d\x7e')
            self.assertLessEqual(len(f.stream),loose_bound(377,w));self.assertEqual(len(f.submits),1)
        self.assertEqual(loose_bound(377),767)
    def test_1023(self):
        f=Framer().frame(b'\x7d'*509)
        self.assertEqual(len(f.stream),1023);self.assertEqual([x['length'] for x in f.submits],[1023])
        self.assertFalse(f.result()['retained_first_chunk_changed'])
    def test_exact1024_has_no_later_write(self):
        f=Framer().frame(b'\x7d'*509+b'A')
        self.assertEqual(len(f.stream),1024);self.assertEqual([x['length'] for x in f.submits],[1024])
        self.assertEqual(f.result()['post_submit_writes'],0)
    def test_1025_reuses_pointer(self):
        f=Framer().frame(b'\x7d'*510)
        self.assertEqual(len(f.stream),1025);self.assertEqual([x['length'] for x in f.submits],[1024,1])
        self.assertEqual(f.result()['post_submit_writes'],1);self.assertTrue(f.result()['retained_first_chunk_changed'])
    def test_escape_pair_crosses_chunk(self):
        f=Framer().frame(b'\x7d'*511)
        self.assertEqual(f.submits[0]['snapshot'][-1],0x7d)
        self.assertEqual(f.submits[1]['snapshot'][0],0x5d)
    def test_drop_still_reuses_but_no_held_pointer(self):
        f=Framer(False).frame(b'\x7d'*510)
        self.assertEqual(f.result()['post_submit_writes'],1);self.assertFalse(f.result()['retained_first_chunk_changed'])
    def test_no_write_at1024_in_model(self):
        f=Framer().frame(b'\x7e'*10000)
        self.assertEqual(max(f.writes),1023)
    def test_width_fallback(self):
        for n in (3,4,5,19,20,21,25,36,130,176,216,377):
            for w in (1,2,4):self.assertLess(loose_bound(n,w),1024)
    def test_formula_and_trailer_fixture(self):
        for w in (1,2,4):
            for n in (0,125,126,377,509,510,512,514):
                body=b'\x7d'*n;trailer=b'\x7e\x00';length=(n&((1<<(8*w))-1)).to_bytes(w,'big')
                expect=1+w+n+2+sum(x in (0x7d,0x7e) for x in length+body+trailer)
                self.assertEqual(len(Framer().frame(body,w,trailer).stream),expect)

if __name__=='__main__':
    result=unittest.TextTestRunner(verbosity=2).run(unittest.defaultTestLoader.loadTestsFromTestCase(Checks))
    assert result.wasSuccessful()
    cases={name:Framer(retain).frame(body,2,trailer).result() for name,body,trailer,retain in [
      ('synthetic_total1023',b'\x7d'*509,b'\0\0',True),
      ('synthetic_total1024',b'\x7d'*509+b'A',b'\0\0',True),
      ('synthetic_total1025_held_pointer',b'\x7d'*510,b'\0\0',True),
      ('synthetic_escape_pair_split',b'\x7d'*511,b'\0\0',True),
      ('synthetic_total1025_dropped',b'\x7d'*510,b'\0\0',False),
      ('raw_length377_all_escape_upper_fixture',b'\x7d'*377,b'\x7d\x7e',True)]}
    (OUT/'MODEL_RESULTS.json').write_text(json.dumps({'status':'PASS','test_count':result.testsRun,
      'scope':'synthetic model only; no actual producer reachability, real CRC values, USB traffic or timing',
      'model_preconditions':['one selected slot','initial index zero','no reentrant global changes','callback returns without pointer replacement'],
      'cases':cases},ensure_ascii=False,indent=2)+'\n')
