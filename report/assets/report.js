'use strict';
const DATA=JSON.parse(document.getElementById('report-data').textContent);
const main=document.getElementById('content');
const esc=v=>String(v??'').replace(/[&<>"']/g,c=>({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[c]));
const statusLabel={recovered:'已恢复本段逻辑',partial:'部分恢复',boundary:'缺生产实现'};
const layerLabel={hardware:'硬件',device:'设备本地',cloud:'云端接口与策略',unlocated:'跨端 / 部署待定',app:'手机 App',operations:'系统维护'};
const stateLabel={completed:'限定验收通过',ready:'可继续静态分析','needs-device':'需实机验证','needs-artifact':'需补充材料'};
const byId=Object.fromEntries(DATA.modules.map(m=>[m.id,m]));
const termById=Object.fromEntries(DATA.terms.map(t=>[t.id,t]));
const aliasIndex=new Map();
DATA.terms.forEach(t=>[t.term,...t.aliases].forEach(a=>{if(a.length>1&&!aliasIndex.has(a.toLowerCase()))aliasIndex.set(a.toLowerCase(),t.id);}));
const termPattern=new RegExp([...aliasIndex.keys()].sort((a,b)=>b.length-a.length).map(x=>x.replace(/[.*+?^${}()|[\]\\]/g,'\\$&')).join('|'),'gi');
let moduleFilter='all',taskState='all',taskPriority='all',taskModule='all',flowId='signal',flowStep=0,algorithmId='front';
const badge=(kind,text)=>`<span class="pill ${esc(kind)}">${esc(text)}</span>`;
const moduleLink=id=>`#wiki/modules/${encodeURIComponent(id)}`;
function heading(kicker,title,lead=''){return `<div class="eyebrow">${esc(kicker)}</div><h1>${esc(title)}</h1>${lead?`<p class="lead">${esc(lead)}</p>`:''}`;}
function moduleCard(m){return `<article class="card"><div class="meta"><span class="ordinal">${String(DATA.modules.indexOf(m)+1).padStart(2,'0')} / ${esc(layerLabel[m.layer])}</span>${badge(m.status,statusLabel[m.status])}</div><h3><a href="${moduleLink(m.id)}">${esc(m.title)}</a></h3><p>${esc(m.summary)}</p><a class="module-link" href="${moduleLink(m.id)}">阅读模块解读 ↗</a></article>`;}
function boundaryCards(){return `<div class="grid-3">${DATA.boundaries.map(b=>`<article class="card bound-card ${b.kind}"><div class="tagline">${b.kind==='local'?'DEVICE':b.kind==='remote'?'RESULT SURFACE':'IMPLEMENTATION GAP'}</div><h3>${esc(b.title)}</h3><p>${esc(b.body)}</p><a class="module-link" href="${moduleLink(b.module)}">查看对应证据 →</a></article>`).join('')}</div>`;}
function systemMap(){
  const node=(id,x,y,w,title,sub,unknown=false)=>`<a class="node" href="${moduleLink(id)}" aria-label="${esc(title)}"><rect x="${x}" y="${y}" width="${w}" height="72" rx="9" fill="${unknown?'#fff8e9':'#f4f9f4'}" stroke="${unknown?'#bf934a':'#bdd1c4'}" ${unknown?'stroke-dasharray="5 4"':''}/><text x="${x+14}" y="${y+29}" fill="#203c37" font-size="15" font-weight="600">${esc(title)}</text><text x="${x+14}" y="${y+51}" fill="#617c70" font-size="11">${esc(sub)}</text></a>`;
  return `<div class="map-panel"><svg viewBox="0 0 1040 540" role="img" aria-labelledby="map-title map-desc"><title id="map-title">已确认链路与部署待定算法</title><desc id="map-desc">已确认采集、整理上传、云端结果接口和App消费。核心生理算法及自动目标生成另列为部署待定，不以其在图中的位置推断计算位置。</desc><defs><marker id="arrow" viewBox="0 0 10 10" refX="9" refY="5" markerWidth="7" markerHeight="7" orient="auto"><path d="M 0 0 L 10 5 L 0 10 z" fill="#278c7c"/></marker></defs>
  <g font-size="11" fill="#849489" letter-spacing="2"><text x="20" y="20">感知与执行</text><text x="295" y="20">MT8365 主控</text><text x="600" y="20">云端接口</text><text x="850" y="20">手机 APP</text></g>
  <g fill="none" stroke="#dde5da" stroke-dasharray="3 6"><path d="M264 35 V365"/><path d="M565 35 V365"/><path d="M820 35 V365"/></g>
  <g fill="none" stroke="#278c7c" stroke-width="1.6" marker-end="url(#arrow)"><path d="M230 91 H295"/><path d="M405 127 V163"/><path d="M515 199 H548 V91 H600"/><path d="M785 199 H850 V91"/><path d="M850 310 H785"/><path d="M600 310 H515"/><path d="M295 310 H230"/></g>
  <path d="M692 127 V163" fill="none" stroke="#b28a44" stroke-width="1.6" stroke-dasharray="5 4"/>
  ${node('sensor-mcu',20,55,210,'传感采集 MCU','采样 · 换算 · 缓存 · 封包')}${node('host-signal',295,55,220,'主控整理数据','时间映射 · 双侧归并')}${node('raw-upload',295,163,220,'缓存、发布与上传','Frank · NATS · uploader')}${node('cloud-api',600,55,185,'原始数据接收入口','已恢复上传协议边界')}${node('cloud-api',600,163,185,'生理结果接口','交付 HR / RR / HRV / 分期')}${node('android-app',850,55,170,'结果解析与显示','裁剪 · 汇总 · 趋势')}${node('thermal',20,274,210,'热控及附件 MCU','反馈 · 限幅 · 执行')}${node('offline-state',295,274,220,'设备侧控制服务','目标路由 · 状态持久化')}${node('autopilot',600,274,185,'设置与目标接口','手动设置 / 推荐结果')}${node('android-app',850,274,170,'手机控制入口','设置 · 日程 · 反馈')}
  <text x="20" y="354" fill="#74877a" font-size="11">另含：附件机械控制 / 音频 / 诊断；部分控制具有 BLE 本地路径</text>
  <rect x="20" y="390" width="1000" height="125" rx="10" fill="#fff8e9" stroke="#bf934a" stroke-dasharray="5 4"/>
  <text x="40" y="418" fill="#9a7638" font-size="12">独立缺口区 · 不表示物理部署位置</text>
  <a href="${moduleLink('physiology-algorithms')}"><text x="40" y="451" fill="#203c37" font-size="15" font-weight="600">心搏 / 呼吸分离、HRV、融合、在床与分期 →</text></a>
  <a href="${moduleLink('autopilot')}"><text x="625" y="451" fill="#203c37" font-size="15" font-weight="600">Autopilot 目标生成 →</text></a>
  <text x="40" y="482" fill="#617c70" font-size="12">生产实现未取得，计算分工与部署待确认；云端接口交付结果不等于全部算法都在云端。</text>
  </svg><div class="map-caption"><span>实线：已恢复的主要连接</span><span class="uncertain">虚线：内部处理链未闭合</span><span>框图为职责示意，各箭头非同一次运行追踪</span></div></div>`;
}
function conclusionIndex(){
  return `<div class="table-scroll conclusion-index"><table><thead><tr><th>结论</th><th>主要证据类型</th><th>主章节</th></tr></thead><tbody>${DATA.conclusions.map(c=>`<tr><td><strong>${esc(c.id)}</strong> ${esc(c.title)}</td><td>${esc(c.types)}</td><td><a href="#wiki/${c.page}">技术说明 →</a></td></tr>`).join('')}</tbody></table></div><p><a href="#wiki/conclusions">查看逐项代码、模型、部署与实机验证状态 →</a></p>`;
}
function actionPriorities(){
  const groups=[{state:'ready',title:'现有材料可做',body:'SEN-06：追温度多出口编码与异常边界；C18：限定故障写入端。没有新入口时记录阻点。',link:'#task/SEN-06'}, {state:'needs-device',title:'设备具备条件后',body:'先绑定实机版本与配置，再做 API-01 短时 live 读取；主控访问是同源波形对照的额外条件。',link:'#task/API-01'}, {state:'needs-artifact',title:'取得新材料后',body:'优先审计已申请的官方导出；生产算法须取得对应程序、模型或可核验运行来源。',link:'#task/API-02'}];
  return `<section aria-label="优先行动"><div class="grid-3">${groups.map(g=>`<article class="card"><div class="tagline">${DATA.tasks.filter(t=>t.state===g.state).length} 项任务</div><h3>${g.title}</h3><p>${g.body}</p><a href="${g.link}">查看优先任务 →</a><button class="action-filter" data-action-state="${g.state}">筛选此类任务</button></article>`).join('')}</div><p><a href="#wiki/reverse-plan">行动顺序、交付与停止条件 →</a></p></section>`;
}
function overview(){
  main.innerHTML=`<div class="hero-head"><div>${heading('TECHNICAL ANALYSIS / 技术分析',DATA.title,DATA.subtitle)}</div><div class="stamp">REVIEWED<b>${DATA.modules.length}</b>MODULES</div></div><div class="summary-callout"><div class="small-title">阅读路径</div><p>先看系统架构，再进入处理算法或模块详解。<br>判断逆向深度时，分别核对代码、模型、部署与实机证据。</p></div><div class="stats"><div class="stat"><strong>${DATA.modules.length}</strong><span>系统模块</span></div><div class="stat"><strong>${DATA.evidence.length}</strong><span>来源证据记录</span></div><div class="stat"><strong>${DATA.tasks.length}</strong><span>分析与验证任务</span></div><div class="stat"><strong>${DATA.flows.length}</strong><span>主要数据与控制流</span></div></div>${latestResearchNote()}<div class="section-title"><h2>核心结论</h2><a href="#wiki/conclusions">验证状态 →</a></div>${conclusionIndex()}<div class="section-title"><h2>系统架构与数据流</h2><a href="#flows">逐步查看链路 →</a></div>${systemMap()}<div class="section-title"><h2>实现范围与证据边界</h2><a href="#boundaries">证据与版本边界 →</a></div>${boundaryCards()}<div class="section-title"><h2>模块索引</h2><a href="#modules">查看全部 ${DATA.modules.length} 个模块 →</a></div><div class="grid-3">${['sensor-mcu','host-signal','physiology-algorithms'].map(id=>moduleCard(byId[id])).join('')}</div><div class="note amber">样本内实现与用户实机的部署身份尚未完全绑定；静态恢复不等于实机验证。</div>`;
}
function modules(){
  main.innerHTML=heading('MODULES','模块详解','每页说明模块职责、调用链和代码证据。标记说明我们查清到哪一步，不是设备功能是否可用。')+`<div class="filters" aria-label="模块筛选">${[['all','全部模块'],...Object.entries(layerLabel)].map(([id,label])=>`<button data-layer="${id}" aria-pressed="${moduleFilter===id}">${esc(label)}</button>`).join('')}</div><div class="grid-3" id="module-grid">${DATA.modules.filter(m=>moduleFilter==='all'||m.layer===moduleFilter).map(moduleCard).join('')}</div>`;
  main.querySelectorAll('[data-layer]').forEach(b=>b.addEventListener('click',()=>{moduleFilter=b.dataset.layer;modules();}));decorateTerms(main);
}
function flows(){
  const flow=DATA.flows.find(f=>f.id===flowId);flowStep=Math.min(flowStep,flow.steps.length-1);
  const s=flow.steps[flowStep];
  main.innerHTML=heading('SYSTEM ARCHITECTURE','系统架构与链路','先选一种流程，再点步骤查看。虚线方框表示内部怎么做还不清楚，或还没在实机上验证。')+`<div class="filters">${DATA.flows.map(f=>`<button data-flow="${f.id}" aria-pressed="${flowId===f.id}">${esc(f.title)}</button>`).join('')}</div><h2>${esc(flow.title)}</h2><p class="lead">${esc(flow.intro)}</p><div class="flow-stack">${flow.steps.map((x,i)=>`<button class="flow-step ${x.unknown?'unknown':''} ${i===flowStep?'active':''}" data-step="${i}" aria-pressed="${i===flowStep}"><strong>${esc(x.label)}</strong><span>${esc(x.contract)}</span></button>`).join('')}</div><section class="detail-panel"><div class="eyebrow">STEP ${String(flowStep+1).padStart(2,'0')} / ${flow.steps.length}</div><h2>${esc(s.label.slice(3))}</h2><p>${esc(s.detail)}</p><a href="${moduleLink(s.module)}">查看「${esc(byId[s.module].title)}」完整 Wiki →</a></section><div class="note">这里根据文件和代码画出流程。不同操作可能走不同路线，目前还没有实机在线运行的完整记录。</div><a class="back-link" href="#wiki/architecture">阅读完整系统架构文档 ↗</a>`;
  main.querySelectorAll('[data-flow]').forEach(b=>b.addEventListener('click',()=>{flowId=b.dataset.flow;flowStep=0;flows();}));
  main.querySelectorAll('[data-step]').forEach(b=>b.addEventListener('click',()=>{flowStep=Number(b.dataset.step);flows();}));decorateTerms(main);
}
function scenario(id){
  const s=DATA.scenarios.find(x=>x.id===id);
  document.getElementById('scenario-result').innerHTML=`<p>${esc(s.condition)}</p>${[['左侧',s.leftInput,s.leftKept],['右侧',s.rightInput,s.rightKept]].map(([side,total,kept])=>`<div class="bar-row"><span>${side}</span><div class="bar" aria-label="${side}真实输入${total}，保留${kept}"><i style="width:${kept/total*100}%"></i></div><span class="bar-count">${kept} / ${total} 保留</span></div>`).join('')}<p>${esc(s.explanation)}</p>`;
}
function boundaries(){
  main.innerHTML=heading('EVIDENCE & VALIDATION','核心结论与验证范围','读代码、用假设数据演算、看服务器返回值、观察真实机器，是不同的查证方式。这一页分清哪些已知道，哪些还不知道。')+`${conclusionIndex()}<div class="note">代码恢复、有限模型、部署确认和实机验证分别验收。历史响应仅证明该次接口返回；不作为实体测量。</div><div style="margin-top:28px">${boundaryCards()}</div><div class="section-title"><h2>同样少了几条记录，为什么后果不同</h2>${badge('partial','合成模型 · 非实机')}</div><section class="scenario-box"><label for="scenario-select" class="tagline">用假设数据演示左右两侧怎样合并　</label><select id="scenario-select">${DATA.scenarios.map(s=>`<option value="${s.id}">${esc(s.title)}</option>`).join('')}</select><div id="scenario-result" style="margin-top:20px"></div><div class="tagline">绿色：保留的真实输入；浅色：未保留的真实输入。横轴按各侧输入数归一化。</div><a class="module-link" href="#evidence/analysis/device-side-followup/upload-distortion/FINDINGS_ZH.txt">查看算例条件与原报告 →</a></section><h2>各部分已经查到哪一步</h2><div class="table-scroll coverage-table"><table><thead><tr><th>模块</th><th>分析状态</th><th>主要缺口</th></tr></thead><tbody>${DATA.modules.map(m=>`<tr><td><a href="${moduleLink(m.id)}">${esc(m.title)}</a></td><td>${badge(m.status,statusLabel[m.status])}</td><td>${esc(m.unknowns[0]||'详见模块范围')}</td></tr>`).join('')}</tbody></table></div><div class="note amber">模型里的 500 槽、回调次数、时间阶跃等均是输入条件。它们不是硬件采样率测量、实际故障概率或医疗准确度。</div><a href="#wiki/evidence-method">完整证据方法与版本规则 →</a>`;
  document.getElementById('scenario-select').addEventListener('change',e=>scenario(e.target.value));scenario(DATA.scenarios[0].id);
}
function taskCard(t){return `<article class="card task"><header><span class="priority">${esc(t.priority)}</span><span>${esc(t.id)}</span>${badge(t.state,stateLabel[t.state])}</header><h3>${esc(t.title)}</h3>${t.state==='completed'?'<p class="task-scope">本项仅在所列范围内通过验收；部署和实机效果须另核。</p>':''}<details class="task-details" ${t.state==='completed'?'':'open'}><summary>${t.state==='completed'?'查看验收范围与证据':'分析目标、条件与验收'}</summary><dl><dt>分析目标</dt><dd>${esc(t.action)}</dd><dt>${t.state==='completed'?'验收范围':'前置条件'}</dt><dd>${esc(t.needs)}</dd><dt>验收标准</dt><dd>${esc(t.acceptance)}</dd></dl>${t.progress?`<p class="note"><strong>验证状态：</strong>${esc(t.progress)}</p>`:''}${t.result_page?`<p><a href="#wiki/${encodeURI(t.result_page)}">查看证据与验证结果 →</a></p>`:''}</details><a class="module-link" href="${moduleLink(t.module)}">${esc(byId[t.module].title)} ↗</a></article>`;}
function roadmap(){
  const tasks=DATA.tasks.filter(t=>(taskState==='all'||t.state===taskState)&&(taskPriority==='all'||t.priority===taskPriority)&&(taskModule==='all'||t.module===taskModule));
  main.innerHTML=heading('NEXT STEPS','任务与验收清单','任务按优先级、材料条件和验收状态组织。P0为主要缺口，P1为验证与实现补全，P2为补充分析。')+`${actionPriorities()}<div class="note">任务状态描述当前行动条件或限定验收结果，不代表模块完成率。<a href="#wiki/conclusions">核心结论的四维验证状态 →</a> · <a href="#wiki/reverse-plan">完整执行计划 →</a></div><p class="term-help">带虚线的词可以点开看解释。也可以打开 <a href="#terms">关键术语</a>。</p><div class="filters"><label for="task-state">条件</label><select id="task-state">${[['all','全部条件'],...Object.entries(stateLabel)].map(([v,l])=>`<option value="${v}" ${v===taskState?'selected':''}>${esc(l)}</option>`).join('')}</select><label for="task-priority">优先级</label><select id="task-priority">${['all','P0','P1','P2'].map(v=>`<option value="${v}" ${v===taskPriority?'selected':''}>${v==='all'?'全部优先级':v}</option>`).join('')}</select><label for="task-module">模块</label><select id="task-module"><option value="all">全部模块</option>${DATA.modules.map(m=>`<option value="${m.id}" ${m.id===taskModule?'selected':''}>${esc(m.title)}</option>`).join('')}</select><span class="result-count">${tasks.length} / ${DATA.tasks.length} 项</span></div><div class="tasks">${tasks.length?tasks.map(taskCard).join(''):'<div class="empty">当前组合没有任务，请调整筛选。</div>'}</div>`;
  main.querySelectorAll('[data-action-state]').forEach(b=>b.addEventListener('click',()=>{taskState=b.dataset.actionState;taskModule='all';taskPriority='all';roadmap();document.querySelector('.filters').scrollIntoView({behavior:'smooth'});}));
  [['task-state',v=>taskState=v],['task-priority',v=>taskPriority=v],['task-module',v=>taskModule=v]].forEach(([id,set])=>document.getElementById(id).addEventListener('change',e=>{set(e.target.value);roadmap();}));decorateTerms(main);
}
function latestResearchNote(){
  return `<div class="note reading-links"><a href="#wiki/index">报告目录 →</a><a href="#wiki/local-processing-20261108">处理与算法 →</a><a href="#wiki/conclusions">结论与验证 →</a><a href="#roadmap">执行计划 →</a><a href="#full-evidence">原始材料 →</a></div>`;
}

function fullMaterialUrl(item){
  if(!item)return '';
  try{
    const base=new URL(DATA.fullEvidence?.material_base||'http://127.0.0.1:58766/');
    if(base.origin!=='http://127.0.0.1:58766')return '';
    const raw=item.href||item.path;
    if(typeof raw!=='string'||!raw)return '';
    const url=new URL(raw,base);
    return url.origin===base.origin&&!url.username&&!url.password?url.href:'';
  }catch{return '';}
}
function fullMaterialLink(item,label){
  const url=fullMaterialUrl(item);
  return url?`<a href="${esc(url)}" target="_blank" rel="noopener">${esc(label||item.title)} ↗</a>`:`<span class="muted">${esc(label||item?.title||'材料')} · 未提供链接</span>`;
}
function fullBytes(bytes){
  if(typeof bytes!=='number'||!Number.isFinite(bytes))return '未记录';
  for(const [unit,label] of [[1073741824,'GiB'],[1048576,'MiB'],[1024,'KiB']])if(bytes>=unit)return (bytes/unit).toFixed(2)+' '+label;
  return bytes.toLocaleString('zh-CN')+' B';
}
const fullCount=v=>typeof v==='number'&&Number.isFinite(v)?v.toLocaleString('zh-CN'):'未记录';
function fullEvidenceRelation(e){
  const full=DATA.fullEvidence||{};
  const member=(full.evidence_map||[]).find(x=>x.source===e.source);
  if(!member){
    const fresh=(full.new_round?.evidence_sources||[]).includes(e.source);
    return {member:null,state:fresh?'new':'unmapped',label:fresh?' · 原完整包未收录':'未提供归档映射',kind:'partial'};
  }
  const transformed=Boolean(member.transformation&&member.transformation!=='none');
  const original=transformed?member.original_sha256:member.sha256;
  if(!original)return {member,state:'unknown',label:'归档源版本待核对',kind:'unknown'};
  if(original!==e.source_sha256)return {member,state:'changed',label:'归档与当前证据源版本不同',kind:'unknown'};
  return {member,state:'archived',label:transformed?'归档脱敏版本 · 源摘要一致':'已归档 · 源摘要一致',kind:'recovered'};
}
function fullEvidenceSourceNote(e){
  if(!DATA.fullEvidence)return '';
  const rel=fullEvidenceRelation(e);
  return `<div class="note">${badge(rel.kind,rel.label)} ${rel.member?`<span class="path">${esc(rel.member.archive_member)}</span>`:'<span>当前报告内的证据快照可直接阅读。</span>'}<br><a href="#full-evidence">在完整证据链中核对原包、目录与哈希 →</a></div>`;
}
function fullEvidence(){
  const full=DATA.fullEvidence;
  if(!full){main.innerHTML=heading('FULL EVIDENCE','完整证据链','材料清单未加载，请检查报告构建结果。')+'<a href="#evidence">返回证据索引 →</a>';return;}
  const pkg=full.package||{},android=full.android||{},round=full.new_round||{};
  const materials=full.materials||[],indexes=full.indexes||[];
  const relations=DATA.evidence.map(e=>({e,...fullEvidenceRelation(e)}));
  const fresh=relations.filter(x=>x.state==='new').length;
  const archived=relations.filter(x=>x.member).length;
  const changed=relations.filter(x=>x.state==='changed').length;
  const rootPath=pkg.root_path||'<完整证据包目录>';
  const quotedRoot="'"+rootPath.replace(/'/g,"'\"'\"'")+"'";
  const verifyCommand=`cd ${quotedRoot}\npython3 tools/verify_bundle.py --find 'raw-upload'\npython3 tools/verify_bundle.py --find 'android-volume/cn-7.63.5'\npython3 tools/verify_bundle.py --deep`;
  const roundLink=round.page?`#wiki/${encodeURI(round.page)}`:'#roadmap';
  const materialRows=materials.map(m=>`<tr><td><strong>${esc(m.title)}</strong><div class="tagline">${esc(m.kind||'原始材料')}</div></td><td>${fullBytes(m.bytes)}</td><td><div class="path">${esc(m.path||m.href||'')}</div>${m.sha256?`<details class="full-hash"><summary>SHA-256</summary><code>${esc(m.sha256)}</code></details>`:''}${m.note?`<p class="full-row-note">${esc(m.note)}</p>`:''}</td><td>${fullMaterialLink(m,'打开原件')}</td></tr>`).join('');
  main.innerHTML=heading('FULL EVIDENCE / 08','完整证据链','原始 MTK 固件与国行 APK、完整提取、分析数据库和报告证据在这里对应。旧完整包保持冻结，研究在原报告中增量更新。')+
    `<div class="full-service"><div><strong>页面离线内嵌，原件按需打开</strong><p>以下清单和搜索不发起网络请求。打开大文件时使用本机材料服务 <code>${esc(full.material_base||'http://127.0.0.1:58766/')}</code>；先双击项目中的「启动材料浏览.command」，材料服务无需登录。</p></div><a href="#wiki/tools-and-reconstruction">工具说明 →</a></div>
    <div class="stats full-stats"><div class="stat"><strong>${fullCount(pkg.files)}</strong><span>归档普通文件 · ${fullCount(pkg.directories)} 个目录</span></div><div class="stat"><strong>${fullCount(pkg.entries)}</strong><span>完整归档条目</span></div><div class="stat"><strong>${fullCount(pkg.ghidra_projects)}</strong><span>冻结包 Ghidra 项目</span></div><div class="stat"><strong>${fullCount(pkg.original_snapshots)}<small> + ${fresh}</small></strong><span>原版主证据 + </span></div></div>
    <div class="full-chain" aria-label="证据追溯层次"><div><small>01 / ORIGINAL</small><strong>MTK SWU / CN APK</strong><span>原始字节、分发留痕与摘要</span></div><div><small>02 / EXTRACTION</small><strong>CPIO / 完整 rootfs</strong><span>原始 tar、普通文件与元数据索引</span></div><div><small>03 / ANALYSIS</small><strong>Ghidra / Android 工作区</strong><span>数据库、DEX / Smali、REA 与日志</span></div><div><small>04 / EVIDENCE</small><strong>报告快照与原件</strong><span>逐条映射来源、版本与哈希</span></div><div><small>05 / RESEARCH</small><strong>模块结论与待办</strong><span>静态语义、模型和实机缺口分开</span></div></div>
    <div class="full-round"><div><span class="eyebrow">${esc(round.date||'')} / 增量研究</span><h2>${esc(round.title||'Frank 编码后的发送队列')}</h2><p>${esc(round.summary||'衔接旧 HOST 编码候选与 NATS 缓存，区分满拒新、失败保留和发布结果未知。')}</p></div><a class="full-action" href="${roundLink}">阅读结果 →</a></div>
    <div class="section-title"><h2>原件与完整提取</h2><span class="tagline">${esc(pkg.title||'完整证据包')} · ${esc(pkg.date||'日期未记录')}</span></div><div class="table-scroll full-materials"><table><thead><tr><th>材料</th><th>大小</th><th>位置与完整性</th><th>本地材料服务</th></tr></thead><tbody>${materialRows||'<tr><td colspan="4">尚未提供材料条目。</td></tr>'}</tbody></table></div>
    <div class="full-columns"><section class="card"><div class="eyebrow">APK COVERAGE</div><h2>完整物料不等于完整源码</h2><p>APK 原始条目核对 ${fullCount(android.matched_entries)} / ${fullCount(android.zip_entries)}；索引文件 ${fullCount(android.indexed_files)}，差异 ${fullCount(android.index_mismatches)}。保留 ${fullCount(android.smali_files)} 个 Smali 文件与 ${fullCount(android.evidence_records)} 条 REA 记录。</p><p>JADX 记录 ${fullCount(android.jadx_errors)} 个错误。关键失败函数需回到 DEX / Smali；完整工作区和失败日志保留在归档中。</p><div class="path">${esc(android.workspace_archive_member||'工作区成员路径未记录')}</div></section><section class="card"><div class="eyebrow">SOURCE BOUNDARY</div><h2>各层材料怎样对应</h2><p>当前 ${DATA.evidence.length} 条报告证据中，${archived} 条有原完整包成员映射，${fresh} 条属于，${changed} 条与归档源版本不同。报告快照可能有路径改写或脱敏，需分别比较源摘要、快照摘要与归档摘要。</p><p>Ghidra 数据库与反编译输出是分析材料，不是厂商原始源码；NXP 旧样本仅作历史对照。模型、静态代码和实机观测不互相替代。</p><a href="#boundaries">查看系统证据边界 →</a></section></div>
    <div class="section-title"><h2>从当前证据追到原件</h2><a href="#evidence">按原证据索引阅读 →</a></div><div class="filters full-filters"><label for="full-evidence-search">检索</label><input id="full-evidence-search" type="search" placeholder="编号、标题或路径…" autocomplete="off"><label for="full-evidence-kind">来源</label><select id="full-evidence-kind"><option value="all">全部来源</option><option value="archived">原完整包</option><option value="new"></option><option value="changed">源版本不同</option></select><span class="result-count" id="full-evidence-count" aria-live="polite"></span></div><div class="table-scroll full-evidence-table"><table><thead><tr><th>编号</th><th>报告证据</th><th>原件关系</th></tr></thead><tbody id="full-evidence-rows"></tbody></table></div>
    <div class="section-title"><h2>全目录索引与复核</h2></div><div class="full-columns"><section class="card"><ul class="full-index-list">${indexes.map(x=>`<li>${fullMaterialLink(x)}${x.note?`<p>${esc(x.note)}</p>`:''}</li>`).join('')||'<li>尚未提供索引链接。</li>'}</ul></section><section class="card"><h3>按路径检索，不必先解压整个归档</h3><pre class="full-code"><code>${esc(verifyCommand)}</code></pre><p><code>--find</code> 返回归档成员与 SHA-256；<code>--deep</code> 校验归档全部成员。原始 tar 和索引保留 Linux 元数据，普通文件视图不能直接刷回设备。</p></section></div>
    <div class="note amber"><strong>交付与研究边界</strong><ul>${(full.limitations||[]).map(x=>`<li>${esc(x)}</li>`).join('')}</ul><p>原版完整包与报告分别标版本；新版证据快照不会倒写进旧完整包。</p></div>`;
  const update=()=>{
    const query=document.getElementById('full-evidence-search').value.trim().toLocaleLowerCase();
    const kind=document.getElementById('full-evidence-kind').value;
    const rows=relations.filter(x=>(kind==='all'||(kind==='archived'?Boolean(x.member):x.state===kind))&&(x.e.id+' '+x.e.label+' '+x.e.source+' '+(x.member?.archive_member||'')).toLocaleLowerCase().includes(query));
    document.getElementById('full-evidence-count').textContent=rows.length+' / '+relations.length+' 条';
    document.getElementById('full-evidence-rows').innerHTML=rows.length?rows.map(x=>`<tr><td class="path">${esc(x.e.id)}</td><td><a href="#evidence/${encodeURI(x.e.source)}">${esc(x.e.label)}</a><div class="path">${esc(x.e.source)}</div><a class="full-snapshot-link" href="${esc(x.e.path)}">打开当前文本快照 ↗</a></td><td>${badge(x.kind,x.label)}${x.member?`<div class="path">${esc(x.member.archive_member)}</div>`:''}<details class="full-hash"><summary>核对哈希${x.member?'与归档处理':''}</summary><span>报告记录的源 SHA-256</span><code>${esc(x.e.source_sha256)}</code><span>当前快照 SHA-256</span><code>${esc(x.e.snapshot_sha256)}</code>${x.member?`<span>归档成员 SHA-256</span><code>${esc(x.member.sha256)}</code>${x.member.original_sha256?`<span>归档记录的脱敏前源 SHA-256</span><code>${esc(x.member.original_sha256)}</code>`:''}<span>归档处理</span><p>${esc(x.member.transformation||'none')}</p>`:'<p>证据以当前报告快照及增量材料为准，不属于原版冻结归档。</p>'}</details></td></tr>`).join(''):'<tr><td colspan="3" class="empty">没有匹配证据，请调整检索条件。</td></tr>';
  };
  document.getElementById('full-evidence-search').addEventListener('input',update);
  document.getElementById('full-evidence-kind').addEventListener('change',update);update();
}
function evidenceList(){
  main.innerHTML=heading('SOURCE REGISTER','保留证据，也保留来源边界',`${DATA.evidence.length} 份显式引用的报告已做筛选与脱敏。可在本页直接查看，无需返回原研究目录。大体积原件通过完整证据链定位；证据与原冻结归档分开标记。`)+`<p style="margin-top:18px"><a href="#wiki/tools-and-reconstruction">离线解析器、重建 C 与模型结果说明 →</a></p><div class="filters"><label for="evidence-filter">筛选</label><input id="evidence-filter" type="search" placeholder="报告标题或路径…" style="padding:8px 12px;border:1px solid var(--line);border-radius:7px;min-width:230px"></div><div id="evidence-items" class="evidence-list"></div><div class="section-title"><h2>原始样本清单</h2><a href="data/artifacts.json">JSON 清单 ↗</a></div><p class="lead">原始 MTK、APK 和完整 rootfs 已收录在独立完整证据包。下面保留样本来源与摘要；请从 <a href="#full-evidence">08 完整证据链</a> 打开实物原件和索引。单个样本的存在不证明当前实机部署。</p><div class="table-scroll"><table><thead><tr><th>样本</th><th>大小</th><th>相对位置与 SHA256</th></tr></thead><tbody>${DATA.artifacts.map(a=>`<tr><td>${esc(a.title)}</td><td>${(a.bytes/1048576).toFixed(2)} MiB</td><td class="path">${esc(a.source)}<br>${esc(a.sha256)}</td></tr>`).join('')}</tbody></table></div>`;
  const update=q=>{const matches=DATA.evidence.filter(e=>(e.label+' '+e.source).toLowerCase().includes(q.toLowerCase()));document.getElementById('evidence-items').innerHTML=matches.length?matches.map(e=>`<article class="evidence-item"><span class="eid">${e.id}</span><div><h3><a href="#evidence/${encodeURI(e.source)}">${esc(e.label)}</a></h3><div class="path">${esc(e.source)}</div></div></article>`).join(''):'<div class="empty">没有匹配的证据。</div>';};
  update('');document.getElementById('evidence-filter').addEventListener('input',e=>update(e.target.value));
}
function evidenceDetail(source){
  const e=DATA.evidence.find(x=>x.source===source);if(!e){notFound();return;}
  main.innerHTML=`<a class="back-link" href="#evidence">← 返回证据索引</a>${heading(e.id+' / RETAINED EVIDENCE',e.label)}<dl class="hashes"><dt>源相对路径</dt><dd>${esc(e.source)}</dd><dt>原文 SHA256</dt><dd>${esc(e.source_sha256)}</dd><dt>副本 SHA256</dt><dd>${esc(e.snapshot_sha256)}</dd><dt>副本处理</dt><dd>${esc(Object.entries(e.redactions).map(([k,v])=>k+': '+v).join('；')||'未触发内容脱敏规则')}；附历史快照说明</dd></dl>${fullEvidenceSourceNote(e)}<p class="lead">以下为保留的原始分析记录，措辞和任务状态对应其来源版本。当前技术结论、限制与任务状态以正文及任务清单为准。</p><pre class="evidence-text">${esc(e.text)}</pre><a href="${esc(e.path)}">打开文本副本 ↗</a>`;
}
function algorithmExplorer(){
  return `<section class="algorithm-explorer" aria-label="算法逐层解读"><div class="eyebrow">处理模块 / 点击查看</div><div class="algorithm-tabs">${DATA.algorithms.map((a,i)=>`<button data-algorithm="${a.id}" aria-pressed="${a.id===algorithmId}"><small>${String(i+1).padStart(2,'0')}</small>${esc(a.title)}${a.status==='boundary'?'<span>缺生产实现</span>':''}</button>`).join('')}</div><div id="algorithm-detail"></div></section>`;
}
function filterChart(conditional=false){
  const f=DATA.algorithmFilter,x=r=>48+r/.5*580,y=db=>18-db/6*153;
  const path=f.points.map((p,i)=>`${i?'L':'M'}${x(p.r).toFixed(2)},${y(p.db).toFixed(2)}`).join(' ');
  return `<svg viewBox="0 0 680 235" role="img" aria-label="已恢复 ADC 数字前端的理论幅频响应，归一化频率0到0.5，非实测"><g fill="none" stroke="#dbe6db">${[0,-2,-4,-6].map(db=>`<path d="M48 ${y(db)} H628"/>`).join('')}</g><g fill="#657e71" font-size="11">${[0,-2,-4,-6].map(db=>`<text x="4" y="${y(db)+4}">${db} dB</text>`).join('')}${[0,.1,.2,.3,.4,.5].map(r=>`<text text-anchor="middle" x="${x(r)}" y="195">${conditional?(r*500).toFixed(0):r.toFixed(1)}</text>`).join('')}<text x="338" y="223" text-anchor="middle">${conditional?'假设输出率 500 SPS 时的 Hz 换算（未实测）':'频率 / 输出率 f ÷ f_out'}</text></g><path d="${path}" fill="none" stroke="#087e77" stroke-width="2.5"/><path d="M${x(f.r_half)} 18 V171" stroke="#b98538" stroke-dasharray="4 4"/><circle cx="${x(f.r_half)}" cy="${y(-3.0102999566)}" r="4" fill="#b98538"/><text x="${x(f.r_half)-7}" y="${y(-3.0102999566)-12}" text-anchor="end" fill="#9d6b27" font-size="11">−3.01 dB / ${conditional?'218.536 Hz':'0.437073 f_out'}</text></svg>`;
}
function renderAlgorithm(){
  const a=DATA.algorithms.find(x=>x.id===algorithmId);
  document.getElementById('algorithm-detail').innerHTML=`<div class="algorithm-heading"><strong>${esc(a.title)}</strong>${badge(a.status,a.status==='recovered'?'已恢复本段逻辑':a.status==='partial'?'已恢复部分消费者':'缺生产实现')}</div><div class="algorithm-place">${esc(a.where)}</div><dl><dt>输入</dt><dd>${esc(a.input)}</dd><dt>处理</dt><dd>${esc(a.operation)}</dd></dl><details class="technical-details"><summary>公式与实现</summary><pre><code>${esc(a.formula)}</code></pre></details><dl><dt>输出</dt><dd>${esc(a.output)}</dd><dt>适用范围与缺口</dt><dd>${esc(a.limit)}</dd></dl>${a.id==='front'?`<div class="filter-plot"><div class="filter-toolbar"><strong>ADC 理论幅频响应</strong><label for="filter-unit">横轴 <select id="filter-unit"><option value="normalized">归一化频率</option><option value="conditional">假设输出率 500 SPS</option></select></label></div><div id="filter-chart">${filterChart()}</div><p>曲线由 ADC 滤波公式计算，非床垫实测或心肺分离效果。群延迟约 0.624817 个输出间隔；201 个图点已与原有推导核对。</p></div>`:''}<div class="algorithm-links"><a href="#wiki/${a.page}" ${a.id==='fusion'?'data-fusion-jump="true"':''}>${a.page==='modules/physiology-algorithms'?'看哪些判断算法还缺':'继续看详细步骤和公式'} →</a><a href="#evidence/${a.evidence}">查看证据原文 ↗</a></div>`;
  document.querySelectorAll('[data-algorithm]').forEach(b=>b.setAttribute('aria-pressed',String(b.dataset.algorithm===algorithmId)));
  const jump=document.querySelector('[data-fusion-jump]');if(jump)jump.addEventListener('click',e=>{const h=[...document.querySelectorAll('.article h2')].find(h=>h.textContent==='怎样分清两个人的信号 还缺哪些算法');if(h){e.preventDefault();h.scrollIntoView({behavior:'smooth'});}});
  const unit=document.getElementById('filter-unit');if(unit)unit.addEventListener('change',e=>document.getElementById('filter-chart').innerHTML=filterChart(e.target.value==='conditional'));decorateTerms(document.getElementById('algorithm-detail'));
}
function wikiPage(id){
  const page=DATA.pages.find(p=>p.id===id);if(!page){notFound();return;}
  const m=id.startsWith('modules/')?byId[id.slice(8)]:null;
  const algorithmPage=['modules/physiology-algorithms','local-processing-20261108'].includes(id);
  const renderedPage=algorithmPage?page.html.replace('</p>','</p>'+algorithmExplorer()):page.html;
  main.innerHTML=`<a class="back-link" href="${m?'#modules':'#overview'}">← ${m?'返回模块 Wiki':'返回总览'}</a><div class="article-layout"><div class="article-body"><details class="mobile-toc"><summary>本页目录</summary><div id="mobile-toc-links"></div></details><article class="article">${renderedPage}</article></div><aside class="article-side">${m?`<section>${badge(m.status,statusLabel[m.status])}<p class="term-help">此标记只描述样本内实现。<a href="#wiki/conclusions">模型、部署与实机证据分别查看 →</a></p><h3 style="margin-top:18px">输入</h3><ul>${m.inputs.map(x=>`<li>${esc(x)}</li>`).join('')}</ul><h3 style="margin-top:18px">输出</h3><ul>${m.outputs.map(x=>`<li>${esc(x)}</li>`).join('')}</ul></section>`:''}<section><h3>本页目录</h3><div id="toc"></div></section>${m?`<section><h3>对应待办</h3>${m.next.map(tid=>{const t=DATA.tasks.find(t=>t.id===tid);return t?`<a href="#task/${encodeURIComponent(tid)}">${esc(tid)} · ${esc(t.title)}</a>`:'';}).join('')}</section>`:''}<section><a href="${esc(page.path)}">查看 Markdown 源文 ↗</a><a href="#wiki/evidence-method">证据与版本规则 →</a><a href="#terms">关键术语 →</a><p class="term-help">正文中带虚线的词可点开看解释。</p><a href="#wiki/tools-and-reconstruction">解析器与重建文件 →</a></section></aside></div>`;
  if(algorithmPage){renderAlgorithm();main.querySelectorAll('[data-algorithm]').forEach(b=>b.addEventListener('click',()=>{algorithmId=b.dataset.algorithm;renderAlgorithm();}));}
  main.querySelectorAll('.article pre,.article .table-scroll').forEach(block=>{
    const count=block.tagName==='PRE'?block.textContent.split('\n').length:block.querySelectorAll('tbody tr').length;
    if(count<(block.tagName==='PRE'?28:24))return;
    const details=document.createElement('details');details.className='reference-detail';
    const summary=document.createElement('summary');summary.textContent=block.tagName==='PRE'?`实现明细 · ${count} 行`:`字段与数据明细 · ${count} 项`;
    block.before(details);details.append(summary,block);
  });
  const headings=[...main.querySelectorAll('.article h2,.article h3')];
  document.getElementById('toc').innerHTML=headings.map((h,i)=>{h.id='section-'+i;return `<a href="#" class="toc-level-${h.tagName.toLowerCase()}" data-section="section-${i}">${esc(h.textContent)}</a>`;}).join('');
  document.getElementById('mobile-toc-links').innerHTML=document.getElementById('toc').innerHTML;
  main.querySelectorAll('[data-section]').forEach(a=>a.addEventListener('click',ev=>{ev.preventDefault();document.getElementById(a.dataset.section).scrollIntoView({behavior:'smooth',block:'start'});}));
}
function search(q){
  const query=q.toLocaleLowerCase().trim();
  const pages=query?DATA.pages.filter(p=>(p.title+' '+p.text).toLocaleLowerCase().includes(query)):[];
  main.innerHTML=heading('SEARCH','搜索研究档案',query?`“${q}” · 找到 ${pages.length} 个 Wiki 页面。正文覆盖所有模块和完整待办。`:'输入模块名、接口或关键结论后搜索。')+pages.map(p=>{const idx=p.text.toLocaleLowerCase().indexOf(query);const start=Math.max(0,idx-55);const excerpt=p.text.slice(start,start+210).replace(/[#*`]/g,'');return `<article class="card search-result"><h3><a href="#wiki/${encodeURI(p.id)}">${esc(p.title)}</a></h3><p>${start?'…':''}${esc(excerpt)}…</p></article>`;}).join('')+(query&&!pages.length?'<div class="empty">没有匹配结果。试试“放大”“蓝牙”“心率”或“版本”。</div>':'');
}
function decorateTerms(root){
  if(!root)return;
  const seen=new Set([...root.querySelectorAll('[data-term]')].map(x=>x.dataset.term));
  const walker=document.createTreeWalker(root,NodeFilter.SHOW_TEXT);const nodes=[];
  while(walker.nextNode()){
    const n=walker.currentNode;
    if(n.parentElement&&!n.parentElement.closest('a,code,pre,button,input,select,textarea,svg,h1,h2,h3,h4,summary,.term-card,.term-help'))nodes.push(n);
  }
  for(const n of nodes){
    const text=n.textContent;termPattern.lastIndex=0;let m,last=0,changed=false;const frag=document.createDocumentFragment();
    while((m=termPattern.exec(text))!==null){
      const word=m[0],id=aliasIndex.get(word.toLowerCase()),end=m.index+word.length;
      if(seen.has(id))continue;
      if((/^[A-Za-z0-9_]/.test(word)&&/[A-Za-z0-9_-]/.test(text[m.index-1]||''))||(/[A-Za-z0-9_]$/.test(word)&&/[A-Za-z0-9_-]/.test(text[end]||'')))continue;
      frag.appendChild(document.createTextNode(text.slice(last,m.index)));
      const b=document.createElement('button');b.type='button';b.className='term-word';b.dataset.term=id;b.textContent=word;b.title='查看代码语义与研究边界';b.setAttribute('aria-label',word+'：查看解释');frag.appendChild(b);
      seen.add(id);last=end;changed=true;
    }
    if(changed){frag.appendChild(document.createTextNode(text.slice(last)));n.replaceWith(frag);}
  }
}
function showTerm(id){
  const t=termById[id];if(!t)return;
  document.getElementById('term-title').textContent=t.term;
  document.getElementById('term-body').innerHTML=`<p class="term-plain">${esc(t.plain)}</p><h3>研究边界</h3><p>${esc(t.caution)}</p><a href="#terms" id="all-terms-link">查看全部 ${DATA.terms.length} 个词 →</a>`;
  const dialog=document.getElementById('term-dialog');dialog.showModal();
  document.getElementById('all-terms-link').addEventListener('click',()=>dialog.close());
}
function termPage(){
  main.innerHTML=heading('TERMINOLOGY','关键术语与代码语义','只说明影响逆向判断的术语，重点区分代码中的实际含义与尚未证实的推断。')+`<div class="filters"><label for="term-search">找一个词</label><input id="term-search" type="search" placeholder="比如：主侧、秒桶、RMSSD…"><span id="term-count" class="result-count"></span></div><div id="term-grid" class="grid-3"></div>`;
  const update=q=>{const needle=q.toLowerCase().trim(),matches=DATA.terms.filter(t=>(t.term+' '+t.aliases.join(' ')+' '+t.plain).toLowerCase().includes(needle));document.getElementById('term-count').textContent=matches.length+' / '+DATA.terms.length+' 个词';document.getElementById('term-grid').innerHTML=matches.length?matches.map(t=>`<article class="card term-card"><h2>${esc(t.term)}</h2><p class="term-plain">${esc(t.plain)}</p><h3>研究边界</h3><p>${esc(t.caution)}</p></article>`).join(''):'<div class="empty">暂时没有这个词，可以换个叫法试试。</div>';};
  update('');document.getElementById('term-search').addEventListener('input',e=>update(e.target.value));
}
function notFound(){main.innerHTML=heading('NOT FOUND','没有找到这个条目','请从模块列表或证据索引重新选择。')+'<a href="#overview">返回总览 →</a>';}
function route(){
  const raw=location.hash.slice(1)||'overview';let route;try{route=decodeURIComponent(raw);}catch{route='overview';}if(route==='content')route='overview';
  let active=route.split('/')[0],wikiTitle='';
  if(active==='wiki'){
    const pageId=route.slice(5);
    wikiTitle=DATA.pages.find(p=>p.id===pageId)?.title||'';
    active=['temperature-encoding-20261109','temperature-cache-20261109','mode-schedule-20261109','state-output-chain-20261109','main-object-control-20261109','field-site-binding-20261109','local-processing-20261108','local-followup-20261108','local-final-pass-20261108','control-lifecycle-20261108'].includes(pageId)||pageId.startsWith('algorithms/local-calibration')||['algorithms/local-audio','algorithms/local-accessory-telemetry','algorithms/local-capacitance-temperature','algorithms/local-app-processing','algorithms/local-sensor-versions','algorithms/local-pillow-processing'].includes(pageId)?'local-processing':['reverse-plan','roadmap'].includes(pageId)?'roadmap':['conclusions','evidence-method'].includes(pageId)?'boundaries':['full-evidence','prepublish-queue-20261108','system-deepening-20261108','sensor-and-control-20261108','capture-pipeline-20261108'].includes(pageId)?'full-evidence':route.startsWith('wiki/modules/')?'modules':'boundaries';
    wikiPage(pageId);
  }
  else if(active==='evidence'&&route.includes('/'))evidenceDetail(route.slice(9));
  else if(active==='search')search(route.slice(7));
  else if(active==='task'){const task=DATA.tasks.find(t=>t.id===route.slice(5));active='roadmap';if(task)main.innerHTML=`<a class="back-link" href="#roadmap">← 返回全部计划</a>${heading('NEXT STEP / '+task.id,task.title)}${taskCard(task)}`;else notFound();}
  else ({overview,modules,flows,boundaries,roadmap,evidence:evidenceList,'full-evidence':fullEvidence,terms:termPage}[active]||notFound)();
  document.querySelectorAll('[data-nav]').forEach(a=>{a.classList.toggle('active',a.dataset.nav===active);if(a.dataset.nav===active)a.setAttribute('aria-current','page');else a.removeAttribute('aria-current');});
  const label=wikiTitle||{overview:'报告总览',flows:'系统架构',modules:'模块详解',boundaries:'结论与验证',roadmap:'研究计划',evidence:'证据索引','full-evidence':'原始材料',search:'搜索结果',terms:'关键术语'}[active]||'研究档案';
  document.getElementById('breadcrumb').textContent=label;
  document.title=label+' · '+DATA.title;
  if(active!=='full-evidence')decorateTerms(main);
  window.scrollTo(0,0);
}
document.getElementById('search-form').addEventListener('submit',e=>{e.preventDefault();location.hash='search/'+encodeURIComponent(document.getElementById('search').value.trim());});
document.getElementById('print').addEventListener('click',()=>window.print());
document.addEventListener('click',e=>{const b=e.target.closest('[data-term]');if(b)showTerm(b.dataset.term);});
document.getElementById('term-close').addEventListener('click',()=>document.getElementById('term-dialog').close());
document.getElementById('term-dialog').addEventListener('click',e=>{if(e.target===e.currentTarget)e.currentTarget.close();});
document.querySelector('.skip').addEventListener('click',e=>{e.preventDefault();main.focus();main.scrollIntoView();});
window.addEventListener('hashchange',route);route();
