# nonUSB hwrev 分派表：14 行全表映射

相关实现与验证见[回调实现、hwrev 标识与上报字段](callback-implementations-20261108.md)；上报对象的完整布局见[上报对象构造链与 0x3e28 布局分区图](report-object-layout-20261109.md)。

本章给出nonUSB的14行硬件版本阈值、版本字符串、setter和启动变体映射，解释累加覆盖规则及软件时钟输入。

## 主要结论

| 残余 | 状态 | 关键证据 |
| --- | --- | --- |
| 14 项全表映射 | 已闭合 | 14 个字符串指针在整个镜像中各只出现一次，位置与 14 个 setter 一一相扣 |
| 字符串序 K10/K05 与数值序不同 | 已解释 | 字符串表索引 4/5 是 K10/K05，阈值行 4/5 是 K05(0x0A05)/K10(0x0A10)，两表顺序相反但各自 setter 指向自己那条字符串 |
| `0800fd25` / `0800fd31` 无函数体 | 已闭合 | 不是空洞，是工程未反汇编的两段短 Thumb setter：K87 只写名字；K90 另把配置对象 0x18c 字节清零 |
| 累加应用 | 量化 | 实际执行 16 次 setter 调用：14 行 + K10 重放 K00 + K33 重放 K05 |
| init 变体数量 | 修正为 7 个槽位候选 |  `08012274`（K36 装入），首指令 `bl 08012008` 复用上一变体，不时钟入口 |

字节核验 **109 项检查 0 失败**（525 条导出指令行、135 个 literal、7 个 BL、8 个直接分支、14 个 slot0、7 个 slot1、两段原始 Thumb 解码、5 组全镜像 BL 调用点集合）；累加模型 **16 个 hwrev 边界、26 条断言 0 失败**。见[逐项核验](../analysis-tools/system-deepening/hwrev-dispatch-table/BYTE_VALIDATION.json)与[模拟结果](../analysis-tools/system-deepening/hwrev-dispatch-table/DISPATCH_SIMULATION.json)。

## 二、14 行一一映射

| 行 | 阈值 | callee | 名字 | 字符串表索引 | slot1（init 指针） | 内联重放 |
| --- | --- | --- | --- | --- | --- | --- |
| 0 | `0x0000` | `0800f58d` | I00 | 0 | `08010bf5` | — |
| 1 | `0x0805` | `0800f719` | I05 | 1 | 继承 | — |
| 2 | `0x0900` | `0800f761` | J00 | 2 | `08010c6d` | — |
| 3 | `0x0A00` | `0800f969` | K00 | 3 | `080114bd` | — |
| 4 | `0x0A05` | `0800fafd` | K05 | **5** | `08011d91` | — |
| 5 | `0x0A10` | `0800fae1` | K10 | **4** | 重放后同 K00 | `bl 0800f968` |
| 6 | `0x0A30` | `0800fc05` | K30 | 6 | `08011915` | — |
| 7 | `0x0A33` | `0800fc65` | K33 | 7 | `08012009` | `bl 0800fafc` |
| 8 | `0x0A34` | `0800fc99` | K34 | 8 | 继承 | — |
| 9 | `0x0A35` | `0800fcc1` | K35 | 9 | 继承 | — |
| 10 | `0x0A36` | `0800fce1` | K36 | 10 | `08012275` | — |
| 11 | `0x0A37` | `0800fd0d` | K37 | 11 | 继承 | — |
| 12 | `0x0A87` | `0800fd25` | K87 | 12 | 继承 | — |
| 13 | `0x0A90` | `0800fd31` | K90 | 13 | 继承 | — |

行布局 `[u16 threshold][u16 pad][u32 callee]`，`0801d8cc` 的 `cmp r5,#0xe`（原字节 `0e 2d`）固定 14 行。字符串表 `0x08024234` 物理顺序是 `I00 I05 J00 K00 K10 K05 K30 K33 K34 K35 K36 K37 K87 K90`；**只有索引 4/5 与阈值行 4/5 互换**，其余一一对应。定位依据不是顺序推测：每个字符串地址作为 4 字节小端值在 132896B 镜像里恰好只出现一次，落在对应 setter 的 literal pool 里。

## 三、两个「无函数体」的 callee 其实是短 setter

`0800fd24`（K87，`0800fd25` 是 Thumb 奇数指针）：

```
ldr  r3,[pc,#4]     ; 0x0800fd2c = 0x08024264 "K87"
str  r3,[r0,#0]     ; slot0 = 版本名
bx   lr
```

