# 气囊停用、旧快照与保存失败

将此前“跨侧整记录覆盖”继续追到停用和后续Null状态，另补保存异常的具体方法顺序。依据官方MTK内已留存的C#/IL，20项有限例经独立复核。没有在用户设备执行停用、登录、发送或写配置。

## 停用成功后，旧快照仍可能写回启用标志

气囊目标保存先读整份配置、Clone改单侧目标，再替换整份配置。保存锁到Save内部才取得；原helper没有取消参数，也不重新检查公开状态。

| 先后次序 | 结果 |
| --- | --- |
| 旧Ready先读到Enabled=true | 保留旧整份record引用 |
| Disable成功保存Enabled=false，再将公开状态设Null、取消旧CTS | 停用方法正常走完 |
| 旧Ready恢复，从旧record只改目标，再成功保存 | RAM与R12可重新写成Enabled=true |

这是允许旧调用继续的条件性顺序，不是现场重现，也不表示每次停用都有此结果。反过来，目标在停用后读取新快照会保留false；停用若最后替换配置，最终也是false。

## Null读取当前配置，不冻结停用时的值

CreateNullState捕获manager引用，后续predicate每次读取当前Configuration.Enabled。NullState在false时循环等待，true时返回NotConnected；host正常修订会重建链接应用停止token的侧CTS。

因此，在host仍运行、到达可用Null修订、没有后续写者或取消等条件下，旧快照写回true可以允许后续离开Null。公开状态仍受Host协调，NotConnected也仅是状态对象；不能据此保证马上重连、写出命令或驱动泵阀。

## 保存失败后，RAM、主文件和公开状态分开看

UpdateConfiguration先改RAM；savedJson只在保存正常返回后更新；saveGate在finally释放。下表采用“初始主文件有效、无tmp；在指定步骤之前注入异常”的有限条件。

| 所选分支 | RAM | 主文件／savedJson | 公开状态和调用后续 |
| --- | --- | --- | --- |
| Disable保存失败 | Enabled已false | 仍是旧true | Null／Cancel尚未执行，模型仍Ready |
| 上述失败后再次Disable且保存成功 | false | 更新为false | 正常继续Null／Cancel |
| 目标保存失败 | 新目标留在RAM | 仍是旧目标 | 保存helper捕获异常后返回，调用者可继续到发送方法 |
| 随后另一次配置更新成功 | 包含此前RAM目标 | 可把此前失败目标一并保存 | 不代表此前已发送或机械执行 |
| JSON未变化，Save跳过IO | 保持当前值 | 不重写 | Disable后续Null／Cancel仍会执行 |

五个失败点为序列化、打开tmp、写tmp、Flush、替换主文件之前。真实文件系统部分写入、Move和目录持久性、Dispose／Refresh后置异常、取消回调异常均未覆盖。不能把表内主文件或tmp状态推广到所有真实故障。

## 验证与仍缺的部分

20例包含三种停用/新旧快照顺序、五步骤的失败/重试/目标保存，以及后续保存和跳过IO；不是左右侧20种交错的重复计数。独立审阅核对IL并精确复跑模型，无阻断问题。这些计数不表示现场发生概率。

[完整IL锚点与结论](../evidence/analysis/host-save-boundaries-20261108/FINDINGS_ZH.txt) · [20项模型轨迹](../analysis-tools/host-save-boundaries/MODEL_RESULTS.json) · [模型代码](../analysis-tools/host-save-boundaries/run_cases.py) · [独立审阅](../analysis-tools/host-save-boundaries/review/INDEPENDENT_REVIEW.json) · [来源账本](../analysis-tools/host-save-boundaries/SOURCE_LEDGER.json)

A02 Fault1–4和床架32字节位置追加仍未恢复；该主控状态结果不替代两个MCU生产者。真实并发、断线、重连与执行器行为仍需同源运行记录。对象与命令链见[气囊与床架恢复研究](accessory-resume-20261108.md)。
