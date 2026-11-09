# 原始上传的压缩格式

目标为冻结 MTK `jetstream-uploader`，SHA256 `a93fef74e2bb1d61e36979a9d1997afecf1b4655ebe6190e2887dac95262fe06`。实现结论见 [Wiki](../../wiki/raw-wire-format.md)。

- `constructor/`、`compressor/`、`flags/`、`stream/`：Ghidra 导出的机器码、重建伪代码及引用。不是原厂源码。
- `SOURCE_LEDGER.json`：原始 ELF 与配置的哈希，以及冻结 ZIP 成员逐字节比对。
- `BINARY_VERIFICATION.json`：3,185 条指令、12,740 字节与 ELF 的 PT_LOAD 映射逐条匹配；不是整程序覆盖率。
- `FLAGS_EMULATION.json`：28 组寄存器输入执行原始构造尾部和参数设置指令，未运行完整压缩器或设备。
- `DECODER_VALIDATION.json`：8 项 Python 合成 CBOR／DEFLATE 测试，验证解析契约而非实机互通。
- `upstream/`、`miniz_oxide-0.8.9.crate`：对应版本的公开组件及 MIT 许可证；来源、包哈希在 `UPSTREAM_SOURCE.json`。其版权不属于本项目。

从项目根目录复核：

```sh
python3 report/analysis-tools/raw-wire-format/verify_binary.py materials/eightsleep-full-evidence-20261107/firmware/mtk/rootfs/files/opt/eight/bin/jetstream-uploader
python3 report/analysis-tools/raw-wire-format/test_decoder_contract.py
```

Ghidra 仿真使用已有 `RawUploaderNoGcc` 项目中的 `jetstream-uploader`，通过 `-process jetstream-uploader -readOnly -noanalysis` 和 `scripts/VerifyRawFlags.java` 运行，脚本唯一参数为结果 JSON 的输出路径。`ExportRawWire.java` 参数为输出目录及待导出函数地址。项目须对应上述原始哈希；仿真回执中的哈希由 Ghidra 的目标信息取得，另由 Python 验证所有保留指令的原始字节。

压缩器实际参数为 level 6、关闭 zlib header，flags=0x80。协议 session 的字符串 `compression="zlib"` 仍原样保留。不能据此字符串将解压器固定为 zlib wrapper。实机 TLS 明文、连接重建与云端 ACK 对照尚未获得。
