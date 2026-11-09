# 主控时间映射与数据整理

主控负责按时间组织读数，期间可能复制旧槽位、覆盖同位置记录或丢弃整批数据。本页恢复的是这些处理规则，尚未涉及睡眠分类。

MT8365 上的 `frankenfirmware` 接收 MCU 字节流，把它变成左右侧、按秒组织的原始 CBOR。已恢复的是解帧、时间映射、缺口处理和输出布局；**这条已追路径中的左右归并不等于生理信号融合。** 样本为 AArch64 ELF，SHA256 `84727b57ef8b226c78618f9fa9257df7d8ae771c78d8a51e6f3cabf0acc0c375`，关键函数以反汇编互证，未执行原程序。[主机分析](../../evidence/analysis/signal-host/SIGNAL_HOST_ANALYSIS.txt)

## 调用链与数据契约

```text
LSP 解帧 / 0x3c
  → 16 ADC槽 + 4组IMU
  → MCU tick 映射到主机秒与相对毫秒
  → 左右侧独立秒桶
  → 单侧或双侧 loader
  → piezo-buzzer / imu-multi-channel CBOR sequence
  → raw.x.sens.stealth + CBOR body
  → Frank 发送队列 → js_Publish → 本机 NATS
```

主机按 USB 拓扑确定左右侧，读取 flags 判定启用组。每包一份 IMU block 附到5条内部 ADC sample，输出阶段按数组下标每5项取一次，不能当成5次新 IMU 采样。K60 所在 `rev>=0xA30` 分支只输出 buzzer 与 IMU，较早分支还可能增加兼容 extADC 和两路 piezo。[路由证据](../../evidence/analysis/signal-host/SIGNAL_HOST_ANALYSIS.txt)

| 输出 | 格式与量纲 |
| --- | --- |
| piezo-buzzer | 每侧5条 byte string，每条500个 int32 LE；freq500 |
| imu-multi-channel | 每侧4组，每组 gyro/accel XYZ，每轴100个 int16 LE；freq100 |
| ts | 主机组织出的秒级时间标记，不是直接透传 MCU uptime |
| version/lver/rver | 来自 MCU flags，不应当成固件版本号 |
| gain | 常规 Stealth 路径来自固定名义表；不能直接当实际 PGA 回读 |
| 缺值 | ADC `0x7fffffff`、IMU `0x7fff`；需与有效峰值区分 |

传感 wire 是 BE，而样本 CBOR byte string 内为主机 LE；CBOR 元数据本身仍依 CBOR 编码。主机 gain 表前8槽100、后8槽400，loader没有用它把 counts 换算成物理量，也未在所审常规路径找到实时同步 MCU PGA 的 setter。[gain 来源](../../evidence/analysis/signal-host/GAIN_METADATA_ZH.txt)

## 时间映射与补点

首次记录 `anchor_epoch` 的整数秒和 `anchor_tick`。每点使用 `uint32(tick-anchor_tick)`，按除1000与模1000定位秒桶和槽；没有恢复出估计 ppm 后改变斜率的重采样器。500 Hz配置下每1000次调用或 tick 回退会检查时钟，差值严格大于2个整数秒才按漂移分支重建，另有共享同步位路径。日志中的 `ms` 不改变这里的秒单位。[时间算式](../../evidence/analysis/signal-host/TIMING_CONTINUITY_ZH.txt)

只在 tick 间隔恰为两个预期步长时补一个点，内容复制当前/下一点，既非线性插值，也非恢复原始测量。跨秒边界还有重要条件：caller 已把 epoch 加到新秒，补点仅减 relative，可能把应补在前秒末的值放到新秒末；之后真点若到达可覆盖它。[跨秒分析](../../evidence/analysis/signal-host/TIMING_CONTINUITY_ZH.txt)

## 双侧归并为何可能放大一个缺口

双侧 loader 按桶数选主侧，平手选左侧；找到另一侧同秒桶后，时间完全由主侧对应数组项提供。主侧中间的默认空槽 `epoch=0` 可触发提前结束，随后删除双方该秒整桶；次侧同样的缺槽通常只留下 sentinel。该选择按缓存数量，不是通道质量评分。[双侧控制流](../../evidence/analysis/signal-host/DUAL_SIDE_CONTINUITY_ZH.txt)

以下是固定500槽桶、右侧完整、参考时间稳定且满足 flush 条件的**合成输入模型**，并非真实整夜数据。计数针对每侧一个代表性 buzzer 分量，不是全部 ADC/IMU 输出总数：

