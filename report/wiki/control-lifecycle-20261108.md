# 气囊控制：取消、重连与命令确认

本章分析气囊故障状态和主控执行顺序，区分接口接受请求、串口发送命令、接收 ACK 与机械执行完成四个边界。床架执行链见对应专题。

## 1. 命令成功究竟确认了什么

```text
普通目标接口：校验 → 写入 Ready 队列 → 返回 success
Ready 处理：选出请求 → 更新主控保存值 → 发送命令
LSP 连接：等待该 opcode 的响应 → 检查首字节 ACK
MCU：各命令改参数 / 改状态 → 后续调度和定时器执行
```

`DeviceConnection.SendCustomCommand` 确实等待协议响应和 ACK；不带 `WithResponse` 后缀仅表示丢弃响应正文，并非只等串口写完。不过 ACK 并没有同时确认压力已达到目标、所有阀动作已结束或整个校准事务已保存。

连接按 opcode 分别串行。等待同命令号前驱消耗总超时预算，拿到发送机会后不会重新获得完整预算；不同 opcode 可以同时等待响应。这个锁不能解释成所有控制操作的全局独占。

同步串口写入还有单独边界：剩余预算在写入前计算，写完后用于等待响应时没有重新扣除写耗时；读循环另行检查绝对 deadline。因此它不是所有情况下严格相同的端到端截止时间。

### 取消不会撤回已经发送的命令

| 当时的状态 | 已核代码行为 |
| --- | --- |
| 同 opcode 正被占用 | 排队等待使用取消 token，可在发包前退出 |
| gate 空闲，token 已取消 | 快速取得 gate 的路径没有预先检查 token，仍可能先发串口，再进入可取消的等待 |
| 命令已发，随后取消或超时 | 清理当前 pending、释放 gate；不会自动发送反向命令 |
| 请求连接停止读取 | 取消读循环并有界等待；此处没有逐项立即失败所有 pending，也不能因 2 秒等待结束就认定读循环已退出 |

以上是限定代码顺序。实际发送还取决于连接、剩余预算和串口调用是否成功，不能将“可能进入发送”写成实机必然动作。

### 同命令号的迟到响应仍有条件歧义

响应相关性只按 opcode 匹配。如果 A 已结束等待，B 使用同一 opcode 登记且尚未过期移除，之后才读到 A 的真实旧响应，这条响应可以完成 B 的等待；该层没有用于区分 A / B 的请求序号。若旧响应在 B 登记前到达则被丢弃，其他 opcode 的响应也不会完成 B。

这说明同 opcode 排队解决了同时登记问题，但不能单靠它排除链路中迟到的旧响应。上述顺序尚未在实机观测，不代表所有 ACK 都失去意义；需要同源发送、接收和请求状态记录才能判断是否实际发生。

[发送完成、ACK、取消与停止的代码证据](../evidence/analysis/system-deepening-20261108/local-command-completion-followup/FINDINGS_ZH.txt) · [24 项有限事件模型](../analysis-tools/system-deepening/local-command-completion-followup/MODEL_RESULTS.json)

## 2. 校准退出与重连怎样衔接

Ready 的普通请求队列和 `deviceWriteLock` 都属于该实例。创建新的 Ready 时，没有把旧队列搬过去；校准返回也会创建新 Ready。因此，旧队列不能描述成断连后可靠重放的持久队列。旧实例尚有引用时队列仍可能存在，“没有迁移”不等于“立即释放”。

**同进程重连读取的是配置管理器当前 RAM 值，不会重新读取 R12 文件。** 如果此前 RAM 已更新而磁盘保存失败，重连与进程重启可能恢复不同的值。目标/mode、容差和 profile 又在不同方法中读取，整个初始化并非锁定的一份配置快照。具体保存/发送先后见[参数分析](local-final-pass-20261108.md)。

校准交接会等待本 Ready 的 `deviceWriteLock`，但该锁只覆盖系数读写、容差和 profile 等选定入口。普通目标/mode 以及它们的启动重放没有使用这把锁；它也不跨两侧或跨新旧 Ready 实例。不能据此认定交接已经等待所有在途写操作结束。

`calibration/cancel` 设置 runner 的停止请求标记并立即返回最近状态，没有取消在途发送使用的 token，也不等待校准退出。请求还处于 Ready 的校准交接阶段时，取消接口又可能因尚未进入 Calibrating 而拒绝。接口接受停止、循环检查到停止、关闭动作完成，是不同节点。

