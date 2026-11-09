#!/usr/bin/env python3
"""Embed the frozen release inventory; no network or account access."""
import argparse
import json
from pathlib import Path
ROOT = Path(__file__).resolve().parents[1]
def main():
    ap=argparse.ArgumentParser()
    ap.add_argument('--bundle',type=Path,default=Path('/Volumes/My Passport/EightSleep/materials/eightsleep-full-evidence-20261107'))
    args=ap.parse_args(); f=args.bundle
    def read(path):return json.loads((f/path).read_text())
    r=read('catalog/research-archive.json'); a=read('catalog/ANDROID_COVERAGE.json')
    swu=read('firmware/mtk/source-identity.json'); apk=read('android/original/identity.json')
    v=read('firmware/mtk/VERIFICATION.json'); frozen=read('report/evidence/manifest.json')
    receipt=json.loads(f.with_suffix('.zip.verification.json').read_text())
    needed={e['source']:e for e in frozen}; mapping=[]; ghidra_projects=[]
    for line in (f/'catalog/research-files.jsonl').open():
        x=json.loads(line)
        if x.get('type')=='file' and x['source_relative'].endswith('.gpr'):ghidra_projects.append(x['source_relative'])
        if x['source_relative'] not in needed:continue
        src=needed[x['source_relative']]
        original=x.get('original_sha256',x['sha256'])
        assert original==src['source_sha256'],src['source']
        mapping.append({'id':src['id'],'source':src['source'],'archive_member':x['archive_member'],
                        'sha256':x['sha256'],'original_sha256':original,'snapshot_sha256':src['snapshot_sha256'],
                        'transformation':x['transformation'],'bytes':x['bytes']})
    assert len(mapping)==len(frozen)==78
    materials=[
      {'id':'full-zip','title':'完整证据包 · 2026-11-07','kind':'ZIP','path':'bundle.zip','bytes':receipt['bytes'],'sha256':receipt['sha256'],'note':'冻结版本；包含下列固件、APK、研究归档及当时的报告。本轮网页与新增分析另行提供。'},
      {'id':'swu','title':'官方 MTK 固件原包','kind':'SWU','path':'firmware/mtk/'+swu['bundle_input'],'bytes':swu['source_size'],'sha256':swu['sha256'],'note':'MT8365 样本；尚未与实机当前部署版本逐字节绑定。'},
      {'id':'rootfs','title':'完整 rootfs 原始 TAR','kind':'TAR','path':'firmware/mtk/rootfs.tar','bytes':v['tar_bytes'],'sha256':v['tar_sha256'],'note':'保留 13,626 个逻辑条目及链接、元数据。ExFAT 上的普通文件浏览副本不能直接刷机。'},
      {'id':'apk','title':'官方国行 Android APK','kind':'APK','path':apk['bundle_path'],'bytes':apk['bytes'],'sha256':apk['sha256'],'note':'7.63.5-cn-tencent；完整保留这一个 APK，未声称覆盖其他渠道或运行时下载。'},
      {'id':'research','title':'研究工作区与全部归档证据','kind':'TAR.GZ','path':r['archive'],'bytes':r['archive_bytes'],'sha256':r['sha256'],'note':'107,095 个文件、6,767 个目录；含 Android 解码、Smali、索引、16 个 Ghidra 工程及历史分析。'}]
    indexes=[
      ('全部文件索引','catalog/research-files.jsonl','逐项路径、SHA-256、归档成员与必要脱敏记录；约 78 MB。'),
      ('证据包校验清单','catalog/bundle-manifest.json','冻结版本各交付文件的大小与哈希。'),
      ('MTK 解包与校验结果','firmware/mtk/VERIFICATION.json','CPIO、rootfs、签名检查分别记录。'),
      ('rootfs 条目索引','firmware/mtk/rootfs-entries.jsonl','包含普通文件、硬链接、符号链接和原始元数据。'),
      ('Android 覆盖说明','catalog/ANDROID_COVERAGE_ZH.txt','DEX、Smali、JADX 缺口、JNI 与索引覆盖。'),
      ('Android 机器可读清单','catalog/ANDROID_COVERAGE.json','逐项校验、限定范围内的 15 个 Ghidra 工程及证据记录；总归档为 16 个。'),
      ('归档审计说明','catalog/RESEARCH_AUDIT_ZH.txt','保留范围、脱敏与未纳入项目。')]
    data={'schema':1,'material_base':'http://127.0.0.1:58766/',
      'package':{'title':'完整证据包','date':'2026-11-07','root_path':str(f),
        'files':r['files'],'directories':r['directories'],'entries':r['entries'],
        'archive_path':str(f.with_suffix('.zip')),'archive_bytes':receipt['bytes'],'archive_sha256':receipt['sha256'],
        'ghidra_projects':len(ghidra_projects),'original_snapshots':len(frozen)},
      'materials':materials,'indexes':[dict(title=t,path=p,note=n) for t,p,n in indexes],
      'android':{'zip_entries':a['zip_verification']['file_entries'],'matched_entries':a['zip_verification']['matched_file_entries'],
         'indexed_files':a['index']['indexed_files_checked'],'index_mismatches':len(a['index']['discrepancies']),
         'jadx_errors':350,'smali_files':a['index']['summary_counts']['smali_files'],
         'evidence_records':a['rea_retention']['evidence_records'],'workspace_archive_member':a['workspace']['archive_member']},
      'evidence_map':sorted(mapping,key=lambda x:x['id']),
      'new_round':{'date':'2026-11-08','page':'prepublish-queue-20261108',
        'evidence_sources':['analysis/prepublish-queue-20261108/code-audit/FINDINGS_ZH.txt','analysis/prepublish-queue-20261108/model/RESULTS_ZH.txt'],
        'summary':'补齐 Frank 进程内发送队列的容量、满队列、重试及停止边界；保留代码地址、原 ELF 字节核验与有限模型。新增资料随本报告提供，未回写 11 月 7 日冻结包。'},
      'limitations':[
        '已保留的样本和研究证据可追溯，不等于恢复了全部生产源码；心肺分离、融合、睡眠分期和云端温控策略仍缺实现。',
        'NXP 材料仅作为历史对照保留，不作为当前 MTK Pod 的运行证据。历史公钥参与 MTK 包的签名核验，其角色另有记录。',
        'JADX 有 350 个报错；关键判断需回到 DEX/Smali。完整 APK 字节保留不等于 Java 反编译完整。',
        '16 个 Ghidra 工程含不同年代的研究目标，属于分析环境，不是原厂工程源码。',
        '归档中必要的脱敏和省略均在清单中记录。登录凭据和当前内存会话不进入报告包。',
        'Android 工作区含大小写冲突路径，恢复时使用区分大小写的文件系统；原 TAR 和逐项索引是路径依据。']}
    existing_path=ROOT/'data/full-evidence.json'
    if existing_path.is_file():
        previous=json.loads(existing_path.read_text()).get('new_round')
        if previous:
            data['new_round']=previous
    (ROOT/'data/full-evidence.json').write_text(json.dumps(data,ensure_ascii=False,indent=2)+'\n')
    print(json.dumps({'materials':len(materials),'mappings':len(mapping),'frozen_date':data['package']['date']}))
if __name__=='__main__':main()
