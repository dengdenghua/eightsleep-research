#!/usr/bin/env python3
"""Loopback-only Eight Sleep CN live reader. Credentials/captures stay in RAM."""
import argparse
import base64
import datetime as dt
from concurrent.futures import ThreadPoolExecutor, wait
import hashlib
import http.client
import json
import math
import mimetypes
import secrets
import socket
import ssl
import threading
import time
import urllib.error
import urllib.parse
import urllib.request
import webbrowser
from http.cookies import SimpleCookie
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
AUTH_URL = 'https://auth-api-proxy.8slp.net.cn/v1/tokens'
ORIGINS = {'app':'https://app-api-proxy.8slp.net.cn','client':'https://client-api-proxy.8slp.net.cn'}
DEFAULT_CONFIG = Path.home()/'Downloads/eightsleep-firmware-research-20261107/analysis/account-readonly/auth-flow/client-config.json'
MAX_BYTES, MAX_EVENTS, MAX_SAMPLES, MAX_LINE = 8*1024*1024, 4000, 200000, 256*1024
ACTIVE = ('connecting','running')

def finite_float(value):
    number=float(value)
    if not math.isfinite(number):raise ValueError("Non-finite JSON number")
    return number

def reject_constant(value):
    raise ValueError("Non-finite JSON constant")

def is_finite_number(value):
    if not isinstance(value,(float,int)) or isinstance(value,bool):return False
    try:return math.isfinite(value)
    except OverflowError:return False

def utc_now():
    return dt.datetime.now(dt.timezone.utc).isoformat(timespec='milliseconds').replace('+00:00','Z')

class ApiError(Exception):
    def __init__(self, status, message, upstream_status=None):
        super().__init__(message); self.status=status; self.message=message; self.upstream_status=upstream_status
    def body(self):
        b={'ok':False,'message':self.message}
        if self.upstream_status is not None:b['upstream_status']=self.upstream_status
        return b

class NoRedirect(urllib.request.HTTPRedirectHandler):
    def redirect_request(self, req, fp, code, msg, headers, newurl):return None

def upstream_error(code):
    messages={400:'官方服务未接受请求，请核对账号或请求条件。',401:'登录已失效或账号密码不正确，请重新登录。',403:'官方服务拒绝访问，请在官方 App 核对账号及设备权限。',404:'官方接口返回 404，未取得数据；不能仅凭此判断设备离线。',429:'官方服务限制了请求，请稍后再试。'}
    return ApiError(502,messages.get(code,'官方服务暂时无法完成请求。'),code)

