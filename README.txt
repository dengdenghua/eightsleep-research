Eight Sleep Pod 技术分析报告
===========================
报告版次：2026-11-09；主要样本与研究证据日期：2026-11-08。

阅读入口：report/index.html
目录与来源方法：report/wiki/index.md、report/wiki/evidence-method.md
未解决问题：report/wiki/reverse-plan.md
任务与验收：report/wiki/roadmap.md

report/     HTML、Wiki、结构化索引、证据快照、核验脚本与有限模型。
materials/  原字节完整证据ZIP；解包材料按当前存储布局保留或按需恢复。
workspace/  分析工程及工作材料。
maintenance/ 交付验收、整理记录与内容校验。
RELEASE_MANIFEST.json 交付成员大小与SHA256；展开材料另以其bundle-manifest核验。

直接打开report/index.html可离线阅读。运行“启动完整项目.command”
将打开报告与仅绑定本机的材料服务；材料缺失时按完整ZIP校验、解包。
需要约4GB逻辑空间，文件系统实际占用可能更高。

材料恢复：
  python3 report/tools/prepare_full_materials.py --archive materials/eightsleep-full-evidence-20261107.zip --destination materials
只读材料服务：
  python3 report/tools/evidence_server.py --root materials/eightsleep-full-evidence-20261107 --port 58766

实时采集使用独立登录会话；启动报告不会自动登录、采集或控制设备。
本交付不包含用户密码、令牌和当前会话。冻结研究归档含APK内置参数的研究副本，
运行配置需单独指定，边界见report/wiki/live-capture-tool.md。

原始SWU、rootfs TAR和APK按原字节保留；普通文件视图不用于直接刷写。
Android大小写冲突路径需区分大小写文件系统。原始证据保留来源语境；
正式正文按主题整合当前结论，并区分静态实现、有限模型和实机观测。
