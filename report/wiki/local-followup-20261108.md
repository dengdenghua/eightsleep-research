# 参数生效、传感恢复与持久化

继续追此前留下的具体缺环：气囊系数从哪里选、传感失败后哪些值保留、床架读到的是 RAM 还是 Flash，以及 `blanketReadings.version` 的来源。仍只分析官方文件和有限模型，未运行原厂程序或验证实机状态。

## 气囊系数：默认、待保存、运行值是三份状态

A02 的默认系数由 SKU、side 和袋编号选择；有效持久校准走另一分支。当前运行对象、校准待保存区与 Flash 记录分别存在，不能仅凭命令名称判断改了哪一份。

| 入口 | 改动对象 | 何时影响控制 |
| --- | --- | --- |
| 启动且有有效持久校准 | 从持久记录恢复运行系数 | 启动恢复时；不再叠加 SKU 默认表 |
| 启动且无有效持久校准 | 选择 SKU / side / 袋的默认系数 | 初始化运行对象时 |
| `0x60/0 Get` | 读取校准待保存区 | 返回值不证明已生效，也不是当前运行参数快照 |
| `0x60/1 set_bag` | 校准待保存区 | 单独发送不证明已应用到运行对象 |
| `0x60 save` 成功 | 将待保存区复制到运行对象 | 保存成功后；影响 count 范围内的袋 |
| `0x53/9` | 直接改运行 `a/b/ci`，并设 `al=a、cl=ci` | 当前运行中；不写待保存区或 Flash |
| `clear` 成功 | 清持久校准并恢复通用默认 | 立即值可与下次启动的 SKU 默认值不同 |

如果只 stage 一袋再保存，其余袋仍从待保存区复制。无有效 Flash 校准时，该区采用通用默认，不能假设它已包含当前 SKU 表的运行系数。主控 `CalibrationSet Persist=false` 只发 set_bag，因此也不能简单写成“临时应用成功”。

校准记录里的 `c / Calibrated` 是记录标志；运行补偿的 enabled 是另一字段。已核启动和保存没有把 c 直接复制为 enabled。

**公式命名已更正。** 主控校准字段 `b` 对应运行对象 +0x00，是充气偏置；`ci` 对应 +0x08，是普通放气截距。当前机械页统一为充气 `SP+b_eff×scale`、放气 `(SP-ci)/a`；补偿启用时 `b_eff` 保留 float32 的 `(SP+b)-SP` 顺序，关闭时为 0。旧闭环报告曾使用相反的局部符号，不能将那组符号直接套到校准字段。

默认系数差异已经从原表核对。例如 SKU2、代码定义的左侧、袋0使用 `a≈3.08`，通用默认却是 `a≈1.65`。两者的 `b≈0.43、ci=0`；数字 SKU 不代表已识别床尺寸或营销型号。有效持久记录也不保证每袋五个字段完整：缺字段保留解析默认，count 小于活动袋数时，其余袋保留通用初始化值，不回退到 SKU 表。

保存失败和清除失败也有局部状态变化：save 在写 Flash 前已改 timestamp；clear 在擦除前已重置待保存区。失败不能统一理解为“什么都没改”。

mode 命令作用于另一组参数：demo/sleep 的泵上限分别为 100%/80%，调度 sleep duration 为 5/600 秒，充放气 grant 也不同；它不改上述五个补偿系数。主控保存目标 mode 在发送前，保存目标值不证明 MCU 已接受。

Landing 校准的临时覆盖和恢复也使用 `0x53/9`，因此只传 `a/b/ci`，并将低压组设为 `al=a、cl=ci`。若原低压组不同，不能把这个 restore 写成“原样恢复全部五系数”。

[SKU 表、覆盖顺序、命令与原字节证据](../evidence/analysis/system-deepening-20261108/local-parameter-resolution/FINDINGS_ZH.txt)

## 传感失败后：旧值不会统一立即作废

G0 USB 的总线失败、数据 CRC 失败和对象重初始化走不同路径。关键区别是：没有更新数据，不一定停止后续处理或清掉缓存。

