# 字段位点与路径复核

在项目根目录运行：

```sh
python3 report/analysis-tools/field-site-binding/audit_field_sites.py
python3 report/analysis-tools/field-site-binding/verify_field_sites.py
python3 report/analysis-tools/field-site-binding/verify_join_paths.py
```

Python 标准库即可。读取五份保留的 BBIN、旧字段台账及其对应的 114 份导出，不执行固件、不访问设备、不重新生成旧模型。

FIELD_SITE_AUDIT.json 复现 2609 条候选，记录每个指令/字面量/消费者与镜像的对应；VERIFICATION.json 独立核对匹配的局部位点；JOIN_STORE_PATHS.json 直接解码两条复用相同 STRB 的原始字节路径。字节匹配不是主对象指针归属，非紧邻访问还须值流分析。原 68 组同文件偏移交集不能作为 68 个函数的对象身份证明。
