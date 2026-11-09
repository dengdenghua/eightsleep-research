# 采样到发送的贯通模型与接收校验

把原来分开的采样、主控整理和发布队列模型接成同一条字节链，并分析实际 USB 接收器与发送长度边界。**现在能逐点追溯一份合成 CBOR 的来源，但仍没有实机波形、云端 ACK 或生产睡眠算法。** 输入绑定已有 MTK Frank 与 USB sensor 5.5.34.0；未因此认定它们就是当前实机部署。

## 从采样记录追到一次发布尝试

```text
合成 ADC/IMU → 缓存与 FIFO → 0x3c/LSP 字节
→ Frank 接收器模型 → 时间映射与双侧秒桶
→ buzzer/IMU RAM → CBOR → Frank raw 队列
→ 模拟 js_Publish 返回：弹出或保留重试
```

各阶段都保留数据：采样快照、成分来源、组包关系、LSP 原字节、主控输入、覆盖/丢弃记录、CBOR、队列与发布尝试。来源标签是研究工具额外记录的，不是生产协议自带的字段。

固定双侧、500 的频率字段、`flags=0xf200`、稳定时间锚点和 `compat=False`，因此一条 stealth body 包含 buzzer 与 IMU 两个连续 CBOR 对象。增益元数据来自主控配置，不能拿它反推实际 PGA 或物理标定。输入、调度和发布返回码均为合成条件。发布worker在场景输入结束后人工推进，不用于推断真实并发、吞吐或队列积压速度。

| 场景 | 首秒 buzzer 有效槽：左 / 右 | 追到的后果 |
| --- | --- | --- |
| 正常顺序 | 500 / 500 | 两侧各100份IMU来源进入输出 |
| 左侧少一次指定callback | 500 / 500 | 有一行来自下一点复制；左侧100个IMU槽只有99份不同源快照 |
| 左侧一路10次没有新ready值 | 500 / 500 | 10个值沿用旧缓存；非缺值不等于新鲜采样 |
| 主侧缺一整包5条ADC | 100 / 100 | loader在槽100提前退出，两侧后续数据随桶删除 |
| 副侧缺同样一包 | 500 / 495 | 主侧继续输出，副侧留下缺值 |
| 左侧FIFO消费暂停60次callback | 30 / 30 | ADC拒新30条；下一秒恢复500/500，但左侧IMU配对仍偏移 |
| raw队列预载16条外部fixture | 候选500 / 500，入队拒绝 | 编码成功，没有这条body的发布尝试 |
| 发布先失败、重连后成功 | 500 / 500 | 重试同一body，不重新采样；远端接收未知 |

这里的有效槽指非 sentinel，每槽有5个 buzzer 值；不等于每个值都是新转换。“主侧”由当前桶选择规则决定，本组条件下为左侧，不能推广为固定物理左侧。

### 错配怎样进入后续输出

FIFO暂停场景特意延长到1505个调度时隙，取得第二个自动输出。首秒提前退出，六条左IMU行仍来自最初六包，尚没有偏移。第二秒虽然两侧ADC有效槽均恢复到500，**100条左IMU输出全部来自比所在包末条ADC早30次callback的配对**；右侧没有这一偏移。模型没有把callback数换成实测毫秒。

这区分了“MCU已经配错”“主控收到配错记录”和“配错内容进入CBOR”三个阶段。其他未输出的记录仍逐条标为已删除或pending，没有强行刷写尾部来制造结果。

### 为什么只看包大小不够

这8个场景形成9个候选body，**每个都是30,128字节**，既有完整数组，也有大量缺值、旧值或复制值。当前配置编码固定长度数组；长度相同并不证明信息完整。这个大小仅适用于模式和元数据，不是全产品的固定包长。

逐body独立解码并核对了88,200个标量。另一次独立审阅从采样文件、主控输入到CBOR联表复核，避免只用编码器自己的输入当期望。校验通过说明重建链内部一致，不是执行原厂程序或证明生产准确率。

