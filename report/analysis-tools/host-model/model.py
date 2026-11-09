#!/usr/bin/env python3
"""Bounded reconstruction of Frank mapper -> queue -> buzzer loader.

NOT original firmware execution. Sequential event order supplied by caller;
shared masks are explicit scenario configuration, not recovered deployment.
ADC/IMU payload represented by provenance tokens. Only buzzer staging is modeled;
IMU/extADC/multi-channel early-break interactions and async suspension are excluded.
"""
from __future__ import annotations
from dataclasses import dataclass,field,asdict
from collections import Counter
import json
from pathlib import Path

U32=0xffffffff
SLOTS=500

def u32(x):return x & U32

@dataclass
class Shared:
    bits:int=0

@dataclass
class Timing:
    shared:Shared
    consume_mask:int
    notify_mask:int
    previous:int=0
    initialized:bool=False
    count:int=0
    anchor_epoch:int=0
    anchor_tick:int=0

    def map(self,tick,now):
        tick=u32(tick)
        copy=self.previous!=0 and u32(tick-self.previous)==4
        check=not self.initialized
        if self.initialized:
            self.count=u32(self.count+1)
            check=self.count>=1000 or tick<self.previous
            if check:self.count=0
        reasons=[];error=None;before=self.shared.bits
        if check:
            if not self.initialized:
                self.anchor_epoch,self.anchor_tick=now,tick
                self.initialized=True
                reasons.append('initial')
                error=0
            else:
                predicted=u32(self.anchor_epoch+u32(tick-self.anchor_tick)//1000)
                error=abs(predicted-now)
                if error>2:
                    self.anchor_epoch,self.anchor_tick=now,tick
                    self.shared.bits=u32(self.shared.bits|self.notify_mask)
                    reasons.append('drift_gt_2s')
            # 0021a474 after drift OR; same check may consume its own mask.
            if self.shared.bits & self.consume_mask:
                self.anchor_epoch,self.anchor_tick=now,tick
                self.shared.bits=u32(self.shared.bits & ~self.consume_mask)
                reasons.append('shared_request')
        self.previous=tick
        relative=u32(tick-self.anchor_tick)
        return {'epoch':u32(self.anchor_epoch+relative//1000),'relative':relative,
                'copy':copy,'check':check,'reasons':reasons,'error':error,
                'sync_before':before,'sync_after':self.shared.bits}

@dataclass
class Sample:
    token:str
    source:str
    side:int
    epoch:int
    relative:int
    copied:bool=False
    @property
    def slot(self):return (self.relative%1000)//2

@dataclass
class Pipeline:
    enabled:tuple=(True,True)
    masks:tuple=((1,2),(2,1))
    shared:Shared=field(default_factory=Shared)
    buckets:list=field(default_factory=lambda:[{},{}])
    watermark:int|None=None
    old_count:int=0
    ignored_epoch:int|None=None
    samples:dict=field(default_factory=dict)
    disposition:dict=field(default_factory=dict)
    events:list=field(default_factory=list)
    outputs:list=field(default_factory=list)
    counter:int=0
    auto_flush:bool=True

    def __post_init__(self):
        self.timing=[Timing(self.shared,*m) for m in self.masks]

    def mark(self,s,reason,**kw):
        self.disposition[s.token]=reason
        self.events.append({'token':s.token,'source':s.source,'side':s.side,'reason':reason,**kw})

    def register(self,s):
        if s.token in self.samples:raise ValueError('duplicate token')
        self.samples[s.token]=s
        self.disposition[s.token]='pending'

    def ready(self):
        a,b=map(len,self.buckets)
        if self.enabled==(True,False):return a>=3
        if self.enabled==(False,True):return b>=3
        if self.enabled==(True,True):return (a>=3 and b>=3) or a>=10 or b>=10
        return False

    def ingest(self,side,tick,now,source=None):
        self.counter+=1
        source=source or f's{self.counter}'
        m=self.timing[side].map(tick,now)
        self.events.append({'mapping_source':source,**m})
        records=[]
        if m['copy']:
            # Caller adjusts relative only, preserving current epoch even at crossing.
            records.append(Sample(source+'/copy',source,side,m['epoch'],u32(m['relative']-2),True))
        records.append(Sample(source+'/real',source,side,m['epoch'],m['relative']))
        for s in records:self.offer(s)
        return m

    def offer(self,s):
        self.register(s)
        if self.auto_flush and self.ready():self.flush()
        reason=self.enqueue(s)
        if reason=='capacity':
            self.flush()
            reason=self.enqueue(s)  # state 6 retries once; no fake infinite drain
        if reason=='capacity':self.mark(s,'capacity_retry_failed')

    def enqueue(self,s):
        e=s.epoch
        if self.ignored_epoch is not None:
            if e==self.ignored_epoch:
                self.mark(s,'reset_epoch_skip');return 'skip'
            self.ignored_epoch=None
        if self.watermark is not None and e<=self.watermark:
            if self.watermark-e>30:
                self.old_count=u32(self.old_count+1)
                if self.old_count>499:
                    for side in self.buckets:
                        for bucket in side.values():
                            for old in bucket.values():self.mark(old,'reset_cleared_pending')
                    self.buckets=[{},{}];self.watermark=None;self.old_count=0
                    self.ignored_epoch=e
                    self.mark(s,'old_500_reset');return 'skip'
            self.mark(s,'watermark_skip');return 'skip'
        self.old_count=0
        side=self.buckets[s.side]
        if side and e<min(side):
            self.mark(s,'older_than_pending_min');return 'skip'
        if e not in side:
            if len(side)>=10:return 'capacity'
            side[e]={}
        bucket=side[e]
        if s.slot in bucket:self.mark(bucket[s.slot],'input_slot_overwritten',replacement=s.token)
        bucket[s.slot]=s
        self.mark(s,'pending',epoch=e,slot=s.slot)
        return 'inserted'

    def primary(self):
        if self.enabled==(False,True):return 1
        if self.enabled==(True,False):return 0
        return 0 if len(self.buckets[0])>=len(self.buckets[1]) else 1

    def flush(self):
        primary=self.primary();other=1-primary
        if not self.buckets[primary]:return None
        key=min(self.buckets[primary]);paired=self.enabled==(True,True) and key in self.buckets[other]
        sides=[primary,other] if paired else [primary]
        epoch_out=0;rows={};processed=set();break_at=None
        for i in range(SLOTS):
            p=self.buckets[primary][key].get(i)
            epoch=0 if p is None else p.epoch
            relative=0 if p is None else p.relative
            if epoch_out!=epoch:
                if epoch_out!=0:
                    break_at=i;break
                epoch_out=epoch
            destination=(relative%1000)//2
            for side in (0,1):
                s=self.buckets[side][key].get(i) if side in sides else None
                k=(side,destination)
                old=rows.get(k)
                if old is not None:
                    self.mark(old,'output_slot_overwritten',replacement=None if s is None else s.token)
                rows[k]=s
                if s is not None:
                    processed.add(s.token);self.mark(s,'buzzer_staged',output_epoch=epoch_out,output_slot=destination)
        for side in sides:
            bucket=self.buckets[side].pop(key)
            for s in bucket.values():
                if s.token not in processed:self.mark(s,'loader_unvisited_bucket_deleted',break_at=break_at)
        self.watermark=key if self.watermark is None else max(self.watermark,key)
        output={'bucket':key,'primary':primary,'paired':paired,'output_epoch':epoch_out,'break_at':break_at,
                'watermark':self.watermark,'points':[{'side':k[0],'slot':k[1],**asdict(s)} for k,s in sorted(rows.items()) if s is not None]}
        self.outputs.append(output)
        self.events.append({'flush':len(self.outputs)-1,'bucket':key,'primary':primary,'paired':paired,'break_at':break_at,'watermark':self.watermark})
        # Fresh staging buffer models 001f1730 reset after each encoding attempt.
        return output

    def audit(self):
        pending={s.token for side in self.buckets for b in side.values() for s in b.values()}
        assert pending=={t for t,d in self.disposition.items() if d=='pending'}
        staged={point['token'] for out in self.outputs for point in out['points']}
        assert staged=={t for t,d in self.disposition.items() if d=='buzzer_staged'}
        assert set(self.samples)==set(self.disposition)
        return {'tokens':len(self.samples),'source_records':len({s.source for s in self.samples.values()}),
                'copied_tokens':sum(s.copied for s in self.samples.values()),
                'dispositions':dict(Counter(self.disposition.values())), 'output_batches':len(self.outputs),
                'staged_tokens':len(staged),'pending_tokens':len(pending), 'watermark':self.watermark}

    def evidence(self):
        return {'audit':self.audit(),'scenario_masks':self.masks,'events':self.events,
                'outputs':self.outputs,'samples':{k:asdict(v) for k,v in self.samples.items()},
                'final_dispositions':self.disposition}
