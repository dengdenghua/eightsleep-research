#!/usr/bin/env python3
"""Check exported LSDA coverage and intraprocedural cleanup flow; static only."""
from pathlib import Path
import json,re,sys

BASE=Path(__file__).resolve().parents[1]
def main():
    metadata=json.loads((BASE/'UNWIND_MAP.json').read_text())
    mainfde=next(x for x in metadata['selected'] if x['function_ghidra']=='0x179600')
    functions={}
    for path in sorted((BASE/'pass3').glob('range-*.asm.txt')):
        instructions={}
        for line in path.read_text().splitlines():
            address,raw,asm=line.split(' ',2)
            assert asm!='UNDECODED',line
            instructions[int(address,16)]={'raw':raw,'asm':asm}
        start=min(instructions);end=max(instructions)+4
        assert len(instructions)==(end-start)//4
        functions[start]=(path,instructions)
    rows=[];errors=[]
    for fde in metadata['selected']:
        start=int(fde['function_ghidra'],16)
        if start not in functions:continue
        path,ins=functions[start]
        if len(ins)*4!=fde['size']:errors.append('FDE extent mismatch '+fde['function_ghidra'])
        for call in fde.get('call_sites',[]):
            lo=int(call['start_ghidra'],16);hi=lo+call['length'];pad=call['landing_pad_ghidra']
            if not all(x in ins for x in range(lo,hi,4)):errors.append('Missing protected bytes '+hex(lo))
            if pad and int(pad,16) not in ins:errors.append('Missing landing pad '+pad)
        rows.append({'function':fde['function_ghidra'],'range_file':str(path.relative_to(BASE)),
                     'bytes':len(ins)*4,'callsite_records':len(fde.get('call_sites',[])),
                     'landing_pad_records':sum(bool(x['landing_pad_ghidra']) for x in fde.get('call_sites',[]))})
    path,ins=functions[0x179600]
    # Known PLT no-return calls from the retained symbol/ref evidence.
    noreturn={0x1739d0:'std::terminate',0x174cb0:'_Unwind_Resume',0x173a90:'__stack_chk_fail',0x173ae0:'std::__throw_bad_alloc',0x175154:'local throw bad_alloc',0x1748e0:'__cxa_rethrow'}
    stop_store=0x17a19c;normal_first_stop=0x17a184
    audits=[]
    for pad in sorted({int(x['landing_pad_ghidra'],16) for x in mainfde['call_sites'] if x['landing_pad_ghidra']}):
        todo=[pad];visited=set();calls={};exits=[];unknown=[]
        while todo:
            at=todo.pop()
            if at in visited:continue
            visited.add(at)
            if at not in ins:unknown.append(hex(at));continue
            asm=ins[at]['asm'];mnemonic=asm.split(' ',1)[0]
            target_match=re.search(r'0x([0-9a-f]+)$',asm)
            target=int(target_match.group(1),16) if target_match else None
            if mnemonic in ('ret','retab','retaa'):exits.append({'at':hex(at),'kind':'return'});continue
            if mnemonic=='bl':
                calls[hex(at)]={'target':hex(target),'noreturn':target in noreturn}
                if target in noreturn:exits.append({'at':hex(at),'kind':noreturn[target]});continue
            elif mnemonic=='blr':calls[hex(at)]={'target':'indirect','noreturn':'not determined'}
            elif mnemonic=='b':
                todo.append(target);continue
            elif mnemonic.startswith('b.') or mnemonic in ('cbz','cbnz','tbz','tbnz'):
                if target is None:unknown.append(hex(at))
                else:todo.append(target)
            elif mnemonic in ('br','braa','brab'):
                unknown.append(hex(at));continue
            todo.append(at+4)
        audits.append({'landing_pad':hex(pad),'nodes_reached':len(visited),'reaches_normal_worker_stop_store':stop_store in visited,
                       'reaches_normal_subsystem_stop_call':normal_first_stop in visited,
                       'calls':calls,'exits':exits,'unresolved_flow':unknown})
    if any(x['unresolved_flow'] for x in audits):errors.append('Unresolved intraprocedural control flow')
    result={'schema':'eightsleep.frank.cleanup-flow.v1','covered_functions':rows,
            'main_landing_pads':audits,'all_main_landing_pads_bypass_normal_worker_stop':all(not x['reaches_normal_worker_stop_store'] for x in audits),
            'errors':errors,'ok':not errors,
            'assumptions':['Calls are treated as returning normally unless listed as known noreturn.',
                           'Conditional branch alternatives are both retained; this does not prove each is realizable.',
                           'Indirect cleanup calls are recorded, not recursively resolved by this checker.',
                           'LSDA is parsed from original ELF bytes; this is not observed exception execution.']}
    (BASE/'LIFECYCLE_FLOW_CHECK.json').write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps({'ok':result['ok'],'main_landing_pads':len(audits),'all_bypass_normal_worker_stop':result['all_main_landing_pads_bypass_normal_worker_stop'],'errors':errors}))
    raise SystemExit(0 if not errors else 1)

if __name__=='__main__':main()
