# 压电原始数据的本地接入

冻结 MTK 固件中存在具体入口链：USB ECM 或设备局域网 → SSH 8822 的 rewt 公钥认证 → 本机 NATS 4222 → rawmem.x.sens.stealth。用户电脑与 Pod 不在同一局域网，且尚无授权 SSH 密钥，因此这条链尚未在实机接通。USB 物理端口是否支持 ECM、服务是否启用和固件身份也需实测。

## 入口与授权

原始 rootfs 中 usbnet.service 和 sshd.socket 均有启用链接。USB 网络配置为 192.168.96.1/24；SSH 禁用密码及 root 登录，仅允许 rewt。NATS 监听 127.0.0.1:4222，不能从 Wi-Fi 直接访问。

设备侧 addauthorizedkeys 函数要求处于配对模式，才追加公钥。其普通账号调用路由尚未取得；没有执行配对、写入公钥或启动远程维护。App 的 security/key 是 BLE 对称加密密钥，不能替代 SSH 登录授权。

[原厂配置清单](../analysis-tools/raw-access-device/ACCESS_INVENTORY.json) · [App 调用链审计](../analysis-tools/raw-access-app/ROUTE_AUDIT.json)

## 已具备的读取工具

[独立订阅器](../analysis-tools/raw-nats-capture/capture.py)只连接电脑 loopback 上已经建立的授权隧道，订阅一个精确 raw 主题。它不发布消息、不加入队列组、不创建 JetStream consumer、不发送 ACK，也不自动重连。保存 payload 原字节、头部、接收时间、主题和 SHA256；零条消息不算取得数据。

生产配置将 raw.> 映射为 rawmem.>，因此默认订阅 rawmem.x.sens.stealth。只订阅映射前主题可能收不到正常发布。

只有在已有合法 SSH 密钥、确认设备地址与主机密钥后，才使用以下示例。当前未执行设备连接：

```sh
ssh -N -T -p 8822 -L 127.0.0.1:14222:127.0.0.1:4222 rewt@192.168.96.1
python3 report/analysis-tools/raw-nats-capture/capture.py --duration 30 --out /tmp/pod-raw-capture
```

上述地址只对应样本 USB 网络。输出目录必须不存在；工具拒绝覆盖已有记录。采集默认受 30 秒、8 MiB 接收字节和 4000 条消息限制。它只能接收订阅期间的新消息，不能补回历史波形，也不能保证源数据完整。当前只保存原字节，不把未知载荷显示成假定波形。

## 验证及剩余条件

8 项测试已通过，包括真实运行官方 macOS NATS 2.11.17 测试服务器、应用相同 raw→rawmem 映射、发送合成二进制与带头消息、逐字节核对保存结果，以及确认订阅器没有回应发布者的 reply 地址。该测试只访问电脑本机，不是 Pod 实机数据。

[测试结果](../analysis-tools/raw-nats-capture/VALIDATION.json) · [测试服务器来源与哈希](../analysis-tools/raw-nats-capture/TEST_SERVER_SOURCE.json) · [NATS 协议](https://docs.nats.io/reference/protocols/client)

下一步验收按顺序进行：确认实机访问方式和版本；取得合法 SSH 授权；建立仅绑定本机的隧道；保存首段实际 payload；按主题解码并核对样本、时间和通道。只有最后两项成功，才能说取得了真实压电数据。普通账号到设备维护函数的调用权限仍未证实，不用猜测接口或绕过配对门控代替授权。


## 上传身份与账号权限的区分

原始上传器的 raw TLS 构造入口 `0x003A6CDC` 经 `0x003CBB2C` 创建验证配置，再调用 `0x004BB3F4` 安装固定解析器表 `0x009E2740`。表内两个方法 `0x004BC65C`、`0x004BA8A4` 均直接返回零；另一方法输出 `FailResolveClientCert` 调试名称。该调用链支持此配置不提供客户端证书的判断，不能据此认定云端不做设备身份检查，更不能推出 App 账号拥有 raw 下载权限。

连接构造另将目标主机交给 `0x00604B48` 转为服务端名称。已有导出的 2,579 处指令字节与原始 ELF 一致；尚未执行真实 TLS 握手，也未完成服务器端授权审计。[字节与表项核对](../analysis-tools/raw-access-tls/BINARY_VERIFICATION.json)

APK 中已枚举 252 条字面 Retrofit 路由；所审 Java／Smali 调用链没有建立普通账号到 SSH 公钥写入的路径。服务器通知包含动态 action URL，因此字面路由搜索不能证明所有支持入口不存在；读取通知元数据是后续只读候选，不能自动执行其 action。当前没有实际通知包含 raw 或 SSH 入口的证据。[APK 审计范围](../analysis-tools/raw-access-app/ROUTE_AUDIT.json)
