# 离线控制与状态恢复

本页区分备用BLE控制、闹钟、日历调度与状态恢复，记录各自的凭据、时间和持久化条件。

已恢复的离线能力是有条件的 BLE 手动操作、普通热控到期和本地振动闹钟。它们各自有凭据、时间和持久化边界，不能合并成“整套 Autopilot 永久离线”。本页依据下载的 MTK 固件和国行 APK 静态链，尚无当前设备断网或重启实验。

## 从手机到本地温控

```text
App 缓存密钥与功能门控
  → BLE 加密写入
  → Capybara 解密、解析
  → 本地 Unix socket
  → DAC 串行命令队列
  → Frank Heat / Level
  → Frozen 目标执行
```

这条主机路径不要求先完成云连接。手动开启热控传入 36000 秒，即 10 小时，再受固件最大时长和外设条件裁剪。Heat 和 Level 是两次请求；串行队列不等于组合操作不可中断，也未恢复完整的“云端/手动/闹钟”优先级表。[本地调用链](../../evidence/analysis/sleep-pipeline/LOCAL_BACKUP_ZH.txt) [模式与有限仲裁](../../evidence/analysis/sleep-pipeline/THERMAL_MODE_ROUTING_ZH.txt)

| 凭据情境 | 已恢复行为 | 边界 |
| --- | --- | --- |
| 有设备缓存且密钥匹配 | 可走 BLE 备用操作 | 仍需蓝牙、功能和 UI 状态门控通过 |
| 缓存标记到期 | 后台刷新，同时返回旧缓存供操作 | 执行器未再次检查 expiresAt；不保证长期匹配 |
| 无缓存或缓存不可解密 | 刷新链使用 BLE nonce，再向云端取钥 | 没有完整的纯离线首次取钥链 |
| 操作解密失败 | 强制刷新后重试 | 恢复依赖云端取钥 |
| App 进程重启 | 用户/引导状态存在先读本地缓存的启动路径，随后受家庭路由与控制门控限制 | 静态入口已闭合，当前账号离线冷启动尚未运行验证 |
| 退出账号或空token | 活跃认证观察链触发先清Room、后清BLE外设/内存 | 取消或异常可中断后续清理，不能等同普通断网 |

主机样本云断开时跳过密钥刷新并保留当前密钥；配置缺失而重建密钥可能使手机缓存失配。“缓存过期立即失效”和“登录一次永久离线”都超出证据。[APK Smali 与主机凭据证据](../../evidence/analysis/device-side-followup/offline-boundary/FINDINGS_ZH.txt)

## 普通到期与日历调度分开

`heat/state1.dat` 保存左右热控 expiration、mode、target 及日程。普通 expiration 使用绝对 Unix 秒；重启后不应被解释为重新领取完整 10 小时。继续执行仍要求截止时间在未来、时钟可信、状态可读和外围存在。

TemperatureScheduler 确有序列化与温控回调框架，但此样本的 `now_calendar` 成功路径只打印 stub 提示，未填充真实日历，星期判断也未见按当前星期取索引。它不能证明完整每周预热工作。另一方面，Unix 到期和振动闹钟使用另一条时钟链，不因这个 stub 一并失效。[日历和普通计时边界](../../evidence/analysis/sleep-pipeline/LOCAL_BACKUP_ZH.txt)

## 持久化不是完整事务

Frank 保存热控状态时，对已存在文件使用 `r+` 从头覆盖；所追路径没有临时文件替换、截断、逐字段失败回滚或显式 fsync。辅助写函数的字节数结果未被保存者检查，fclose 返回值也未被检查。正常返回路径的成功值只表示初始打开成功。

加载直接逐字段改状态。短整数读取把实际字节与预先清零的剩余字节合成值；缺失布尔读取的栈字节未预初始化，不能统一视为 false。未知版本可能不解析字段而仍打印 loaded。静态序列化格式为 v2 92 字节、v1 76 字节，但加载者没有据此先校验整份长度。

后续 expiry tick 还可能重写 mode，所以读到 mode=0 不能单独推出最终关热。以上说明错误语义，不是掉电结果或实际温度预测；尚未读取真实状态文件或做断电测试。[短 I/O 审计](../../evidence/analysis/device-side-followup/recovery-round/persistence/FINDINGS_ZH.txt)

## 闹钟入口决定副作用

