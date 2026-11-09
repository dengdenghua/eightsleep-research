# 本地采样前处理：公式、控制流与数据边界

设备上传之前，会先转换数字、平滑读数、暂存和分组，再安排时间位置。这些步骤会影响上传值是否新鲜、放在什么位置、被标成什么时刻；但从这些输入算出心率、呼吸和睡眠阶段的完整实现，仍没有取得。

以下公式和伪代码只解释已下载的官方样本；伪代码省略日志及错误计数，不是原厂源码。

MCU地址属于 USB `firmware-sensor-g0-usb.bbin` 5.5.34.0，整体映射基址 `0x08010000`；主机地址属于 Frank SHA256 `84727b57ef8b226c78618f9fa9257df7d8ae771c78d8a51e6f3cabf0acc0c375` 的 Ghidra基址 `0x00100000`。两类地址不能混用；当前实机版本、制造页和物理安装位置仍未与下载样本完整绑定。[样本与采集链](../../evidence/analysis/sensor-mcu/SENSOR_ANALYSIS_ZH.txt)

## 1 ADC 数值转换与通道映射

芯片送来的是字节，程序先把它们还原成带正负号的数，再放进指定位置。位置变化只是软件重新排列，不代表已经知道传感器在床上的位置。

输入是 ADS 转换器的 SPI 帧中每通道的三个字节，字节序为大端，数值为24位二进制补码。输出为某个软件通道槽里的 int32 counts，而非伏特或压力。读取函数 `0x0801D7DC` 的正常路径先验证状态与 CRC，再仅更新 ready mask 为1的通道。数值运算可表达为：

```text
u = (byte0 << 16) | (byte1 << 8) | byte2
x = u - 2^24  if (u & 0x800000) != 0  else u
y = x * software_multiplier
output[channel_map[source_index]] = y
```

因此 `00 00 01 → 1`，`FF FF FE → −2`，`80 00 00 → −8388608`。在软件倍率4的分支中，分别变为4、−8、−33554432。负值由符号扩展得到，不能先按无符号24位扩大再解释成力。所恢复路径未减去单独的用户偏置，也未按逐通道灵敏度转物理单位。[格式与映射](../../evidence/analysis/sensor-mcu/SENSOR_ANALYSIS_ZH.txt)

制造信息决定初始通道 map，运行期 `opcode 0x47` 又可读取、重置或设置它。八项模式只检查每项落在0..7，并不检查是否为一个排列；若两个源通道映到同一目的槽，后处理的有效源会覆盖先处理者。故该操作更准确地说是“按表写入”，不应无条件当作无损置换。

在 K60 条件成立、初始化成功且没有后续重映射的样本路径中，ADC1 表为 `[3,2,1,0,4,5,6,7]`，ADC0 描述符被禁用。ADC1 的第0源若读取 `FF FF FE`，软件乘4后写到该 ADC 的目的槽3，即主机 wire11；主机消费的 wire8..12 因而来自 ADC1 源3、2、1、0、4。这个例子只确定软件索引，不能由 wire11 推出传感片处于躯干的某个位置。[K60 条件链](../../evidence/analysis/account-readonly/k60-binding/FINDINGS_ZH.txt)

## 2 PGA、软件 gain 与上传元数据

一种放大发生在转换芯片里，另一种是在读出数字后再乘倍率。命令里写了多少、芯片是否真的改成功、上传文件标了多少，需要分别核对。

PGA setter `0x0801D940` 把请求值按下列门限量化为器件 gain code；每组 ADC 的八个通道共用请求，不是八个独立校准系数。

| 请求范围 | gain code | 器件 PGA |
| --- | --- | --- |
| 100..199 | 0 | 1× |
| 200..399 | 1 | 2× |
| 400..799 | 2 | 4× |
| 800..1599 | 3 | 8× |
| 1600..3199 | 4 | 16× |
| 3200..6399 | 5 | 32× |
| 6400..12799 | 6 | 64× |
| ≥12800 | 7 | 128× |

这是 setter 内的转换表，不代表手机或所有主机入口允许发任意范围。`opcode 0x2B` 接收两个 BE16 请求：零表示沿用该组请求，非零但≤99不会更新，>99且变化才设 dirty（等待写入或重试的更新标记）。正常多通道默认请求100对应 PGA1×，ADC1 随后仍可软件乘4；“输出 gain400”不能直接解释成实际模拟 PGA4×。

