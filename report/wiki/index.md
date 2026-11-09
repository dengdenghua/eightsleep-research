# Eight Sleep Pod 技术分析报告

本报告依据官方 MTK 固件、国行 Android APK、设备侧程序集与保留的接口记录，解释传感采集、数据整理、上传、本地控制及客户端结果处理。分析对象与用户实机的部署对应尚未完全确认；样本内实现、模型验证和实机行为分别标注。

## 阅读路径

- **理解系统全貌**：[系统架构](architecture.md) → [信号处理与算法](local-processing-20261108.md)。
- **判断逆向深度**：[核心结论与验证状态](conclusions.md)，分别核对代码、模型、部署与实机证据。
- **复核技术细节**：进入对应模块主章节，再查看专题和原始证据。
- **继续逆向**：[执行计划](reverse-plan.md) → [逐项任务](roadmap.md)；先确认前置材料，再选择任务。

## 核心结论

[结论登记表](conclusions.md)统一维护上传前处理、交付边界、本地反馈控制、核心生理算法和实时采集五项判断。各结论的适用范围、证据类型与未验证项分别列出，详细公式和调用链归入对应主章节。

## 模块目录

| 模块 | 内容 |
| --- | --- |
| [系统架构](architecture.md) | 设备、App、云端及两条主要数据/控制流 |
| [平台与版本](modules/hardware.md) | MT8365、MCU、Pod代数及部署对应 |
| [传感采集](modules/sensor-mcu.md) | ADC/IMU、电容/温度、缓存、组包与板型分派 |
| [主控数据处理](modules/host-signal.md) | 时间映射、补点、双侧归并与输出契约 |
| [缓存与上传](modules/raw-upload.md) | 本机队列、NATS、uploader及确认边界 |
| [热控算法](modules/thermal.md) | 测温、PID、自适应限幅与保护 |
| [气囊、姿态与音频](modules/accessories.md) | 机械校准、控制、诊断与持久化 |
| [离线状态](modules/offline-state.md) | BLE、闹钟、日程和重启恢复 |
| [系统运行与OTA](modules/runtime-ota.md) | 服务、IPC、文件、固件更新 |
| [Android App](modules/android-app.md) | 结果解析、缓存、图表与本地统计 |
| [云端接口](modules/cloud-api.md) | 已知请求、返回契约与服务实现边界 |
| [生理算法](modules/physiology-algorithms.md) | 已恢复前处理、结果消费者及缺失生产实现 |
| [Autopilot](modules/autopilot.md) | 手动目标、建议接受与自动策略缺口 |

## 技术专题

| 方向 | 参考章节 |
| --- | --- |
| 信号处理与算法 | [覆盖范围](local-processing-20261108.md)、[前处理公式](algorithms/local-preprocessing.md)、[电容与温度](algorithms/local-capacitance-temperature.md) |
| 采样与时间 | [USB时钟](sensor-clock-20261108.md)、[nonUSB时钟](nonusb-clock-writers-20261108.md)、[板型分派](hwrev-dispatch-table-20261108.md)、[配置对象与时钟源](config-object-snapshot-20261108.md)、[回调实现与hwrev标识](callback-implementations-20261108.md)、[上报对象布局](report-object-layout-20261109.md)、[GPIO描述表与0x10f0块字段](post-layout-closure-20261109.md)、[调用目标闭合与trampoline簇](residual-target-closure-20261109.md)、[字面量偏移字段图与空洞判定](literal-field-access-20261109.md)、[五态帧解析状态机与跳转表](state-machine-switch-closure-20261109.md)、[接收链路下游闭合与队列字段初始化](receive-path-closure-20261109.md)、[冻结镜像全量反汇编与导出语料一致性核查](disasm-full-image-20261109.md) |
| 数据完整性 | [采样到发布模型](capture-pipeline-20261108.md)、[故障与上传](sensor-fault-upload-20261108.md)、[发布前队列](prepublish-queue-20261108.md)、[浮点与时间对齐](posture-numeric-20261108.md) |
| 温控 | [冷却上限状态](cooling-state-20261108.md)、[反馈与执行](modules/thermal.md) |
| 机械与配置 | [校准及运动](algorithms/local-calibration-and-motion.md)、[生命周期与ACK](control-lifecycle-20261108.md)、[对象与持久化](accessory-resume-20261108.md)、[停用及旧快照](host-save-boundaries-20261108.md) |
| 导出来源与字段 | [导出归属](export-attribution-20261109.md)、[字段位点](field-site-binding-20261109.md) |
| 主循环与发送 | [对象与计数门控](main-object-control-20261109.md)、[可选包与状态统计](state-output-chain-20261109.md)、[模式与缓存调度](mode-schedule-20261109.md)、[温度窗口与包体读回](temperature-cache-20261109.md)、[字段编码与汇总](temperature-encoding-20261109.md) |
| 手机结果处理 | [心肺与分期](algorithms/results-and-staging.md)、[统计与计划](algorithms/local-app-processing.md) |

## 证据与使用

[证据方法](evidence-method.md)规定来源、版本、哈希及推断边界；[完整材料](full-evidence.md)提供官方样本、完整提取和分析记录。[解析器与重建工具](tools-and-reconstruction.md)包含可复跑方法。证据原文保留其来源语境，正文采用当前有效结论。

[未解决问题与执行计划](reverse-plan.md)集中列出具体缺口和验收标准；[任务清单](roadmap.md)提供逐项状态。[实时采集工具](live-capture-tool.md)支持用户登录、查找绑定设备及手动读取/导出 live 事件。留存的设备查询记录显示查询时离线，持续原始数据流尚未验证；设备在线也不保证接口提供完整波形。