class CloudClient:
    mode='live'
    def __init__(self,config=None):
        self.config=config
        if config and config.get('token_url')!=AUTH_URL:raise ValueError('Unexpected authentication destination')
    @property
    def configured(self):return bool(self.config and self.config.get('client_id') and self.config.get('client_secret'))
    def _json(self,url,token=None,payload=None,timeout=8):
        headers={'Accept':'application/json','User-Agent':'EightSleepLocalResearch/2.0'}
        if token:headers['Authorization']='Bearer '+token
        data=None
        if payload is not None:headers['Content-Type']='application/json';data=json.dumps(payload).encode()
        request=urllib.request.Request(url,data=data,headers=headers,method='POST' if payload is not None else 'GET')
        try:
            with urllib.request.build_opener(NoRedirect()).open(request,timeout=timeout) as r:
                data=r.read(4*1024*1024+1)
                if len(data)>4*1024*1024:raise ApiError(502,'官方响应超过大小限制。')
                return json.loads(data)
        except urllib.error.HTTPError as e:
            code=e.code;e.close();raise upstream_error(code) from None
        except ApiError:raise
        except Exception:raise ApiError(502,'官方服务连接失败，未自动重试。') from None
    def auth(self,email,password):
        if not self.configured:raise ApiError(503,'当前电脑缺少国行登录配置，请查看项目启动说明。')
        return self._json(AUTH_URL,payload={'client_id':self.config['client_id'],'client_secret':self.config['client_secret'],'grant_type':'password','username':email.strip(),'password':password.strip()})
    def get_user(self,token):return self._json(ORIGINS['client']+'/v1/users/me',token)
    def get_household(self,token,user_id):return self._json(ORIGINS['app']+'/v1/household/users/'+urllib.parse.quote(user_id,safe='')+'/summary',token)
    def get_device(self,token,device_id):return self._json(ORIGINS['client']+'/v1/devices/'+urllib.parse.quote(device_id,safe=''),token,timeout=5)
    def stream_live(self,token,device_id,capture):
        # No redirects; the destination is fixed and TLS verification stays enabled.
        conn=http.client.HTTPSConnection('app-api-proxy.8slp.net.cn',timeout=min(10,capture.duration),context=ssl.create_default_context())
        sock=None
        try:
            capture.set_phase('tcp_tls')
            conn.connect();sock=conn.sock
            def cancel():
                try:sock.shutdown(socket.SHUT_RDWR)
                except OSError:pass
            capture.set_cancel(cancel)
            if capture.stop_event.is_set():return
            # The capture deadline owns idle/header waits; 8 seconds is not a stream lifetime.
            sock.settimeout(max(.1,capture.remaining_seconds())+.25)
            capture.set_phase('request')
            conn.request('GET','/v1/devices/'+urllib.parse.quote(device_id,safe='')+'/live',headers={'Authorization':'Bearer '+token,'Accept':'text/event-stream','User-Agent':'EightSleepLocalResearch/2.0'})
            capture.set_phase('response_headers')
            response=conn.getresponse();capture.set_http(response.status,response.getheader('Content-Type','').split(';')[0])
            if response.status!=200:raise upstream_error(response.status)
            while not capture.stop_event.is_set():
                chunk=response.read1(16384)
                if not chunk:break
                if not capture.feed(chunk):break
            if not capture.stop_event.is_set():capture.finish_input()
        finally:
            conn.close()
            if sock:
                try:sock.close()
                except OSError:pass

class EventFramer:
    """NDJSON plus standard SSE compatibility; retain exact received event lines."""
    def __init__(self):self.pending=b'';self.sse=[];self.sse_raw=[];self.errors=0
    def _parse(self,data,raw,framing):
        try:
            obj=json.loads(data,parse_float=finite_float,parse_constant=reject_constant)
            if not isinstance(obj,dict):raise ValueError()
            return {'data':obj,'raw_text':raw,'framing':framing}
        except (ValueError,UnicodeError):self.errors+=1;return None
    def _sse_event(self):
        if not self.sse:
            self.sse_raw=[];return None
        result=self._parse('\n'.join(self.sse),'\n'.join(self.sse_raw),'sse')
        self.sse=[];self.sse_raw=[];return result
    def feed(self,chunk,final=False):
        self.pending+=chunk
        if len(self.pending)>MAX_LINE and b'\n' not in self.pending:raise ApiError(502,'实时消息单行超过大小限制。')
        lines=self.pending.split(b'\n');self.pending=lines.pop()
        if final and self.pending:lines.append(self.pending);self.pending=b''
        result=[]
        for line in lines:
            if len(line)>MAX_LINE:raise ApiError(502,'实时消息单行超过大小限制。')
            try:text=line.decode('utf-8').rstrip('\r')
            except UnicodeError:self.errors+=1;continue
            event=None
            if not text:event=self._sse_event()
            elif text.startswith('data:'):
                self.sse_raw.append(text);self.sse.append(text[5:].removeprefix(' '))
                if sum(map(len,self.sse_raw))>MAX_LINE:raise ApiError(502,'SSE事件超过大小限制。')
            elif text.startswith((':','event:','id:','retry:')):
                if not text.startswith(':'):self.sse_raw.append(text)
            elif text.lstrip().startswith('{'):event=self._parse(text,text,'ndjson')
            else:self.errors+=1
            if event:result.append(event)
        if final:
            event=self._sse_event()
            if event:result.append(event)
        return result

