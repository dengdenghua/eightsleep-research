# 心肺指标、分期与评分的客户端处理

这页讲手机怎样读取服务器结果、选择记录、计算图表范围，以及调整显示和提交编辑。官方国行 APK 里已经能追到这些操作的输入和输出，但还没有取得从传感器波形算出心率、呼吸、在床或睡眠阶段的完整程序。不能用通用滤波器、教科书 RMSSD 公式或论文模型填补这个缺口。

样本为 `7.63.5-cn-tencent`，4 个 DEX已完整提取，JADX有 350 个错误；下述关键条件与字段由 Smali 互证。方法锚点指现有分析工作区的反编译/Smali 文件，不是原厂源仓库行号。`S2` 指该包 `smali_classes2/`，`S1` 指 `smali/`；普通类省略 `com/eightsleep/` 前缀。少数巨型公共图表方法只恢复了明确调用段，没有声称整个 Canvas 或运行页面已验证。

## 1 请求、解析与缓存链

手机在这些页面收到的已经是指标和睡眠结果，不是原始压电波形。这一步负责读懂返回字段、存到本机，再交给图表。

睡眠链为 `MetricsTrendsRepository → pc.Z → Loc/c.d → GET trends`，使用 client-api；聚合链 `MetricsRepository.fetchAggregates → pc.B → Loc/b.a → GET metrics/aggregate?v2=true` 使用 app-api。两者的响应先进入缓存，再汇合成 `MetricContentData`，由 `BaseMetricChartViewModel.handleData` 调具体处理器。

```text
trends.days → pc.a0 → DailyTrendsResponse.toEntity → Room daily_trends
 → RawDailyTrends.a(displaySettings) → DailyTrends / Session
aggregate.periods → pc.C → xc.c.i → RawAggregatePeriod → AggregatePeriod
两路结果 + selectedSessionId + displaySettings
 → transformDayData / transformPeriodData → packageMetricData → UI state
```

锚点：`S2/pc/Z.smali:94–159` 为真实请求参数；`pc/a0.java:60–84` 为响应落缓存；`S2/BaseMetricChartViewModel.smali:3609、3733、3834` 分别为 transform、package、更新调用。此处输入已是服务结果，不能据 “data processor” 类名认定手机正在处理原始压电。

`TimeSeriesResponse` 的前五个列表必须存在（不能是 null），但列表里可以没有元素；`shortAwakes` 可 null，转空列表。单个 `MetricPointResponse` 的自定义 parser `nc/c.fromJson` 读取 JSON 数组：STRING 交 Instant adapter，NUMBER 交 Number adapter，结束时两种值必须都有。它没有严格限定两元素或顺序，重复同类 token 会覆盖已留存分析中值。其 writer 却写对象 `{dateTime,value}`，因此不能拿 writer 输出直接作为网络输入重放。

时间先用 `Instant.parse`，失败再将 ISO_LOCAL_DATE_TIME 按 UTC 解释；显示阶段转换为毫秒不改变 wire 是时间字符串的事实。锚点 `S2/nc/c.smali:100–226`、`TimeSeriesResponse.toDomain:132–267`。不同 health timeseries adapter 则严格按时间字符串、double 的二元数组读取，不能共用上述宽松规则。[心肺契约](../../evidence/analysis/android-findings/APP_CARDIORESPIRATORY_PIPELINE_ZH.txt) · [健康数组合同](../../evidence/analysis/android-findings/APP_SLEEP_HEALTH_RESULTS_ZH.txt)

## 2 心肺曲线、摘要与基准的字段来源

字段名字相似，不代表图表用的是同一组数。曲线、当晚摘要和比较基准也可能来自不同字段，不能拿曲线平均值替换摘要。

