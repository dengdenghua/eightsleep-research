#!/usr/bin/env python3
"""Offline BBIN identity, exact exported bytes and Thumb branch checks."""
import hashlib
import json
import re
from pathlib import Path

O=Path(__file__).resolve().parent.parent
R=O.parents[2]

def sha(p): return hashlib.sha256(p.read_bytes()).hexdigest()
def write(n,v): (O/n).write_text(json.dumps(v,ensure_ascii=False,indent=2)+'\n')

def branch32(a,raw,m):
    h1,h2=int.from_bytes(raw[:2],'little'),int.from_bytes(raw[2:],'little')
    assert h1&0xf800==0xf000
    assert h2&0xd000==(0xd000 if m=='bl' else 0x9000)
    s=h1>>10&1;i1=1^((h2>>13&1)^s);i2=1^((h2>>11&1)^s)
    d=s<<24|i1<<23|i2<<22|(h1&1023)<<12|(h2&2047)<<1
    return (a+4+d-(1<<25 if s else 0))&0xffffffff

def main():
    inp=json.loads((O/'INPUTS.json').read_text());src=R/inp['source'];data=src.read_bytes();base=int(inp['mapping_base'],16)
    assert sha(src)==inp['sha256'] and len(data)==inp['size']
    counts={'instruction_occurrences':0,'instruction_bytes':0,'flash_literals':0,'bl_bw_targets':0};seen={};files=[]
    for p in sorted(O.glob('pass*/*.txt')):
        n=0
        for line in p.read_text().splitlines():
            m=re.match(r'INSN ([0-9a-f]{8}) ([0-9a-f]+) (.*)',line)
            if not m: continue
            a=int(m[1],16);raw=bytes.fromhex(m[2]);asm=m[3];off=a-base
            assert 0<=off<=len(data)-len(raw) and data[off:off+len(raw)]==raw,(p,a)
            if a in seen: assert seen[a]==raw
            seen[a]=raw;n+=1;counts['instruction_occurrences']+=1;counts['instruction_bytes']+=len(raw)
            b=re.match(r'(bl|b\.w) 0x([0-9a-f]{8})\b',asm)
            if b:
                assert branch32(a,raw,b[1])==int(b[2],16),(p,a,'branch')
                counts['bl_bw_targets']+=1
            for aa,v in re.findall(r'REF\[READ:([0-9a-f]{8})=([0-9a-f]+)\]',asm):
                x=int(aa,16)-base
                if 0<=x<=len(data)-4:
                    assert int.from_bytes(data[x:x+4],'little')==int(v,16)
                    counts['flash_literals']+=1
        files.append({'path':str(p.relative_to(O)),'instructions':n,'sha256':sha(p)})
    vector_off=0x80+24*4;vector_raw=data[vector_off:vector_off+4]
    assert int.from_bytes(vector_raw,'little')==0x0801be21
    write('RAW_TABLES.json',{'kind':'original_BBIN_bytes_not_live_RAM','IRQ8':{'vector_index':24,'flash_va':hex(base+vector_off),'file_offset':vector_off,'raw_hex':vector_raw.hex(),'thumb_value':'0x0801be21','handler':'0x0801be20','copied_RAM_vector':'0x20000060'},'vector_copy':{'source':'0x08010080','destination':'0x20000000','length':192,'source_hex':data[0x80:0x140].hex(),'source_sha256':hashlib.sha256(data[0x80:0x140]).hexdigest(),'writer':'0801be78','VTOR_writer':'080114ac'},'endpoint_config_contract':{'PCD':'0x20002144','EP_address':'0x81','IN_struct':'0x200021a8','single_buffer_flag_offset':10,'single_buffer_flag':0,'PMA_offset':'0x98','PMA_copy_destination':'0x40009898','normal_reset_speed_byte':1,'normal_max_packet':64,'other_speed_branch_max_packet':512,'sources':['pass3/0801bf1c_0801bfcc.txt','pass4/08014bd4.txt','pass3/0801c0d4_0801c0fc.txt','pass2/08017f2c_08018066.txt']}})
    write('BYTE_VALIDATION.json',{'status':'PASS','source':inp,'totals':counts,'unique_instruction_addresses':len(seen),'unique_instruction_bytes':sum(map(len,seen.values())),'files':files,'extra_checks':['IRQ8 vector raw word','192-byte vector initializer range'],'limits':'Identity/alignment proof, not target execution or all paths correctness. Counts include overlapping exports.'})
    j=json.loads((O/'JOBS.json').read_text())
    commands=['Offline reproduction; no target execution.','JAVA_HOME=/opt/homebrew/opt/openjdk@21/libexec/openjdk.jdk/Contents/Home','']
    for x in j['jobs']:
        i=x['pass'];log=(O/x['log']).read_text();ss=[s for s in log.splitlines() if 'REPORT: Execute script: ExportUsbPacketRead.java ' in s]
        assert ss and 'REPORT SCRIPT ERROR' not in log,i
        args=ss[-1].split('ExportUsbPacketRead.java ',1)[1].split(' (HeadlessAnalyzer)',1)[0].strip()
        commands.append(f"{i}. /opt/homebrew/Cellar/ghidra/12.1.4/libexec/support/analyzeHeadless '{R}/analysis/sensor-mcu/ghidra' sensor -process firmware-sensor-g0-usb.bbin -readOnly -noanalysis -scriptPath '{O}/scripts' -postScript ExportUsbPacketRead.java {args}")
        assert x['status']=='completed_exit0'
    (O/'REPRODUCE.txt').write_text('\n'.join(commands)+'\n')
    ev=json.loads((O/'EVIDENCE_MAP.json').read_text())
    for row in ev['rows']:
        for f in row['files']: assert (O/f).is_file(),f
    records=[]
    for p in sorted(O.rglob('*')):
        if p.is_file() and p.name!='SOURCE_MANIFEST.json' and '__pycache__' not in p.parts:
            records.append({'root':'sensor-usb-packet-read','path':str(p.relative_to(O)),'size':p.stat().st_size,'sha256':sha(p),'kind':'derived_analysis'})
    for p in [src,R/'analysis/system-deepening-20261108/sensor-usb-lifecycle/FINDINGS_ZH.txt',R/'analysis/system-deepening-20261108/sensor-timebase/usb-pass4/08029ad4_08029b12.txt']:
        records.append({'root':'research','path':str(p.relative_to(R)),'size':p.stat().st_size,'sha256':sha(p),'kind':'original_BBIN' if p==src else 'prior_readonly_evidence'})
    write('SOURCE_MANIFEST.json',{'self_hash_excluded':True,'files':records})
    print(json.dumps({'status':'PASS',**counts,'unique_instruction_addresses':len(seen),'manifest_records':len(records)}))

if __name__=='__main__':main()
