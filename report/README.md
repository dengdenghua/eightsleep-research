# Eight Sleep Pod 技术分析报告

报告依据官方MTK固件、国行Android APK和设备侧程序，覆盖传感采集、数据整理、上传、热控、机械控制、客户端结果处理与云端接口边界。

直接打开 [index.html](index.html) 阅读完整HTML报告；[Wiki目录](wiki/index.md)按模块和技术主题组织。报告离线可读，查看正文不会登录账号或控制设备。

## 内容与入口

- [系统架构](wiki/architecture.md)、[本地处理职责](wiki/local-processing-20261108.md)
- [生理算法实现边界](wiki/modules/physiology-algorithms.md)、[算法研究计划](wiki/algorithm-next-20261108.md)
- [气囊与床架](wiki/modules/accessories.md)、[配置保存与停用](wiki/host-save-boundaries-20261108.md)
- [未解决问题](wiki/reverse-plan.md)、[任务及验收标准](wiki/roadmap.md)
- [来源方法](wiki/evidence-method.md)、[完整材料说明](wiki/full-evidence.md)、[解析器与重建工具](wiki/tools-and-reconstruction.md)

## 项目结构

| 目录 | 用途 |
| --- | --- |
| wiki/ | 当前技术正文与专题 |
| data/ | 模块、算法、任务与材料索引 |
| evidence/ | 保留原文语境的证据快照及来源哈希 |
| analysis-tools/ | 原指令、反编译/IL、模型、核验脚本与覆盖记录 |
| tools/ | 报告构建、校验、材料服务与采集工具 |
| validation/ | 结构、链接及相关检查记录 |

完整交付位于 `/Volumes/My Passport/EightSleep/`，报告在`report/`，原始材料在`materials/`，分析工程在`workspace/`。完整固件归档保持原字节；材料布局与恢复方式见[材料说明](wiki/full-evidence.md)。

## 本机服务与实时采集

普通阅读直接打开HTML。完整材料按需浏览可运行顶层`启动完整项目.command`，材料服务仅绑定本机58766端口。账号工具使用独立内存会话，需用户登录；工具不会因为打开报告自动采集。凭据、运行配置和当前会话不属于报告交付。

[实时工具说明](wiki/live-capture-tool.md)列出启动、登录、设备查询、限额、导出与失败判定。留存的设备查询状态不代表当前在线状态。

## 构建与检查

```text
python3 tools/build.py
python3 tools/validate.py
```

构建将Wiki与结构化数据内嵌为HTML。校验覆盖结构、引用、证据摘要和离线载荷；它不证明设备运行、算法准确率或全部代码路径。

原始分析记录不因正文编辑而改写。报告采用当前有效结论，证据目录保留来源版本的语境；已知实现、推断与未解决问题分别注明。

核心结论由 `data/conclusions.json` 统一维护；构建器生成 `wiki/conclusions.md` 与 HTML 索引。每条结论分别记录代码、有限模型、部署和实机验证状态，并链接主章节。
