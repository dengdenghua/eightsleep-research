# 压电原始上传：压缩格式与截取边界

**冻结 MTK 样本的上传器使用持续的裸 DEFLATE 压缩流，压缩等级为 6。session 虽声明 `compression="zlib"`，实际未启用 zlib 包装。** 这一结论来自原始机器码、28 项隔离指令仿真和对应版本组件源码，不是实机抓包结果；当前 Pod6 是否运行同一二进制仍需核对。

## 数据经过哪些封装

```text
Frank 产生压电／IMU CBOR
  → 本机 NATS / JetStream 缓存
  → uploader 按主题和时间拼接原 payload
  → CBOR {seq, topic, data}
  → CBOR batch 的 stream 字节块
  → 同一连接持续的 raw DEFLATE
  → TLS
  → 云端 raw 接收服务
```

上传器已恢复的 append 路径直接复制 payload，没有在此处计算心率或睡眠阶段；但上游 MCU、主控的补点、缺值和时序处理仍会改变输入。这里的“原始”指上传链保留的生产者字节，不等于未经处理的 ADC 电压。[缓存与上传模块](modules/raw-upload.md)

设备上传与 App `/live` 是两个接口。这个上传器通过 TLS 传输 CBOR，尚未发现对应的 HTTP POST 路径或普通账号下载接口。默认主机为 `raw-api-upload.8slp.net:443`，可由 `/persistent/deviceinfo/endpoints.json` 中的 `rawApiUpload` 覆盖，不能将默认地址视为国行实机的有效地址。

## 压缩格式的机器码证据

目标 SHA256：`a93fef74e2bb1d61e36979a9d1997afecf1b4655ebe6190e2887dac95262fe06`。下表地址使用 Ghidra 基址 `0x00100000`。

| 位置 | 已确认行为 |
| --- | --- |
| `0x0027DBC0–0x0027DBC8` | 调用构造入口前设置 `w0=6`、`w1=0` |
| `0x00433F24` | 跳转到 `0x00434034`；不能直接把反编译的形式参数位置当作真实寄存器传参 |
| `0x004340A4–0x004340BC` | 保留等级 6，并把关闭 header 的输入转换为格式枚举值 2，调用参数设置函数 |
| `0x004341D0` | 使用等级表计算并写入 flags；生产参数得到 `0x80`，不含 `0x1000` header 位和 `0x2000` Adler32 位 |
| `0x00797072` | 等级表为 `0,1,6,32,16,32,128,256,512,768,1500`；第 6 项为 128 |

