# 系统架构与数据流

已知链路跨越床垫传感 MCU、MT8365 Linux 主控、热控及附件 MCU、手机 App 和远端服务。理解系统时，需要把“采样和上传”“温度目标生成”“执行器闭环”分开：它们共享设备，却使用不同进程、接口和状态。

## 一条传感样本的路径

```text
机械与生理信号
  → ADC 与 IMU 前端
  → Sensor MCU：缓存、倍率、通道映射、5 ADC + 1 IMU 分组
  → LSP / 0x3c：tick、flags、frequency、样本数组
  → frankenfirmware：解码、时间锚点、秒桶、左右侧归并
  → CBOR raw subject
  → Frank 进程内发送队列：满拒新、发布失败保留队首
  → js_Publish：成功返回后弹出队首
  → NATS raw_mem / raw 缓存
  → jetstream-uploader：批次、deflate、TLS
  → 远端原始数据入口
  … 生产生理分离、质量判断、融合和分期实现缺失 …
  → client-api / app-api：阶段、HR、RR、HRV、RMSSD 等结果
  → Android DTO、缓存、图表和反馈
```

MCU 输出不是未经过处理的模拟信号；本地已改变数值表示、通道排列及时间序列。主控上传器所恢复的追加路径复制既有数组，没有在该路径恢复出心肺分离器。远端接收和结果 API 之间画成未知段，是因为尚无生产服务程序、模型权重或端到端运行追踪把二者闭合。

Frank 的队列满拒新与 NATS `raw_mem` 超额淘汰旧消息是两个独立边界。主机消费水位、Frank 入队、发布 API 返回和云端 batch ACK 也不能互相替代；发布超时不证明远端一定未存入，再次尝试不等于已经观测到重复。[发送队列分析](prepublish-queue-20261108.md) · [代码证据](../evidence/analysis/prepublish-queue-20261108/code-audit/FINDINGS_ZH.txt)

证据：[采样新鲜度](../evidence/analysis/sensor-mcu/SAMPLE_FRESHNESS_ZH.txt)、[主控信号链](../evidence/analysis/signal-host/SIGNAL_HOST_ANALYSIS.txt)、[上传协议](../evidence/analysis/sleep-pipeline/UPLOADER_PROTOCOL.txt)、[App 心肺链](../evidence/analysis/android-findings/APP_CARDIORESPIRATORY_PIPELINE_ZH.txt)。

## 一次温控动作的路径

```text
App 手动设置 / 温度建议被接受 / 远端策略结果
  → API 与设备消息路由
  → DAC / Capybara / frankenfirmware 对应控制入口
  → 热模式、目标、期限与本地状态
  → Frozen MCU 的温度反馈、PID、限幅和保护
  → TEC、泵、风扇
  → 水温与诊断反馈
```

上图的入口并非每次都串行经过全部进程。各命令有各自路由，详见模块页；不能把绘图箭头当成每个 API 的已验证调用栈。手机档位值、设备请求目标、水温反馈和床面实际温度是不同量。已经恢复的是部分目标换算及设备执行规则；Autopilot 如何根据睡眠和个人状态生成目标仍缺生产实现。

证据：[热模式路由](../evidence/analysis/sleep-pipeline/THERMAL_MODE_ROUTING_ZH.txt)、[反馈传感器映射](../evidence/analysis/thermal-deep/FEEDBACK_SENSOR_MAP_ZH.txt)、[App 温控](../evidence/analysis/android-findings/APP_THERMAL_CONTROL_ZH.txt)。

## 断网与备用控制

```text
App 已有可用离线密钥
  → BLE 加密命令
  → Capybara 解密及本地 socket
  → DAC 转发
  → Frank 手动 heat / level 等入口
  → 本地热控执行
```

没有可用密钥时，取密钥的路径涉及 BLE nonce 与云端服务，因此不能从上述本地调用链推出 App 永久不依赖联网。备用手动温控、已加载闹钟和原生日历调度是三套不同逻辑；其中一个日历函数为占位实现，不代表所有离线计时无效。

证据：[离线边界](../evidence/analysis/device-side-followup/offline-boundary/FINDINGS_ZH.txt)、[本地备用链](../evidence/analysis/sleep-pipeline/LOCAL_BACKUP_ZH.txt)。

## 执行与运维平面

| 组件 | 主要职责 | 不应混淆的边界 |
| --- | --- | --- |
| Sensor MCU | 前端采集、数值转换、缓存与采样封包 | 协议 500 Hz 不等于实测 ADC 每秒 500 个新值 |
| frankenfirmware | 主控采样、时间、发送队列、状态与热控协调 | 秒桶归并不等于生理融合；成功编码不等于入队或投递成功 |
| Eight.Capybara | 托管服务、BLE、设备与附件功能 | 同包附件类不等于当前设备已加载 |
| DAC | Node.js 设备消息与本地控制路由 | 版本号与 SWU / API 提交号独立 |
| NATS 与 uploader | 本机流缓存、批次和上传 | 流淘汰与 Frank 队列拒新分层；本机发布不等于云端确认 |
| vector | 日志和运维 metrics | 不等于睡眠指标推理管线 |
| Frozen MCU | 热反馈、执行器和保护 | 本地 PID 不等于 Autopilot 目标生成 |
| Android App | 网络请求、缓存、展示及用户输入 | 解析服务器结果不等于实现服务器算法 |

systemd、持久分区、OTA A/B 槽和监督脚本为这些组件提供运行基础。已做完整字节清单不等于每个 ELF 都做了语义分析。证据：[运行面盘点](../evidence/analysis/system/RUNTIME_SURFACE_AUDIT_ZH.txt)。

## 三个仍然断开的连接

1. 当前 Pod 实机的固件提交号与已下载 SWU、Sensor MCU、Frozen MCU 的确切对应关系。
2. 原始数据上传之后，进入生产清洗、分离、融合、心搏及分期程序的内部调用链。
3. 云端个体化温控目标生成与实际设备执行的同一次运行记录。

第一个需要实机版本与制造信息，第二个需要服务端代码、部署材料或带计算来源的官方数据，第三个需要在线状态下经授权的只读记录及明确时间对齐。具体验收条件见 [待办计划](roadmap.md)。
