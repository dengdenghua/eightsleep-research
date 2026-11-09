#!/usr/bin/env python3
"""Cross-check retained SSA format sets and explicit literal-load cases against BBIN.
This is static value-flow inference, not execution or proof that callers run on this device.
"""
import hashlib,json,re,collections
from pathlib import Path
O=Path(__file__).resolve().parent.parent;R=O.parents[2]
I=json.loads((O/'INPUTS.json').read_text());B=(R/I['source']).read_bytes();BASE=0x8010000
assert hashlib.sha256(B).hexdigest()==I['sha256']
def write(n,x):(O/n).write_text(json.dumps(x,ensure_ascii=False,indent=2)+'\n')
def cstr(a):
 off=int(a,16)-BASE;end=B.index(b'\0',off,off+512);return B[off:end].decode('ascii')
def bl(a):
 off=int(a,16)-BASE;x=B[off:off+4];h1,h2=int.from_bytes(x[:2],'little'),int.from_bytes(x[2:],'little')
 assert h1&0xf800==0xf000 and h2&0xd000==0xd000
 s=h1>>10&1;i1=1^((h2>>13&1)^s);i2=1^((h2>>11&1)^s);d=s<<24|i1<<23|i2<<22|(h1&1023)<<12|(h2&2047)<<1
 return (int(a,16)+4+d-(1<<25 if s else 0))&0xffffffff
refs={x['callsite']:x for x in json.loads((O/'pass1/references.json').read_text())}
rows={x['callsite']:x for x in [json.loads(l) for l in (O/'pass1/calls.jsonl').read_text().splitlines()]}
assert len(refs)==255 and len(rows)==260
# Reviewed straight-line R0 loads; one R3 load followed by MOV R0,R3. No function created.
literals={
 '08022c0a':('08022c04','08022c28','0802ff34'), '0802323a':('08023236','0802328c','0803006b'),
 '080263cc':('080263ca','080263e8','08030e83'),'08026410':('0802640e','08026428','08030e83'),
 '080232f8':('080232f4','080233d8','080300ab'),'08023314':('08023310','080233dc','08030123'),
 '0802334a':('08023348','080233e8','080300c1'),'0802339a':('08023392','080233ec','080300e2'),
 '080233ca':('080233c6','080233f0','080300fd'),'0801cabc':('0801cab0','0801cbec','0802e118'),
 '0801cb80':('0801cb7a','0801cbf8','0802e142'),'0801cb8c':('0801cb8a','0801cc00','0802e170'),
 '0801cfc8':('0801cfbc','0801d110','0802e404'),'0801d0a4':('0801d0a2','0801d124','0802e431'),
 '0801cf18':('0801cf16','0801cf94','0802e36f'),'0801cf44':('0801cf42','0801cf9c','0802e3a7'),
 '0801cf6a':('0801cf68','0801cfa0','0802e3d0')}
assert set(literals)==set(refs)-set(rows)
for a,(load,pool,s) in literals.items():
 off=int(load,16)-BASE;h=int.from_bytes(B[off:off+2],'little');assert h&0xf800==0x4800
 computed=((int(load,16)+4)&~3)+4*(h&255);assert computed==int(pool,16)
 assert int.from_bytes(B[computed-BASE:computed-BASE+4],'little')==int(s,16)
 assert (h>>8&7)==(3 if a=='0801cb80' else 0)
 if a=='0801cb80':assert B[0xcb7e:0xcb80]==bytes.fromhex('1800')
 nojump=(O/'pass3'/('refs_'+a+'.txt')).read_text();assert 'REF_TO ' not in nojump,(a,nojump)
 for target in range(int(load,16)+2,int(a,16)+1,2):
  inner=O/'pass6'/('refs_'+format(target,'08x')+'.txt');assert inner.is_file() and 'REF_TO ' not in inner.read_text(),str(inner)
 rows[a]={'callsite':a,'owner':None,'arguments':[{'index':0,'strings':[{'va':s,'value':cstr(s)}],'constant_values':[int(s,16)]}],
 'resolution':'literal-load plus reviewed straight-line instructions','literal_load':load,'pool':pool,'extra_move':'0801cb7e' if a=='0801cb80' else None}
