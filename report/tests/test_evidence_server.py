"""Offline fixtures only: temporary roots, sibling archive and loopback port 0.

Never starts/replaces 58766 or accesses the actual evidence archive/account.
"""
import http.client
import importlib.util
import os
from pathlib import Path
import tempfile
import threading
import unittest

ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location('evidence_server', ROOT/'tools/evidence_server.py')
evidence = importlib.util.module_from_spec(spec)
spec.loader.exec_module(evidence)


class EvidenceHTTPTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.parent = Path(self.temp.name)
        self.root = self.parent/'evidence-root'
        self.root.mkdir()
        (self.root/'index.html').write_bytes(b'ROOT INDEX')
        for folder in ('report', 'firmware', 'catalog', 'android'):
            (self.root/folder).mkdir()
            (self.root/folder/'example.bin').write_bytes((folder+' DATA').encode())
        (self.root/'report/index.html').write_bytes(b'REPORT INDEX')
        (self.root/'research-evidence.tar.gz').write_bytes(b'TAR ARCHIVE')
        (self.root/'empty').write_bytes(b'')
        self.zip = self.parent/'evidence-root.zip'
        self.zip.write_bytes(b'0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ')
        self.outside = self.parent/'outside-secret.txt'
        self.outside.write_bytes(b'OUTSIDE MUST NOT BE SERVED')
        self.server = evidence.make_server(self.root, port=0)
        self.thread = threading.Thread(target=lambda:self.server.serve_forever(poll_interval=.01), daemon=True)
        self.thread.start()

    def tearDown(self):
        self.server.shutdown();self.server.server_close();self.thread.join(1)
        self.temp.cleanup()

    def request(self, path, method='GET', headers=None):
        connection = http.client.HTTPConnection('127.0.0.1', self.server.server_port, timeout=3)
        try:
            connection.request(method, path, headers=headers or {})
            response = connection.getresponse()
            return response.status, dict(response.getheaders()), response.read()
        finally:
            connection.close()

    def test_existing_root_paths_and_index_aliases(self):
        for path, expected in [('/', b'ROOT INDEX'), ('/index', b'ROOT INDEX'),
                               ('/index.html', b'ROOT INDEX'), ('/report/', b'REPORT INDEX'),
                               ('/research-evidence.tar.gz', b'TAR ARCHIVE')]:
            with self.subTest(path=path):
                status, headers, body = self.request(path)
                self.assertEqual(status, 200);self.assertEqual(body, expected)
                self.assertEqual(int(headers['Content-Length']), len(expected))
        for folder in ('report', 'firmware', 'catalog', 'android'):
            self.assertEqual(self.request('/'+folder+'/example.bin')[2], (folder+' DATA').encode())
        status, headers, _ = self.request('/report')
        self.assertEqual(status, 301);self.assertEqual(headers['Location'], '/report/')
        self.assertEqual(self.request('/firmware/')[0], 404)

    def test_bundle_is_exact_sibling_download_and_head_has_no_body(self):
        status, headers, body = self.request('/bundle.zip')
        self.assertEqual(status, 200);self.assertEqual(body, self.zip.read_bytes())
        self.assertEqual(headers['Content-Type'], 'application/zip')
        self.assertIn('attachment', headers['Content-Disposition'])
        self.assertEqual(headers['Accept-Ranges'], 'bytes')
        status, head_headers, body = self.request('/bundle.zip', method='HEAD')
        self.assertEqual(status, 200);self.assertEqual(body, b'')
        self.assertEqual(head_headers['Content-Length'], headers['Content-Length'])
        for path in ('/outside-secret.txt', '/evidence-root.zip', '/bundle.zip/extra'):
            self.assertEqual(self.request(path)[0], 404)

    def test_single_ranges_and_suffix_are_exact(self):
        for range_value, expected, content_range in [
                ('bytes=2-5', b'2345', 'bytes 2-5/36'),
                ('bytes=33-', b'XYZ', 'bytes 33-35/36'),
                ('bytes=-3', b'XYZ', 'bytes 33-35/36'),
                ('bytes=34-999', b'YZ', 'bytes 34-35/36')]:
            with self.subTest(range=range_value):
                status, headers, body = self.request('/bundle.zip', headers={'Range':range_value})
                self.assertEqual(status, 206);self.assertEqual(body, expected)
                self.assertEqual(headers['Content-Range'], content_range)
                self.assertEqual(int(headers['Content-Length']), len(expected))
        status, headers, body = self.request('/bundle.zip', method='HEAD', headers={'Range':'bytes=2-5'})
        self.assertEqual(status, 206);self.assertEqual(headers['Content-Length'], '4');self.assertEqual(body, b'')

    def test_invalid_multirange_and_empty_file_ranges_return_416(self):
        for value in ('bytes=99-', 'bytes=7-2', 'bytes=-0', 'bytes=-', 'bytes=0-1,4-5',
                      'items=0-2', 'bytes='+'9'*5000+'-'):
            with self.subTest(range=value[:40]):
                status, headers, body = self.request('/bundle.zip', headers={'Range':value})
                self.assertEqual(status, 416);self.assertEqual(body, b'')
                self.assertEqual(headers['Content-Range'], 'bytes */36')
        self.assertEqual(self.request('/empty', headers={'Range':'bytes=0-'})[0], 416)
        self.assertEqual(self.request('/empty')[2], b'')

    def test_if_range_change_sends_full_file_and_match_sends_range(self):
        _, headers, _ = self.request('/bundle.zip', method='HEAD')
        self.assertEqual(self.request('/bundle.zip', headers={'Range':'bytes=0-1','If-Range':headers['ETag']})[2], b'01')
        status, _, body = self.request('/bundle.zip', headers={'Range':'bytes=0-1','If-Range':'"different"'})
        self.assertEqual(status, 200);self.assertEqual(body, self.zip.read_bytes())

    def test_sparse_archive_over_three_gibibytes_uses_bounded_range(self):
        offset = 3*1024**3
        with self.zip.open('wb') as f:
            f.seek(offset);f.write(b'LARGE-END')
        status, headers, body = self.request('/bundle.zip', method='HEAD')
        self.assertEqual(status, 200);self.assertEqual(int(headers['Content-Length']), offset+9)
        self.assertEqual(body, b'')
        status, headers, body = self.request('/bundle.zip', headers={'Range':f'bytes={offset}-'})
        self.assertEqual(status, 206);self.assertEqual(body, b'LARGE-END')
        self.assertEqual(headers['Content-Length'], '9')

    def test_encoded_traversal_and_proxy_requests_cannot_leave_root(self):
        for path in ('/../outside-secret.txt', '/%2e%2e/outside-secret.txt',
                     '/firmware/%2e%2e/%2e%2e/outside-secret.txt',
                     '/%252e%252e/outside-secret.txt', '/%5c..%5coutside-secret.txt',
                     '/%00', '/%ff', 'http://example.invalid/outside-secret.txt'):
            with self.subTest(path=path):
                status, _, body = self.request(path)
                self.assertIn(status, (403,404));self.assertNotIn(b'OUTSIDE', body)

    def test_file_directory_index_and_bundle_symlink_escapes_are_rejected(self):
        (self.root/'escape').symlink_to(self.outside)
        (self.root/'outside-dir').symlink_to(self.parent, target_is_directory=True)
        (self.root/'bad-index').mkdir()
        (self.root/'bad-index/index.html').symlink_to(self.outside)
        for path in ('/escape', '/outside-dir/outside-secret.txt', '/bad-index/'):
            self.assertEqual(self.request(path)[0], 404)
        self.zip.unlink();self.zip.symlink_to(self.outside)
        self.assertEqual(self.request('/bundle.zip')[0], 404)

    @unittest.skipUnless(hasattr(os, 'mkfifo'), 'named pipes are unavailable')
    def test_special_file_is_not_opened_as_a_blocking_download(self):
        os.mkfifo(self.root/'not-a-regular-file')
        self.assertEqual(self.request('/not-a-regular-file')[0], 404)

    def test_host_guard_read_only_methods_and_missing_files(self):
        self.assertEqual(self.server.server_address[0], '127.0.0.1')
        self.assertEqual(self.request('/', headers={'Host':'example.invalid'})[0], 403)
        status, headers, _ = self.request('/bundle.zip', method='POST')
        self.assertEqual(status, 405);self.assertEqual(headers['Allow'], 'GET, HEAD')
        self.zip.unlink();self.assertEqual(self.request('/bundle.zip')[0], 404)
        self.assertEqual(self.request('/missing')[0], 404)


if __name__ == '__main__':
    unittest.main()