固件字符串包含 `miniz_oxide-0.8.9` 源码路径。同版本公开实现中，`TDEFL_WRITE_ZLIB_HEADER=0x1000`，设置该位才写 zlib header，并在结束时写对应校验。固件参数设置指令与这一行为一致。[原始组件包](https://static.crates.io/crates/miniz_oxide/miniz_oxide-0.8.9.crate) · [来源与哈希](../analysis-tools/raw-wire-format/UPSTREAM_SOURCE.json) · [组件许可](../analysis-tools/raw-wire-format/upstream/LICENSE)

隔离仿真从 `0x004340A4` 开始，执行实际参数选择和被调用的设置函数，在 `0x004340C0` 停止。28 组输入包含生产参数、启用 header 的对照和等级边界；生产参数实际写出 `0x80`。它验证了这段原始指令，不代表完整压缩器输出、TLS 或云端已验证。

## flush 不代表一条新压缩流

`0x0028B414` 写入使用 flush 值 0；`0x0028B2B8` 在有待刷新数据时，以空输入和 flush 值 2 调用压缩函数。对照同版本组件，0 为 None，2 为 Sync，结束流使用的 Finish 是 4。已恢复的刷新路径没有重新构造压缩器。

因此应保留同一连接的解压状态。**不能按 TLS 包、网络读取块或每个 batch 重新初始化解压器，也不能把一次 Sync flush 当作整个流结束。** 中途截取即使解出完整 batch，也可能没有 DEFLATE 结束标志；这不自动说明丢包，但也不能证明后续没有缺失。重连后应单独保存新的 session 与压缩上下文。

## 打包门限不是采样频率

原厂 TOML 给出的目标配置为：

| 设置 | 值 | 含义和限制 |
| --- | --- | --- |
| `batch_max_bytes` | 262,144 bytes | 批次大小门限，不是单通道缓存或压电采样点数 |
| `batch_max_messages` | 100 | 批次消息门限，不代表每秒 100 个样本 |
| `batch_timeout_secs` | 2 | 批次等待参数，不保证云端每 2 秒收到数据 |
| `chunk_max_time_secs` | 2 | 按时间分块参数，不是睡眠分期窗口 |
| `batch_interval_ms` | 1024 | 上传调度间隔参数，不能当作生理信号采样间隔 |
| `recv_ack_timeout_secs` | 30 | 云端确认等待参数，与本地 live 工具选择的 30 秒无对应关系 |

此外 `0x003B06CC` 对单个 payload 使用 `0xBB800`（768,000 bytes）上限；超过时进入丢弃消息分支。按主题拼接时也检查聚合长度与时间。不能把这些不同层次的门限合并成“每包 256 KiB”或“固定两秒数据”。运行期配置和实际消息大小仍需实机记录。[原厂配置](../analysis-tools/raw-wire-format/source/jetstream-uploader.toml) · [分块代码](../analysis-tools/raw-wire-format/stream/003b06cc.c)

## 取得数据后的解析方法

已有离线工具支持裸 DEFLATE，8 项合成测试确认：session 仍写 `zlib` 时可以正确识别 raw 包装，拼接后的生产者 payload 保持原字节；强制使用 zlib 包装会拒绝这些测试输入。没有将 Python 生成的压缩流当作原厂输出。

以下命令仅适用于**已取得 TLS 明文、按单条连接和客户端方向重组、从 session 首字节开始**的文件：

```sh
python3 report/analysis-tools/decode_uploader.py client-session.bin --kind session-stream --wrapper raw --output decoded.json
```

如果明确是在持续连接中截取，并且需要读取已完整结束的 CBOR batch，可加 `--allow-open-stream`。该选项仍拒绝不完整 CBOR；输出保留没有压缩结束标志的限制，不能用它掩盖未知抓包缺失。服务端 ACK 必须单独解析和关联，不能混入客户端压缩字节流。

若从本地 NATS 得到生产者 CBOR，应按相应 topic 使用主控解析器，不要再套一次上传 session 解压。无论哪种路径，都先保留原始字节、时间、subject、序号及哈希，再展开压电数值；样本单位和通道身份另行验证。

## 取得真实波形仍缺什么

| 路径 | 当前能力 | 下一步验收 |
| --- | --- | --- |
| 主控 NATS 旁路读取 | 发布配置为本机地址；只有手机账号不能直接访问 | 取得主控本地访问，核对实际监听和主题，使用独立订阅保留原字节，不接管生产 consumer 或 ACK |
| 设备出站 TLS 明文 | 已恢复 session、batch、压缩参数和 ACK 结构 | 在自有设备取得合法的单连接双向明文记录，核对实际主机、身份机制、首个 session 与 ACK；当前证据不足以承诺普通代理可解密 |
| App live | 可登录查设备，但用户记录停在等待响应头 | 继续对照官方 App 实际请求；即使成功，也需证明 samples 与上传 raw 的对应关系 |

目前不缺解压格式的静态依据，缺的是**主控访问或真实 TLS 明文**。仅有路由器上的加密 TCP/TLS 抓包，尚不能还原压电样本；不能用 App 能调温来证明已取得 raw 上传权限。

## 证据与验证范围

[源码归属清单](../analysis-tools/raw-wire-format/SOURCE_LEDGER.json)记录 ELF 和配置与冻结 ZIP 成员的字节一致性。[字节复核](../analysis-tools/raw-wire-format/BINARY_VERIFICATION.json)覆盖 3,185 条导出指令、12,740 字节，与原始 ELF 逐项匹配；这不是整固件逆向完成比例。[28 项指令仿真](../analysis-tools/raw-wire-format/FLAGS_EMULATION.json)和[8 项合成解码测试](../analysis-tools/raw-wire-format/DECODER_VALIDATION.json)分别记录，均未访问设备、账号或云端。
