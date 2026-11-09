# 实时事件路由与连接边界

设备自动采样、上传，与本地工具订阅云端 live 事件是两个过程。官方 App 不需要提供“开始采集”按钮；项目页面中的“开始采集／重新采集”仅发起一段有时限的读取，不启动或停止床垫传感器。

## 已知状态

| 证据 | 结果 | 可支持的结论 |
| --- | --- | --- |
| 用户提供的设备页面 | Pod6 在线；30 秒等待 HTTP 响应，状态为空、零字节、零事件 | 该次读取未取得响应头，失败发生在事件解析之前 |
| 用户反馈 | 官方 App 可以正常调温 | 控制功能可用；尚不能确认与 live 共用相同传输路径，也不能证明 raw 上传或 live 转发成功 |
| 无 Authorization 的实际请求 | 官方主机根路径及本人设备 live 路径均返回 HTTP 401 | 未登录请求能够得到访问拒绝响应；不能据此判断登录后的 live 转发 |
| 原始 JavaScript 方法的隔离验证 | 7 项通过 | 确认指定输入下的手势筛选与发送行为，不代表实机运行结果 |

网络对照分别使用不显式配置代理的 `http.client` 和采用系统代理配置的 `urllib`。根路径返回耗时为 0.44／0.51 秒，live 路径为 1.27／1.28 秒。所有请求均未带账号令牌、未自动重试。VPN 或透明代理仍可能影响两种方式。该对照没有复现经过鉴权后的请求，因此不能将问题归因于代理，也不能排除代理对长连接的影响。

## 设备侧三条独立业务路径

| 路径 | 已恢复实现 | 与当前问题的关系 |
| --- | --- | --- |
| 控制命令 | `device_api.js` 注册 `/f`，经函数回调交给 Frank | 接收控制命令；不等于订阅传感事件 |
| 手势事件 | Frank 变量 → DAC `processGesture` → `DeviceApiClient.doubleTap` 等方法 | 有增量筛选、连接绑定和发送条件 |
| 压电等 raw 数据 | Frank → 本地 NATS → uploader → 云端 | 独立的 CBOR 批次上传链；普通账号 live 是否取自此流尚未确认 |

`/E/gesture/doubletap`、`/E/gesture/tripletap`、`/E/gesture/quadrupletap` 是设备协议内的路由，不能直接当作账号可调用的 HTTP API。服务器怎样把这些路由或 raw 数据映射成 App 的 `piezo`、`tap`、`button`，仍缺实现证据。

## 手势事件何时发送

冻结 MTK 样本中的 `LoopCoordinator.frankenLoop` 每次先等待 1000 毫秒，再通过本地 socket 的 `PLEASE_SEND_VARIABLES` 获取变量，随后调用 `processTTC`。实际间隔还包括通信和处理耗时；这个间隔不是压电采样频率。

`processTTC` 对 doubleTap、tripleTap、quadTap 分别调用同一套 `processGesture`。其行为如下：

1. 首次读取只保存基准状态，不发送事件。
2. `l`、`r`、`s` 中至少一个值大于基准时，才进入通知分支；相同值不重复发送。
3. 发送对象保留增加字段的新绝对值。例如 `l:12 → l:15` 发送 `l:15`，不是 `l:3`。此处不假定字段单位或将它解释为敲击次数。
4. 所有字段均未增加时，不更新基准。因此仅发生下降的快照也不会替换基准。
5. 通知函数未绑定时，`tryNotifyDoubleTap` 直接返回，调用者仍会更新基准；之后重新绑定且数值不变，不会补发这一状态。
6. 通知函数抛错时，基准赋值语句没有执行；外围重连与状态恢复的实际结果仍需运行记录。

`deviceApiLoop` 成功连接后绑定通知函数，连接异常时清除绑定。上述实现说明手势通道不是历史事件重放接口；它不能解释压电 raw 的保留或重传策略，也不能单独证明当前 HTTP 等待由漏发手势造成。

## App 端订阅条件

已恢复的启动分支为 `TestDriveViewModel → Ja.U → Da.K.b → Da.E`，使用 GET `/v1/devices/{deviceId}/live`，携带 access token 和 `Accept: text/event-stream`。该分支未见额外启动采样的 POST 请求。`Pod6SoloCoverOnboardingViewModel` 也消费同一事件流用于安装检测；这不证明接口会对所有已绑定设备持续开放整夜波形。

App 的连接状态标记不能代替 HTTP 状态与首条事件记录。本地工具只有取得响应头后才能确认 HTTP 返回；零字节且状态为空不应写为“连接成功、没有数据”。[App 消费链](../evidence/analysis/android-findings/APP_LIVE_SENSOR_EVENTS_ZH.txt) · [工具诊断](live-capture-tool.md)

## 实机验证计划

| 分析目标 | 前置条件与操作 | 验收标准 | 状态 |
| --- | --- | --- | --- |
| 区分无响应头与空事件流 | 在项目本地页面选择绑定设备，手动读取至多 60 秒；记录是否处于安装检测页面及床上活动情况 | 保存元数据中的 phase、HTTP 状态、耗时、字节数；有事件时另存 JSONL | 待实测；未确认用户执行了 60 秒读取 |
| 对照官方 App 的 live 请求 | 取得用户授权的手机 App 运行时网络记录，覆盖已有检测入口；不重置配网 | 对照实际 host、path、必要请求头、响应状态、首字节时间与事件类型；不公开凭据或设备标识 | 缺运行时记录 |
| 确认原始数据上传与订阅的对应关系 | 取得主控本地访问或官方导出中的原始记录 | 对照上传时间、topic、时间戳与 live 消息，确认转换、筛选、降采样及缺失 | 缺主控访问及服务器映射 |

设备已在线且 App 可调温，不再以“先开机”作为当前排查前置条件。延长一次观察窗口只能验证等待行为，不能代替根因证据；无新增状态时不持续重试。

## 可复核证据

- [源码与哈希](../analysis-tools/live-event-routing/SOURCE_LEDGER.json)：三个文件与冻结 ZIP 内对应成员、原始提取清单的 SHA256 一致。适用范围是该固件样本，尚未证明与实机固件完全相同。
- [loop_coordinator.js](../analysis-tools/live-event-routing/source/loop_coordinator.js)：`deviceApiLoop` 第 263 行、`processGesture` 第 428 行、`frankenLoop` 第 448 行。
- [device_api.js](../analysis-tools/live-event-routing/source/device_api.js)：`doubleTap` 第 171 行；[franken_server.js](../analysis-tools/live-event-routing/source/franken_server.js)：`getVariables` 第 40 行。
- [验证脚本](../analysis-tools/live-event-routing/verify_events.cjs)与[7 项结果](../analysis-tools/live-event-routing/METHOD_VERIFICATION.json)：执行抽取的原始方法，使用模拟状态及发送器，不启动原厂服务或连接设备。
- [HTTP 观测](../analysis-tools/live-event-routing/NETWORK_OBSERVATION.json)：仅记录未登录请求的状态与耗时，无账号凭据、设备标识或代理地址。
