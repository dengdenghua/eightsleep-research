#!/usr/bin/env python3
"""Finite independent model of stable-anchor grouping; no shipped code runs."""
import json
from collections import deque
from pathlib import Path


def group(packets):
    """Stable epoch/tick anchor=0; no clock drift, wrap, concurrency or I/O."""
    pending_ts = None
    pending = []
    emitted = []
    for tick, frequency, values in packets:
        if frequency == 0:
            continue
        step = 1000 // frequency
        for i, value in enumerate(values):
            second = (tick + i * step) // 1000
            if pending_ts is not None and second != pending_ts:
                emitted.append((pending_ts, pending))
                pending = []
            pending_ts = second
            pending.append(value)
    return emitted, (pending_ts, pending)


def main():
    checks = []
    def verify(name, actual, expected):
        assert actual == expected, (name, actual, expected)
        checks.append(dict(name=name, actual=actual, expected=expected, passed=True))
    verify('20Hz_cross_second', group([(0,20,list(range(21)))]), ([(0,list(range(20)))],(1,[20])))
    verify('exact_second_end_retained', group([(0,20,list(range(20)))]), ([],(0,list(range(20)))))
    verify('missing_seconds_not_inserted', group([(0,20,[1]),(3000,20,[2])]), ([(0,[1])],(3,[2])))
    verify('same_tick_duplicates_appended', group([(0,20,[1]),(0,20,[1])]), ([],(0,[1,1])))
    verify('zero_frequency_ignored', group([(0,0,[1])]), ([],(None,[])))
    verify('60Hz_integer_step', (1000//60)*59, 944)
    q=deque(maxlen=1000)
    for x in range(1001):q.append(x)
    verify('configured_drop_oldest_reference', [len(q),q[0],q[-1]], [1000,1,1000])
    out={'scope':'Independent normal models; queue uses deque as reference, not shipped .NET execution. Stable anchor only, not full SensorTiming.','count':len(checks),'checks':checks}
    Path(__file__).with_name('MODEL_RESULTS.json').write_text(json.dumps(out,ensure_ascii=False,indent=2)+'\n')
    print(json.dumps({'passed':True,'count':len(checks)}))


if __name__=='__main__':main()
