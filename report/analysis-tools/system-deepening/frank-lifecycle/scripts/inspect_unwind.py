#!/usr/bin/env python3
"""Read targeted ELF64 .eh_frame / LSDA metadata without executing its code."""
import argparse, hashlib, json, struct
from pathlib import Path

EXPECTED='84727b57ef8b226c78618f9fa9257df7d8ae771c78d8a51e6f3cabf0acc0c375'

def main():
    ap=argparse.ArgumentParser(description=__doc__)
    ap.add_argument('elf',type=Path);ap.add_argument('output',type=Path)
    ap.add_argument('functions',nargs='+',type=lambda x:int(x,16)-0x100000)
    args=ap.parse_args();blob=args.elf.read_bytes()
    assert hashlib.sha256(blob).hexdigest()==EXPECTED
    shoff=struct.unpack_from('<Q',blob,40)[0];ents,num,stringidx=struct.unpack_from('<HHH',blob,58)
    headers=[struct.unpack_from('<IIQQQQIIQQ',blob,shoff+i*ents) for i in range(num)]
    h=headers[stringidx];names=blob[h[4]:h[4]+h[5]]
    sections={names[h[0]:].split(b'\0',1)[0].decode():h for h in headers}
    def offset(va):
        for h in headers:
            if h[1]!=8 and h[3]<=va<h[3]+h[5]:return h[4]+va-h[3]
        raise ValueError('Unmapped VA '+hex(va))
    def leb(pos,signed=False):
        n=0;shift=0
        while True:
            value=blob[pos];pos+=1;n|=(value&127)<<shift;shift+=7
            if value<128:break
            if shift>70:raise ValueError('invalid LEB')
        if signed and value&64:n-=1<<shift
        return n,pos
    def encoded(pos,enc,base_va=0,base_off=0):
        field_va=base_va+pos-base_off
        form=enc&15
        if form==1:v,end=leb(pos)
        elif form==9:v,end=leb(pos,True)
        else:
            fmt={0:'Q',2:'H',3:'I',4:'Q',10:'h',11:'i',12:'q'}[form]
            v=struct.unpack_from('<'+fmt,blob,pos)[0];end=pos+struct.calcsize(fmt)
        mode=enc&0x70
        if mode==0x10:v+=field_va
        elif mode!=0:raise ValueError('Unsupported EH application '+hex(enc))
        return v,end
    eh=sections['.eh_frame'];start=eh[4];end=start+eh[5];cies={};fdes=[];pos=start
    while pos<end:
        record=pos;length=struct.unpack_from('<I',blob,pos)[0];pos+=4
        if not length:break
        assert length!=0xffffffff
        stop=pos+length;idpos=pos;ident=struct.unpack_from('<I',blob,pos)[0];pos+=4
        if ident==0:
            version=blob[pos];pos+=1;ae=blob.index(0,pos);aug=blob[pos:ae].decode();pos=ae+1
            code,pos=leb(pos);data,pos=leb(pos,True)
            if version==1:reg=blob[pos];pos+=1
            else:reg,pos=leb(pos)
            cie={'record_offset':record,'augmentation':aug,'fde_encoding':0,'lsda_encoding':255,'version':version}
            if aug.startswith('z'):
                lengthaug,pos=leb(pos);astop=pos+lengthaug
                for c in aug[1:]:
                    if c=='L':cie['lsda_encoding']=blob[pos];pos+=1
                    elif c=='R':cie['fde_encoding']=blob[pos];pos+=1
                    elif c=='P':
                        enc=blob[pos];pos+=1;person,pos=encoded(pos,enc,eh[3],eh[4]);cie['personality_pointer_value']=hex(person);cie['personality_encoding']=hex(enc)
                    elif c=='S':pass
                    else:raise ValueError('Unsupported CIE augmentation '+c)
                assert pos<=astop;pos=astop
            cies[record]=cie
        else:
            cie=cies[idpos-ident]
            loc,pos=encoded(pos,cie['fde_encoding'],eh[3],eh[4])
            size,pos=encoded(pos,cie['fde_encoding']&15)
            fde={'function_ghidra':hex(loc+0x100000),'elf_start':loc,'size':size,'fde_file_offset':record,'cie':cie}
            if cie['augmentation'].startswith('z'):
                lengthaug,pos=leb(pos);astop=pos+lengthaug
                if cie['lsda_encoding']!=255 and lengthaug:
                    lsda,pos=encoded(pos,cie['lsda_encoding'],eh[3],eh[4]);fde['lsda_elf_va']=lsda
                assert pos<=astop
            fdes.append(fde)
        pos=stop
    selected=[]
    for fde in fdes:
        if not any(fde['elf_start']<=q<fde['elf_start']+fde['size'] for q in args.functions):continue
        if 'lsda_elf_va' in fde:
            lsda=fde['lsda_elf_va'];lp=offset(lsda);pos=lp
            lpenc=blob[pos];pos+=1
            if lpenc==255:lpstart=fde['elf_start']
            else:lpstart,pos=encoded(pos,lpenc,lsda,lp)
            ttenc=blob[pos];pos+=1
            ttable=None
            if ttenc!=255:ttdist,pos=leb(pos);ttable=pos+ttdist
            csenc=blob[pos];pos+=1;cslen,pos=leb(pos);csend=pos+cslen;rows=[]
            while pos<csend:
                st,pos=encoded(pos,csenc);ln,pos=encoded(pos,csenc);land,pos=encoded(pos,csenc);act,pos=leb(pos)
                chain=[]
                if act:
                    a=csend+act-1;seen=set()
                    while a not in seen:
                        seen.add(a);filt,after=leb(a,True);jump,nxt=leb(after,True)
                        chain.append({'file_offset':a,'type_filter':filt,'next_relative_to_displacement':jump})
                        if not jump:break
                        a=after+jump
                rows.append({'start_ghidra':hex(lpstart+st+0x100000),'length':ln,'landing_pad_ghidra':hex(lpstart+land+0x100000) if land else None,'action_index':act,'action_chain':chain})
            assert pos==csend
            fde.update(lsda_file_offset=lp,lpstart_ghidra=hex(lpstart+0x100000),callsite_encoding=hex(csenc),type_encoding=hex(ttenc),type_table_file_offset=ttable,call_sites=rows,lsda_header_and_callsites_hex=blob[lp:csend].hex())
        selected.append(fde)
    # Dynamic relocation entries are needed to verify relocated pointer tables independently.
    relocs={}
    rela=sections.get('.rela.dyn')
    if rela:
        for pos in range(rela[4],rela[4]+rela[5],rela[9]):
            target,info,addend=struct.unpack_from('<QQq',blob,pos)
            if target in range(0x48e3c8,0x48e408,8):
                relocs[hex(target+0x100000)]={'file_offset':pos,'type':info&0xffffffff,'symbol_index':info>>32,'addend':hex(addend),'expected_ghidra_pointer':hex(addend+0x100000)}
    result={'schema':'eightsleep.frank.target-unwind.v1','input_sha256':EXPECTED,'requested_ghidra':[hex(x+0x100000) for x in args.functions],'total_fdes_parsed':len(fdes),'selected':selected,'thread_vtable_relocations':relocs,'limits':['Static unwind metadata is not an execution trace.','Type filters are retained numerically; no arbitrary library type resolution is claimed.','Only requested FDE ranges and direct call-site/action records are interpreted.']}
    args.output.write_text(json.dumps(result,ensure_ascii=False,indent=2)+'\n')
    print(json.dumps({'fdes':len(fdes),'selected':len(selected),'call_sites':sum(len(x.get('call_sites',[])) for x in selected),'vtable_relocations':len(relocs)}))

if __name__=='__main__':main()
