# 设备本地 raw 访问与维护授权边界

## 可执行路径及未满足条件

冻结 MTK 包提供完整的本地入口链：**USB ECM 网络或设备所在局域网 → SSH 8822 / rewt 公钥认证 → 本机 127.0.0.1:4222 → core NATS 订阅 rawmem.x.sens.stealth**。这不是已经连上用户 Pod 的结论：用户电脑与设备不在同一局域网，未有合法 SSH 密钥授权记录，Pod6 的物理 USB 端口角色、实机版本与服务状态均未验证。

无需先启动厂商反向 SSH 隧道，才能在本地使用 sshd：本包 sshd.socket 已通过 sockets.target.wants 链接启用。反向隧道只是一条把 localhost:8822 转发到维护服务器的另行路径，不等于给普通账号开放 raw 读取。

## 原厂包中实际存在的入口

`ACCESS_INVENTORY.json` 从原始 rootfs.tar 按固定允许清单读取，11 个配置/脚本与已解包文件逐字节匹配；两个启用链接由 TAR 头直接确认。

- `etc/systemd/system/multi-user.target.wants/usbnet.service` 指向 `/lib/systemd/system/usbnet.service`，后者运行 `usbgadget-net.sh --start`。
- 脚本创建 ECM gadget；VID/PID 为 1d6b:0104，产品描述为 `8sleep Pod 3`。该字符串仅是本包描述符，不能据它把用户 Pod6 判成 Pod3，也不能证明外部某个 USB 口支持该模式。
- `etc/systemd/network/usb.network` 匹配 usb0，配置地址 192.168.96.1/24 和 DHCPServer=yes，EmitRouter=no。
- `sshd.socket` 监听 8822，Accept=yes；`sshd@.service` 从继承 socket 运行 sshd -i。
- 两份 sshd 配置均为 PermitRootLogin=no、PasswordAuthentication=no、ChallengeResponseAuthentication=no、AllowUsers=rewt。没有读取或尝试任何密码/密钥。
- 配置先 Include `sshd_config.d/*.conf`；原始 TAR 未找到匹配的 drop-in .conf。运行期覆盖仍需要实机核对。
- `etc/nats.conf` 明确监听 127.0.0.1:4222，监控为 127.0.0.1:8222；`raw.>` 映射到 `rawmem.>`。不能仅把电脑接入同一 Wi-Fi 就直接连接这个 loopback 监听。

固件归属为官方 MTK SWU `4b7552d5a9aed31997ff22cf193240800056ef6a.swu`，SHA256 `59eb790b6396dc162b62536615701b4e2774c665bc13b16f70b83a9d76db4532`；根文件系统名是 `eightsleep-mtk-image-mt8365-8sleep.tar.gz`。这是样本归属，不是用户实机固件身份的证明。

## 公钥授权来自哪里

`RemoteConnectivityController.AddAuthorizedKeys`（managed/RemoteConnectivityController.cs:56）先检查 `IPairingMode.Active`，失败直接返回 BadRequest；成功后调用 service.AddAuthorizedKeys。请求 DTO 字段为 AuthorizedKeys 列表及可选 User。这里是设备侧函数 `functions.remoteconnectivity/addauthorizedkeys`，没有恢复其普通账号 HTTP 路由或服务器权限。

`RemoteConnectivityService.AddAuthorizedKeys`（:112）默认 User=rewt，仅接受 rewt/root；去掉空行和已存在重复项，追加新公钥。位置选择不是猜测：

- `IsEphemeralMountpoint`（:198）读取 `/proc/self/mountinfo`，发现精确 mountpoint `/ephemeral` 才选 `/ephemeral/ssh/<user>/authorized_keys`；创建目录和文件权限分别 0700/0600，并对非 root 账号 chown。
- 否则使用 `/etc/ssh/authorized_keys`，文件权限 0644。
- 另有构造注入的 overrideRoot 分支，用于选择 `<overrideRoot>/ssh/<user>/authorized_keys`；正常注册没有传入此参数。
- sshd 自身读取 `/etc/ssh/authorized_keys`、用户 `.ssh/authorized_keys`、`/ephemeral/ssh/%u/authorized_keys`。向 root 写入公钥不会取消 sshd 的 PermitRootLogin=no 和 AllowUsers=rewt。