| 响应字段 | 领域转换 | 本版日图消费者 |
| --- | --- | --- |
| respiratoryRate | 数值转 Double | 已保存；不是已追呼吸率日图选择项 |
| nemeanRespiratoryRate | 数值转 Double | BreathRateMetricDataProcessor |
| heartRate | Number.intValue | RestingHeartRateMetricDataProcessor，再转 Double 图点 |
| hrv | 数值转 Double | 与 rmssd 分开保留，不能自动解释成 SDNN |
| rmssd | 数值转 Double | HeartRateVariabilityMetricDataProcessor |
| shortAwakes | Integer；null 列表转空 | 分期图的附加信息 |

三个 `transformDayData` 的完整 Smali 与 TimeSeries 构造参数已对齐：HRV 取 `Session.q.e`，呼吸取 `q.b`，心率取 `q.c`。这些方法没有按 `hrvAlgorithmVersion` 分支选择序列，也不从逐搏间隔重新计算 RMSSD。这里的 “nemean” 仅是已验证字段名，还没有实际计算方式的定义，不能自行展开算法缩写。

日图之外，摘要和基准又是另一组输入。`HeartRateVariabilityViewModel.packageMetricData` 与 `RestingHeartRateViewModel.packageMetricData` 的已恢复等价逻辑为：

```text
hrv_curve = selectedSession.timeseries.rmssd
hr_curve  = Double(selectedSession.timeseries.heartRate 的 intValue)
hrv_current = daily.sleepQualityScore.hrv.current
hr_current  = daily.sleepQualityScore.heartRate.current
hrv_baseline = aggregate.doubleAvg[HRV]，缺项用 0
hr_baseline  = aggregate.doubleAvg[HEART_RATE]，缺项用 0
range = 非 null 图点值的 min / max      # 不替代方法原有空值分支
hrv_comparison = current >= baseline
hr_comparison  = current <= baseline
```

所以摘要不是在这些方法中对日图做平均；缺省基准 0 也不是测得的正常生理基准。`AbnormalMetricResponse.toDomain` 直接带入 current、lowerRange、upperRange、lowerBound、upperBound、average、score、weighted、available、abnormality、inclusive7DayAverage；`available` 不是逐传感通道合格判据。HRV 页面随后格式化整数毫秒并选择 above/below 文案。

锚点：三个 `presentation_metrics/viewmodel/chartprocessors/*MetricDataProcessor.transformDayData`；HRV ViewModel `S2:215–309、380–577`；`AbnormalMetricResponse.java:209–220`；`P2/u.java:6007–6025`。有限历史读取另外确认 hrv 与 rmssd 的 311 个精确时间戳配对值全部不同，且有 hrv 无 rmssd 的点；这不提供两者公式。常见 300 秒输出间隔不等于 300 秒计算窗，也不能把缺点直接归因于运动剔除。[心肺处理与锚点](../../evidence/analysis/android-findings/APP_CARDIORESPIRATORY_PIPELINE_ZH.txt) · [去标识结构复核](../../evidence/analysis/account-readonly/history-behavior-followup/FINDINGS_ZH.txt)

## 3 阶段映射、首尾裁剪与显示时间轴

手机会缩短符合条件的首尾清醒或离床片段，再安排图上的时间位置。显示片段变短，不表示服务器重新判定了睡眠，也不表示总时长会同步改变。

`StageResponse` 是对象 `{stage,duration}`，stage 的 wire 值是 awake、rem、light、deep、out，duration 为整数秒。缺字段或 null 会报错；未知对象键跳过。OUT 虽与 AWAKE 可共享显示文字，仍是独立协议标签。DTO 未消费逐段 confidence、probability、epoch、start/end，不能把枚举 ordinal 当网络编码，也不能据时长字段推导固定推理 epoch。

`SessionResponse.toDomain` 的实质变换只针对首尾两段：

```text
for i, stage in enumerate(wire_stages):
    d = stage.duration
    if (i == 0 or i == last) and stage.name in {AWAKE, OUT}:
        d = min(d, 600)
    output.append(stage.name, Duration.ofSeconds(d))
# 原 session.duration、stageSummary、score、timeseries 独立传递
```

