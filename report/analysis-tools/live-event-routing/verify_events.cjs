'use strict';
const fs=require('fs'),path=require('path'),vm=require('vm'),crypto=require('crypto'),assert=require('assert');
const root=__dirname,ledger=JSON.parse(fs.readFileSync(path.join(root,'SOURCE_LEDGER.json')));
for(const s of ledger.sources){const b=fs.readFileSync(path.join(root,s.copy));assert.equal(crypto.createHash('sha256').update(b).digest('hex'),s.sha256);}
function method(file,name){const text=fs.readFileSync(path.join(root,'source',file),'utf8');const begin=text.indexOf('    async '+name+'(');assert(begin>=0);const end=text.indexOf('\n    }',begin)+6;assert(end>begin);return text.slice(begin,end);}
const unit='class Selected {'+method('loop_coordinator.js','processGesture')+method('loop_coordinator.js','tryNotifyDoubleTap')+method('device_api.js','doubleTap')+'}\nSelected';
const Type=vm.runInNewContext(unit,{Buffer});
(async()=>{
 const results=[];
 async function test(name,fn){await fn();results.push({name,result:'PASS'});}
 function client(){const c=new Type();c.logger={info(){}};c.variableValues={};return c;}
 await test('first snapshot establishes baseline without notification',async()=>{const c=client(),state={},sent=[];c.variableValues.doubleTap=JSON.stringify({l:12,r:2,s:0});await c.processGesture('doubleTap',state,async d=>sent.push(d));assert.equal(sent.length,0);assert.equal(state.l,12);});
 await test('unchanged snapshot emits nothing',async()=>{const c=client(),state={l:12,r:2,s:0};c.variableValues.doubleTap=JSON.stringify(state);await c.processGesture('doubleTap',state,async()=>{throw Error('unexpected notify');});});
 await test('increasing side sends absolute value, not numerical difference',async()=>{const c=client(),state={l:12,r:2,s:0},sent=[];c.variableValues.doubleTap=JSON.stringify({l:15,r:2,s:0});await c.processGesture('doubleTap',state,async d=>sent.push(d));assert.equal(JSON.stringify(sent),JSON.stringify([{l:15}]));assert.equal(state.l,15);});
 await test('only decreases retain previous comparison baseline',async()=>{const c=client(),state={l:12,r:2,s:0};c.variableValues.doubleTap=JSON.stringify({l:1,r:1,s:0});await c.processGesture('doubleTap',state,async()=>{throw Error('unexpected notify');});assert.equal(state.l,12);assert.equal(state.r,2);});
 await test('absent notifier consumes update; unchanged value not replayed after bind',async()=>{const c=client(),state={l:12,r:2,s:0},sent=[];c.variableValues.doubleTap=JSON.stringify({l:15,r:2,s:0});await c.processGesture('doubleTap',state,c.tryNotifyDoubleTap.bind(c));assert.equal(state.l,15);c.doubleTapNotification=async d=>sent.push(d);await c.processGesture('doubleTap',state,c.tryNotifyDoubleTap.bind(c));assert.equal(sent.length,0);});
 await test('rejected notifier does not advance comparison baseline',async()=>{const c=client(),state={l:12,r:2,s:0};c.variableValues.doubleTap=JSON.stringify({l:15,r:2,s:0});await assert.rejects(()=>c.processGesture('doubleTap',state,async()=>{throw Error('synthetic failure');}));assert.equal(state.l,12);});
 await test('original doubleTap sends protocol POST /E/gesture/doubletap and JSON body',async()=>{const c=client(),sent=[];c.protocol={sendMessage:async d=>sent.push(d)};await c.doubleTap({l:15});assert.equal(sent.length,1);assert.equal(sent[0].method,'post');assert.equal(sent[0].path,'/E/gesture/doubletap');assert.equal(sent[0].payload.toString(),'{"l":15}');});
 const result={result:'PASS',cases:results.length,tests:results,scope:'Selected original methods only, synthetic inputs and mocked protocol. No cloud or device execution. Route belongs to device protocol, not an established browser REST endpoint.'};fs.writeFileSync(path.join(root,'METHOD_VERIFICATION.json'),JSON.stringify(result,null,2)+'\n');console.log(JSON.stringify(result));
})().catch(e=>{console.error(e.message);process.exitCode=1;});
