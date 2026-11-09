"""Offline behavior tests. Cloud replies and all credentials here are synthetic.

Only an ephemeral 127.0.0.1 HTTP server is contacted. No official request is made.
Run from project root: python3 -m unittest discover -s tests -v
"""
import hashlib
import http.client
import http.cookiejar
import importlib.util
import io
import json
from pathlib import Path
from http.cookies import SimpleCookie
import threading
import time
import unittest
import urllib.request
from unittest.mock import patch

ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location('live_server', ROOT/'tools/live_server.py')
live = importlib.util.module_from_spec(spec)
spec.loader.exec_module(live)
TEST_EMAIL = 'tester@example.invalid'
TEST_PASSWORD = 'SYNTHETIC_PASSWORD'
TEST_TOKEN = 'SYNTHETIC_ACCESS_TOKEN'
TEST_REFRESH = 'SYNTHETIC_REFRESH_TOKEN'


class FakeCloud:
    mode = 'live'
    configured = True
    def __init__(self):
        self.calls = []
        self.hold = False
        self.http_status = 200
        self.captures = []
        self.chunks = [
            b'{"type":"piezo","timestamp":101,"samples":[1,2,3]}\n',
            b'data: {"type":"tap","timestamp":102}\n\n',
        ]
    def auth(self, email, password):
        self.calls.append(('auth', email, password))
        return {'access_token':TEST_TOKEN,'refresh_token':TEST_REFRESH,'token_type':'bearer',
                'userId':'DO_NOT_USE_TOKEN_USER','expires_in':3600}
    def get_user(self, token):
        self.calls.append(('user', token))
        return {'user':{'userId':'USER_FROM_ME'}}
    def get_household(self, token, user_id):
        self.calls.append(('household', token, user_id))
        return {'households':[{'householdId':'test-house','sets':[{'setId':'test-set','devices':[
            {'deviceId':'owned-device','deviceName':'Test Pod','specialization':'pod'},
            {'deviceId':'owned-device','deviceName':'duplicate'},
            {'deviceId':'second-device','deviceName':'Second Pod','specialization':'pod'},
        ]}]}]}
    def get_device(self, token, device_id):
        self.calls.append(('device', token, device_id))
        return {'result':{'online':True if device_id=='owned-device' else 'false',
                          'modelString':'TestModel','firmwareVersion':'TEST_VERSION'}}
    def stream_live(self, token, device_id, capture):
        self.calls.append(('live', token, device_id));self.captures.append(capture)
        capture.set_http(self.http_status, 'text/event-stream')
        if self.http_status != 200:
            raise live.upstream_error(self.http_status)
        for chunk in self.chunks:
            if not capture.feed(chunk):return
        if self.hold:
            capture.stop_event.wait(3)
        capture.finish_input()


class Browser:
    def __init__(self, server):
        self.server = server;self.cookie='';self.csrf=''
    def request(self, method, path, payload=None, headers=None, raw=None):
        h = {'Cookie':self.cookie}
        body = raw
        if method == 'POST':
            h.update({'Origin':self.server.origin,'X-CSRF-Token':self.csrf,
                      'Content-Type':'application/json'})
            if body is None:body=json.dumps(payload if payload is not None else {}).encode()
        h.update(headers or {})
        conn=http.client.HTTPConnection('127.0.0.1',self.server.server_port,timeout=3)
        try:
            conn.request(method,path,body=body,headers=h)
            response=conn.getresponse();data=response.read();rh=dict(response.getheaders())
            if 'Set-Cookie' in rh:
                cookies=SimpleCookie();cookies.load(rh['Set-Cookie'])
                name=self.server.cookie_name
                self.cookie=name+'='+cookies[name].value
            return response.status,data,rh
        finally:conn.close()
    def json(self, method, path, payload=None, **kwargs):
        status,data,headers=self.request(method,path,payload,**kwargs)
        return status,json.loads(data),headers
    def open(self):
        status,_,headers=self.request('GET','/');assert status==200
        _,state,_=self.json('GET','/api/state');self.csrf=state['csrf']
        return headers,state


