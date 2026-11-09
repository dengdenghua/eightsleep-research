# 客户端解析、缓存与显示

本页梳理国行 App 的结果读取、缓存、图表转换、事件消费和离线控制入口，并区分客户端处理与服务端算法。

官方国行 App 负责账号入口、云端结果读取、缓存、显示、用户反馈和设备控制。已追到的睡眠与心肺页面接收的是成品指标；手机同时执行裁剪、分组、转换和状态判断，不能称作完全不处理数据。

## 样本与覆盖

分析包为 `com.eightsleep.eight 7.63.5-cn-tencent`，versionCode `1007063005`，151778699 字节。应用宝发行页面、官方发行主体链、下载摘要与 APK v2 签名已留档。4 个 DEX 和资源完成提取；JADX 有 350 个错误，Java 是部分反编译表示，关键请求、枚举和分支另以 Smali 核验。[分发来源](../../evidence/analysis/sleep-pipeline/OFFICIAL_DISTRIBUTION_FOLLOWUP_ZH.txt) · [运行与覆盖](../../evidence/analysis/android-findings/APP_RUNTIME_AND_HARDWARE_ZH.txt)

本包是跨机型客户端。Pod5/Pod6 的显示取决于附件 generation 和能力回退，不能用页面名鉴定 MTK 主板。Spline 原生库入口主要连接渲染；`libjutils` 的已追调用进入极光 SDK，尚未连接到压电、分期或目标温度。这些局部结果不能排除所有 JNI、反射或运行期替换代码。[原生入口](../../evidence/analysis/android-findings/APP_NATIVE_ENTRY_BOUNDARY_ZH.txt)

## 输入输出与实现链

```text
账号授权 → 对应区域 API → Retrofit / Moshi 响应
  → Repository → Room 或内存缓存 → 领域对象
  → 会话选择 / 图表转换 → ViewModel → 界面
用户动作 → use case → 云端请求或有条件的 Backup BLE
```

本国行包的环境 provider 返回 CHINA，构造 `auth-api-proxy`、`client-api-proxy`、`app-api-proxy` 三类服务，域为 `8slp.net.cn`。账号授权、App 用户、家庭和设备选择是不同层次；本项目只保留无身份的结构，不附带登录凭据或可执行登录入口。[区域绑定](../../evidence/analysis/android-findings/APP_RUNTIME_AND_HARDWARE_ZH.txt)

冷启动静态链已接通：本地中国版 consent 两个版本先匹配 APK 常量 `2026-01-15`，再进入普通启动。`ensureAppUser` 先读本地用户，失败才远端获取；这条路由中的 `fetchRemoteOnboardingState(userId,false)` 也先读 DAO。之后由家庭摘要、设备、订阅和功能开关决定进入配对、注册、DynamicHome 或 PodControls。缓存齐备存在本地推进路径，但尚未验证当前账号断网时能抵达控制页。空 token/鉴权缓存异常与普通网络不可达不能混同。[冷启动与门控](../../evidence/analysis/finishable-20261107/app/c04/FINDINGS_ZH.txt)

## 图表中哪些是手机算的

| 内容 | 输入 | 已恢复的手机处理 |
| --- | --- | --- |
| 睡眠阶段 | awake / rem / light / deep / out 与秒数 | 仅首尾 awake/out 各取 min(duration,600)，标签保留；stageSummary、原 duration、score 独立传递 |
| 心率 | heartRate 时间序列 | 数值转换、选会话、范围与显示格式 |
| HRV 日图 | rmssd 时间序列 | 图表 min/max、显示；摘要和基准来自另外的返回字段 |
| 呼吸率日图 | nemeanRespiratoryRate | 时间与数值包装；不是从压电重新提取呼吸 |
| 健康干扰图 | 已计算的 health timeseries | 按本地小时分组求和、比较显示阈值；不是原始心搏/呼吸检测 |

这些链都有输入、调用者和消费者证据。日图、期间图、摘要卡片的缺值和阈值语义不同：例如某些健康日图缺小时可形成 0，而摘要仍可空；不能把显示 0 一律当实测零事件。分期图也不能直接代替未裁剪的 wire 时间轴。[睡眠结果](../../evidence/analysis/android-findings/ANDROID_SLEEP_RESULTS_ZH.txt) · [心肺字段选择](../../evidence/analysis/android-findings/APP_CARDIORESPIRATORY_PIPELINE_ZH.txt) · [健康结果](../../evidence/analysis/android-findings/APP_SLEEP_HEALTH_RESULTS_ZH.txt)

五个公共方法的静态行为如下。`BaseMetricChartViewModel.handleData` 将 WEEK 排成7个日期、MONTH排成31个日期；缺日期仍调用具体 processor，但传入 `sample=null`，并非统一补0。半年/部分年图按周建桶，默认年图按月份建桶，同桶后项覆盖。图表同周期刷新还会保留未返回的旧日期。[四个图表入口与 Canvas](../../evidence/analysis/finishable-20261107/app/charts/FINDINGS_ZH.txt)

