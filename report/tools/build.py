#!/usr/bin/env python3
"""Compile the authored Markdown subset into a self-contained offline report.
Python standard library only. HTML in Markdown is escaped, not executed.
"""
from pathlib import Path
import hashlib
import html
import json
import re

ROOT=Path(__file__).resolve().parents[1]

def authored(paths):
    """Ignore macOS AppleDouble companions written on exFAT/FAT volumes.

    The delivery originally lived on exFAT, where xattrs are stored as ._*
    sidecar files. Those binaries must never be parsed as Markdown/JSON.
    """
    return [p for p in paths if not p.name.startswith('._')]

def inline(text, current):
    tokens=[]
    def protect(value):
        tokens.append(value)
        return '\x00%d\x00' % (len(tokens)-1)
    text=re.sub(r'`([^`]+)`',lambda m:protect('<code>'+html.escape(m[1])+'</code>'),text)
    def link(m):
        label,url=m.groups()
        if url.startswith(('javascript:', 'data:')): raise ValueError('Unsafe link')
        if not re.match(r'^[a-z]+://',url) and not url.startswith('#'):
            path=(current.parent/url).resolve()
            path.relative_to(ROOT)
            if path.suffix=='.md': url='#wiki/'+str(path.relative_to(ROOT/'wiki')).removesuffix('.md')
            elif 'evidence' in path.relative_to(ROOT).parts:
                url='#evidence/'+str(path.relative_to(ROOT/'evidence'))
            else: url=str(path.relative_to(ROOT))
        return protect('<a href="'+html.escape(url,quote=True)+'">'+html.escape(label)+'</a>')
    text=re.sub(r'\[([^\]]+)\]\(([^)]+)\)',link,text)
    text=html.escape(text)
    text=re.sub(r'\*\*(.+?)\*\*',r'<strong>\1</strong>',text)
    for i,value in enumerate(tokens):text=text.replace('\x00%d\x00'%i,value)
    return text

def render_md(text, current):
    lines=text.splitlines(); out=[]; i=0
    while i<len(lines):
        line=lines[i]
        if not line.strip(): i+=1;continue
        if line.startswith('```'):
            i+=1;block=[]
            while i<len(lines) and not lines[i].startswith('```'): block.append(lines[i]);i+=1
            out.append('<pre><code>'+html.escape('\n'.join(block))+'</code></pre>');i+=1;continue
        match=re.match(r'^(#{1,6})\s+(.+)',line)
        if match:
            level=len(match[1]);out.append(f'<h{level}>'+inline(match[2],current)+f'</h{level}>');i+=1;continue
        if line.startswith('|') and i+1<len(lines) and re.match(r'^\|[\s:|\-]+\|?$',lines[i+1]):
            rows=[]
            def cells(s):return [c.strip() for c in s.strip().strip('|').split('|')]
            heads=cells(line);i+=2
            while i<len(lines) and lines[i].startswith('|'):rows.append(cells(lines[i]));i+=1
            out.append('<div class="table-scroll"><table><thead><tr>'+''.join('<th>'+inline(c,current)+'</th>' for c in heads)+'</tr></thead><tbody>'+''.join('<tr>'+''.join('<td>'+inline(c,current)+'</td>' for c in row)+'</tr>' for row in rows)+'</tbody></table></div>');continue
        lm=re.match(r'^\s*(?:[-*]|\d+\.)\s+',line)
        if lm:
            ordered=bool(re.match(r'^\s*\d+\.',line));tag='ol' if ordered else 'ul';items=[]
            while i<len(lines) and re.match(r'^\s*(?:[-*]|\d+\.)\s+',lines[i]):
                content=re.sub(r'^\s*(?:[-*]|\d+\.)\s+','',lines[i]);items.append('<li>'+inline(content,current)+'</li>');i+=1
            out.append('<'+tag+'>'+''.join(items)+'</'+tag+'>');continue
        if line.startswith('> '):out.append('<blockquote>'+inline(line[2:],current)+'</blockquote>');i+=1;continue
        para=[line];i+=1
        while i<len(lines) and lines[i].strip() and not re.match(r'^(#|```|\||>|[-*] |\d+\. )',lines[i]):para.append(lines[i]);i+=1
        out.append('<p>'+inline(' '.join(para),current)+'</p>')
    return '\n'.join(out)

def load_modules():
    return sorted([json.loads(p.read_text()) for p in authored((ROOT/'data/modules').glob('*.json'))],key=lambda x:x['order'])

def sync_live_navigation(template):
    """Use the report navigation on the live tool without touching its session/API."""
    sidebar=re.search(r'<aside class="sidebar">(.*?)</aside>',template,re.S).group(1)
    navigation=sidebar.split('<div class="side-bottom">',1)[0]
    navigation=re.sub(r'href="#([^\"]*)"',r'href="/report/index.html#\1"',navigation)
    navigation=navigation.replace('href="http://127.0.0.1:58764/"','href="/"')
    navigation=navigation.replace('id="live-capture-link"','id="live-capture-link" class="active" aria-current="page"')
    navigation=navigation.replace('实时采集 ↗','实时采集')
    path=ROOT/'live/index.html'
    markup=path.read_text()
    markup,count=re.subn(r'<!-- REPORT_NAV_START -->.*?<!-- REPORT_NAV_END -->',lambda _: '<!-- REPORT_NAV_START -->\n'+navigation+'\n<!-- REPORT_NAV_END -->',markup,flags=re.S)
    if count!=1:raise ValueError('Live navigation markers missing or duplicated')
    path.write_text(markup)