命令回显立即发生，尚未等主循环写 GAIN1/GAIN2 并读回。成功才清 dirty；失败保留 dirty，但两种结果都会走队列 flush/sync。主机 Stealth 元数据又来自独立默认表 `[100×8,400×8]`，已追常规路径没有把实时 PGA 回读同步进该表。应分别记录“请求值、读回成功、软件倍率、上传元数据”，不可将它们合并成一次已验证的标定。[PGA 写入和回显](../../evidence/analysis/sensor-mcu/FRONTEND_DSP_ZH.txt)、[主机 gain 来源](../../evidence/analysis/signal-host/GAIN_METADATA_ZH.txt)

## 3 ADC 抽取滤波与频率响应

转换器先把连续读数平滑，再降低输出频率。下面的公式解释这一步会怎样改变信号和带来延迟，还不是心率或呼吸的提取公式。

`CLOCK` 写入选择 HR（转换器的高分辨率模式）、OSR8192。结合已匹配 ADS131M08 寄存器语义，正常稳定转换采用 sinc3 抽取1024，再经过 sinc1 抽取8。第二级在第一级输出速率上工作，所以换回调制器采样域时，它的抽头间隔为1024，而不是再接一个相邻八点平均。

以调制器采样周期定义 z，有：

```text
H1(z) = [(1 − z^(−1024)) / (1024 × (1 − z^(−1)))]^3
H2(z) =  (1 − z^(−8192)) / (8 × (1 − z^(−1024)))
H(z)  = H1(z) × H2(z)
f_out = f_mod / 8192
```

若 `ω=2πf/f_mod`，对应幅度响应为：

```text
|H(f)| = |sin(1024ω/2) / [1024 sin(ω/2)]|^3
         × |sin(8192ω/2) / [8 sin(1024ω/2)]|
```

分母分子同为零的点应取极限，直流增益为1。三个1024点均值卷积，再与间隔1024的八项均值卷积，得到10238个对称抽头；首末抽头之间跨度10237个调制器周期。因此稳态线性相位群延迟为：

```text
D = [3 × (1024−1) + 7 × 1024] / 2
  = 5118.5 个调制器周期
D / 8192 = 0.624816895 个输出采样间隔
```

独立卷积与频响核验得到半功率频率 `f/f_out=0.437072842`，第一个零点在 `f/f_out=1`。这些按输出速率归一化的结果不需要知道真实晶振频率。只有再假设物理 CLKIN=8.192 MHz、HR 下 f_mod=4.096 MHz、输出500 SPS，才能换算为半功率218.536 Hz、稳态群延迟1.249634 ms。启动/重同步的16984个 CLKIN 周期，在同一条件下是2.073242 ms，属于首个充分稳定数据的时间，不能与群延迟或整条上传链延迟互换。[滤波数学推导](../../evidence/analysis/sensor-mcu/ADC_FILTER_DERIVATION.txt)

未见正常 RESET 后写 ADS 的 DCBLOCK、phase、OCAL、GCAL；在成功 RESET 且仅执行已审写入的前提下，可推导高通未启用、相位默认、偏置0、校准乘数1。硬件校准运算块仍在，只是这些默认系数不产生用户校正。这个低通抽取链并没有把波形分成“呼吸输出”和“心搏输出”，也没有给出床垫模拟电路与机械耦合的完整频响。[寄存器写入边界](../../evidence/analysis/sensor-mcu/FRONTEND_DSP_ZH.txt)

K60/PN 条件分支的 `gm` 时钟表明确写活动输出2、3的 R-divider=1；其他分支的输出7则可能缺最终分频状态。寄存器表、物理 CLKIN 与到 ADC 的实际布线仍应分开核对，不能用 timer 请求500 Hz替代物理 ADC 500 SPS测量。[时钟分支](../../evidence/analysis/account-readonly/k60-binding/FINDINGS_ZH.txt)

## 4 IMU 配置、轴顺序与缺值处理

运动传感器分别提供转动和加速度读数。某一组还没准备好时，程序会保留那一组的旧值，而不一定停止整个数据包。

输入来自连续寄存器的六个 int16 LE，顺序为 Gx、Gy、Gz、Ax、Ay、Az；写入发送 cache时改成 BE16。`0x0801EF68` 读取 STATUS，XLDA只更新加速度XYZ，GDA只更新陀螺仪XYZ；失败或未 ready 的三轴保留旧值。正32767改成32766，为主机的32767缺值标记留空间，负32768保留。没有在这条输出路径旋转坐标、做姿态矩阵或按轴融合。

