# 传感数据完整性与床架位置反馈

从 USB 发送回收、nonUSB 命令分发、Keeson 采样与故障 A、TriMix 四轴停止继续追到分包读取和位置反馈。重点是数据和状态的实际生产链。没有实机数据，也未取得生产心肺分离、融合或分期模型。[整体机会与后续优先级](reverse-plan.md)区分可继续静态分析的入口和实机/材料缺口。

## 传感 MCU：释放缓冲不等于主控收到

USB 发送有三层不同状态：32 槽缓冲、待发 descriptor 与当前在途项、USB 类的传输状态。它们需要分别核对，不能用某一层的“完成”代替全链路成功。

已恢复两条回收路径：正常 USB 完成回调，以及主循环检查到 software busy 持续 **严格超过50 tick** 后的恢复。两者都能把当前槽标成可复用；超时分支未先取消底层 USB 传输，也未清类对象的 TxState。它与32槽全忙时的 **≥500 tick** 等待截止是不同门限。

| 情况 | 已确认的本地行为 | 不能据此认定 |
| --- | --- | --- |
| 正常最终完成回调 | 回收当前槽，再尝试下一项；整包倍数可能先补零长度包 | 主控应用已解析、云端已收到 |
| software busy超时 | 回收当前槽；下层TxState可能仍忙 | 旧传输已被取消 |
| gate不满足 | 拒绝新提交，主循环丢弃待发FIFO；current未一并清空 | 所有数据均已清除或将完整重放 |
| USB reset后恢复 | 存在保留current并再次尝试的路径 | 首次未到达主机，或已发生重复投递 |

gate已追到 USB设备状态和控制请求位；它不是云端online或App绑定状态。名义毫秒解释仍依赖已记录的SysTick条件，不是实际墙钟等待上限。

**存在一个需要实机验证的错回收窗口：** 在A超过50 tick仍未完成、gate有效且B已排队，期间没有reset等改变状态的条件下，A被超时回收，B成为current；B因旧TxState仍忙而没有提交到底层。随后A的完成回调不核对描述符身份，可能把当前B也回收。这里的A/B是合成时序标签，六个模型场景展示了代码分支；没有测得实际丢包率。后续分包分析进一步限定了哪些原 RAM 字节仍会被读取，见下一节。

类发送指针和底层端点指针还要分开：设置B会先改写类对象的指针，但不能据此推定底层端点已经改为B。

[回收、门控与恢复证据](../evidence/analysis/system-deepening-20261108/sensor-usb-lifecycle/FINDINGS_ZH.txt) · [六个合成时序](../analysis-tools/system-deepening/sensor-usb-lifecycle/SYNTHETIC_CASES.json) · [原字节核验](../analysis-tools/system-deepening/sensor-usb-lifecycle/BYTE_VALIDATION.json)

### 分包读取：尚未复制的尾部仍依赖原缓冲

已核的正常配置路径中，EP81 使用 **64 字节单缓冲**。提交时只复制第一包到 USB 的 PMA，后续每包由 IRQ 再读取原 RAM；并非提交时复制完整记录。此结论限定在已追的 reset speed1、配置成功及对应单缓冲 IRQ 分支（硬件状态 bit `0x100==0`）；完整门控见下方证据。64 是 USB 包上限，不是样本数或采样率。

所以提前回收旧槽后，要同时满足“该槽被再次选中、确实写入不同字节、旧传输仍有未复制尾部，且未被reset/abort终止而继续读取”，才会改变后续包的候选内容。池分配每次从首槽查找，不能假设一定隔32次才重用。

```text
L = 旧记录编码长度
C = 已复制到 PMA 的连续前缀长度
W = 同一 RAM 槽随后实际重写的字节集合
可能受影响的范围 = W ∩ [C, L)
条件：相关字节必须在该位置所属包的复制之前被改写
```

已复制到 PMA 的包不会因随后改写原 RAM 而回溯改变；“已复制”也不等于主控已接收。若整个正文不超过64字节，首次复制已覆盖正文，但迟到回调错回收后继槽仍是另一项问题。

