"""Synthetic stream contracts; not real sensor captures or vendor compression."""
from pathlib import Path
import hashlib,importlib.util,json,struct,unittest,zlib
ROOT=Path(__file__).resolve().parent
spec=importlib.util.spec_from_file_location('uploader_decoder',ROOT.parent/'decode_uploader.py')
d=importlib.util.module_from_spec(spec);spec.loader.exec_module(d)
def enc(v):
 if isinstance(v,dict):return head(5,len(v))+b''.join(enc(k)+enc(x) for k,x in v.items())
 if isinstance(v,str):b=v.encode();return head(3,len(b))+b
 if isinstance(v,bytes):return head(2,len(v))+v
 if type(v)==int and v>=0:return head(0,v)
 raise TypeError(v)
def head(m,n):
 if n<24:return bytes([(m<<5)|n])
 for size,tag in [(1,24),(2,25),(4,26),(8,27)]:
  if n<1<<(size*8):return bytes([(m<<5)|tag])+n.to_bytes(size,'big')
 raise ValueError(n)
def batch(i,payload):
 chunk=enc({'seq':i,'topic':'raw.x.sens.stealth','data':payload})
 return b'\xa4'+enc('proto')+enc('raw')+enc('part')+enc('batch')+enc('id')+enc(i)+enc('stream')+b'\x5f'+enc(chunk[:9])+enc(chunk[9:])+b'\xff'
def wire(parts,finish=False):
 c=zlib.compressobj(level=6,wbits=-15);pieces=[c.compress(p)+c.flush(zlib.Z_SYNC_FLUSH) for p in parts]
 if finish:pieces.append(c.flush(zlib.Z_FINISH))
 return b''.join(pieces)
class Contract(unittest.TestCase):
 def setUp(self):
  self.payload=enc({'synthetic_sample_bytes':struct.pack('<iii',-123,456,2147483647)})+enc({'synthetic_counter':17})
  self.parts=[batch(1,self.payload),batch(2,self.payload)]
  self.session=enc({'proto':'raw','part':'session','dev':'synthetic','specialization':'synthetic','version':'2','compression':'zlib'})
 def test_session_label_does_not_select_wrapper(self):
  result=d.decode(self.session+wire(self.parts,True),'session-stream')
  self.assertEqual(result['session']['compression'],'zlib');self.assertEqual(result['compression']['wrapper'],'raw')
 def test_exact_original_bytes_survive_nesting(self):
  result=d.decode(wire(self.parts,True),'compressed-batches','raw')
  self.assertEqual([b['chunks'][0]['data'] for b in result['batches']],[self.payload]*2)
 def test_raw_has_no_zlib_checksum(self):
  result=d.decode(wire(self.parts,True),'compressed-batches','raw');self.assertFalse(result['compression']['checksum_verified'])
 def test_forcing_zlib_rejects_raw(self):
  with self.assertRaises(d.DecodeError):d.decode(wire(self.parts,True),'compressed-batches','zlib')
 def test_sync_flush_is_not_stream_end(self):
  with self.assertRaises(d.DecodeError):d.decode(wire(self.parts),'compressed-batches','raw')
 def test_explicit_open_stream_accepts_complete_batches(self):
  result=d.decode(wire(self.parts),'compressed-batches','raw',True);self.assertEqual(len(result['batches']),2);self.assertFalse(result['compression']['end_marker_seen'])
 def test_allow_open_does_not_accept_partial_cbor(self):
  with self.assertRaises(d.DecodeError):d.decode(wire([self.parts[0],self.parts[1][:15]]),'compressed-batches','raw',True)
 def test_size_limit_still_applies(self):
  with self.assertRaises(d.DecodeError):d.decode(wire(self.parts),'compressed-batches','raw',True,16)
if __name__=='__main__':
 suite=unittest.defaultTestLoader.loadTestsFromTestCase(Contract);result=unittest.TextTestRunner(verbosity=2).run(suite)
 out={'result':'PASS' if result.wasSuccessful() else 'FAIL','tests':result.testsRun,'failures':len(result.failures),'errors':len(result.errors),'decoder_sha256':hashlib.sha256((ROOT.parent/'decode_uploader.py').read_bytes()).hexdigest(),'scope':'Python-generated CBOR and raw DEFLATE fixtures, not target compressor output or real device data.'}
 (ROOT/'DECODER_VALIDATION.json').write_text(json.dumps(out,indent=2)+'\n');raise SystemExit(0 if result.wasSuccessful() else 1)
