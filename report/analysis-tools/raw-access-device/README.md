# 本地 raw 入口证据

阅读 [FINDINGS_ZH.md](FINDINGS_ZH.md)。`inspect_access.py` 对冻结 rootfs.tar 的固定文件清单、启用链接和 Go buildinfo 做静态读取，未访问设备或执行固件。运行：

```sh
python3 report/analysis-tools/raw-access-device/inspect_access.py
```

`source/` 是原厂配置和脚本的原字节副本。`managed/` 是既有 ILSpy 反编译证据，非原厂源码；来源哈希见 MANAGED_EVIDENCE.json。`upstream/` 是原始 NATS 二进制编译信息所指 revision 的公开源码及其 Apache-2.0 许可，来源哈希见 UPSTREAM_SOURCES.json。

没有获取密码、私钥或账号会话，没有连接 Pod、扫描网络、启用配对、写入公钥、启动隧道或订阅实机数据。用户电脑与设备不在同一局域网；现有结果证明了静态入口与权限前提，不代表实机采集成功。