IRQ8 屏蔽只覆盖 gate 失效后的 FIFO 清理，没有包住前面的超时判断与回收。还有一种合成交错：主循环已判定A超时，IRQ先完成A并启动B，主循环恢复后沿旧判断回收当前B。它与“迟到A回调回收B”是不同条件；八个分包/交错模型只验证局部分支，不是八次现场故障。

下一步应追**主控接收端如何处理 CRC、长度和转义错误，以及怎样重新同步**；还要逐调用者核实长消息分支是否可达。当前不能把这些候选字节变化直接写成云端收到坏波形。

[逐包读取与 IRQ 证据](../evidence/analysis/system-deepening-20261108/sensor-usb-packet-read/FINDINGS_ZH.txt) · [八个合成检查](../analysis-tools/system-deepening/sensor-usb-packet-read/SYNTHETIC_CASES.json) · [字节核验](../analysis-tools/system-deepening/sensor-usb-packet-read/BYTE_VALIDATION.json)

## nonUSB：从原始跳转表确认命令

本份 `5.5.34.0` 已从接收校验、命令/响应分流追到原始跳转表：`0x28` 进入采样启动，`0x2B` 进入两组增益设置。编号由同一 BBIN 的表字节计算，不再依靠与 USB 版形似。

| 命令 | 可确认的执行路径 | 回复的含义 |
| --- | --- | --- |
| `0x28` | 清采样队列、复位相位、设置 active、安装 callback | 状态0仅说明调用路径走完，不证明已产生新样本 |
| `0x2B`，payload长度正确 | 读取两组 BE16 值，调用 setter，随后回显 | **值1–99可收到状态0和原值回显，但 setter 跳过更新** |
| `0x2B`，某组值为0 | 代入该组当前 requested-gain 字段 | 读的是软件请求值，没有回读实际 ADC 寄存器 |
| `0x2B`，payload长度错误 | 返回状态6，不调用 setter | 分析范围仅记录状态数值，不补造错误枚举名称 |

这说明后续验证增益必须核对 requested → dirty处理 → 寄存器写入/读回，不能只看响应。MCU 支持此命令，也没有补齐主控首次 `0x2B` 的生产者。

nonUSB 自身的向量、reset初值和 SysTick 配置也已独立核对。默认步长1，在初始化、实际时钟和中断服务条件成立时可按名义毫秒理解；缓存门限8因此有条件性的名义8 ms解释，实际新鲜度和采样率仍需测量。

[命令与独立时基证据](../evidence/analysis/system-deepening-20261108/sensor-nonusb-dispatch/FINDINGS_ZH.txt) · [原始跳转表](../analysis-tools/system-deepening/sensor-nonusb-dispatch/DISPATCH_TABLES.json) · [字节与分支核验](../analysis-tools/system-deepening/sensor-nonusb-dispatch/BYTE_VALIDATION.json)

## Keeson：采样配置与故障 A

这是床架附件的检测程序。四通道配置已追到芯片内部 SAADC：**AIN0–3、10-bit、单端、无硬件过采样**。同步读取逐个选通道，不能当四路同时采样；AIN 编号也不能直接对应物理电机、电流单位或床垫压电通道。

RTC1 的配置间隔是 328 tick。在正常标称 LFCLK、初始化成功条件下，回调名义周期约 **10.0098 ms**。这是定时配置，实际采样频率仍受忙状态、读取失败、中断和调度影响。

全局故障 A 的自检分相关分析检查四轴，合计八个“轴 × 方向”条件。程序里的两个统计量要分开读：

| 统计/状态 | 代码实际含义 | 边界 |
| --- | --- | --- |
| HallNum | 八个位置变化条件通过了几个 | 不是八次 Hall 脉冲；位置可由 GPIO、定时替代和恢复/清零写入 |
| CurrentNum | 各方向阶段的残差累计是否过门限 | 主循环可反复累加同一个缓存值，不是每个新样本只加一次 |
| A=1/2/3 | 自检失败、等待及恢复阶段 | 外发时均可映射为同一个值，并复制给四轴 |
| A 清零 | 某条恢复分支完成 | 不要求重新通过全部八项自检，不能据此证明硬件故障消失 |