class LiveHTTPTests(unittest.TestCase):
    def setUp(self):
        self.cloud=FakeCloud();self.server=live.make_server(self.cloud,durations=(1,15,30,60))
        self.thread=threading.Thread(target=lambda:self.server.serve_forever(poll_interval=.01),daemon=True)
        self.thread.start();self.browser=Browser(self.server);self.browser.open()
    def tearDown(self):
        self.server.shutdown();self.server.server_close();self.thread.join(1)
    def login(self,browser=None):
        browser=browser or self.browser
        status,body,_=browser.json('POST','/api/login',{'email':TEST_EMAIL,'password':TEST_PASSWORD})
        self.assertEqual(status,200,body)
        return body
    def devices(self,browser=None):
        browser=browser or self.browser
        status,body,_=browser.json('GET','/api/devices');self.assertEqual(status,200,body)
        return body['devices']
    def start(self,duration=15):
        self.login();self.devices()
        status,body,_=self.browser.json('POST','/api/capture/start',{'device_id':'owned-device','duration_seconds':duration})
        self.assertEqual(status,200,body);return body
    def finished(self,timeout=2):
        end=time.monotonic()+timeout
        while time.monotonic()<end:
            status,body,_=self.browser.json('GET','/api/capture')
            self.assertEqual(status,200)
            if body['capture']['status'] not in live.ACTIVE:return body
            threading.Event().wait(.01)
        self.fail('capture did not terminate within bounded test wait')
    def assert_no_secrets(self,body):
        if not isinstance(body,bytes):body=json.dumps(body).encode()
        for value in (TEST_PASSWORD,TEST_TOKEN,TEST_REFRESH,'DO_NOT_USE_TOKEN_USER'):
            self.assertNotIn(value.encode(),body)

    def test_login_uses_me_identity_and_lists_deduplicated_bound_devices(self):
        self.login();devices=self.devices()
        self.assertEqual([d['id'] for d in devices],['owned-device','second-device'])
        self.assertTrue(devices[0]['online']);self.assertIsNone(devices[1]['online'])
        self.assertIn(('household',TEST_TOKEN,'USER_FROM_ME'),self.cloud.calls)
        self.assertEqual(sum(c[0]=='device' for c in self.cloud.calls),2)
        _,state,_=self.browser.json('GET','/api/state')
        self.assertTrue(state['authenticated']);self.assertNotEqual(state['account']['email_masked'],TEST_EMAIL)
        self.assert_no_secrets(state)

    def test_unauthenticated_queries_do_not_call_cloud(self):
        for path in ['/api/devices','/api/capture','/api/export/events','/api/export/meta']:
            self.assertEqual(self.browser.request('GET',path)[0],401)
        self.assertEqual(self.cloud.calls,[])

    def test_wrong_origin_or_csrf_does_not_authenticate(self):
        for headers in [{'Origin':'https://example.invalid'}, {'X-CSRF-Token':'wrong'},
                        {'Origin':''},{'Sec-Fetch-Site':'cross-site'}]:
            status,_,_=self.browser.request('POST','/api/login',{'email':TEST_EMAIL,'password':TEST_PASSWORD},headers=headers)
            self.assertEqual(status,403)
        self.assertEqual(self.cloud.calls,[])

    def test_host_rebinding_and_foreign_reads_rejected(self):
        for headers in [{'Host':'example.invalid'},{'Origin':'https://example.invalid'},
                        {'Sec-Fetch-Site':'same-site'}]:
            self.assertEqual(self.browser.request('GET','/api/state',headers=headers)[0],403)
        self.assertEqual(self.browser.request('GET','/',headers={'Host':'example.invalid'})[0],403)
        self.assertEqual(self.server.server_address[0],'127.0.0.1')

    def test_cookie_restrictions_and_browser_session_isolation(self):
        other=Browser(self.server);headers,state=other.open()
        self.assertIn('HttpOnly',headers['Set-Cookie']);self.assertIn('SameSite=Strict',headers['Set-Cookie'])
        self.assertNotEqual(other.csrf,self.browser.csrf)
        self.login();self.devices()
        _,state,_=other.json('GET','/api/state')
        self.assertFalse(state['authenticated']);self.assertEqual(state['devices'],[])
        self.assertEqual(other.request('GET','/api/devices')[0],401)
        self.assertEqual(other.request('POST','/api/logout',headers={'X-CSRF-Token':self.browser.csrf})[0],403)
        self.assertTrue(self.browser.json('GET','/api/state')[1]['authenticated'])

    def test_two_local_ports_share_cookie_jar_without_overwriting_sessions(self):
        other=live.make_server(FakeCloud())
        thread=threading.Thread(target=lambda:other.serve_forever(poll_interval=.01),daemon=True)
        thread.start()
        jar=http.cookiejar.CookieJar()
        opener=urllib.request.build_opener(urllib.request.ProxyHandler({}),urllib.request.HTTPCookieProcessor(jar))
        def request(server,path,method='GET',payload=None,csrf=None):
            body=json.dumps(payload or {}).encode() if method=='POST' else None
            headers={'Origin':server.origin,'X-CSRF-Token':csrf,'Content-Type':'application/json'} if method=='POST' else {}
            req=urllib.request.Request(server.origin+path,data=body,headers=headers,method=method)
            with opener.open(req,timeout=2) as response:
                content=response.read()
                return json.loads(content) if path.startswith('/api/') else content
        try:
            request(self.server,'/')
            csrf_a=request(self.server,'/api/state')['csrf']
            request(self.server,'/api/login','POST',{'email':TEST_EMAIL,'password':TEST_PASSWORD},csrf_a)
            devices=request(self.server,'/api/devices')['devices']
            request(other,'/')
            state_b=request(other,'/api/state')
            self.assertFalse(state_b['authenticated']);self.assertEqual(state_b['devices'],[])
            self.assertNotEqual(self.server.cookie_name,other.cookie_name)
            self.assertEqual({cookie.name for cookie in jar},{self.server.cookie_name,other.cookie_name})
            self.assertTrue(request(self.server,'/api/state')['authenticated'])
            request(other,'/api/login','POST',{'email':TEST_EMAIL,'password':TEST_PASSWORD},state_b['csrf'])
            request(other,'/api/logout','POST',{},state_b['csrf'])
            state_a=request(self.server,'/api/state')
            self.assertTrue(state_a['authenticated']);self.assertEqual(state_a['devices'],devices)
            self.assertEqual(request(self.server,'/api/devices')['devices'],devices)
        finally:
            other.shutdown();other.server_close();thread.join(1)

    def test_only_catalog_device_can_start_and_invalid_duration_rejected(self):
        self.login();self.devices()
        for device in ['unowned-device','../devices/another','owned-device/live?x=1']:
            status,_,_=self.browser.json('POST','/api/capture/start',{'device_id':device,'duration_seconds':15})
            self.assertEqual(status,403)
        for duration in [0,86400,True,'15']:
            status,_,_=self.browser.json('POST','/api/capture/start',{'device_id':'owned-device','duration_seconds':duration})
            self.assertEqual(status,400)
        self.assertFalse(any(c[0]=='live' for c in self.cloud.calls))

    def test_ndjson_sse_export_is_complete_and_metadata_hash_matches(self):
        self.start();result=self.finished();capture=result['capture']
        self.assertEqual(capture['status'],'completed');self.assertEqual(capture['reason'],'end_of_stream')
        self.assertEqual(capture['event_count'],2);self.assertEqual(capture['sample_count'],3)
        status,raw,headers=self.browser.request('GET','/api/export/events');self.assertEqual(status,200)
        rows=[json.loads(x) for x in raw.splitlines()]
        self.assertEqual([r['type'] for r in rows],['piezo','tap'])
        self.assertEqual(rows[0]['samples'],[1,2,3]);self.assertEqual(rows[0]['timestamp'],101)
        self.assertEqual([r['framing'] for r in rows],['ndjson','sse'])
        self.assertIn('raw_text',rows[0]);self.assertIn('received_at',rows[0])
        self.assertIn('attachment',headers['Content-Disposition']);self.assertEqual(headers['Cache-Control'],'no-store')
        _,meta,_=self.browser.json('GET','/api/export/meta')
        self.assertEqual(meta['event_sha256'],hashlib.sha256(raw).hexdigest())
        self.assert_no_secrets(raw);self.assert_no_secrets(meta)
        _,page,_=self.browser.json('GET','/api/capture?after=1')
        self.assertEqual([e['seq'] for e in page['events']],[2])

    def test_stop_blocks_late_events_and_active_download(self):
        self.cloud.hold=True;self.start()
        self.assertEqual(self.browser.request('GET','/api/export/events')[0],409)
        self.assertEqual(self.browser.request('POST','/api/capture/clear')[0],409)
        self.assertEqual(self.browser.request('POST','/api/capture/start',{'device_id':'owned-device','duration_seconds':15})[0],409)
        self.assertEqual(self.browser.request('POST','/api/capture/stop')[0],200)
        result=self.finished();self.assertEqual(result['capture']['reason'],'user_stop')
        old_count=result['capture']['event_count'];c=self.cloud.captures[0]
        self.assertFalse(c.feed(b'{"type":"piezo","samples":[999]}\n'))
        self.assertEqual(c.summary()['event_count'],old_count)
        self.assertEqual(self.browser.request('POST','/api/capture/clear')[0],200)
        self.assertEqual(self.browser.request('GET','/api/export/events')[0],404)

    def test_capture_deadline_terminates_quiet_stream(self):
        self.cloud.hold=True;self.cloud.chunks=[]
        started=time.monotonic();self.start(duration=1);result=self.finished(timeout=2)
        self.assertEqual(result['capture']['reason'],'time_limit')
        self.assertEqual(result['capture']['event_count'],0)
        self.assertLess(time.monotonic()-started,2)

    def test_logout_cancels_and_discards_capture_without_late_resurrection(self):
        self.cloud.hold=True;self.start()
        c=self.cloud.captures[0]
        self.assertEqual(self.browser.request('POST','/api/logout')[0],200)
        self.assertTrue(c.stop_event.is_set());self.assertFalse(c.feed(b'{"type":"piezo","samples":[999]}\n'))
        _,state,_=self.browser.json('GET','/api/state')
        self.assertFalse(state['authenticated']);self.assertEqual(state['devices'],[])
        self.assertEqual(state['capture']['status'],'idle')
        self.assertEqual(self.browser.request('GET','/api/export/events')[0],401)
        c.thread.join(1);self.assertIsNone(c.token)

    def test_404_is_recorded_without_retry_or_invented_offline_reason(self):
        self.cloud.http_status=404;self.start();result=self.finished()
        self.assertEqual(result['capture']['http_status'],404)
        self.assertEqual(result['capture']['reason'],'http_error')
        self.assertEqual(result['capture']['event_count'],0)
        self.assertEqual(sum(c[0]=='live' for c in self.cloud.calls),1)
        self.assertNotEqual(result['capture']['reason'],'offline')

    def test_invalid_json_or_wrong_content_type_never_reaches_cloud(self):
        for raw in [b'[]',b'{bad',b'null',b'1']:
            self.assertEqual(self.browser.request('POST','/api/login',raw=raw)[0],400)
        self.assertEqual(self.browser.request('POST','/api/login',headers={'Content-Type':'text/plain'})[0],415)
        self.assertEqual(self.cloud.calls,[])

    def test_report_traversal_rejected(self):
        for path in ['/report/../tools/live_server.py','/report/%2e%2e/README.md',
                     '/report/%2Fetc/passwd','/report/tools/live_server.py']:
            status,body,_=self.browser.request('GET',path)
            self.assertEqual(status,404,path);self.assertNotIn(b'root:',body)
        self.assertEqual(self.browser.request('GET','/report/index.html')[0],200)

    def test_malformed_household_is_error_not_empty_success(self):
        self.login();before=self.devices();self.cloud.calls.clear()
        malformed=[None, {}, {'households':None}, {'households':{}},
                   {'households':[None]}, {'households':[{}]},
                   {'households':[{'sets':None}]}, {'households':[{'sets':{}}]},
                   {'households':[{'sets':[None]}]}, {'households':[{'sets':[{}]}]},
                   {'households':[{'sets':[{'devices':None}]}]},
                   {'households':[{'sets':[{'devices':{}}]}]}]
        for device in [None,[],{}, {'deviceId':None}, {'deviceId':123},
                       {'deviceId':''}, {'deviceId':' '}, {'deviceId':'x'*257}]:
            malformed.append({'households':[{'sets':[{'devices':[device]}]}]})
        for summary in malformed:
            with self.subTest(summary=summary):
                self.cloud.get_household=lambda *a,result=summary: result
                status,body,_=self.browser.json('GET','/api/devices')
                self.assertEqual(status,502,body);self.assertFalse(body['ok'])
                _,state,_=self.browser.json('GET','/api/state')
                self.assertTrue(state['authenticated']);self.assertEqual(state['devices'],before)
        self.assertFalse(any(c[0]=='device' for c in self.cloud.calls))

    def test_valid_empty_device_collections_are_empty_success(self):
        self.login()
        for summary in [{'households':[]}, {'households':[{'sets':[]}]},
                        {'households':[{'sets':[{'devices':[]}]}]}]:
            with self.subTest(summary=summary):
                self.cloud.get_household=lambda *a,result=summary: result
                self.assertEqual(self.devices(),[])
        self.assertFalse(any(c[0]=='device' for c in self.cloud.calls))

    def test_primary_401_ends_session_and_discards_capture(self):
        for method_name,expected_calls in [('get_user',['user']),('get_household',['user','household'])]:
            with self.subTest(method=method_name):
                self.start();previous=self.finished()['capture'];self.cloud.calls.clear()
                def unauthorized(*args):
                    self.cloud.calls.append(('user' if method_name=='get_user' else 'household',))
                    raise live.upstream_error(401)
                with patch.object(self.cloud,method_name,unauthorized):
                    status,body,_=self.browser.json('GET','/api/devices')
                self.assertEqual(status,401);self.assertEqual(body['upstream_status'],401)
                self.assertEqual([c[0] for c in self.cloud.calls],expected_calls)
                _,state,_=self.browser.json('GET','/api/state')
                self.assertFalse(state['authenticated']);self.assertEqual(state['devices'],[])
                self.assertEqual(state['capture']['status'],'idle')
                self.assertEqual(self.browser.request('GET','/api/export/meta')[0],401)
                self.assertGreater(previous['event_count'],0)

    def test_detail_401_keeps_login_catalog_and_completed_capture(self):
        self.start();before=self.finished()['capture']
        def unauthorized(*args):raise live.upstream_error(401)
        with patch.object(self.cloud,'get_device',unauthorized):devices=self.devices()
        self.assertEqual([d['id'] for d in devices],['owned-device','second-device'])
        self.assertTrue(all(d['status_http']==401 and d['online'] is None for d in devices))
        _,state,_=self.browser.json('GET','/api/state')
        self.assertTrue(state['authenticated']);self.assertEqual(state['capture']['id'],before['id'])
        self.assertEqual(state['capture']['event_count'],before['event_count'])
        self.assertEqual(self.browser.request('GET','/api/export/events')[0],200)

    def test_live_401_keeps_login_and_error_record_available_for_export(self):
        self.cloud.http_status=401;self.start();capture=self.finished()['capture']
        self.assertEqual(capture['status'],'error');self.assertEqual(capture['http_status'],401)
        _,state,_=self.browser.json('GET','/api/state')
        self.assertTrue(state['authenticated']);self.assertEqual(state['capture']['id'],capture['id'])
        status,meta,_=self.browser.json('GET','/api/export/meta')
        self.assertEqual(status,200);self.assertEqual(meta['http_status'],401)
        self.assertEqual(sum(c[0]=='live' for c in self.cloud.calls),1)

    def test_huge_integer_sample_preserves_payload_without_float_overflow(self):
        huge=10**1000
        self.cloud.chunks=[(json.dumps({'type':'piezo','samples':[huge,1]})+'\n').encode()]
        self.start();capture=self.finished()['capture']
        self.assertEqual(capture['status'],'completed');self.assertEqual(capture['sample_count'],1)
        status,raw,_=self.browser.request('GET','/api/export/events')
        self.assertEqual(status,200);self.assertEqual(json.loads(raw)['data']['samples'],[huge,1])

    def test_huge_token_lifetime_returns_format_error_without_partial_login(self):
        self.cloud.auth=lambda *args:{'access_token':TEST_TOKEN,'expires_in':10**1000}
        status,body,_=self.browser.json('POST','/api/login',{'email':TEST_EMAIL,'password':TEST_PASSWORD})
        self.assertEqual(status,502);self.assert_no_secrets(body)
        _,state,_=self.browser.json('GET','/api/state')
        self.assertFalse(state['authenticated']);self.assertEqual(state['devices'],[])

    def test_failure_does_not_expose_upstream_secret_details(self):
        self.cloud.auth=lambda *a: (_ for _ in ()).throw(live.upstream_error(401))
        for _ in range(3):
            status,body,_=self.browser.json('POST','/api/login',{'email':TEST_EMAIL,'password':TEST_PASSWORD})
            self.assertEqual(status,502);self.assert_no_secrets(body)
        self.assertEqual(self.browser.request('POST','/api/login',{'email':TEST_EMAIL,'password':TEST_PASSWORD})[0],429)


