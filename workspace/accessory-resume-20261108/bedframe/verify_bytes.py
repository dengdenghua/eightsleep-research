from pathlib import Path
import hashlib,json,re,argparse,struct
W=Path(__file__).resolve().parent
ap=argparse.ArgumentParser();ap.add_argument('--firmware',type=Path,default=Path('/Users/dangbei/Downloads/eightsleep-firmware-research-20261107/analysis/finishable-20261107/accessories-c11/extracted/OTA_KS8S08C010000001_V10211_nRF52832_202602070917/nrf52832_xxaa.bin'));a=ap.parse_args();raw=a.firmware.read_bytes();assert hashlib.sha256(raw).hexdigest()=='1856c1baec5f9bca7151e5b550fdf0a8d749e87f889d963a3a343293a4160966'
n=0;literal=0
for f in sorted(W.glob('pass*/*.txt')):
 text=f.read_text()
 for addr,h in re.findall(r'^INSN ([0-9a-f]+) ([0-9a-f]+) ',text,re.M):
  b=bytes.fromhex(h);off=int(addr,16)-0x26000;assert off>=0 and raw[off:off+len(b)]==b,(f.name,addr);n+=1
 for addr,h in re.findall(r'REF\[(?:READ|DATA|PARAM):([0-9a-f]+)=([0-9a-f]+)\]',text):
  off=int(addr,16)-0x26000
  if 0<=off<=len(raw)-4:assert struct.unpack_from('<I',raw,off)[0]==int(h,16),(f.name,addr);literal+=1
assert struct.unpack_from('<I',raw,0x2cd04-0x26000)[0]==0x362c9
assert struct.unpack_from('<I',raw,0x2961c-0x26000)[0]==0x36295
result={'result':'PASS','sample_sha256':hashlib.sha256(raw).hexdigest(),'instruction_records':n,'flash_literal_records':literal,'scope':'All retained instruction bytes and flash literal annotations; duplicate ranges counted as records, not unique coverage. Callback mapping follows normal registration only.'}
(W/'BYTE_VERIFICATION.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result))
