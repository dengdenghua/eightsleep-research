# 传感固件分版覆盖

随包有多份 Sensor 固件，不能用一份 G0 的行为代表全部，也不能按文件名认定用户当前设备正在运行哪一份。

| 原件 | 字节数 | 已恢复的正常处理 |
| --- | --- | --- |
| firmware-sensor-g0-usb.bbin | 140,828 | 压电/IMU、电容、温度、辅助磁传感及主控消费者 |
| firmware-sensor-g0.bbin | 132,896 | 独立分派与采样；补齐 FDC、NTC、窗口/融合、33/44/3d |
| firmware-sensor-legacy.bbin | 39,704 | v2.2.12 两种 ADC 路线、温度、电容、控制和普通命令 |
| firmware-sensor.bbin | 42,292 | v3.3.1 两种 ADC 路线、温度、电容、控制和普通命令 |
| firmware-pillow.bbin | 90,220 | 六路 IMU、电容、方向均值、温湿度、自检与振动 |
| firmware-frozen.bbin | 143,612 | 沿用既有水温反馈、PID、限幅、保护与执行控制分析 |

完整 SHA256 和逐版本报告见[六份原件覆盖表](../../analysis-tools/system-deepening/local-processing-audit/INPUT_VERSION_COVERAGE.json)。表内是功能覆盖，不是每条机器指令均已解释。

## nonUSB G0：单独核对，不能平移 USB 地址

本件 FDC 回调、处理和生产者分别为 `0801418c → 0801a338 → 0801b834`，主循环真实分支已绑定。40 组函数/算术 helper 按各自原件核对，再比较归一化后的指令和非指针常量；地址不是固定偏移。

正常路径同样包含 signed24 换算、CAPDAC 补偿/自动量程、grace 期间缓存保留、5500 tick 年龄判断与状态计时，输出 27 字节0x33或90字节0x44。状态检查每30000 tick；只有该分支未到期时，才检查500 tick发送条件，不能将它改写成每包都重新测量和诊断。

温度由参考 ADC 和出厂校准参与 NTC 换算，再进入容量10的窗口：只对2..60°C项求均值，无有效项为−100，读取会轮转而不消耗窗口。三温全有效时使用已核的两级加权 `u=W(c,a,r); W(u,b,max(b,u))`。查询与51字节0x3d生产均已追到本版组帧入口；0x3d没有MCU tick。

[nonUSB 原件、40 组对应、公式与11项模型](../../evidence/analysis/system-deepening-20261108/local-nonusb-fdc-temperature/FINDINGS_ZH.txt)

## 旧 legacy v2.2.12：独立字节绑定

本件 `firmware-sensor-legacy.bbin` 为 39,704 字节，SHA256 为 `c92b8b8dce2290955c21d6030efe0323d21fad1cc6ba51d54f31756840e2a597`。完整文件映射到 `0x08005000`，向量表、Reset、data 复制和字符串地址已相互核对。

| 条件/入口 | 本地处理 | 正常出口 |
| --- | --- | --- |
| hw<0x700 | 两路内部 ADC 经过参考电压校正、浮点转换、上限处理和截断量化；256 条环，每条 12 字节 | 0x32；至少 31 条启动批次，最多 60 条，增益变化提前结束 |
| hw≥0x700 | MCP 四通道 25 位符号扩展、按标签组帧并调整组时间；128 条环，每条 24 字节 | 0x34；至少 21 条启动，最多 30 条；初值 flags=0x81，实际发索引 0/1 |
| 0x33 | 六路轮询缓存，500 tick 快照；状态每 10000 tick 重算 | 27 字节 body：tick、两组状态和六个带标签整数值 |
| 温度控制 | 分板型 NTC 参数、加权温度、目标 ±0.5°C 滞回、最高温/片温约束 | 功率为零会修改请求状态；双侧同时请求时每 15000 tick 轮换，最终写 GPIO |

记录有四路不等于四路全上传。0x34 的通道选择字段为 1 时发送索引 2/3，其他值发送 0/1；本件初始化是 2，不能沿用下述 v3.3.1 的 flags=0x41。

ADC 校正也不是整数无损直传：合法有限算例 raw=123、工厂/当前参考均为1500时，浮点转换与截断后为122。温控状态提议、功率门控和最终 GPIO 分开恢复；这仍不能证明实际温升或物理左右接线。

[v2.2.12 完整公式、报文、GPIO 与覆盖](../../evidence/analysis/system-deepening-20261108/local-legacy-sensor-closure/FINDINGS_ZH.txt) · [独立工程及来源目录](../../analysis-tools/system-deepening/local-legacy-sensor-closure/SOURCE_MANIFEST.json)

## 旧 sensor v3.3.1：两条不同采样链

本件 `firmware-sensor.bbin` 为 42,292 字节，SHA256 为 `a377d1be27d868c65fa4c90a34f70e9d3d45580236f67905ec56fe84cc595ba2`。装载基址、启动复制区和向量表已相互核对，关键结论使用修复函数边界后的导出。