class Capture:
    def __init__(self,cloud,token,device,duration):
        self.id=secrets.token_hex(8);self.cloud=cloud;self.token=token;self.device=dict(device);self.duration=duration
        self.lock=threading.RLock();self.stop_event=threading.Event();self.cancel=None;self.events=[];self.framer=EventFramer()
        self.status='connecting';self.reason=None;self.message='正在连接实时接口';self.http_status=None;self.content_type=None
        self.started_at=utc_now();self.started=time.monotonic();self.ended=None;self.bytes=0;self.sample_count=0
        self.thread=None;self.phase='pending';self.error_kind=None
    def remaining_seconds(self):
        return max(0,self.duration-(time.monotonic()-self.started))
    def set_phase(self,phase):
        if phase not in ('tcp_tls','request','response_headers','stream'):raise ValueError('Unknown phase')
        with self.lock:
            if not self.stop_event.is_set():self.phase=phase
    def start(self):
        self.thread=threading.Thread(target=self._run,daemon=True);self.thread.start()
        threading.Thread(target=self._deadline,daemon=True).start()
    def _deadline(self):
        if not self.stop_event.wait(self.remaining_seconds()):self.stop('time_limit')
    def set_cancel(self,callback):
        with self.lock:self.cancel=callback;stopped=self.stop_event.is_set()
        if stopped:callback()
    def set_http(self,status,content_type):
        with self.lock:
            self.http_status=status;self.content_type=content_type
            if not self.stop_event.is_set() and status==200:self.phase='stream'
            if not self.stop_event.is_set() and status==200:self.status='running';self.message='连接已建立，等待实时事件'
    def _record(self,parsed):
        data=parsed['data'];samples=data.get('samples');valid=[]
        if isinstance(samples,list):valid=[v for v in samples if is_finite_number(v)]
        with self.lock:
            if self.stop_event.is_set():return
            if len(self.events)>=MAX_EVENTS or self.sample_count+len(valid)>MAX_SAMPLES:self.stop('data_limit');return
            event={'seq':len(self.events)+1,'received_at':utc_now(),'type':data.get('type','unknown'),'timestamp':data.get('timestamp'),**parsed}
            if isinstance(samples,list):event['samples']=samples
            if self.cloud.mode=='demo':event['synthetic']=True
            self.events.append(event);self.sample_count+=len(valid);self.message='正在接收实时事件'
    def feed(self,chunk):
        with self.lock:
            if self.stop_event.is_set():return False
            if self.bytes+len(chunk)>MAX_BYTES:self.stop('data_limit');return False
            self.bytes+=len(chunk)
        for event in self.framer.feed(chunk):self._record(event)
        return not self.stop_event.is_set()
    def finish_input(self):
        for event in self.framer.feed(b'',final=True):self._record(event)
    def stop(self,reason='user_stop'):
        with self.lock:
            if self.stop_event.is_set():return
            self.reason=reason;self.status='completed' if reason in ('time_limit','data_limit','end_of_stream') else 'stopped'
            self.message={'time_limit':'采集时限已到','data_limit':'已达到采集容量上限','end_of_stream':'服务器结束了数据流','user_stop':'已停止采集','logout':'登录会话已结束'}.get(reason,'采集已结束')
            if reason=='time_limit' and self.http_status is None:
                self.status='error';self.reason='response_wait_limit';self.error_kind='deadline'
                self.message='采集时限内未收到官方 HTTP 响应，不能据此判定设备离线。'
            self.ended=time.monotonic();self.stop_event.set();cancel=self.cancel
        if cancel:
            try:cancel()
            except Exception:pass
    def _run(self):
        try:
            self.cloud.stream_live(self.token,self.device['id'],self)
            self.stop('end_of_stream')
        except Exception as e:
            with self.lock:
                if not self.stop_event.is_set():
                    self.error_kind=('timeout' if isinstance(e,TimeoutError) else 'tls' if isinstance(e,ssl.SSLError) else 'dns' if isinstance(e,socket.gaierror) else 'http' if isinstance(e,ApiError) and e.upstream_status else 'network' if isinstance(e,OSError) else 'protocol')
                    self.status='error';self.reason='http_error' if isinstance(e,ApiError) and e.upstream_status else 'connection_error'
                    self.message=e.message if isinstance(e,ApiError) else '实时连接中断或超时，未自动重连。'
                    if isinstance(e,ApiError) and e.upstream_status:self.http_status=e.upstream_status
                    self.ended=time.monotonic();self.stop_event.set()
        finally:
            with self.lock:self.token=None;self.cancel=None
    def summary(self):
        with self.lock:
            return {'id':self.id,'status':self.status,'reason':self.reason,'phase':self.phase,'error_kind':self.error_kind,'message':self.message,'http_status':self.http_status,'content_type':self.content_type,'event_count':len(self.events),'sample_count':self.sample_count,'bytes':self.bytes,'elapsed_seconds':round((self.ended or time.monotonic())-self.started,2),'limit_seconds':self.duration,'started_at':self.started_at,'parse_errors':self.framer.errors,'device':self.device,'mode':self.cloud.mode}
    def read_events(self,after=0):
        with self.lock:return [dict(e) for e in self.events if e['seq']>after]

