#!/bin/zsh
cd -- "${0:A:h}" || exit 1
print '材料入口：http://127.0.0.1:58766/'
print '原报告：http://127.0.0.1:58764/report/index.html#full-evidence'
python3 tools/evidence_server.py --port 58766
status_code=$?
if [[ $status_code -ne 0 ]]; then
  print '请确认移动硬盘已挂载。若材料服务已在运行，直接打开上面的入口即可。'
  print '完整项目包首次使用，请先运行其顶层的“启动完整项目.command”解包材料。'
  read -r '?按回车关闭窗口'
fi
