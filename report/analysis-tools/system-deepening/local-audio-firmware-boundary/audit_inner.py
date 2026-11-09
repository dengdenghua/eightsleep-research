from pathlib import Path
import struct,json,hashlib,collections,zlib,math,re
R=Path('/Users/dangbei/Downloads/eightsleep-firmware-research-20261107')
N=R/'analysis/system-deepening-20261108';O=N/'local-audio-firmware-boundary'
D=R/'mediatek/rootfs-selected/opt/eight/firmware/Speaker/B13'
(O/'slices').mkdir(parents=True,exist_ok=True)
def sha(b):return hashlib.sha256(b).hexdigest()
def entropy(b):
 c=collections.Counter(b);return -sum((v/len(b))*math.log2(v/len(b)) for v in c.values())
def ranges(indices):
 out=[]
 for i in indices:
  if out and out[-1][1]==i:out[-1][1]+=1
  else:out.append([i,i+1])
 return out
def compare(a,b):
 diff=[i for i,(x,y) in enumerate(zip(a,b)) if x!=y]
 return dict(same_length=len(a)==len(b),equal=a==b,different_bytes_in_overlap=len(diff),ranges=ranges(diff))
items={};raw={}
for p in sorted(D.glob('*.fot')):
 b=p.read_bytes();v=re.search(r'V(\d+)',p.name)[1];raw[v]=b
 # Reuse proven offsets in prior audit; this script does not repeat CRC or infer flash addresses.
 body_start,body_len,repeat_start,tail_start=struct.unpack_from('<4I',b,0x5c)
 assert (body_start,repeat_start,tail_start)==(0x200,0x200+body_len,0x400+body_len)
 tail=b[tail_start:];assert len(tail)==4096
 sname=f'V{v}.tail4096.bin';(O/'slices'/sname).write_bytes(tail)
 (O/'slices'/f'V{v}.tail4096.hex.txt').write_text('\n'.join(f'{tail_start+i:08x} (+{i:04x})  '+tail[i:i+16].hex(' ') for i in range(0,len(tail),16))+'\n')
 (O/'slices'/f'V{v}.xcod64.bin').write_bytes(b[0x200:0x240])
 # Only known signatures are checked, never an unrestricted guess of architecture or encoding.
 magics={'ELF':b'\x7fELF','ZIP':b'PK\x03\x04','gzip':b'\x1f\x8b\x08','xz':b'\xfd7zXZ\x00','zstd':b'\x28\xb5\x2f\xfd','LZ4-frame':b'\x04\x22\x4d\x18','bzip2':b'BZh','XCOD':b'\xd8\xc3\xcf\xc4'}
 signatures={name:[m.start() for m in re.finditer(re.escape(magic),b)] for name,magic in magics.items()}
 zstarts=[i for i in range(len(b)-1) if b[i]&15==8 and b[i]>>4<=7 and ((b[i]<<8)|b[i+1])%31==0]
 zok=[];errors=collections.Counter()
 for i in zstarts:
  try:
   dc=zlib.decompressobj();out=dc.decompress(b[i:],1<<20)
   if dc.eof:zok.append(dict(offset=i,output_size=len(out),consumed=len(b)-i-len(dc.unused_data),sha256=sha(out)))
   else:errors['no_eof_with_1MiB_output_cap']+=1
  except zlib.error as e:errors[str(e).split(': ')[-1]]+=1
 raw_attempts=[]
 for i in [0x200,0x208,0x20c,0x20e,0x210,0xa00,tail_start,tail_start+0x100]:
  try:
   dc=zlib.decompressobj(-15);out=dc.decompress(b[i:],1<<20)
   result=dict(offset=i,eof=dc.eof,output_size=len(out),consumed=len(b)-i-len(dc.unused_data),sha256=sha(out))
  except zlib.error as e:result=dict(offset=i,error=str(e))
  raw_attempts.append(result)
 strings=[dict(relative=m.start(),absolute=tail_start+m.start(),text=m.group().decode('ascii')) for m in re.finditer(rb'[ -~]{3,}',tail)]
 fields=[]
 for off,n,label in [(0xc0,4,'high-bit DOWN candidate tag'),(0xff,6,'86 INFO 01 prefix'),(0x10f,1,'inverse-changing byte'),(0x129,1,'byte matching V filename number'),(0x134,3,'B13 literal'),(0x15c,8,'BT-Photo literal'),(0x17d,10,'LE-Remoter literal')]:
  fields.append(dict(relative=off,absolute=tail_start+off,hex=tail[off:off+n].hex(),interpretation=label))
 assert tail[0x134:0x137]==b'B13' and tail[0x15c:0x164]==b'BT-Photo' and tail[0x17d:0x187]==b'LE-Remoter'
 assert tail[0x129]==int(v) and tail[0x10f]+tail[0x129]==0x4e
 xword=struct.unpack_from('<I',b,0x208)[0]
 items[v]=dict(original=str(p),sha256=sha(b),size=len(b),body=dict(offset=body_start,length=body_len,sha256=sha(b[body_start:repeat_start]),entropy=entropy(b[body_start:repeat_start])),
   xcod=dict(offset=0x200,raw_hex=b[0x200:0x220].hex(),word_at_204=struct.unpack_from('<I',b,0x204)[0],word_at_208=xword,u16_at_20c=struct.unpack_from('<H',b,0x20c)[0],word_at_208_div_512=xword/512,unbound_candidate_windows=[dict(offset=xword+delta,hex=b[xword+delta:xword+delta+48].hex()) for delta in [0,0x200,0x208,0x210]]),
   tail=dict(offset=tail_start,length=4096,sha256=sha(tail),slice='slices/'+sname,fields=fields,strings=strings,version_byte=tail[0x129],inverse_byte=tail[0x10f],pair_sum=tail[0x129]+tail[0x10f],sum8_after_100=sum(tail[0x100:])&255,entropy=entropy(tail)),
   format_probes=dict(signatures=signatures,zlib_header_candidates=len(zstarts),zlib_eof_successes=zok,zlib_errors=dict(errors),raw_deflate_selected_offsets=raw_attempts,output_cap=1<<20))