class Session:
    def __init__(self,cloud,durations=(15,30,60)):
        self.cloud=cloud;self.durations=durations;self.csrf=secrets.token_urlsafe(32);self.lock=threading.RLock();self.op_lock=threading.Lock()
        self.token=None;self.expires=0;self.email_masked=None;self.devices=[];self.capture=None;self.failures=0;self.last_seen=time.monotonic();self.generation=0
    def authenticated(self):
        if self.token and time.time()>=self.expires:self.logout()
        return bool(self.token)
    def require_token(self):
        with self.lock:
            if not self.authenticated():raise ApiError(401,'请先登录国行账号。')
            return self.token,self.generation
    def require_snapshot(self,token,generation):
        with self.lock:
            if generation!=self.generation or token!=self.token or not self.authenticated():
                raise ApiError(401,'登录会话已结束。')
    def primary_read(self,token,generation,method,*args):
        self.require_snapshot(token,generation)
        try:result=method(token,*args)
        except ApiError as e:
            if e.upstream_status==401:
                # A delayed response from an old session must not clear a new one.
                with self.lock:
                    if generation==self.generation and token==self.token:self.logout()
                raise ApiError(401,'登录已失效，请重新登录。',401) from None
            raise
        self.require_snapshot(token,generation)
        return result
    def login(self,payload):
        email=payload.get('email');password=payload.get('password')
        if not isinstance(email,str) or not isinstance(password,str) or not email.strip() or not password.strip() or len(email)>320 or len(password)>4096:raise ApiError(400,'请填写有效的邮箱和密码。')
        if not self.op_lock.acquire(False):raise ApiError(409,'已有登录或设备查询正在进行。')
        try:
            with self.lock:
                if self.authenticated():raise ApiError(409,'已有登录会话，请先退出再切换账号。')
                if self.failures>=3:raise ApiError(429,'连续登录失败已达3次，请先在官方 App 核对账号。')
                generation=self.generation
            try:r=self.cloud.auth(email,password)
            except ApiError:
                with self.lock:self.failures+=1
                raise
            token=r.get('access_token') if isinstance(r,dict) else None
            if not isinstance(token,str) or not token or str(r.get('token_type','bearer')).lower()!='bearer':raise ApiError(502,'官方登录响应格式不支持。')
            try:ttl=float(r.get('expires_in',3600))
            except (ValueError,TypeError,OverflowError):raise ApiError(502,'官方令牌有效期格式不支持。')
            if not math.isfinite(ttl) or ttl<=0:raise ApiError(502,'官方令牌已过期。')
            with self.lock:
                if generation!=self.generation:raise ApiError(409,'登录已取消。')
                self.token=token;self.expires=time.time()+min(ttl,86400);self.failures=0;self.devices=[];self.capture=None
                name,_,domain=email.strip().partition('@');self.email_masked=name[:2]+'***'+('@'+domain if domain else '')
            return {'ok':True,'message':'登录成功，正在读取绑定设备。'}
        finally:password=None;self.op_lock.release()
    def refresh_devices(self):
        if not self.op_lock.acquire(False):raise ApiError(409,'已有登录或设备查询正在进行。')
        try:
            token,generation=self.require_token();me=self.primary_read(token,generation,self.cloud.get_user)
            user=me.get('user') if isinstance(me,dict) else None;uid=user.get('userId') if isinstance(user,dict) else None
            if not isinstance(uid,str) or not uid or len(uid)>256:raise ApiError(502,'当前用户响应缺少userId，未继续查询设备。')
            summary=self.primary_read(token,generation,self.cloud.get_household,uid)
            households=summary.get('households') if isinstance(summary,dict) else None
            if not isinstance(households,list):raise ApiError(502,'绑定设备响应格式不支持，不能判断为没有设备。')
            devices={}
            for h in households:
                if not isinstance(h,dict) or not isinstance(h.get('sets'),list):raise ApiError(502,'家庭设备集合格式不支持，不能判断为没有设备。')
                for group in h['sets']:
                    if not isinstance(group,dict) or not isinstance(group.get('devices'),list):raise ApiError(502,'绑定设备集合格式不支持，不能判断为没有设备。')
                    for raw in group['devices']:
                        if not isinstance(raw,dict):raise ApiError(502,'绑定设备条目格式不支持。')
                        did=raw.get('deviceId')
                        if not isinstance(did,str) or not did.strip() or len(did)>256:raise ApiError(502,'绑定设备条目缺少有效的deviceId。')
                        if did in devices:continue
                        d={'id':did,'name':str(raw.get('deviceName') or '未命名设备')[:200],'model':str(raw.get('specialization') or '未知'),'online':None,'firmware':None,'household':str(h.get('householdId') or h.get('id') or ''),'set':str(group.get('setId') or group.get('id') or '')}
                        devices[did]=d
                        if len(devices)>64:raise ApiError(502,'绑定设备数量超过本工具限制。')
            # Directory is authoritative even when individual status reads fail.
            # Bound detail lookup separately; workers never mutate session state.
            self.require_snapshot(token,generation)
            pool=ThreadPoolExecutor(max_workers=8);jobs={};done=set();pending=set()
            cancelled=threading.Event();deadline=time.monotonic()+8
            def read_detail(did):
                self.require_snapshot(token,generation)
                if cancelled.is_set() or time.monotonic()>=deadline:raise ApiError(408,'详情查询已结束。')
                return self.cloud.get_device(token,did)
            try:
                for did in devices:
                    self.require_snapshot(token,generation)
                    jobs[pool.submit(read_detail,did)]=did
                pending=set(jobs)
                while pending:
                    self.require_snapshot(token,generation)
                    remaining=deadline-time.monotonic()
                    if remaining<=0:break
                    completed,pending=wait(pending,timeout=min(.1,remaining))
                    done.update(completed)
                self.require_snapshot(token,generation)
            finally:
                cancelled.set()
                for job in jobs:
                    if not job.done():job.cancel()
                pool.shutdown(wait=False,cancel_futures=True)
            for job in done:
                d=devices[jobs[job]]
                try:
                    detail=job.result();r=detail.get('result') if isinstance(detail,dict) else None
                    if isinstance(r,dict):
                        d['online']=r.get('online') if type(r.get('online')) is bool else None
                        d['model']=str(r.get('modelString') or d['model'])[:200]
                        d['firmware']=str(r.get('firmwareVersion') or r.get('firmwareCommit') or '')[:200] or None
                    else:d['status_error']='设备详情格式未识别'
                except ApiError as e:d['status_error']=e.message;d['status_http']=e.upstream_status
                except Exception:d['status_error']='设备详情暂时不可读取'
            for job in pending:
                job.cancel();devices[jobs[job]]['status_error']='详情查询达到时限，在线状态未知'
            with self.lock:
                self.require_snapshot(token,generation)
                self.devices=list(devices.values())
                return {'ok':True,'devices':self.devices}
        finally:self.op_lock.release()
    def logout(self):
        with self.lock:
            self.generation+=1
            if self.capture:self.capture.stop('logout')
            self.token=None;self.expires=0;self.devices=[];self.capture=None;self.email_masked=None
    def start_capture(self,payload):
        with self.lock:
            token,_=self.require_token()
            if self.capture and self.capture.status in ACTIVE:raise ApiError(409,'已有采集进行中，请先停止。')
            duration=payload.get('duration_seconds',30)
            if type(duration) is not int or duration not in self.durations:raise ApiError(400,'请选择支持的采集时长。')
            device=next((d for d in self.devices if d['id']==payload.get('device_id')),None)
            if device is None:raise ApiError(403,'只能读取本次账号查询到的绑定设备。')
            self.capture=Capture(self.cloud,token,device,duration);self.capture.start()
            return {'ok':True,'capture':self.capture.summary()}
    def state(self):
        with self.lock:
            authenticated=self.authenticated()
            capture=self.capture.summary() if self.capture else {'status':'idle','event_count':0,'sample_count':0,'bytes':0,'elapsed_seconds':0,'events':[]}
            return {'ok':True,'csrf':self.csrf,'mode':self.cloud.mode,'configured':self.cloud.configured,'authenticated':authenticated,'account':{'email_masked':self.email_masked} if authenticated else None,'devices':self.devices,'capture':capture}

