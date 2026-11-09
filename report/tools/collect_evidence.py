#!/usr/bin/env python3
"""Collect only explicitly cited text reports; never copy account payloads."""
from pathlib import Path
import argparse
import hashlib
import json
import re

ROOT = Path(__file__).resolve().parents[1]

def digest(data):
    return hashlib.sha256(data).hexdigest()

def authored(paths):
    """Ignore macOS AppleDouble companions written on exFAT/FAT volumes."""
    return (p for p in paths if not p.name.startswith('._'))

def collect(research):
    manifest_path = ROOT / 'evidence/manifest.json'
    previous = json.loads(manifest_path.read_text()) if manifest_path.is_file() else []
    existing_ids = {record['source']: record['id'] for record in previous}
    next_id = max([int(record['id'][1:]) for record in previous] or [0]) + 1
    refs = set()
    for p in authored((ROOT / 'data/modules').glob('*.json')):
        refs.update(json.loads(p.read_text())['evidence'])
    for p in authored((ROOT / 'wiki').rglob('*.md')):
        refs.update(re.findall(r'\]\((?:\.\./)+evidence/([^\s)#]+)', p.read_text()))
    records = []
    for rel in sorted(refs):
        source = (research / rel).resolve()
        source.relative_to(research.resolve())
        if source.suffix != '.txt' or not source.is_file():
            raise ValueError('Expected existing cited text report: ' + rel)
        raw = source.read_bytes()
        text = raw.decode('utf-8')
        counts = {}
        replacements = [
            ('research_path', re.escape(str(research.resolve())), '${RESEARCH_ROOT}'),
            ('email', r'[A-Za-z0-9._%+*-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}', '[EMAIL_REDACTED]'),
            ('jwt', r'\beyJ[A-Za-z0-9_-]{12,}\.[A-Za-z0-9_-]+\.[A-Za-z0-9_-]+', '[TOKEN_REDACTED]'),
            ('bearer', r'(?i)Bearer\s+[A-Za-z0-9._~-]{16,}', 'Bearer [TOKEN_REDACTED]'),
            ('uuid', r'\b[0-9a-fA-F]{8}-(?:[0-9a-fA-F]{4}-){3}[0-9a-fA-F]{12}\b', '[ID_REDACTED]'),
            ('mac', r'\b(?:[0-9a-fA-F]{2}:){5}[0-9a-fA-F]{2}\b', '[DEVICE_ADDRESS_REDACTED]'),
            ('signed_query', r'(?i)([?&](?:access_token|token|signature|x-amz-signature|x-amz-credential)=)[^\s&"<>]+', r'\1[REDACTED]'),
            ('export_hook', r'https://hooks\.zapier\.com/hooks/catch/[^\s\]\)>]+', '[EXPORT_HOOK_REDACTED]'),
            ('quoted_identifier', r'(?i)(["\x27](?:userId|deviceId|sessionId|householdId|accountId)["\x27]\s*:\s*["\x27])([^"\x27\n]{8,})(["\x27])', r'\1[ID_REDACTED]\3'),
            ('secret_assignment', r'(?i)((?:["\x27])?(?:access_token|refresh_token|password|client_secret)(?:["\x27])?\s*[=:]\s*["\x27])([^"\x27\n]+)(["\x27])', r'\1[SECRET_REDACTED]\3'),
            ('secret_bare', r'(?i)((?:access_token|refresh_token|password|client_secret)\s*=\s*)([^\s"\x27,;]{8,})', r'\1[SECRET_REDACTED]'),
            ('url_identity', r'(/(?:users|devices|sessions|households)/)([a-z0-9_-]{16,})(?=[/\s?"\x27)]|$)', r'\1[ID_REDACTED]'),
        ]
        for name, pattern, replacement in replacements:
            text, count = re.subn(pattern, replacement, text)
            if count: counts[name] = count
        # Preserve technical API placeholders; redact only literal identifier assignments.
        pattern = r'(?i)((?:userId|deviceId|sessionId|householdId|accountId)\s*[=:]\s*["\x27]?)([a-z0-9_-]{10,})(["\x27]?)'
        text, count = re.subn(pattern, r'\1[ID_REDACTED]\3', text)
        if count: counts['identifier_assignment'] = count
        output = ('证据快照 · 来源于既有研究报告。其日期、旧任务状态和覆盖限制保留为历史记录；当前结论以 Wiki 模块页及更新证据为准。文中额外文件引用可能只存在于原研究目录。\n'
                  '本副本按清单做路径及隐私脱敏；不是原始二进制，也不是原厂源码。\n\n' + text)
        target = ROOT / 'evidence' / rel
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_text(output)
        evidence_id = existing_ids.get(rel)
        if evidence_id is None:
            evidence_id = 'E%03d' % next_id
            next_id += 1
        records.append({'id': evidence_id, 'source': rel,
                        'path': 'evidence/' + rel, 'source_sha256': digest(raw),
                        'snapshot_sha256': digest(target.read_bytes()), 'bytes': target.stat().st_size,
                        'redactions': counts, 'label': text.splitlines()[0][:140]})
    manifest_path.write_text(json.dumps(records, ensure_ascii=False, indent=2)+'\n')
    print(json.dumps({'reports':len(records),'bytes':sum(x['bytes'] for x in records)},ensure_ascii=False))

if __name__ == '__main__':
    ap=argparse.ArgumentParser()
    ap.add_argument('--research-root',required=True,type=Path)
    collect(ap.parse_args().research_root)
