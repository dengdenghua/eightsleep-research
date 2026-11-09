# 发送确认、传感接口与诊断契约

后续四项分析见[传感发送回收与床架控制分析](sensor-and-control-20261108.md)。

继续沿现有 MTK 固件往下追，补的是设备内部的执行链。没有实机采集，也没有取得生产心肺分离、融合、HRV 或分期模型。下面把已查清的行为、推论和下一步分开。

## 发送成功究竟确认到哪里

```text
采样批次 → 主控整理与 CBOR → Frank 队列
    → 同步 js_Publish → 本机 NATS 响应 → Frank 出队
    → uploader 批次 → 云端 batch ACK
    → 云端后续处理（实现仍缺）
```

**本机发布成功比“写入 socket”多一步，仍未到云端确认。** 固件随附的 `libnats.so.3.11.0` 会等待请求响应，解析 JSON 与 API 错误，再读取 PubAck。Frank 在返回 0 后出队，但不进一步核对 PubAck 的 stream、seq 或 duplicate。

还存在一个需要保留的边界：库的 JSON 读取器允许部分字段缺失并填默认值，所以成功不能表述成“严格校验了全部 ACK 字段”。原始字节与 27 份函数导出中的 2,465 条指令已核对一致。

| 情况 | 已恢复的行为 | 对后续采集的影响 |
| --- | --- | --- |
| 未设置等待参数 | 本条构造路径使用 5,000 ms 请求等待参数 | 不是整个调用严格 5 秒结束的承诺 |
| 返回超时 | Frank 保留队首，外层后续可重试 | 不能判定 NATS 此前究竟有没有接收 |
| MsgId 未设置 | 所审路径不添加 `Nats-Msg-Id` | 正文中的 seq 不自动成为 NATS 去重 ID |
| 响应含 duplicate=true | 库可返回成功，Frank 仍出队 | 不能据此断言云端没有其他去重，也不能证明实机已产生重复 |
| 正常 inbox 对应的响应迟到 | 已移除的等待项不能再接收它 | 异常 subject 另有单等待项兼容分支，不概括成任意回应的保证 |

[同包 libnats 完整证据](../evidence/analysis/system-deepening-20261108/nats-library/FINDINGS_ZH.txt) · [函数证据映射](../analysis-tools/system-deepening/nats-library/EVIDENCE_MAP.json) · [字节核验](../analysis-tools/system-deepening/nats-library/ASM_BYTE_VERIFICATION.json)

## Frank 停止与 KV 状态同步

正常退出已追通到对象：main 先停止并等待子系统线程，再清 NATS worker 的运行标志并等待它退出。**等待线程结束不等于排空待发队列。** 线程析构释放的是 16 字节包装对象，并非保存队列的全局 worker。

原 ELF 的异常表还补出了旧反编译遗漏的 main 尾部。已核对 43 条 main LSDA call-site 记录，其中 2 条没有 landing pad，共 32 个不同清理入口。已恢复清理入口的 main 函数内控制流不经过正常 stop 写入；间接 helper 的副作用未穷尽。仍有可 join 的线程时可进入 `std::terminate`。这说明正常停止和异常退出必须分别分析；没有据此宣称全系统绝无其他保存机制。

KV 同步的是部件状态，另有 desired 与 last-success 两张内存表。其规则对 raw 调度有实际影响：

- 同一 key 连续更新可只留下 payload，中间状态不保证逐条发送。
- 每次至多成功写一项；成功便回到 worker 顶部，持续有变化时可延后 raw。
- 某类失败设置的是 **5 秒跳过 KV 的截止时间**，期间仍可发送 raw，不是整个发送线程暂停 5 秒。
- 周期 reconcile 在远端 key 存在时不比较 payload，只在指定 Not Found 分支补写，不能当完整内容一致性校验。

[生命周期与 KV 证据](../evidence/analysis/system-deepening-20261108/frank-lifecycle/FINDINGS_ZH.txt) · [异常路径检查](../analysis-tools/system-deepening/frank-lifecycle/LIFECYCLE_FLOW_CHECK.json) · [全局 worker 引用审阅](../analysis-tools/system-deepening/frank-lifecycle/GLOBAL_WORKER_REVIEW.json)

