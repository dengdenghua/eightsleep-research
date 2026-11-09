# 缓存、发布与上传

本层负责 Frank 发送队列、本机消息缓存、封装与上传。Frank 队列满时拒绝新消息，NATS 的目标配置则在流超额时淘汰旧消息；它们是不同层的保留策略。

这层把 Frank 和附件生产者的本地消息排队、封装、压缩并上传。已经恢复的 uploader append 路径复制原 payload，不在此处把压电/IMU 数组变成心率或睡眠标签；但它收到的“raw”此前已经经过 MCU 缓存、主机时间与缺口处理。样本为 Rust AArch64 `jetstream-uploader`，SHA256 `a93fef74e2bb1d61e36979a9d1997afecf1b4655ebe6190e2887dac95262fe06`。[上传协议](../../evidence/analysis/sleep-pipeline/UPLOADER_PROTOCOL.txt)

## 数据从哪里来，到哪里结束

```text
Frank 编码后的 subject + CBOR body
    → Frank 进程内发送队列（满时拒绝新消息）
    → worker 调用 js_Publish（成功才弹出队首）
    → localhost:4222 NATS / JetStream
    → raw.* 映射为 rawmem.*，进入 RAM 流
    → uploader 按 subject 与时间聚合原字节
    → CBOR {seq, topic, data} 记录
    → batch 的 stream 字节块
    → 持续 deflate writer → TLS 连接 → 云端 raw 接收边界
```

uploader 会把 `rawmem.` 前缀还原成 canonical `raw.`。每条 `data` 里是聚合后的生产者 CBOR sequence；外层多重封装本身不是特征提取或睡眠 epoch。单 payload 大小门限与配置的 batch 大小门限也属于不同层次。[append 与编码调用链](../../evidence/analysis/sleep-pipeline/UPLOADER_PROTOCOL.txt)

## 编码之后、NATS 之前还有一层队列

`flushChunkToJetStream`（`0x001E9390`）把 subject 和 CBOR body 交给 `0x001F49B0`，后者复制消息进入 Frank 的环形队列。队列满时返回 false，不覆盖最早消息；调用方记录失败后仍释放临时 body，并推进本地 logger 的 seq。已消费的秒桶和已清空的编码缓冲没有在这条失败路径恢复。因此，成功编码的 body 仍可能在到达 NATS 前丢失，seq 前进也不能作为投递成功计数。

本样本的 raw 队列可同时等待 **16 条消息**，由 Stealth、Piezo 和若干状态消息共享；raw.log、raw.events.* 分别有独立的 1024、32 条队列。容量按消息条数计，不是采样点数、字节数或固定秒数。另有 16 条 core 队列：worker 先处理 core，再经过 KV 协调等条件，才轮转扫描三个 JS 队列，不能把模型当作完整 worker 或实际吞吐测量。

`0x001AFE00` 取队首调用 `js_Publish`。API 返回 0 才释放消息并前移读位置；非 0 时保留队首，清理连接状态后进入重建连接路径。这里是本地发布状态机，不是云端 batch ACK。发布超时不能证明 NATS 一定没有存入消息；随后重试相同 body，也不能直接记为服务端已经产生重复。需要同源发布记录、服务端序号与确认结果才能判断实际遗漏或重复。[发送队列代码证据](../../evidence/analysis/prepublish-queue-20261108/code-audit/FINDINGS_ZH.txt)

失败不前移 JS 轮转起点，但下一轮会重新扫描；只有失败队列持续是首个非空队列，后续队列才会一直受阻。清除运行标志后，worker 在下一次检查时返回，并不自动排空；正在进行的发布可能先完成。继续核对了正常 main 停止、线程包装析构、main 全部异常表入口与 KV 门控：join 不等于排空；异常也不一定经过正常 stop。任意间接回调和全系统其他保存机制仍未穷尽，见[系统分析](../system-deepening-20261108.md)。

旧 HOST-01 的 34 场景止于 `body_candidate`，RAW-02 覆盖的是 NATS 流内额度与 `discard=old`。此前独立发送队列模型的10个合成场景与1024个有限操作序列使用占位消息；8个贯通场景，实际传入由上游模型编码出的CBOR原字节。两组覆盖分别计数，均不是NATS或云端投递实测。[队列独立模型](../prepublish-queue-20261108.md) · [贯通结果](../capture-pipeline-20261108.md)

