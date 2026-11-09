#!/usr/bin/env python3
"""Evidence-bound Python reconstruction, NOT firmware execution.

Mapping/buckets reuse previous_model.py. Four buffers, metadata, selected coroutine
states and real-format CBOR bytes are reconstructed from SOURCE_MAP.json evidence.
No physical timing, scheduler fairness, network ACK or cloud algorithm is measured.
"""
from __future__ import annotations
from dataclasses import dataclass, field, asdict
from collections import Counter
from pathlib import Path
import struct,hashlib,importlib.util
import previous_model as previous

_encoder_path=Path(__file__).resolve().parent.parent/'cbor-encoder'/'encode_buffers.py'
_spec=importlib.util.spec_from_file_location('host_cbor_encoder',_encoder_path)
_codec=importlib.util.module_from_spec(_spec);_spec.loader.exec_module(_codec)

U32=previous.U32
Shared=previous.Shared
Timing=previous.Timing
PRODUCTION_MASKS=((1,2),(2,1))  # ELF globals 005e0048 / 005e0060
ADC_MISSING=0x7fffffff
IMU_MISSING=0x7fff

@dataclass
class Sample(previous.Sample):
    adc:tuple=tuple(range(16))
    imu:tuple=tuple(range(24))
    version:int=1

@dataclass
class Buffer:
    name:str
    epoch:int=0
    flags:int=-1
    count:int=0
    rows:dict=field(default_factory=dict)
    metadata:dict=field(default_factory=dict)

    def accept(self,epoch):
        # flags==0 && epoch matches, OR empty epoch==0; flags alone do not reset.
        if self.flags==0 and self.epoch==epoch:
            self.count+=1; return True
        if self.epoch==0:
            self.flags=0;self.epoch=epoch;self.count+=1;return True
        return False

    def snapshot(self):
        return {'epoch':self.epoch,'flags':self.flags,'count':self.count,
                'metadata':{k:list(v) if isinstance(v,list) else v for k,v in self.metadata.items()},
                'points':[v for _,v in sorted(self.rows.items())],
                'unwritten_cells':'sentinel',
                'shape':{'buzzer':[2,5,500],'imu':[2,24,100],
                         'multi':[2,2,500],'extadc':[4,500]}[self.name],
                'sentinel':IMU_MISSING if self.name=='imu' else ADC_MISSING}

    def reset_after_encode(self):
        self.epoch=0;self.count=0;self.rows={}

