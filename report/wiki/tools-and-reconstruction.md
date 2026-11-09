# 离线解析器与分析重建

本项目附带协议解析器、分析者重建C表达、合成算例和可复跑模型。它们把文档中已恢复的协议与行为变成可检查的文件；这些不是生产算法或可刷写设备固件。

## 完整材料服务与队列模型

[完整证据链](full-evidence.md) 的原件由 `tools/evidence_server.py` 在本机 58766 端口提供，支持大文件单段续传，不读取账号配置。原实时服务 58764 与其分别运行。

```sh
python3 tools/evidence_server.py --port 58766
python3 analysis-tools/prepublish-queue/model/run_cases.py
```

[队列模型与审计](prepublish-queue-20261108.md) 可直接复跑，附 5 份取证输入和全部导出。若要重新验证指令字节，还需从完整包取得相同 SHA-256 的 Frank ELF，再运行 `analysis-tools/prepublish-queue/code-audit/scripts/verify_asm_bytes.py /path/to/frankenfirmware`。模型运行不执行固件或连接服务。

## 账号与实时采集入口

 [实时采集工具](live-capture-tool.md) 与下列离线解析器分开运行。双击项目根目录的 `启动实时采集.command`，在 [本地页面](http://127.0.0.1:58764/) 登录并选择绑定设备后，手动读取15/30/60秒；每次限8MiB、4000事件或200000样本，可导出JSONL与元数据。

主报告及本页离线工具不访问账号；实时工具的登录、刷新设备和启动读取会访问官方服务，不发送设备控制命令。会话和未导出数据只存内存。运行配置不放在`report/`，冻结研究TAR则保留APK内置参数的研究副本；工具不会自动读取TAR。换机配置、失败判定及明确标注的`--demo`演示模式见工具说明。最近一次查询找到1台离线Pod6，真实采集仍未发起。

## 文件与适用输入

| 文件 | 用途 | 范围 |
| --- | --- | --- |
| [adc_spi_decoder.py](../analysis-tools/adc_spi_decoder.py) | 解码 ADC SPI 帧 | 本地二进制帧，需要明确通道数及软件倍率 |
| [host_signal_parser.py](../analysis-tools/host_signal_parser.py) | MCU USB payload、LSP、主控 CBOR | 支持格式、CRC、槽位与样本数组解析；不做心肺分离 |
| [decode_uploader.py](../analysis-tools/decode_uploader.py) | uploader 批次、压缩流、session stream、ACK | 输入须是对应协议层的已取得字节；不解密 TLS、不连接服务 |
| [热控重建 C](../reconstructions/thermal-pseudocode.c) | 阅读 Frozen 1.7.7 的关键控制流程 | 不完整可编译程序；不应用于真实设备 |
| [姿态重建 C](../reconstructions/posture-pipeline.c) | 阅读附件逐通道五点均值与抽取 | 附件样本与床垫生理生产链的部署对应未建立 |
| [上传失真算例](../analysis-tools/results/upload-distortion.json) | 已保存的缓存、队列和双侧模型结果 | 合成输入，非实机数据 |
| [增益恢复算例](../analysis-tools/results/gain-recovery.json) | 已保存的 flush 与 IRQ 边界模型结果 | 不模拟所有指令交错或物理发生率 |
| [时间恢复算例](../analysis-tools/results/time-recovery.json) | mapper 与旧数据水位的有限模型结果 | 门控放行不是实机端到端上传恢复 |

## 在本地使用

以下命令从项目根目录运行。解析器使用 Python 标准库；输入文件由读者提供，不会自动从账号、设备或网络取数据。

```sh
python3 analysis-tools/host_signal_parser.py --self-test
python3 analysis-tools/adc_spi_decoder.py --help
python3 analysis-tools/decode_uploader.py --help
```

已取得合法本地捕获文件时，可按实际格式选择解析入口。下面的 input.* 是待替换文件名，不是本项目已提供的真实采样：

```sh
python3 analysis-tools/host_signal_parser.py lsp input.lsp --side left
python3 analysis-tools/host_signal_parser.py cbor input.cbor --samples
python3 analysis-tools/decode_uploader.py input.bin --kind compressed-batches --decode-stealth --signal-parser analysis-tools/host_signal_parser.py
```

uploader 工具保留原目录时代的默认 companion 路径，所以开启 `--decode-stealth` 时必须如上显式传入 `--signal-parser`。工具源码原样复制并记录哈希，便于与原研究结果核对。

## 可复现到哪一步

主控解析器的 12 项内建合成检查在本项目内运行通过，涉及字节序、CRC、帧长度、槽路由、缺值及左右侧输出。它验证格式实现，不评估睡眠算法准确率。

三份 RESULTS 是既有模拟结果快照。本项目没有捆绑原模型运行所依赖的全部反汇编导出、Ghidra 工程和固件，因此不能声称在任意新电脑上直接重新生成这些结果。完整复跑需要原研究材料，路径与来源哈希保留在结果和 [分析产物清单](../data/analysis-artifacts.json) 中。

原始官方二进制的位置和哈希见 [原始样本清单](../data/artifacts.json)。实机文件时，先验证格式、版本与来源，再讨论与模型的吻合程度。

## ：状态文件模型

[C06 状态文件读取模型](../analysis-tools/persistence-model/state_file_model.py) 和 [验证程序](../analysis-tools/persistence-model/verify_cases.py) 附带合成输入、显式初始状态及 [结果](../analysis-tools/persistence-model/RESULTS.json)，仅使用 Python 标准库，可独立复跑。缺失布尔字节用未知标记表示，不假定关闭。

```sh
python3 analysis-tools/persistence-model/verify_cases.py
```

[结果与边界](round-20261107.md) · [C06 证据](../evidence/analysis/next-round-20261107/persistence-model/FINDINGS_ZH.txt)

## ：主控联合模型

[主控模型](../analysis-tools/host-model/model.py) 与 [场景程序](../analysis-tools/host-model/run_cases.py) 可独立复跑10组输入，逐记录结果见 [TRACE.json](../analysis-tools/host-model/TRACE.json)。这是保留的历史10组模型，仅覆盖buzzer。当前34场景版本在下节，历史限制不应套用到新版。

```sh
python3 analysis-tools/host-model/run_cases.py
```

## 当前模型与检查工具

| 工具 | 用途 | 验证范围 |
| --- | --- | --- |
| [主控联合模型](../analysis-tools/host-model-expanded/model.py) | 四类buffer、真实共享mask、gate、取消/异常及CBOR编码 | 34组指定输入；非固件执行 |
| [CBOR编码器](../analysis-tools/cbor-encoder/encode_buffers.py) | RAM布局到成功编码字节 | 30项独立解码对照；不模拟分配器和网络 |
| [温控模型](../analysis-tools/thermal-model/model.py) | 有效期、限幅、换向、注水 | 73项局部门限；非完整PID/热响应 |
| [App汇总缓存模型](../analysis-tools/metrics-aggregate/cache_model.py) | 旧/新Map、空返回、占位覆盖 | 7例；非传感滤波 |
| [App图表公式](../analysis-tools/app-charts/model_checks.py) | 日期、OFF/NONE补段、坐标与异常边界 | 29例；未运行目标App |
| [SEQNO读取器](../analysis-tools/raw-upload/seqno_decoder.py) | 只读SEQNO.RAW的两个uint64 | 8项合成检查；拒绝其他RAW名称 |
| [TriMix包检查](../analysis-tools/trimix/inspect_package.py) | 128字节头、CRC和复位向量 | 7原包及7修改副本；不证明兼容或可刷写 |

```sh
python3 analysis-tools/host-model-expanded/run_cases.py
python3 analysis-tools/cbor-encoder/run_cases.py
python3 analysis-tools/thermal-model/run_cases.py
python3 analysis-tools/metrics-aggregate/cache_model.py
python3 analysis-tools/app-charts/model_checks.py
python3 analysis-tools/raw-upload/seqno_decoder.py --selftest
python3 analysis-tools/trimix/inspect_package.py /path/to/8Sleep.bin
```

最后一项需读者提供原包路径。启动图、RAW额度/淘汰模型和附件分析的来源清单可随项目阅读；重做反汇编、核验原字节仍需原研究目录的大文件。所有模型都标明已恢复的分支及未覆盖范围。
