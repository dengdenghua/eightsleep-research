# 主控配置、执行参数与采集底层

把上次留下的四个具体范围继续向下追：主控参数来源、A02 剩余控制命令、G0 USB 的采集完成链，以及 Keeson 位置记录保存。**前三项的限定入口已接到消费者；Keeson 补出了启动数据和 Flash 完成回调，但 32 字节位置记录的追加生产者仍未绑定。**

所有结论来自已下载官方 MTK 材料的静态代码和有限模型。没有运行原厂程序、访问设备或账号；也没有把附件机械算法当作生产心肺、在床或分期算法。

## 1. 参数从哪里来，最终谁决定

气囊链上存在三组不同的状态，不能合成一条简单的“后者覆盖前者”：

```text
default.json → machine.json 同名完整 key 覆盖
    → BalloonOptions 默认 / Bind / 板型 PostConfigure
    → 连接选择、校准选项等启动参数

/persistent/R12.json → 主控内存配置
    → 目标 / mode / 动态开关 / preset / 容差 / 遥测 profile
    → 请求队列 → LSP 命令

MCU 默认 / SKU 表 / Flash 校准
    → MCU 运行参数 ← LSP 设置
    → 调度与闭环 → 定时回调 → PWM
```

这份 `Program.LoadConfiguration` 只添加 `default.json` 和 `machine.json`。后续虽然使用 `Host.CreateDefaultBuilder(args)`，自定义入口仍清空配置源，再接入前述配置。因此，不能把通用 .NET 的“环境变量和命令行最后覆盖”直接套用到这个业务配置。

`machine.json` 按完整 key 覆盖；未覆盖的根 key 仍保留。板型选择则取不大于硬件 revision 的最大匹配节，不逐节继承。现有 A00 / I00 / I21 中，I20 选择 I00，不能自动补入 A00 的 USB roots。板型内存在 `usbPortConfig` 时，会新建对象替换根配置；`usbRoots` 则仅在非空时替换。两种字段的合并规则不同。

启动 options 以单例使用，本路径没有热加载。`R12.json` 则保存运行目标等状态，不包含 MCU 的五个校准系数，也不替代启动配置。

### 保存值与生效值可能分离

| 操作 | 已核顺序 | 失败后可能留下什么 |
| --- | --- | --- |
| 更新 R12 | 先换内存配置，再序列化、写临时文件、Flush、rename | 内存是新值，磁盘仍是旧值 |
| 硬度目标 / mode | 先保存主控状态，再发送 MCU | 已保存但未发送成功；也可能保存失败后仍发送成功 |
| 容差 | 先发 range，再按 bin 顺序发送，全部完成后保存 | 前几条已改变控制板，后面失败，主控保存值仍旧 |
| 遥测 profile | 先发送，再保存 | 发送结果与保存结果须分开记录 |

保存锁覆盖文件写入，没有包住所有调用者的“读旧 record → 改字段 → 更新”。有限交错模型可出现后一个旧快照覆盖前一次字段更新；这不是已测到的实机竞态频率。临时文件和 `Flush(true)` 也不足以单独证明所有掉电场景的持久性。

`firmness/get` 中的 mode 来自主控配置，并非 MCU 回读。因此界面回显、磁盘记录、ACK 和机械响应需要分别核对。

### 同批目标只取最后一条，校准优先

Ready 状态名义上每 50 ms 处理队列，取出当时可用请求，分别保留最后一条硬度、mode 和校准请求。有校准请求时转入校准，本批已经取出的普通硬度和 mode 不再执行；没有校准时固定先硬度、后 mode。

接口返回 `success=true` 发生在入队后，不等待这次处理或 MCU ACK。手动与 DynamicMode 使用同一种目标请求，未设置“手动永远优先”；同批同类型末条胜出，手动调节也不会自动关闭动态模式。

