'use strict';
(() => {
  const $ = id => document.getElementById(id);
  const activeStatuses = new Set(['connecting', 'running', 'streaming', 'capturing', 'stopping']);
  const statusLabels = {idle:'未开始',connecting:'正在连接',running:'正在采集',streaming:'正在采集',capturing:'正在采集',stopping:'正在停止',stopped:'已停止',completed:'采集结束',complete:'采集结束',finished:'采集结束',error:'未完成',failed:'未完成'};
  const reasonLabels = {
    response_wait_limit:'采集时限内未收到官方 HTTP 响应，不能据此判定设备离线。',
    duration_limit:'已达到采集时长。',time_limit:'已达到采集时长。',capture_limit:'已达到本次采集上限。',
    stopped:'已手动停止。',user_stop:'已手动停止。',user_stopped:'已手动停止。',stop_requested:'已手动停止。',
    end_of_stream:'服务端已结束事件流。',eof:'服务端已结束事件流。',
    read_timeout:'读取超时，本次采集已结束；未自动重连。',timeout:'连接或读取超时，未自动重连。',
    connection_error:'未能完成数据连接，未自动重试。',network_error:'未能完成数据连接，未自动重试。',
    data_limit:'已达到本次采集容量上限。',max_bytes:'已达到接收字节上限。',byte_limit:'已达到接收字节上限。',max_events:'已达到事件数量上限。',event_limit:'已达到事件数量上限。',
    device_offline:'设备当前离线，请联网后刷新状态。',offline:'设备当前离线，请联网后刷新状态。',
    unauthorized:'登录已失效，请重新登录。',session_ended:'登录会话已结束。',logout:'登录会话已结束。',
    no_events:'本次没有收到事件。',demo_complete:'演示采集结束。',cancelled:'本次采集已取消。'
  };
  let state = {configured:false, authenticated:false, devices:[], capture:{status:'idle'}};
  let serviceOnline = false, busy = false, generation = 0, captureId = null, cursor = 0;
  let events = [], seen = new Set(), typeCounts = new Map(), lastReceived = null;
  let timer = null, plotDirty = false, paused = false;

  const finite = n => typeof n === 'number' && Number.isFinite(n);
  const number = n => finite(Number(n)) ? Number(n).toLocaleString('zh-CN') : '—';
  const text = v => v === undefined || v === null || v === '' ? '—' : typeof v === 'object' ? JSON.stringify(v) : String(v);
  const active = () => activeStatuses.has(state.capture?.status);
  const selectedDevice = () => (state.devices || []).find(d => String(d.id) === $('device').value);
  function bytes(n) {
    n = Number(n) || 0;
    return n >= 1048576 ? (n / 1048576).toFixed(2) + ' MiB' : n >= 1024 ? (n / 1024).toFixed(1) + ' KiB' : n + ' B';
  }
  function receivedTime(value) {
    if (typeof value !== 'string') return text(value);
    const d = new Date(value);
    return Number.isFinite(d.getTime()) ? d.toLocaleTimeString('zh-CN',{hour12:false}) : value;
  }
  function message(value = '', kind = '') {
    $('message').textContent = value;
    $('message').className = 'notice' + (kind ? ' ' + kind : '');
    $('message').hidden = !value;
  }
  async function api(path, data, timeout = 35000) {
    const controller = new AbortController();
    const timeoutId = setTimeout(() => controller.abort(), timeout);
    try {
      const options = {method:data === undefined ? 'GET' : 'POST',cache:'no-store',credentials:'same-origin',redirect:'error',signal:controller.signal,headers:{Accept:'application/json'}};
      if (data !== undefined) {
        options.headers['Content-Type'] = 'application/json';
        options.headers['X-CSRF-Token'] = state.csrf || '';
        options.body = JSON.stringify(data);
      }
      const response = await fetch(path, options);
      let result;
      try { result = await response.json(); } catch (_) { throw new Error('本地服务返回了无法识别的响应。'); }
      if (!response.ok || !result || result.ok === false) {
        const error = new Error(typeof result?.message === 'string' ? result.message : '请求未完成。');
        error.httpStatus = response.status;
        error.upstreamStatus = result?.upstream_status;
        throw error;
      }
      return result;
    } catch (error) {
      if (error.name === 'AbortError') throw new Error('本地请求等待超时，请确认服务仍在运行。');
      if (error instanceof TypeError) throw new Error('本地服务连接中断，请重新启动采集入口。');
      throw error;
    } finally { clearTimeout(timeoutId); }
  }
  function resetEvents() {
    events = []; seen = new Set(); typeCounts = new Map(); cursor = 0; lastReceived = null;
    renderEvents(); queuePlot();
  }
  function appendEvents(incoming) {
    let added = false;
    for (const event of Array.isArray(incoming) ? incoming : []) {
      if (!event || typeof event !== 'object') continue;
      const seq = Number(event.seq);
      if (!Number.isSafeInteger(seq) || seq < 0 || seen.has(seq)) continue;
      seen.add(seq); cursor = Math.max(cursor, seq); events.push(event); added = true;
      const kind = typeof event.type === 'string' ? event.type : 'unknown';
      typeCounts.set(kind, (typeCounts.get(kind) || 0) + 1);
      if (event.received_at !== undefined) lastReceived = event.received_at;
    }
    if (events.length > 2000) events = events.slice(-2000);
    if (added) { renderEvents(); queuePlot(); }
  }
  function ingestCapture(capture, incoming) {
    const next = capture && typeof capture === 'object' ? capture : {status:'idle'};
    const nextId = next.id ?? null;
    if (nextId !== captureId) { captureId = nextId; resetEvents(); }
    state.capture = next;
    appendEvents(incoming === undefined ? next.events : incoming);
    renderCapture(); renderControls();
  }
  async function syncState() {
    const version = generation;
    const result = await api('/api/state');
    if (version !== generation) return;
    state = {...result,devices:Array.isArray(result.devices) ? result.devices : []};
    serviceOnline = true;
    renderAccount(); renderDevices(); ingestCapture(result.capture);
  }
  function renderAccount() {
    $('service-badge').textContent = serviceOnline ? (state.mode === 'demo' ? '本地演示服务' : '本地服务已连接') : '本地服务未连接';
    $('service-badge').className = 'badge' + (serviceOnline ? '' : ' error');
    $('demo-banner').hidden = state.mode !== 'demo';
    $('config-missing').hidden = !serviceOnline || state.configured !== false;
    $('login-form').hidden = Boolean(state.authenticated);
    $('account-session').hidden = !state.authenticated;
    $('account-email').textContent = state.account?.email_masked || '已登录账号';
    renderControls();
  }
  function renderDevices() {
    const previous = $('device').value;
    const devices = state.devices || [];
    const fragment = document.createDocumentFragment();
    if (!devices.length) {
      const option = document.createElement('option'); option.value = ''; option.textContent = '没有可选的绑定设备'; fragment.appendChild(option);
    } else {
      for (const d of devices) {
        const option = document.createElement('option'); option.value = String(d.id);
        const title = d.name || d.model || 'Pod 设备';
        const online = d.online === true ? '在线' : d.online === false ? '离线' : '状态未知';
        option.textContent = title + ' · ' + online; fragment.appendChild(option);
      }
    }
    $('device').replaceChildren(fragment);
    if (devices.some(d => String(d.id) === previous)) $('device').value = previous;
    $('device-empty').hidden = devices.length > 0;
    $('device-empty').textContent = state.authenticated ? '这个账号没有返回绑定设备。请核对能控制 Pod 的官方 App 是否使用同一个账号。' : '登录成功后自动查询绑定设备。';
    renderDeviceDetails();
  }
  function renderDeviceDetails() {
    const d = selectedDevice();
    $('device-details').hidden = !d;
    $('offline-note').hidden = d?.online !== false;
    if (d) {
      $('device-online').textContent = d.online === true ? '在线' : d.online === false ? '离线' : '未知';
      $('device-online').className = 'badge ' + (d.online === true ? 'good' : 'warning');
      $('device-model').textContent = text(d.model); $('device-firmware').textContent = text(d.firmware); $('device-id').textContent = text(d.id);
    }
    renderCapture(); renderControls();
  }
  function captureHint(c) {
    const code = Number(c.http_status);
    if (code === 404) return '官方 live 接口返回 404，尚未取得实时事件。请核对设备与 App 请求；本工具不会重复尝试或猜测地址。';
    if (code === 401 || code === 403) return '官方接口未通过登录或访问检查（HTTP ' + code + '），尚未取得实时数据。';
    if (code === 429) return '官方接口限制请求（HTTP 429），本工具已停止，不会自动重试。';
    if (code >= 400) return '官方接口返回 HTTP ' + code + '，本次采集未完成。';
    const phase = {pending:'准备连接',tcp_tls:'建立网络与 TLS 连接',request:'发送实时请求',response_headers:'等待官方 HTTP 响应',stream:'接收事件流'}[c.phase];
    const error = {timeout:'网络等待超时',tls:'TLS 连接失败',dns:'域名解析失败',network:'网络连接中断',protocol:'连接或消息处理失败'}[c.error_kind];
    if (c.status === 'connecting') return (phase || '正在连接所选设备的 live 事件流') + '…';
    if (c.status === 'stopping') return '正在结束本次读取…';
    if (active()) return Number(c.event_count) > 0 ? '正在接收事件。预览只显示实际返回的压电样本。' : '连接处理中或已建立，正在等待事件；目前没有收到数据。';
    if (c.reason) {
      const known = reasonLabels[c.reason];
      const detail = c.status === 'error' ? (phase ? ' 阶段：' + phase + '。' : '') + (error ? ' ' + error + '。' : '') : '';
      const empty = code === 200 ? ' HTTP 200 已连接，但未收到事件。' : ' 没有收到事件。';
      return (known || '本次采集已结束。') + detail + (Number(c.event_count) > 0 ? ' 已收到的事件可导出。' : empty);
    }
    if (c.status && c.status !== 'idle') return Number(c.event_count) > 0 ? '本次读取已结束，收到的事件可导出。' : '本次读取已结束，没有收到事件。';
    if (!state.authenticated) return '登录并选择设备后开始。不会自动启动采集。';
    const d = selectedDevice();
    if (!d) return '尚无可选设备，请刷新绑定设备或核对账号。';
    if (d.online === false) return '所选设备离线，请联网后刷新设备状态。';
    if (d.online !== true) return '设备在线状态未知。可手动开始一次短时读取，以实际响应为准。';
    return '设备显示在线。选择时长后手动开始读取。';
  }
  function renderCapture() {
    const c = state.capture || {};
    $('capture-badge').textContent = statusLabels[c.status] || (c.status ? '采集状态未知' : '未开始');
    $('capture-badge').className = 'badge' + (active() ? ' good running' : ['error','failed'].includes(c.status) || Number(c.http_status) >= 400 ? ' error' : '');
    $('capture-hint').textContent = captureHint(c);
    $('event-count').textContent = number(c.event_count ?? 0); $('sample-count').textContent = number(c.sample_count ?? 0);
    const seconds = Math.max(0, Number(c.elapsed_seconds) || 0);
    $('elapsed').replaceChildren(document.createTextNode(seconds.toFixed(1)));
    const unit = document.createElement('span'); unit.textContent = ' 秒'; $('elapsed').appendChild(unit);
    $('http-status').textContent = text(c.http_status);
    $('last-received').textContent = receivedTime(c.last_received_at || lastReceived);
    $('received-bytes').textContent = bytes(c.bytes);
    $('event-types').textContent = [...typeCounts.entries()].map(([k,n]) => k + ' ' + n).join(' · ') || '—';
    const limit = Math.max(1, Number(c.limit_seconds) || Number($('duration').value));
    $('progress-fill').style.width = Math.min(100, seconds / limit * 100) + '%';
    $('start').textContent = c.id && !active() ? '重新采集' : '开始采集';
  }
  function renderControls() {
    const connected = serviceOnline && Boolean(state.csrf);
    const authenticated = connected && state.authenticated;
    const capturing = active();
    $('login').disabled = busy || !connected || state.configured === false;
    $('email').disabled = $('password').disabled = busy || !connected || state.configured === false;
    $('logout').disabled = busy || !authenticated;
    $('refresh-devices').disabled = busy || !authenticated || capturing;
    $('device').disabled = busy || !authenticated || capturing || !(state.devices || []).length;
    $('duration').disabled = busy || capturing;
    $('start').disabled = busy || !authenticated || capturing || !selectedDevice() || selectedDevice()?.online === false;
    $('stop').disabled = busy || !authenticated || !capturing;
    const hasCapture = Boolean(state.capture?.id);
    $('export-events').disabled = busy || !connected || capturing || !hasCapture || !(Number(state.capture?.event_count) > 0);
    $('export-meta').disabled = busy || !connected || capturing || !hasCapture;
    $('clear').disabled = busy || !connected || capturing || !hasCapture;
  }
  function renderEvents() {
    const shown = events.slice(-30).reverse();
    $('events-empty').hidden = shown.length > 0; $('event-table-wrap').hidden = !shown.length;
    $('events-shown').textContent = shown.length ? '最近 ' + shown.length + ' 条 · 完整记录见导出' : '0 条';
    const fragment = document.createDocumentFragment();
    for (const event of shown) {
      const tr = document.createElement('tr');
      const samples = Array.isArray(event.samples) ? event.samples : null;
      for (const value of [event.seq,receivedTime(event.received_at),event.type,event.timestamp,samples ? samples.length : '—']) {
        const td = document.createElement('td'); td.textContent = text(value); tr.appendChild(td);
      }
      const td = document.createElement('td'), details = document.createElement('details'), summary = document.createElement('summary'), pre = document.createElement('pre');
      summary.textContent = '查看事件';
      const body = JSON.stringify(event, null, 2);
      pre.textContent = body.length > 8000 ? body.slice(0,8000) + '\n…预览已截短，完整内容见 JSONL 导出。' : body;
      details.append(summary,pre); td.appendChild(details); tr.appendChild(td); fragment.appendChild(tr);
    }
    $('event-rows').replaceChildren(fragment);
  }
  function queuePlot() {
    if (plotDirty) return;
    plotDirty = true; requestAnimationFrame(() => { plotDirty = false; drawPlot(); });
  }
  function drawPlot() {
    const canvas = $('waveform'), ctx = canvas.getContext('2d');
    if (!ctx) return;
    const rect = canvas.getBoundingClientRect(); if (!rect.width || !rect.height) return;
    const ratio = Math.min(window.devicePixelRatio || 1, 3), w = rect.width, h = rect.height;
    canvas.width = Math.round(w * ratio); canvas.height = Math.round(h * ratio); ctx.setTransform(ratio,0,0,ratio,0,0); ctx.clearRect(0,0,w,h);
    const chunks = []; let retained = 0;
    for (let i = events.length - 1; i >= 0 && retained < 2000; i--) {
      const e = events[i]; if (e.type !== 'piezo' || !Array.isArray(e.samples) || !e.samples.length) continue;
      const values = e.samples.slice(-(2000 - retained)); chunks.unshift(values); retained += values.length;
    }
    const values = chunks.flat(), valid = values.filter(finite);
    $('chart-empty').hidden = valid.length > 0;
    $('plot-count').textContent = valid.length ? '最近 ' + retained.toLocaleString('zh-CN') + ' 个位置' : '尚无样本';
    canvas.setAttribute('aria-label', valid.length ? '压电样本预览，最近' + retained + '个位置，' + chunks.length + '个事件分段' : '压电样本预览，当前没有数据');
    if (!valid.length) return;
    let min = Math.min(...valid), max = Math.max(...valid);
    const span = max - min;
    const pad = span > 0 ? span * .08 : Math.max(1, Math.abs(max) * .02);
    min -= pad; max += pad;
    const left = 70, right = 18, top = 16, bottom = 34, pw = Math.max(1,w-left-right), ph = h-top-bottom;
    const x = i => left + i / Math.max(1,values.length - 1) * pw;
    const y = v => top + (max - v) / (max - min) * ph;
    ctx.font = '10px -apple-system, sans-serif'; ctx.textAlign = 'right';
    for (let i=0;i<=4;i++) {
      const yy=top+ph*i/4, value=max-(max-min)*i/4;
      ctx.strokeStyle='#e3eadd'; ctx.lineWidth=1; ctx.beginPath(); ctx.moveTo(left,yy+.5); ctx.lineTo(w-right,yy+.5); ctx.stroke();
      ctx.fillStyle='#778a7b'; ctx.fillText(Math.abs(value)>=100000 ? value.toExponential(1) : Number(value.toFixed(2)).toLocaleString('zh-CN'),left-9,yy+3);
    }
    ctx.textAlign='left'; ctx.fillText('0',left,h-12); ctx.textAlign='right';ctx.fillText((values.length-1).toLocaleString('zh-CN')+' · 样本序号',w-right,h-12);
    let offset=0;
    for (const chunk of chunks) {
      if (offset) {ctx.setLineDash([3,4]);ctx.strokeStyle='#c7d9c8';ctx.beginPath();ctx.moveTo(x(offset),top);ctx.lineTo(x(offset),top+ph);ctx.stroke();ctx.setLineDash([]);}
      ctx.strokeStyle='#087e77';ctx.lineWidth=1.5;ctx.beginPath();let previous=false;
      chunk.forEach((value,i)=>{if(!finite(value)){previous=false;return;}if(previous)ctx.lineTo(x(offset+i),y(value));else ctx.moveTo(x(offset+i),y(value));previous=true;});ctx.stroke();
      if(chunk.length===1 && finite(chunk[0])){ctx.fillStyle='#087e77';ctx.beginPath();ctx.arc(x(offset),y(chunk[0]),2.5,0,2*Math.PI);ctx.fill();}
      offset+=chunk.length;
    }
  }
  async function action(work) {
    if (busy) return;
    busy = true; generation++; message(); renderControls();
    try { await work(); }
    catch (error) { message(error.message, 'error'); }
    finally { busy = false; renderControls(); }
  }
  $('login-form').addEventListener('submit', event => {
    event.preventDefault();
    const payload={email:$('email').value,password:$('password').value}; $('password').value='';
    void action(async()=>{
      try {
        message('正在通过国行官方服务登录…');
        $('login').textContent='正在登录…';
        await api('/api/login',payload);
        await syncState();
        try {
          const result=await api('/api/devices');state.devices=Array.isArray(result.devices)?result.devices:[];renderDevices();
          message(state.devices.length ? '登录成功，已找到 '+state.devices.length+' 台绑定设备。请选择设备并手动开始采集。' : '登录成功，但该账号没有返回绑定设备。请核对官方 App 的账号。',state.devices.length?'':'warning');
        } catch(error) {message('登录成功，但设备列表读取失败：'+error.message,'warning');}
      } finally {payload.password='';payload.email='';$('login').textContent='登录并查找设备';}
    });
  });
  $('refresh-devices').addEventListener('click',()=>void action(async()=>{
    const result=await api('/api/devices');state.devices=Array.isArray(result.devices)?result.devices:[];renderDevices();
    message(state.devices.length?'绑定设备状态已刷新。':'这个账号没有返回绑定设备。','');
  }));
  $('device').addEventListener('change',()=>{message();renderDeviceDetails();});
  $('start').addEventListener('click',()=>void action(async()=>{
    const device=selectedDevice();if(!device)return;
    await api('/api/capture/start',{device_id:String(device.id),duration_seconds:Number($('duration').value)});await syncState();
  }));
  $('stop').addEventListener('click',()=>void action(async()=>{await api('/api/capture/stop',{});await syncState();}));
  $('clear').addEventListener('click',()=>void action(async()=>{await api('/api/capture/clear',{});captureId=null;resetEvents();await syncState();message('本次采集数据已从本地服务内存中清空。');}));
  $('logout').addEventListener('click',()=>void action(async()=>{await api('/api/logout',{});captureId=null;resetEvents();$('email').value='';$('password').value='';await syncState();message('已退出登录，本地会话已结束。');}));
  function download(path) {const a=document.createElement('a');a.href=path;a.download='';document.body.appendChild(a);a.click();a.remove();}
  $('export-events').addEventListener('click',()=>download('/api/export/events'));
  $('export-meta').addEventListener('click',()=>download('/api/export/meta'));
  async function poll() {
    if(paused)return;
    const version=generation;
    try {
      if (!busy) {
        if (!serviceOnline) {await syncState();message();}
        else if (state.authenticated || state.capture?.id) {
          const result=await api('/api/capture?after='+encodeURIComponent(cursor),undefined,10000);
          if(version===generation && !busy) {
            if ((result.capture?.id??null)!==captureId) await syncState();
            else ingestCapture(result.capture,result.events);
          }
        }
      }
    } catch(error) {
      if(version===generation && !busy) {
        if(error.httpStatus===401){try{await syncState();}catch(_){serviceOnline=false;renderAccount();}}
        else if(!error.httpStatus){serviceOnline=false;renderAccount();}
        message(error.message,'error');
      }
    } finally {if(!paused)timer=setTimeout(poll,1000);}
  }
  if(window.ResizeObserver)new ResizeObserver(queuePlot).observe($('waveform'));
  else window.addEventListener('resize',queuePlot);
  window.addEventListener('pagehide',()=>{paused=true;if(timer)clearTimeout(timer);timer=null;});
  window.addEventListener('pageshow',event=>{if(event.persisted){paused=false;void poll();}});
  void (async()=>{try{await syncState();}catch(error){serviceOnline=false;renderAccount();message(error.message,'error');}finally{timer=setTimeout(poll,1000);}})();
})();
