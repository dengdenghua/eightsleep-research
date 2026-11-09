# 附件控制与持久化

这一页讲配套附件。气囊的压力、电流、温度和故障编号能说明机械控制在做什么，但不直接告诉我们心率或睡眠阶段怎样计算。

附件体系与床套的压电/IMU 生理数据链并列存在。已深入恢复的是 Balloon/Firmness 的压力、充放气、校准和诊断；姿态标签的消费与音频播放也有明确调用链。尚未证明用户当前设备安装了全部附件，不能将下述气囊故障或校准等同睡眠算法。

## 子模块与数据关系

| 子模块 | 输入与本地处理 | 输出与覆盖 |
| --- | --- | --- |
| Balloon/Firmness | 目标硬度、压力/温度、电流、阀状态 | 气囊设定、遥测、校准系数；已深查主机和 A02 MCU 局部 |
| DynamicMode | 外部写入的姿态标签、侧别、心跳及 presets | 对应气囊硬度请求；标签生产者未恢复 |
| Posture 固件/服务类 | 包内存在配置、固件与遥测类 | 默认服务未注册相关生产链，不能视为正常运行分类器 |
| 音箱和音轨 | 曲目地址/哈希、本地媒体、播放命令 | 下载缓存、FFmpeg 转换、WAV 播放；不是模型下载 |
| 可调床架 | 硬件版本映射、配置与控制集成 | 主选TriMix/Keeson已深入MCU；其余执行面与历史版本尚未全部恢复 |

这是一张软件覆盖表，不能据文件数量推导实际附件清单。[附件、下载与默认注册证据](../../evidence/analysis/sleep-pipeline/DOWNLOAD_AND_RUNTIME_ARTIFACTS_ZH.txt)

## 遥测与诊断

Capybara 正常完整功能注册中有 `debugfirmness/get`，通过 DeviceAPI function 分派；它不等于一个可直接拼接的手机 HTTP GET 地址。主机按不同命令更新各自缓存，调试读取不是多传感器同步采样。

| 命令 | 主要内容 | 解释边界 |
| --- | --- | --- |
| 0x59 | 频率、传感器数、时间戳；每通道压力与温度数组 | ambient 由数据条件选择；调试表压是末值差，不等于连续对齐波形 |
| 0x5A | 控制时间戳、调度状态、袋选择；每袋目标/当前压力、FSM、Safety/Fault | 每袋 11 字节；袋选择是位图，两个原因字段是枚举 |
| 0x5B | V12、V5、电磁阀、泵电流 | 主机字段名为 mA，不能替代硬件 ADC 标定 |
| 0x5D | 阀、泵、环境温度及湿度；新版另有泵 RPM | v1 的 RPM=0 由主机补值，不能当泵实际停止 |
| 0x5E | 增强 landing 校准数据 | 校准筛选与恢复逻辑不等于日常全部故障处理 |

调试接口要求压力/控制等状态就绪，部分电流/健康可空；解析失败没有自动把其他旧缓存变成同步新状态。这里未读取真实遥测，也未建立普通手机账号可调用该诊断入口的完整链。[协议与主机消费者](../../evidence/analysis/device-side-followup/diagnostics/FINDINGS_ZH.txt)

## A02 故障原因已从 MCU 字节闭合

进一步分析的 A02 映像为 0.2.71.0，143360 字节，BBIN 头和正文 CRC 已核验。它只对应配置中的 A02 映像，不能外推 A00 或用户当前附件。新结果更新了早期主机报告“原因值未知”的限制：

| 值 | SafetyReason | FaultReason |
| --- | --- | --- |
| 0 | NONE | NONE |
| 1 | OVERPRESSURE | REPEATED_TIMEOUT |
| 2 | SENSOR_FAILURE | SENSOR_UNRELIABLE |
| 3 | OVERCURRENT | CONTROL_DIVERGENCE |
| 4 | OVERTEMPERATURE | PRESSURE_TRACKING |
| 5 | — | INFLATE_TIMEOUT |
| 6 | — | DEFLATE_TIMEOUT |

这两个表是从 0 开始的枚举，**不是 bit flags**。同一袋对象的 +0xA1/+0xA2 被 MCU 写入 0x5A 每袋记录的 +9/+10，再由主机 Parser 原样传至调试 DTO。Fault 1–4 的实际赋值和可达性尚未闭合，表项名称不等于已恢复检测算法。FSM 值 4 在 MCU 叫 VENTING，主机叫 HoldOpen，应保留这个命名差异。

