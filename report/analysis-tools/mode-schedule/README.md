# 模式与调度复现

使用独立 Python 环境安装 `capstone==5.0.7` 后，从项目根目录运行：

```sh
python3 report/analysis-tools/mode-schedule/analyze_mode.py
python3 report/analysis-tools/mode-schedule/verify_schedule.py
```

MODE_PROVENANCE.json 记录固定源镜像、H 与回调来源、140 节点有界图及置位路径性质。SCHEDULE_VERIFICATION.json 包含 56 组指令解释模型，入口寄存器与摘要调用条件明确列出，只记录 setter 请求，不执行真实 getter/setter/外设，不证明实际缓存接受或物理采样。
