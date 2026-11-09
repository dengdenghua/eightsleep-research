# 温度窗口复现

使用独立 Python 环境安装 `capstone==5.0.7`，在项目根目录运行：

```sh
python3 report/analysis-tools/temperature-cache/analyze_cache.py
python3 report/analysis-tools/temperature-cache/verify_cache.py
python3 report/analysis-tools/temperature-cache/verify_packet_composition.py
```

输入为固定 SHA256 的 g0，只解释选定 Thumb 字节，不执行目标固件或访问设备。真实 push/pop、setter/getter、浮点比较在有限解释器内执行；memcpy、整数除法及浮点加除用摘要。包体组合复用 state-output-chain 的有界模型，getter 结果作为已算输入注入，不能宣称一次全固件运行。正常容量 10、无并发和无计数回绕的范围显式保留。
