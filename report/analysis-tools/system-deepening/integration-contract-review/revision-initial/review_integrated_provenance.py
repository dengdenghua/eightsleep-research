#!/usr/bin/env python3
"""Independent relational audit of retained integration outputs.
Expected values come from MCU and host input ledgers, not host stage snapshots.
Uses the retained CBOR reader as a byte-format decoder; not a native oracle.
"""
import sys
sys.dont_write_bytecode=True
from pathlib import Path
import json,hashlib,importlib.util
O=Path(__file__).resolve().parents[1];N=O.parent;P=N/'integrated-capture-model';D=O/'integration-replay'
spec=importlib.util.spec_from_file_location('review_integrated_cbor',P/'vendor/cbor-encoder/host_signal_parser.py');wire=importlib.util.module_from_spec(spec);spec.loader.exec_module(wire)
def lines(p):return [json.loads(x) for x in p.read_text().splitlines() if x]
def h(p):return hashlib.sha256(p.read_bytes()).hexdigest()
results=[]
for d in sorted(p for p in D.iterdir() if p.is_dir()):
 snaps={r['id']:r for r in lines(d/'mcu-snapshots.jsonl')};imus={r['id']:r for r in lines(d/'imu-snapshots.jsonl')};packets={r['id']:r for r in lines(d/'packets.jsonl')};inputs={r['source']:r for r in lines(d/'host-inputs.jsonl')};ledger=lines(d/'output-provenance.jsonl');events=lines(d/'queue-events.jsonl');summary=json.loads((d/'SUMMARY.json').read_text())
 in_cells=0;out_cells=0;linked=0;sentinels=0;parsed_packets=0
 for side,name in enumerate(['left','right']):
  frames=wire.parse_lsp((d/f'{name}.lsp').read_bytes(),side=name)
  expected=sorted((p for p in packets.values() if p['side']==side and p['delivered_fixture']),key=lambda p:p['stream_offset'])
  assert len(frames)==len(expected)
  data=(d/f'{name}.lsp').read_bytes()
  for fr,pk in zip(frames,expected):
   assert fr['offset']==pk['stream_offset']
   assert hashlib.sha256(data[fr['offset']:fr['offset']+fr['wire_length']]).hexdigest()==pk['lsp_sha256']
   assert fr['body_length']==377 and fr['stealth']['adc_frame_count']==5
   parsed_packets+=1
 for x in inputs.values():
  s=snaps[x['snapshot']];pk=packets[x['packet']];im=imus[x['imu_source']];side=pk['side'];idx=x['record_index']
  assert pk['delivered_fixture'] and s['side']==side
  assert s['callback_ordinal']==pk['adc_ordinals'][idx]
  first=snaps[f'{("left","right")[side]}:snapshot-{pk["adc_ordinals"][0]}']
  assert x['wire_tick']==(first['tick']+2*idx)&0xffffffff
  assert x['stored_snapshot_tick']==s['tick'] and x['snapshot_schedule_slot']==s['schedule_slot']
  assert x['adc']==[0x7fffffff]*8+s['adc_wire'][8:]
  assert x['adc_origins']==s['adc_origins'] and x['adc_origin_slots']==s['adc_origin_slots']
  assert x['imu']==im['values'] and x['imu_origins']==im['origins']
  assert im['callback_ordinal']==pk['imu_ordinal'] and im['schedule_slot']==pk['imu_schedule_slot']
  assert x['version_flags']==0xf200
  for ch in range(8):
   gen=s['adc_origin_slots'][8+ch]
   assert gen is not None
   expected=(side*1000000+ch*10000+gen)*(-1 if ch%2 else 1)*4
   assert x['adc'][8+ch]==expected
  assert im['values']==[(side*4000+i*100+im['callback_ordinal'])*(-1 if i%2 else 1) for i in range(24)]
  in_cells+=40
 decoded={}
 for m in summary['messages']:
  m=m['message'];p=d/m['path'];assert h(p)==m['sha256']
  decoded[m['id']]=wire.parse_cbor(p.read_bytes(),samples=True)
  assert [x['record']['type'] for x in decoded[m['id']]]==['piezo-buzzer','imu-multi-channel']
  assert decoded[m['id']][0]['record']['left']['version']==0xf200
  assert decoded[m['id']][0]['record']['right']['version']==0xf200
  assert decoded[m['id']][1]['record']['lver']==0xf200 and decoded[m['id']][1]['record']['rver']==0xf200
  assert all(x['record']['ts']==1700000000 for x in decoded[m['id']])
  assert decoded[m['id']][0]['record']['freq']==500 and decoded[m['id']][1]['record']['freq']==100
  for side in ['left','right']:assert decoded[m['id']][0]['record'][side]['gain']==[400]*5
 for row in ledger:
  stream=row['stream'];width,missing=(5,0x7fffffff) if stream=='buzzer' else (24,0x7fff)
  if row['source'] is None:
   expected=[missing]*width;ids=[None]*width;sentinels+=width
  else:
   src=inputs[row['source']];assert packets[src['packet']]['side']==row['side']
   assert row['packet']==src['packet'] and row['snapshot']==src['snapshot']
   expected=src['adc'][8:13] if stream=='buzzer' else src['imu']
   ids=src['adc_origins'][8:13] if stream=='buzzer' else src['imu_origins'];assert all(x is not None for x in ids)
   if stream=='imu':assert row['imu_source']==src['imu_source']
   linked+=width
  assert row['values']==expected and row['component_origins']==ids
  part=decoded[row['message']][0 if stream=='buzzer' else 1]['record'];side=['left','right'][row['side']];slot=row['slot']
  actual=([col[slot] for col in part[side]['data']] if stream=='buzzer' else [part[side][g][kind][axis][slot] for g in range(4) for kind in ['gyro','accel'] for axis in ['x','y','z']])
  assert [missing if x is None else x for x in actual]==expected
  out_cells+=width
 for m in summary['messages']:
  message=m['message'];mid=message['id'];related=[e for e in events if e.get('record_id')==mid]
  admit=[e for e in related if e['action']=='caller_body_candidate'];assert len(admit)==1
  assert admit[0]['body_sha256']==message['sha256']
  writes=[e for e in related if e['action']=='enqueue_copied'];assert len(writes)==int(message['queue_accepted'])
  publishes=[e for e in related if e['action']=='js_publish_attempt']
  assert len(publishes)==len(message['publication_attempts'])
  assert all(e['body_sha256']==message['sha256'] and e['caller_sequence_at_flush']==0 and e['ack_observed'] is None for e in publishes)
 results.append({'case':d.name,'delivered_packets_verified':parsed_packets,'host_input_records':len(inputs),'host_input_cells_linked':in_cells,'output_cells_checked_from_source':out_cells,'nonmissing_origin_linked_cells':linked,'sentinel_cells':sentinels,'body_admission_and_publish_hashes_match':True})
report={'review_kind':'independent joins and payload audit; not a second firmware implementation','passed':True,'cases':len(results),'output_cells_checked_from_source':sum(r['output_cells_checked_from_source'] for r in results),'results':results,'input_script_sha256':h(P/'run_cases.py')}
(O/'INTEGRATION_REVIEW_CHECKS.json').write_text(json.dumps(report,ensure_ascii=False,indent=2)+'\n')
print(json.dumps({k:v for k,v in report.items() if k!='results'}))
