# 主对象控制流复现

`trace_control.py` 需要 Capstone 5.0.7；可在独立 Python 环境安装 `requirements.txt`。`verify_counter.py` 只用标准库。

```sh
python3 report/analysis-tools/main-object-control/trace_control.py
python3 report/analysis-tools/main-object-control/verify_counter.py
```

分析器读取冻结 g0 的固定 SHA256，不执行目标。控制流图的调用被抽象为返回并保存 r7，三处 switch 的合法索引范围显式给出；图外入口、ISR、调用是否返回与路径可行性单列。独立解释器只解释计数门控选定片段的指令，在人工内存上核对模型，不能替代设备执行。
