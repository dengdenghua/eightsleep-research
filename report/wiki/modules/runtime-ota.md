# 运行环境、诊断与OTA

这一页相当于设备的后台工作安排：谁先启动，程序之间怎样传消息，出了错记在哪里，更新时怎样替换程序。

MT8365 上运行的是多个进程和 MCU 的协作系统。Linux 用户态承担连接、命令路由、原始数据队列、日志与升级；传感采样和温控执行分布在子系统 MCU。默认镜像的启动配置已盘点，当前设备实际进程、环境覆盖和持久文件仍未取得。

## 默认进程和连接

| 组件 | 执行与职责 | 主要连接 |
| --- | --- | --- |
| Eight.Capybara | .NET bundle；硬件初始化、BLE、附件、DeviceAPI/SignalR | 云 RPC、BLE、附件、本地 DAC socket |
| DAC | Node JS；远端函数分发、本地命令协调 | 云 DeviceAPI、Capybara 与 Frank Unix socket |
| frankenfirmware | ARM64 原生主控；传感解包、热控状态、振动闹钟 | 传感/温控子系统、本地 NATS、DAC |
| nats-server | JetStream 原始消息缓存 | raw_mem/raw 与 uploader |
| jetstream-uploader | Rust 原始数据批次、压缩与上传 | NATS、持久文件、远端 TLS |
| Vector | 日志与设备 metrics 整理/发送 | journald、历史日志、NATS metrics |
| systemd 和 shell | 启动依赖、监视、空间管理、网络恢复、OTA | persistent、启动槽、进程生命周期 |

Frank 和 DAC 等待 Capybara 的 run_info。`NODE_ENV=pod3` 是此镜像的部署配置名，不是市场产品代数证明。Cavia 是同一 Capybara 程序按 loopback/USB 条件选择的硬件测试模式；其 TestPlan 最终调用 Heat/Level，不是发现了另一套常规 Autopilot。[启动与文件盘点](../../evidence/analysis/system/RUNTIME_SURFACE_AUDIT_ZH.txt) [Cavia 真实注册链](../../evidence/analysis/sleep-pipeline/THERMAL_MODE_ROUTING_ZH.txt)

镜像全部普通文件已读取并计算哈希：13626 个 tar 成员、10267 个普通文件、1935 个 ELF。大量 ELF 是系统库/内核模块，不能当作 1935 个产品应用；完整字节盘点也不等于逐函数理解。直接链接依赖未显示标准推理库，仍不能排除静态内嵌、动态加载、自定义权重或运行期投放。

## 启动时间和持久状态

热控、闹钟、原始队列和配置有不同持久化语义。Frank 热控文件是原地覆盖；部分托管附件配置使用 `.tmp`、落盘 Flush 和 Move 覆盖。不能把一处文件写入方式推广到全系统。[运行时文件消费者](../../evidence/analysis/sleep-pipeline/DOWNLOAD_AND_RUNTIME_ARTIFACTS_ZH.txt)

离线启动的 `ensure_date_sanity` 只在系统时间早于固件构建时间时尝试覆盖到构建时间，不提供真实今天的日期。主机 epoch 映射、热控 absolute expiry 和闹钟各自受墙钟影响。基本 unit 的依赖不足以证明完整的校时先后关系；还缺运行期 drop-in、实际 NTP 和时钟轨迹。[启动与时间恢复](../../evidence/analysis/device-side-followup/recovery-round/time-recovery/FINDINGS_ZH.txt)

## MTK 整机 OTA

分析的官方 MTK SWU 目标为 `mt8365-8sleep`，包含 rootfs 和独立 fitImage；系统版本 Eight Layer 4.0.28，内核载荷标识 5.15.47，构建时间为 2026-11-03 UTC。它与另一个 NXP 包采用不同平台和槽流程，不能互套。