[贯通模型证据](../evidence/analysis/system-deepening-20261108/integrated-capture-model/FINDINGS_ZH.txt) · [场景与结果](../analysis-tools/system-deepening/integrated-capture-model/results/RESULTS.json) · [适配契约审计](../evidence/analysis/system-deepening-20261108/integration-contract-review/FINDINGS_ZH.txt) · [贯通结果独立复核](../analysis-tools/system-deepening/integration-contract-review/INTEGRATION_REVIEW_ZH.txt)

## USB接收器：CRC失败如何影响后续数据

实际路由已从两个 USB 对象、端口表和 read 调用追到 LSP，再进入带状态门控的业务分派。运行固件分支使用两字节长度；启动/bootloader阶段另有一字节模式，不能混为一谈。

| 情况 | 代码与有限模型确认的行为 | 仍不能确定 |
| --- | --- | --- |
| 指定body改动、保留旧CRC | 样例被拒；遇到后续未转义起点可重新同步 | 不是所有改写和CRC碰撞都被穷尽 |
| 上一段停在转义字节 | 转义状态跨read保留，可能把下一帧起点当普通数据 | 不能保证只损失当前一帧 |
| 完整、自洽、CRC匹配的替换帧 | LSP层可通过，随后进入opcode/payload处理，仍受业务状态门控；0x3c/0x33边界见下节，其余分支未穷尽 | CRC不证明新鲜度、物理来源或云端接收 |
| 声明长度超过2048 | body写入在容量边界停止，但计数继续；走到CRC时仍按完整计数读 | 可证超出配置body子缓冲，未证明整个对象越界、崩溃或可利用 |

CRC只覆盖body，长度与起始分隔符不在覆盖范围。接收器没有在所审CRC失败分支产生专门错误计数；外围超时日志也不能直接当CRC失败次数。

新贯通模型使用这一接收器的规范输入路径，并与严格研究解析器对照。任意用户态read分块不代表USB物理包长。畸形帧由独立的12项有限检查分析；超容量CRC读取处停止模型并保留原生后果未知，不填造相邻内存。

[实际USB路由、解析与恢复证据](../evidence/analysis/system-deepening-20261108/host-usb-receiver/FINDINGS_ZH.txt) · [接收模型检查](../analysis-tools/system-deepening/host-usb-receiver/model/RESULTS.json)

## CRC通过之后：0x3c与0x33的payload边界

这些分支还要求事件header高位为0、对象处于相应运行状态；CRC正确本身不够。下面的长度均**不含opcode**，有限样例均使用自洽长度与CRC，不能理解为现场少一个USB字节还会自动通过原CRC。

### 0x3c按长度重算ADC与IMU位置

主控要求payload至少120字节，再用`N=floor((length-56)/64)`计算ADC条数，IMU起点为`8+64*N`。并未要求普通生产者使用的固定376字节。

| payload长度 | ADC条数 | IMU起点 | 后果 |
| --- | --- | --- | --- |
| 376 | 5 | 328 | 普通布局 |
| 375 | 4 | 264 | 原第5条ADC的部分内容被当成IMU，尾63字节忽略 |
| 377…439 | 5 | 328 | 原布局保留，多出的1…63字节忽略 |
| 440 | 6 | 392 | 原IMU与追加区拼成第6条ADC，IMU改从追加区读取 |

在核对的payload 120…2047范围内，读取仍落在当前payload中；问题是**布局可能被重新解释**，不是这里已证越界。`frequency=0`在逐行计数前退出；大于1000时整数`1000/frequency`为0，多行可向时间映射器传入同一个tick，解码计数仍推进。禁用的ADC/IMU组会从模板填sentinel，不能与MCU沿用旧采样缓存混为一谈。

### 0x33短包可能使用接收缓冲的旧尾部

这一支通向CapSense处理，不是普通`0x3c`压电输出。原指令的条件为“长度大于27就退出”，而实际固定读取至payload[25]：