`0800fd30`（K90）在写名字之外多三步：`movs r2,#0` → `movs r3,#0xc6` → `lsls r3,r3,#1`（=0x18c）→ `strb r2,[r0,r3]`，把配置对象 0x18c 字节处清零。两段都紧跟 `c0 46` padding。复跑脚本内置一个只覆盖所需指令的 16 位 Thumb 子集解码器，逐半字复算语义并与原始字节、literal 值同时断言；既有工程的 `function=none` 只是没有反汇编，不是代码缺失，没有改写工程。

## 四、累加应用后的频率分界

14 行按顺序累加执行，内联重放让总调用次数变成 16。把「版本 → 最终 init → 时钟入口 → HSE 软件输入」串起来：

| hwrev 区间 | 最终版本 | 最终 init | 入口 | HSE 软件输入 |
| --- | --- | --- | --- | --- |
| 0x0000 / 0x0805 / 0x0900 | I00 / I05 / J00 | `08010bf4` / `08010c6c` | `080108ac` | 32MHz |
| 0x0A00 / 0x0A05 / 0x0A10 | K00 / K05 / K10 | `080114bc` / `08011d90` / 重放回 `080114bc` | `08010960` | 8MHz |
| 0x0A30 .. 0x0A37 | K30 .. K37 | `08011914` / `08012008` / `08012274` | `080108ac` | 32MHz |
| 0x0A87 / 0x0A90 | K87 / K90 | 仍是 `08012274` | `080108ac` | **16MHz** |

`080108ac` 的 `hwrev - 0xA87 < 0x79` 下界正好是 K87 这一版：K87 起软件 HSE 输入从 32MHz 改为 16MHz，而启动变体没有变。全镜像 BL 扫描确认 `080108ac` 只有 4 个调用点、`08010960` 只有 2 个，`08012274` 首指令 `bl 08012008` 只是复用变体并追加 0x48/0x47 两项外设初始化，没有第三个时钟入口。

**这是软件输入字段的分界，不是实测晶振或核心频率**：运行时 `RCC_CFGR` 的时钟源选择仍决定 `0800cd24` 走哪个分支，PLL 分支还另有乘除。K87对应明确的软件时钟输入分界；仍没有证据把它绑到营销型号、板型或外部晶振。

## 五、其它 setter 副作用（只记录，不解释语义）

`I00` 写满整个配置对象（含 16000000 / 8000000）；`K00` 大 setter 改写大量槽位并出现 4000000 / 2000000 常量；`K34` 按 `sku == 4` 在 `0x08025f00` / `0x08025f08` 之间选表写入 0x1a4 槽；`K35` 把 0x194 槽旧值备份到 `0x2000135c` 再换 `08011101`；`K37` 把 `0x08025ee8` 写进同一槽；`I05`/`J00`/`K30`/`K33`/`K36` 还写若干回调与超时（200 / 10000 / 30000）。这些槽位对应哪个外设、哪条业务路径没有证明。

## 适用范围与未解决问题

分析对象为所列官方样本，结论来自原字节、静态指令和有限模型。16／32／8MHz为软件输入；64MHz是依赖PLL锁定、切换成功与相关寄存器状态的计算值，不是实测频率。

14行硬件版本分派、setter写入快照、PLL与预分频、四种USART时钟源、整字除数及整数除法的所选输入验证已有技术章节。setter回调运行后的对象改写、hwrev/sku全部上报字段、型号/板型/晶振映射、实际RCC分支、波特率、切换过渡、丢tick、中断延迟和ADC采样时序仍需进一步代码或实机证据。

[配置对象与时钟源](config-object-snapshot-20261108.md) · [PLL计算](pll-sysclk-resolution-20261108.md) · [通道与USART](static-residual-closure-20261108.md) · [未解决问题](reverse-plan.md)


[完整中文结论](../analysis-tools/system-deepening/hwrev-dispatch-table/FINDINGS_ZH.txt) · [14 行结构化映射](../analysis-tools/system-deepening/hwrev-dispatch-table/DISPATCH_TABLE_MAP.json) · [累加模拟结果](../analysis-tools/system-deepening/hwrev-dispatch-table/DISPATCH_SIMULATION.json) · [逐项字节核验](../analysis-tools/system-deepening/hwrev-dispatch-table/BYTE_VALIDATION.json) · [核验脚本](../analysis-tools/system-deepening/hwrev-dispatch-table/scripts/verify_dispatch_map.py) · [模拟脚本](../analysis-tools/system-deepening/hwrev-dispatch-table/model/apply_dispatch.py) · [输入 SHA 清单](../analysis-tools/system-deepening/hwrev-dispatch-table/SOURCE_MANIFEST.json) · [导出命令](../analysis-tools/system-deepening/hwrev-dispatch-table/EXPORT_COMMANDS.json) · [复跑说明](../analysis-tools/system-deepening/hwrev-dispatch-table/REPRODUCE.txt) · [残余缺口](../analysis-tools/system-deepening/hwrev-dispatch-table/COVERAGE_RESIDUAL.json)
