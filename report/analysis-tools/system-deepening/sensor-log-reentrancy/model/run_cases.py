#!/usr/bin/env python3
"""Bounded nested logger schedules, using original format bytes and copied LSP model.
No firmware/printf/USB execution. One foreground call and one normally returning IRQ log.
"""
import hashlib,json,sys,unittest
from pathlib import Path
sys.path.insert(0,str(Path(__file__).resolve().parent/'vendor'))
from parser_model import Receiver,crc16,frame
O=Path(__file__).resolve().parents[1];R=O.parents[2]
I=json.loads((O/'INPUTS.json').read_text());B=(R/I['source']).read_bytes();assert hashlib.sha256(B).hexdigest()==I['sha256']
def string(va):
 off=va-0x8010000;end=B.index(b'\0',off);return B[off:end]
OUTER=string(0x0802ef89);INNER=string(0x0803016f)
assert OUTER==b'[sampling] attempting gain and sync' and INNER==b'[sampling] overflow'
TICK=1000

def digest(b):return hashlib.sha256(b).hexdigest()
def jwrite(p,x):p.write_text(json.dumps(x,ensure_ascii=False,indent=2)+'\n')
class Logger:
 def __init__(self,case):
  self.case=case;self.text=bytearray(512);self.text[:4]=b'FW: ';self.body=bytearray(514)
  self.text_origin=['startup']*512;self.body_origin=['startup']*514;self.events=[];self.outputs=[];self.locals=[]
 def event(self,kind,**kw):self.events.append(dict(event=kind,**kw))
 def put(self,target,offset,raw,owner,why):
  arr=self.text if target=='text' else self.body;orig=self.text_origin if target=='text' else self.body_origin
  arr[offset:offset+len(raw)]=raw;orig[offset:offset+len(raw)]=[owner+':'+why]*len(raw)
  self.event('write',target=target,ram=hex((0x200002e6 if target=='text' else 0x20001221)+offset),offset=offset,hex=bytes(raw).hex(),owner=owner,why=why)
 def nested(self):
  self.event('interrupt_enter',source='sampling_callback_080233f4',callsite='08023460',condition='ADC push returns0')
  self.log(INNER,'inner')
  self.event('interrupt_return',precondition='ordinary exception return preserves foreground register/stack locals')
 def log(self,fmt,owner):
  tick=(str(TICK)+' ').encode();t=len(tick)
  self.put('text',4,tick+b'\0',owner,'timestamp_snprintf')
  # Both selected formats are fixed literals, no conversion; their output bytes are exact.
  out=fmt[:508-t-1];self.event('format_begin',owner=owner,timestamp_return=t,format_return=len(fmt),format_size=508-t)
  for k,byte in enumerate(out):
   if owner=='outer' and self.case=='during_literal_copy' and k==16:self.nested()
   self.put('text',4+t+k,bytes([byte]),owner,'literal_copy')
  self.put('text',4+t+len(out),b'\0',owner,'vsnprintf_terminator')
  if owner=='outer' and self.case=='before_strnlen':self.nested()
  n=self.text.find(0,0,512);n=512 if n<0 else n
  loc={'owner':owner,'timestamp_return':t,'format_return':len(fmt),'strnlen_return':n,'copy_count':n,'framer_body_length':n+2}
  self.locals.append(loc);self.event('strnlen_return',**loc)
  if owner=='outer' and self.case=='after_strnlen':self.nested()
  self.put('body',0,bytes([7,n&255]),owner,'body_header')
  for k in range(n):
   if owner=='outer' and self.case=='during_body_copy' and k==8:self.nested()
   self.put('body',k+2,bytes([self.text[k]]),owner,'text_to_body')
  raw=bytes(self.body[:n+2]);orig=list(self.body_origin[:n+2]);wire=frame(raw)
  record={'owner':owner,'body':raw,'wire':wire,'body_origins':orig,'locals':loc}
  self.outputs.append(record);self.event('body_candidate',owner=owner,length=len(raw),header_log_length=raw[1],body_sha256=digest(raw),crc16=hex(crc16(raw)))
 def run(self):
  self.log(OUTER,'outer');rx=Receiver()
  # Selected candidate frames are injected intact; this does not model USB transmission.
  for row in self.outputs:
   wire=row['wire'];rx.add(wire[:3]);rx.add(wire[3:]);rx.drain()
  assert rx.accepted==[row['body'] for row in self.outputs]
  outer=next(r for r in self.outputs if r['owner']=='outer');raw=outer['body'];payload=raw[2:]
  return {'case':self.case,'outputs':self.outputs,'events':self.events,'locals':self.locals,'final_text_hex':self.text.hex(),'receiver_snapshot':rx.snapshot(),
   'summary':{'outer_body_length':len(raw),'outer_header_log_length':raw[1],'outer_strnlen_return':outer['locals']['strnlen_return'],
      'outer_text_cstring':payload.split(b'\0',1)[0].decode('ascii'),'outer_payload_hex':payload.hex(),
      'embedded_nul_offset':payload.find(b'\0'),'header_matches_body_text_count':raw[1]==len(payload),
      'outer_matches_expected_original':payload==b'FW: 1000 '+OUTER,'candidate_frame_crc_accepted':[True]*len(rx.accepted),
      'boundary':'LSP CRC accepted in copied model, business log parser/USB/NATS/cloud outcomes unknown'}}