```text
官方更新配置与运行参数
  → 取得签名清单和载荷
  → 从运行内核命令行确认 rootfs_a / rootfs_b
  → 检查并更新启动环境标记
  → 安装到另一 rootfs 槽和对应 boot 槽
  → 文件系统检查与重试标记
  → 延迟重启、后续成功/回退判断
```

MTK 安装脚本在格式化前要求启动环境写入成功；postinst 设置目标 boot 标记和 `retry_boot=5`。这些是已读流程，未执行升级或验证实际 bootloader 回退。

`Platform=mediatek` 和 `SigningKeyId=20250116` 来自包内配置。旧路径与带签名标识的新路径清单相同、签名不同，公钥交叉验证得到对应关系。旧签名整包已完整校验，新签名路径只取得包头，不能写成两份完整镜像都逐字节核验。裸固件路径也不是永久有效下载链接。SWU release、Frank build、API firmwareCommit 和子 MCU 版本是不同命名空间，尚未绑定为当前实机同一部署。[MTK OTA 与签名迁移](../../evidence/analysis/system/MTK_COMPARISON.txt)

附件更新另按硬件版本映射读取包内 BBIN/bin，经子系统/FOTA 消费者发送；它不是 Linux rootfs 槽升级，也不是生产睡眠模型的单独下载证据。[附件固件消费](../../evidence/analysis/sleep-pipeline/DOWNLOAD_AND_RUNTIME_ARTIFACTS_ZH.txt)

## 断网监督与空间回收

defibrillator 的 offline-policy 负责网络重试、重启退避和 OTA 状态，不计算睡眠或温度目标。MTK 初次未联网门限 1800 秒，启动曾联网后的门限 3600 秒；是否重启还受认证、OTA 状态、网络分类和退避约束，不能当固定重启承诺。

空间不足时可清理旧 RAW、日志备份，最后可 purge raw stream，仅保留 20000 条消息。单位是消息，不能无流量证据换算固定天数。断网循环也会执行空间管理。NATS 关机 dump 有 timeout 且允许失败，不能承诺突然断电或正常关机均保存所有内存样本。[断网与持久空间策略](../../evidence/analysis/system/OFFLINE_SUPERVISOR_NOTE.txt)

Vector 的三个输入是 journald、历史 ndjson 和 NATS `metrics`；没有订阅已审配置中的 raw.*，因此这条配置解释为日志/设备指标处理。其内存 buffer 及溢出行为不要套到生理原始数据队列。[Vector 输入和输出](../../evidence/analysis/system/RUNTIME_SURFACE_AUDIT_ZH.txt)

## 维护与下一步

包内有受配对模式和超时约束的维护连接服务；有维护能力不等于已证实运行期投放了睡眠算法。本项目没有触发维护、升级、设备控制或新的账号请求。

C13静态启动图已完成：286份保留文件校验、3份托管生产者来源和230个unit名称。图中分别记录After/Before、Wants/Requires和文件等待，显式排序无环不等于完整启动无死锁。`run_info`写于连接初始化之前，消费者只等非空；burrow校时与采样启动没有显式排序。[启动图与等待分析](../../evidence/analysis/finishable-20261107/startup/FINDINGS_ZH.txt)

C12/C14/C15仍需同一实机部署、启动环境、更新日志和持久目录记录。运行期配置、生成器及全部隐含systemd依赖未纳入静态图。

## 2026-11-08 分析

补齐设备请求分发、模式注册差异及维护门控；维护进程存活不等于连接已可用，名称含 get 的函数也可能写文件。见[系统分析](../system-deepening-20261108.md)与[诊断证据](../../evidence/analysis/system-deepening-20261108/diagnostics/FINDINGS_ZH.txt)。

随包 SignalR 对双 Request 注册的行为已另行核对：正常一次请求进入两条 channel，但只有派生 channel 执行业务。基类无界队列存在保留路径，尚无实机内存测量；原诊断快照中的“框架语义待核”由[框架审计](../../evidence/analysis/system-deepening-20261108/signalr-dispatch/FINDINGS_ZH.txt)补足。
