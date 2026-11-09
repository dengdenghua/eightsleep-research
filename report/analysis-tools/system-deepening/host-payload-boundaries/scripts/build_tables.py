"""Original ELF template bytes; no target execution."""
import json, struct
from validate_bytes import Elf, OUT
elf=Elf()
records=[]
for address,size,label in [(0x472f20,124,"per-ADC row initial template"),(0x46bdb0,48,"shared IMU initial template")]:
    raw=elf.read(address,size)
    records.append(dict(address=f"{address:08x}",file_offset=elf.offset(address,size),hex=raw.hex(),label=label))
adc=list(struct.unpack_from("<16i",elf.read(0x472f20,124),8))
imu=list(struct.unpack("<24h",elf.read(0x46bdb0,48)))
assert adc==[2147483647]*16 and imu==[32767]*24
(OUT/"RAW_TABLES.json").write_text(json.dumps(dict(records=records,verified_adc_template=adc,verified_imu_template=imu),indent=2)+"\n")
print("Raw templates verified")