| 场景 | 已核行为 | 对上传数据的影响 |
| --- | --- | --- |
| I²C 请求 pending 到 age≥11 | 请求状态变为失败，不调用传感回调，队列继续推进 | 不能与“回调运行但 CRC 不通过”混为一谈 |
| TMAG 某个 6 字节段 CRC 失败 | 失败段保留旧缓存；第一段回调仍安排第二段；第二段回调完成会置 ready | 后续可能组合旧段与新段；0x39 不附带逐段 CRC 标志 |
| FDC 测量 pending 超过 29 tick | 清测量/配置标志，并在相应条件下发送芯片 reset | 缓存未被该分支清掉；getter 在年龄≥5500 时因过期返回 −1 |
| FDC 对象重新初始化 | 清整个对象，再设置初值 | 与只发送芯片 reset 的缓存效果不同 |
| 采样 start `0x28` | 清 ADC/IMU 队列，但保留 current 值 | 新队列不代表第一次写入就是新测量 |
| 采样 stop `0x29` | 关闭 active 与采样定时器 | 已核分支没有同时清队列和 current |

TMAG 的净错误计数在失败时加 1，成功且计数非零时减 1。因此，同一周期“第一段失败、第二段成功”可让净计数回到 0，但缓存仍混合新旧两段。另有累计失败计数，不能用净计数代替总失败次数。全局恢复还检查净计数、样本年龄和 enabled 等条件，不是每次 CRC 错就立即全重置。

这里的样本年龄来自第二段回调完成时刻，不能直接当作“两段 CRC 都通过后的年龄”。恢复评估还受 alert 变化或 300000 tick 周期门控，随后有板型条件、电源/clockgen 等待与超时分支；故障计数过线不保证立即重置或恢复成功。

独立 TMP 温度缓存也有区别：读失败不更新温度，超过读取间隔只触发再次请求，没有 FDC 那种 5500 年龄作废 getter。enabled 为真但尚未读到有效温度时，0x39 还可能取初始化的 −100。传感字段必须逐项判断，不能套用统一的“过期变空值”规则。

stop 后已经凑齐 ADC/IMU 数量的一批仍可由主循环发送，因为发送门槛未再检查 active；start 则先清软件队列。以上限顺序完成的正常派发，不包含抢占交错或真实停发延迟。

这些行为解释了为什么数据持续到达、队列已重启或净错误数为零，都不能单独证明逐点新鲜度。实际发生比例仍需同源采样与输出记录。

[正常失败、缓存、恢复与 start/stop 完整证据](../evidence/analysis/system-deepening-20261108/local-sensor-recovery-followup/FINDINGS_ZH.txt) · [30 项有限事件模型](../analysis-tools/system-deepening/local-sensor-recovery-followup/MODEL_RESULTS.json)

## 床架保存：诊断读 Flash，位置快照写 RAM

Keeson V10211 新接通的正常诊断链返回 **196 字节：164 字节配置记录＋最近一条 32 字节位置记录**。它读取 Flash，不读取当前 RAM 快照。因此，位置已变化、RAM 已更新 CRC，不代表这条诊断会立即返回新位置。是否已经追加写入，仍必须另有证据。

| 记录 | 已核字段用途 | 仍未知 |
| --- | --- | --- |
| Keeson 32 字节 | 四个位置 word；两个不透明 word；扫描字段；CRC | 两个不透明 word 的设计语义，以及追加记录生产者 |
| TriMix 14 字节 | 四个位置 halfword；两个不透明 halfword；CRC | 两个额外值的设计语义 |

两类额外值都会由旧 Flash 记录带入，在正常四位置快照中保留，并参与 CRC。不能因 BSS 初值为 0 就认为以后始终为 0，也不能按内存排列把它们叫作第五、第六根轴。

另查到的 Keeson 直接 NVMC 写路径实际修改 `0x1000120c` 配置字的 bit0，不是位置页 `0x76000`。同族 V10208 的七个相关入口与六处写调用也作了定点比较：读取、快照 CRC、196 字节导出的规则一致，但 RAM 地址和标志地址不同；仍没补出位置 append。这个阴性结论不等于全程序没有保存逻辑。

两份官方 ZIP 均只含 application，没有完整底层系统服务、bootloader、实际配置页或位置页。缺失材料与当前应用里尚未穷尽的计算别名、间接调用是两类缺口，不能把未找到的 append 直接归到 bootloader。

