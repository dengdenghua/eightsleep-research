"""Synthetic normal-value contracts, not emulation, firmware execution or hardware tests."""
from pathlib import Path
import struct,json
O=Path(__file__).resolve().parents[1]
def f32(x):return struct.unpack('<f',struct.pack('<f',x))[0]
def target(be):return min(40.0,f32(int.from_bytes(be,'big')/100.0))
def old_gain(request,prior):
 if request<100:return None,prior
 code=(3209600//request-48)//125
 if code==256:code=255
 code&=255
 return code,3209600//(125*code+48)
def mcp_code(request):
 for limit,code in [(100,0xc3),(200,0xcb),(400,0xd3),(800,0xdb),(1600,0xe3),(3200,0xeb),(6400,0xf3)]:
  if request<limit:return code
 return 0xfb
def query(i,x):
 value=(0xff if i==10 else 0x8000) if x==-100.0 else int(f32(f32(x)*f32(100.0)))&65535
 return bytes([i])+value.to_bytes(2,'big')
def rate_change(hw,old,new,active,start_tick):
 return {'rate':new if hw<0x700 else old,'restart':hw<0x700 and old!=new and active,'start_tick':start_tick}
def flash_base(size_code):return 0x800fc00 if size_code<0x81 else 0x803f800
def hw_reply(flash_window):
 assert len(flash_window)==512
 return b'\x82\x00'+flash_window[:128]
def run():
 rows=[]
 def case(name,actual,expected,source):
  assert actual==expected,(name,actual,expected)
  rows.append({'name':name,'actual':actual,'expected':expected,'source':source,'status':'pass'})
 case('normal_36_50_target',target(bytes.fromhex('0e42')),36.5,'handler25 unsigned BE16/100')
 case('normal_45_target_clamped',target(bytes.fromhex('1194')),40.0,'handler25 cap40')
 case('normal_optional_power_cap',min(150,100),100,'handler25 cap100')
 case('old_gain_100',old_gain(100,200),(255,100),'handler2b + old gain setter')
 case('old_gain_200',old_gain(200,100),(128,200),'handler2b + old gain setter')
 case('old_gain_unchanged_zero',old_gain(0,200),(None,200),'handler2b request<100')
 for request,code in [(50,0xc3),(100,0xcb),(200,0xd3),(400,0xdb),(800,0xe3),(1600,0xeb),(3200,0xf3),(6400,0xfb)]:
  case('mcp_gain_'+str(request),mcp_code(request),code,'handler2b normal threshold chain')
 case('query_36_50',query(2,36.5).hex(),'020e42','handler2a/2f')
 case('query_missing_regular',query(3,-100.0).hex(),'038000','handler2a/2f')
 case('query_missing_id10',query(10,-100.0).hex(),'0a00ff','handler2a/2f')
 case('old_rate_restart_preserves_tick',rate_change(0x600,100,200,True,123),{'rate':200,'restart':True,'start_tick':123},'handler21')
 case('new_rate_noop',rate_change(0x700,100,200,True,123),{'rate':100,'restart':False,'start_tick':123},'handler21')
 case('flash_small_base',flash_base(0x80),0x800fc00,'main hardware-info selector')
 case('flash_large_base',flash_base(0x81),0x803f800,'main hardware-info selector')
 # Synthetic bytes deliberately contain no real configuration, account or identity.
 fixture=bytes(range(256))*2
 case('hardware_reply_128_bytes',hw_reply(fixture).hex(),(b'\x82\x00'+bytes(range(128))).hex(),'main builtin02: r1=0x80 at append')
 case('hardware_reply_total_130',len(hw_reply(fixture)),130,'main builtin02')
 case('logical_gpio_response_dual_status',bytes([0xae,0,2]).hex(),'ae0002','handler2e literal appends followed by default')
 return {'synthetic':True,'target_execution':False,'cases':rows,'pass_count':len(rows),'limitations':['Normal finite values only; not full decoder or MCU emulation.','Hardware transactions and actual GPIO effects not executed.','CBOR config bytes are unavailable; 128B response check uses synthetic bytes and does not invent actual field values.','No physical sensor position, calibration units, actual rate or current device version inferred.']}
if __name__=='__main__':
 r=run();(O/'MODEL_RESULTS.json').write_text(json.dumps(r,ensure_ascii=False,indent=2)+'\n');print(r['pass_count'],'normal synthetic cases PASS')
