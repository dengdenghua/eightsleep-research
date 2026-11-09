#!/usr/bin/env python3
"""Read-only loopback evidence service; GET/HEAD and single byte ranges.

Only files inside --root and the exact sibling <root-name>.zip are readable.
This service does not load account configuration or contact any network API.
"""
import argparse
import email.utils
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
import mimetypes
import os
from pathlib import Path
import re
import stat
import urllib.parse

PORTABLE_ROOT = Path(__file__).resolve().parents[2] / 'materials/eightsleep-full-evidence-20261107'
DEFAULT_ROOT = (PORTABLE_ROOT if PORTABLE_ROOT.is_dir()
                else Path('/Volumes/My Passport/EightSleep/materials/eightsleep-full-evidence-20261107'))


class InvalidRange(ValueError):
    pass


def byte_range(value, size):
    """Return inclusive bounds for one range; never allocate the requested size."""
    match = re.fullmatch(r'bytes=(\d*)-(\d*)', value.strip())
    if not match or not any(match.groups()) or size == 0:
        raise InvalidRange()
    try:
        first, last = match.groups()
        if not first:
            suffix = int(last)
            if suffix <= 0:
                raise InvalidRange()
            return max(0, size-suffix), size-1
        start = int(first)
        end = min(int(last), size-1) if last else size-1
    except ValueError:
        raise InvalidRange() from None
    if start < 0 or start >= size or end < start:
        raise InvalidRange()
    return start, end


class EvidenceServer(ThreadingHTTPServer):
    daemon_threads = True

    def __init__(self, root, port):
        self.root = Path(root).resolve(strict=True)
        if not self.root.is_dir():
            raise ValueError('evidence root must be a directory')
        self.bundle = self.root.parent/(self.root.name+'.zip')
        super().__init__(('127.0.0.1', port), EvidenceHandler)
        self.origin = 'http://127.0.0.1:'+str(self.server_port)


class EvidenceHandler(BaseHTTPRequestHandler):
    server_version = 'EightSleepEvidence/1.0'
    sys_version = ''

    def log_message(self, *args):
        pass

    def _empty(self, status, headers=None):
        self.send_response(status)
        self.send_header('Content-Length', '0')
        self.send_header('Cache-Control', 'no-store')
        for key, value in (headers or {}).items():
            self.send_header(key, value)
        self.end_headers()

    def _target(self):
        url = urllib.parse.urlsplit(self.path)
        if url.scheme or url.netloc or url.fragment:
            raise ValueError('not an origin-form path')
        path = urllib.parse.unquote(url.path, encoding='utf-8', errors='strict')
        if (not path.startswith('/') or path.startswith('//') or '\\' in path
                or any(ord(c) < 32 or ord(c) == 127 for c in path)):
            raise ValueError('invalid path')
        if any(part in ('.', '..') for part in path.split('/')):
            raise ValueError('path traversal')
        is_bundle = path == '/bundle.zip'
        if is_bundle:
            # This one exact sibling path is the entire outside-root allowlist.
            target = self.server.bundle.resolve(strict=True)
            if target != self.server.bundle:
                raise ValueError('bundle must not be a symlink')
        else:
            relative = 'index.html' if path in ('/', '/index') else path.lstrip('/')
            target = (self.server.root/relative).resolve(strict=True)
            if not target.is_relative_to(self.server.root):
                raise ValueError('outside evidence root')
            if target.is_dir():
                index = (target/'index.html').resolve(strict=True)
                if not index.is_relative_to(self.server.root):
                    raise ValueError('index outside evidence root')
                if not path.endswith('/'):
                    return None, False, urllib.parse.quote(path+'/', safe='/')
                target = index
        return target, is_bundle, None

    def _serve(self, head=False):
        if self.headers.get('Host') != self.server.origin.removeprefix('http://'):
            return self._empty(403)
        headers_sent = False
        try:
            target, is_bundle, redirect = self._target()
            if redirect:
                return self._empty(301, {'Location': redirect})
            # Resolve checks reject existing escapes; NOFOLLOW also prevents a
            # final-component symlink swap between resolution and opening.
            descriptor = os.open(target, os.O_RDONLY | getattr(os, 'O_NOFOLLOW', 0)
                                 | getattr(os, 'O_NONBLOCK', 0))
            with os.fdopen(descriptor, 'rb') as stream:
                info = os.fstat(stream.fileno())
                if not stat.S_ISREG(info.st_mode):
                    return self._empty(404)
                size = info.st_size
                modified = email.utils.formatdate(info.st_mtime, usegmt=True)
                etag = '"%x-%x"' % (info.st_mtime_ns, size)
                range_header = self.headers.get('Range')
                if_range = self.headers.get('If-Range')
                if range_header and if_range and if_range not in (etag, modified):
                    range_header = None
                if range_header:
                    try:
                        start, end = byte_range(range_header, size)
                    except InvalidRange:
                        return self._empty(416, {'Content-Range': 'bytes */'+str(size),
                                                 'Accept-Ranges': 'bytes'})
                    status, length = 206, end-start+1
                else:
                    status, start, end, length = 200, 0, size-1, size
                content_type = ('application/zip' if is_bundle or target.suffix == '.zip'
                                else 'application/gzip' if target.name.endswith('.tar.gz')
                                else mimetypes.guess_type(target.name)[0] or 'application/octet-stream')
                self.send_response(status)
                self.send_header('Content-Type', content_type)
                self.send_header('Content-Length', str(length))
                self.send_header('Accept-Ranges', 'bytes')
                self.send_header('Last-Modified', modified)
                self.send_header('ETag', etag)
                self.send_header('Cache-Control', 'no-store')
                self.send_header('X-Content-Type-Options', 'nosniff')
                self.send_header('Referrer-Policy', 'no-referrer')
                if status == 206:
                    self.send_header('Content-Range', 'bytes %d-%d/%d' % (start, end, size))
                if is_bundle:
                    filename = urllib.parse.quote(self.server.bundle.name, safe='')
                    self.send_header('Content-Disposition', "attachment; filename=\"eightsleep-evidence.zip\"; filename*=UTF-8''"+filename)
                self.end_headers()
                headers_sent = True
                if head:
                    return
                stream.seek(start)
                remaining = length
                while remaining:
                    chunk = stream.read(min(1024*1024, remaining))
                    if not chunk:
                        break
                    self.wfile.write(chunk)
                    remaining -= len(chunk)
        except (BrokenPipeError, ConnectionResetError):
            return
        except (OSError, ValueError, UnicodeError):
            if headers_sent:
                self.close_connection = True
                return
            return self._empty(404)

    def do_GET(self):
        self._serve()

    def do_HEAD(self):
        self._serve(head=True)

    def do_POST(self):
        self._empty(405, {'Allow': 'GET, HEAD'})


def make_server(root=DEFAULT_ROOT, port=58766):
    return EvidenceServer(root, port)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--root', type=Path, default=DEFAULT_ROOT)
    parser.add_argument('--port', type=int, default=58766)
    args = parser.parse_args()
    server = make_server(args.root, args.port)
    print('EVIDENCE_URL='+server.origin+'/', flush=True)
    print('BUNDLE_URL='+server.origin+'/bundle.zip', flush=True)
    try:
        server.serve_forever()
    except KeyboardInterrupt:
        pass
    finally:
        server.server_close()


if __name__ == '__main__':
    main()