原生 `alarm.cbr` 的 tt、di、du 表示触发、抑制截止和持续秒数。六个本地 task 最终给 Sensor/Pillow/USB 端点发送 `0x2c` 振动控制；窗口过后不会沿这条链补响。原生开始、结束和 ALARM_CLEAR 未读写 Thermostat 目标。

| 入口 | 已闭合动作 | 温控影响 |
| --- | --- | --- |
| 原生 ALARM_CLEAR | 更新有效窗口内的抑制时间，停止相应振动 | 该链未附加 Heat/Level |
| 主机实体按钮 Dismiss | 经过 DAC 转 ALARM_CLEAR | 不能套用 BLE Dismiss 的关热行为 |
| BLE Dismiss | 设定停止闹钟，再逐条发送 Heat=0、Level=0 | 正常执行会关热；Level=0 是内部 27°C 目标，非 0°C |
| BLE Snooze | 读取已有闹钟，重设 Unix 触发秒；可暂停闹钟音频 | 没有已恢复的旧温度快照/恢复链 |

上述 BLE 组合动作可能被传输错误中断；服务端收到通知后的策略不在本地包中。旧托管 SetAlarmSettings 还存在默认未注册与配套 JS 不接收的限制，不能只因类存在就称可用。[原生闹钟和温控交互](../../evidence/analysis/signal-host/ALARM_THERMAL_INTERACTION_ZH.txt) [默认注册边界](../../evidence/analysis/sleep-pipeline/THERMAL_MODE_ROUTING_ZH.txt)

## 下一步

**C04** 的APK冷启动、退出清理和备用温控门控静态验收已完成；**C06** 的状态文件离线模型也已完成。剩余 **C05** 为实机离线条件矩阵，**C07** 为闹钟来源与重启窗口运行验证。记录时需保留凭据状态、时间状态、入口和版本，不能只记“能用/不能用”。

补充 **C16**：在当前版本配置与设备条件可用后，闭合每周预热和云端闹钟的配置、保存、真实日历执行与到期观察链；云端完整目标策略另见 [Autopilot 的 AUTO-01](autopilot.md)。下载样本中的 stub 不能直接证明当前产品的日程行为。

## 状态文件模型

C06 的离线验收已完成：12组具名样例与170个逐字节截短检查复现了短读、未知版本和新前缀/旧尾部混合行为。即使打印 state loaded，也可能读到混合字段；缺失日程开关的值仍未知。此结论不等同当前设备断电行为或最终热控输出。见 [逆向进展](../round-20261107.md) 与 [模型证据](../../evidence/analysis/next-round-20261107/persistence-model/FINDINGS_ZH.txt)。

## App 退出与离线资料

已闭合退出后token观察触发的清理链：先删除包括 `offline_mode_data` 的Room表，再清理BLE外设与内存。普通断网不是同一个条件；清理依赖观察链活跃及各步骤正常完成。当前已读退出链未直接删除 `room_encryption_key`，不能将“清了离线记录”写成“所有AndroidKeyStore密钥均已删”。正常onPause/onCleared直接入口没有同样的清库调用。[退出与密钥证据](../../evidence/analysis/next-round-20261107/app-lifecycle/FINDINGS_ZH.txt)

冷启动已补到实际路由：中国版本地consent通过后启动token观察，`ensureAppUser`先读本地用户，失败再远端获取；引导状态false参数路径先查DAO。家庭摘要由家庭、设备、用户和当前app user状态组合，功能开关/订阅决定后续页面。路由错误处理本身只记日志，没有额外退出清库。[冷启动静态链](../../evidence/analysis/finishable-20261107/app/c04/FINDINGS_ZH.txt)

登录后的离线资料预取先等蓝牙权限，再筛选支持的设备。备用命令要求至少一个相关功能开关开启；设备记录非空时，固件版本包含点号、POD_1或POD_2_PRO会被本包的能力判断排除。这是代码字面条件，不能改写成推测的最低版本号。温控直接BLE还要求系统状态非NORMAL；云请求失败后的fallback使用另一组开关条件。门控后仍须完成扫描、连接、密钥匹配和加密写入。

因此C04不再保留“尚未追冷启动/UI门控”的静态待办。系统“清缓存”“清应用数据”“强行停止”“卸载”以及真实token过期/401/无网组合的差异仍需手机验证，尤其不能由静态退出链推断Android系统清数据对KeyStore的全部效果。
