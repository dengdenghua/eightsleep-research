#!/usr/bin/env python3
"""Finite normal-data accessory contracts, synthetic only. No target execution/I/O."""
from pathlib import Path
import json,struct,hashlib
OUT=Path(__file__).resolve().parents[1]
def trimix_batch(fresh40,carry):
 assert len(fresh40)==40 and all(0<=x<=65535 for x in [*fresh40,carry])
 a=[*fresh40,carry];comparisons=0
 for outer in range(39):
  for j in range(40-outer):
   comparisons+=1
   if a[j+1]<a[j]:a[j],a[j+1]=a[j+1],a[j]
 return {'result':sum(a[10:30])//20,'middle20':a[10:30],'index40_after':a[40],'compared_slots':41,'comparisons':comparisons}
def smooth10(history,x):
 assert len(history)==10 and all(0<=v<=65535 for v in [*history,x])
 if abs(x-history[9])>29:return x,[x]*10,'difference>=30:reset'
 return (sum(history)+x)//11,history[1:]+[x],'difference<=29:average11'
def axis_scale(raw,history):
 x=((raw&4095)*330)//4095;y,h,branch=smooth10(history,x)
 z=0 if y<9 else y
 c=struct.unpack('<d',bytes.fromhex('cdccccccccccf43f'))[0]
 return {'scaled':x,'smoothed':y,'after_deadband':z,'output':int(float(z)*c),'history':h,'branch':branch,'physical_unit':None}
def crc16(data):
 c=0xffff
 for b in data:
  c^=b
  for _ in range(8):c=(c>>1)^(0xa001 if c&1 else 0)
 return c

def trimix_record(words):
 assert len(words)==6
 c=crc16(struct.pack('>6H',*words))
 return struct.pack('<7H',*words,c)
def trimix_restore(blob,upper):
 w=struct.unpack('<7H',blob);assert w[6]==crc16(struct.pack('>6H',*w[:6]))
 return {'P1A':min(w[0],upper['P1A']),'P1C':min(w[1],upper['P1C']),'P1E':min(w[2],upper['P1E']),'P20':min(w[3],upper['P20'])}
def crc32_raw(data):
 c=0xffffffff
 for b in data:
  c^=b
  for _ in range(8):c=(c>>1)^(0xedb88320 if c&1 else 0)
 return c&0xffffffff

def keeson_snapshot(P,reserved,S,busy,old_crc,dirty):
 # This function updates RAM only; no 32B append producer was identified.
 prefix=struct.pack('<6I',*P,*reserved);candidate=crc32_raw(prefix)
 eligible=all(s==2 for s in S) and busy==0
 changed=eligible and old_crc!=candidate
 return {'ram_positions':list(P),'crc':candidate if changed else old_crc,'dirty_field':0 if changed else dirty,'crc_gate_passed':eligible,'flash_write_requested':False}
def keeson_restore_normal(records):
 # Only normal committed-looking records followed by erased slots, not malformed/error flows.
 valid=[]
 for b in records[:100]:
  assert len(b)==32
  marker=struct.unpack_from('<I',b,24)[0]
  if marker==0xffffffff:break
  assert 0<=marker<=100
  valid.append(b)
 chosen=valid[-1] if valid else bytes(32)
 return {'P':list(struct.unpack_from('<4I',chosen)), 'E':[0]*4,'T':[0]*4,'source_record':len(valid)-1 if valid else None,'crc_checked_by_scanner':False}
def selftest_trigger(stage,M,P,E,T,current_mask,previous_mask):
 return {'stage':0 if current_mask==0 and previous_mask==0x30000000 else stage,'M':M,'P':list(P),'E':list(E),'T':list(T)}
def selftest_completed(hall,current,old_mode):
 # Only the normal stage5/stage6 mode and counter stores. No motor or timer emulator.
 mode=0 if hall==8 else 1 if current==8 else 2
 return {'stage5_mode':mode,'stage6':{'stage':17,'wait_counter':0,'hall_total':0,'current_total':0},'old_mode_at_entry':old_mode}
def main():
 cases=[]
 def save(name,actual,expect,sources):
  for k,v in expect.items():assert actual[k]==v,(name,k,actual[k],v)
  cases.append({'id':name,'synthetic':True,'status':'PASS','actual':actual,'expected_subset':expect,'sources':sources})
 bsrc=['trimix1/080147de.txt','trimix2/080145f8.txt']
 save('T01_constant40_plus_carried_slot',trimix_batch([100]*40,0),{'result':100,'index40_after':100,'compared_slots':41},bsrc)
 save('T02_ramp40_with_zero_carry',trimix_batch(list(range(40)),0),{'result':18,'index40_after':39},bsrc)
 save('T03_ramp40_with_larger_carried_max',trimix_batch(list(range(40)),99),{'result':19,'index40_after':99},bsrc)
 save('T04_next_batch_preserves_running_max_slot',trimix_batch([50]*40,99),{'result':50,'index40_after':99},bsrc)
 for name,x,expect in [('T05_difference29_averages',129,102),('T06_difference30_resets',130,130)]:
  y,h,branch=smooth10([100]*10,x);save(name,{'output':y,'history':h,'branch':branch},{'output':expect},['trimix1/080149c0.txt'])
 save('T07_fullscale_axis_formula',axis_scale(4095,[0]*10),{'scaled':330,'smoothed':330,'output':429},['trimix1/08014822.txt','trimix2/0800ac98.txt','trimix1/0800ac10.txt'])
 save('T08_low_normal_level_deadband',axis_scale(100,[8]*10),{'scaled':8,'smoothed':8,'output':0},['trimix1/08014822.txt'])
 assert crc16(b'123456789')==0x4b37
 words=[101,202,303,404,0x1234,0x5678];blob=trimix_record(words)
 save('T09_normal14B_position_record',{'bytes':len(blob),'hex':blob.hex(),'crc':struct.unpack_from('<H',blob,12)[0],'restored':trimix_restore(blob,{'P1A':1000,'P1C':1000,'P1E':1000,'P20':1000})},{'bytes':14,'restored':{'P1A':101,'P1C':202,'P1E':303,'P20':404}},['trimix2/0800fd54.txt','trimix1/0800fd9e.txt','trimix3/0800eb94_0800ebcc.txt','trimix2/0800fc76.txt'])
 save('T10_restore_applies_per_field_upper_bounds',{'restored':trimix_restore(blob,{'P1A':100,'P1C':200,'P1E':300,'P20':400})},{'restored':{'P1A':100,'P1C':200,'P1E':300,'P20':400}},['trimix2/0800fc76.txt'])
 assert crc32_raw(b'123456789')==0x340bc6d9
 r1=struct.pack('<8I',10,20,30,40,0,0,1,crc32_raw(struct.pack('<6I',10,20,30,40,0,0)))
 r2=struct.pack('<8I',11,21,31,41,0,0,2,crc32_raw(struct.pack('<6I',11,21,31,41,0,0)))
 save('K01_normal_two_record_restore',keeson_restore_normal([r1,r2,bytes([255])*32]),{'P':[11,21,31,41],'E':[0]*4,'T':[0]*4,'source_record':1,'crc_checked_by_scanner':False},['keeson1/00029840.txt','keeson1/0002b680.txt','source/keeson-startup/STARTUP_DATA.json'])
 save('K02_erased_normal_position_area',keeson_restore_normal([bytes([255])*32]),{'P':[0]*4,'source_record':None},['keeson1/00029840.txt'])
 save('K03_stopped_RAM_snapshot_crc',keeson_snapshot([1,2,3,4],[0,0],[2]*4,0,0,7),{'ram_positions':[1,2,3,4],'dirty_field':0,'crc_gate_passed':True,'flash_write_requested':False},['keeson1/0002b6a8.txt','keeson1/0002f28c.txt','keeson4/0002f2b0.txt'])
 save('K04_moving_RAM_snapshot_without_crc_update',keeson_snapshot([1,2,3,4],[0,0],[0,2,2,2],0,123,7),{'ram_positions':[1,2,3,4],'crc':123,'dirty_field':7,'crc_gate_passed':False},['keeson1/0002b6a8.txt'])
 save('K05_release_trigger_preserves_mode_and_counters',selftest_trigger(17,1,[11]*4,[0]*4,[9]*4,0,0x30000000),{'stage':0,'M':1,'P':[11]*4,'E':[0]*4,'T':[9]*4},['keeson1/000291c0.txt','keeson2/000286dc.txt'])
 save('K06_normal_complete_then_repeat',selftest_completed(8,8,0),{'stage5_mode':0,'stage6':{'stage':17,'wait_counter':0,'hall_total':0,'current_total':0}},['keeson1/0002b044.txt'])
 save('K07_normal_repeat_starting_previous_mode1',selftest_completed(8,8,1),{'stage5_mode':0,'old_mode_at_entry':1},['keeson1/0002b044.txt'])
 save('K08_normal_current_only_mode_selection',selftest_completed(0,8,0),{'stage5_mode':1},['keeson1/0002b044.txt'])
 # Conditional source consistency example; not an observed boot/device failure.
 r=keeson_restore_normal([r1,bytes([255])*32]);r['E'][0]+=1;r['P'][0]=r['E'][0]
 save('K09_conditional_next_GPIO_source_update',r,{'P':[1,20,30,40],'E':[1,0,0,0]},['keeson1/0002b680.txt','keeson4/000303b0.txt'])
 result={'status':'PASS','cases':cases,'count':len(cases),'scope':'normal finite synthetic values only; selected arithmetic and stores, not whole firmware equivalence','assumptions':['Fresh40/carry explicitly supplied. Application startup zero range is separately proved; later-batch carry remains stateful.','Histories supplied explicitly; no actual sample interval/physical unit assumed.','IEEE754 binary64 normal finite multiply by preserved 1.3 constant, truncation; no exhaustive soft-float special-value equivalence.','Keeson flash records are fabricated normal records; no flash write producer or durability claim.','Keeson zero E/T fixture uses prior validated startup BSS; no intervening event/reset writer is modeled.','Selftest mode/counter subset only: motor, IRQ, sampling and delays not executed.']}
 (OUT/'MODEL_RESULTS.json').write_text(json.dumps(result,ensure_ascii=False,indent=2)+'\n')
 print(json.dumps({'status':'PASS','cases':len(cases)}))
if __name__=='__main__':main()