comparisons={}
for x,y in [('37','38'),('38','42')]:
 a,b=raw[x],raw[y];ia,ib=items[x],items[y]
 comp=dict(full_overlap=compare(a,b),body=compare(a[0x200:0x200+ia['body']['length']],b[0x200:0x200+ib['body']['length']]),tail=compare(a[-4096:],b[-4096:]))
 if x=='37':
  comp['exact_changed_bytes']=[dict(offset=i,left=a[i],right=b[i]) for i in range(len(a)) if a[i]!=b[i]]
 # Large byte-wise difference runs need no verbatim repeat in the compact summary.
 if x=='38':
  for key in ['full_overlap','body']:comp[key]['range_count']=len(comp[key].pop('ranges'))
 comparisons[x+'_'+y]=comp
sources=[]
for f in [N/'accessory-execution/FINDINGS_ZH.txt',N/'accessory-execution/FOT_FORMAT_AUDIT.json',N/'accessory-execution/SOURCE_CONTEXTS.txt']:
 sources.append(dict(path=str(f),sha256=sha(f.read_bytes())))
result=dict(scope='3 fixed official MTK B13 files; byte comparison, explicit format probes and anonymous candidate metadata; not ISA/DSP recovery',files=items,comparisons=comparisons,prior_sources=sources)
(O/'INNER_AUDIT.json').write_text(json.dumps(result,ensure_ascii=False,indent=2)+'\n')
print(json.dumps({'bodies37_38_equal':comparisons['37_38']['body']['equal'],'file37_38_diff':comparisons['37_38']['full_overlap']['different_bytes_in_overlap'],'tail38_42_diff':comparisons['38_42']['tail']['different_bytes_in_overlap'],'zlib':{v:(i['format_probes']['zlib_header_candidates'],i['format_probes']['zlib_eof_successes']) for v,i in items.items()}},indent=2))