已闭合的一条路径是：调度授权超时且指定袋计数门控允许 → 按充气/放气状态加失败计数 → 相应计数至少 3、且没有先被 Safety 截获 → 进入 Fault → 写 5/6 → 请求该袋两阀关闭。若充放气计数均达限，该路径优先原因 5。关闭可以经过配置的过渡阶段，不能说立即 PWM=0，更不能说物理阀必闭合或所有泵都停。进一步补充了恢复与锁存条件，见下节。[A02 MCU 新证据](../../evidence/analysis/device-side-followup/recovery-round/balloon-faults/FINDINGS_ZH.txt)

## 校准和姿态联动

landing 校准发现所选袋 FSM 5/6 时可进入 Failed/Restore，产生 AllOff 和补偿系数恢复动作。压力消费要求相关值有限且达到指定绝对压力门限，再计算袋压减环境压；这是机械校准数据筛选，不是心搏伪迹清洗。Node 校准器读取本地 CSV，计算机械系数，其默认脚本来自包内，没有已恢复的下载新睡眠模型链。[校准动作](../../evidence/analysis/device-side-followup/diagnostics/FINDINGS_ZH.txt) [脚本消费者](../../evidence/analysis/sleep-pipeline/DOWNLOAD_AND_RUNTIME_ARTIFACTS_ZH.txt)

DynamicMode 在启用且有对应配置时读取 `research-data/{deviceId}/config.json` 中的 `pod_side/current_posture/last_heartbeat`，把 supine、prone、lateral 标签映射到 back、stomach、side presets，再请求改变气囊硬度。文件是已分类结果，不是原始波形或权重。

文件 mtime 不变时直接跳过处理，因此不能由“五分钟陈旧门限”推导停止更新五分钟后必恢复默认。仍未找到该标签文件的生产者。旁边的 PostureService 类在默认注册中未启动，不能填补这个缺口。[姿态消费链和时间边界](../../evidence/analysis/sleep-pipeline/DOWNLOAD_AND_RUNTIME_ARTIFACTS_ZH.txt)

## 音频与下一步

音轨链已恢复为曲目清单 → URL 内容 → 缓存与可选哈希核对 → 媒体识别/FFmpeg 转 WAV → 播放。重新连接后可恢复五分钟内的已知播放请求，这不等于完整整夜闹钟日程。音箱 B12/B13、床架等包内固件仍有未审阅执行面。[音频证据](../../evidence/analysis/sleep-pipeline/LOCAL_BACKUP_ZH.txt)

C08已补到限定覆盖边界，Fault1–4生产者仍明确未知；C09/C10需要实际附件诊断及姿态标签生产材料。C11的样本与协议进度见下节，未将主机命令回执当作机械执行成功。

**C10 补充验收**：对姿态标签新鲜、停更、mtime 不变和文件缺失情形，核对其他控制源是否覆盖、控制权如何变化；只有消费者代码仍不足以证明全局持续输出。

## 实现分析：保护、床架与升级

A02过流/过温存在实际Safety3/4写入：总锁存和每袋原因是两层状态，后续其他原因可能覆盖每袋字段。压力读取失败第5次设标志，重新初始化成功清部分健康字段；调压清计数不等于退出Fault。[写入、门控与清除证据](../../evidence/analysis/finishable-20261107/accessories/a02-faults/FINDINGS_ZH.txt)

24个TriMix、Keeson、B12/B13样本已有hash、配置选择与未分析区域登记。TriMix V25已追通接收校验、命令分派、动作门控和OTA暂存：每页按168字节记录保存，按顺序接收，CRC通过后回复成功并请求复位。7个TriMix实包的128字节头和CRC均匹配，但bootloader不在应用payload中，提交/回滚还不能完整说明。[样本与主机协议](../../evidence/analysis/finishable-20261107/accessories-c11/FINDINGS_ZH.txt) · [TriMix MCU证据](../../evidence/analysis/finishable-20261107/trimix/FINDINGS_ZH.txt)

其余历史床架版本未逐函数差分；音箱包的执行格式也未完全恢复。具体覆盖与后续入口按[结果](../finishable-20261107.md)记录。

Keeson10211也已恢复普通接收、2～7命令、目标到运行状态与GPIO/PWM、故障生产/清除及应用DFU交接。故障查询使用全局码重复填四轴，主机Overload/Working映射会丢失部分原因；主机单轴Stop的选择字节还与该MCU读取位置不同。两项均为版本限定静态结果，未做动作验证。[Keeson MCU分析](../../evidence/analysis/finishable-20261107/accessories/keeson-mcu/FINDINGS_ZH.txt)

## A00版本差分

