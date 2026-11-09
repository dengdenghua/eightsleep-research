# 传感采集与本地前处理

这一页讲数据刚离开传感器时发生了什么。关键是：程序保存了一条记录，不代表每个传感器都刚刚重新测量了一次。

这层已经包含真实的本地信号处理：器件滤波、PGA、数值转换、映射、缓存与定时快照。**已恢复的链尚未包含生产心率、呼吸分离、通道融合或睡眠分类模型。** 主要样本是官方包内 USB sensor MCU `5.5.34.0`，BBIN 映射基址 `0x08010000`；当前实机运行镜像未绑定。[采集链证据](../../evidence/analysis/sensor-mcu/SENSOR_ANALYSIS_ZH.txt)

## 输入到输出

```text
压电模拟信号 → ADS ADC 内部滤波/转换 → SPI 帧与 ready mask
                                      ↓
                       signed24 × 软件倍率 → 通道映射 → ADC cache
IMU 六轴寄存器 → 按轴 ready 更新 → IMU cache
                                      ↓
                        定时 IRQ 保存软件快照
                     ADC FIFO 30条 / IMU FIFO 12条
                                      ↓
                5 条 ADC + 1 条 IMU → LSP opcode 0x3c
```

输入是 ADC counts 和 IMU counts，输出仍是按协议组织的 counts。每侧逻辑设备由主机分配，不能把两个 ADC 实例的 left/right 日志当成整床左右侧。[布局与端序](../../evidence/analysis/sensor-mcu/SENSOR_ANALYSIS_ZH.txt)

## 前端实际做了哪些处理

| 处理 | 恢复出的行为 | 不应据此推导 |
| --- | --- | --- |
| ADC 滤波 | CLOCK 配置 HR、OSR8192；成功初始化条件下正常抽取为 sinc3×1024 后接 sinc1×8 | 这不是心率与呼吸两个生理频带的分离算法 |
| ADC 数值 | BE 有符号24位扩展到 int32，再乘软件倍率并映射 | 没有自动变成压力、位移或已标定生理幅度 |
| ADC 校准 | 已追 RESET 后写 CLOCK/PGA，未见改写 offset/gain/phase/DCBLOCK | 默认校准运算仍存在；不能说整机完全没有校准 |
| IMU | 六轴读取；自检后再次 reset，正式配置100 Hz；32767改32766保留缺样哨兵 | 自检五点均值不属于正常生理输出滤波 |
| IMU 器件默认 | 成功 reset 与配置前提下推导 ±2 g、±125 dps，额外滤波/偏置未开启 | 加速度第一阶段滤波仍在，不能说完全无滤波 |

WHO_AM_I 和寄存器模型支持 LSM6DSV 家族，尚不能唯一确定封装料号。外部 ADS 的校准与 MCU 内部测温 ADC 的 `adc recalibrated` 是两条不同路径；另有 FDC 电容前端 CAPDAC 同步链，但其 gain setter 目前只闭合到 RAM shadow，不能称硬件增益已生效。[前端寄存器与校准](../../evidence/analysis/sensor-mcu/FRONTEND_DSP_ZH.txt)

## 500 个槽不保证 500 个新转换

定时器请求500 Hz，ADC每次保存，IMU每5次保存一次。ADC读取失败、无 DRDY、部分通道 ready 或同步后的缓存窗口都可能保留旧值；IMU 加速度与陀螺仪也分别按 ready 位更新。共享 cache 没有整组原子提交，IRQ 可以在逐通道写入之间取得混合快照。

`0x3c` 的 flags 是可用状态，既不是逐点 CRC 结果，也不是逐通道新鲜度标记；实际线上没有 IMU tick 或来源序号。因此重复数值可能来自静止信号，也可能来自缓存，单凭幅值不能区分。[新鲜度审计](../../evidence/analysis/sensor-mcu/SAMPLE_FRESHNESS_ZH.txt)

| `0x3c` payload 偏移 | 字段 |
| --- | --- |
| 0 | 首条 ADC 的 uint32 毫秒 tick |
| 4 | uint16 flags |
| 6 | uint16 frequency，发送500 |
| 8 | 5 × 16 × int32 ADC，320 bytes |
| 328 | 4 × 6 × int16 IMU，48 bytes |

总 payload 为376 bytes，多字节字段为 BE。外层 LSP 转义 `0x7d/0x7e`，CRC seed 是 `0x1d0f`；ADC SPI CRC seed 则是 `0xffff`，不可混用。[协议定义](../../evidence/analysis/sensor-mcu/SENSOR_ANALYSIS_ZH.txt)

