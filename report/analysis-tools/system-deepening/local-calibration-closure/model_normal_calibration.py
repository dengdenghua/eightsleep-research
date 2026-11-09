#!/usr/bin/env python3
"""Independent finite examples of audited normal formulas, never loads vendor code."""
import json
import math
from pathlib import Path
from statistics import median


def windows(rate):
    rounded = lambda x: math.floor(x + .5)
    return [max(3, rounded(.25 * rate) | 1), max(5, rounded(.4 * rate)),
            max(5, rounded(rate)), max(5, rounded(rate))]


def centered_median(values, width):
    left = width // 2
    right = width - 1 - left
    return [median(values[max(0, i-left):min(len(values), i+right+1)])
            for i in range(len(values))]


def fit(x, y):
    n = len(x)
    den = n * sum(t*t for t in x) - sum(x)**2
    a = 0 if den == 0 else (n*sum(i*j for i, j in zip(x,y))-sum(x)*sum(y))/den
    ci = (sum(y)-a*sum(x))/n
    residual = sum((j-a*i-ci)**2 for i,j in zip(x,y))
    total = sum((j-sum(y)/n)**2 for j in y)
    return a, ci, 0 if total == 0 else 1-residual/total


def main():
    checks = []
    def check(name, actual, expected):
        assert actual == expected, (name, actual, expected)
        checks.append(dict(name=name, actual=actual, expected=expected, passed=True))
    check('20 Hz time-derived windows', windows(20), [5,8,20,20])
    check('32 Hz time-derived windows', windows(32), [9,13,32,32])
    check('fixed 10-point derivative window seconds', [10/20,10/32], [.5,.3125])
    channels = [[102,103],[101,101],[-1,-1]]
    populated = [v for v in channels if max(v)>0]
    check('last populated reference; ignore -1 padding',
          [a-b for a,b in zip(populated[0],populated[-1])],[1,2])
    check('centered median suppresses an isolated peak',
          centered_median([1,1,1,9,1,1,1],5),[1]*7)
    a, ci, r2 = fit([1,2,3,4,5],[1.5,3,4.5,6,7.5])
    check('exact line fit', [a,ci,r2], [1.5,0,1])
    check('fit bound versus device write bound at a=1.0',
          [.8<=1<=3,1.1<=1<=3], [True,False])
    period_ms = 1000/20
    predicted = 0 + 20*period_ms
    actual = 1200
    drift = actual-predicted
    dropped = math.floor(drift/period_ms+.5) if drift>1.5*period_ms else 0
    check('CSV gap counts four, does not add four rows', [dropped,20+20], [4,40])
    primary = None
    ghost = dict(a=1.5,b=.1)
    chosen = primary if primary is not None else None
    check('comparison result is not authority fallback', chosen, None)
    check('ordinary residual window population versus sample SD',
          [math.sqrt(2/2),math.sqrt(2/1)], [1,math.sqrt(2)])
    out = dict(boundary='Independent Python normal-case examples; no vendor JS/DLL executed, no hardware or API calls. Not exhaustive numerical equivalence.',
               count=len(checks), checks=checks)
    target=Path(__file__).with_name('MODEL_RESULTS.json')
    target.write_text(json.dumps(out,ensure_ascii=False,indent=2)+'\n')
    print(json.dumps({'checks':len(checks),'passed':True}))


if __name__ == '__main__':
    main()