`xc.c.i` 的数据库合并另有规则：新指标覆盖同键、未返回指标保留旧值，`samples` 整组取新；`stdDev` 仅在已有同日缓存合并路径先补请求指标0，再合并旧值与新值。成功空响应且截止日期不晚于手机今日时，会插入/替换空占位，可能覆盖旧缓存；未来空响应不写。[聚合缓存解析](../../evidence/analysis/finishable-20261107/app/metrics-aggregate/FINDINGS_ZH.txt)

阶段条按输入顺序与时长绘制，秒值先转浮点再归一化；OUT与AWAKE共用绘图行，不改写业务阶段。温控回顾会为OFF事件合成折线点，阶段选择主要改变颜色。鼾声图可追加本地 `NONE` 段，并按列表时长累计绘制，因此图上的空白不能一律当作设备直接检测的结果。[显示层补点和阶段高亮](../../evidence/analysis/finishable-20261107/app/charts/FINDINGS_ZH.txt)

## 事件如何进入界面

alarm事件已追到实际缓存和UI消费：SNOOZE先将已有记录 `isSnoozing=true`；DISMISS先清空 `nextTimestamp/endTimestamp`；随后两者都回源获取用户闹钟并更新Room。UI的active判断要求enabled且当前时间在next/end之间，缺时间为false。本地事件处理不是再次向设备发送停止命令。`base-preset` 可解析并进入分发流，但对四DEX的类型、通道和SharedFlow直接消费者核对中没有找到业务/UI消费，结论仅限本包静态通路。[事件链与检索台账](../../evidence/analysis/finishable-20261107/app/app02/FINDINGS_ZH.txt)

## 编辑与反馈为何不能当算法源码

用户编辑入床、入睡、醒来、离床四时刻，App 生成 `awake/asleep/awake` 三个粗区间并提交，然后刷新 trends 与汇总。它不会在这条链本地生成新的 REM/light/deep。首页选会话主要是本地状态；服务端主会话和日汇总仍有独立来源。删除或停止的请求语义也与编辑不同。[编辑与会话选择](../../evidence/analysis/android-findings/APP_SLEEP_EDIT_AND_SELECTION_ZH.txt)

反馈的 `dataQuality=high/low` 由用户正负反馈分支写入，附带算法版本和处理元数据；它不是实时信噪比。研发 truth tags 有 `presence-in`、`presence-out`、`going-to-bed` 创建链，编译默认隐藏，实际开关与后台训练使用未知。[反馈与标签](../../evidence/analysis/android-findings/APP_SLEEP_FEEDBACK_ZH.txt)

## 离线密钥与控制边界

OfflineRepository 的密钥缓存写入 Room，并由 AndroidKeyStore 的 AES-GCM 保护。已有但过期的缓存触发后台刷新，同时仍返回旧缓存；操作执行器只检查 key 是否存在。旧密钥必须仍与主机匹配。无缓存、解密失败等恢复分支需 BLE nonce 与云端取钥，因此“已登录过”不能推出永久离线。[离线分支](../../evidence/analysis/device-side-followup/offline-boundary/FINDINGS_ZH.txt)

已核对功能开关→设备能力→系统状态→备用命令链：`canRunOfflineCommandFlow` 还排除特定固件版本字符串和旧代际；直接BLE与云请求失败后的fallback使用不同条件。退出/空token观察链先清包括 `offline_mode_data` 的Room表，再清BLE外设与内存，异常或取消可中断后续步骤；普通断网和正常后台/销毁入口不能等同退出清库。[生命周期](../../evidence/analysis/next-round-20261107/app-lifecycle/FINDINGS_ZH.txt) · [门控互证](../../evidence/analysis/finishable-20261107/app/c04/FINDINGS_ZH.txt)

## 未完成与下一步

- APP-01：在可用手机/设备上验证已缓存、过期、冷启动、登录失效等离线状态矩阵；记录 UI 和实际动作是否一致。
- APP-03：把当前实机功能开关、App 版本与引导流程对应起来；Pod5 类名与校准阈值不直接推广到 Pod6。

APP-02限定静态验收已完成：alarm消费者、base-preset直接消费边界、四个图表函数及 `xc.c.i` 缓存合并均有报告。后续真实响应重放应检查阶段/鼾声总时长不一致、缺日期、恒值轴和OFF乱序等情况；当前只有合成公式模型，没有将这些边界声明为实机已复现故障。

## 本地计算分析

[健康、潮热与午睡](../algorithms/local-app-processing.md)补齐字段消费者、统计范围、缓存、控制请求和倒计时。每一项注明输入来自何处，避免将手机汇总误认为生产睡眠算法。
