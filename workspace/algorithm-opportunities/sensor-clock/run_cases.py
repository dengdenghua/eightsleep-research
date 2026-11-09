"""Finite arithmetic reference from recovered clock decoding, not RCC execution."""
from pathlib import Path
import json
rows=[]
for hz,pre in [(16000000,0x10),(32000000,0x30),(8000000,0)]:
 m=((pre&0x70)>>4)+1;n=24;r=(0x40000000>>29)+1
 out=((hz//m)*n)//r
 assert out==64000000
 for step in [1,10]:
  cycles=out//(1000//step);load=cycles-1
  assert load=={1:63999,10:639999}[step]
  assert cycles*1000==out*step
  rows.append({'input_hz_variable':hz,'pll_m':m,'pll_n':n,'pll_r':r,'decoded_hz':out,'tick_step':step,'systick_load':load,'nominal_ms':step})
# A read-modify-frequency failure does not undo the variable; this is a code-order
# observation retained in FINDINGS, not simulated hardware behavior here.
Path(__file__).with_name('MODEL_RESULTS.json').write_text(json.dumps({'result':'PASS','cases_count':len(rows),'cases':rows,'scope':'Selected successful configurations and integer reload arithmetic only. No oscillator, lock, failed switching or interrupt simulation.'},indent=2)+'\n')
print('PASS',len(rows),'arithmetic cases')
