# Eight Sleep Pod 系统研究

Pod 系统固件、Android App、传感器与温控链路的技术分析项目。报告区分静态代码证据、有限输入模型、用户反馈与实机验证，未闭合问题见逆向计划。

- [完整 HTML 报告](report/index.html)：克隆后用浏览器打开。
- [Wiki 目录](report/wiki/index.md)
- [逆向计划](report/wiki/reverse-plan.md) · [任务与验收](report/wiki/roadmap.md)
- [实时采集工具](report/wiki/live-capture-tool.md)
- [来源与证据方法](report/wiki/evidence-method.md)

## 目录

| 目录 | 内容 |
| --- | --- |
| `report/` | HTML、Wiki、结构化索引、分析证据、脚本与有限模型 |
| `workspace/` | 保留的分析工程和工作材料 |
| `maintenance/` | 核验、整理记录与交付校验 |
| `materials/` | 本地完整固件证据材料；大文件通过 Release 附件分发 |

Git 仓库保存当前报告和代码。完整原字节证据 ZIP 作为 Release 附件拆分保存，原压缩包中的历史报告属于冻结证据，当前结论以本仓库 `report/` 为准。

## 获取完整固件证据

安装 GitHub CLI 并登录具有本私有仓库权限的账号，在仓库根目录运行：

```sh
gh release download evidence-2026-11-09 --repo dengdenghua/eightsleep-research --dir .github-upload
python3 restore_evidence.py --parts .github-upload
python3 report/tools/prepare_full_materials.py --archive materials/eightsleep-full-evidence-20261107.zip --destination materials
```

恢复脚本逐个验证分片 SHA256，再验证合并 ZIP 的 SHA256；不会覆盖已有不同内容的目标文件。原始 SWU、rootfs TAR、APK、反编译材料和研究档案保留在完整证据包中。

## 本地运行

直接打开 `report/index.html` 可离线阅读。完整材料恢复后，双击 `启动完整项目.command` 打开报告和本地材料服务。

实时采集独立运行，仅监听本机：

```sh
python3 report/tools/live_server.py --client-config materials/eightsleep-full-evidence-20261107/config/client-config.json --port 58764 --open
```

使用自己的账号在本地页面登录。服务不保存密码、会话令牌或自动上传采集记录。App live 不是完整设备 raw 上传接口，目前真实事件接收仍未完成验收。

## 核验

```sh
python3 -m unittest discover -s report/tests -p test_live_server.py
python3 report/tools/build.py
python3 report/tools/validate.py
```

`RELEASE_MANIFEST.json` 是完整本地交付的成员校验清单，包含通过 Release 附件恢复的材料；`github-release-manifest.json` 是 GitHub 分片恢复清单。原厂载荷与第三方组件保留各自的权利和来源，本仓库未另行授予其使用许可。