没有 `max(d,0)` 下界，不能转写成 `[0,600]` clamp；只有一段时不重复裁剪。其他位置的 awake/out 不受这条规则影响。`SessionStageSummaryResponse` 的 total、sleep、out、awake、light、deep、rem、睡前/中/后 awake、wasoDuration 和百分比分别转换，未根据裁剪列表重算。锚点 `S2/SessionResponse.smali:1877–2174`。

阶段图处理器构造 `StagesHypnogramUiModel`：

```text
anchor = session.sleepStart ?? session.ts
end    = session.sleepEnd ?? (session.ts + session.duration)
values = 已经映射的 session.stages
附带 session.timeseries.shortAwakes
```

end 的 fallback 以 ts 为起点，不是 sleepStart。触摸提示在 `Cg.o0` 又使用另一套累加，保留代码原式：

```text
pre  = first(stage) 若标签为 AWAKE 或 OUT，否则 null
rest = pre 存在 ? stages.drop(1) : stages
i == 0: start = anchor - (pre.duration 或 0)
i > 0 : start = anchor + sum(rest.take(i - 1).duration)
end = start + stages[i].duration
```

常见首段 awake/out 被放在 sleepStart 之前。无 pre 时仍是 `take(i-1)`，不能擅自改成理想的通用累计公式；所有异常数据与绘制分支尚未运行验证。锚点 `SleepStagesMetricDataProcessor.smali:73–157`、`S2/Cg/o0.smali:593–752`。[阶段解析与显示](../../evidence/analysis/android-findings/ANDROID_SLEEP_RESULTS_ZH.txt)

有限历史的未裁剪 wire 列表，以 ts 起始累计可同时满足总长=presenceEnd−ts、首段=sleepStart−ts、末段=presenceEnd−sleepEnd 三个检查；这仅验证这批记录的候选 wire 轴，不替代上面的手机显示轴。107 个阶段正整数时长的公约数为 30 秒，仍不是生产模型固定 30 秒 epoch 的证明。session.duration 与阶段和有差异，不能直接当损坏。[历史边界检查](../../evidence/analysis/account-readonly/history-behavior-followup/FINDINGS_ZH.txt)

## 4 会话选择、编辑与结果刷新

切换睡眠记录主要改变要显示哪条曲线；编辑则会把用户指定的时间发回服务器。手机并没有在这些操作中自行重新判断深睡、浅睡和快速眼动睡眠。

首页 `P2.I.H(daily,selectedId)` 先找用户所选 id，再回退服务器 mainSessionId；不把多段 stages 拼接，也不以最长时长选主会话。分期详情 `SleepStagesViewModel.getSleepStageBreakdown` 未匹配时却回退首个 session。两页选择器不同，应分别还原。

首页同图旁的 Deep/REM 小结来自日级 SQS，局部比例为 `round((阶段日时长/日总睡眠秒数)*100)/100`，再与 0.15/0.20 比较形成 UI Boolean。切换会话改变曲线，不在这条链重算全天总分；详情则读取所选会话 stageSummary。锚点 `chart-selection-smali1/2` 与 `breakdown-fallback-smali:182–328`。

编辑器要求 incomplete=false 且四时刻所需字段齐全；processing 不是此处的筛选条件。时序校验允许相等，要求不在未来、在构造的日期界限内，离床距当前至少五分钟。保存的生产请求在 `S2/pc/m0.smali:107–207` 中构造：

```text
ts = 用户入床时刻
stages = [
  {stage:"awake", duration:seconds(入床→入睡)},
  {stage:"asleep",duration:seconds(入睡→醒来)},
  {stage:"awake", duration:seconds(醒来→离床)}
]
PUT intervals/{sessionId}
成功后从缓存定位所属日期 → GET trends(consistent-read=true)
 → 替换返回日数据 → 刷新聚合
```