class ParserAndLifecycleTests(unittest.TestCase):
    def test_fragmented_utf8_ndjson_and_multiline_sse(self):
        f=live.EventFramer();payload='{"type":"piezo","label":"睡眠","samples":[1]}\r\n'.encode()
        events=[]
        for byte in payload:events.extend(f.feed(bytes([byte])))
        events.extend(f.feed(b'event: sensor\nid: abc\ndata: {"type":"button",\ndata: "timestamp":42}\n\n'))
        self.assertEqual(len(events),2);self.assertEqual(events[0]['data']['label'],'睡眠')
        self.assertEqual(events[1]['data']['timestamp'],42)
        self.assertEqual(f.errors,0)

    def test_invalid_lines_counted_without_fabricating_samples(self):
        f=live.EventFramer();events=f.feed(b': keepalive\nnot-json\n{bad}\n[1,2]\n\xff\n',final=True)
        self.assertEqual(events,[]);self.assertGreaterEqual(f.errors,4)

    def test_nonfinite_json_is_rejected_before_public_serialization(self):
        f=live.EventFramer()
        events=f.feed(b'{"type":"piezo","samples":[NaN,Infinity,-Infinity]}\n')
        self.assertEqual(events,[],'Nonstandard nonfinite JSON must not later break strict JSON HTTP exports')
        self.assertEqual(f.errors,1)

    def test_oversized_partial_line_is_bounded(self):
        with patch.object(live,'MAX_LINE',16):
            with self.assertRaises(live.ApiError):live.EventFramer().feed(b'x'*17)

    def test_capture_byte_and_event_limits_stop_without_unbounded_retention(self):
        c=live.Capture(FakeCloud(),TEST_TOKEN,{'id':'test'},15)
        with patch.object(live,'MAX_BYTES',8):self.assertFalse(c.feed(b'x'*9))
        self.assertEqual(c.summary()['reason'],'data_limit');self.assertEqual(c.bytes,0)
        c=live.Capture(FakeCloud(),TEST_TOKEN,{'id':'test'},15)
        with patch.object(live,'MAX_EVENTS',1):
            c.feed(b'{"type":"tap"}\n{"type":"button"}\n')
        self.assertEqual(c.summary()['reason'],'data_limit');self.assertEqual(len(c.events),1)

    def test_token_expiry_clears_catalog_and_capture(self):
        cloud=FakeCloud();cloud.hold=True;s=live.Session(cloud)
        s.login({'email':TEST_EMAIL,'password':TEST_PASSWORD});s.refresh_devices()
        s.start_capture({'device_id':'owned-device','duration_seconds':15});capture=s.capture
        s.expires=time.time()-1
        self.assertFalse(s.state()['authenticated']);self.assertEqual(s.devices,[]);self.assertIsNone(s.token)
        self.assertIsNone(s.capture);self.assertTrue(capture.stop_event.is_set());capture.thread.join(1)

    def test_logout_during_login_cannot_restore_authentication(self):
        cloud=FakeCloud();entered=threading.Event();release=threading.Event();errors=[]
        original=cloud.auth
        def delayed(email,password):entered.set();release.wait(2);return original(email,password)
        cloud.auth=delayed;s=live.Session(cloud)
        def worker():
            try:s.login({'email':TEST_EMAIL,'password':TEST_PASSWORD})
            except live.ApiError as e:errors.append(e.status)
        t=threading.Thread(target=worker);t.start();self.assertTrue(entered.wait(1));s.logout();release.set();t.join(1)
        self.assertIsNone(s.token);self.assertEqual(errors,[409]);self.assertFalse(t.is_alive())

    def test_logout_during_device_fetch_cannot_restore_catalog(self):
        cloud=FakeCloud();s=live.Session(cloud);s.login({'email':TEST_EMAIL,'password':TEST_PASSWORD})
        entered=threading.Event();release=threading.Event();errors=[];original=cloud.get_household
        def delayed(*a):entered.set();release.wait(2);return original(*a)
        cloud.get_household=delayed
        def worker():
            try:s.refresh_devices()
            except live.ApiError as e:errors.append(e.status)
        t=threading.Thread(target=worker);t.start();self.assertTrue(entered.wait(1));s.logout();release.set();t.join(1)
        self.assertEqual(s.devices,[]);self.assertEqual(errors,[401]);self.assertFalse(t.is_alive())
        self.assertFalse(any(c[0]=='device' for c in cloud.calls),'Logout must prevent follow-up detail requests')

    def test_logout_during_user_fetch_does_not_query_household(self):
        cloud=FakeCloud();s=live.Session(cloud);s.login({'email':TEST_EMAIL,'password':TEST_PASSWORD})
        entered=threading.Event();release=threading.Event();errors=[];original=cloud.get_user
        def delayed(*args):
            result=original(*args);entered.set();release.wait(2);return result
        cloud.get_user=delayed
        def worker():
            try:s.refresh_devices()
            except live.ApiError as e:errors.append(e.status)
        t=threading.Thread(target=worker);t.start()
        try:self.assertTrue(entered.wait(1));s.logout()
        finally:release.set();t.join(1)
        self.assertEqual(errors,[401]);self.assertFalse(t.is_alive())
        self.assertEqual([c[0] for c in cloud.calls],['auth','user'])
        self.assertFalse(s.state()['authenticated']);self.assertEqual(s.devices,[])

    def test_expiry_during_user_fetch_does_not_query_household(self):
        cloud=FakeCloud();s=live.Session(cloud);s.login({'email':TEST_EMAIL,'password':TEST_PASSWORD})
        entered=threading.Event();release=threading.Event();errors=[];original=cloud.get_user
        def delayed(*args):
            result=original(*args);entered.set();release.wait(2);return result
        cloud.get_user=delayed
        def worker():
            try:s.refresh_devices()
            except live.ApiError as e:errors.append(e.status)
        t=threading.Thread(target=worker);t.start()
        try:
            self.assertTrue(entered.wait(1))
            with s.lock:s.expires=time.time()-1
        finally:release.set();t.join(1)
        self.assertEqual(errors,[401]);self.assertFalse(t.is_alive())
        self.assertEqual([c[0] for c in cloud.calls],['auth','user'])
        self.assertFalse(s.state()['authenticated'])

    def test_logout_during_detail_fetch_does_not_start_queued_requests(self):
        cloud=FakeCloud();s=live.Session(cloud);s.login({'email':TEST_EMAIL,'password':TEST_PASSWORD})
        entered=threading.Event();release=threading.Event();errors=[];original=cloud.get_device
        executor=live.ThreadPoolExecutor(max_workers=1)
        def delayed(*args):
            result=original(*args);entered.set();release.wait(2);return result
        cloud.get_device=delayed
        def worker():
            try:s.refresh_devices()
            except live.ApiError as e:errors.append(e.status)
        # One worker makes the second authorized device wait in the queue.
        # Logout must terminate refresh without waiting for the in-flight reply.
        with patch.object(live,'ThreadPoolExecutor',return_value=executor):
            t=threading.Thread(target=worker);t.start()
            try:
                self.assertTrue(entered.wait(1));s.logout();t.join(.5)
                self.assertFalse(t.is_alive());self.assertEqual(errors,[401])
            finally:
                release.set();t.join(1);executor.shutdown(wait=True,cancel_futures=True)
        self.assertEqual([c[2] for c in cloud.calls if c[0]=='device'],['owned-device'])
        self.assertEqual(s.devices,[]);self.assertFalse(s.state()['authenticated'])

    def test_demo_mode_and_events_explicitly_marked_synthetic(self):
        cloud=live.DemoCloud();c=live.Capture(cloud,'fake',{'id':'demo-pod'},.25);c.start();c.thread.join(1)
        self.assertEqual(c.summary()['mode'],'demo');self.assertTrue(c.events)
        self.assertTrue(all(e.get('synthetic') for e in c.events));self.assertIsNone(c.token)