## 队列与增益切换的恢复语义

ADC/IMU 两个 FIFO 满时各自丢新，消费按5:1取数，不检查时间。在受控模型中，暂停消费60次 callback 后恢复，后续40包的 IMU 快照始终比包末 ADC 早30次 callback；只有实际500 Hz才可换成60 ms。这是指定调度的代码结果，未测得实机发生率。[上传前模型](../../evidence/analysis/device-side-followup/upload-distortion/FINDINGS_ZH.txt)

增益命令回显先于硬件写入/读回；dirty 写失败仍保留重试，却同样进入 flush/sync。运行中 flush 先清 ADC 再清 IMU，不清 `mod5`，启动函数才另行清零。有限模型中，保留相位0..4对应后续包的相对偏差0..−4 callback；一个位于两队列排空之间的 IRQ 又可改变配对。连续8次失败、每次 write2/sync4 callback 的输入产生48条 ADC，其中44条被 flush、4条残留、没有完整包；这些时长是模型输入，不能当成设备故障统计。[增益恢复模型](../../evidence/analysis/device-side-followup/recovery-round/gain-recovery/FINDINGS_ZH.txt)

## 按键和手势是独立旁路

本样本 K 系列采用 GPIO 按下/释放事件，识别500 ms长按或连按并上传 `0x37`；没有在这条按钮生产链读取新的16路 ADC 或4组 IMU。旧修订的 LIS tap 候选、Z轴峰峰值及压电排除属于另一互斥分支，不能代替 K 系列的说明；GPIO 上游实体感应元件仍未知。[手势链](../../evidence/analysis/sensor-mcu/TAP_SIGNAL_PROCESSING_ZH.txt)

## 设置链的当前结论

FDC的读数getter会拆开映射字节中的组号与通道，setter却直接用完整映射字节算地址。含0x40组位的映射可使gain/CAPDAC请求写到同一cap对象的采样字段或完成标志；28项地址检查中12项偏离预期设置字段，未越过整个对象。常规调度和I2C路径中也没有找到把gain请求写入GAIN_CAL的步骤。[FDC来源与边界](../../evidence/analysis/finishable-20261107/sensor-control/SEN03_FINDINGS_ZH.txt)

USB侧已检查DeviceAPI、实际全局实例、adapter、公共状态机和pending重试。后者可以重发已有0x2B，仍未找到首次生产请求的入口。不能把ACK接收闭环当成已找到设置来源。[USB覆盖清单](../../evidence/analysis/finishable-20261107/sensor-control/SEN02_FINDINGS_ZH.txt)

SEN-03完成限定静态验收；SEN-02需首次发送的运行记录或额外组件。SEN-01仍需同源实机读数验证新鲜度和队列行为；板型与设置是否实际触发尚未绑定。

[结果](../finishable-20261107.md) · [详细待办](../roadmap.md)

## USB / nonUSB 运行链差分

同版本号5.5.34.0的两版已逐项核对采样、队列和组包。发送层存在差异：USB等待32槽buffer有elapsed≥500的失败分支，nonUSB对应函数没有。后续USB时基审计已确认默认SysTick链，条件成立时500为名义毫秒；并非实测等待上限。两版均先pop批次再发送，局部失败不在该调用点恢复。17项对照和6个合成场景见[系统分析](../system-deepening-20261108.md)与[差分证据](../../evidence/analysis/system-deepening-20261108/sensor-diff/FINDINGS_ZH.txt)。完成回调、超时回收和gate生产链现已分析；实际失败频率仍未知，见[传感发送分析](../sensor-and-control-20261108.md)。

