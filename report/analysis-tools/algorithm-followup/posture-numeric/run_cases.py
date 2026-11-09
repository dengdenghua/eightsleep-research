"""Finite analyst model, signed24 accepted samples, IEEE float32 each operation.
No physical device execution; nearest-even host IEEE arithmetic is assumed.
"""
from pathlib import Path
import struct,json
from fractions import Fraction
f=lambda x:struct.unpack('<f',struct.pack('<f',x))[0]
def process(xs):
 ring=[0.]*5;s=0.;rows=[]
 for i,x in enumerate(xs):
  assert -8388608<=x<=8388607
  j=i%5;s=f(s+f(f(x)-ring[j]));ring[j]=f(x)
  if j==4:
   exact=Fraction(sum(xs[i-4:i+1]),5)
   rows.append({'sum_f32':s,'output':int(f(s/f(5))),'exact_mean':str(exact),'ideal_trunc':int(exact),'output_difference':int(f(s/5))-int(exact)})
 return rows
cases=[]
for name,xs,expected in [
 ('small_positive',[1,1,1,1,0],[0]),
 ('small_negative',[-1,-1,-1,-1,0],[0]),
 ('max_constant',[8388607]*5,[8388607]),
 ('large_then_zeros',[8388607]*5+[0]*5,[8388607,0]),
 ('history_changes_next_small_group',[-8388608,8388606,8388606,8388607,8388606]+[1]*5,[5033163,0]),
 ('fresh_small_group',[1]*5,[1])]:
 rows=process(xs)
 # Explicit expected outputs independent of the generated report.
 assert [v['output'] for v in rows]==expected,(name,rows,expected)
 cases.append({'name':name,'input':xs,'expected_outputs':expected,'rows':rows})
Path(__file__).with_name('RESULTS.json').write_text(json.dumps({'result':'PASS','cases':cases,'scope':'Six synthetic finite numeric sequences, no empirical occurrence/error distribution. IEEE round-to-nearest-even assumed; original software helpers not executed.'},indent=2)+'\n')
print('PASS six numeric sequences')
