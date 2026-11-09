# 热控反馈、限幅与保护

先分清两个问题：今晚该设多少度，以及怎样把水温调到这个目标。这一页主要解释后一个问题，也就是设备在本地如何执行。

这部分是设备侧真实执行的闭环：主控交付温度目标，Frozen MCU 读取水路温度，计算 PID，再通过 TEC、泵和风扇执行。它回答“目标如何被落实”，不包含“今晚该设多少度”的生产睡眠策略。

## 样本与接口

依据官方 MTK 包内 `firmware-frozen.bbin`，版本 1.7.7，143612 字节。Pod6、pillow、NTC/TMP118 等均有硬件条件分支；当前实机的热控板 revision 尚未与该样本绑定。MT8365 相同不能替代热控板匹配。

| 输入 | 本地处理 | 输出 |
| --- | --- | --- |
| Frank 的侧别、启停、温度目标 | `0x40`，目标为无符号数除以 100，单位摄氏度 | 左右 thermostat 状态 |
| 水温、环境、散热器、水块、PSU 温度 | 有效期和范围检查、PID 与后级限幅 | 归一化 TEC 请求 |
| 水位、盖子、泵诊断、已连接侧 | 注水状态机与锁定条件 | 泵模式、PWM 和注水结果 |
| 电流、转速及温度状态 | TEC 保护、风扇转速闭环 | 保护码、风扇和 TEC 输出 |

Frank 的 `Level` 是另一层控制刻度，不能直接当作摄氏度；普通 pod 的 Level 0 映射到内部 27°C 目标。水路目标、水温、水块温度与床表面温度也不是同一个量。[主控映射证据](../../evidence/analysis/signal-host/FROZEN_HOST_CONTROL.txt)

## 采样与反馈

NTC 路径由 TCA6408 选通六路，100 ms 切换一步；六路分别提供环境、左右散热器、左右水块及 PSU 测温。转换使用电压、热敏电阻参数与 `logf`，异常写入 −999 哨兵。数字 barb 与 TMP118 是不同测温路径。六路轮询时间不是全部水温的统一采样率。

已从构造和字段追到：PID 主反馈是左右 water，后级附加限幅使用 ambient。NTC 路径中 water 来自 barb 数字测点，不能把 waterblock 当成 PID 主反馈。成功时间距当前小于 5000 ms 才可作为有效测量；缓存里仍有数值不代表还有效。[反馈测点证据](../../evidence/analysis/thermal-deep/FEEDBACK_SENSOR_MAP_ZH.txt)

## PID 到功率执行

normal Pod6 分支的左右参数为 Kp=0.3、Ki=0.005、Kd=0.2，积分累计限于 ±200，周期 2000 ms。pillow 使用其他参数。代码的离散式为：

```text
e = target - water
S = clamp(S + e, Imin, Imax)  // 满足积分门控时
output = Kp*e + Ki*S + Kd*(e - previous_e)
```

这里没有显式 dt 因子，周期属于参数语义。请求目标截断在 [−10,42]°C，不能把它当传感器有效范围或用户可选范围。跨当前水温且变化超过 5°C 的目标变动会清积分和既有误差。

normal Pod6 冷却初始 ceiling 为 0.67；只有冷却层实际裁剪输出时才回退本步积分，后置环境限幅没有同样的回退。限幅且长时间没有足够改善才逐步放宽 ceiling。环境与目标差值也参与后级限幅。露点路径在已恢复函数中记录观察状态，最终 PID 目标仍来自原请求的范围截断，未见按露点自动抬高目标。

带符号请求的正值对应加热、负值对应制冷，幅值归一化至 0..1，再经方向切换等待、斜坡和保护状态机写 PWM。它不是实测瓦数。Pod6 的换向等待配置为 1000 ms；不同硬件分支的 TEC PWM 载频为 100 Hz 或 25 kHz，尚无实测波形。[PID、限幅和执行证据](../../evidence/analysis/thermal-deep/THERMAL_REPORT_ZH.txt)

## 限幅后保留哪些 PID 状态

`0801E408` 在 PID 计算前暂存积分累计，冷却层的实际裁剪标志非零时只恢复这一字段。它不重算本步输出，不恢复既有误差，也不改写已经缓存的 P/I/D。因此冷却回退后，缓存 I 不一定等于 Ki 乘以当前保留的积分累计；同误差的下一步 D 可变成0。

后置环境限幅只裁剪输出，不再回退积分。加热例中 S 从10增至15，PID输出约1.575被限制到+0.8，保存的 S 仍为15。这是代码与有限模型结论，不能据此认定实机出现过冲或评价调温效果。

[完整证据](../../evidence/analysis/algorithm-followup-20261108/thermal/FINDINGS_ZH.txt) · [有限模型结果](../../analysis-tools/algorithm-followup/thermal/MODEL_RESULTS.json) · [下一步：冷却上限自适应状态](../algorithm-next-20261108.md)

## 保护与注水

TEC 保护码已追到实际消费者：

| 码 | 标签 | 码 | 标签 |
| --- | --- | --- | --- |
| 0 | none | 6 | waterblock_over_temp |
| 1 | temp_invalid | 7 | waterblock_too_cold |
| 2 | temp_out_of_range | 8 | waterblock_noflow_cold |
| 3 | pump | 9 | waterblock_noflow_hot |
| 4 | priming | 10 | waterblock_no_flow |
| 5 | heatsink_over_temp | 11 | over_current_latched |

保护检查非零时，周期执行路径会清 PWM、关闭使能并进入保护态。需要保留一个重要例外：主水温失效时 PID 直接返回，可能保留既有 TEC 请求；若 waterblock 与其他保护条件均允许，独立保护层仍可能返回 0。不能简化为“5 秒没有水温就必关 TEC”，也没有测得其实际出现频率或热效应。[有效性与保护条件](../../evidence/analysis/thermal-deep/FEEDBACK_SENSOR_MAP_ZH.txt)

注水是独立状态机：FILL → RED → WAIT_CAP → FLUSH，读取每侧五点水位均值。缺水、盖子状态、超时、DRY/KINKED 泵诊断可改变路径；完成要求最后测量与连接侧条件通过。普通缺水允许门限为 **18.75**，由原字节解码确认；该常量不适用于所有注水阶段。[注水与阈值证据](../../evidence/analysis/thermal-deep/THERMAL_REPORT_ZH.txt)

## 已解释和仍缺的部分

已解释目标编码、软件测温、主反馈、PID、后级限幅、TEC 状态、泵/风扇和注水主要控制链。生产 Autopilot 怎样选择目标属于上游未知；实际床面热响应、TEC 瓦数、水路流量、测点物理位置和每个 revision 的电路仍需硬件证据。

C03已完成73项局部边界检查：水温age达到5000ms不再更新本步PID；换向先清PWM，500ms可开使能，1000ms回正常态，后续才递增输出。注水的当前值、五点均值、填充计数和低水位计数已分开建模。它不模拟完整热响应。[模型与原指令](../../evidence/analysis/finishable-20261107/thermal-model/FINDINGS_ZH.txt)

下一步C01绑定实机热MCU和板型，C02补充水路与测点位置。模型无法代替实际床面温度、流量和电路测量。

补充任务关联：生产温度目标生成器单列为 **AUTO-01**，见 [Autopilot 模块](autopilot.md)；本地 PID 参数不能填补这一缺口。