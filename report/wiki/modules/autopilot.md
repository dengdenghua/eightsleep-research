# Autopilot目标生成边界

自动调温的执行链与推荐消费链已有本地证据，核心缺口仍是生产目标生成策略。

需要把“生成目标”和“执行目标”分开。设备的热控、泵、风扇和保护已有本地实现证据；App 的设置、建议、回顾与用户撤销链也已恢复。仍缺的是生产 Autopilot 如何根据睡眠、环境、偏好和历史生成下一温度目标，以及它在当前部署上的完整转换。

## 从偏好到设备的两条方向

```text
用户偏好 / 日程 / 开关 → App → 云端设置与策略（缺生成实现）
                                               ↓
                                       设备目标与控制入口
                                               ↓
                                   Frank → Frozen → 本地热控

云端建议 / 调节事件 / 回顾 → App 缓存与图表
                                ↓ 用户主动接受或撤销
                            设置写入 / 条件 BLE
```

正常更新经 `PUT /v1/users/{userId}/temperature/{deviceType}`，body 中 `currentLevel` 是原始整数档位，`smart` 保存 bedTimeLevel、initialSleepLevel、finalSleepLevel。Backup BLE 在能力、状态、密钥门控通过时可接手部分动作；普通日程和 Autopilot 设置仍有云请求链。路径存在不等于当前设备成功执行。[温控控制合同](../../evidence/analysis/android-findings/APP_THERMAL_CONTROL_ZH.txt)

## 三种温度概念

| 概念 | 已知表示 | 不应等同 |
| --- | --- | --- |
| 原始档位 | 网络整数 raw；LEVEL 显示 raw/10 | 摄氏探头读数 |
| App 摄氏显示 | raw 限幅后分段映射，示例 raw 0 显示 27°C | 床面/水温实测值，或 Frank 的目标换算 |
| 设备热控 | 本地目标、反馈传感、PID 和执行器 | 云端个性化目标生成器 |

App 的 METRIC/IMPERIAL 标尺各有固定常数；不能把 UI 的 13–44°C 当作设备实测范围，也不能由单位显示反推云端映射。[单位与请求字段](../../evidence/analysis/android-findings/APP_THERMAL_CONTROL_ZH.txt)

## 推荐数值与本地选择规则

`GET level-suggestions` 返回 tap-to-control、profile、cohort、cohort-v2、bedtime-level、first-night 等类型。客户端保留推荐档位，按上下文选择和应用：某首页 helper 先取第一个有 pod 的 FirstNight，再回退旧 Cohort；旧 onboarding 又有自己的规则。CohortV2 的分布字段存在，不证明手机用百分比分布求出目标。

TapToControl 提示接受后进入温控 use case，成功分支再记录消息交互。暂不、关闭的记录不是训练实现。类型是否在当前账号返回、对应页面是否启用仍需实际响应和功能开关，不能凭 DTO 名称确认。[建议选择与接受](../../evidence/analysis/android-findings/APP_TEMPERATURE_SUGGESTIONS_ZH.txt)

AUTO-03原列的三个间接消费者已接通，动作各不相同：[推荐消费者完整链](../../evidence/analysis/finishable-20261107/app/auto03/FINDINGS_ZH.txt)

| 入口 | 已恢复的选择和实际动作 |
| --- | --- |
| blanket建议页 | API响应只取第一条insight；按本地hasBlanket选择addBlanket或removeBlanket，空推荐报错。用户接受后提交三阶段smart，source=blanket；此调用未传BLEcommand |
| POD_6_FINALIZE完成流程 | 满足章节、引导类型、无既往完成时间、非speedrun和睡眠天数<1等条件才采用首夜推荐。优先第一个有pod的FirstNight，回退旧Cohort；写温度成功后更新全部已有bedtime schedules的起始温度 |
| 首页FirstNight卡片 | bedtime、温度和alarm点击分别打开对应编辑界面，不在点击路由直接下发卡片推荐值 |

首夜流程先刷新家庭并聚焦设备，只作用于选中家庭对应用户，整个采用流程有10秒超时，随后仍可进入首页。温度写入与逐条日程更新不是原子事务，没有已恢复的失败回滚；空日程列表直接返回。DynamicHome的AI建议接受是另一条链：先提交accepted反馈，再仅替换选中的BEDTIME/NIGHT/DAWN阶段，另两阶段保留。以上均消费已返回的推荐值，不含推荐值生成器。

## 回顾页面为何不等于策略程序

回顾接口带调节时间、前后档位、type、phase、stage、reason 及可选解释。App 按记录生成图点，并叠加独立 trends 的睡眠阶段。图表分类中，AUTOPILOT 且非环境类型的记录会被归入 `SLEEP_RESPONSE`；这条枚举分支不是新的睡眠识别。

已追图点转换还不传递 reason、description、template、data.delta 等解释内容，不能把响应里有说明文字等同于本版图表实际显示它。阶段高亮只更新 UI；“改善”卡片的 delta 来自响应，也没有构造对照组或进行因果估计。[Autopilot 结果链](../../evidence/analysis/android-findings/APP_AUTOPILOT_RESULTS_ZH.txt)

回顾公共图表的剩余分支已用Smali补完。温控OFF支路会复制轴起点、插入过渡点，部分分支再延长到轴终点；只有一个OFF点时没有终点补点。阶段高亮的实际条件为“阶段名相同”，或“非SLEEP_RESPONSE且时间落在选中阶段范围内”，且选中阶段必须至少有一段。未高亮点仍保留，只改变颜色。曲线拐点和高亮不能直接反推云端策略触发时刻。[补点和选择条件](../../evidence/analysis/finishable-20261107/app/charts/FINDINGS_ZH.txt)

## 日程、温控阶段与特殊模式

bedtime/initial/final、early/late 等是温控阶段，不等于 awake/light/deep/rem 生理分期。temp-events/nightly 的孕期周图会按锚点重分桶、取非空档位的普通均值；这是展示统计。普通 temp-events 的环境调节提示可在用户点击后把 previousLevel 送回控制链，所以全部历史消费者也不能概括为只读展示。[温度历史与撤销](../../evidence/analysis/android-findings/APP_TEMPERATURE_HISTORY_ZH.txt)

孕期/产后模式提交启用标志和日期；推荐读取返回三档值，接受和撤销各有请求。已追路径没有从孕周或原始波形在手机计算推荐温度。功能和材料属于系统覆盖，本项目没有代为启用或修改任何模式。[特殊模式策略边界](../../evidence/analysis/android-findings/APP_PREGNANCY_THERMAL_STRATEGY_ZH.txt)

## 未完成与下一步

- AUTO-01：取得与当前部署对应的策略程序、模型或官方定义，追输入特征、个人参数、目标生成和更新条件；UI 文案不能作为替代品。
- AUTO-02：在可用设备上对齐用户动作、App 档位、云端记录、Frank/Frozen 目标与真实反馈，区分目标变化、命令收到和实际达到温度。

AUTO-03限定静态验收已完成。运行验证仍需核对当前用户、设备、hasBlanket、功能开关和实际建议响应；先读响应与UI上下文，只有用户确实计划修改温度时才观察写入顺序。没有这些条件不能把代码可达路径写成当前Pod6已启用。