| payload长度 | decoder行为 | USB调用者后续 |
| --- | --- | --- |
| 0…25 | 固定字段可能读过当前payload末尾，取到接收缓冲残留 | 继续请求CapSense处理 |
| 26、27 | 字段读取有足够字节 | 继续请求CapSense处理 |
| ≥28 | 不解码 | 仍将预先清零的20字节输出对象交给后续入口 |

调用者清零的是**输出对象**；LSP接收缓冲不会每帧整体清空。当前帧CRC也只覆盖本帧声明body，无法约束decoder随后读取的旧尾部。这些读仍位于2048字节接收区内，未因此证明整个分配越界或崩溃。

后续是否入队取决于CapSense对象和队列状态；当前K60是否实际产生`0x33`仍未确认。此分支借用已有时间锚点，未像`0x3c`那样推进对应last_tick/逐行计数。

另有**17项有限检查**与1928个长度的范围核对；它们与前面的8场景贯通模型分别计数，后者仍只使用规范采样包。[原指令、条件与检查](../evidence/analysis/system-deepening-20261108/host-payload-boundaries/FINDINGS_ZH.txt) · [模型结果](../analysis-tools/system-deepening/host-payload-boundaries/model/RESULTS.json)

### 接收入口不等于当前固件会发送

**后续补证已找到G0 USB的正常0x33/0x44生产者。** 原先只枚举已恢复函数的发送点，漏掉尚未定义的0802572c；现已由原字节BL扫描及主循环引用接通。旧报告作为历史证据保留，当前结论以[本地电容处理](algorithms/local-capacitance-temperature.md)为准。

相邻的`0x34`和`0x35`分别生成216、176字节body（包含opcode）；发送包装没有把它们改成`0x33`，主控也先按opcode分流。命令回复的`0xb3`高位为1，同样不等于要求高位为0的`0x33`事件。

制造revision为K60时已审普通采样分支选择377字节0x3c；这是普通采样选择，不能排除独立FDC分支。现已恢复0x33/0x44正常生产和消费链；用户实机是否启用仍需匹配版本、配置及方向/opcode/长度记录。[更正证据](../evidence/analysis/system-deepening-20261108/local-signal-closure/FINDINGS_ZH.txt)

### 旧式Sensor怎样消费0x34与0x35

同一份Frank保留两套不同入口。已绑定的`UsbSensor`对这两个opcode走完成分支，没有调用下表解码器；**旧式`Sensor`才有相应消费链**。旧对象按非空配置接入handle 1字节流抽象，底层还包含USB tty识别，不能直接认定是实机物理UART。实际端点、启用配置和运行镜像仍未知。

| 规范包 | 旧式消费者 | 条件输出 |
| --- | --- | --- |
| `0x34`，216字节body，tag=`0x42`，25行 | Header后每行8字节；解码器入口却先要求至少16字节剩余。末8字节不更新输出，caller仍提交上一行对象 | `raw_ext_adc_buffer`被选中时，`piezo-dual`只编码`left1/right1`两个500项int32数组，进入本地`raw.sens.piezo` |
| `0x35`，176字节body，version=2，10行 | 每行16字节，10行均更新；四列经过明确重排 | `lps`的`pres`含四个200项int32数组，进入本地`raw.sens.lps` |

`0x34`模型固定稳定锚点、无补点和顺序完成：**24次解码更新、25次提交、24个唯一槽位**。末次再次写入槽23，槽24仍是缺值；不是多生成了第25个独立时间点。分析范围仅解释该规范格式经过旧式消费者的行为，没有测得当前Pod发生率。

`0x35`的四路输出依次来自producer record的`+0x18/+0x10/+0x14/+0x0c`。Header中四个metadata均由此producer写零；代码中的`temp`、`pres`、`left/right`等键名不能证明实际温度、压力单位或物理床侧。数组仍按int32原值编码，未在这一步换算物理量。