PairingMode 的 Active 是进程状态。启动条件、物理配对按钮以及配网步骤分别设置/清除；不能用 pairing/status 的任务状态替代它。未触发配对按钮，也未调用公钥写入。

## StartSSH 不是获得本地登录权限的前置步骤

- `StartSSH` 在带 Key 时先执行 PrimeLegacyConnectivity，再调用带配对门控的 RunRemoteConnectivity。此前置流程会写文件，不能作为只读探针。
- `remoteconnectivity/startssh` 的显式非零 Port 分支没有把请求值赋给局部变量，导致返回 Invalid port；省略/零值选随机端口。既有原 IL 验证保存在原 diagnostics 目录。
- `RunRemoteConnectivity`（service :338）要求 Active，随后运行 timeout 2h 包装的 ssh，使用 `-R <port>:localhost:8822` 连接厂商维护主机。短时进程仍存活即返回成功，不是端到端隧道验证。
- `getpublickey` 在文件缺失时可能生成设备出站会话密钥；该公钥也不是用户入站 SSH 私钥。

尚未证明普通 App 账号能调用这些函数。不能猜造请求路由，也不能把设备端注册函数当作账号权限已经成立。

## core 订阅应使用映射后的主题

从原始 nats-server ELF 的 Go buildinfo 直接提取：v2.11.17，源码 revision `0f192db71455eaca7f1fef14548a239845f24b96`，vcs.modified=false，linux/arm64，Go 1.25.9。按此不可变 revision 保留 NATS 作者的源码及 Apache-2.0 LICENSE，来源和哈希见 UPSTREAM_SOURCES.json。

静态调用链：

1. `upstream/server/parser.go:504–519` 在收齐发布消息后先应用 selectMappedSubject，再 processInboundMsg。
2. `client.go:4128–4134` 把 c.pa.subject 替换成映射目的主题。
3. `client.go:4266` 用替换后的主题匹配订阅，:4300 把同一主题传给 processMsgResults。

因此在该映射实际生效时，生产者发布 raw.x.sens.stealth，独立 core 订阅匹配 rawmem.x.sens.stealth；只订阅 raw.x.sens.stealth 会错过这条映射后的正常发布。该解释依据固件编译元数据指向的上游源码，尚未运行同包 ARM64 服务器或核对其相应机器码，不与真实设备观察混记。

普通 SUB、不指定 queue group，可以旁路取得连接后新到的消息；它不创建 durable consumer，不请求 JetStream 历史，也不应给收到的 reply subject 发送 ACK/PUB。订阅收到消息不能证明这条消息已经落入 JetStream 或上传云端。历史缓存、丢失重放和断线补回另需验证。

## 监控桥不能替代原始消息订阅

`managed/DebugNatsController.cs:24–42` 只允许 healthz、varz、jsz、connz、subsz、stacksz，jsz 固定附加 streams/consumers/config 查询参数。返回监控文本的 gzip/base64 分片，未实现 stream message get、NATS SUB 或任意 URL 访问。原先诊断分析已恢复这一点，此处仅用于排除错误接入路径。

## 不改设备的下一步检查

若设备以后通过合适的 USB 数据口接到用户电脑，可先在 macOS 执行 `system_profiler SPUSBDataType` 和 `networksetup -listallhardwareports`，观察是否出现新增 ECM/USB 网络设备；再只读查看对应接口的 `ifconfig` 和 `route -n get 192.168.96.1`。这些检查不写 Pod 配置，也不扫描局域网；未在本次任务中执行。即使枚举成功仍需合法的 rewt 公钥授权。

已有合法登录后，先只读确认 `ss -ltn` 中的 4222/8822 监听、实际 nats.conf、端点配置及运行版本，再建立只绑定电脑 loopback 的 SSH 转发或在设备上直接运行独立订阅工具。保持生产 uploader、consumer、ACK、purge 和服务配置不变。

当前阻塞是物理/局域网可达与合法公钥授权，不是找不到本地 NATS 端口。只拥有手机 App 账号不足以证明跨过了这两个条件。
