# 传感异常组合与双版本时基复核

把两条最影响数据清洗与时间对齐的缺口推到可核验边界：**连续失败、恢复与启停交错后新旧数据怎样进入上传**，以及 **nonUSB 独立时基**。没有实机数据、没有执行固件、没有恢复生产生理算法。[整体机会与后续优先级](reverse-plan.md)仍区分可静态推进项与需材料项。

## 一、先纠正一处缺口表状态：nonUSB 时基已经闭合

`nonUSB 独立时基`不应再列为待办。`sensor-nonusb-dispatch` 的 NU-05 已用本份 132896B BBIN 自身的
SysTick 向量、tick 增量、`.data` 初值、除法与 LOAD/VAL/CTRL 写入给出独立证据。另做了一份
不依赖 Ghidra 的复核：直接重读两份冻结 BBIN，**46 项字节/映射检查 0 失败**，确认该结论可在归档恢复后复现。

| 项目 | USB 5.5.34.0 | nonUSB 5.5.34.0 |
| --- | --- | --- |
| BBIN / SHA256 前缀 | 140828B / `1a125674…` | 132896B / `51531576…` |
| 映射基址 | `0x08010000` | `0x08008000` |
| SysTick 向量 @188 | `080114a3` → handler `080114a2` | `080094a3` → handler `080094a2` |
| tick 增量 / 32位 tick RAM | `080119d4` / `2000121c` | `080099d4` / `20001144` |
| `.data` Flash → RAM | `08032288` → `20000200..594` | `08028464` → `20000200..4bc` |
| clock / step / prio 文件偏移 | 139992 / 140000 / 140004 | 132276 / 132284 / 132288 |
| 默认初值 | 16MHz / step1 / prio4 | 16MHz / step1 / prio4 |
| N / SysTick LOAD | 16000 / 15999 | 16000 / 15999 |
| 名义单位 | 1ms（条件成立） | 1ms（条件成立） |

两版是**同一套整数公式、各自独立的字节证据**，不是同一份结论的复制：地址、tick RAM、
`.data` 源偏移和 bss 范围都不同。两版的 `.data` 源区还都恰好延伸到各自文件末尾，这是记录之外的独立一致性证据。

名义毫秒仍只在「配置成功 + 软件频率变量与实际核心时钟一致 + SysTick 中断正常服务」时成立；
缓存 8、发送 500 是计数门限，不是墙钟截止时延。详见[双版本逐项对照](../analysis-tools/system-deepening/nonusb-timebase-crosscheck/TIMEBASE_COMPARISON.json)、
[字节核验结果](../analysis-tools/system-deepening/nonusb-timebase-crosscheck/BYTE_CROSSCHECK.json)与
[完整结论](../analysis-tools/system-deepening/nonusb-timebase-crosscheck/FINDINGS_ZH.txt)。

**本页撰写时真正剩下的时基尾巴**：nonUSB 的频率变量 writer 及其调用者、错误辅助函数全部副作用、
全部上游配置选择、切换过渡与累计 tick 损失；以及两版共同的物理核心时钟、中断延迟与
ADC CLKIN/DRDY 实测。USB 侧已接到的三个频率 writer 与两个配置入口不能投影到 nonUSB。
[传感时钟切换](sensor-clock-20261108.md)保留 USB 侧原结论。

**后续状态修正**：其中前三项已在[nonUSB 时钟配置链](nonusb-clock-writers-20261108.md)用 nonUSB 自身字节闭合——三个写 `0x20000250` 的函数与写点、两个配置入口、以及错误辅助函数写 `AIRCR` 请求 SYSRESETREQ（两版字节相同）。这些不是从 USB 结论投影过去的，同时补上了 USB 侧遗留的 `08012430` 副作用。仍成立的是全部上游配置选择、切换过渡与累计 tick 损失，以及全部物理时序实测；本段之前的列表保留为撰写时点的记录，不作追溯改写。其中「全部上游配置选择」随后已在[nonUSB 上游时钟选择](upstream-clock-selection-20261108.md)覆盖到 `hwrev` 版本分派表与 6 个启动变体，但型号/晶振绑定仍未闭合。

## 二、传感异常组合：旧值会带着新时间戳进入上传

