from pathlib import Path
import hashlib,json
B=Path(__file__).resolve().parents[1]
def h(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def write(name,value):(B/name).write_text(json.dumps(value,ensure_ascii=False,indent=2)+'\n')
client='source/Eight.DeviceApiClient/Eight.DeviceApiClient/Client.cs'
derived='source/Eight.Capybara.DeviceApi/Eight.Capybara.DeviceApi/DeviceAPIService.cs'
ext='source/Eight.Capybara.DeviceApi/Eight.Capybara.DeviceApi/DeviceApiExtensions.cs'
request='source/Eight.DeviceProtocol/Eight.DeviceProtocol/Request.cs'
# Explicit anchors are hashes + lines in retained evidence, not synthetic disassembler IDs.
claims=[('SR-01','同一连接双注册与两份不同字段、订阅返回值丢弃',[(client,'hubConnection.On("Request"'),(derived,': base(hubConnection, router, logger)'),(derived,'hubConnection.On("Request"'),('exports/Client.il.txt','IL_0043: pop'),('exports/DeviceAPIService.il.txt','IL_004f: pop'),('exports/Client.il.txt','Client::serverRequests'),('exports/DeviceAPIService.il.txt','DeviceAPIService::serverRequests')]),
('SR-02','同名handler追加与逐项调用；共享参数对象而非深拷贝', [('exports/HubConnectionExtensions.cs','public static IDisposable On<T1>(this HubConnection hubConnection, string methodName, Func<T1, Task> handler)'),('exports/HubConnection.cs','_invocationHandlers.Add(handler);'),('exports/HubConnection.cs','public virtual IDisposable On(string methodName, Type[] parameterTypes, Func<object?[], object, Task> handler'),('exports/HubConnection.cs','Task task = handler.InvokeAsync(invocation.Arguments);'),('exports/HubConnection.cs','await task.ConfigureAwait'),('exports/HubConnection.il.txt','end of method InvocationHandlerList::Add'),('exports/HubConnection.il.txt',"end of method '<DispatchInvocationAsync>d__85'::MoveNext"),(request,'public record Request')]),
('SR-03','正常host虚调用派生ExecuteAsync，只消费派生reader',[(ext,'services.AddHostedService<DeviceAPIService>();'),('exports/BackgroundService.il.txt','callvirt instance class [System.Runtime]System.Threading.Tasks.Task Microsoft.Extensions.Hosting.BackgroundService::ExecuteAsync'),(derived,'ProcessRequests(serverRequests.Reader, stoppingToken);'),('exports/DeviceAPIService.il.txt','IL_002e: ldfld'),('exports/DeviceAPIService.il.txt','IL_003e: call instance'),(client,'await ProcessRequests(serverRequests.Reader, stoppingToken);'),(client,'await foreach (Request item in requests.ReadAllAsync(cancellation))')]),
('SR-04','无界通道存储与基类请求保留路径', [('exports/Channel.cs','return new UnboundedChannel<T>(runContinuationsAsynchronously: true);'),('exports/UnboundedChannel.cs','parent._items.Enqueue(item);'),('exports/UnboundedChannel.cs','private readonly ConcurrentQueue<T> _items'),('exports/UnboundedChannel.cs','public override ValueTask WriteAsync(T item, CancellationToken cancellationToken)'),('exports/UnboundedChannel.cs','parent._items.TryDequeue'),('exports/UnboundedChannel.il.txt','end of method UnboundedChannelWriter::TryWrite'),('exports/UnboundedChannel.il.txt','end of method UnboundedChannelWriter::WriteAsync')]),
('SR-05','可见停止与重连不排空应用通道，正常重连不反复追加handler', [('exports/BackgroundService.cs','public virtual async Task StopAsync'),('exports/BackgroundService.cs','public virtual void Dispose'),('exports/HubConnection.cs','_handlerList.Remove(_handler);'),('exports/HubConnection.cs','_handlers.TryRemove(methodName'),('exports/HubConnection.cs','private async Task StopAsyncCore(bool disposing)'),(derived,'while (!stoppingToken.IsCancellationRequested)'),(derived,'await SetupConnection(linkedTokenSource.Token);'),('LIFECYCLE_REFERENCE_REVIEW.json','Full selected types only; no reflection or external runtime modification claim.')])]
evidence=[]
for cid,claim,refs in claims:
 out=[]
 for file,needle in refs:
  p=B/file;lines=[i for i,s in enumerate(p.read_text().splitlines(),1) if needle in s]
  assert lines,(file,needle)
  out.append({'file':file,'lines':lines,'locator':needle,'sha256':h(p)})
 evidence.append({'id':cid,'claim':claim,'references':out})
write('EVIDENCE_MAP.json',{'schema':'eightsleep.signalr.dispatch-evidence.v1','claims':evidence})
write('COVERAGE.json',{'schema':1,'status':'bounded static audit complete','completed':['same-connection registration preservation, field identity and discarded subscription handles','bundled SignalR handler-list and dispatch semantics','normal hosted virtual ExecuteAsync and only derived queue consumption','bundled channel storage / visible stop and reconnect behavior','original PE method ranges and all retained artifacts hashing'],'not_observed':['current device assembly identity','actual request volume, queue count, memory size or crash','cloud authorization / phone reachability','heap final reachability after DI/runtime shutdown'],'not_exhaustive':['external reflection or plugins','all DI container internals and arbitrary runtime callbacks'],'execution':'Static ILSpy export and local file checks only; no target execution or traffic.'})
inputs={}
commands=[]
for cf in sorted(B.glob('EXPORT_COMMANDS*.json')):
 d=json.loads(cf.read_text())
 for e in d['exports']:
  assert e['exit_code']==0
  p=Path(e['command'][-1]);assert h(p)==e['input_sha256'];assert h(B/e['output'])==e['output_sha256']
  assert not (B/(e['output']+'.stderr.txt')).read_bytes()
  inputs[str(p)]={'path':str(p),'bytes':p.stat().st_size,'sha256':h(p),'role':'original target assembly'}
  for t in e['command'][:2]:
   p=Path(t);inputs[str(p)]={'path':str(p),'bytes':p.stat().st_size,'sha256':h(p),'role':'static export tool'}
  commands.append(e)
for e in json.loads((B/'COPIED_SOURCES.json').read_text()):
 p=Path(e['origin']);assert h(p)==e['sha256']==h(B/e['path'])
 inputs[str(p)]={'path':str(p),'bytes':p.stat().st_size,'sha256':h(p),'role':'prior decompilation source copied byte-for-byte'}
raw=json.loads((B/'RAW_METHOD_RANGES.json').read_text());assert raw['all_ranges_consistent']
write('VALIDATION.json',{'ok':True,'static_exports':len(commands),'copied_sources':5,'target_assemblies':5,'all_exit_codes_zero':True,'all_stderr_empty':True,'all_exported_hashes_match':True,'all_copied_sources_match':True,'all_evidence_locations_present':True,'pe_method_header_code_ranges_consistent':raw['exported_method_count'],'scope':'Consistency/provenance validation, not dynamic behavior reproduction or independent IL operand decoding.'})
outputs=[{'path':str(p.relative_to(B)),'bytes':p.stat().st_size,'sha256':h(p)} for p in sorted(B.rglob('*')) if p.is_file() and p.name!='SOURCE_MANIFEST.json' and not p.name.startswith('._') and '__pycache__' not in p.parts]
write('SOURCE_MANIFEST.json',{'schema':'eightsleep.signalr.dispatch-source-manifest.v1','inputs':list(inputs.values()),'outputs':outputs,'self_exclusion':'SOURCE_MANIFEST.json cannot self-hash; host ._* and Python caches excluded.','frozen_baseline':'Original diagnostics/ files were not edited.'})
print(json.dumps({'ok':True,'outputs':len(outputs),'inputs':len(inputs),'claims':len(evidence),'exported_method_ranges':raw['exported_method_count']}))
