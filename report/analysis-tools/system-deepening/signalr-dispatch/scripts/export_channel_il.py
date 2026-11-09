from pathlib import Path
import subprocess, json, hashlib
from concurrent.futures import ThreadPoolExecutor
R=Path('/Users/dangbei/Downloads/eightsleep-firmware-research-20261107')
B=R/'analysis/system-deepening-20261108/signalr-dispatch'
S=R/'analysis/sleep-pipeline'
dotnet=S/'tools/dotnet/dotnet'
ilspy=S/'tools/ilspy/tools/net10.0/any/ilspycmd.dll'
items=[
 ('BackgroundService.il.txt','Microsoft.Extensions.Hosting.Abstractions.dll','Microsoft.Extensions.Hosting.BackgroundService',True),
 ('Channel.il.txt','System.Threading.Channels.dll','System.Threading.Channels.Channel',True),
 ('UnboundedChannel.il.txt','System.Threading.Channels.dll','System.Threading.Channels.UnboundedChannel`1',True),
]
(B/'exports').mkdir(exist_ok=True)
def run(item):
 name,asm,typename,il=item
 args=[str(dotnet),str(ilspy),'--disable-updatecheck']
 if il:args+=['--ilcode']
 args+=['--type',typename,str(S/'capybara-bundle'/asm)]
 p=subprocess.run(args,stdout=subprocess.PIPE,stderr=subprocess.PIPE)
 (B/'exports'/name).write_bytes(p.stdout)
 (B/'exports'/(name+'.stderr.txt')).write_bytes(p.stderr)
 return {'command':args,'exit_code':p.returncode,'output':'exports/'+name,'output_bytes':len(p.stdout),'output_sha256':hashlib.sha256(p.stdout).hexdigest(),'input_bytes':(S/'capybara-bundle'/asm).stat().st_size,'input_sha256':hashlib.sha256((S/'capybara-bundle'/asm).read_bytes()).hexdigest()}
with ThreadPoolExecutor(max_workers=3) as e:results=list(e.map(run,items))
(B/'EXPORT_COMMANDS_PASS3.json').write_text(json.dumps({'execution_boundary':'ILSpy static type export; targets not executed; update checks disabled','exports':results},indent=2)+'\n')
print(json.dumps([{'output':r['output'],'exit_code':r['exit_code'],'bytes':r['output_bytes']} for r in results]))
assert all(r['exit_code']==0 for r in results)