`0x080219D0` 在自检结束后再次 reset，之后 CTRL1/CTRL2=0x16、HAODR=2，对应所匹配寄存器家族的100 Hz配置；CTRL3=0x44设置 BDU 与地址自增。成功复位及这些写入条件下，正式量程推导为加速度±2 g、陀螺±125 dps。自检临时使用的±4 g、±2000 dps不能套用到正式流。

额外 gyro LPF1、accel LPF2、高通与用户偏置补偿没有在这条正式初始化链启用，但加速度第一阶段滤波仍在；其所匹配模式的标称带宽为 ODR/2，即配置100 Hz时50 Hz。输出仍保存 counts，未发现将它们按这些量程直接变成 g 或 dps 再上传的运算。量程和带宽是复位/寄存器语义推导，芯片标识尚未唯一锁定封装，更不是实测频响。[IMU 初始化、轴顺序与自检](../../evidence/analysis/sensor-mcu/FRONTEND_DSP_ZH.txt)

## 5 缓存新鲜度与快照一致性

定时保存一次记录，与芯片刚完成一次新测量，是两件事。程序保存的是当时暂存区里的内容，所以不能把记录数量直接当成全新测量的数量。

ADC helper 的返回“成功”并不等于所有通道都有新值。其主要分支可归纳为：

```text
if ADC disabled:
    return success                       # destination 不变
if elapsed_since_gain_or_sync < 8 ms:
    destination = backup
    return success
if not DRDY or SPI失败 or 接收CRC失败 or ready_mask == 0:
    return failure                       # destination 不变
for each enabled source channel i:
    if ready_mask bit i:
        destination[map[i]] = signed24(raw[i]) * multiplier
backup = destination
return success
```

主循环外层另有 enabled/DRDY 检查，因此这个局部伪代码不是每次 IRQ都会完整执行的流程。SPI CRC 使用 polynomial0x1021、初值0xffff；它和外层 LSP CRC 的初值0x1d0f不同。ADC cache 初始由清零产生，而主机空槽用 sentinel 初始化，这两类零/缺值也不可互换。

定时 IRQ `0x080233F4` 复制当时全局 cache，不等待下一次 SPI 成功，也不附带逐通道 ready mask。各通道逐个存储，没有整组提交的临界区或双缓冲交换；IRQ 可在部分通道写入后取得新旧混合快照。这里说的是多通道整组一致性，不是在推断单个对齐整数被撕裂。[新鲜度与快照审计](../../evidence/analysis/sensor-mcu/SAMPLE_FRESHNESS_ZH.txt)

在指定的500次快照、每次只更新五通道中的一个且循环轮换的模型中，2500个通道值有2000个沿用旧来源，比例80%，最大来源年龄4 callback；helper却可每次都因非零 mask 返回成功。这个80%是人为输入的算例，不能当成设备实际陈旧率。线上只有数值和可用 flags，不能从两个相等读数区分“身体确实不动”与“缓存重放”。[可复算的缓存输入](../../evidence/analysis/device-side-followup/upload-distortion/FINDINGS_ZH.txt)

## 6 ADC/IMU 队列配对与恢复相位

两类读数排在各自的队列里，再按固定数量取出配成一包。它们没有逐条核对采样时间，所以堵塞或清队列后，配到一起的读数可能来自不同时间。

定时器请求500 Hz。ADC FIFO 容量30条，每条80 bytes；IMU FIFO容量12条，每条48 bytes。采样计数与消费规则如下，满时分别丢弃新记录：

```text
每个 callback:
    try_push(ADC_FIFO, 当前 ADC cache 与 tick)
    mod5 += 1                            # ADC push 失败也推进
    if mod5 == 5:
        mod5 = 0
        try_push(IMU_FIFO, 当前四组 IMU cache)

消费者:
    if ADC_FIFO.count >= 5 and IMU_FIFO.count >= 1:
        adc[0..4] = pop_five(ADC_FIFO)
        imu = pop_one(IMU_FIFO)
        发送 adc[0].tick、当前 flags、frequency=500、五帧ADC和一块IMU
```