| 左侧输入缺口 | 主侧 | 左有效输入保留 | 右有效输入保留 |
| --- | --- | --- | --- |
| slot100 缺1点 | 左 | 499真点 + 1复制值 | 500 |
| slot100..104 缺5点 | 左 | 100，另395个已到达点未输出 | 100，另400个已到达点未输出 |
| 同样缺5点 | 右 | 495 | 500 |

另有主侧前导空槽使次侧多个来源反复覆盖输出slot0的情形，因此“计数500”不等于500个不同且时间正确的真实值。模型说明条件性后果，不能给出用户设备的损失概率或对睡眠准确度的影响。[定量算例](../../evidence/analysis/device-side-followup/upload-distortion/FINDINGS_ZH.txt)

## 重建锚点不等于上传恢复

入队层另有已消费秒水位：`epoch<=watermark` 跳过数据却返回 true。落后严格超过30秒的累计第500次尝试会清左右容器；较小回退不累加也不清已有计数，新时间输入则清计数。因此500次既不保证连续，也不是固定一秒恢复。

受控 mapper 在检查点收到 +3秒阶跃时输出步长为3002 ms，−3秒时倒退2998 ms。固定水位子模型中，落后30秒与31秒走不同分支；它只报告首次通过门控，尚未模拟后续插入、loader、上传或云端补偿。自然 uint32 回绕又有保持2 ms连续的对照例。[时间恢复模型](../../evidence/analysis/device-side-followup/recovery-round/time-recovery/FINDINGS_ZH.txt)

## 联合模型与编码验证

34组场景已把双侧共享mask、mapper、四类buffer、水位和受控协程交错接起来，包含取得gate前后取消及编码后分配异常。主侧首槽为空时，副侧IMU可能形成epoch=0候选；编码失败也不恢复已删桶。所有结论限定于指定合成输入。

成功编码器已通过30项独立解码对照。extADC在loader设定的`adc=0x41`下虽然填四组RAM数组，最终仅编码left1/right1；buzzer的gain是有符号16位，multi则零扩展。gain/版本是缓存标签，不保证硬件设置同步生效。[模型与来源](../../evidence/analysis/finishable-20261107/host-model/FINDINGS_ZH.txt) · [编码布局](../../evidence/analysis/finishable-20261107/cbor-encoder/FINDINGS_ZH.txt)

这 34 个场景的输出边界是 `body_candidate`：已有编码结果，不表示 Frank 发送队列接收，更不表示本机或云端确认。本样本的 raw 发送队列共享 16 条消息容量；`0x001F49B0` 满时拒绝新消息，调用方仍释放临时 body、推进本地 logger seq，没有恢复已删秒桶。worker 仅在 `js_Publish` 返回 0 后弹出队首，失败则保留并重建连接。发送队列模型使用合成消息，10 个场景及 1024 个有限操作序列检查与旧 34 场景分开计数。[发送队列证据](../../evidence/analysis/prepublish-queue-20261108/code-audit/FINDINGS_ZH.txt) · [详解](../prepublish-queue-20261108.md)

同一个 body 的多次发布尝试不等于实测重复。超时可能发生在服务端写入之后、成功返回之前；只有把本地尝试与 NATS 接收记录对应起来，才能确认一次、重复或未收到。

旧日志路径能解释的是`SEQNO.RAW`两个uint64序号字段及15分钟名称轮转状态。未找到以该名称写波形的实现，已识别正文仍走JetStream；不能由`.RAW`扩展名认定存在一份磁盘波形。[旧RAW追踪](../../evidence/analysis/finishable-20261107/raw-upload/HOST_03_FINDINGS_ZH.txt)

## 实际接收器与新的贯通模型

本包两个UsbSensor对象、端口表、`read`、LSP与业务分派的路由已闭合。运行固件分支使用两字节长度，bootloader另有一字节模式。CRC只覆盖body，成功后进入opcode/payload处理并受业务状态门控；已继续限定核对0x3c/0x33的异常长度。转义状态跨read保留：残留`0x7d`可能把下一帧的`0x7e`当数据，不能保证错误只影响当前帧。[接收路由与12项有限检查](../../evidence/analysis/system-deepening-20261108/host-usb-receiver/FINDINGS_ZH.txt)

2048字节配置只限制body写入，计数仍可继续。声明更长且完整走到CRC时，CRC按完整计数读取，可证超出body子缓冲范围；没有因此证明超出整个对象、实机崩溃或可利用。模型在这处停止，不填造相邻内存。