[USB时基补充](../../evidence/analysis/system-deepening-20261108/sensor-timebase/FINDINGS_ZH.txt)保留默认增量、reset复制源与SysTick配置。寄存器定义参照[ARM官方CMSIS](https://raw.githubusercontent.com/ARM-software/CMSIS_5/develop/CMSIS/Core/Include/core_cm0plus.h)，固件调用链以原BBIN为准。

nonUSB原始跳转表确认0x28启动与0x2B增益路径；1–99可回显状态0但setter不更新，不能把回显作为硬件应用证明。独立nonUSB时基亦已核验。见[命令分发证据](../../evidence/analysis/system-deepening-20261108/sensor-nonusb-dispatch/FINDINGS_ZH.txt)。

USB分包链已补：正常EP81配置按64字节复制PMA，后续IRQ继续读取原RAM，未先复制整条记录。旧槽提前回收后，只有实际被重写且尚未复制的交集可能影响后续包；已复制包不会因原RAM重写而改变。超时判断/回收不受gate失效清队列的IRQ8屏蔽保护。已补主控CRC、长度、转义与重同步的限定审计；残留转义可能吞掉后续起点，CRC通过也不证明新鲜度。0x3c/0x33异常payload已做限定分析；其余业务分支、实际发送来源与实机影响仍待核对，不能从条件窗口直接认定实机或云端坏包。[分包与IRQ证据](../../evidence/analysis/system-deepening-20261108/sensor-usb-packet-read/FINDINGS_ZH.txt)

## 发送长度与贯通后的去向

已逐条追到封包器的正常生产者：`0x3c` body为377字节（含opcode），即使把长度宽度放宽为4字节、所有相关内容按最坏转义计算，整帧也不超过767字节。其他已识别普通数据/状态包≤216字节，当前已审正常回复链≤130字节；512字节回复缓冲容量不等于现有命令会生成512字节。

封包器在偏移达到1024时提交，随后只清偏移、不换槽。整帧恰好1024且无后续字节时没有本帧后续复写；超过1024、同槽继续写且消费者尚未取完时才存在覆盖条件。后续日志格式化追踪已将正常body界收紧为≤513；无重入、有效格式化及原前缀前提下，四字节长度模式整帧仍≤1023。无重入模型中写入仍在offset0…1023，不能称已证`slot[1024]`越界。[逐调用者与10项边界检查](../../evidence/analysis/system-deepening-20261108/sensor-frame-bounds/FINDINGS_ZH.txt)

8个固定条件的贯通模型将缓存/FIFO、规范LSP、主控时间桶、CBOR和Frank发送队列连接起来。消费暂停60次callback的场景中，次秒两侧ADC有效槽均恢复500，左侧100条IMU输出仍来自比包末ADC早30次callback的配对。另一个缺单次callback的场景中，100个左IMU输出槽只有99份不同源快照。来源标签由研究工具旁路保留，原协议没有这些标签；callback数量不直接换算实测时间。[贯通模型](../../evidence/analysis/system-deepening-20261108/integrated-capture-model/FINDINGS_ZH.txt) · [适配边界审计](../../evidence/analysis/system-deepening-20261108/integration-contract-review/FINDINGS_ZH.txt)

SEN-01仍需同源实机输入/输出。当前可复跑的是限定合成链；日志上界、条件重入和CRC通过后的异常payload已分析，剩当前发送来源和真实时序。普通377字节包不是1024边界的触发证据。[完整结果与工具](../capture-pipeline-20261108.md)

## 日志与共享封包器的后续结论

日志277个调用点、337个格式候选的普通非重入上界已收敛：常用两字节长度整帧≤1021，即使放宽四字节仍≤1023；动态字符串按任意内容放宽后也在界内。[日志上界](../../evidence/analysis/system-deepening-20261108/sensor-log-producers/FINDINGS_ZH.txt)

另一路是采样IRQ在ADC队列满时写日志并重入封包器。选槽未即时占用、共享偏移未保存恢复，使指定交错下的外层采样无法形成完整接收帧。旧模型比较提交即复制与延迟读取两个条件，均非实机USB/PMA时序，且队列满状态外供；没有得到帧也不等同CRC失败。[重入证据与模型](../../evidence/analysis/system-deepening-20261108/sensor-framer-reentrancy/FINDINGS_ZH.txt)

后续队列模型确认：普通0x3c先取走5条，满30条无中途回填时剩25条，第6次新回调才拒新；不能默认下一次就溢出。gain-sync日志则在flush/取数之前，dirty和ADC满可条件化共存；主循环延迟和IRQ落点仍未实测。8个场景、26组计数及256组回填组合只验证前置条件，不包含日志文本或传输。[前置条件核对](../../evidence/analysis/system-deepening-20261108/sensor-reentrancy-preconditions/FINDINGS_ZH.txt) · [完整边界及中止项](../capture-pipeline-20261108.md)

## 当前普通采样与兼容事件的区别

从原字节恢复此前未识别的0802572c，已接通G0 USB正常主循环的FDC处理及0x33/0x44生产者。此前“已枚举发送点未找到0x33”的阴性结论已被补证修正。0x34/0x35仍是独立opcode；当前实机启用哪条路线仍需版本与帧记录。[正常生产者、处理与主控出口](../../evidence/analysis/system-deepening-20261108/local-signal-closure/FINDINGS_ZH.txt)

## 电容与温度处理补证

详见[本地公式与状态](../algorithms/local-capacitance-temperature.md)：FDC量程补偿/缓存、0x35四字段、NTC筛选均值与加权组合都已从正常入口追到输出。它们不等于生理信号分离或在床分类。