五条 ADC 中只有第一条 tick进入 `0x3c`，其余四条 tick以及内部 PGA请求不发送；IMU记录根本没有 tick。主机按频率推导后四点时间，把同一 IMU block复制进五个内部 sample，再由 loader 按下标每五项取一次；没有五点平均，也不是500 Hz的新 IMU测量。[队列和打包地址](../../evidence/analysis/sensor-mcu/SAMPLE_FRESHNESS_ZH.txt)

消费者暂停60 callback的模型留下 ADC1..30、IMU5..60；先排出六个正常包后，ADC61..65会配到仍在队首的 IMU35。后续恢复等量生产消费，并不自动抹掉来源偏差；所算后续40包均为−30 callback。只有实际 callback 等间隔500 Hz时，才能换成软件快照差60 ms，仍不等于芯片转换相位差。

增益 dirty 路径用 `0x08026722` 先排 ADC再排 IMU，但不重置 mod5（控制每五次取一份 IMU 的相位计数）；启动函数 `0x080268C8` 才额外清相位。无中断交错的 flush 后若保留相位p=0..4，下一个 IMU在第5−p次 callback出现，而第一组 ADC在第5次凑齐，所以模型包的“IMU序号−包末ADC序号”为−p。p=4时，若一个 IRQ恰在 ADC已排空、IMU未排空之间进入，其 ADC留下而 IMU被清，例子又可从−4变成+1。这说明恢复动作要连同相位和两条队列顺序分析，不能只看“已flush”。[增益恢复控制流与模型](../../evidence/analysis/device-side-followup/recovery-round/gain-recovery/FINDINGS_ZH.txt)

## 7 MCU tick 到主机时间的映射

设备上报的是自己的计时数，主机要把它换成带日期的时间。这里用一个参考时刻直接加上经过的毫秒数；重新设置参考时刻时，结果时间可能跳动。

主机 `0x0021A6D0` 设置 `step=floor(1000/frequency)`，检查阈值为 `2×frequency`。USB路径配置500，因此预期步长2 ms、检查阈值1000次。首次 `0x0021A370` 同时保存当前 MCU tick和 `floor(system_clock_ns/10^9)`，即整秒墙钟锚点，未保存当时墙钟的小数秒。

```text
delta_ms = uint32(tick − anchor_tick)
relative = delta_ms
epoch = anchor_epoch + floor(delta_ms / 1000)
slot500 = floor((relative % 1000) / 2)
```

这是固定斜率映射，没有已恢复的时钟 ppm 误差估计或波形重采样。`uint32` 减法允许自然回绕在相应条件下保持连续；tick归零却不必等同自然回绕。已经初始化时，检查计数达到1000或 tick小于上一值会进入参考检查。预测整秒与当前整秒差的绝对值严格>2才按漂移分支重建；另有共享同步位路径。日志写“ms”不能把这个阈值改读成2毫秒。[mapper 指令与算式](../../evidence/analysis/signal-host/TIMING_CONTINUITY_ZH.txt)

指定每次tick+2并只在检查点注入墙钟阶跃的模型中，±2秒不触发该分支；+3秒使相邻输出差3002 ms，−3秒使输出倒退2998 ms。没有物理同步或传输延迟测量时，这些只描述映射器的输入输出，不证明两侧 ADC已经按绝对UTC毫秒对齐。[受控阶跃](../../evidence/analysis/device-side-followup/recovery-round/time-recovery/FINDINGS_ZH.txt)

## 8 单点复制与跨秒边界

程序只对特定的单点缺口做补值，办法是复制后一个读数。遇到恰好跨秒的位置时，还要留意“属于哪一秒”和“这一秒的第几个位置”是否一起调整。

`0x0021A5C0` 只有在上一 tick非零，且 `uint32(tick−last_tick)==2×step` 时给出补点标志。正常一步不补，缺两点及更多也不生成连续插值。caller先构成当前完整 sample，然后先送出其复制件、再送当前点：

```text
sample.epoch = anchor_epoch + floor(relative / 1000)
sample.relative = relative
if 补点标志:
    copy = sample
    copy.relative -= step
    enqueue(copy)                         # epoch 不随之调整
enqueue(sample)
```