def main():
    conclusions=json.loads((ROOT/'data/conclusions.json').read_text())
    conclusion_doc=['# 核心结论与验证状态','','本页为结论索引。每项结论链接一个主章节；公式、调用链和原始证据在该章节维护。四个验证维度分别记录，不合并为模块完成率。','','## 验证维度','','- 代码恢复：指定样本中已解释的实现范围。','- 有限模型：固定假设与输入下的对照，不表示故障概率或硬件实测。','- 部署确认：分析样本是否对应实机版本、生效配置与物理通道。','- 实机验证：实际运行记录或测量；历史 API 响应只证明该次返回。','','## 结论索引','','| 编号 | 核心结论 | 主章节 |','| --- | --- | --- |']
    for c in conclusions: conclusion_doc.append('| '+c['id']+' | '+c['title']+' | [技术说明]('+c['page']+'.md) |')
    for c in conclusions:
        conclusion_doc+=['','## '+c['id']+' '+c['title'],'',c['conclusion'],'','证据类型：'+c['types']+'。','','| 维度 | 当前状态 |','| --- | --- |','| 代码恢复 | '+c['code']+' |','| 有限模型 | '+c['model']+' |','| 部署确认 | '+c['deployment']+' |','| 实机验证 | '+c['measurement']+' |','','[主章节与证据]('+c['page']+'.md)']
    (ROOT/'wiki/conclusions.md').write_text('\n'.join(conclusion_doc)+'\n')
    modules=load_modules()
    tasks=sorted([t for p in authored((ROOT/'data/roadmap').glob('*.json')) for t in json.loads(p.read_text())],key=lambda x:(x['priority'],x['module'],x['id']))
    names={m['id']:m['title'] for m in modules}
    state={'completed':'限定验收通过','ready':'可继续静态分析','needs-device':'需实机验证','needs-artifact':'需补充材料'}
    doc=['# 研究计划','', '先看 [逆向执行计划](reverse-plan.md)，按现有材料、设备条件与新增材料选择行动；[核心结论与验证状态](conclusions.md)区分代码、模型、部署与实机证据。任务的限定验收通过不代表整个模块全部完成。','', '每项任务写清三件事：分析目标，前置条件，验收标准。P0 最先查，P1 随后查，P2 做补充；这不是承诺完成日期。已留存的设备查询记录包含1台Pod6，查询时状态离线；持续传感数据采集尚未验证。设备联网并确认在线后，优先验证API-01。原始传感记录与生产算法程序仍未取得，相关任务保留前置条件。','', '## 阅读与验收规则','', '- 系统、模块、接口边界和证据关联已统一到本项目。','- 既有静态发现、模拟结果和响应结构分别标注；未将材料缺口标记完成。','- 主报告与离线分析工具不访问账号。[实时采集工具](live-capture-tool.md)在用户登录、刷新设备或开始采集时访问国行官方接口；不控制设备，导出由用户手动下载。','']
    for task in tasks:
        doc+=['## '+task['id']+' '+task['title'],'',f"优先级：{task['priority']}；条件：{state[task['state']]}；模块：[{names[task['module']]}](modules/{task['module']}.md)。",'', '**分析目标**：'+task['action'],'','**前置条件**：'+task['needs'],'','**验收标准**：'+task['acceptance'],'']
        if task.get('progress'): doc+=['**验证状态**：'+task['progress'],'']
        if task.get('result_page'): doc+=['[证据与验证结果]('+task['result_page']+'.md)','','']
    (ROOT/'wiki/roadmap.md').write_text('\n'.join(doc))
    evidence=json.loads((ROOT/'evidence/manifest.json').read_text())
    for e in evidence:e['text']=(ROOT/e['path']).read_text()
    pages=[]
    for p in sorted(authored((ROOT/'wiki').rglob('*.md'))):
        raw=p.read_text();pid=str(p.relative_to(ROOT/'wiki')).removesuffix('.md')
        pages.append({'id':pid,'title':raw.splitlines()[0].lstrip('# '),'html':render_md(raw,p),'text':raw,'path':str(p.relative_to(ROOT))})
    config=json.loads((ROOT/'data/report.json').read_text())
    data={**config,'conclusions':conclusions,'modules':modules,'tasks':tasks,'pages':pages,'evidence':evidence,'artifacts':json.loads((ROOT/'data/artifacts.json').read_text()),'algorithms':json.loads((ROOT/'data/algorithms.json').read_text()),'algorithmFilter':json.loads((ROOT/'data/algorithm-filter.json').read_text()),'terms':json.loads((ROOT/'data/terms.json').read_text())}
    data['fullEvidence']=json.loads((ROOT/'data/full-evidence.json').read_text())
    payload=json.dumps(data,ensure_ascii=False,separators=(',',':')).replace('</',r'<\/').replace('\u2028','\\u2028').replace('\u2029','\\u2029')
    template=(ROOT/'assets/template.html').read_text()
    sync_live_navigation(template)
    result=template.replace('/*__CSS__*/',(ROOT/'assets/report.css').read_text()).replace('/*__DATA__*/',payload).replace('/*__JS__*/',(ROOT/'assets/report.js').read_text())
    (ROOT/'index.html').write_text(result)
    (ROOT/'data/compiled-index.json').write_text(json.dumps({'modules':len(modules),'pages':len(pages),'tasks':len(tasks),'evidence':len(evidence),'html_bytes':len(result.encode()),'html_sha256':hashlib.sha256(result.encode()).hexdigest()},ensure_ascii=False,indent=2)+'\n')
    print((ROOT/'data/compiled-index.json').read_text())

if __name__=='__main__':main()