动态读取还有两个边界：文件 mtime 不变，会在心跳检查前返回；新的姿态先记入 `LastPosture`，随后若设备未 Ready 而跳过应用，相同姿态不保证自动重试。相反，手动目标应用后，后续仍是同一有效姿态也不一定立即改回 preset。这里恢复的是姿态标签的消费者，标签生产程序仍缺。

硬度 0–10 档使用固定压力表，而非线性换算：

| 档位 | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 目标 kPa | 0 | 0.05 | 0.4 | 0.9 | 1.45 | 2.05 | 2.65 | 3.6 | 4.8 | 6.8 | 8.5 |

主控按实际袋数转换为 float32，装入 `0x52`。这张表描述代码目标，不是实测袋压或人体受力。

[配置、R12、队列与动态模式完整证据](../evidence/analysis/system-deepening-20261108/local-config-final-pass/FINDINGS_ZH.txt) · [34 项有限模型](../analysis-tools/system-deepening/local-config-final-pass/MODEL_RESULTS.json) · [IL 与原 bundle 验证](../analysis-tools/system-deepening/local-config-final-pass/VERIFICATION.json)

## 2. A02 剩余控制命令实际做什么

`0x53` 的 19 个编号中有 13 个有效分支，其中 3 个只读；sub2 未实现，sub7 废弃，15–18 不支持。完整格式和范围保存在证据中，下面保留会改变判断的项目。

| 参数 | 实际代码行为 | 易误判之处 |
| --- | --- | --- |
| sub1 调度周期 | 1–60000 ms；重设定时器后下一次检查即可到期 | 不保证再等待一个完整新周期 |
| sub2 单袋倍率 | 正常参数校验后仍返回未实现 | 有名称和格式不代表功能可用 |
| sub3 / 4 容差与范围 | 改表后重算活动目标的当前档位 | 不是等下一次重启才生效 |
| sub5 grant | 改三类配置，当前动作已取得的时限不直接改变 | 下一次选集或加入动作才可能重新复制 |
| sub6 稳态时长 | 机器码接受 1–6500 ms | 日志写的 60000 与实际判断不符 |
| sub8 sleep 时长 | 1–3600 秒；比较新时长与原睡眠起点 | 设置不重新开始计时 |
| sub10 配置读回 | 读当前运行配置 v2 | 与 `0x60 Get` 读取 staging 不同 |
| sub19 体动门控 | 改阈值、quiet、最大阻挡时间及启停 | 不清已有 20 点压力窗口或全部计时状态 |

sub19 阈值范围为 0.010–1.000 kPa，quiet 为 0–30000 ms，最大持续时间为 1000–600000 ms。它使用每袋 20 点总体标准差、跨袋取最大值；这是机械压力体动门控，不是睡眠在床检测。

### 直接泵阀控制与闭环会互相覆盖

`0x50` 直接控制泵，`0x51` 直接控制阀；两个 handler 都没有自动停掉压力调度。后续闭环仍可写入同一执行器状态。主控校准程序先另发各袋目标为 −1 的 `0x52`，才开始直接控制，停闭环不是直接命令隐含的功能。

sleep mode 将闭环策略上限及泵目标设为 80%，但直接速度设置还能覆盖目标。它不能被描述成所有命令共享的 80% 硬限制；硬件限幅与后续闭环覆盖仍分别存在。

`0x51/1` 的短 11 字节 opening 配置会从当前 mode 静态表补 closing：40% / 250 ms → 30% / 250 ms。此前自定义 closing 不会被自动保留。`0x51/2` 另有独立接收逻辑，不能套用 `/1` 每个字段的 setter 范围。

在途参数也不全是即时生效：ramp interval 在开阀时复制，ramp step 每次回调读取，hold 时长在等待中比较，maintain 只在进入该阶段时写输出。修改 maintain 配置，不代表已经保持中的 PWM 立即改变。

PWM 最后一层还有限幅、极性和启停处理。100% 时泵正常 CCR 为 ARR，阀为 ARR+1；这个代码差异不能直接换算成实际气流差异。