class FixedCloudTransportTests(unittest.TestCase):
    def test_auth_uses_only_fixed_https_endpoint_and_never_returns_refresh_to_ui(self):
        seen=[]
        class Opener:
            def open(self,request,timeout):
                seen.append(request)
                return io.BytesIO(b'{"access_token":"SYNTHETIC_ACCESS_TOKEN","expires_in":3600}')
        config={'token_url':live.AUTH_URL,'client_id':'TEST_CLIENT','client_secret':'TEST_CLIENT_CONFIG'}
        with patch.object(live.urllib.request,'build_opener',return_value=Opener()) as factory:
            cloud=live.CloudClient(config);cloud.auth(' '+TEST_EMAIL+' ',' '+TEST_PASSWORD+' ')
        request=seen[0];self.assertEqual(request.full_url,live.AUTH_URL)
        self.assertEqual(request.method,'POST');self.assertIsInstance(factory.call_args.args[0],live.NoRedirect)
        body=json.loads(request.data);self.assertEqual(body['username'],TEST_EMAIL)
        self.assertEqual(body['password'],TEST_PASSWORD);self.assertEqual(body['grant_type'],'password')
        self.assertNotIn(TEST_PASSWORD,request.full_url)
        with self.assertRaises(ValueError):live.CloudClient(dict(config,token_url='https://example.invalid/tokens'))

    def test_stream_redirect_is_reported_without_following_location(self):
        calls=[]
        class Sock:
            def settimeout(self,value):pass
            def shutdown(self,*args):pass
            def close(self):pass
        class Response:
            status=302
            def getheader(self,name,default=None):
                return 'https://example.invalid/collect' if name=='Location' else default
        class Connection:
            def __init__(self,host,**kwargs):calls.append(('connect_target',host,kwargs));self.sock=Sock()
            def connect(self):pass
            def request(self,method,path,headers):calls.append(('request',method,path,headers))
            def getresponse(self):return Response()
            def close(self):calls.append(('closed',))
        cloud=live.CloudClient();capture=live.Capture(cloud,TEST_TOKEN,{'id':'owned/device'},15)
        with patch.object(live.http.client,'HTTPSConnection',Connection):
            with self.assertRaises(live.ApiError) as caught:cloud.stream_live(TEST_TOKEN,'owned/device',capture)
        self.assertEqual(caught.exception.upstream_status,302)
        self.assertEqual(calls[0][1],'app-api-proxy.8slp.net.cn')
        context=calls[0][2]['context'];self.assertTrue(context.check_hostname)
        self.assertEqual(context.verify_mode,live.ssl.CERT_REQUIRED)
        request=next(x for x in calls if x[0]=='request')
        self.assertEqual(request[1:3],('GET','/v1/devices/owned%2Fdevice/live'))
        self.assertEqual(sum(x[0]=='connect_target' for x in calls),1)
        self.assertEqual(capture.summary()['http_status'],302)

    def test_expired_before_connection_completes_never_sends_live_request(self):
        calls=[]
        class Sock:
            def settimeout(self,value):pass
            def shutdown(self,*args):calls.append('shutdown')
            def close(self):pass
        class Connection:
            def __init__(self,*args,**kwargs):self.sock=Sock()
            def connect(self):pass
            def request(self,*args,**kwargs):calls.append('request')
            def close(self):pass
        cloud=live.CloudClient();capture=live.Capture(cloud,TEST_TOKEN,{'id':'test'},15)
        capture.stop('time_limit')
        with patch.object(live.http.client,'HTTPSConnection',Connection):cloud.stream_live(TEST_TOKEN,'test',capture)
        self.assertIn('shutdown',calls);self.assertNotIn('request',calls)


    def test_stream_wait_uses_capture_deadline_and_reports_header_timeout(self):
        calls=[]
        class Sock:
            def settimeout(self,value):calls.append(('timeout',value))
            def shutdown(self,*args):pass
            def close(self):pass
        class Connection:
            def __init__(self,*args,**kwargs):self.sock=Sock();calls.append(('connection',kwargs['timeout']))
            def connect(self):pass
            def request(self,*args,**kwargs):calls.append(('request',))
            def getresponse(self):raise TimeoutError(TEST_TOKEN)
            def close(self):pass
        c=live.Capture(live.CloudClient(),TEST_TOKEN,{'id':'synthetic'},30)
        with patch.object(live.http.client,'HTTPSConnection',Connection):c._run()
        result=c.summary()
        self.assertEqual(result['phase'],'response_headers')
        self.assertEqual(result['error_kind'],'timeout')
        self.assertIsNone(result['http_status'])
        self.assertNotIn(TEST_TOKEN,json.dumps(result))
        self.assertIsNone(c.token)
        self.assertGreater(next(x[1] for x in calls if x[0]=='timeout'),29)
        self.assertEqual(sum(x[0]=='connection' for x in calls),1)

    def test_deadline_distinguishes_no_response_from_empty_connected_stream(self):
        c=live.Capture(live.CloudClient(),TEST_TOKEN,{'id':'synthetic'},15)
        c.set_phase('response_headers');c.stop('time_limit')
        self.assertEqual(c.summary()['reason'],'response_wait_limit')
        self.assertEqual(c.summary()['status'],'error')
        connected=live.Capture(live.CloudClient(),TEST_TOKEN,{'id':'synthetic'},15)
        connected.set_http(200,'text/event-stream');connected.stop('time_limit')
        self.assertEqual(connected.summary()['reason'],'time_limit')
        self.assertEqual(connected.summary()['status'],'completed')
        self.assertEqual(connected.summary()['phase'],'stream')


if __name__=='__main__':unittest.main()