Disable 也有顺序边界：先保存 `Enabled=false`，再将状态换成 Null 并取消任务；没有在该方法里等待旧状态任务和外部 API 操作全部结束。若保存抛错，后续 Null / Cancel 不执行，但配置管理器可能已经把 RAM 中的 Enabled 改为 false。普通 remove 接口另有“任何一侧校准中则拒绝”的检查，不能将直接服务分支当作该接口总能到达的行为。

外部系数读写、容差和 profile 接口向 Ready helper 传入 `CancellationToken.None`，不随状态机 CTS 自动取消。已进入旧实例的操作可能与连接关闭相遇，最终结果仍取决于下游。Host 另有 Null 状态协调，避免满足特定取消条件时被旧状态返回覆盖；这不是在途任务已经排空的证明。

普通目标发送捕获异常后，同批 mode 处理仍可能继续；捕获范围包括取消异常。这只能先证明控制流继续到下游发送方法，是否真的写出还需上一节的连接与取消条件。

校准因断线或进程停止离开时，finally 会在 runner 仍活跃的条件下尝试 `AbandonAsync`，使用独立 10 秒预算停泵关阀或恢复入口状态。预算不构成严格墙钟保证；某条发送抛错时，后续停止动作也不保证全部继续执行。它与 `calibration/cancel` 的立即回显不是同一步。

[状态、队列、校准取消与恢复完整证据](../evidence/analysis/system-deepening-20261108/local-control-lifecycle-followup/FINDINGS_ZH.txt) · [生命周期模型](../analysis-tools/system-deepening/local-control-lifecycle-followup/MODEL_RESULTS.json)

## 3. 故障码继续按真实写入者判断

A02 的 Fault1–4 仍需从赋值与数据流证明其实际触发条件，不能靠枚举名称补算法。沿调度快照、袋对象引用及结构复制追查，区别袋内原因、调度器状态和遥测输出；Safety、Fault5/6 与初始化链按各自证据范围单列。

| 新核对的路径 | 当前能确认什么 |
| --- | --- |
| `0x08020f20 → 0x0801e6a0 → 0x0801eb38` | 32 字节调度快照转换为 3 字节请求，再输出请求/注册槽索引；不是反向复制整个袋对象 |
| 平台配置的两个间接回调 | 绑定到 10 个初始化 callback；所核写入涉及泵、阀、测速、压力映射、灯及蜂鸣器对象 |
| A00 / A01 的六组阀对象清零 | 范围末端为 `G+0x1554`（不含），袋对象从 `G+0x1558` 开始；不能因地址相邻当作覆盖故障字段 |
| 扩展总线恢复回调 | 所核路径切 GPIO 并等待，没有直接改写袋故障字段 |

这些路径仍没有补出 Fault1–4 的实际生产者。有界值流账本中仍存在参数未知的块辅助调用，因此结论是“所核路径未找到”，不是“全固件不存在”或“这些故障永远不会出现”。

还有两个已核区别：整机与逐袋初始化确实会把故障原因清零，不能笼统说初始化不写这个字段；调度分类函数 `0x0801e6a0` 判断的是 FSM 的故障状态 6，并不读取快照中的 FaultReason。故障状态编号与故障原因编号不是同一字段，调度器也没有在这里重新生成原因 1–4。

[故障状态与对象值流分析](../evidence/analysis/system-deepening-20261108/local-fault-state-followup/FINDINGS_ZH.txt)

## 4. 验收边界与下一步

这里的模型由已核分支建立，只覆盖列出的事件顺序，不执行原厂程序集或 MCU，也不穷尽任意线程和中断交错。来源哈希、静态 IL / 原指令、有限模型和未闭合入口随报告保留。

命令完成与生命周期分别保留 24 项有限场景；独立审阅按各自范围记录，不能用场景数代替实机覆盖率。[统一核验](../analysis-tools/system-deepening/local-control-followup-audit/VERIFICATION.json) · [命令完成复核](../analysis-tools/system-deepening/REVIEW_COMMAND_COMPLETION_FOLLOWUP.json) · [生命周期复核](../analysis-tools/system-deepening/REVIEW_CONTROL_LIFECYCLE_FOLLOWUP.json) · [故障状态复核](../analysis-tools/system-deepening/REVIEW_FAULT_STATE_FOLLOWUP.json)

下一步应把取消请求、最后一次已发送命令、ACK、校准状态和压力遥测按同一时间轴对齐。没有同源运行记录时，只能说明允许出现的顺序，不能声称设备发生过失控、未停止或配置丢失。

生产心肺分离、双人融合、HRV、在床、分期和姿态标签生产者仍缺对应组件；气囊机械控制不替代这些算法。床架既有证据保留，当前不继续分析。

[当前研究优先级](reverse-plan.md) · [本地处理全景](local-processing-20261108.md)