## 合成采样现在能追到发布尝试

模型保留从MCU缓存/FIFO、规范LSP、主控桶到CBOR的逐点来源，再把同一body字节交给Frank队列模型。队满场景预载16条明确标注的外部fixture，随后生成的采样body被拒绝，没有该body的发布尝试；既有桶不会因此恢复。

失败后重试场景只重新尝试同一个队首，body的SHA保持一致，logger序号只推进一次。发布返回码由场景注入，未运行libnats、NATS服务、uploader/TLS，也没有观测ACK；非0不证明远端未写，0不代表云端确认。8场景的9个候选同为30,128字节，但包含完整、缺值、旧值或复制值；这个固定配置下的大小不能作为信息完整性指标。[逐阶段来源与结果](../../evidence/analysis/system-deepening-20261108/integrated-capture-model/FINDINGS_ZH.txt) · [适配契约与限制](../../evidence/analysis/system-deepening-20261108/integration-contract-review/FINDINGS_ZH.txt)

## 协议结构

```json
{"proto":"raw","part":"session","dev":"<设备身份>","specialization":"<类别>","version":"2","compression":"zlib"}
{"proto":"raw","part":"batch","id":"<批次整数>","stream":"<CBOR indefinite byte string>"}
{"seq":"<序号整数>","topic":"raw.x.sens.stealth","data":"<原始 payload bytes>"}
```

以上是结构示意，不是可直接发送的请求；尖括号字段已省略身份。`version` 是文本 `"2"`。初始 session 声明与 ACK 发生在安装压缩 writer 之前；之后压缩包围 CBOR 协议流，不只是 `data` 字段。已确认持续 deflate 调用，但未独立恢复 wrapper bits/调优参数或以抓包验证解压互通。[CBOR 与压缩边界](../../evidence/analysis/sleep-pipeline/UPLOADER_PROTOCOL.txt)

默认主机为 `raw-api-upload.8slp.net:443`，运行期 `/persistent/deviceinfo/endpoints.json` 的 `rawApiUpload` 可覆盖，因此默认值不是当前国行设备实际域名的证明。这里是直接 TLS 客户端协议，尚未恢复 HTTP pathname，不应虚构 POST 路由。返回结构中 `proto/part/id` 用来确认 session 或 batch，并非睡眠阶段向量。[连接与 ACK](../../evidence/analysis/sleep-pipeline/UPLOADER_PROTOCOL.txt)

## RAM 与磁盘是两个缓存层

| 对象 | 样本的目标配置 | 实际限制 |
| --- | --- | --- |
| raw_mem | Memory，subject rawmem.>，max_age0 | 容量、进程寿命与数据速率仍限制保留；0不是无限保存 |
| raw | File，目标6 GiB、24小时 | 配置更新可能失败，不是实机已经保留24小时的保证 |
| NATS 总量 | max_mem1G、max_file12G、sync_interval60s | 总预算需与其他流共享，不是 raw 的专属额度 |

未指定显式 RAM 配额时，代码按 MemTotal 算预算：`A=min(M/32,100 MiB)`，`C=min(max(M−1536 MiB,0),512 MiB)`，`B=max(A,C)`；解析失败或零结果回退32 MiB。1 GiB→32 MiB、2 GiB→512 MiB只是算式示例，未测用户设备内存。[容量推导](../../evidence/analysis/sleep-pipeline/LOCAL_STORAGE_ZH.txt)

已把显式配额R对应到`[jetstream].mem_max_mb`，缺省0选择自动计算。新建raw_mem配置实际序列化为`discard:"old"`；同包NATS机器码确认超额时循环删除最早消息，等于限额时不删。已识别RAM→disk入口来自`--dump`停止钩子，满载回收不是转存。因此磁盘24小时目标不保证断网全天波形。已有流配置差异检查不单独比较discard，仍需读实机stream info确认生效值。[额度、序列化与NATS执行证据](../../evidence/analysis/finishable-20261107/raw-upload/RAW_02_FINDINGS_ZH.txt)

