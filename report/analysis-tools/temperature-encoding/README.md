# 温度编码与加权分支复现

使用 Capstone 5.0.7 的独立 Python 环境，从项目根目录运行：

```sh
python3 report/analysis-tools/temperature-encoding/analyze_encoding.py
python3 report/analysis-tools/temperature-encoding/verify_encoding.py
python3 report/analysis-tools/temperature-encoding/verify_query.py
```

engine.py 派生自 temperature-cache/verify_cache.py，增加 SXTH 与明确的 float/double 算术摘要。整数转换、浮点比较、汇总分流和本地查询控制流均解释冻结 g0 字节。查询的状态/附加操作使用摘要，不产生实际请求或设备输出。所有函数入口反例须继续核实调用者可达性；不据模型宣称产品故障。
