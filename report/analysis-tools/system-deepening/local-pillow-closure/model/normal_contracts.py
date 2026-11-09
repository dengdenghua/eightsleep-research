#!/usr/bin/env python3
"""Finite normal-layout arithmetic, not target execution or a physical recording."""
import json,struct,hashlib
from pathlib import Path
O=Path(__file__).resolve().parents[1]
def f32(x):return struct.unpack('<f',struct.pack('<f',x))[0]
def record(i):return {'tick':1000+5*i,'selection':0x25,'samples':[[100*i+10*j+k for k in range(6)] for j in range(6)]}
def batch(records):
 q=list(records);first=q.pop(0);current=first;rows=[];extra=None
 for _ in range(10):
  rows.append(current)
  if q:current=q.pop(0);extra=current
  else:extra=None
 mask=first['selection'];body=bytes([0x38,0])+struct.pack('>IHH',first['tick'],200,mask)
 for row in rows:
  for i,axes in enumerate(row['samples']):
   if mask>>i&1:body+=struct.pack('>6h',*axes)
 return body,rows,extra,q

def decode38(body,anchor_seconds=1700000000):
 assert body[:2]==b'\x38\x00';tick,freq,mask=struct.unpack_from('>IHH',body,2)
 step=max(1,1000//freq);p=10;rows=[]
 while p<len(body):
  values={}
  for i in range(6):
   if mask>>i&1:
    v=struct.unpack_from('>6h',body,p);p+=12
    values[str(i)]=[min(x,32766) for x in v]
  t=tick+len(rows)*step
  rows.append({'mcu_tick':t,'absolute_second':anchor_seconds+t//1000,'slot':(t%1000)//5,'values':values})
 return rows

def main():
 out=O/'model/results';out.mkdir(exist_ok=True);cases=[]
 body,rows,extra,q=batch([record(i) for i in range(10)])
 assert len(body)==370 and extra is None and len(q)==0
 got=decode38(body);assert len(got)==10 and got[-1]['slot']==9
 assert got[3]['values']['5']==rows[3]['samples'][5]
 (out/'normal38.body').write_bytes(body);(out/'normal38.decoded.json').write_text(json.dumps(got,indent=2)+'\n')
 cases.append({'name':'38_three_selected_ten_snapshots','body_bytes':len(body),'rows':10,'assertions':'only selected six-axis int16 fields; big-endian; fixed 5-tick host slots','status':'PASS'})
 body2,rows2,extra,q=batch([record(i) for i in range(11)])
 assert body2==body and extra['tick']==1050 and not q
 cases.append({'name':'normal_queue_has_eleven','emitted_ticks':[r['tick'] for r in rows2],'post_last_pop_unencoded_tick':extra['tick'],'condition':'11 queued before sequential main batch; no added callbacks in this arithmetic model; this is a normal queue trace, not measured scheduling','status':'PASS'})
 body3=bytearray(body);struct.pack_into('>h',body3,10,32767)
 assert decode38(body3)[0]['values']['0'][0]==32766
 cases.append({'name':'normal_int16_sentinel_reservation','input':32767,'output':32766,'status':'PASS'})
 vals=[f32(1.25),f32(-1)];cap=bytes([0x3a])+struct.pack('>IHB',2000,0,1)+b''.join(bytes([i])+struct.pack('>f',v) for i,v in enumerate(vals))
 assert len(cap)==18 and [struct.unpack_from('>f',cap,9+5*i)[0] for i in range(2)]==vals
 (out/'normal3a.body').write_bytes(cap)
 cases.append({'name':'3a_two_cached_values','status_code':0,'version':1,'values':vals,'host_timestamp':'replaced with Host now, MCU tick is parsed but not final output timestamp','status':'PASS'})
 raw_temp=32768;raw_hu=40000
 temp=f32(175*raw_temp/65535-45);hu=f32(125*raw_hu/65535-6)
 assert abs(temp-42.501335)<0.00001 and abs(hu-70.2951)<0.0001
 cases.append({'name':'SHT40_valid_values','raw':[raw_temp,raw_hu],'temp':temp,'humidity':hu,'conditions':'both source CRCs valid; calibration offset=0','status':'PASS'})
 def tmp(word):
  n=word>>4;n=n-4096 if n&2048 else n;return n*.0625
 assert tmp(0x1900)==25 and tmp(0xfb00)==-5
 cases.append({'name':'TMP1075_normal_signed12','words':['1900','fb00'],'outputs':[25,-5],'status':'PASS'})
 snapshots=[[1.,2.,3.],[1.,2.,3.],[4.,5.,6.]]
 avg=[f32(sum(row[i] for row in snapshots)/len(snapshots)) for i in range(3)]
 orient=bytes([0x3b,0])+struct.pack('>3f',*avg);assert len(orient)==14 and avg==[2.,3.,4.]
 (out/'normal3b.body').write_bytes(orient)
 cases.append({'name':'LIS_cached_snapshots_mean','cached_reads':3,'unique_vectors':2,'mean':avg,'note':'no fresh-sample detector in this arithmetic step; not posture labels','status':'PASS'})
 cases.append({'name':'FDC_cache_age','ages':[5499,5500],'cached':12.5,'returned':[12.5,-1.0],'assertion':'unsigned elapsed<5500 uses cache; boundary returns sentinel','status':'PASS'})
 assert [12.5 if n<5500 else -1. for n in [5499,5500]]==[12.5,-1.]
 artifacts=[]
 for p in sorted(out.glob('*')):
  b=p.read_bytes();artifacts.append({'path':str(p.relative_to(O)),'bytes':len(b),'sha256':hashlib.sha256(b).hexdigest()})
 result={'status':'PASS','cases':cases,'case_count':len(cases),'artifacts':artifacts,'limits':['Handwritten normal arithmetic/layout model, not firmware execution.','Stable time anchor and no discontinuity for38; does not emulate mapper all branches.','Configured cadence not achieved sensor freshness; no physical units inferred.','No hardware reads or accounts.']}
 (O/'MODEL_RESULTS.json').write_text(json.dumps(result,ensure_ascii=False,indent=2)+'\n');print(json.dumps({'status':'PASS','cases':len(cases),'artifacts':len(artifacts)}))
if __name__=='__main__':main()