累计字段为16位，程序只在相加前检查旧值，没有对相加结果作饱和限幅。中途重启自检也没有同时清掉全部统计。因此累计量必须连同运行阶段和历史状态解释。

故障 B 的500计数可补充名义时间量级，但它仍只在满足门控的回调中递减，归零后还需下一次满足条件的调用。**不能写成“固定5秒自动恢复”。**

[配置、时基与故障 A 完整证据](../evidence/analysis/system-deepening-20261108/keeson-sampling-fault/FINDINGS_ZH.txt) · [结构化契约](../analysis-tools/system-deepening/keeson-sampling-fault/CONTRACTS.json) · [原字节核验](../analysis-tools/system-deepening/keeson-sampling-fault/VALIDATION.json)

### Keeson 位置：输入计数与定时替代共用一个字段

从启动压缩数据恢复了引脚表，并追到 **P0.21–P0.24 的下降沿事件**。正常分支按软件方向给计数加减；方向不是由两相输入解码。停止态收到事件时，仍可沿上次活动方向计数，不能仅凭这一规则判断实际发生了惯性运动或噪声。

位置字段 P 有几种来源：

| 模式或过程 | P 的来源 | 需要注意 |
| --- | --- | --- |
| 模式0 | GPIO事件驱动计数 E | 一次处理对应一次计数，不保证所有电气边沿均被处理 |
| 模式1 | 定时回调按软件方向更新计数 T | GPIO回调被屏蔽；位置变化不证明收到新的输入脉冲 |
| 模式2及其他非零值 | 这两条生产路径均不更新 | 不代表整机所有状态均冻结 |
| 持久恢复与清零 | 保存值复制，或条件性归零 | 局部恢复只写P，未同步写E/T；实际跳变仍需完整初始化/运行证据 |

自检 stage5 在 HallNum 满8时选模式0；否则 CurrentNum 满8时选模式1，其余选模式2。因此定时替代与自检结果有直接代码联系。**不能把位置变化或自检比较通过，统一解释成新鲜的硬件位置反馈。** 已补重复启动、正常完成和恢复字段；启动与完成具有不同清理条件，见[自检与持久化补证](../evidence/analysis/system-deepening-20261108/local-accessory-closure/FINDINGS_ZH.txt)。

内部 P 为32位；已追的两个位置报文只发送低16位。物理轴、每个边沿对应的位移和实际丢边沿率仍未知。下一步可查自检触发/重入，以及持久记录恢复与E/T的一致性；引脚与真实机构对应需要板级材料。

[位置源、启动解压与模式证据](../evidence/analysis/system-deepening-20261108/keeson-position-source/FINDINGS_ZH.txt) · [恢复出的启动数据](../analysis-tools/system-deepening/keeson-position-source/STARTUP_DATA.json) · [字节核验](../analysis-tools/system-deepening/keeson-position-source/VALIDATION.json)

## TriMix：四轴停止与完成来源

V25 的四条停止处理已逐条追到输出寄存器，分别核对了写入值、输出清零及控制位修改；轴名仍仅归因于主机方法，未确认实际接线。各轴寄存器并不相同，详见附带映射表。

内部完成字节 AA 有三类来源：

1. 明确停止请求被消费，停止函数返回后置 AA。
2. phase0 中没有该轴待处理动作，直接置 AA。
3. phase1 中请求值与内部位置状态的比较通过，置 AA。

因此，**AA 本身不能区分“停止请求已处理”和“软件位置条件满足”，更不能证明机械停稳。** 四个比较函数的默认容差是50个内部单位，特定配置值下为0；单位、状态新鲜度和物理标定仍需另外核对。

 `1000` 字段已找到初始化、停止重置、请求参数覆盖和阈值选择路径。它参与驱动/保护参数处理，当前证据不支持将它解释成一秒倒计时。该字段不作为一秒倒计时解释。