请求是粗睡眠区间，`asleep` 不是响应的 light/deep/rem 标签。PUT 返回 Unit，不返回本地算出的新分期；若 PUT 成功但缓存找不到 session，后续仍可报错，不能从 UI 错误推断服务端未改。DELETE 和 `{edit:"stop"}` 各有独立链，成功后也刷新结果。后台是否重跑模型、如何改分数和是否影响训练，均未知。[编辑、选择与刷新](../../evidence/analysis/android-findings/APP_SLEEP_EDIT_AND_SELECTION_ZH.txt)

## 5 SFS、SQS 与 SRS 的消费者边界

这些页面主要拿服务器给定的分数来显示，再按阈值决定提示。已查到的显示比较，不能代替服务器生成总分的公式。

`DailyTrendsResponse.toDomain` 读取 score、sleepQualityScore、sleepRoutineScore，`RawDailyTrends.a` 继续传递。`SleepFitnessScoreMetricDataProcessor.transformDayData:20–39` 把这些总分和已有权重/子分数字段打包，`>=80` 只产生显示 Boolean。

SQS 的 Java toDomain 反编译失败，已核完整 Smali `1370–1627`：total 从字段读入，直接作为 `SleepQualityScore` 构造器首参；SRS 的 toDomain 同样传 `this.total`。已追链没有执行 `SFS=w1*SQS+w2*SRS` 这样的总分公式，不能因 DTO 有 weighted 字段而补出权重组合。显示比例、阈值与服务端评分需要区分。[评分消费代码](../../evidence/analysis/android-findings/ANDROID_SLEEP_RESULTS_ZH.txt)

SRS 在这里是 **Sleep Routine Score**（睡眠规律评分），不能译成恢复分数。已有专题材料没有闭合独立 Recovery score 的生产公式；不能把 HRV 高于基线的显示比较当成恢复度模型。若要继续解释某个恢复页面，应先取得对应 DTO、实际入口和消费者，再确认它是否独立计算，而不是沿名称补算法。

## 6 基线、异常标志与界限序列

比较基准、上下界和异常标志都可能已经由服务器给出。这里要区分“读入并显示一个值”与“在手机上重新计算这个值”。

`trends.days[].health.wellbeing.abnormalities` 分 hr/hrv/rr。`WellBeingDetailStatsJsonAdapter.fromJson` 的八字段是：

| 字段 | 已恢复读取规则 |
| --- | --- |
| value、dayOfWeekAverage | double，必须存在且非 null |
| isAbnormal | boolean，必须存在且非 null |
| probability、dayOfWeekStdDev、dayOfWeekDeviation | nullable Double |
| abnormalLowerBound、abnormalUpperBound | nullable Double |

完整 Smali `180–449` 是读取、必需值检查、构造 DTO，没有用 value/StdDev 在这里算 isAbnormal。`HealthCheckHomeViewModel.updateContent` 的 `2512/2518、2643/2649、2774/2780` 读取 hr/hrv/rr 的 value 用于显示。精确直接引用的有界检查不支持在此链本地更新星期均值；也不能由字段名推断 EMA、z-score 或固定七天历史窗。[基线解析](../../evidence/analysis/cloud-cleaning-followup/code-only/APP_BASELINE_CODE_ZH.txt)

界限图走另一条聚合链：HealthCheckHome 的默认调用带 `flags=0xE`，`P2.c.y` 选择全 AggregateMetricType 和 WEEK；缓存条件决定是否发请求，不是每次打开必请求六项。wire name 经 `AggregateStatisticResponseAdapter` 匹配枚举，DoubleStatistic.value 进入 `Sample.double map`。三个完整 `transformPeriodData:66–109` 实际相当于：

```text
hr_upper = Sample.double[WELLBEING_HR_UPPER]
hrv_lower = Sample.double[WELLBEING_HRV_LOWER]
rr_upper = Sample.double[WELLBEING_RR_UPPER]
# Sample 或 key 缺失 → null；否则原 Double + 日期包装成图点
```

