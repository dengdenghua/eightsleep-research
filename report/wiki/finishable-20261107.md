# 功能验证与模型覆盖

在已有官方固件和 APK 上继续追调用链并运行离线模型。实时设备数据、当前部署版本和生产云端算法仍未取得。下表只关闭已有证据覆盖的验收，不把未找到的实现填成推测。

## 当前交付

| 任务 | 已交付 | 仍需区分 |
| --- | --- | --- |
| C03 温控边界 | 73 项检查、11 个代码导出、原字节分支与常量复核 | 局部代码模型，不能预测实机温升 |
| C04 App 启动与离线入口 | 40 段 Smali 补齐 consent、缓存、路由、权限和备用控制门控 | 实际账号开关、缓存和 BLE 成功率尚未测试 |
| C13 启动图 | 校验286份文件，解析230个unit名称，分开排序、拉起和文件等待 | 未模拟运行期配置、生成器和全部隐含依赖 |
| HOST-01 数据整理 | 34组场景、四类buffer、共享mask、取消/异常、gain/version和CBOR | 模型输出不等于云端已收到 |
| SEN-03 FDC设置 | 设置、映射、调度和I2C读写链；28项地址检查 | 未证明设置已在用户实机触发 |
| AUTO-03 推荐消费者 | blanket、首夜流程、首页CTA和AI建议接受链 | 不包含云端推荐值生成 |
| SEN-02 USB增益入口 | 已查完当前识别的直接与间接入口 | 原始0x2B生产者仍未知，需新控制流或组件材料 |
| RAW-02 缓存满载 | 配额来源、实际discard序列化、同包NATS删除分支；13项模型检查 | 实机生效配置仍未取得 |
| HOST-03 旧RAW | SEQNO两字段及8项合成验证，旧文件名/计时/关闭链 | 波形RAW仍缺真实样本或另一writer |
| APP-02 图表与事件 | 四个图表入口、29公式案例、汇总缓存和事件覆盖 | 不含云端指标生产及实机渲染验证 |
| C08 气囊故障 | A02保护/恢复；A00有限差分找到Fault1生产者 | A02 Fault1–4、A00 Fault2–4仍未知 |
| C11 床架/音箱 | 24样本库存、主机协议；TriMix/Keeson主选MCU入口 | 音箱执行格式、历史版本差分、bootloader未全恢复 |

## 温控：失效判断与关断分属不同层

水温成功标志存在且读数年龄小于5000ms时，PID才使用它。达到5000ms的分支直接返回，保留此前请求；是否最终关闭输出，还要经过 TEC 的另一套保护判断。

| 模拟条件 | 输出或转移 | 证据边界 |
| --- | --- | --- |
| 水温年龄4999 / 5000ms | 前者有效，后者不更新本步PID与请求 | 不等于后者一定继续加热或一定关断 |
| 环境温度与请求目标差值恰好4 / 刚大于4°C | 局部限幅分别为[-0.8,0.8] / [-1,0.8] | 输入已经过普通冷却限幅，后面仍有保护 |
| 制冷热换向 | 先清PWM；500ms可开使能；1000ms回正常态，后续周期才增大PWM | 不是1000ms恢复满输出 |
| WAIT_CAP平均水位恰好18.75% | 不累计低水位 | 比较是严格小于 |
| FLUSH平均水位恰好12.5% | 累计低水位 | 比较包含等于 |
| 等待盖子时左右交替低水位 | 15次有效调度仍可使共用计数器达到3000并回FILL | 固定每次加200，未测实际经过时间 |

FILL进入RED使用当前水位；五点平均用于其他判断。这两种输入已在模型中分开，避免把所有注水门限都当作平滑后的值。

[函数与边界说明](../evidence/analysis/finishable-20261107/thermal-model/FINDINGS_ZH.txt) · [模型](../analysis-tools/thermal-model/model.py) · [73项输入和结果](../analysis-tools/thermal-model/RESULTS.json)

```sh
python3 analysis-tools/thermal-model/run_cases.py
```

## 开机：等文件不等于等联网

下图中实线表示核心unit的显式排序，文字另列应用文件等待。排序关系和拉起关系已在JSON中分开保存。