| 条件 | 采样与本地处理 | 正常输出 |
| --- | --- | --- |
| hwrev <0x700 | MCU ADC 缓冲取两路，参考值校正、浮点换算、上限处理、16 位量化 | 0x32；队列至少 31 条后组包，每包最多 60 条，同一包要求 setting 相同 |
| hwrev ≥0x700 | MCP3564 中断按标签拼四路；缺路达到 3 ms 仍可入队，未清数值槽，因此可能带旧值 | 0x34（flags=0x41）；实际只序列化数组索引 2、3，至少 8 条后组包、最多 15 条 |

包内只保留首条时间与当前 rate，不能由包头推导每条都是新测量或实际等间隔。底层环满时拒收新记录。上述门限是这份旧固件自己的代码，未套用新 G0 的采样结果。

## 旧版 FDC 与温度

旧 FDC 六路轮询分“发起转换”和“检查/读取”步骤；未就绪保留旧槽，读取失败或负值转 −1。每 500 ms 发出的 `0x33` 是六路缓存快照，状态另每 30 秒检查，不能把一个包理解为六路同步新测量。

它的 CAPDAC 初始化与寄存器写入已有代码，但本版未发现新 G0 那样的自动量程调整链，不能跨版本混写。温度也按硬件 revision 选不同热敏电阻公式和参数，另有环境温湿度换算、缓存保留、加权组合以及 ±0.5°C 等条件的状态判断。

本件已覆盖正常采样、数值处理、缓存与发包。后续又独立补齐两版正常温控 GPIO、振动 PWM 和有效 pattern 时序，见下节；底层全部超时、电气保护组合与间接入口仍未穷尽。

[旧 sensor 的完整入口、公式、表和覆盖](../../evidence/analysis/system-deepening-20261108/legacy-sensor-closure/FINDINGS_ZH.txt) · [原始字节回读校验](../../analysis-tools/system-deepening/legacy-sensor-closure/BYTE_VERIFICATION.json)

新 G0 的 FDC、温度和旧式字段出口见[信号处理](local-capacitance-temperature.md)。物理通道、启用版本和真实发生率仍需实机或板级证据。

## 两版旧 MCU：温控与振动的最终输出

温控最终是互斥 GPIO 选侧：一个侧请求就选择它，两侧都请求时通过 15000 ms 周期回调轮换。非零 powerLimit 并没有在这条输出链直接变成相应 PWM；powerLimit 为零会把请求状态改为关闭状态。四组板型的 port/pin 已按原表解码。

首次持续时间不是统一 15 秒：v2.2.12 初始计时为 `now−period`，v3.3.1 另有全局计数乘 113 ms 的相位项。错过周期时只处理一次到期，不按漏掉的次数补做切换。

振动则走另一套 PWM：旧曲线非零功率为 `duty=0.4×power/100+0.1`；v3.3.1 的 hwrev≥0x720 使用 `0.45×power/100+0.12`。所以 power=100 分别对应 50%/57% 的代码占空比，不能直接读成引脚 100%。v3.3.1 的较旧板型还会跳过 slot2/3。

| 固件 | 正常振动模式与时间处理 |
| --- | --- |
| v2.2.12 | 两种完整 8 槽模式；每槽 10 次功率更新加 1 次边界调用，另有整体渐强。渐强值先取低 8 位再限幅，长时间输入不保证单调 |
| v3.3.1 | pattern→sequence→step 表；两种完整模式，各步骤有时长，sequence 有最低持续门槛。开始时先覆盖到 step1，换侧重置另一侧 step 计时；三个逻辑通道的渐强时长不同 |

v3.3.1 命令仅把 pattern>2 改为0，但索引2不是已核有效表指针；**只确认0/1两种完整正常模式**。没有发送或执行该异常索引。

[GPIO/PWM 映射、模式表和 33 项模型](../../evidence/analysis/system-deepening-20261108/local-legacy-control/FINDINGS_ZH.txt)

## 硬件信息与普通命令

两版各18个普通入口已追到配置作用与回复。启动读取512字节CBOR配置窗口，但0x02只返回前128字节；真实配置区位于这两份BBIN之外，因此固件中没有这台设备的真实hwrev、序列号或SKU可供读取。

rate、gain、温控、采样开关、温度查询与报警命令都有板型条件：例如 hwrev≥0x700 的rate设置可回复成功而不改字段；MCP增益分支使用共享增益，不能当作两路独立设置。查询成功、状态改变、GPIO输出与实物效果分开记录。

[18 个入口、硬件字段、回复与版本差异](../../evidence/analysis/system-deepening-20261108/local-legacy-commands/FINDINGS_ZH.txt)

## 枕头是独立固件

90,220 字节 Pillow 的六路 IMU、四槽电容、LIS 均值、温湿度、自检与振动均已独立追到输出，不能与传感垫混用。[枕头处理与主控消费者](local-pillow-processing.md)
