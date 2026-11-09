# A02 故障字节的条件路径验证

输入为完整证据包中 A02 `firmware-balloon-g0.bbin`，SHA256 在脚本中固定。安装 `requirements.txt` 后，从仓库根目录运行：

```sh
python3 report/analysis-tools/balloon-fault-path-audit/verify_paths.py
```

脚本对原始指令执行有限解释，覆盖 `0x0802293c` 条件入口、拆分偏移写入、Safety 半字清零与共享 Fault 清零片段。它不执行原厂程序或访问设备。所有初始内存和寄存器均为模拟输入；结果不得解释为真实故障触发率或完整逆向覆盖率。

`PATH_VERIFICATION.json` 保存输入哈希、30 个实际解释的指令位点、路径轨迹和 7,679 项有限输入检查。脚本只支持所选片段使用的指令；遇到其他指令或超过步数上限立即失败，不静默跳过。报告正文见 `wiki/balloon-fault-paths.md`。