现有A00样本与A02不同：bag stride为0x64，单超时计数达到3写Fault1；有效压力目标每次清计数，但不清FaultLatch。未找到按60000计时自动清锁存的消费者，因此不能解释为等待60秒自动恢复。其Safety3虽然名为MANUAL_STOP，已证写入者却是过流紧急停止；未在已查紧急停止路径找到A02的过温Safety4分支。

A00 Fault2–4和A02 Fault1–4仍分别列为生产者未知。更深的全部控制参数不在此次有限差分覆盖内。[A00差分来源](../../evidence/analysis/finishable-20261107/accessories/a00-faults/FINDINGS_ZH.txt)

## 2026-11-08 分析

气囊诊断的缓存读取、配置 getter、Ready 门控及空 USB 拓扑的多种原因已分析。详情见[系统分析](../system-deepening-20261108.md)；普通账号权限和当前附件版本仍未实测。

## 音箱格式与历史来源修正

旧 C11 清单的提取路径来自历史 NXP；24个样本已逐个与 MTK 同路径文件验证字节相同，床架与 B12 默认映射也相同。仅 B13 默认由历史 V38 对应到 MTK V42，实际实机版本仍需读取。三版 FOT 的外层结构、整文件 CRC 与主控传输偏移见[系统分析](../system-deepening-20261108.md)及[来源修正](../../evidence/analysis/system-deepening-20261108/accessory-execution/MAPPING_DIFF_ZH.txt)。设备端 loader 和 DSP 执行仍未恢复。

Keeson 10211 已补全局故障 B 的四路输入、两级滤波、基线扣除、signed16截取、门控累计和条件清除。它是附件故障链，不能拿来解释睡眠信号；实际电流单位、四轴硬件映射和物理停机仍未知。[详细公式与执行链](../../evidence/analysis/system-deepening-20261108/keeson-execution/FINDINGS_ZH.txt)

TriMix V25 的 `0x23 / selector=1` 停止请求已从主机方法、接收门控、主循环和标志消费追至输出寄存器。AA只是内部完成状态，不能称机械已停稳；其余三支现已逐轴分析到输出，见[四轴分析](../sensor-and-control-20261108.md)。[停止链证据](../../evidence/analysis/system-deepening-20261108/trimix-execution/FINDINGS_ZH.txt)

Keeson四路SAADC配置、RTC1名义回调时基和全局Fault A自检/恢复已分析。自检残差在主循环累加缓存，不等于每个新样本积分。见[采样与故障A证据](../../evidence/analysis/system-deepening-20261108/keeson-sampling-fault/FINDINGS_ZH.txt)。

位置反馈的生产者也已分析。Keeson正常使用P0.21–24下降沿，按软件方向计数；模式1屏蔽GPIO并用定时计数替代，恢复/清零又能写同一位置字段。TriMix使用接受电平变化后的软件计数，并有启动恢复和端点覆盖。两者都不能把位置字段直接解释成绝对位移或新鲜的机械到位测量。[Keeson位置来源](../../evidence/analysis/system-deepening-20261108/keeson-position-source/FINDINGS_ZH.txt) · [TriMix位置与保护](../../evidence/analysis/system-deepening-20261108/trimix-position-protection/FINDINGS_ZH.txt)

TriMix直接保护比较跟随DMA完成事件；端点校正另用40次采集后由主循环更新的结果缓存，可能重复检查同一值。已恢复40点与保留槽、中段均值、历史平滑、快照及CRC；物理单位、Flash写入效果与当前附件版本仍需实测。具体结果和下一步见[传感数据完整性与床架位置反馈](../sensor-and-control-20261108.md)。

## 本地处理补充

[附件遥测](../algorithms/local-accessory-telemetry.md)补齐 Capybara 的字段转换、秒分组与独立发布队列。气囊[校准与床架运动控制](../algorithms/local-calibration-and-motion.md)、[音频播放](../algorithms/local-audio.md)也已展开。各链按处理对象区分，不能套用同一种队列或算法规则。

## 气囊正常压力控制已恢复

A02 的20点压力标准差、体动门控、目标补偿、稳态和阀泵调度已接到PWM。预测压力虽被计算，正常停阀仍比较实测压力。[完整算法](../algorithms/local-calibration-and-motion.md) · [原指令证据](../../evidence/analysis/system-deepening-20261108/local-balloon-control/FINDINGS_ZH.txt)

## 参数生效与持久化分析

A02 的五系数默认选择、校准暂存、保存后应用与直接运行覆盖已经区分。Keeson 新接通196字节Flash诊断，不能当当前RAM位置；32字节append生产者仍未知。TriMix和Keeson额外记录字段只确认保留、CRC与透传，没有推测物理含义。见[参数与保存分析](../local-followup-20261108.md)。