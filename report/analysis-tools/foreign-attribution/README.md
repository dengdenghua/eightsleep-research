# 导出字节相容性核查

在项目根目录运行：

```sh
python3 report/analysis-tools/foreign-attribution/attribute_exports.py
python3 report/analysis-tools/foreign-attribution/verify_attribution.py
```

仅使用 Python 标准库，读取保留的九份 BBIN、原 EXPORT_IDENTITY 排除集合及相关导出。不执行固件、不访问账号、不改变解码种子。完整比较策略、候选、比例和自身/输入哈希在 FOREIGN_ATTRIBUTION.json；独立复核在 INDEPENDENT_VERIFICATION.json。技术解读见 ../../wiki/export-attribution-20261109.md。

分类是内容相容性判断，不是原始导出来源证明。不得把未匹配改称缺失构建，不得把共享代码强行归属，不得把文本 SOURCE_SHA256 当固件摘要。继续使用原解码统计时须保留其原有范围，文件哈希不变也不能代替算法正确性验证。
