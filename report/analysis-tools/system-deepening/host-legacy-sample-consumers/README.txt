正常 0x34/0x35 采样包消费者契约（2026-11-08）

先读 FINDINGS_ZH.txt；结构化接口见 CONTRACTS.json。
EVIDENCE_MAP.json 提供 40 个源码位置、行号、地址或匹配文本及源文件 SHA。
INPUTS.json 是三个原件身份；REUSED_SOURCES.json 是 18 份保留副本的来源；BYTE_VALIDATION.json 是原指令字节/直接分支/literal 检查；RAW_TABLES.json 保留直接读取的 ELF 表与字符串。
COMMANDS.json 保留五轮 readOnly/noanalysis 导出的 argv、shell、退出码和日志位置；pass4 是会话内有界 switch 修复，未保存工程。

model/normal_contracts.py 是有限规范包模型，不是原厂程序执行。它只研究 216 B 的 0x34 和 176 B 的 0x35，固定稳定时基、无补点，保存人工标号数据与逐次解码记录。MODEL_RESULTS.json 中 2 个布局、8 组检查通过；model/results 的 14 份产物有各自 SHA。不会连接网络。

可复跑命令（按当前根目录，可整体换成实际搬迁位置）：
python3 model/normal_contracts.py
python3 scripts/validate_evidence.py
验证脚本的原件默认位于此目录上三层研究根目录；搬迁时需保留原研究树结构。脚本不启动 Ghidra或原厂二进制。

COVERAGE.json 列完成范围与缺口；INDEPENDENT_REVIEW.json 记录独立审阅范围，未将有限复核写成全程序验证。
SOURCE_MANIFEST.json 记录本目录全部文件（清单本身及 __pycache__ 除外）。目录冻结后不能在原地改动，应在新目录产生新版本。

关键界线：当前 UsbSensor 对两个 opcode 没有这条采样消费链；旧式 Sensor 配置/部署未知。输出键名不证明物理单位，本地主题不证明云端已收到。
