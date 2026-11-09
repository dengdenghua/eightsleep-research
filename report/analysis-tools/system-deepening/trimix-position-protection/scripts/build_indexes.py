#!/usr/bin/env python3
"""Build bounded static evidence indexes from existing exports, without Ghidra/runtime."""
import json, re
from pathlib import Path
O=Path(__file__).resolve().parents[1]
def save(name,data): (O/name).write_text(json.dumps(data,ensure_ascii=False,indent=2)+'\n')
lookup={}; export_files=[]
for p in sorted(O.glob('pass*/*.txt')):
    lines=p.read_text().splitlines(); count=0
    for number,line in enumerate(lines,1):
        m=re.match(r'INSN ([0-9a-f]{8}) ([0-9a-f]+) (.*)',line)
        if m:
            count+=1
            lookup.setdefault(m[1],[]).append({'path':str(p.relative_to(O)),'line':number,'bytes':m[2],'text':m[3]})
    export_files.append({'path':str(p.relative_to(O)), 'instruction_occurrences':count,
        'kind': 'function' if any(x.startswith('FUNCTION_BODY ') for x in lines) else
                'range' if lines and lines[0].startswith('RANGE ') else 'references_or_program_metadata'})
def source(address):
    assert address in lookup,address
    return {'va':address,'occurrences':lookup[address]}
rows=[
 (1,0,'20007bbc','20007f1a',8,'20007bcb','20007e8c','20007e8e','08018e6e',25,'08017642','080176ae','08017702','200077ac',2,5,'20007fe6'),
 (2,1,'20007be4','20007f1c',4,'20007bf3','20007e96','20007e9a','08018eae',24,'0801789a','0801792e','08017990','200077ae',4,14,'20007fea'),
 (3,3,'20007c34','20007f20',2,'20007c43','20007ea2','20007ea6','08018eec',23,'08017b20','08017bb6','08017c18','200077b0',3,6,'20007fe8'),
 (4,2,'20007c0c','20007f1e',1,'20007c1b','20007eae','20007eb2','08018f3e',22,'08017ed2','08017f66','08017fc6','200077b2',5,4,'20007fec')]
keys=['selector','counter_argument','axis_struct','position_state','gpio_mask','counter_latched_direction','upper_bound','lower_bound','input_irq_handler','vector_slot','endpoint_writer_code_entry','upper_write','lower_write','processed_cache','adc_rank','adc_channel_field','raw_input']
axes=[dict(zip(keys,r)) for r in rows]
save('POSITION_MAP.json',{'scope':'software selectors and static paths; no physical displacement/current/angle calibration',
    'axes':axes,'gpio_read_register':'40011408','counter_function':'08009f58',
    'counter_switch':'RAW_FACTS.json#/position_update_tbb',
    'increment_rule':'latched_direction==0xaa and P<upper => P+1',
    'decrement_rule':'latched_direction==0x55 and P>lower => P-1',
    'poll_route':['08018e34 (argument13)','08018a6c','080187b4 (20007fa8==0xaa)','0800a182','08009f58'],
    'endpoint_route':['08018df0 (argument6)','08018a6c','08018800 (20007fa8==0xaa)','four wrappers','endpoint writers'],
    'boot_route':['080108d8','0801376c','0800a000 then 0800fc76'],
    'boot_storage_address':'080ff800 (not included in this payload)',
    'explicit_clear_writes':[source(a) for a in ['0800fcb6','0800fcb8','0800fcba','0800fcbc']],
    'writer_limit':'Recognized direct stores and necessary alias consumers inspected; not an exhaustive arbitrary-memory-write proof.'})
