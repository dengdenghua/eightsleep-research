# 附件遥测：另一套本地整理与队列

气囊的压力、电流和健康遥测由 Capybara 的 C# 组件处理，与 Frank 的压电链不同。**同样最终进入 NATS，前面的时间处理和丢弃规则却不同。**

| 环节 | 气囊遥测的实际行为 |
| --- | --- |
| 字段转换 | 压力保留输入 float 值；电流、温度及部分控制字段取两位小数 |
| 大气参考 | 从后往前选择至少有一个正压力的传感器列；不是硬编码的物理编号 |
| 压力发布 | 发布压力列表与大气压力，输入中的温度列表不进入该消息 |
| 时间展开 | 第 i 点时间为 `包时间 + i × floor(1000 / 频率)` 毫秒 |
| 秒分组 | 追加样本；不按槽去重、不补缺点、不插空秒 |
| 发出条件 | 后续样本进入不同秒时才发出旧组；输入停止时尾组可能留在内存 |
| 左右侧 | 各自分组并发布单侧消息，没有在这里合成双侧消息 |

例如参数为 20 Hz 时步长是 50 ms；若参数为 60 Hz，代码使用 16 ms，并不保留小数余量。后者是代码算例，尚未确认实机是否使用这一频率。同一秒内传感器列数发生变化时，也没有自动补齐各列表。

## 发布队列不能混用一条规则

| 项目 | Frank 压电链 | Capybara 附件链 |
| --- | --- | --- |
| 队列容量 | 16 条共享消息 | 正常注册构造为 1000 条 |
| 满队列 | 拒收新条目 | 配置为丢最旧条目 |
| 本层发送失败 | 保留当前条目重试 | 出队后记录异常，未在这层放回队列 |
| 返回含义 | 编码、入队、发布确认分层判断 | `PublishAsync` 入队返回同样不是 JetStream ACK |

Capybara 的 worker 在连接未打开时会跳过已出队条目。停止和取消也不保证排空成功。这里描述第一方调用层，不能替代第三方客户端内部重试或真实服务端接收记录。

## 姿态数组不是姿态标签

随包可选 `PostureTelemetryHandler` 能把 MEMS 数组按秒封装成 `raw.posture.mems`，但默认注册未启动这条服务。另一条 `DynamicModeService` 消费已经生成的姿态标签来选择气囊预设。两者之间的姿态分类实现仍未取得。

[完整输入、时间与队列证据](../../evidence/analysis/system-deepening-20261108/local-managed-telemetry/FINDINGS_ZH.txt) · [来源与原 DLL 核验](../../analysis-tools/system-deepening/local-managed-telemetry/SOURCE_LEDGER.json) · [7 个有限模型检查](../../analysis-tools/system-deepening/local-managed-telemetry/MODEL_RESULTS.json)
