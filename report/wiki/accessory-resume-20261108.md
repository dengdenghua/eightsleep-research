# 气囊与床架：实现、配置一致性与持久化边界

本章说明气囊故障候选的对象归属、R12跨侧配置一致性及床架注册、命令和持久化边界。

**尚不能宣称两块全部逆向完成：A02 Fault1–4的实际写入端、Keeson 32字节位置记录追加提交端仍未找到。** 当前没有实机动作、串口或Flash前后记录；所有结果是静态代码及分析者模型。

## 气囊：故障写入候选接到具体对象

此前105个自动未知块调用点，分成旧已绑定8、新正常上下文绑定6、SP局部表达式68、动态/通用对象23。这个分类减少不确定性，不代表全部别名穷尽；SP表达式同样只在正常调用帧条件下解释。

新绑定的清零/复制分别涉及压力对象、SHT40缓存、LIS、请求对象和栈输出，所列正常区间不覆盖袋对象Fault字节。后续又追容器、CBOR输出与正常堆分配根，具体地址、实参、范围和残余见两份报告：

两组最后定位的输出实参也已闭合：校准序列化分别写本地256/512字节栈缓冲；capture回调将最多64字节写入协议接收buffer。它们在所审正常实参下都不以袋Fault为目的地址。

[最后两组缓冲实参](../evidence/analysis/accessory-resume-20261108/balloon-buffer-callers/FINDINGS_ZH.txt) · [气囊块操作与对象绑定](../evidence/analysis/accessory-resume-20261108/balloon/FINDINGS_ZH.txt) · [容器与分配来源分析](../evidence/analysis/accessory-resume-20261108/balloon-container-followup/FINDINGS_ZH.txt) · [105点分类账本](../analysis-tools/accessory-resume/balloon/RESIDUAL_CALL_LEDGER.json)

目前已核字段写入仍是清零和已知Fault5/6，未补出Fault1–4生产者。不能把范围内排除升级为全固件不存在，也不能移植旧A00的Fault1规则给A02。后续仍需具体未绑定对象/调用参数的值流，或能绑定同版本故障事件的新资料。

## 气囊主控：成功写盘仍可能丢一侧配置更新

R12管理器是单例。每侧调用者先读整份配置，用record Clone改单侧，再替换整份配置；`saveGate`在后面的Save才取得。它保护写盘，没包住上述整个更新过程。

一个明确先后次序：

1. 左右各读取旧配置 `{L:0,R:0}`。
2. 左侧用旧快照改成 `{L:1,R:0}` 并成功保存。
3. 右侧用自己较早读的快照改成 `{L:0,R:1}` 并成功保存。
4. 最终保存的是 `{L:0,R:1}`，左侧更新未被保留。

选定的“读／克隆替换／成功保存”三步每侧抽象共20种交错，12种丢一侧更新、8种同时保留。**12/20不是现场概率。** 模型将保存抽象为成功原子步骤，不含真实线程调度、保存中的再次赋值、文件错误、设备发送或机械效果。

C#/IL顺序和四份官方DLL来源经独立审阅。这个结果解释配置保存；不能据此断言实际阀泵执行了什么。同进程重连读RAM、进程重启读磁盘的既有规则继续分别适用。

[配置交错完整证据](../evidence/analysis/accessory-resume-20261108/host-config/FINDINGS_ZH.txt) · [20项有限交错](../analysis-tools/accessory-resume/host-config/MODEL_RESULTS.json) · [独立审阅](../analysis-tools/accessory-resume/host-config/INDEPENDENT_REVIEW.json)

## 床架：注册回调、命令与位置保存区分

旧未知`3638e`通过`295d4→2cc64→31614`接到正常目标`362c8`，属于串口事件/缓冲链。事件3走GPIO操作；接收字节则先重同步、组帧及校验，CRC有效后才进入命令处理。

已审命令分支分别更新RAM参数、同步状态、修改预置表并置164字节配置保存条件，或读取196字节Flash诊断。它们都不能替代“当前32字节位置快照提交到0x76000”的证据。

位置快照的已识别直接链`26f40→2b908→2b6a8`更新RAM和CRC，后续`26fd8`构造55字节状态遥测；当前没有新的明确未审32字节提交caller。多入口与计算别名仍属覆盖边界，不能称为已找到保存器。

[注册与位置快照上游](../evidence/analysis/accessory-resume-20261108/bedframe/FINDINGS_ZH.txt) · [串口命令消费者分析](../evidence/analysis/accessory-resume-20261108/bedframe-command-followup/FINDINGS_ZH.txt)

## 位置快照 CRC 清零字段的语义边界

`20003fc0`目前只知在位置快照CRC变化分支清零，没有已绑定读取者、非零writer或Flash提交条件。该字段记为“CRC变化分支清零的未定byte”；不能从dirty这个分析命名反推必有保存消费者。相邻运动字段也不足以确定它是运动状态。

该字段的证据范围与记录扫描、序号、CRC 字段及上层快照触发条件分别记录。

[命名复核与剩余边界](../evidence/analysis/accessory-resume-20261108/bedframe-naming-review/FINDINGS_ZH.txt)

## 后续验收条件

| 项目 | 已确认实现 | 仍要取得或闭合 |
| --- | --- | --- |
| A02 Fault1–4 | 新对象/容器调用正常参数、排除区间和字节证据 | 真实非零writer及触发/清除；未知别名仍保留 |
| R12跨侧更新 | 具体IL锁边界、20项有限交错及独立审阅 | 实际并发、串口输出、重连及文件错误组合 |
| Keeson位置追加 | 注册回调、串口命令、快照/遥测分层 | 32字节提交者；最有区分力的是同版正常保存轨迹或Flash前后样本 |
| 实机行为 | 沿用已有部署未知记录 | 版本与附件绑定、物理响应、复位/断电效果 |

待办C18/C19分别保留Fault生产者和位置追加缺口，C20只验收R12所选静态交错。旧C08/C11的完成范围不代表这两个生产者已经找到。
## FaultReason 条件路径验证

A02 的拆分偏移 `B+0x90+0x12` 对应 FaultReason 的 `B+0xA2`。在已通过 r7=6 门控的片段中，充气计数>2 优先写5，否则放气计数>2 写6；均未达限时保留原字节。Safety 半字清除不覆盖 FaultReason，Fault 清零另经共享字节写入点。30 个原始指令位点、7679 个有限输入检查通过；Fault1–4 的生产者仍未确定。[条件、原始指令与验证范围](balloon-fault-paths.md)