@dataclass
class Pipeline(previous.Pipeline):
    compat:bool=True

    def __post_init__(self):
        super().__post_init__()
        self.buffers={n:Buffer(n) for n in ('buzzer','imu','extadc','multi')}
        self.loads=[];self.contributions={};self.jobs={};self.gate_owner=None
        self.gains=[{'buzzer':[400]*5,'multi':[400]*2,'extadc':400} for _ in (0,1)]
        for n,b in self.buffers.items():
            b.metadata=({'adc':1,'gains':[0,0]} if n=='extadc' else
                        {'versions':[1,1],**({} if n=='imu' else
                         {'gains':[[400]*(5 if n=='buzzer' else 2) for _ in (0,1)]})})
        self.wire_payloads=[]

    def register(self,s):
        super().register(s)
        self.contributions[s.token]=[]

    def ingest(self,side,tick,now,source=None,adc=None,imu=None,version=1):
        self.counter+=1;source=source or f's{self.counter}'
        m=self.timing[side].map(tick,now)
        self.events.append({'mapping_source':source,**m})
        payload={'version':version}
        if adc is not None:payload['adc']=tuple(adc)
        if imu is not None:payload['imu']=tuple(imu)
        if m['copy']:
            self.offer(Sample(source+'/copy',source,side,m['epoch'],
                              previous.u32(m['relative']-2),True,**payload))
        self.offer(Sample(source+'/real',source,side,m['epoch'],m['relative'],**payload))
        return m

    def set_gains(self,side,buzzer=None,multi=None,extadc=None):
        """Supply current side config fields sync+side*0x20+0x78/+0x82/+0x84.
        This input boundary does not claim a physical ADC gain actually changed.
        """
        for name,value,count in [('buzzer',buzzer,5),('multi',multi,2),('extadc',extadc,1)]:
            if value is None:continue
            vals=[value] if count==1 else list(value)
            if len(vals)!=count or any(v<0 or v>65535 for v in vals):raise ValueError('gain must fit uint16')
            self.gains[side][name]=vals[0] if count==1 else vals
        self.events.append({'event':'side_gain_fields_changed','side':side,
                            'gains':{k:list(v) if isinstance(v,list) else v for k,v in self.gains[side].items()}})

    def stage(self,name,index,epoch,relative,samples,load_id):
        b=self.buffers[name]
        if not b.accept(epoch):
            self.events.append({'loader':load_id,'index':index,'buffer':name,
                                'event':'reject','sample_epoch':epoch,'buffer_epoch':b.epoch,'flags':b.flags})
            return False
        primary,paired=self._load_context
        versions=[1 if s is None else s.version&0xffff for s in samples]
        if not paired:versions=[versions[primary]]*2
        before=dict(b.metadata)
        if name=='extadc':
            gains=[self.gains[s]['extadc'] for s in (0,1)] if paired else [self.gains[primary]['extadc']]*2
            b.metadata={'adc':0x41,'gains':gains}
        elif name=='imu':b.metadata={'versions':versions}
        else:
            width=5 if name=='buzzer' else 2
            b.metadata={'versions':versions,'gains':[list(self.gains[s][name]) if paired or s==primary else
                                                   [400]*width for s in (0,1)]}
        if before!=b.metadata:
            self.events.append({'event':'buffer_metadata_changed','stream':name,'index':index,'load':load_id,
                                'before':before,'after':dict(b.metadata)})
        dest=(relative%1000)//(10 if name=='imu' else 2)
        for side,s in enumerate(samples):
            token=None if s is None else s.token
            missing=IMU_MISSING if name=='imu' else ADC_MISSING
            values=([missing]*{'buzzer':5,'imu':24,'extadc':2,'multi':2}[name] if s is None else
                    (list(s.imu) if name=='imu' else
                     list(s.adc[8:13]) if name=='buzzer' else
                     list(s.adc[14:16]) if name=='multi' else [s.adc[13],s.adc[13]]))
            row={'side':side,'slot':dest,'token':token,'source':None if s is None else s.source,
                 'copied':False if s is None else s.copied,'input_index':index,
                 'source_epoch':0 if s is None else s.epoch,
                 'source_relative':0 if s is None else s.relative,'values':values,'load':load_id}
            row['source_version']=1 if s is None else s.version&0xffff
            key=(side,dest)
            old=b.rows.get(key)
            if old and old['token']:
                self.contributions[old['token']].append({'stream':name,'event':'output_overwritten',
                                                       'slot':dest,'by':token,'load':load_id})
            b.rows[key]=row
            if s:
                self.contributions[token].append({'stream':name,'event':'staged','slot':dest,'load':load_id})
        return True

    def load(self):
        primary=self.primary();other=1-primary
        if not self.buckets[primary]:return None
        key=min(self.buckets[primary]);paired=self.enabled==(True,True) and key in self.buckets[other]
        sides=[primary,other] if paired else [primary]
        self._load_context=(primary,paired)
        lid=len(self.loads);visited=set();stop=None;stop_mask=0;attempts=Counter()
        for i in range(500):
            samples=[self.buckets[s][key].get(i) if s in sides else None for s in (0,1)]
            p=samples[primary];epoch=0 if p is None else p.epoch;relative=0 if p is None else p.relative
            for s in samples:
                if s:visited.add(s.token)
            mask=0
            attempts['buzzer']+=1
            if not self.stage('buzzer',i,epoch,relative,samples,lid):mask|=1
            if i%5==0:
                attempts['imu']+=1
                if not self.stage('imu',i,epoch,relative,samples,lid):
                    mask|=2
                    if not self.compat:stop=i;stop_mask=mask;break
            if self.compat:
                attempts['extadc']+=1
                if not self.stage('extadc',i,epoch,relative,samples,lid):mask|=4
                attempts['multi']+=1
                if not self.stage('multi',i,epoch,relative,samples,lid):mask|=8
            if mask:stop=i;stop_mask=mask;break
        for side in sides:
            bucket=self.buckets[side].pop(key)
            for s in bucket.values():
                writes=[c for c in self.contributions[s.token] if c['event']=='staged']
                self.mark(s,'bucket_consumed' if writes else
                          'loader_visited_no_stream_accepted' if s.token in visited else
                          'loader_unvisited_bucket_deleted',load=lid,break_at=stop)
        self.watermark=key if self.watermark is None else max(self.watermark,key)
        out={'load':lid,'bucket':key,'primary':primary,'paired':paired,'break_at':stop,
             'break_mask':stop_mask,'attempts':dict(attempts),'watermark':self.watermark,
             'streams':{n:b.snapshot() for n,b in self.buffers.items() if self.compat or n in ('buzzer','imu')}}
        self.loads.append(out);self.events.append({k:v for k,v in out.items() if k!='streams'})
        return out

    def buffer_ram(self,name):
        """Build the exact byte layout consumed by the independently recovered codec."""
        b=self.buffers[name]
        size={'buzzer':0x4e50,'imu':0x25a0,'multi':0x1f68,'extadc':0x1f58}[name]
        ram=bytearray(size);width={'buzzer':5,'imu':24,'multi':2,'extadc':2}[name]
        count=100 if name=='imu' else 500
        def location(side,ch,slot):
            if name=='buzzer':return 8+side*10000+ch*2000+slot*4
            if name=='imu':return 8+side*4800+ch*200+slot*2
            if name=='multi':return 8+side*4000+ch*2000+slot*4
            return (side+ch*2)*2000+slot*4
        form='<H' if name=='imu' else '<I';mask=0xffff if name=='imu' else U32
        for side in (0,1):
            for ch in range(width):
                for slot in range(count):struct.pack_into(form,ram,location(side,ch,slot),IMU_MISSING if name=='imu' else ADC_MISSING)
        for row in b.rows.values():
            for ch,value in enumerate(row['values']):struct.pack_into(form,ram,location(row['side'],ch,row['slot']),value&mask)
        flagoff,epochoff,countoff={'buzzer':(0x4e28,0x4e2c,0x4e38),'imu':(0x2588,0x258c,0x2598),
                                  'multi':(0x1f48,0x1f4c,0x1f58),'extadc':(0x1f48,0x1f4c,0x1f54)}[name]
        for off,value in [(flagoff,b.flags),(epochoff,b.epoch),(countoff,b.count)]:struct.pack_into('<I',ram,off,value&U32)
        meta=b.metadata
        if name=='extadc':
            struct.pack_into('<II',ram,0x1f40,*meta['gains']);struct.pack_into('<I',ram,0x1f50,meta['adc'])
        else:
            off={'buzzer':0x4e30,'imu':0x2590,'multi':0x1f50}[name]
            struct.pack_into('<II',ram,off,*meta['versions'])
            if name!='imu':
                off=0x4e3c if name=='buzzer' else 0x1f5c
                flat=meta['gains'][0]+meta['gains'][1]
                struct.pack_into('<'+'H'*len(flat),ram,off,*flat)
        return bytes(ram)

    def encode(self,fail_streams=(),include_extadc=True):
        # encodeChunkBody calls each encoder even when an earlier bool was false.
        names=['buzzer','imu']+(['multi'] if self.compat else [])+(['extadc'] if self.compat and include_extadc else [])
        main_ok=not any(n in fail_streams for n in names if n!='extadc')
        batch={'attempt':len(self.outputs),'kind':'synthetic_encoder_result_not_wire_bytes',
               'stealth_body_ok':main_ok,'streams':{}}
        payloads={}
        for n in names:
            b=self.buffers[n];snap=b.snapshot()
            own_ok=n not in fail_streams
            snap['encoder_ok']=own_ok
            snap['body_available']=own_ok if n=='extadc' else main_ok
            reference=getattr(_codec,n)(self.buffer_ram(n))
            payloads[n]=reference if snap['body_available'] else None
            snap['cbor_bytes']=len(reference) if snap['body_available'] else 0
            snap['cbor_sha256']=hashlib.sha256(reference).hexdigest() if snap['body_available'] else None
            for row in snap['points']:
                if row['token']:
                    self.contributions[row['token']].append({'stream':n,'event':
                        'body_candidate' if snap['body_available'] else 'encode_body_dropped',
                        'slot':row['slot'],'attempt':batch['attempt']})
            batch['streams'][n]=snap;b.reset_after_encode()
        batch['extadc_independent_body']=self.compat and include_extadc
        payloads['stealth']=b''.join(payloads[n] for n in names if n!='extadc') if main_ok else None
        self.wire_payloads.append(payloads)
        batch['kind']='synthetic_CBOREncoder_bytes_not_firmware_execution_or_network_capture'
        self.outputs.append(batch);return batch

    def flush(self,fail_streams=()):
        loaded=self.load()
        encoded=self.encode(fail_streams)
        return {'load':loaded,'encoded':encoded}

    def begin_offer(self,s):
        """Enter 001ea774 state2; explicitly stop at its await boundary."""
        self.register(s);jid='job'+str(len(self.jobs))
        self.jobs[jid]={'sample':s,'state':'check','resume':None,'retry_tick':None}
        self._continue(jid);return jid

    def _continue(self,jid,retry=False):
        j=self.jobs[jid];s=j['sample']
        if not retry and self.ready():
            j.update(state='waiting',resume='preflush',retry_tick=None)
            self.mark(s,'coroutine_waiting_preflush',job=jid);return
        result=self.enqueue(s)
        if result=='capacity' and not retry:
            j.update(state='waiting',resume='capacity',retry_tick=None)
            self.mark(s,'coroutine_waiting_capacity',job=jid);return
        if result=='capacity':self.mark(s,'capacity_retry_failed')
        j['state']='done'

    def poll_gate(self,jid,steady_tick=0,wall_tick=0):
        """002010f0: CAS byte 0->1; busy -> steady now + 50000 then retry."""
        j=self.jobs[jid]
        if j['state']!='waiting':raise ValueError('job is not awaiting gate')
        if j['retry_tick'] is not None and steady_tick<j['retry_tick']:
            return 'timer_pending'
        if self.gate_owner is not None:
            j['retry_tick']=min((1<<63)-1,steady_tick+50000)
            self.events.append({'job':jid,'event':'gate_busy_timer','retry_tick':j['retry_tick']})
            return 'waiting'
        self.gate_owner=jid;j['state']='acquired';j['retry_tick']=None
        self.events.append({'job':jid,'event':'gate_acquired','wall_tick':wall_tick})
        return 'acquired'

    def resume_offer(self,jid,fail_streams=()):
        j=self.jobs[jid]
        if j['state']!='acquired' or self.gate_owner!=jid:raise ValueError('gate not acquired')
        result=self.flush(fail_streams)
        self.gate_owner=None
        self.events.append({'job':jid,'event':'gate_released'})
        retry=j['resume']=='capacity'
        self._continue(jid,retry=retry)
        return result

    def fail_wait(self,jid):
        """Timer exception before acquiring gate propagates through 001f58c0.

        This models only the data-plane consequence, not C++ destructor/allocator
        behavior or cancellation after a successful acquisition.
        """
        j=self.jobs[jid]
        if j['state']!='waiting':raise ValueError('only pre-acquisition wait failure is modeled')
        j['state']='done';j['retry_tick']=None
        self.mark(j['sample'],'wait_exception_before_enqueue',job=jid)

    def cancel_offer(self,jid):
        """Explicit destructor entry at the outer await boundary (state4/6).
        001ea774 odd state5/7 destroys children without gate-release store;
        001f8d90/002010f0 destructor paths likewise do not undo successful CAS.
        Reachability/timing on a live scheduler is not inferred from this injection.
        """
        j=self.jobs[jid]
        if j['state'] not in ('waiting','acquired'):raise ValueError('cancel only at modeled await boundary')
        held=self.gate_owner==jid;j['state']='done';j['retry_tick']=None
        self.mark(j['sample'],'cancelled_after_gate_acquire' if held else 'cancelled_before_gate_acquire',job=jid)
        self.events.append({'job':jid,'event':'coroutine_destroyed','gate_left_set':held})

    def fail_publish_allocation(self,jid):
        """Inject 001e9390 post-encode bad_alloc, then destroy outer await frame.
        No arbitrary C++ unwind ABI or live failure frequency is inferred.
        """
        j=self.jobs[jid]
        if j['state']!='acquired' or self.gate_owner!=jid:raise ValueError('acquire gate first')
        self.load();out=self.encode(include_extadc=False)
        out['publish_allocation']='injected_failure_before_NATS_queue'
        self.cancel_offer(jid)
        self.mark(j['sample'],'publish_allocation_exception_after_encoder',job=jid)
        return out

    def audit(self):
        bucket_tokens={s.token for side in self.buckets for b in side.values() for s in b.values()}
        waiting={j['sample'].token for j in self.jobs.values() if j['state']!='done'}
        assert bucket_tokens=={t for t,d in self.disposition.items() if d=='pending'}
        assert set(self.samples)==set(self.disposition)==set(self.contributions)
        candidates=Counter();staged=Counter();dropped=Counter()
        for t,cs in self.contributions.items():
            for c in cs:
                if c['event']=='body_candidate':candidates[c['stream']]+=1
                if c['event']=='staged':staged[c['stream']]+=1
                if c['event']=='encode_body_dropped':dropped[c['stream']]+=1
        for output in self.outputs:
            for name,b in output['streams'].items():
                for row in b['points']:
                    if row['token'] is None:continue
                    s=self.samples[row['token']]
                    assert s.source==row['source'] and s.copied==row['copied']
                    assert row['side']==s.side
                    assert any(c['event'] in ('body_candidate','encode_body_dropped') and
                               c['stream']==name and c['attempt']==output['attempt'] and
                               c['slot']==row['slot'] for c in self.contributions[s.token])
        return {'tokens':len(self.samples),'source_records':len({s.source for s in self.samples.values()}),
                'copied_tokens':sum(s.copied for s in self.samples.values()),
                'dispositions':dict(Counter(self.disposition.values())),
                'pending_tokens':len(bucket_tokens),'waiting_tokens':len(waiting),
                'output_batches':len(self.outputs),'loads':len(self.loads),'watermark':self.watermark,
                'staged_row_writes':dict(staged),'body_candidate_rows':dict(candidates),
                'encode_dropped_rows':dict(dropped)}

    def evidence(self):
        return {'audit':self.audit(),'production_masks':self.masks,'compat':self.compat,
                'events':self.events,'loads':self.loads,'outputs':self.outputs,
                'samples':{t:asdict(s) for t,s in self.samples.items()},
                'final_dispositions':self.disposition,'contributions':self.contributions,
                'jobs':{k:{**v,'sample':v['sample'].token} for k,v in self.jobs.items()},
                'gate_owner':self.gate_owner}

def production_pairs(**kwargs):
    """Two separately allocated shared atomics in 0017a7b0, not one global bus."""
    return {n:Pipeline(masks=PRODUCTION_MASKS,shared=Shared(),**kwargs) for n in ('sensor','pillow')}