```text
persistent.mount → persistent-manager
                         ├→ Capybara ← Bluetooth / NetworkManager
                         ├→ NATS → Frank
                         │     └→ uploader
                         └→ burrow
NetworkManager → DAC

Capybara.InitializeHardware → 写 /persistent/deviceinfo/device-id
                            → 写 /deviceinfo/capybara.run_info
                            → 初始化连接 → 启动托管服务

Frank、DAC：等 run_info 非空
uploader、burrow：等 device-id 非空
```

`/deviceinfo` 是 tmpfs，`/persistent/deviceinfo` 位于持久分区。`run_info` 在连接初始化之前写入，不能拿它当作联网或上传正常的标志。同次开机的进程重启可能留下旧文件；已查等待分支只检查非空，没有核对文件代次。

NATS虽写有 `After=network-online.target ntp.service`，这本身不会拉起两者，也不保证网络时间同步。镜像启用了 `systemd-timesyncd`，但未在已查启动链接中启用 `systemd-time-wait-sync`。burrow还可能把过早的系统时间校正到构建时间，和采样启动之间没有显式排序。

这些区分遵循 systemd 对[排序与依赖](https://raw.githubusercontent.com/systemd/systemd/v255/man/systemd.unit.xml)和[启动完成条件](https://raw.githubusercontent.com/systemd/systemd/v255/man/systemd.service.xml)的定义；实际设备运行状态仍需另查。

显式排序图未发现环；这不等于证明完整启动无死锁。缺失引用、模板占位、内建项与运行期生成项已分类，避免把每个“没有同名文件”的条目都当成故障。

[启动分析](../evidence/analysis/finishable-20261107/startup/FINDINGS_ZH.txt) · [完整图与每条边来源](../analysis-tools/startup/GRAPH.json) · [配置条目](../analysis-tools/startup/UNITS.json)

## App：缓存路径已查清，控制仍有门槛

中国版先读取本地consent版本；正常启动的ensureAppUser先观察本地用户，失败后才走远端获取。名字含Remote的引导状态函数，在传入false时同样先看DAO结果。完整缓存可以提供本地推进路径，但缓存缺失、订阅和其他状态仍可能让启动依赖网络。

登录后先经过权限与所选设备筛选，才预取备用控制资料。真正写BLE之前还检查功能开关、设备代际和firmwareVersion等兼容条件。普通断网不是此前识别的空token清库条件；有BLE实现也不能保证每种断网情境都能进入控制页。

[冷启动、路由、缓存和门控证据](../evidence/analysis/finishable-20261107/app/c04/FINDINGS_ZH.txt)

## 主控数据整理：已发现的丢弃不止一种

左右传感器共用同步对象和互补mask已对应到实际构造参数。扩展模型同时处理buzzer、IMU、extADC和多通道buffer，记录提前退出、删除秒桶、watermark前进和编码失败的后果。

主侧第0槽缺值时，副侧IMU可以形成epoch=0的编码候选；后面主侧到达的真实时间未必修复它。编码返回失败也不会自动恢复已经删除的桶。两项均为指定合成输入下的代码结果，未证明服务器实际收到这种数据。

[34场景与函数映射](../evidence/analysis/finishable-20261107/host-model/FINDINGS_ZH.txt) · [结果](../analysis-tools/host-model-expanded/RESULTS.json) · [逐记录轨迹](../analysis-tools/host-model-expanded/TRACE.json)

```sh
python3 analysis-tools/host-model-expanded/run_cases.py
```

## 传感器设置：收到值、写入寄存器和上传标签要分别核对

FDC设置路径出现了具体的索引问题：部分通道映射值带有0x40分组位，正常读数会拆开组号和通道号，设置函数却直接用完整字节计算地址。离线地址模型显示，gain和CAPDAC写入会偏离预期设置字段，落到同一个cap对象内的采样字段或完成标志附近；它并未越过整个对象边界。

这份固件的常规调度与I2C路径中，也未发现把gain请求副本写入GAIN_CAL寄存器的步骤。两项结论都不能直接推成当前设备已出故障：硬件分支、设置生产入口和实际触发尚未绑定。

USB侧已查DeviceAPI、全局实例、adapter、公共状态机和pending重试。重试可以复制已有0x2B，但不是首次生成gain请求的来源。当前未找到一个已指认、尚未追的生产入口；继续定位需要首次发送的运行记录或额外组件。

[FDC映射与寄存器证据](../evidence/analysis/finishable-20261107/sensor-control/SEN03_FINDINGS_ZH.txt) · [USB入口覆盖与缺口](../evidence/analysis/finishable-20261107/sensor-control/SEN02_FINDINGS_ZH.txt)

## 上传字节：缺值和标签怎样保留

四类buffer的成功编码已重建成可执行工具，30项检查用既有独立解码器读回。buzzer和multi每通道固定写500个int32，IMU每轴固定写100个int16；缺值仍留在二进制数组中，并未在编码时删掉或改成null。

stealth body直接串接buzzer、IMU和可选multi三个CBOR值。extADC在loader的`adc=0x41`分支只编码left1/right1，即使另外两组RAM也已填值。gain/版本读取的是缓存字段，不证明硬件增益已生效；其中buzzer的16位gain按有符号值编码，multi则零扩展。合成包可复核格式，还需同版本真实记录验证实际输入和上传信封。

[布局与编码证据](../evidence/analysis/finishable-20261107/cbor-encoder/FINDINGS_ZH.txt) · [编码器](../analysis-tools/cbor-encoder/encode_buffers.py) · [合成结果](../analysis-tools/cbor-encoder/RESULTS.json)

## App汇总缓存：部分旧值会保留，0不一定来自计算

服务器返回部分指标时，同日期缓存按“旧Map + 新Map”合并，新值覆盖同键、未带回的指标保留旧值。标准差在已有缓存的特定合并分支先补请求指标的0，再叠加旧值和新值；没有旧记录的路径不这样补0。samples则整列用新列表替换。

成功返回空period列表且查询日期不在未来时，会写入占位记录，可能替换同键旧缓存。这与网络错误是不同分支，也不是传感器信号清洗。

[缓存调用链与7个案例](../evidence/analysis/finishable-20261107/app/metrics-aggregate/FINDINGS_ZH.txt) · [可复跑模型](../analysis-tools/metrics-aggregate/cache_model.py)

## 温度建议：有的只展示，有的实际写入

blanket建议页在用户接受后才写温度；首页FirstNight的三处点击分别打开bedtime、温控和alarm编辑页。真正的首夜自动采用发生在POD_6_FINALIZE完成链，并受新用户/新床等条件约束。

首夜流程先写smart三阶段温度，再把所有已有bedtime schedules的起始温度更新为推荐bedtime；它不是跨温度与日程的原子事务，后一步失败或超时不表示已留存分析中写入自动回滚。服务器如何生成推荐值仍未恢复。

[49段Smali对应的选择、门控和写入顺序](../evidence/analysis/finishable-20261107/app/auto03/FINDINGS_ZH.txt)

## 缓存满载：超额删除最旧消息

配额参数已从抽象的R确定为`[jetstream].mem_max_mb`，默认0走MemTotal自动计算。uploader新建raw_mem实际写出`discard:"old"`，同包NATS解析和回收函数进一步证明：超额时从FirstSeq开始循环删消息；等于限额不删。

RAM→disk的已识别调用链由`--dump`停止钩子进入，普通满载回收没有把正文转存磁盘。已有流还可能保留不同配置，因此报告区分样本目标与实机生效状态。磁盘24小时限额不能保证断网全天波形可补取。

[跨程序代码证据](../evidence/analysis/finishable-20261107/raw-upload/RAW_02_FINDINGS_ZH.txt) · [额度与淘汰算例](../analysis-tools/raw-upload/RAW_02_VALIDATION.json)

## 旧RAW：文件名不是波形格式证据

已解释的`SEQNO.RAW`只保存sequence/checkpoint两个uint64小端值；旧logger的15分钟状态更新生成名称，却没有在已追路径写入对应波形文件。真实正文仍走JetStream，关闭时flush同样如此。

读取器只接受SEQNO.RAW名称并检查最少16字节。它不把任意RAW当成波形，也没有真实文件兼容性结论。HOST-03保留为需要新材料，等待实际波形文件或另一版本writer。

[字段、开启/关闭与搜索覆盖](../evidence/analysis/finishable-20261107/raw-upload/HOST_03_FINDINGS_ZH.txt) · [序号读取器](../analysis-tools/raw-upload/seqno_decoder.py)

## App图表：补日期、保留旧图和合成绘图点

公共指标图的MONTH固定列31日期，YEAR按月份键组织；同周期刷新按日期覆盖，可能保留这次未返回的旧日期。缺日传入processor的是null，并非公共函数统一补0。

温控回顾会给OFF事件生成绘图点；阶段筛选主要控制颜色，没有重新计算温控目标。鼾声图追加NONE时使用阶段结束作为基准，Canvas再按列表duration累计，因此图上的空白不都来自设备检测。睡眠阶段图按已返回阶段和时长画条，连线圆滑也只是绘图。

这些分支已用完整Smali补齐JADX错误。真实响应可达性、Compose重组和异常渲染仍未实测。

[四个图表的具体公式和消费者](../evidence/analysis/finishable-20261107/app/charts/FINDINGS_ZH.txt) · [alarm与base-preset事件边界](../evidence/analysis/finishable-20261107/app/app02/FINDINGS_ZH.txt)

## 附件：控制保护与升级已深入到MCU

A02的Safety3/4现在有实际写入点，过流/过温先触发总保护，再遍历每袋写原因；原因字段可能被后续故障覆盖。清健康计数不等于退出Fault，Fault1–4仍未定位实际生产者。

TriMix主选V25已从接收sum16追到动作门控、按序保存168字节OTA记录、CRC检查与复位。7个原包的128字节外层头、CRC和向量均已核对。成功回执只说明当前应用走到校验与复位分支，bootloader提交/回滚不在该payload里。

[气囊保护与恢复](../evidence/analysis/finishable-20261107/accessories/a02-faults/FINDINGS_ZH.txt) · [24样本库存及主机协议](../evidence/analysis/finishable-20261107/accessories-c11/FINDINGS_ZH.txt) · [TriMix命令与升级](../evidence/analysis/finishable-20261107/trimix/FINDINGS_ZH.txt)

Keeson10211已追通BLE接收至目标、运行状态、GPIO/PWM和到位通知。故障查询把同一全局码复制给四轴；主机将wire2叫Overload，但其来源包含Hall自检异常，wire1又被映射成Working。现有主机单轴Stop选择字节与该MCU读取位置也有差异，均未作为实机故障下结论。应用DFU交接已定位，bootloader本体仍缺。

[Keeson固件证据](../evidence/analysis/finishable-20261107/accessories/keeson-mcu/FINDINGS_ZH.txt)

### A00与A02不能合用一套故障解释

包内A00是独立实现，bag FSM、压力命令和reason字段具有有限差分验证：

| 行为 | A00 | A02 |
| --- | --- | --- |
| 重复超时 | 单计数达到3 → Fault1 | 充/放气分别计数 → Fault5/6 |
| 新压力目标 | 每次有效目标清超时计数 | 满足目标变化条件才清相应计数 |
| 故障恢复 | 清计数不清FaultLatch；未找到60秒自动解锁消费者 | 保留已查Fault/健康字段的独立语义 |
| Safety3 | 枚举名MANUAL_STOP，但已证生产者是过流紧急停止 | 对应OVERCURRENT |
| 过温保护 | 已查路径未找到对应Safety4写入 | 已找到泵60°C、阀85°C分支 |

A00的Fault1不能补成A02的Fault1实现；两份样本中的未识别生产者继续分开记录。[A00/A02有限差分证据](../evidence/analysis/finishable-20261107/accessories/a00-faults/FINDINGS_ZH.txt)

## 材料缺口没有因模型完成而消失

SEN-02的首次增益请求来源与HOST-03的旧波形容器仍需要新控制流或文件材料。现有包无法生成用户实机的真实波形，也无法由三个版本号推出生产分期、HRV和云端温控策略。实际在线接口、部署版本、输入采样和运行效果仍需实机确认。

[下一步执行计划](reverse-plan.md)按可取得的材料排列入口，[逐项待办](roadmap.md)保留每项验收与状态。已完成指限定静态问题得到解释，不等于整个系统逆向完成。
