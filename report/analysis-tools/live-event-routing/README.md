# 实时事件出口与 HTTP 响应边界

`source/` 保存冻结 MTK rootfs 中原始 DAC JavaScript，哈希见 `SOURCE_LEDGER.json`。`verify_events.cjs` 仅抽取 `processGesture`、`tryNotifyDoubleTap`、`doubleTap` 三个原始方法，在隔离上下文中使用模拟状态和协议发送器验证。不会启动原始模块、读取账号或请求设备。

```sh
node report/analysis-tools/live-event-routing/verify_events.cjs
```

`METHOD_VERIFICATION.json`：7 项条件行为验证。
`NETWORK_OBSERVATION.json`：不带 Authorization 的四次 HTTP 请求观测，设备标识未保存。401 只能证明未登录请求可以返回，不能证明登录后转发可用。

设备协议 `/E/gesture/*` 与手机 `/v1/devices/{id}/live` 的服务器映射尚未取得。不能将设备协议路径当作可供账号直接调用的 HTTP 采集入口。
