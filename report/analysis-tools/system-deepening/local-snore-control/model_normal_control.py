#!/usr/bin/env python3
"""Finite independent examples of ordinary local joint control; no device calls."""
import json
from pathlib import Path


def next_power(power, speed):
    if speed is None:
        return power
    if speed <= 1.5:
        return power + 5
    if speed > 5:
        return max(power * .8, 8)
    return power


def single_left(requested, other):
    left, right = requested, other
    delta = left-right
    if abs(delta)>10:
        if delta>0:
            right=left-10
        else:
            left=right-10
    return [left,right]


def main():
    checks=[]
    def check(name, actual, expected):
        assert actual==expected,(name,actual,expected)
        checks.append(dict(name=name,actual=actual,expected=expected,passed=True))
    check('no speed retains initial 8',next_power(8,None),8)
    check('1.5 inclusive increases by five',next_power(8,1.5),13)
    check('5 inclusive keeps current power',next_power(13,5),13)
    check('over five applies reduction',next_power(20,6),16)
    check('reduction has minimum eight',next_power(8,6),8)
    check('left request thirty, other ten',single_left(30,10),[30,20])
    check('left request five, other thirty',single_left(5,30),[20,30])
    check('exact ten degree difference remains',single_left(20,10),[20,10])
    positions=[(2,10),(3,12),(4,14),(5,16),(6,18)]
    check('five recorded points span four seconds',abs((positions[-1][1]-positions[-5][1])/(positions[-1][0]-positions[-5][0])),2)
    def torso(degrees):
        a=int(degrees)
        if a==0:return 0
        if a<=20:return int(a*25.59+21.39)
        return 533+(a-20)*1720//40
    check('software angle map at 0/20/60', [torso(a) for a in [0,20,60]],[0,533,2253])
    check('fractional angle truncation before lookup',torso(20.9),torso(20))
    result=dict(boundary='Independent normal-case formula examples; not vendor execution, full simulation, physical units or hardware validation.',count=len(checks),checks=checks)
    Path(__file__).with_name('MODEL_RESULTS.json').write_text(json.dumps(result,ensure_ascii=False,indent=2)+'\n')
    print(json.dumps({'checks':len(checks),'passed':True}))


if __name__=='__main__':main()