这些键对应 wellbeing_hr_upper、wellbeing_hrv_lower、wellbeing_rr_upper，不是在三个处理器中由 hr/hrv/br 算出。另一个 aggregate.stdDev 缓存存在缺省 0 与合并，不能套到这里的 Sample map。完整请求、parser、map 与消费者分别留有锚点。[界限序列调用链](../../evidence/analysis/cloud-cleaning-followup/code-only/aggregate-boundary/AGGREGATE_BOUNDARY_CODE_ZH.txt)

## 7 心搏、呼吸干扰与打鼾统计

有些图会把同一小时的返回值相加，有些直接读取汇总结果。缺少某小时的数据时，显示准备代码可能填零，但这不证明那个小时真的没有异常。

`HeartbeatDisturbancesMetricDataProcessor`、`BreathingDisturbancesMetricDataProcessor` 的 day 处理先选 Session，取起点和 duration，按完整小时数创建输出桶；输入却是日级 health.timeseries。各点按手机本地小时 0–23 分组，不带日期键，也未在该方法按所选 session 完整区间过滤：

```text
hours = wholeHours(session_start, session_start + duration)
group[h] = 所有输入中 localHour(timestamp)==h 的 value 总和
for i in 0 .. hours-1:
    t = session_start + i hours
    v = group[localHour(t)]，无组时 0.0
    good = v <= 3.0  # heartbeat
    good = v <= 14.0 # breathing
```

末尾不足一小时不增桶；跨日相同小时可归同组。它是按代码推导的行为，不是已复现实机错误。心搏显示单位为百分比，呼吸为每小时，不能把两个阈值都读成事件次数。period 图缺值保留 null，headline 又直接读 health.value，未按上述图点求和；摘要卡片看返回 rating==inRange。多套 UI 规则不能混成一个后台异常算法。

打鼾日图接收 none/light/medium/heavy 与 duration 秒数，`Tb.a.m0` 从 Session 起点按顺序累加片段。期间图以聚合总量减 HEAVY 得 LIGHT，减法后未 clamp。summary 来自 SQS.snoringDurationSeconds.current，DAY 基线取 inclusive7DayAverage，其他周期取 durationAvg[SNORE]；比例除 100，`<=0.1` 是显示比较。缓解次数和 reduction 字段主要来自返回值；计数>0 产生文案，不构成缓解有效性算法。锚点：两个干扰处理器 `S2:76–423`、`S2/Tb/a.smali:7598–7713`、`SnoringViewModel.smali:277–476`。[健康、打鼾与缓解细节](../../evidence/analysis/android-findings/APP_SLEEP_HEALTH_RESULTS_ZH.txt)

## 8 合成示例：显示差异与字段边界

下面均是由已恢复分支手工推导的示意输入，不是用户健康数据，也没有运行原厂 APK。用途是解释同一个页面为何可能出现曲线、摘要、总时长不一致，不能用来评价设备准确率。

### 阶段裁剪与总时长

先看手机缩短首尾片段之后，列表长度与图表位置如何变化。总时长字段来自哪里，仍需单独看，不能拿图形长度替它作答。

假定 wire 阶段依次为 awake 900 秒、light 1800 秒、awake 1200 秒；以 ts 为相对零点，sleepStart 为第 900 秒、sleepEnd 为第 2700 秒、presenceEnd 为第 3900 秒。

| 层次 | 此示例得到的结果 |
| --- | --- |
| wire 阶段 | 900＋1800＋1200＝3900 秒 |
| mapper 后阶段 | 600＋1800＋600＝3000 秒 |
| 图表模型 anchor / end | 第 900 秒 / 第 2700 秒 |
| 触摸首段 | 第 300 秒至第 900 秒 |
| 触摸中段 | 第 900 秒至第 2700 秒 |
| 触摸末段 | 第 2700 秒至第 3300 秒 |

这个推演同时保留三个不同对象：未裁剪列表、图表模型边界、触摸片段。不能用其中一个总长度覆写其他字段，也不能称 900 秒差值为“服务器丢掉了数据”。session.duration 与 stageSummary 在此没有给定数值，仍应由各自输入提供；不能偷偷令它们等于任一阶段和。具体 Canvas 是否裁剪、隐藏或怎样布局超出这个已恢复触摸公式。[公式依据](../../evidence/analysis/android-findings/ANDROID_SLEEP_RESULTS_ZH.txt)