[四轴与比较条件证据](../evidence/analysis/system-deepening-20261108/trimix-completion/FINDINGS_ZH.txt) · [四轴地址映射](../analysis-tools/system-deepening/trimix-completion/AXIS_MAP.json) · [原字节核验](../analysis-tools/system-deepening/trimix-completion/BYTE_VALIDATION.json)

### TriMix 位置与保护：两条输入链的更新条件不同

phase1 比较的四个位置状态由已接受的 GPIO 电平变化计数，并按锁存方向 AA/55 做有界加减。中断与定时轮询两条路径共用“上次已接受电平”；轮询路径要求连续10次检查。位置还可被启动 flash 恢复和端点校正覆盖，因此不能当作绝对角度传感器读数。

保护输入已追到 **5×16-bit 的 ADC/DMA 缓冲**。在所核正常配置路径中，DMA 完成事件进入比较，尾部置完成标记，定时路由再启动下一轮。这一保护计数的5次命中跟随完成事件，不是主循环无限重复同一缓存；但没有逐项时间戳，也不证明传感器没卡值或各通道同时采样。

端点校正使用的是另一层缓存：积累40次采集后，主循环处理并更新结果。校正定时器可能反复检查同一结果，所以“连续200次满足条件”不能当200份新样本，也不能直接换成时间或证明机械端点到达。

已补40点加保留槽处理、历史平滑、启动清零、快照与CRC；任意IRQ交错和Flash物理写入效果没有由静态公式证明。物理保护阈值、计数与位移的比例和实际到位效果仍需板级资料与测量。

[位置与保护输入证据](../evidence/analysis/system-deepening-20261108/trimix-position-protection/FINDINGS_ZH.txt) · [位置映射](../analysis-tools/system-deepening/trimix-position-protection/POSITION_MAP.json) · [字节核验](../analysis-tools/system-deepening/trimix-position-protection/BYTE_VALIDATION.json)

## 下一步具体追什么

| 优先级 | 下一步 | 当前可做与验收边界 |
| --- | --- | --- |
| P1 | USB 接收端错误处理与长消息边界 | 分包/PMA/IRQ边界已补；继续追主控CRC/长度/转义错误与重同步，逐调用者核实长消息分支可达性 |
| P1 | 真实采集与版本绑定 | 设备在线后用既有入口短采，记录事件、数组、时间及同次版本；没有样本前不承诺持续原始波形 |
| P1 | 增益应用闭环 | 主控首次请求仍需新的调用路径或部署材料；拿到入口后核对requested、dirty、寄存器读回及采样元数据 |
| P2 | Keeson记录生产者残余 | 正常自检与恢复字段已补；32字节追加记录的完整生产链仍未绑定，普通配置写入不能代替该记录 |
| P2 | TriMix实际计数与保存效果 | 处理公式、保存快照/CRC、启动初始化已补；实际IRQ调度、物理位移与Flash效果仍需额外记录 |
| P0条件项 | 生产算法输入输出 | 取得官方导出或对应部署组件后，关联波形、逐搏结果、阶段和版本；拟合模型另列，不能冒充原厂实现 |

实机版本绑定、真实 live 数据、主控首次增益请求生产者和生产算法材料，仍保留在原 [45 项待办](roadmap.md) 中。上面的局部分析不替代这些验收。

## 证据与复跑

内容与同放在 [系统增量证据包](../analysis-tools/system-deepening/source-evidence.zip) 中，逐文件关系见[增量清单](../analysis-tools/system-deepening/PACKAGE_MANIFEST.json)。各目录保留原指令、输入 SHA-256、导出命令、核验脚本和覆盖范围；原固件依旧从[完整证据链](full-evidence.md)取用。

[系统分析](system-deepening-20261108.md)保留 NATS、Frank、诊断与音箱的结果。11月7日完整固件归档保持冻结，补充单独交付。
