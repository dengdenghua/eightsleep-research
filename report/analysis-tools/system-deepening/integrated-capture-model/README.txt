采样到发送队列的离线贯通模型
==========================
这是代码证据约束下的Python重建，不执行原厂固件，不访问账号、设备或网络。
输入值、回调缺口、消费暂停、丢包和发布返回码都是明确的合成场景。

直接复跑（vendor副本已保留，无需原研究目录）：
  python3 run_cases.py
或把结果写到其他目录：
  python3 run_cases.py --output /absolute/output/path

查看一个输出点的来源：
  python3 trace_point.py --case results/one_missing_callback_left --stream buzzer --side left --slot 100

输出链：
  合成signed24/ready缓存 → 30 ADC/12 IMU FIFO → 5:1组包
  → canonical 0x3c/LSP字节 → Frank接收器模型与严格解析器对照 → host mapper/秒桶
  → buzzer/IMU RAM → 两个连续CBOR map → Frank raw队列
  → 注入js_Publish返回码后的保留/弹出

范围：
- 固定500字段/2 tick步长，flags=0xf200，双侧、稳定参考时间，compat=False。
- gain400来自所复用主控配置模型；不是由MCU数字倍率4推导。
- 未模拟SPI、实际ADC时钟/模拟滤波、PMA/USB时序、真实并发、分配失败、
  multi/extADC、libnats、NATS服务、uploader/TLS、云端ACK或生产算法。
- 只有规范完整LSP进入贯通场景；接收器模型每帧按1/72/剩余字节的用户态read分块接收。
  这不是USB物理包长。CRC通过后payload解析与严格研究解析器对照；错误行为另见host-usb-receiver。
- 主控自动刷写被逐次捕获；最后两个未达刷写条件的秒桶保留pending。
  不调用空flush来补造结果。
- 研究用source/component_origins/host_copy不在生产0x3c/CBOR字段中。
- worker在全部输入结束后人工推进，不用于估算真实并发、吞吐或队列积压速度。
- raw_queue_full预载16条明确的外部fixture消息；不声称由本轮传感输入生成。
- one_missing_callback_left省掉一个指定调度事件，不声称实机IRQ已漏执行。
- lost_left/right_batch在MCU队列已pop之后注入整包缺失，不归因具体USB故障。

每个case目录：
  left/right.lsp                   规范合成字节；含所有被送入主控模型的帧
  dropped-*.lsp                    有意不交给主控的完整合成帧（若有）
  mcu-snapshots/imu-snapshots.jsonl 缓存内容与各成分来源标签
  packets.jsonl                   ADC/IMU配对、源序号、帧偏移与哈希
  host-inputs.jsonl               真正从LSP解析后适配的记录
  host-events.jsonl              时间映射、覆盖与消费事件
  host-dispositions.jsonl        各输入的pending/丢弃/输出贡献
  receiver-events.jsonl          分块读取与CRC通过事件
  stealth-*.cbor                 模型编码字节，不是设备抓取文件
  output-provenance.jsonl         每侧每个输出槽的值与来源，包含sentinel槽
  queue-events.jsonl              入队、拒新、同body发布尝试与结果
  SUMMARY.json                   场景结果与边界
  results/RESULTS.json            八场景汇总与校验

prepare_vendor.py只用于从指定原研究目录重新整理依赖。INPUTS.json记录
每份原模型副本、精确抽取的Queues类及原ELF/BBIN的SHA256。
vendor/reference/upload-distortion-model.py只保留为来源，不导入执行；
实际Queues来自同一文件的AST完整类片段，未把符号序号当真实采样。