## 四个边界不能混成一个

1. **主机消费水位：** 原始秒桶已被 loader 消费，不表示云端接收。
2. **Frank 发送队列接收：** 消息已复制进本进程队列，不表示 `js_Publish` 已执行或成功。
3. **本机发布成功：** Frank 按 `js_Publish` 返回 0 弹出队首；停止转存另有等待 JetStream PubAck 的路径。API 成功返回、本机接收与介质持久化仍需区分，当前静态审计不是实测 ACK 抓包。
4. **云端 batch ACK：** 校验 `proto=raw`、`part=batch` 与期望 id；通过后才推进相应 delivered 状态和清理门控。

RAM direct 清理还比较流创建时间，以免 NATS 重建后序号复用造成错误删除。磁盘路径需要已同步的 delivered 记录，并非每个 ACK 立刻删除物理文件。[ACK 与清理](../../evidence/analysis/sleep-pipeline/LOCAL_STORAGE_ZH.txt)

正常停止转存采用连续成功前缀水位，失败消息不被后面的成功越过。RAM purge 先于最终 `syncfs`；后者失败没有恢复出的 RAM 回滚路径。删除超时又可能保留两份副本。停止钩子有超时，突然断电、强杀或流程未完成时不保证 RAM 保存，也不能简单说“任何失败都会保留原副本”。[耐久性边界](../../evidence/analysis/sleep-pipeline/LOCAL_STORAGE_ZH.txt)

## 到云端后还缺什么

当前恢复的是样本中的设备出站调用链与多层保留、确认条件，不是一次实测端到端投递。云端如何选择通道、去体动、分离同床信号、估算 HR/HRV/RR 以及生成睡眠阶段，没有在这些 ACK 或 uploader 中恢复出来。客户端取得云端结果是另一条接口链，不能把返回结果反推成服务端完整实现。

## 待办与验收

- **RAW-01，需实机材料：** 导出有效 endpoints、stream info、MemTotal 与启动参数的脱敏快照，核实覆盖主机、容量、age 与 discard 策略；配置文件目标值和实际值分别记录。
- **RAW-03，需实机材料：** 对用户自有数据保留脱敏 TLS 协议抓包或合法解密记录，校验 session/batch/压缩互通、ACK 与重连重复边界；不采集其他账户。
- **RAW-04，需实机材料：** 在受控副本环境做断网和正常停止实验，对照输入来源、PubAck、delivered 与落盘内容；分别统计遗漏/重复，物理断电另设条件，不能从模型外推耐久性。
- **RAW-05，限定静态与模型范围已完成：** 队列容量、满拒新、失败保留及生命周期已有代码依据；继续将合成CBOR原字节接到入队和发布尝试。当前缺口是同源实机记录与NATS接收对应，不由合成返回码推定远端未写入或重复。[贯通范围](../capture-pipeline-20261108.md)

关联模块：[主机信号组织](host-signal.md)、[传感采集](sensor-mcu.md)。

## 实时接入与截取

见 [实时采集与上传截取](../realtime-capture.md)：接口、前提、验证顺序及停止条件。

## 同包 libnats 与生命周期分析

`js_Publish` 的同包实现会等待本机响应并解析 JSON/API 错误，不只是 socket 写入。默认请求等待参数为 5,000 ms；所审 Frank 路径没有逐消息 MsgId 设置。库允许部分 ACK 字段缺失，Frank 也不另验 stream/seq/duplicate，所以本机成功、磁盘持久化和云端确认仍要分开。KV 状态同步、正常/异常退出和去重边界见[系统分析](../system-deepening-20261108.md)及[libnats 证据](../../evidence/analysis/system-deepening-20261108/nats-library/FINDINGS_ZH.txt)。

## 本地处理补充

[附件遥测](../algorithms/local-accessory-telemetry.md)补齐 Capybara 的字段转换、秒分组与独立发布队列。气囊[校准与床架运动控制](../algorithms/local-calibration-and-motion.md)、[音频播放](../algorithms/local-audio.md)也已展开。各链按处理对象区分，不能套用同一种队列或算法规则。