新贯通模型使用上述接收器的规范输入路径，把合成采样值、完整LSP字节、主控输入、CBOR和Frank发布队列串起来。固定双侧、500频率字段、`flags=0xf200`、稳定锚点与`compat=False`；8场景产生9个候选body，逐body独立解码核对88,200个标量。所有body均为30,128字节，完整数组、缺值、旧值与复制值仍可能具有相同包长；该大小仅适用于配置。

FIFO暂停场景延长到次秒后，100条左IMU输出均能追到偏移30次callback的原配对。单callback缺口场景则明确区分复制出的ADC行与重复选用的IMU快照。这些来源由模型旁路记录，不能当成线上自带的新鲜度字段。发布返回码也是合成条件；未执行原厂程序、NATS或云端算法。[贯通模型与逐点证据](../../evidence/analysis/system-deepening-20261108/integrated-capture-model/FINDINGS_ZH.txt) · [集成前契约审计](../../evidence/analysis/system-deepening-20261108/integration-contract-review/FINDINGS_ZH.txt) · [完整结果与工具](../capture-pipeline-20261108.md)

## 变长与短payload的具体后果

`0x3c`用长度向下取整决定ADC条数与IMU起点。自洽CRC的payload从376缩至375时，会按4条ADC解读，并把原第5条ADC的一部分当IMU；当前120…2047范围内的读取仍在payload中，不能写成这条路径已证越界。frequency只拒0，大于1000时整数步长为0；禁用通道填sentinel而非旧解析缓存。

`0x33`长度26/27可覆盖固定读取，≥28却不解码；0…25可能读取接收缓冲残留。调用者先清零独立20字节输出对象，之后仍请求CapSense处理，是否入队受对象和队列门控。该支路是否由当前K60生产尚未知，不能泛化为普通压电数据。17项合成检查单列，不并入原8场景贯通结果。[payload证据](../../evidence/analysis/system-deepening-20261108/host-payload-boundaries/FINDINGS_ZH.txt)

已补出G0 USB正常0x33/0x44生产者，并接到raw.sens.capsense/capextended。MCU在发出前做换算、CAPDAC补偿/调整、有效值缓存和状态计时；主控0x33把−1缓存的图样输出为65436，0x44保留−1.0而非自动转null。0x34/0x35仍按不同opcode分流。[正常生产者、处理与主控出口](../../evidence/analysis/system-deepening-20261108/local-signal-closure/FINDINGS_ZH.txt)

## 旧式Sensor的规范采样消费链

0x34/0x35的旧式消费者已补齐。当前所审UsbSensor对这两个opcode只完成事件，不调用对应decoder；旧式Sensor则按配置接入handle 1字节流，不能由抽象层名字确认实际物理端口。

0x34的tag=0x42规范包有25行8字节数据；旧decoder每次入口先要求remaining≥16，所以最后8字节只返回长度，不更新输出对象，caller仍再提交上一输出。稳定时基、无补点和顺序完成模型中，24次更新、25次提交只产生24个唯一槽，末次覆盖槽23、槽24保持缺值。条件选中raw_ext_adc_buffer时，piezo-dual只编码left1/right1，进入本地raw.sens.piezo；内部四个数组不代表线上四路。

0x35的10行均按16字节解码，lps/pres四个输出数组对应record的+0x18/+0x10/+0x14/+0x0c，进入raw.sens.lps。规范producer写入的四个metadata为0，temp/pres键名不能推出物理单位；新buffer的adc默认值也不能直接用wire version替换。

停在规范格式、buffer及条件编码schema/本地主题；两个布局、8组模型检查不包含原厂CBOR执行或云端发布，实际部署仍待核对。[消费者、字段与来源](../../evidence/analysis/system-deepening-20261108/host-legacy-sample-consumers/FINDINGS_ZH.txt) · [完整模型范围](../capture-pipeline-20261108.md)

## 下一步

HOST-01的旧34场景与8场景贯通模型分别完成限定验收；RAW-05的队列静态契约及合成字节衔接也已补齐。0x3c/0x33异常payload已做限定分析；0x33/0x44正常生产者现已补齐，剩实机实际模式与同源记录。HOST-02仍需同源LSP、编码候选、队列事件与NATS记录；HOST-03仍需真实波形RAW或另一版本writer。实机发生率、云端补偿和睡眠准确度不由这些模型推出。

[结果与可复跑工具](../finishable-20261107.md) · [传感MCU](sensor-mcu.md) · [缓存与上传](raw-upload.md)

## 本地处理链

[电容、范围统计与温度](../algorithms/local-capacitance-temperature.md)补齐正常生产者、字段意义和主控输出，并修正旧式传输的read/write命名。旧式读取为00202a64→002379a0；00202a50→00237a60实际是写入。