[逐命令分发、运行配置、泵阀时序与消费者](../evidence/analysis/system-deepening-20261108/local-control-final-pass/FINDINGS_ZH.txt) · [逐项覆盖](../analysis-tools/system-deepening/local-control-final-pass/COVERAGE.json) · [有限模型](../analysis-tools/system-deepening/local-control-final-pass/MODEL_RESULTS.json)

## 3. 采集完成分为哪几层

G0 USB 的正常采集链必须区分总线传输、传感器就绪、数据校验和缓存更新。DMA 一块数据搬完，不等于请求已成功，更不等于这批输出全是新测量。

```text
硬件 DRDY / 状态 ready
    → SPI 或 I²C 请求
    → DMA / 外设 IRQ / STOP 或结束检查
    → 请求成功 / 失败
    → 传感器回调与 CRC / ready 判断
    → current / 缓存 → 软件采样队列 → 组包
```

I²C 请求实际使用 DMA。DMA 完成分支继续处理块或启用结束事件，最终 STOP / completion callback 才把总线状态置为成功。BERR、ARLO、OVR、NACK 走错误链；DMA abort 还可能异步完成，进入错误分支不等于错误回调已经执行。到达 ErrorCallback 后最终都会置失败，但 DMA / 外设恢复操作受距离上次恢复至少 10000 tick 的条件限制。这不是每 10000 tick 自动复位一次。

SPI 的 2 tick 是请求预算，正常结束还要检查 TX FIFO 空、BSY 清除、RX FIFO 空等条件。ADC 的 DRDY 与 IMU 的状态 ready 是不同入口，不能将其中一个计数解释成所有传感器同时有效。

| 入口 | 真正更新前的条件 | 不能据此推出 |
| --- | --- | --- |
| 外置 ADC | enabled / 同步门控、低电平 DRDY、规范 SPI 成功、CRC、通道 ready mask | DRDY 出现不代表全部通道更新；mask 仅选择对应通道 |
| IMU | 高电平 DRDY，先读 `STATUS_REG 0x1e`，再完成 13 字节数据事务 | 状态 bit0 / bit1 分别准许 accel / gyro 更新，不保证两组同时换新 |
| FDC / TMAG / TMP | I²C 最终成功后，主循环才调用器件处理 | DMA 块完成本身不执行数值换算，也不更新这些缓存 |

I²C 启动包装返回 1 表示启动获准；SPI 事务包装却返回 0 表示成功。主循环写入 IMU 的 DRDY 时间也早于后续状态和数据读取，不能把该时间当作全部六轴成功换新的时间戳。

14 个硬件 revision 项按条件累计调用配置函数，并非只取一行。`0x0a05` 将后两 IMU 改到 SPI3，`0x0a10` 又重新应用 `0x0a00` 的描述符，`0x0a33` 再应用 `0x0a05` 并改一个片选。软件表已经解释，当前实机到底选择哪些项、引脚连接哪颗器件，仍要绑定实际硬件 revision 与板级资料。生产信息区 `0x0807f804` 不在这份 BBIN 内，不能从该表反推出用户设备的 revision。

这补齐了“失败后是否保留缓存”之前的传输层。逐点新鲜度仍要同时看回调、CRC、时间和最终取值，不能只看 IRQ 或数据包持续到达。

[采集底层、完成回调与板型表证据](../evidence/analysis/system-deepening-20261108/local-acquisition-final-pass/FINDINGS_ZH.txt) · [采集有限模型](../analysis-tools/system-deepening/local-acquisition-final-pass/MODEL_RESULTS.json)

## 4. Keeson 保存链补到了哪里

从启动解压指令恢复了 3272 字节初始 `.data`，绑定主 Flash 对象 `0x20003748` 和 FDS 对象 `0x2000375c`。这是原件推导的启动初值，不是实机 RAM 导出。

