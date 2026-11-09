交付检查与历史记录

structural-checks.json：最近一次构建的结构、链接、证据与产物哈希、静态隐私模式、算法和词典数据检查。
content-review-*.json：各轮内容范围与独立审阅。日期、revision及scope说明适用版本；后续修正不改写历史记录。
*-http.json：对应轮次的静态HTTP、来源哈希及浏览器观察。截图仅证明当时展示状态。
complete-materials-*.json / portable-materials-http.json / complete-project-review.json：材料解包工具、归档身份与独立临时文件保护检查。
portable-full-extraction-20261108.json：真实完整版项目在独立目录的解包、逐成员核对及随机端口材料服务验收。
terminology-finish-20261108.json：算法正文术语减负、保留的技术边界及源码哈希。
completion-audit-20261108.json：逐项对照原始交付要求，区分已完成的项目功能与明确保留的研究缺口；最后的ZIP和目录回执在交付物旁单独保存。

project-manifest.json位于项目根目录，记录最后一次轻量项目打包时的文件身份。完整项目包内RELEASE_MANIFEST.json另覆盖report和原字节材料ZIP；整个ZIP的校验回执在ZIP旁边，避免把自身哈希写入自身。

algorithm-*.json / algorithm-detail-preview.png：算法扩展的内容、数值与页面检查。
plain-*.json / plain-language-preview.png：早期易读化检查，当时的60项词典和44项待办属于历史状态；当前词典与任务数以data及最新构建为准。
browser-checks.json / report-preview.png：首版整体页面检查。

live-capture-checks.json：37项离线后端测试、浏览器合成演示和2026-11-07的账号查设备观察。该次找到1台Pod6但离线，未发起真实live采集。live-sidebar-20261108.json记录后续侧边栏恢复；未重启已登录服务。

这些检查验证文档、模型、工具与交付材料，不验证实际睡眠算法准确度。真实部署、传感波形、物理通道和云端生产实现的缺口仍按待办保留。
