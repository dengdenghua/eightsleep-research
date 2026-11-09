#!/bin/zsh
cd -- "${0:A:h}" || exit 1
materials_root="materials/eightsleep-full-evidence-20261107"
if [[ ! -f "$materials_root/index.html" ]]; then
  print '首次使用：核对完整材料SHA256并解包，约需4GB空间。'
  python3 report/tools/prepare_full_materials.py --archive "$materials_root.zip" --destination materials || exit 1
fi
open report/index.html
materials_url='http://127.0.0.1:58766/'
served_sha="$(curl -fsS --max-time 5 "${materials_url}catalog/bundle-manifest.json" 2>/dev/null | shasum -a 256 | cut -d' ' -f1)"
local_sha="$(shasum -a 256 "$materials_root/catalog/bundle-manifest.json" | cut -d' ' -f1)"
if [[ -n "$served_sha" && "$served_sha" == "$local_sha" ]]; then
  print "报告已打开。材料服务已就绪：$materials_url（已核对证据清单 SHA256）"
  print '此窗口可关闭；不会改动正在运行的实时采集会话。'
  exit 0
fi
if lsof -nP -iTCP:58766 -sTCP:LISTEN >/dev/null 2>&1; then
  print '警告：58766 被其它进程占用，且未提供当前材料清单。'
  print '报告仍可离线阅读；完整证据链暂不可用。请结束该进程后重跑本脚本。'
  exit 1
fi
print "报告已打开。材料服务：$materials_url"
print '保留此终端窗口以浏览完整材料。'
python3 report/tools/evidence_server.py --root "$materials_root" --port 58766
