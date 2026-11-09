# 云端接口与结果契约

已恢复接口请求和部分响应结构，服务端计算实现尚未取得。

云端边界已能以具体请求、字段和 App 消费链描述；内部如何把上传波形变成结果还未恢复。历史 API 在设备离线时可返回已有数据，这不表示设备恢复在线，也不说明实时采集链已可用。

## 进入和离开云端的边界

```text
设备上传 → 远端接收服务 → 内部处理与存储（缺实现）
                                ↓
                          已计算结果与设置
                                ↓
国行 App ← client-api / app-api ← 账号授权与设备关联
```

上传器的原始 TLS 协议见 [raw-upload 模块](raw-upload.md)，不能与 App 的 REST 路径混成同一个协议。下面的域名绑定来自本国行 APK 构造，不证明物理部署位置，也不替代设备运行期 endpoint 配置。[环境绑定](../../evidence/analysis/android-findings/APP_RUNTIME_AND_HARDWARE_ZH.txt)

| 服务 | 已追入口 | 返回或动作 |
| --- | --- | --- |
| auth-api-proxy.8slp.net.cn | 账号认证服务构造 | 支撑授权；本 Wiki 不包含密码、令牌和登录执行器 |
| client-api-proxy.8slp.net.cn | GET `/v1/users/{userId}/trends` | days、sessions、分期、时间序列、算法版本、日汇总 |
| client-api-proxy.8slp.net.cn | intervals 编辑与 feedback | 用户时间修改、停止/删除及反馈；不公开推理实现 |
| app-api-proxy.8slp.net.cn | metrics/aggregate、temperature、temp-events | 指标汇总、温控设置及历史事件 |
| app-api-proxy.8slp.net.cn | GET `/v1/devices/{deviceId}/live` | App 消费 samples 与 timestamp 的实时合同 |
| app-api-proxy.8slp.net.cn | 用户 events WebSocket | 已注册 generic、alarm、base-preset、temp-dial 等通知 |

表中为契约模板，不附带实际账号标识或可运行请求。trends 调用包含 `include-main=false`、`include-all-sessions=true`、`model-version=v3`，日期和时区另传。指标聚合的 app-api 与 trends 的 client-api 不可互换。[trends 契约](../../evidence/analysis/android-findings/ANDROID_SLEEP_RESULTS_ZH.txt) · [聚合链](../../evidence/analysis/android-findings/APP_CARDIORESPIRATORY_PIPELINE_ZH.txt)

## 静态字段与实际历史证据

早期 APK 报告只声明版本字符串；后续本人设备匹配的 4 段历史 session 实际返回：

| 字段 | 已观察值 | 可解释范围 |
| --- | --- | --- |
| sleepAlgorithmVersion | 0.1.1 | 这批历史结果的命名版本 |
| presenceAlgorithmVersion | 3.2.1 | 同上，不等于三个独立物理模型 |
| hrvAlgorithmVersion | 1.2.0 | 同上，不提供 HRV 公式 |
| modelVersion | v3 | 顶层结果元数据；请求也带 v3 |
| sfsCalculator | v3.2 | 评分器标识，未获得评分公式 |

这些不是当前固件部署清单；同一设备 ID 的历史记录也不能反证当时硬件和系统版本与现在完全一致。[历史版本核对](../../evidence/analysis/account-readonly/historical-version-probe/FINDINGS_ZH.txt)

在这批有限历史结构中，hrv 与 rmssd 有 311 个相同时间戳配对，配对值均不同，另有 hrv 点缺少对应 rmssd。HRV 页面读取 rmssd 的静态结论因此有运行输出支持。常见输出间隔 300 秒、阶段段长公约数 30 秒，只描述输出粒度，不能证明计算窗或模型 epoch；缺点原因也不能直接归为体动清洗。Wiki 只保留结构摘要，不嵌入健康数值、完整曲线或身份。[历史结构复核](../../evidence/analysis/account-readonly/history-behavior-followup/FINDINGS_ZH.txt)

## 实时与事件还缺什么

用户补充此前测试时设备未开机。开机联网后有机会取得实时数据，但尚未验证；此前 404 的原因不能直接归结为关机。下一步先由 App 确认在线且能正常控制，再按 API-01 做短时读取。完整步骤与不同响应的判定见 [实时采集与上传截取](../realtime-capture.md)。

live 的 `samples: List<Float>` 和时间字段已追到 App 引导消费者，但列表究竟是多通道、时间序列还是经过服务端聚合的值，尚无实包映射。已留存分析中请求失败的原因未确定；设备无法联网期间没有继续重试。

用户 WebSocket 的 App 消费者按事件类型保留更新的时间，再进行 150 ms 合并。这个时间是通知合并策略，不能当 ADC 采样周期。temp-dial 可触发温控设置刷新，不代表每个事件各发一次 GET，更不提供睡眠推理过程。[实时流与通知](../../evidence/analysis/android-findings/APP_LIVE_SENSOR_EVENTS_ZH.txt)

temp-events 的已知声明没有 from/to；一次实际结果为两个空列表。它无法回答事件保留多久、从未自动调温还是当前范围为空。phase summary 不带设备 ID，将来非空时仍需另核设备归属。[温控事件契约](../../evidence/analysis/android-findings/APP_TEMPERATURE_HISTORY_ZH.txt)

## 数据导出状态

官方 App 的数据下载流程已按用户授权提交一次，返回 HTTP 200 / success。实际 wire type 为小写 `download`；成功提示称 7 天内邮件交付，但截至本项目整理没有得到导出文件。回执只证明入口接收，是否含原始波形、诊断文件或仅结果汇总仍未知。下一步是接收并离线检查文件，不重复提交申请。[单次导出记录](../../evidence/analysis/account-readonly/data-export-request/FINDINGS_ZH.txt)

## 未完成与下一步

- API-01：设备恢复在线后采集最小、本人设备的 live 样本，核对频率、长度、单位与 MCU 通道映射。
- API-02：取得已有申请的导出文件后，按文件清单与 schema 区分原始传感数据、结果指标和日志。
- API-03：有实际非空温控事件或官方文档时，确定保留范围、阶段归属和事件与设置的关系。
- API-04：取得带版本和完整性信息的官方处理部署材料，补齐接收、存储及推理之间的内部链。

## 2026-11-08 分析

设备侧 SignalR 诊断请求的注册、入参和返回已继续核对；`functions.*` 不等于用户账号可调用的 HTTP URL。监控分页、缓存读数及回包失败边界见[系统分析](../system-deepening-20261108.md)。