class DemoCloud(CloudClient):
    mode='demo'
    @property
    def configured(self):return True
    def auth(self,email,password):return {'access_token':'synthetic-demo-token','expires_in':3600}
    def get_user(self,token):return {'user':{'userId':'demo-user'}}
    def get_household(self,token,user_id):return {'households':[{'sets':[{'devices':[{'deviceId':'demo-pod','deviceName':'模拟设备 · 非实机','specialization':'Pod（演示）'}]}]}]}
    def get_device(self,token,device_id):return {'result':{'online':True,'modelString':'演示模型','firmwareVersion':'synthetic'}}
    def stream_live(self,token,device_id,capture):
        capture.set_http(200,'application/x-ndjson');i=0
        while not capture.stop_event.wait(.2):
            data={'type':'piezo','timestamp':utc_now(),'samples':[round(1000*math.sin((i*50+j)/13),2) for j in range(50)]}
            if not capture.feed((json.dumps(data)+'\n').encode()):break
            i+=1

class LiveServer(ThreadingHTTPServer):
    daemon_threads=True
    def __init__(self,address,cloud,root=ROOT,durations=(15,30,60)):
        super().__init__(address,Handler);self.cloud=cloud;self.root=Path(root).resolve();self.sessions={};self.sessions_lock=threading.Lock();self.durations=durations
        self.origin='http://127.0.0.1:'+str(self.server_port)
        self.cookie_name='es_local_session_'+str(self.server_port)
    def new_session(self):
        with self.sessions_lock:
            now=time.monotonic()
            for key,s in list(self.sessions.items()):
                if now-s.last_seen>7200:s.logout();del self.sessions[key]
            if len(self.sessions)>=16:raise ApiError(503,'本地会话过多，请关闭不用的窗口后重启工具。')
            key=secrets.token_urlsafe(32);s=Session(self.cloud,self.durations);self.sessions[key]=s;return key,s
    def server_close(self):
        with self.sessions_lock:sessions=list(self.sessions.values())
        for s in sessions:s.logout()
        super().server_close()