### 小时分组、缺值与真实零值

把读数分到小时组之后，程序可能给没有输入的组填零。这个零是程序补的默认值，不能直接当成一次真实测量。

假定选中会话从本地 23:30 开始，duration 为两小时三十分钟。day 干扰处理器只创建 23:30 与次日 00:30 两个输出点，不额外创建尾部半小时点。若输入有 23:05 与 23:55 两点，它们按小时键都归到 23，值相加后用于第一个输出点；这个方法不因前者早于会话起点而排除它。

若输入还包含另一天的 23 点记录，同样会进入小时键 23。这不证明真实服务一定会给出跨日混合输入，只说明客户端这个方法需要上游时间范围约束才能避免混合。若某小时根本没有输入，代码走零值；若选中会话本身缺失或无起点，则处理器可以直接返回 null。缺 health、空列表、无小时组与真实零数值应在分析里分别记录，不能拿输出零反推“未检测到异常”。headline 及最终 UI 遮罩又有自己的可用性分支，静态产出图点不等于已观察到屏幕显示。[桶和空值依据](../../evidence/analysis/android-findings/APP_SLEEP_HEALTH_RESULTS_ZH.txt)

### 曲线、摘要与基准的独立来源

一张页面可以同时显示来自不同统计范围的数据。复算时应分别使用每项原来的输入，不能把它们强行拼成同一个平均公式。

在日图中选出一组 RMSSD 点，只能复算该图的点集与 min/max；不能拿其算术平均替换 SQS.hrv.current，再声称复现了原厂摘要。基准来自 aggregate.doubleAvg，图点来自 session.timeseries，二者时间范围与汇总定义尚未由实际使用的实现闭合。

同理，打鼾日图的片段累计只复现显示轴，不能代替 SQS 的 snoringDurationSeconds.current。期间图的 LIGHT＝总量−HEAVY 也只是此处理器的公式；如果输入不一致，它没有额外 clamp，不应在分析者复现中悄悄把负结果改为零。若要验证“原厂同样处理”，还需要对应版本真实响应及实际消费者，而不是只运行一个更合理的自写算法。[心肺摘要](../../evidence/analysis/android-findings/APP_CARDIORESPIRATORY_PIPELINE_ZH.txt) · [打鼾期间处理](../../evidence/analysis/android-findings/APP_SLEEP_HEALTH_RESULTS_ZH.txt)

## 9 processing、校准等待与反馈状态

这些字段告诉页面该显示哪种状态，或记录用户的看法。它们不等于手机正在训练模型，也不等于程序已经给传感信号算出了质量分数。

`DailyTrends.a()` 找第一个 incomplete session，`d()` 找第一个 processing session，`c()` 则按 mainSessionId 匹配。首页一旦有 incomplete 会话便进入 EndTracking 分支；横幅可使用首个 incomplete 的更新时间和时长，曲线仍按用户已选 id 找 session。因此横幅与曲线对象不必相同，不能凭页面拼接推导一条统一的实际使用的算法时间轴。

普通结果分支只在 `daily.processing=true` 且存在 processing 会话时，给处理提示设置该会话的 deviceTimeAtUpdate；否则该提示字段为 null。已存在 Java 反编译条件方向错误，Smali 的 if-eqz 分支才是这里采用的依据。`processing` 只是返回状态及显示条件，不证明某种模型正在手机运行。后续历史样本的 processing/incomplete 字段缺失，也不能因客户端默认转换就写成服务器明确返回 false。[状态选择锚点](../../evidence/analysis/android-findings/APP_SLEEP_EDIT_AND_SELECTION_ZH.txt) · [字段缺失实况](../../evidence/analysis/account-readonly/history-behavior-followup/FINDINGS_ZH.txt)