伪代码最后一行表示正常点始终继续入队；两次调用仍需通过容量和水位门控。非跨秒时，这把下一点值复制到前一槽，不是前后均值。若前点10996、当前11000、anchor_tick10000、anchor_epoch=E，缺失位置本应是(E,998 ms)。原 caller在 `0x0027F1E4..0x0027F230` 已将 epoch加成E+1，再仅减 relative，因此副本进入(E+1,slot499)，当前点进入(E+1,slot0)。真正下一秒的slot499若在flush前到达可覆盖它，否则可能保留错放副本。[补点与跨秒边界](../../evidence/analysis/signal-host/TIMING_CONTINUITY_ZH.txt)

## 9 双侧 loader 与主侧选择

左右合并时，程序会先选一侧来提供时间位置。它按缓存里有多少个秒分组来选，不是在判断哪一侧信号更好；因此同一个缺口落在哪一侧，会影响后续保留多少数据。

每侧维护有序秒桶，每桶500条124-byte sample。入队索引为 `floor((relative%1000)/2)`；同侧同秒同槽再次到来整条覆盖，不平均、不保留多个候选。空槽的默认 epoch/relative为0，ADC为0x7fffffff，IMU为0x7fff；桶键不会自动填入每个默认 sample。

双侧 `0x001FFA70` 先按桶数选主侧P，右桶数大于左时P=右，否则P=左。再取P最早秒K，另一侧Q有同K桶才配对，否则走单侧。配对循环的时间和输出槽号取自P[i]；Q[i]只贡献同数组下标的数据，不检查其独立epoch/relative，也不按互相关、心搏峰或传感器位置校正。

```text
P = right if right.bucket_count > left.bucket_count else left
K = P.earliest_key
Q = other_side
if Q has no K:
    使用单侧 loader
else:
    for i in 0..499:
        t = P[K][i]
        buzzer_index = floor((t.relative % 1000) / 2)
        按本类型的 epoch/state 门控，装入 P[i] 和 Q[i]
        if i % 5 == 0:
            imu_index = floor((t.relative % 1000) / 10)
            按 IMU 类型门控装入同下标数据
    删除双方 K 整桶，推进已消费水位
```

这只是循环骨架，各输出类型有各自的 early-break分支，不应把它当成一次统一退出。关键后果是：当输出已接收非零epoch，主侧中间空槽的epoch0可触发停止，整桶尾部随删除丢弃；次侧空槽一般只是写 sentinel。主侧前导空槽则可能反复把次侧不同位置写到输出slot0，因为默认relative也是0。

受控模型里，左缺slot100..104、右完整，两侧各3桶使左为主侧时，该500槽桶只保留左右各100个真实来源；把右桶数改成4使右成为主侧，同样缺口则保留左495、右500。差别来自桶数和默认时间字段，不是算法认为右侧信号质量更好。该模型的调用条件“两侧各≥3桶”已满足；真实flush规则另有“任侧≥10桶”，单侧启用时则≥3桶，这些是桶数而非定时等待秒数。[双侧精确门控](../../evidence/analysis/signal-host/DUAL_SIDE_CONTINUITY_ZH.txt)、[定量模型](../../evidence/analysis/device-side-followup/upload-distortion/FINDINGS_ZH.txt)

## 10 消费水位与时间回退恢复

主机会记住哪些秒分组已经处理过，通常跳过后来补到的旧数据。时间大幅倒退时另有清理规则，但它按尝试次数计数，不能直接理解为固定等多久就恢复。

`0x001FDEC0` 的入队门控独立于 mapper。loader删除桶后以 `max(旧水位,K)` 更新水位W；新到样本若epoch≤W，通常直接跳过并返回true。这里true表示不需按“缓冲满”重试，不能解释为点已经保存，更不是云端ACK。

只看旧数据重置分支，其逻辑是：落后严格>30秒才累加共享计数（左右两侧共用）；累计第500次清空左右容器、水位，并记录当前epoch，继续跳过这一epoch直至输入换到另一个秒。落后≤30秒的旧输入不累加也不清零计数；通过水位的新输入会清零。完整入队还有同侧最早桶与容量等判断，因此这不是完整接纳判定函数。

两个例子说明计数含义：499次落后31秒，夹入100次落后10秒，再一次落后31秒，会在总第600次调用重置；而旧侧与新侧交替、新时间每次均过水位时，新输入可反复清计数。左右共用500次，不是每侧各500次。在固定W、每2 ms输入的子模型中，单侧第500次在998 ms，双侧交错在498 ms；两者仍可能等到1000 ms换epoch才首次通过门控。不能把计数直接翻译成固定一秒恢复。[恢复模型及指令范围](../../evidence/analysis/device-side-followup/recovery-round/time-recovery/FINDINGS_ZH.txt)