此前两个模型各自完整却没有接通：`local-sensor-recovery-followup` 的 MCU 故障/缓存/启停状态链
停在 0x3c / 0x39 产物；`integrated-capture-model` 的贯通链路里「保留旧值」是人为注入的。
让 **MCU 故障状态机驱动包序列**，每行保留来源台账，再送进 Frank 载荷边界与发布队列。
14 个固定场景、53 个包、126 条契约断言 0 失败。

| 发现 | 数据 | 对数据清洗的含义 |
| --- | --- | --- |
| 旧值被赋予连续新 tick | 484 个旧值行/通道对，staleness 2..20 软件 tick | 包内无新鲜度/CRC 标记，Frank 按 `header_tick + i*floor(1000/frequency)` 重建时间；只看时间戳无法识别重用 |
| CRC 连续失败 | 3 次 → 24 个旧值通道对；10 次 → 80 个 | 每次失败仍产生快照，失败越久旧值越多 |
| 同一行内新旧混合 | `partial_ready` 场景 20 个旧值通道对 | 以整行为单位判新鲜度会漏判 |
| stop→start→连续失败 | 恢复后**第一个包 5 行 40 通道全是旧值**，仍正常发布 | start 只清软件队列，不清共享 current |
| stop 时已齐备残批 | stop 之后仍被消费并发布 | main 0x3c 只看队列数量，不看 active |
| 全器件重初始化 | active=1 / active=0 两条分支都产出 40 通道旧值包 | 清队列不能清除旧值来源 |
| 交错场景 | 出现两个旧值包（各 40 通道对），最大 staleness 16 tick | 恢复事件之后并非立刻全为新值 |
| 队列预载满 | 恢复后 4 个包全被拒，`published=0`，16 条旧 fixture 占位 | MCU 侧恢复 ≠ 数据能上传；满拒新发生在 body 复制之前 |
| 发布失败 | 同一队首保留、重连后发布 SHA 未变的同一 body | logger 序号 ≠ 样本序号 ≠ 云端批次号 |
| `frequency=0` | Frank 提前退出，mapper 0 行、不生成 body、不入队 | 与「队列满拒新」是完全不同的阶段 |

**核心风险**：旧值与新时间戳一起上传，且 0x3c 包内既没有逐读 CRC/ready 序号，也没有逐通道新鲜度位。
所以补点、重放、丢包率的判定必须有同源输入/输出记录，不能由模拟比例或解析成功代替。

模型首版曾把「沿用旧 current」误判为新值（旧值计数全为 0，与既有代码结论矛盾），
已改为按「 callback 是否真的写入」判定并复跑；修正过程在
[完整结论](../analysis-tools/system-deepening/sensor-fault-upload-chain/FINDINGS_ZH.txt)中保留。

[逐包轨迹与契约断言](../analysis-tools/system-deepening/sensor-fault-upload-chain/model/RESULTS.json) ·
[契约来源表](../analysis-tools/system-deepening/sensor-fault-upload-chain/CONTRACTS.json) ·
[输入 SHA 清单](../analysis-tools/system-deepening/sensor-fault-upload-chain/SOURCE_MANIFEST.json) ·
[可复跑模型](../analysis-tools/system-deepening/sensor-fault-upload-chain/model/run_cases.py) ·
[残余缺口](../analysis-tools/system-deepening/sensor-fault-upload-chain/COVERAGE_RESIDUAL.json)

## 三、边界

两层模型都是离线合成：CRC/DRDY、启停/重初始化、publish 返回码均为显式输入，不是实机故障率或时序记录；
抽象 body 代替 30,128B CBOR（字节级贯通已在 integrated-capture-model 完成）；不含 core 队列、KV、
libnats ACK、NATS raw_mem、uploader、TLS 与云端接收。共享日志格式缓冲/重入专项曾被自动安全检查中止并
标记未验收，没有重试、没有改写措辞、没有引用其草稿结论。气囊与床架的实现与残余问题另列专题；核心生理算法、
Autopilot、姿态分类、实机绑定与音箱 DSP 仍依赖材料；USB `0x2B` 生产者与旧波形 RAW writer 两个旧缺口保持原状。
