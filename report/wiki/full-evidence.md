# 完整证据链与材料入口

**精简存储（2026-11-08）：** 完整证据 ZIP 保留，重复解包目录已清理。日常直接打开报告；运行顶层材料启动脚本会重新解包并增加占用。本项目旧交付的废纸篓副本已清理，历史移动记录不再代表可恢复状态，当前记录见 `maintenance/space-cleanup-20261108.json`。

原报告侧边栏 **08 完整证据链** 提供材料下载、归档路径搜索及报告来源映射。**07 实时采集** 仍进入原登录与设备页面。查看报告和清单不需要登录；大文件由独立本机服务按需读取。

## 打开原件

双击项目中的 `启动材料浏览.command`，再从 [完整证据链页面](http://127.0.0.1:58764/report/index.html#full-evidence) 打开文件。材料服务地址为 `http://127.0.0.1:58766/`；原目录方式需要挂载包含证据包的移动硬盘；完整项目包可使用下文的相对目录入口。报告内容本身可以直接打开 `index.html` 离线阅读。

| 材料 | 保留范围 |
| --- | --- |
| 原始 MTK SWU | 官方下载字节、CPIO 成员、更新清单、内核与 rootfs |
| 完整 rootfs.tar | 13,626 个逻辑条目，包括原始链接和元数据；另有普通文件浏览副本 |
| 原始国行 APK | 7.63.5-cn-tencent 的 3,492 个成员均已匹配 |
| 研究归档 | 107,095 个文件、6,767 个目录；反编译、Smali、机器码、脚本、分析日志、索引与 Ghidra 工程 |
| 来源映射 | 78 份既有报告的源文件、归档位置、原始哈希及脱敏后哈希 |
| 增量 | [Frank 发布前队列](prepublish-queue-20261108.md)、[系统分析](system-deepening-20261108.md)、[传感/床架分析](sensor-and-control-20261108.md)、[采样→发布贯通及接收校验](capture-pipeline-20261108.md)、[本地处理全景](local-processing-20261108.md)与[参数/恢复/保存分析](local-followup-20261108.md)：函数证据、可复跑工具、逐指令核验和独立增量包 |

完整包是 2026 年 11 月 7 日的冻结版本；网页、Wiki 和分析单独更新，没有悄悄覆盖旧校验值。对应清单已内嵌网页，见 [结构化材料清单](../data/full-evidence.json)。

## 完整项目包与迁移

当前完整交付目录为 `/Volumes/My Passport/EightSleep/`。版 HTML 和 Wiki 在 `report/`，原字节完整材料 ZIP 及解包内容在 `materials/`，独有分析工程在 `workspace/analysis-work/`。双击顶层 `启动完整项目.command` 打开报告和只读材料服务；报告也可直接离线打开。旧交付 ZIP 与重复项目已移入废纸篓，恢复映射见顶层 `maintenance/cleanup-receipt.json`。

材料外层ZIP含10,576个条目，约3.81GB解包内容；其中`research-evidence.tar.gz`继续保留107,095个文件和6,767个目录。两个层级的条目数量不同，不能把研究TAR的计数当成外层ZIP计数。研究树按需恢复，Android部分需区分大小写文件系统。

首次解包不会覆盖已有同名目录。需要核对已有解包内容时，可运行：

```text
python3 report/tools/prepare_full_materials.py --archive materials/eightsleep-full-evidence-20261107.zip --destination materials --verify-existing
```

顶层 `RELEASE_MANIFEST.json` 记录当前报告、工具、分析工程与材料 ZIP 的大小和 SHA256；已解包材料由其 `catalog/bundle-manifest.json` 单独校验。整理记录在 `maintenance/`。归档中原2026-11-07报告属于冻结证据，版在顶层`report/`。账号会话和客户端配置的迁移边界见[实时工具](live-capture-tool.md)。

## 如何沿结论回到样本

1. 从模块或算法页打开证据条目，取得证据编号、原文 SHA-256 与快照 SHA-256。
2. 在完整证据链页查对应 `research/...` 归档路径；快照有说明头及必要脱敏，不能直接用它的哈希验证原文。
3. 使用 `catalog/research-files.jsonl` 定位归档成员，核对大小、SHA-256 和 `transformation`。原厂二进制、反编译产物与分析者模型各自保留身份。
4. 函数地址回到对应版本 ELF；另附指令字节核验，不能把伪代码当作原厂源码。

## 完整范围与剩余缺口

完整归档不等于完整恢复算法。生产心肺分离、融合、睡眠分期及云端温控策略仍未取得。JADX 有 350 个报错，关键 App 结论以 DEX/Smali 互证。

NXP 固件和相关分析仅作历史对照保留，不用于证明当前 MTK 实机运行什么程序。16 个 Ghidra 工程包含不同研究目标，不能理解为 16 份当前设备固件。Android 专项审计列的是其限定范围内的 15 个工程。

MTK 包的历史公钥验证通过，更新 rootfs 内附新公钥验证旧通道签名失败；这是两个独立结果，不隐藏失败，也不把公钥文件本身当成独立的发布者身份认证。

Android 提取目录存在大小写冲突路径，恢复时需区分大小写的文件系统。ExFAT 上的 rootfs 普通文件视图方便浏览，不能直接刷写；以原始 SWU/TAR 和条目清单为准。