两个模型只生成规范包、解码轨迹、内存数组和输出schema，不运行原厂CBOR编码器或发布服务。0x34还有另一buffer优先选择条件；本地主题也不证明云端收到或哪个算法消费。新核对覆盖11,808条唯一指令，两个规范布局的8组检查通过，与前面8场景贯通模型分别计数。[完整调用链、字段与限定](../evidence/analysis/system-deepening-20261108/host-legacy-sample-consumers/FINDINGS_ZH.txt) · [规范包模型结果](../analysis-tools/system-deepening/host-legacy-sample-consumers/MODEL_RESULTS.json)

## 发送长度：普通采样包到不了1024分支

找到封包器达到1024字节就提交、随后可能复写同槽的条件。继续追生产者，避免把条件分支直接当成实机能触发的故障。

| 已审发送入口 | 未转义body | 放宽后的结论 |
| --- | --- | --- |
| 正常0x3c采样 | 377字节 | 即使采用4字节长度并把所有相关字节按最坏情况转义，整帧也不超过767字节 |
| 其他普通数据/状态/事件 | 最大216字节 | 已识别正常路径达不到1024 |
| 正常命令回复生产链 | 最大130字节 | 512字节回复缓冲的容量不是实际生成长度 |
| 已识别普通日志路径 | 最大513字节 | 无重入、有效格式化及原前缀条件下，2字节长度整帧≤1021；放宽为4字节仍≤1023 |

封包器在提交后只清偏移，不换槽。整帧恰好1024字节且没有后续字节时，不发生本帧后续重写；超过1024时，才有同槽从头继续写的条件，还需消费者未读完才可能影响内容。所审无重入模型的写入偏移仍在0…1023，不能把它写成已证的 `slot[1024]` 越界。

[逐调用者长度与原指令](../evidence/analysis/system-deepening-20261108/sensor-frame-bounds/FINDINGS_ZH.txt) · [边界表](../analysis-tools/system-deepening/sensor-frame-bounds/CALLER_BOUNDS.json) · [10项有限检查](../analysis-tools/system-deepening/sensor-frame-bounds/MODEL_RESULTS.json)

### 日志上界已进一步收紧

后续复核覆盖277个去重调用点、337个格式候选。正常格式化正文最多511字节，至少保留`FW: `、时间文本和格式开头共10个不需转义的字节；即使把动态字符串剩余内容全部按需转义字节放宽，整帧仍小于1024。实际长度字段的字节和CRC最坏转义另行计算，没有直接用缓冲容量代替生成长度。

所以，在这些前提下，已识别普通采样、回复和日志不能靠单条消息长度进入1024提交分支。**这不排除重入改写共享状态**，后者是不同路径。[日志生产者、格式化与上界](../evidence/analysis/system-deepening-20261108/sensor-log-producers/FINDINGS_ZH.txt)

## 短消息也可能遇到发送重入

封包器选槽时未立即将槽标为占用；数据指针、状态指针和写入偏移也是共享全局量，嵌套调用没有完整保存/恢复。队列操作处的保护不能等同于整段编码被保护。

采样中断存在一条具体入口：ADC队列满时写`[sampling] overflow`日志，再进入同一封包器。若它恰好打断主循环正在编码的消息，嵌套日志可以接着外层偏移写入，提交后又把共享偏移清零；外层恢复时继续改写已提交的槽。成立还需要中断、满队列、可用槽及读取时刻等条件，不是实机已发生过的结论。

有限模型复用前面baseline的**377字节合成0x3c body**并计算真实LSP CRC。它比较两个明确的读取假设：

| 条件 | 接收器模型得到什么 |
| --- | --- |
| 串行发送，或采样中断未触发日志 | 对照帧正常形成 |
| 溢出日志嵌套；每次提交立即完整复制 | 内层日志形成帧，外层0x3c未形成完整帧 |
| 同一嵌套；全部编码结束后才读取所持指针 | 本例没有形成可返回帧 |

这是共享内存与分隔符恢复的演算，不是实际PMA复制时序。不能将“没有返回帧”自动计为CRC校验失败；也没有把日志收到当作外层采样收到。这两种整段读法也不覆盖全部中途复制情况；内层短消息若直接启动，可能当即复制完整。本模型未重演0x3c生产者先出队5条ADC的过程，满队列状态由外部指定，尚未证明所选瞬间在完整主循环中可达。真实交集与发生频率需要同源记录。[重入链与有限模型](../evidence/analysis/system-deepening-20261108/sensor-framer-reentrancy/FINDINGS_ZH.txt)

