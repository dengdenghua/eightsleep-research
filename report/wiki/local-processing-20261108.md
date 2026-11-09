# 信号处理与算法

本页汇总设备端、手机端和云端接口涉及的信号处理与算法，并区分已恢复实现与尚缺实现的环节。

## 处理位置与证据边界

| 处理位置 | 已确认内容 | 尚未确认内容 |
| --- | --- | --- |
| 设备端（MCU / 主控） | 前端滤波与增益、数值换算、缓存与组包、时间整理与补点、机械校准、温控与运动闭环 | 心搏/呼吸分离、双人融合、在床检测和睡眠分期的生产实现及部署位置 |
| 手机端（App） | 云端结果解析、阶段裁剪、部分汇总计算、趋势和显示 | 不能由客户端消费代码反推出上游生理算法 |
| 云端服务 | 接收上传；结果接口交付心率、呼吸、HRV、在床、分期及相关版本字段 | 波形到结果的内部算法、模型、清洗与融合规则，以及与设备端的具体计算分工 |

**云端返回结果，不等于已经证明整条算法链全部在云端执行。** 已恢复的本地处理与云端接口证据分别列出；未取得的生产实现保留为缺口。详见[生理指标与睡眠分期](modules/physiology-algorithms.md)、[云端接口与结果契约](modules/cloud-api.md)和[Autopilot 目标生成边界](modules/autopilot.md)。

原始文件入库、函数反编译、调用链解释和实机启用确认分别记录，不能用同一个覆盖率代替。

[总验收与具体残余](../evidence/analysis/system-deepening-20261108/local-processing-audit/FINDINGS_ZH.txt) · [逐功能覆盖账本](../analysis-tools/system-deepening/local-processing-audit/FUNCTIONAL_COVERAGE.json) · [六份 MCU 原件及版本对应](../analysis-tools/system-deepening/local-processing-audit/INPUT_VERSION_COVERAGE.json)

## 采集、上传和控制怎样衔接

```text
压电 / IMU / 电容 / 温度
        ↓ 前端采样、滤波、增益
Sensor MCU：换算、缓存、事件判断、组包
        ↓ LSP（不同 opcode 保留各自布局）
Frank：解帧 → 时间映射 → 秒桶/缺值/补点 → CBOR
        ↓ 进程队列 → 本机 NATS → uploader
云端结果接口 → App 的裁剪、汇总、趋势和显示

App / 远端目标 → 主控本地调度
        ├─ Frozen：水温 PID → TEC / 泵 / 风扇
        ├─ 气囊：压力遥测 → 校准系数 → 调节
        ├─ 床架：目标角度 → 位置反馈 / 同步 / 输出调整
        └─ 音频：音轨 → WAV 切片 / 循环 / 音量 → PulseAudio
```

这张图描述已恢复的软件职责。云端结果从哪里取得已经明确，但波形到生理结果的中间实现仍缺，不能仅凭系统图确定每一步都在云端。

## 已解释的本地处理

| 模块 | 当前可以复核的内容 | 尚不能据此证明 |
| --- | --- | --- |
| 压电与 IMU | ADC 滤波/增益/通道映射；旧值保留、队列和配对；采样到组包 | 实际物理接线、逐点新鲜度、真实丢样率 |
| 电容与传感温度 | CAPDAC 补偿/调整、有效值缓存、状态计时；NTC 换算、10 项筛选均值和加权组合 | 当前实机启用的模式与物理通道 |
| Frank | 接收、时间锚点、补点/覆盖、双侧秒桶、编码与发布前队列 | 心肺分离或双人融合；包长不能证明数据完整 |
| 存储与上传 | 内存额度、淘汰、停止转存、重试和 ACK 边界 | 断电保留、服务端实际接收及算法处理 |
| Frozen 温控 | 测温换算、有效期、PID、限幅、保护、风扇/泵与注水 | Autopilot 如何生成目标；实体热响应 |
| 气囊校准 | 中值滤波、平台筛选、残差剔除、线性拟合、写入校验 | 睡眠波形清洗；校准真实精度 |
| 气囊 MCU | 补偿目标、压力斜率、20 点压力标准差、体动门控、选袋与阀泵 PWM | Fault1–4仍在追实际状态链；不能据此证明在床/分期或实际物理响应 |
| 附件遥测 | 字段取整/取舍、整数步长、秒分组、独立发布队列 | 与 Frank 同一套补点、重试或双侧归并规则 |
| 床架 | 位置生产、输入平滑、恢复状态、止鼾运动同步和输出调节 | 历史覆盖保留；不代表已取得鼾声检测、目标角度生成或全部保存生产者 |
| 音频 | 缓存、转换调用、切片、循环、声道映射、音量渐入 | 音箱内部 DSP 或声音分类 |
| Android | 阶段裁剪、指标汇总、异常标志消费、午睡/潮热/时差计划状态 | 生理结果和个性化策略的生产公式 |

详见[本地前处理](algorithms/local-preprocessing.md)、[主控整理](modules/host-signal.md)、[上传](modules/raw-upload.md)、[热控](modules/thermal.md)、[机械算法](algorithms/local-calibration-and-motion.md)、[音频](algorithms/local-audio.md)与[App](modules/android-app.md)。

