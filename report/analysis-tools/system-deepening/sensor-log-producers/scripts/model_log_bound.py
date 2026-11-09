#!/usr/bin/env python3
"""Finite worst-case escaped-byte accounting, not printf emulation or live reachability.
Allows arbitrary unknown suffix bytes, all escapable, and both CRC bytes escapable.
"""
import json,unittest
from pathlib import Path
O=Path(__file__).resolve().parent.parent

def ec(b):return sum(x in (125,126) for x in b)
def bound(n,w,prefix=4,tick_chars=2):
 assert 4+tick_chars+prefix<=n<=511 and w in (1,2,4)
 N=n+2;length=(N&((1<<(8*w))-1)).to_bytes(w,'big')
 known_plain=4+tick_chars+prefix
 e_body=(n-known_plain)+ec(bytes([7,n&255]))
 # Includes 1 unescaped marker, actual length bytes and their actual escaping,
 # body07/u8(log_len)/logtext, plus2 CRC raw bytes and at most2 CRC escapes.
 T=1+w+ec(length)+N+e_body+2+2
 return {'log_text_length':n,'body_length':N,'width':w,'length_hex':length.hex(),
  'length_escape_count':ec(length),'body_header_hex':bytes([7,n&255]).hex(),
  'body_header_escape_count':ec(bytes([7,n&255])),'known_plain_log_bytes':known_plain,
  'unknown_log_suffix_max_escapes':n-known_plain,'crc_raw_bytes':2,'crc_max_escapes':2,'frame_upper':T}

def capacity_trace(tick_digits=1,requested_suffix=100000):
 # 508-byte formatter region after fixed4-byte prefix. Each call writes at mostcap-1.
 first_len=tick_digits+1;first_cap=508;assert first_len<first_cap
 second_cap=508-first_len;second_written=min(requested_suffix,second_cap-1)
 nul_offset=4+first_len+second_written
 return {'first_written':first_len,'second_capacity':second_cap,'second_written':second_written,'nul_offset':nul_offset}
class Checks(unittest.TestCase):
 def test_capacity_all_u32_digits(self):
  for d in range(1,11):self.assertLessEqual(capacity_trace(d)['nul_offset'],511)
 def test_timestamp_min(self):self.assertEqual(len(str(0)+' '),2);self.assertEqual(len(str(2**32-1)+' '),11)
 def test_prefix_and_format_inventory(self):
  fs=json.loads((O/'FORMATS.json').read_text())['rows'];self.assertEqual(min(r['fixed_ascii_prefix_length'] for r in fs),4)
  self.assertTrue(all('n' not in r['conversions'] for r in fs))
 def test_actual_length_bytes(self):
  self.assertEqual(bound(123,2)['length_hex'],'007d');self.assertEqual(bound(123,2)['length_escape_count'],1)
  self.assertEqual(bound(125,2)['body_header_escape_count'],1)
  self.assertEqual(bound(511,2)['length_hex'],'0201')
 def test_all_lengths_and_widths(self):
  for w,expected in [(1,1020),(2,1021),(4,1023)]:
   rows=[bound(n,w) for n in range(10,512)];self.assertEqual(max(r['frame_upper'] for r in rows),expected)
   self.assertTrue(all(r['frame_upper']<1024 for r in rows))
 def test_more_tick_or_prefix_reduces_bound(self):
  for n in range(20,512):self.assertLessEqual(bound(n,4,5,3)['frame_upper'],bound(n,4)['frame_upper'])
 def test_conservative_suffix_example(self):
  # NOT a known real producer: just instantiate relaxed arbitrary suffix set.
  n=511;body=bytes([7,255])+b'FW: '+b'0 '+b'[ads'+b'\x7d'*(n-10)
  self.assertEqual(len(body),513)
  for w in (1,2,4):
   length=(len(body)&((1<<(8*w))-1)).to_bytes(w,'big');T=1+w+ec(length)+len(body)+ec(body)+4
   self.assertEqual(T,bound(n,w)['frame_upper'])
if __name__=='__main__':
 result=unittest.TextTestRunner(verbosity=2).run(unittest.defaultTestLoader.loadTestsFromTestCase(Checks));assert result.wasSuccessful()
 rows=[bound(n,w) for w in (1,2,4) for n in range(10,512)]
 (O/'BOUND_ENUMERATION.json').write_text(json.dumps(rows,indent=2)+'\n')
 maxima={str(w):max((r for r in rows if r['width']==w),key=lambda r:r['frame_upper']) for w in (1,2,4)}
 (O/'MODEL_RESULTS.json').write_text(json.dumps({'status':'PASS','test_count':result.testsRun,'finite_cases':len(rows),'maxima':maxima,
 'preconditions':['valid log formatter operation and original fixed FW prefix','uint32 tick decimal plus space','known format-set prefix>=4 ordinary bytes','no reentrant mutation of global log/frame buffers','no memory corruption or invalid printf argument reads'],
 'limit':'upper bound over relaxed contents, not an attainable log or measured frame; arbitrary suffix and worst CRC intentionally over-approximate reality'},ensure_ascii=False,indent=2)+'\n')