pat=re.compile(r'%(?:[-+ #0]*)(?:\d+)?(?:\.\d+)?[hlLjzt]*([diuoxXfFeEgGaAcspn%])')
out=[];formats={}
for a,r in sorted(rows.items()):
 assert bl(a)==0x801c8f8,a
 r=dict(r);r['in_original_ref_list']=a in refs;r.setdefault('resolution','HighFunction SSA constant/COPY/PHI/address-arithmetic set; not runtime arguments')
 fs=r['arguments'][0]['strings'];assert fs and len(fs)==len(r['arguments'][0]['constant_values'])
 mins=[];groups=set()
 for s in fs:
  text=cstr(s['va']);assert text==s['value']
  prefix=text.split('%',1)[0];assert len(prefix)>=4 and all(c not in '}~' for c in prefix)
  conversions=pat.findall(text);assert 'n' not in conversions and '*' not in text
  covered={i for m in pat.finditer(text) for i in range(m.start(),m.end())};assert all(c!='%' or i in covered for i,c in enumerate(text))
  specs=[x for x in conversions if x!='%'];mins.append(len(prefix))
  if 's' in specs:
   ss=[j+1 for j,x in enumerate(specs) if x=='s']
   known=all(j<len(r['arguments']) and bool(r['arguments'][j].get('strings')) and len(r['arguments'][j]['strings'])==len(r['arguments'][j].get('constant_values',[])) for j in ss)
   groups.add('string_all_constant_in_SSA' if known else 'string_runtime_or_partly_unresolved')
  elif specs:groups.add('numeric_or_char')
  else:groups.add('literal_only')
  off=int(s['va'],16)-BASE;raw=B[off:off+len(text)+1]
  formats[s['va']]={'va':s['va'],'file_offset':off,'value':text,'bytes_hex':raw.hex(),'sha256':hashlib.sha256(raw).hexdigest(),'fixed_ascii_prefix_length':len(prefix),'conversions':specs}
 r['classification']=sorted(groups);r['minimum_fixed_prefix_before_conversion']=min(mins)
 r['argument_limit']='SSA expressions and any raw constant strings retained; dynamic %s length/content/lifetime NOT individually proved. Whole-frame bound does not assume they are short.'
 out.append(r)
write('CALLSITES.json',{'original_ref_count':255,'decompiled_known_refs':238,'literal_resolved_unowned_refs':17,'extra_direct_calls':22,'total_distinct_calls':len(out),'rows':out})
write('FORMATS.json',{'format_count':len(formats),'minimum_fixed_prefix':min(x['fixed_ascii_prefix_length'] for x in formats.values()),'rows':list(formats.values())})
counts=collections.Counter(g for r in out for g in r['classification'])
write('INVENTORY_SUMMARY.json',{'call_count':len(out),'format_count':len(formats),'classification_call_counts_nonexclusive':counts,'unresolved_format_sets':[],
 'unresolved_arguments':'Runtime %s values remain unresolved individually; arbitrary valid string content conservatively allowed after fixed prefix.',
 'extra_calls':[r['callsite'] for r in out if not r['in_original_ref_list']],
 'coverage':'Original255refs plus22directBL recovered inside already selected owners; NOT arbitrary computed calls or whole firmware exhaustiveness.'})
rows_cfg=[]
for j in range(14):
 off=0x1fbc8+8*j;raw=B[off:off+8];rows_cfg.append({'va':hex(BASE+off),'file_offset':off,'threshold':int.from_bytes(raw[:4],'little'),'thumb_callback':hex(int.from_bytes(raw[4:],'little')),'raw_hex':raw.hex()})
preoff=0x2236e;assert B[preoff:preoff+4]==b'FW: '
write('RAW_TABLES.json',{'source_sha256':I['sha256'],'log_prefix':{'ram':'0x200002e6','reset_data_src':'0x08032288','reset_data_dst':'0x20000200','flash_va':hex(BASE+preoff),'file_offset':preoff,'raw_hex':B[preoff:preoff+5].hex(),'value':'FW: '},
 'config_callbacks':rows_cfg,'width_contract':'base callback18bd0 stores1 atconfig+0x188; threshold0xa00 callback18fb0 stores2; other13/12 callback bodies retained. Width1/2/4 all receive explicit mathematical bound, no current-device deployment claim.',
 'vector_table':{'file_offset':128,'va':'0x08010080','raw_hex':B[128:320].hex(),'sha256':hashlib.sha256(B[128:320]).hexdigest()}})
print(json.dumps({'calls':len(out),'formats':len(formats),'groups':counts}))