## USB 与 nonUSB 传感固件的实际差异

两份 `5.5.34.0` 的采样缓存、30 条 ADC / 12 条 IMU 队列、5:1 FIFO 配对及 `0x3c` 组包可逐项对应。**相同版本号并不意味着发送路径完全相同。**

| 环节 | USB 版 | nonUSB 版 |
| --- | --- | --- |
| 等待发送 buffer | 32 槽均不可用时重扫；elapsed≥500 则本地失败 | 对应函数持续重扫，没有该截止分支 |
| 提交前状态检查 | 另有状态 gate，失败可拒绝提交 | 对应 adapter 无此段 |
| 采样批次去向 | 先从队列 pop 5 ADC + 1 IMU，再发送；失败不在此调用点重入队 | 同样先 pop 后发送；长等待可阻挡主循环 |

USB 时基已另补向量、RAM 增量和 SysTick 配置：默认增量为1，在配置成功、频率变量与实际内核时钟一致且中断正常处理时，500计数对应名义500 ms，缓存窗口8对应名义8 ms。它不保证实际墙钟等待严格不超过500 ms，也未验证ADC采样频率。nonUSB独立时基现已在[后续分析](sensor-and-control-20261108.md)闭合；USB gate与发送回收也分别核对，不能简单等同于拔插USB。[时基证据](../evidence/analysis/system-deepening-20261108/sensor-timebase/FINDINGS_ZH.txt)

两类采样队列各自满时拒新，ADC 入队失败也不停止五拍相位推进，因此仍可能产生 FIFO 配对错位。6 个合成场景用于展示这些分支，不能换算实机丢样率。`0x3c` 的 flags 是组包时读取的全局值，不是每条采样保存的新鲜度信息。

[完整差分证据](../evidence/analysis/system-deepening-20261108/sensor-diff/FINDINGS_ZH.txt) · [17 项对应表](../analysis-tools/system-deepening/sensor-diff/DIFF_TABLE.json) · [合成检查](../analysis-tools/system-deepening/sensor-diff/CONTRACT_CHECKS.json) · [原始字节验证](../analysis-tools/system-deepening/sensor-diff/BYTE_VALIDATION.json)

## 诊断入口能读到什么

设备通过 SignalR 接收 `functions.*` 请求，路由与 handler 已能对应。**这不是已经找到手机可调用的同名 HTTP API。** 设备证书身份、手机账号权限和云端转发仍是三层不同条件。

| 入口 | 实际返回 | 不能当成 |
| --- | --- | --- |
| debugnats/get | 本机 NATS 的监控文本；限定六类端点 | 原始压电消息或任意 URL 代理 |
| debugsubsystem/usbports | tty 到 USB port 的可见拓扑 | 附件握手成功、固件身份或当前已就绪 |
| debugfirmness/get | 满足 Ready 等条件后的多类缓存值 | 同一时刻主动采集的完整状态 |
| gettelemetryprofile / gettolerance | 主控保存的配置 | MCU 回读或配置已生效证明 |
| pairing/status | 配网任务状态 | 维护功能的配对开关已打开 |

NATS 监控分页每次都会重新读取完整文本，再按 UTF-8 字节截取、压缩和编码；**没有跨页快照 ID**。逐页拿到的数据不能静默拼成一份同时刻文档。131,072 bytes 是默认片长，并非硬上限。

设备请求串行执行；回包发送失败后，所审客户端只记日志，没有响应重发队列。无响应可能发生在依赖初始化、执行或回包阶段。USB 枚举的部分错误会被吞掉，空列表也不能单独证明没有附件。

维护接口另有副作用和门控：名称含 `get` 不保证只读，维护返回成功也不保证隧道已可用。其代码边界另附证据，没有启动维护或修改设备配置。

[诊断与维护证据](../evidence/analysis/system-deepening-20261108/diagnostics/FINDINGS_ZH.txt) · [结构化接口契约](../analysis-tools/system-deepening/diagnostics/INTERFACE_CONTRACTS.json)