class Handler(BaseHTTPRequestHandler):
    server_version='EightSleepLocal/2.0'
    def log_message(self,*args):pass
    def _host(self):return self.headers.get('Host')==self.server.origin.removeprefix('http://')
    def _session(self,create=False):
        cookie=SimpleCookie()
        try:cookie.load(self.headers.get('Cookie',''))
        except Exception:pass
        value=cookie.get(self.server.cookie_name);sid=value.value if value else None
        with self.server.sessions_lock:s=self.server.sessions.get(sid)
        if s:s.last_seen=time.monotonic();return sid,s
        if create:return self.server.new_session()
        raise ApiError(401,'本地会话已结束，请重新打开登录页。')
    def _check_read(self):
        if not self._host():raise ApiError(403,'本地请求地址不匹配。')
        origin=self.headers.get('Origin')
        if origin is not None and origin!=self.server.origin:raise ApiError(403,'请求来源不匹配。')
        if self.headers.get('Sec-Fetch-Site') in ('cross-site','same-site'):raise ApiError(403,'请从本地采集页面操作。')
    def reply(self,status,data,content_type='application/json; charset=utf-8',cookie=None,filename=None,report=False):
        if not isinstance(data,bytes):data=json.dumps(data,ensure_ascii=False,allow_nan=False).encode()
        self.send_response(status);self.send_header('Content-Type',content_type);self.send_header('Content-Length',str(len(data)));self.send_header('Cache-Control','no-store');self.send_header('X-Content-Type-Options','nosniff');self.send_header('Referrer-Policy','no-referrer');self.send_header('X-Frame-Options','DENY')
        self.send_header('Content-Security-Policy',"default-src 'none'; script-src 'self'"+(" 'unsafe-inline'" if report else '')+"; style-src 'self'"+(" 'unsafe-inline'" if report else '')+"; img-src 'self' data:; connect-src 'self'; form-action 'self'; frame-ancestors 'none'; base-uri 'none'")
        if cookie:self.send_header('Set-Cookie',self.server.cookie_name+'='+cookie+'; Path=/; HttpOnly; SameSite=Strict')
        if filename:self.send_header('Content-Disposition','attachment; filename="'+filename+'"')
        self.end_headers()
        try:self.wfile.write(data)
        except (BrokenPipeError,ConnectionResetError):pass
    def _error(self,e):self.reply(e.status,e.body())
    def do_GET(self):
        try:
            if not self._host():raise ApiError(403,'本地请求地址不匹配。')
            url=urllib.parse.urlsplit(self.path);path=url.path
            if path.startswith('/api/') :self._check_read()
            if path in ('/','/live/','/live/index.html'):
                sid,_=self._session(True);return self.reply(200,(self.server.root/'live/index.html').read_bytes(),'text/html; charset=utf-8',cookie=sid)
            if path in ('/live.js','/live.css','/live/live.js','/live/live.css'):
                name=path.rsplit('/',1)[-1];return self.reply(200,(self.server.root/'live'/name).read_bytes(),'text/javascript; charset=utf-8' if name.endswith('.js') else 'text/css; charset=utf-8')
            if path.startswith('/report/'):
                rel=urllib.parse.unquote(path[len('/report/'):]);p=(self.server.root/rel).resolve()
                if p.is_relative_to(self.server.root) and p.is_file() and (str(p.relative_to(self.server.root))=='index.html' or p.relative_to(self.server.root).parts[0] in ('wiki','data','evidence','analysis-tools','reconstructions')):
                    return self.reply(200,p.read_bytes(),mimetypes.guess_type(p)[0] or 'application/octet-stream',report=True)
                raise ApiError(404,'文件不存在。')
            _,s=self._session()
            if path=='/api/state':return self.reply(200,s.state())
            if path=='/api/devices':return self.reply(200,s.refresh_devices())
            if path=='/api/capture':
                s.require_token()
                try:after=max(0,int(urllib.parse.parse_qs(url.query).get('after',['0'])[0]))
                except ValueError:raise ApiError(400,'事件游标无效。')
                with s.lock:c=s.capture
                return self.reply(200,{'ok':True,'capture':c.summary() if c else {'status':'idle'},'events':c.read_events(after) if c else []})
            if path in ('/api/export/events','/api/export/meta'):
                s.require_token()
                with s.lock:c=s.capture
                if not c:raise ApiError(404,'还没有采集记录。')
                if c.status in ACTIVE:raise ApiError(409,'请先停止采集再下载，保证两份文件对应同一记录。')
                if path.endswith('/events'):
                    data=b''.join((json.dumps(e,ensure_ascii=False,allow_nan=False)+'\n').encode() for e in c.read_events())
                    return self.reply(200,data,'application/x-ndjson; charset=utf-8',filename='eightsleep-'+c.id+'.jsonl')
                meta=c.summary();meta.update(schema='eightsleep-local-live-v1',event_sha256=hashlib.sha256(b''.join((json.dumps(e,ensure_ascii=False,allow_nan=False)+'\n').encode() for e in c.read_events())).hexdigest(),limits={'max_bytes':MAX_BYTES,'max_events':MAX_EVENTS,'max_samples':MAX_SAMPLES},scope='App live events; sample rate/units/channel mapping unverified; not the complete raw upload stream.')
                return self.reply(200,meta,filename='eightsleep-'+c.id+'-meta.json')
            raise ApiError(404,'入口不存在。')
        except ApiError as e:self._error(e)
        except Exception:self.reply(500,{'ok':False,'message':'本地处理失败；未输出账号或认证信息，请重试打开页面。'})
    def do_POST(self):
        try:
            self._check_read();_,s=self._session()
            if self.headers.get('Origin')!=self.server.origin or not secrets.compare_digest(self.headers.get('X-CSRF-Token',''),s.csrf):raise ApiError(403,'请求来源不匹配，请重新打开页面。')
            if self.headers.get_content_type()!='application/json':raise ApiError(415,'需要JSON请求。')
            try:
                size=int(self.headers.get('Content-Length','0'))
                if not 0<size<=16384:raise ValueError()
                payload=json.loads(self.rfile.read(size))
                if not isinstance(payload,dict):raise ValueError()
            except (ValueError,UnicodeError):raise ApiError(400,'请求格式无效。')
            path=urllib.parse.urlsplit(self.path).path
            if path=='/api/login':return self.reply(200,s.login(payload))
            if path=='/api/logout':s.logout();return self.reply(200,{'ok':True,'message':'已退出并清空本地会话与采集记录。'})
            s.require_token()
            if path=='/api/capture/start':return self.reply(200,s.start_capture(payload))
            if path=='/api/capture/stop':
                with s.lock:
                    if s.capture:s.capture.stop()
                return self.reply(200,{'ok':True})
            if path=='/api/capture/clear':
                with s.lock:
                    if s.capture and s.capture.status in ACTIVE:raise ApiError(409,'请先停止采集。')
                    s.capture=None
                return self.reply(200,{'ok':True})
            raise ApiError(404,'入口不存在。')
        except ApiError as e:self._error(e)
        except Exception:self.reply(500,{'ok':False,'message':'本地处理失败，未自动重试。'})

def make_server(cloud,port=0,root=ROOT,durations=(15,30,60)):
    return LiveServer(('127.0.0.1',port),cloud,root,durations)

def main():
    ap=argparse.ArgumentParser(description=__doc__);ap.add_argument('--port',type=int,default=58764);ap.add_argument('--client-config',type=Path,default=DEFAULT_CONFIG);ap.add_argument('--demo',action='store_true');ap.add_argument('--open',action='store_true');args=ap.parse_args()
    config=None
    if not args.demo and args.client_config.is_file():
        raw=json.loads(args.client_config.read_text())
        config=raw if 'token_url' in raw else {'token_url':raw.get('endpoint'),**raw.get('body_defaults',{})}
    server=make_server(DemoCloud() if args.demo else CloudClient(config),port=args.port)
    print('LOCAL_LIVE_URL='+server.origin,flush=True);print('MODE='+server.cloud.mode+'; loopback only; passwords/tokens/captures are not saved by the server.',flush=True)
    if args.open:webbrowser.open(server.origin)
    try:server.serve_forever()
    except KeyboardInterrupt:pass
    finally:server.server_close()
if __name__=='__main__':main()