save('PROTECTION_CHAIN.json',{'scope':'register writes/reads and observed static call edges; normal configured flow only',
    'producer':{'initializer':'08012c20','dma_register_base':'40020008','source':'4001244c','destination':'20007fe4',
       'transfers':5,'control_configured_bits':'000025a0','control_after_enable':'000025a3',
       'scan_register_base':'40012400','scan_field':1,'continuous_field':0,'scan_length':5,
       'channel_fields_by_rank':[0,5,6,14,4],'sample_time_field':0,
       'source_detail':['pass2/08012c20.txt','pass3/08011e1e.txt','pass3/080173f6.txt','pass3/08012d9a.txt','pass4/080173ba.txt','pass4/080173c4.txt']},
    'irq':{'vector_slot':27,'handler':'08018cfe','completion_mask':2,'status_register':'40020000',
       'clear_register':'40020004','consumer_entry':'080145f8','first_protection_input_load':source('08014602')},
    'axes':[{'selector':r['selector'],'rank':r['adc_rank'],'channel_field':r['adc_channel_field'],'buffer':r['raw_input']} for r in axes],
    'rearm':{'done_marker':'200074cc','done_value':170,'write_after_protection':source('080147ba'),
       'route':['08018db2 (argument2)','08018a6c','080187c2'],
       'rule':'if done==0xaa: clear done; 08017350(0x40012400,1) ORs control +8 with0x500000',
       'sources':[source('080187c6'),source('080187ce'),source('080187d4'),source('08017356')]},
    'processed_cache':{'normal_batch_samples':40,'full_index_marker':100,'main_consumer':'08014822',
       'main_call':source('08010952'),'consumer_gate':source('0801482a'),'batch_reset':source('0801497e'),
       'values':['200077aa','200077ac','200077ae','200077b0','200077b2'],
       'boundary':'Fast IRQ protection continues while batch is full; endpoint checks can reuse processed cache. Processing helpers not completely audited.'},
    'not_proven':['milliseconds/Hz','fresh physical signal rather than stuck values','simultaneous channels','all abnormal hardware paths','physical current/angle/displacement','all downstream protection actions']})
claims=[
 ('TPP01','Four comparison states use bounded +/-1 on latched direction; exact TBB verified',['08009f62','08009f70','08009f78','08009f88','08009f8a','08009fb0','08009fd6','08009ffc']),
 ('TPP02','Four GPIO IRQ routes share accepted-level state and tail to counter',['08018e70','08018e9a','08018ea2','08018eaa','08018ee8','08018f1c','08018f6e','08018faa']),
 ('TPP03','Parameter13 poll route requires10 accepted-check increments',['08018e46','08018a6e','080187bc','0800a190','0800a1b2','0800a1c8','0800a1d2','0800a1d8']),
 ('TPP04','Explicit startup restore / mismatch clear / upper clamp',['08013772','08013776','0800fc8a','0800fca6','0800fcb6','0800fcbc','0800fd30','0800fd4e']),
 ('TPP05','Endpoint conditions overwrite state,200 checks and cached measurement',['08018e02','08018a80','08018838','08017678','0801769c','080176ae','08017702','0801792e','08017990','08017bb6','08017c18','08017f66','08017fc6']),
 ('TPP06','Protection source is5-word DMA buffer and completion vector',['08012c7c','08012c82','08012c8a','08012cb2','08012cbc','08012d66','08018d02','08018d0a','08018d12','08014602']),
 ('TPP07','Done marker is after checks; parameter2 scheduler consumes marker before rearm',['080147ba','08018dce','08018a78','080187c6','080187ce','080187d4']),
 ('TPP08','Main-thread batch cache update separate from fast input protection',['0801463e','08014646','08010952','0801482a','080148ea','0801491a','0801494a','0801497a','0801497e']),
 ('TPP09','Counter latch differs from current direction and has conditional5001-check clear',['0800a158','0800a160','0800a16a','0800a16e','0800a178'])]
save('EVIDENCE_MAP.json',{'namespace_notice':'Local claim IDs, not REA MCP IDs',
    'claims':[{'id':i,'claim':c,'instruction_sources':[source(a) for a in aa]} for i,c,aa in claims]})
save('COVERAGE.json',{'mode':'static_readonly_noanalysis','runs':4,'export_files':export_files,
    'verified_raw_tables':'9 vector entries and4 TBB entries (RAW_FACTS.json)',
    'closed':['direct position counter/update branches and TBB mapping','GPIO IRQ and10-check poll acceptance paths','recognized boot/endpoint overwrites',
       'DMA buffer producer/config and completion IRQ','done-marker rearm handshake','processed-cache consumer gate'],
    'unclosed':['arbitrary pointer aliases / bulk memory writes','NVIC/GPIO/EXTI init and nesting schedule','all configuration writers',
       'full147DE/149C0/floating-point processing','allflash-save triggers and power loss atomicity','full downstream stop/protection actions',
       'real clock period/sample rate and physical sensor function'],
    'decompiler_boundary':'Shared tails are merged into Ghidra owners. Actual incoming argument and branch path control reachability; apparent function owner is not sufficient.',
    'skipped_target':'pass3/08017492.txt had no function, no inference made from it',
    'physical_actions':False,'network_requests':False,'device_execution':False,
    'numerical_validation':'BYTE_VALIDATION.json; byte identity does not independently prove all semantic interpretations'})
print('Built position/protection/evidence/coverage indexes')