## 同一设备请求为何进入两条队列

随包 SignalR 框架确认：同名 `On("Request")` 注册会追加回调，不由后者覆盖。基类 Client 与派生 DeviceAPIService 各注册一次，分别写入自己的无界 channel；正常宿主只启动派生 channel 的消费者。

因此，正常解析和分发的一条 Request 会**两次入队、一次进入业务 router**。两条队列保留同一个对象引用，不是复制两份 Payload 字节。基类队列存在对象存活期间持续积压的静态路径；重连不重建这条队列，也不增加新的同名注册。

可见的停止/Dispose 路径没有排空该应用队列，但相关对象整体不可达后仍可被 GC 回收。这里没有测得实机内存增长或崩溃，也没有通过高频请求测试。后续应核对实际程序集版本，再用少量只读请求与本地队列/heap 观察验证。

[随包框架与原 DLL IL 证据](../evidence/analysis/system-deepening-20261108/signalr-dispatch/FINDINGS_ZH.txt) · [逐结论位置](../analysis-tools/system-deepening/signalr-dispatch/EVIDENCE_MAP.json)

## 音箱 FOT：先确认来源，再解释文件

旧 C11 清单来自历史 NXP 提取路径。这次将其 **24 个附件样本逐个与 MTK 包重新核对，全部字节相同**；TriMix、Keeson、B12 的默认映射也相同。因此，这些样本的既有分析仍可在注明共同哈希后用于 MTK。差异是 B13：历史默认 V38，当前 MTK 配置默认 **V42**；这仍未证明用户实机已安装 V42。

V37、V38、V42 三个 MTK FOT 文件已验证外层长度和 INFO/DEV/DATA 候选段布局。三版均可按原字节划分为首头 512 字节、候选主体、逐字节相同的重复首头 512 字节、尾段 4,096 字节。V42 比 V38 增加 8,192 字节，与几处候选长度/偏移字段的增量一致。主控的 CRC32 覆盖整份文件；主控不主动剥离容器头，实际发送从远端给定的文件偏移开始。返回的 startAddress 被直接用于文件索引，不能按名称认定为物理 Flash 地址。

主控升级方法返回成功，也不直接证明已发送完整文件并回读了新版本；报告保留了提前返回、文件偏移与状态回复的具体分支。没有执行升级。

**尚未恢复的是设备端 FOT loader、内部字段含义与 DSP 执行程序。** 不能由高熵判定已加密，也不能把候选数据段直接当成已确定架构的机器码。

[音箱格式与传输证据](../evidence/analysis/system-deepening-20261108/accessory-execution/FINDINGS_ZH.txt) · [旧清单到 MTK 的来源核对](../evidence/analysis/system-deepening-20261108/accessory-execution/MAPPING_DIFF_ZH.txt) · [逐文件结构检查](../analysis-tools/system-deepening/accessory-execution/FOT_FORMAT_AUDIT.json)

## TriMix：停止请求已经追到输出寄存器

具体追的是 V25 的 `0x23 / selector=1`。主机方法名为 `StopRightLeg`，MCU 接收后置标志；主循环按活动类型、phase 与 pending 条件调用消费者，清标志后进入停止处理。

这一支已确认向 `0x40011414` 写入 `0x100`、`0x200`，向 `0x40000838/34` 写0，并清 `0x40000818` 的两处位。程序随后写入内部完成字节 AA；该标记紧跟函数返回，**不是等待机械停稳后的反馈**。

物理轴名称仍只归因于主机方法。其余三个 selector 的输出现已逐轴核对，见[四轴停止与完成来源](sensor-and-control-20261108.md)。这仍不证明物理引脚、制动或滑行方式。

[请求到 MMIO 的完整证据](../evidence/analysis/system-deepening-20261108/trimix-execution/FINDINGS_ZH.txt) · [门控与执行链](../analysis-tools/system-deepening/trimix-execution/CHAIN.json)

## Keeson：故障前的信号处理与清除条件