### 发送前先取走5条，改变了溢出的前提

后续模型补上生产/消费顺序。普通`0x3c`先取5条ADC、1条IMU，再调用发送包装。**若中途没有回填，满30条先降到25条，第6次新采样回调才会拒新**；第一次只能加到26。即使前几次取数之间有回填，最后一次成功取数后也最多29条，紧接的一次回调最多补满，不会因队列已满而拒新。要让进入封包器后的第一次回调就拒新，必须先在最后一次取数之后额外补入。

另一个实际入口是主循环的gain-sync日志：它发生在清队列及普通5条取数之前。已审增益setter可设置dirty而不清ADC，局部代码允许dirty与满队列共存。但“主循环被延后到积累30条”和“回调恰落在日志内部”仍是模型调度条件，没有证明实机发生。

8个场景、26组计数和256组取数间回填组合只核对队列前提，不重演日志文本、CRC、USB或云端结果。它与上面的发送模型分别验收，不能把两者拼成已复现的整机故障。[原指令与前置条件](../evidence/analysis/system-deepening-20261108/sensor-reentrancy-preconditions/FINDINGS_ZH.txt) · [计数模型结果](../analysis-tools/system-deepening/sensor-reentrancy-preconditions/MODEL_RESULTS.json)

共享日志格式化缓冲的另一项并行分析被自动安全检查中止，尚无可验收结论。保留文件仅作未完成草稿，不将其中模型输出计入已验证发现，也不据此更新任务为完成。[未完成状态](../analysis-tools/system-deepening/sensor-log-reentrancy/UNFINISHED_ZH.txt)

## 复跑与逐点查询

在本项目目录运行，依赖的Python模型已随工具保留：

```text
python3 analysis-tools/system-deepening/integrated-capture-model/run_cases.py
python3 analysis-tools/system-deepening/integrated-capture-model/trace_point.py --case analysis-tools/system-deepening/integrated-capture-model/results/one_missing_callback_left --stream buzzer --side left --slot 100
```

第二条会显示该输出点来自下一条输入的复制，并列出LSP包、ADC快照、共享IMU和队列结果。[工具说明](../analysis-tools/system-deepening/integrated-capture-model/README.txt) · [五个来源查询样例](../analysis-tools/system-deepening/integrated-capture-model/results/POINT_TRACE_CHECKS.json)

## 下一步与停止条件

1. **用真实配置和帧记录绑定消费链。** 0x34/0x35的规范producer、旧式decoder、buffer及条件本地输出已闭合；UsbSensor对这两个opcode走不同分支。实际启用哪套接口、是否出现0x33，仍需对应版本和记录，不能由兼容代码反推部署。
2. **测量队列与调度前提。** 五条取数后的余量及gain-sync日志前dirty/满队列条件已做限定核对；剩实际IRQ窗口、主循环延迟和USB复制时刻。共享日志缓冲分析维持中止、未验收状态。
3. **对照真实采集与发送记录。** 用同版本LSP、主控输出和日志核对布局、时间、通道与来源；对重入重点记录采样溢出、发送队列状态及实际USB复制时刻。合成读取假设不替代时序测量。
4. **补齐物理通道。** 已生成两侧32槽条件核对表；用板卡/走线和测量填入元件位置，见[硬件映射](modules/hardware.md)。协议槽数不能直接填成采集板数量。
5. **继续核心生理逆向。** 仍需对应算法组件或原始波形与结果。当前贯通模型止于模拟发布分支，不包含NATS服务、uploader/TLS、云端ACK和睡眠推理。

接收恢复、正常发送长度、异常payload和条件重入已各自限定覆盖，不再整项列为“未查”。整体优先级见[执行计划](reverse-plan.md)，所有原件与增量从[完整证据链](full-evidence.md)定位。