[196 字节诊断、记录字段、邻版与写入边界](../evidence/analysis/system-deepening-20261108/local-persistence-followup/FINDINGS_ZH.txt) · [8 项正常记录模型](../analysis-tools/system-deepening/local-persistence-followup/MODEL_RESULTS.json)

## 主控聚合版本：0 → 130

`blanketReadings.version` 已经接到构造和写入者：

```text
全局构造 0017bdd0 → 001fe650
    聚合 version = 0
UsbSensor::stateBootloaderStartFirmware
    sinfo.rev >= 0x0a00
      → 001e2bb0(side, rev < 0x0a30)
      → 001f6920：清所选侧队列，version = 0x82
0x39 → 时间与 map 入队（不携带 wire version）
    → 聚合快照 → CBOR version = 130
```

这个字段是主控聚合消息的数值，不能用来识别睡眠算法版本，也不能反推当次传感器包的 version。`rev < 0x0a30` 的模式参数不改变上述赋值。清所选侧队列也不等于清掉另一侧队列或所有 map。

原指令通过 `ldrb` 和 `&0xff` 取值，CBOR 的数值 130 编为 `18 82`；不能把单独的 `82` 误读成负数或直接当作完整 CBOR 对象。构造初值为 0 不代表实机曾经发布过 0。

[构造、启动覆盖与编码证据](../evidence/analysis/system-deepening-20261108/local-aggregate-version-followup/FINDINGS_ZH.txt) · [逐指令验证](../analysis-tools/system-deepening/local-aggregate-version-followup/BYTE_VALIDATION.json) · [11 项有限状态对照](../analysis-tools/system-deepening/local-aggregate-version-followup/MODEL_RESULTS.json)

## 关闭与后续进展

下面记录该轮结束时的边界。后续已完成主控配置、A02剩余入口与采集底层的限定分析，Keeson仍有跨过程值流缺口，当前状态以[参数、执行与采集底层](local-final-pass-20261108.md)为准。

| 项目 | 已完成 | 下一步 |
| --- | --- | --- |
| A02 五系数与 mode | 默认表、待保存/运行/持久状态、正常覆盖顺序与消费者 | 后续已补其他 0x53 参数、0x50/0x51 与主控配置合并；实际当前值需出厂记录与同次启动配置 |
| G0 USB 失败恢复 | 正常 CRC/ready/超时、缓存年龄、start/stop、恢复评估与主状态图 | 后续已补所列 I²C/SPI/DMA/IRQ 正常完成、错误来源及14项板型配置累加；实际新鲜度和恢复效果需时序记录 |
| 床架持久化 | RAM/Flash 诊断分离、记录额外值保留、一个邻版定点对照 | 后续已完成有界计算地址与93处间接调用账本，追加仍缺跨过程对象值流；底层服务和实际 Flash 内容另需新材料 |
| 聚合 version | 构造为 0、启动分支写 130、快照与 CBOR 类型 | 当前静态缺口已关闭；待同次启动的 rev/side、LSP 与 CBOR 对照 |

剩余任务按具体入口和验收范围保留；不把原件入库、静态链闭合与实机验证混成“全部完成”。

这些更新补充[本地处理全景](local-processing-20261108.md)。核心生理算法、部署绑定和物理接线的缺口继续按[逆向执行计划](reverse-plan.md)保留。

## 证据与验证

四个新目录分别保留原指令或 IL、来源哈希、有限模型、覆盖范围和报告。统一验收核对 361 项清单文件与 6 份输入原件；模型分别为参数 34 项、恢复 30 项、持久化 8 项、聚合版本 11 项。不同场景只代表各自的限定合同，不合并成实机覆盖率。

恢复模型曾有可变列表影响已留存分析中记录的问题，交叉复核发现后已用独立副本保存结果，并确认落盘 30/30 项 observed 与 expected 一致。修复和审阅范围一并保留；没有改写原始指令或以模型结果代替测量。

[统一文件与模型结果验收](../analysis-tools/system-deepening/local-followup-audit/VERIFICATION.json) · [聚合版本独立字节复核](../analysis-tools/system-deepening/REVIEW_AGGREGATE_VERSION_FOLLOWUP.json) · [恢复模型独立审阅](../analysis-tools/system-deepening/local-sensor-recovery-followup/INDEPENDENT_REVIEW.json)