水位只约束后续入队，不自动删除此前已存在但键更早的次侧桶；故水位推进也不能证明后续本地输出绝对单调。把 mapper、双侧共享状态、所有容器、loader反馈和云端补偿合并成端到端运行行为，仍需要联合模型及同源实测记录。[保留旧桶的控制流](../../evidence/analysis/signal-host/DUAL_SIDE_CONTINUITY_ZH.txt)

## 11 CBOR 输出布局与端序

最后一步把整理后的数字按固定格式放进数组，方便下游读取。换一种存储格式并不会找回前面没有传过来的采样时间或新鲜度标记。

`0x00200960` 把 loader 的结果依次编码为若干 CBOR 对象，消息整体是 CBOR sequence，不是一个包住所有对象的外层数组。常规 Stealth 的 `piezo-buzzer` 每侧有五条 byte string，每条2000 bytes，按小端存500个 int32；`imu-multi-channel` 每侧四组，每组六条轴数组，每条200 bytes，按小端存100个 int16。这里不能把原始 SPI 或 LSP 的大端解释直接复用到 CBOR 样本内部。

编码不对这些 counts 再乘一次 gain，也不将多路合成单条生理波形。举例，MCU送出的 int32 −8 在 LSP 中是 `FF FF FF F8`，主机转换成整数后，其 CBOR 样本 byte string 保存为 `F8 FF FF FF`；CBOR自己的整数元数据仍依标准编码，不能把整份消息全体反转。上述布局允许离线解析器还原槽位和值，不能补回在线上已经省略的 ADC 后四个 tick、IMU tick、ready mask或来源序号。

`version/lver/rver` 从原 flags继承，包含器件可用位，未提供每点新鲜度证明。尤其 MCU在消费队列时读取当前全局flags，积压记录可能附上较后的状态；主机再据禁用组填 sentinel。于是“没有 sentinel”与“CRC/DRDY每次均成功”之间没有等价关系，空槽、禁用组、有效但重复的缓存需要分别理解。[CBOR 编码与路由](../../evidence/analysis/signal-host/SIGNAL_HOST_ANALYSIS.txt)、[flags 的取值时机](../../evidence/analysis/sensor-mcu/SAMPLE_FRESHNESS_ZH.txt)

## 12 编码后的发送队列

编码结果到达 `0x001E9390` 后，仍须通过 `0x001F49B0` 的 Frank 进程内环形队列。本样本 raw 队列可等待 16 条消息，由多个 raw 生产者共享，不能换算成固定采样秒数。满队列拒绝新消息，调用方只记录失败，随后释放临时 body 并推进本地 logger seq；这条分支没有回退已消费秒桶或重建已清空的编码缓冲。旧 HOST-01 模型的 `body_candidate` 只到编码候选，不代表通过了这一关。

`0x001AFE00` 对队首调用 `js_Publish`：返回 0 才释放并前移队首，失败保留队首并清理、重建连接。该策略与 NATS 在 `discard=old` 配置下超额淘汰最老流消息不同。重试次数只统计发布尝试；超时可能发生在远端已写入之后，不能据此确定未收到或实际重复。

这里改变的是消息保留和传输状态，不是波形滤波、质量筛选或生理特征计算。发送队列使用独立模型，不增加旧 34 场景的验收范围。[队列代码证据](../../evidence/analysis/prepublish-queue-20261108/code-audit/FINDINGS_ZH.txt) · [详解与模型](../prepublish-queue-20261108.md)

## 与生产生理算法的衔接缺口

前面这些步骤决定后续算法实际能看到哪些读数。要继续解释心率、呼吸和睡眠阶段，还需要取得从这些输入生成指标的那段实现。

上面各算法的输出仍是多通道 counts、flags、gain元数据和时间布局；上传器追加路径再按原字节组织 CBOR/TLS。它们可以改变后续生理算法的输入，但未给出服务端如何识别旧值、挑选质量通道、分离同床运动、计算搏间期或做睡眠分类的实现。进一步工作应把真实 LSP与CBOR逐点对照、当前版本绑定、运行期参数与时钟测量接上这些明确函数，而不是给未知生产链填入通用BCG算法。[后续任务入口](../roadmap.md)
