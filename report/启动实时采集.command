#!/bin/zsh
cd -- "${0:A:h}" || exit 1
python3 tools/live_server.py --port 58764 --open
status_code=$?
if [[ $status_code -ne 0 ]]; then
  print '服务未启动。若已有窗口在运行，请打开 http://127.0.0.1:58764/ 。'
  read -r '?按回车关闭窗口'
fi