## 传感处理

电容 `0x33/0x44` 的正常生产者已经找到。MCU 在组包前执行数值换算、自动量程、旧有效值保留和状态判断；主控还会改变部分状态的文字含义。尤其 `0x33` 的 −1 缓存会编码并显示为 65436，`0x44` 的 −1.0 也不会自动变成空值。

温度链包含 NTC 换算、最近 10 项有效范围筛选和加权组合。旧 `0x35` 四列也已接通：两列是 ADC 范围统计，另两列是 LIS Z 轴与状态位。它们都不是心搏/呼吸或双人分离输出。

[电容、范围统计与温度详解](algorithms/local-capacitance-temperature.md) · [原始函数与映射证据](../evidence/analysis/system-deepening-20261108/local-signal-closure/FINDINGS_ZH.txt)

旧 39,704 字节 legacy v2.2.12 与 42,292 字节 Sensor v3.3.1 的两条采样路线均已独立闭合，包含内部 ADC 校正、MCP 四路拼组却只发送两路、FDC 错时缓存和温湿度处理。详见[传感固件分版覆盖](algorithms/local-sensor-versions.md)。

枕头固件另有六路 IMU、电容、LIS 方向均值、温湿度、自检与振动处理，由 Frank 的 0x38/3a/3b/43 消费者接收。正常 0x38 发送存在 11 次出队尝试但只编码 10 行的区别；实际发生率未测。[枕头本地处理](algorithms/local-pillow-processing.md)

## 已恢复的机械算法

气囊校准已经追到压力 CSV、有效段筛选、拟合、系数边界和 MCU 设置。默认由 Node 分析器决定结果，C# 同时运行作比较；指定分析器失败时，没有自动采用比较结果的回退。记录器计算丢点数量，但不补行，拟合器也不按 UTC 恢复缺口。

A02 气囊 MCU 的正常闭环也已恢复：压力标准差用于暂缓自动调压，补偿目标与实测压力决定停止，调度器选袋后由阀泵定时器落实到 PWM。它确实计算预测压力，但已核正常停阀判断没有使用该预测值。[气囊闭环与体动门控](algorithms/local-calibration-and-motion.md) · [完整原指令证据](../evidence/analysis/system-deepening-20261108/local-balloon-control/FINDINGS_ZH.txt)

止鼾抬升任务接收的已经是角度。主控利用位置反馈估算 ticks/s，调整输出并协调左右侧；它不负责这条链上游的鼾声识别。敲击入口则先检查两侧六个闹钟任务的时间窗，再决定是否进入普通调温。

[校准完整证据](../evidence/analysis/system-deepening-20261108/local-calibration-closure/FINDINGS_ZH.txt) · [床架控制完整证据](../evidence/analysis/system-deepening-20261108/local-snore-control/FINDINGS_ZH.txt) · [闹钟分流证据](../evidence/analysis/system-deepening-20261108/local-control-closure/FINDINGS_ZH.txt)

## 附件采样与持久化

TriMix 的“40 点”实际还使用一个跨批保留槽，再排序、截取中段平均；后面另有历史平滑和跳变重置。Keeson 的正常完整自检会清部分累计状态，不能与中途重启混为一谈。保存请求、CRC 合法、恢复字段和实际掉电保存效果分别记录。

[40 点处理、快照与自检/恢复](../evidence/analysis/system-deepening-20261108/local-accessory-closure/FINDINGS_ZH.txt)

气囊遥测还使用另一套秒分组与发布队列：同秒追加、不去重补点，跨秒才发出旧组；1000 条队列满时丢最旧。它与 Frank 的 16 条满拒新规则分别保留，见[附件遥测处理](algorithms/local-accessory-telemetry.md)。

## 手机端本地计算

补齐健康异常字段的真实消费者、异常趋势选样、潮热日期图与总数、午睡设置/激活/停止和倒计时，并补齐时差计划的分组、时间、完成率、编辑与通知入口。潮热图表与 total 的取数范围和取整顺序不同；午睡倒计时结束处没有发送设备停止请求。公式和调用顺序见[手机端本地处理](algorithms/local-app-processing.md)。

## 继续逆向需要什么

1. **当前可继续的气囊代码链。** 按新报告的具体残余推进，区分Fault1–4未绑定writer与已经核对的队列/交接/取消/ACK顺序；床架位置保存缺口已恢复，另按其输入与记录链推进。
2. **部署绑定与真实波形。** 同次启动记录 MCU/Frank 版本、生效配置和实际 opcode，再用同源 LSP、CBOR 验证这些本地规则；只有账号登录不能代替主控访问。
3. **生产生理实现。** 心搏/呼吸、双人分离、融合、在床和分期仍需要对应程序、模型或可核验组件。拿到配对输入/输出可以做黑盒实验，但结果与原厂实现分开标记。
4. **物理映射与效果。** 通道对应位置、模拟前端、电路增益和实际执行器效果，需要板级材料或测量；软件槽数不等于采集卡数量。

具体未闭合的静态入口与外部材料缺口继续列在[逆向计划](reverse-plan.md)。当前页的“已解释”只覆盖所列样本与正常处理链，不承诺所有历史固件、第三方库和硬件状态都已穷尽。