CASES=['baseline','during_literal_copy','before_strnlen','after_strnlen','during_body_copy']
RESULTS={case:Logger(case).run() for case in CASES}
class Checks(unittest.TestCase):
 def test_original_formats_and_baseline(self):
  r=RESULTS['baseline'];self.assertTrue(r['summary']['outer_matches_expected_original']);self.assertEqual(len(r['outputs']),1)
 def test_literal_copy_hybrid(self):
  text=RESULTS['during_literal_copy']['outputs'][-1]['body'][2:]
  self.assertEqual(text,b'FW: 1000 '+INNER[:16]+OUTER[16:]);self.assertNotIn(b'\0',text)
 def test_before_strnlen_duplicates_inner(self):
  r=RESULTS['before_strnlen'];self.assertEqual(r['outputs'][0]['body'],r['outputs'][1]['body'])
 def test_stale_strnlen_copies_nul_and_tail(self):
  expected_outer=b'FW: 1000 '+OUTER;inner=b'FW: 1000 '+INNER
  r=RESULTS['after_strnlen'];self.assertEqual(r['outputs'][-1]['body'][2:],inner+b'\0'+expected_outer[len(inner)+1:])
  self.assertEqual(r['summary']['outer_strnlen_return'],len(expected_outer));self.assertTrue(r['summary']['header_matches_body_text_count'])
 def test_copy_interrupt_overwrites_header(self):
  a=RESULTS['after_strnlen']['outputs'][-1]['body'];b=RESULTS['during_body_copy']['outputs'][-1]['body']
  self.assertEqual(a[2:],b[2:]);self.assertNotEqual(a[1],b[1]);self.assertFalse(RESULTS['during_body_copy']['summary']['header_matches_body_text_count'])
 def test_formatter_count_not_replaced_by_irq(self):
  for case in CASES:
   r=RESULTS[case];loc=next(x for x in r['locals'] if x['owner']=='outer');self.assertEqual(loc['format_return'],len(OUTER));self.assertEqual(loc['timestamp_return'],5)
 def test_crc_known_vector(self):self.assertEqual(crc16(b'123456789'),0xe5cc)
 def test_all_generated_frames_are_small_and_crc_consistent(self):
  for r in RESULTS.values():
   self.assertTrue(all(len(x['wire'])<1024 for x in r['outputs']));self.assertTrue(all(r['summary']['candidate_frame_crc_accepted']))
if __name__=='__main__':
 tests=unittest.TextTestRunner(verbosity=2).run(unittest.defaultTestLoader.loadTestsFromTestCase(Checks));assert tests.wasSuccessful()
 out=O/'model/results';out.mkdir(exist_ok=True)
 for case,r in RESULTS.items():
  d=out/case;d.mkdir(exist_ok=True)
  for k,row in enumerate(r['outputs']):
   (d/f'{k}_{row["owner"]}.body.bin').write_bytes(row['body']);(d/f'{k}_{row["owner"]}.lsp.bin').write_bytes(row['wire'])
  (d/'trace.jsonl').write_text(''.join(json.dumps(x,ensure_ascii=False)+'\n' for x in r['events']))
  jwrite(d/'RESULT.json',{k:v for k,v in r.items() if k not in ('outputs','events')})
 jwrite(O/'MODEL_RESULTS.json',{'status':'PASS','tests':tests.testsRun,'case_count':len(CASES),'cases':{case:r['summary'] for case,r in RESULTS.items()},
 'input':{'outer_format_va':'0802ef89','outer_format':OUTER.decode(),'inner_format_va':'0803016f','inner_format':INNER.decode(),'tick_fixture':TICK},
 'preconditions':['sampling active and ADC full','gain-dirty foreground branch selected','one IRQ at chosen exact instruction phase','nested log returns normally with buffer capacity available','foreground registers/stack locals restored','no additional IRQ/USB slot reuse/copy failure'],
 'not_modelled':['actual event frequency','native printf execution or generic formats','USB/PMA and send queue scheduling','framer reentry while already encoding','business log opcode handling','NATS/uploader/cloud']})
 print(json.dumps({case:r['summary'] for case,r in RESULTS.items()},ensure_ascii=False,indent=2))
