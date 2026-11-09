#!/usr/bin/env python3
"""Validate USB timebase exports against the original BBIN; no target execution."""
from pathlib import Path
import argparse, importlib.util, json
HERE=Path(__file__).resolve().parents[1]
ap=argparse.ArgumentParser(description=__doc__)
ap.add_argument('--research-root',type=Path,default=HERE.parents[2])
a=ap.parse_args()
source=HERE.parent/'sensor-diff/scripts/verify_bytes.py'
spec=importlib.util.spec_from_file_location('sensor_byte_verifier',source)
m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m)
m.HERE=HERE;m.RESEARCH=a.research_root.resolve();m.TARGETS={'usb':m.TARGETS['usb']};m.main()
b=(m.RESEARCH/'mediatek/rootfs-selected/opt/eight/lib/subsystem_updates/firmware-sensor-g0-usb.bbin').read_bytes()
facts=json.loads((HERE/'RAW_INIT_FACTS.json').read_text())
for item in facts['initialized_values']:
    off=item['file_offset'];raw=bytes.fromhex(item['raw_hex'])
    assert b[off:off+len(raw)]==raw
    assert int.from_bytes(raw,'little')==item['value']
assert int.from_bytes(b[188:192],'little')==int(facts['systick_vector']['value'],16)
print('Initial values and SysTick vector verified')