主对象范围包含 `0x74000–0x77fff`，完成回调 `0x2faac` 只处理写入、擦除及错误结果，没有在此构造下一条位置记录。另一个 FDS 回调推进其自身队列；不能把它直接接成 `0x76000` 的 32 字节位置追加。

对 569 个已识别函数做有界地址表达式筛选，复核 52 个候选，并为 93 处间接调用保留寄存器和对象来源。已经排除了几种误判：196 字节诊断读 Flash，不读当前 RAM；相邻 164 字节配置保存不是位置保存；两个同为 32 字节的复制也有其他用途。

**仍未找到“当前 32 字节 RAM 快照 → 位置区追加”的完整调用链。** 下一步静态入口已缩小到 `0x3638e` 索引回调表、运行期注册写者及跨过程记录对象别名。包外系统服务和实际 Flash 前后记录是另一类材料缺口，不能因此断言 producer 一定在 bootloader，也不能说设备不会保存位置。

[启动数据、Flash 对象、回调与间接调用账本](../evidence/analysis/system-deepening-20261108/local-persistence-final-pass/FINDINGS_ZH.txt) · [覆盖与剩余值流](../analysis-tools/system-deepening/local-persistence-final-pass/COVERAGE.json) · [原字节验证](../analysis-tools/system-deepening/local-persistence-final-pass/BYTE_VALIDATION.json)

## 5. 验收与下一步

| 范围 | 完成 | 后续具体条件 |
| --- | --- | --- |
| 主控气囊配置 | 启动源、板型选择、R12、请求选择、保存/发送顺序、动态目标入口 | 同次启动配置、R12、MCU 回读与命令记录，验证实机采用哪一份 |
| A02 控制 | 所列 0x53 / 0x50 / 0x51 正常分支、参数写入、回调与 PWM 消费 | 其余硬件映射、全部异常生产者及任意并发交错未穷尽；物理效果需测量 |
| G0 USB 采集 | 所列 I²C / SPI / DMA / IRQ 完成与错误链、ready、板型配置累加 | 实际 DRDY、IRQ、总线和原始包同步记录；完整硬件电气行为另需资料 |
| Keeson 保存 | 启动 `.data`、对象/API/完成回调及有界别名/间接调用账本 | 尚可继续跨过程值流；系统服务镜像和正常保存前后记录需材料 |
| 生产生理算法 | 没有获得新生产组件 | 心肺分离、双人融合、HRV、在床、分期、姿态生产者与 Autopilot 继续按材料缺口列待办 |

原字节、IL、来源哈希、模型输入/结果和限定覆盖随增量保留。有限模型用于核对指定规则，不能当作固件仿真、实机故障率或全程序穷尽证明。已停止的共享日志专项没有恢复。

保留配置 34 项、A02 控制 61 项、采集驱动 33 项有限场景。Keeson 另有 2 个正常解压 token 夹具与 6 项原件断言，不与控制场景合并成覆盖率。配置顺序、A02关键边界、采集核心驱动合同和Keeson启动数据分别经过有界交叉复核；各审阅文件明确没有审到的部分。

[统一清单核验](../analysis-tools/system-deepening/local-final-pass-audit/VERIFICATION.json) · [配置复核](../analysis-tools/system-deepening/REVIEW_CONFIG_FINAL_PASS.json) · [控制复核](../analysis-tools/system-deepening/REVIEW_CONTROL_FINAL_PASS.json) · [采集复核](../analysis-tools/system-deepening/REVIEW_ACQUISITION_FINAL_PASS.json) · [持久化复核](../analysis-tools/system-deepening/REVIEW_PERSISTENCE_FINAL_PASS.json)

相关章节：[本地处理全景](local-processing-20261108.md)、[参数与恢复](local-followup-20261108.md)和[逆向执行计划](reverse-plan.md)。完整证据链保持原始材料、历史研究与复核分层保存。
