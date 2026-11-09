# 可选包与状态统计链

需要 Capstone 5.0.7，使用独立 Python 环境即可，不执行目标固件。

```sh
python3 report/analysis-tools/state-output-chain/analyze_chain.py
python3 report/analysis-tools/state-output-chain/verify_packet.py
```

输入是固定 SHA256 的 g0。OUTPUT_CHAIN.json 保存字节、断言及边界；PACKET_VERIFICATION.json 记录 64 个人工模型输入的包体对照。包体解释器执行选定指令与真实 BE32 叶函数语义，对 getter、memset 和发送采用摘要。发送返回值不代表硬件/云端接收，也不测量实际错误率。