健康 wellbeing 的 value、rating、ranges、abnormalities、dayCount、daysUntilAvailable、daysUntilCalibrated 分别保存。`HealthCheckHomeViewModel.updateContent` 在 daysUntilAvailable>0 时构造 Pending，并非在手机训练模型或计算“还需几天校准”。daysUntilCalibrated 的完整消费者未闭合，不能从它已进入 DTO 推出实际校准进度计算。rating 的 inRange/outOfRange/unknown 是明确 wire 枚举；unknown 不自动证明任意非法字符串都会被容错接受。[等待状态](../../evidence/analysis/android-findings/APP_SLEEP_HEALTH_RESULTS_ZH.txt)

`MetricsHomeViewModel.selectFeedback` 的正向分支写 `dataQuality="high"`，负向分支写 `"low"` 并附用户问题回答。`Im.G.x` 从主 session 拿三种算法版本，加入 complete、processing、lagMinutes、remainingProcessingTime、sfsCalculator 等元数据，最后向 feedback 提交。它没有从压电通道计算信噪比、概率或有效覆盖率；反馈成功回调也不返回新的阶段数组。

研发 truth tags 的 presence-in、presence-out、going-to-bed 由界面动作加当前时刻创建，编译默认隐藏。可以说客户端具备标签提交能力，不能由此断言这些标签一定用于某种监督训练、立即校准设备或具有医疗参考标准。后续要追的是服务端标签消费链与版本对应，而不是把反馈字段的“质量”字样接到传感器质量评分上。[反馈和标签的实际生产者](../../evidence/analysis/android-findings/APP_SLEEP_FEEDBACK_ZH.txt)

## 10 算法版本与实现缺口

现在有版本编号和结果字段，但没有对应的完整计算程序。下面列出还缺哪些材料，才能从“知道输出是什么”继续走到“知道它怎样算出来”。

有限本人历史 session 实际返回 sleep=0.1.1、presence=3.2.1、hrv=1.2.0。顶层 modelVersion=v3、sfsCalculator=v3.2 属于另两类元数据，请求还指定 v3。已见反馈将版本带回服务器，但没有按版本选择或下载本地模型的生产者链。[历史版本](../../evidence/analysis/account-readonly/historical-version-probe/FINDINGS_ZH.txt) · [版本反馈](../../evidence/analysis/android-findings/APP_SLEEP_FEEDBACK_ZH.txt)

| 实现缺口 | 必须取得的具体内容 |
| --- | --- |
| sleep 0.1.1 | 输入通道/特征、归一化、窗口和步长、模型结构/权重、stage 映射、置信度、时序平滑、跨段规则 |
| presence 3.2.1 | 传感输入、阈值/模型、滞回、进入退出延迟、体动/静卧区分、双人及附件误触发规则 |
| HRV 1.2.0 | 心搏检测、逐搏间期、异常搏剔除、缺样和重采样、计算窗口、有效性门控、hrv 与 rmssd 各自定义 |
| 共用质量与融合 | 各通道物理标定、SNR/质量评分、权重、切换/融合条件、时钟与缺点对推理的影响 |
| 评分与基线 | SFS/SQS/SRS 组合、历史窗口、统计状态更新、异常界限、跨会话/跨日聚合和编辑后的重算规则 |
| 部署对应 | 字段版本→服务程序/模型 hash→当前硬件/固件适用分支 |

以上是待取材料清单，不是已恢复的参数名或确定模型架构。旧 batching、论文、通用算法与生产字段尚无官方交叉对应；不能拿研究版本替代这些空白。[版本谱系边界](../../evidence/analysis/account-readonly/version-lineage-followup/FINDINGS_ZH.txt)

下一步按材料推进：先解析已申请的实际导出，确认是否含原始波形或仅结果；有真实采集与标定后才能量化前端变化；获得带版本的逐搏/特征材料后才能解释 HRV 缺点；取得生产部署物后才能逐函数恢复分期、在床、评分和基线生成。继续追一般绘图库不会自动补出缺失的生理生产者。