Keeson 10211 的全局故障 B 已向前追到四路输入处理。它先做一个带状态的标量滤波，再做 `Y = 0.7 × X + 0.3 × Y_old`，随后扣基线、转成有符号16位残差，并按运行状态和范围置零。**这是床架附件的检测链，不能当成心率或睡眠算法。**

故障判定还有一次浮点换算和 signed16 截取，因此不能把转换后区间直接说成某个安培值，也不能视为原始残差的单调阈值。采样忙等路径可留下调用前零值；“读到零”不必然代表物理负载为零。

- 门控失败保留累计值；从0开始的51次异常检查不必连续。
- 计数500只在触发后的特定全零残差分支设置，不是每次故障固定执行的冷却。
- 满足命令条件时先减计数；刚减到0的调用不清 B，要等下一次满足条件的调用，且不要求采样健康。
- 停机函数还有软件门控，返回或状态改写不能证明电机已经物理停转。

[输入、公式与故障生命周期](../evidence/analysis/system-deepening-20261108/keeson-execution/FINDINGS_ZH.txt) · [结构化执行链](../analysis-tools/system-deepening/keeson-execution/FLOW.json)

## 哪些工作还值得继续

| 方向 | 下一步具体动作 | 需要的条件与验收 |
| --- | --- | --- |
| 实时数据入口 | 在线后按既有 App live 契约做短时采集，核对时间、数组与通道 | 本人设备联网；取得真实样本后才能判断是否持续波形 |
| 上传完整性 | 对齐 MCU 批次、Frank 发布、NATS seq 与云端 batch ACK | 有主控或合法明文观察入口；把缺失定位到具体层，不能只看序号缺口 |
| 当前硬件与部署 | 记录主控、传感板与各 MCU 版本；核对实物通道走线 | 实机身份/照片/记录；不能由 MT8365 相同推定整套硬件相同 |
| 生产生理算法 | 将原始波形与心搏间隔、阶段结果配对，或分析新取得的部署程序 | 官方导出、真实输入输出或对应实现；参数拟合另标假设 |
| 诊断可达性 | 找到官方 App/支持工具的请求生产者及授权链，先核对纯读入口 | 现有账号登录不足以证明可达；不把设备 handler 名拼成 URL |
| 附件执行 | 选择具体板型，沿电机动作/保护或音箱数据段继续追 | 保留版本与地址；容器字段不能直接当成 DSP 算法 |

原 [45 项待办](roadmap.md) 的实机和材料前置条件继续保留。新的静态结果只补足相应范围，不将整条研究主线标成完成。原始 11 月 7 日完整包保持冻结，另有 [增量证据包](../analysis-tools/system-deepening/source-evidence.zip) 与 [文件清单](../analysis-tools/system-deepening/PACKAGE_MANIFEST.json)。

## 上次四项静态任务的分析结果

| 优先级 | 入口与动作 | 验收边界 |
| --- | --- | --- |
| P1 | USB descriptor 回收与 gate | 已补完成回调、超时回收与门控；迟到完成条件窗口和实机发生情况分别记录 |
| P1 | nonUSB 增益/start 原始 switch | 已由表字节闭合0x28/0x2B与回复，主控首次生产者仍未知 |
| P2 | Keeson 配置、Fault A、定时链 | 已补寄存器配置与状态机；缓存重复累计、物理单位和实测频率仍需区别 |
| P2 | TriMix 四轴停止、phase1与1000字段 | 已补逐轴输出和比较；1000参与运行参数/阈值处理，未证实为倒计时 |

新的具体入口见[后续任务表](sensor-and-control-20261108.md)。围绕原始数据与睡眠算法，优先级仍是传感发送恢复、合法观测入口和真实样本。B13 内部 loader、生产生理模型及云端策略需要新实现材料，单纯增加静态搜索次数不能补齐。

## 证据和复跑条件

增量包保留原始导出、脚本、输入身份与新建的 NATS Ghidra 工程。合成调度检查可独立运行；原指令核验需提供对应哈希的原固件，B13 全套来源核对需使用完整研究目录。脚本中的研究根路径按实际解压位置调整；不能把仅有头部快照当成完整音箱固件。原始完整样本继续由[冻结材料包](full-evidence.md)提供。
