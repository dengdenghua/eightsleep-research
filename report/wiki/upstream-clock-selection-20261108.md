# nonUSB 上游时钟选择：从 hwrev 到 SysTick

相关实现与验证见[回调实现、hwrev 标识与上报字段](callback-implementations-20261108.md)；上报对象的完整布局见[上报对象构造链与 0x3e28 布局分区图](report-object-layout-20261109.md)。

本章追踪HWINFO的hwrev字段到板型分派、启动配置及SysTick频率变量，列明运行时寄存器解码与引用覆盖范围。

## 主要结论

| 残余 | 状态 | 关键证据 |
| --- | --- | --- |
| 全部上游配置选择 | 大幅推进 | `0x20001cfc` 是 HWINFO 的 `hwrev`；14 项阈值表 + 14 个版本字符串 + 版本 setter + 6 个 init 变体 |
| nonUSB PLL 解码 | 覆盖到运行时公式 | `0800cd24()` 按 RCC 源/PLL 字段计算 SYSCLK，不是硬编码 64MHz |
| 全程序 CFG 覆盖 | 部分 | 106 条致命错误调用引用按段量化 + 4 个抽样上下文 |
| 切换过渡 / 物理时序 | 仍是缺口 | 寄存器已写与重配之间的 tick 损失、PLL 锁定、中断延迟需实机 |

字节核验 **6782 条指令行、15096 字节、856 个 literal、765 个 BL、577 个分支目标、5051 个唯一地址、7 张数据表，0 失败**；9 组算术 9 条断言 0 失败。见[逐项核验](../analysis-tools/system-deepening/upstream-clock-selection/BYTE_VALIDATION.json)。

## 二、`hwrev` 与 14 项分派表

`0801d888` 从 `0x0807F804` 解析出厂 HWINFO：`FUN_0801ae3a(&ctx,"hwrev",&DAT_20001cfc)` 填 `0x20001cfc`，`0x20001cec` 是有效标志，`0x20001cf8` 是 sku。版本字符由 `((hwrev >> 8) & 0xf) + 0x41` 得到（0x0805→I、0x0900→J、0x0A00→K），所以 0x0A87→"K87"、0x0A90→"K90"。

`0x08025da4` 起 14 个 8 字节行 `[u16 阈值][u16 pad][u32 callee]`：

| 行 | 阈值 | callee | 行 | 阈值 | callee |
| --- | --- | --- | --- | --- | --- |
| 0 | `0x0000` | `0800f58d` | 7 | `0x0A33` | `0800fc65` |
| 1 | `0x0805` | `0800f719` | 8 | `0x0A34` | `0800fc99` |
| 2 | `0x0900` | `0800f761` | 9 | `0x0A35` | `0800fcc1` |
| 3 | `0x0A00` | `0800f969` | 10 | `0x0A36` | `0800fce1` |
| 4 | `0x0A05` | `0800fafd` | 11 | `0x0A37` | `0800fd0d` |
| 5 | `0x0A10` | `0800fae1` | 12 | `0x0A87` | `0800fd25` |
| 6 | `0x0A30` | `0800fc05` | 13 | `0x0A90` | `0800fd31` |

循环次数由 `0801d8cc` 的 `cmp r5,#0xe` 逐字节固定为 14。**所有 `阈值 <= hwrev` 的行累加生效**，不是二选一。`0x08024234` 起另有 14 个版本字符串 `I00 I05 J00 K00 K10 K05 K30 K33 K34 K35 K36 K37 K87 K90`，其中 `K87`/`K90` 与阈值 0x0A87/0x0A90 对齐，而 0x0A87 正是[时钟配置入口](nonusb-clock-writers-20261108.md)区间判断的下界。

只核验了 4 个 setter：`0800f58c` 写 "I00" 与 init 指针 `08010bf4`；`0800f718` 写 "I05"；`0800fc04` 写 "K30" 与 `08011915`；`0800fc98` 写 "K34" 并按 sku 选次级表。**没有建立全表一一映射**，且字符串表顺序（K10 在 K05 前）与阈值数值序不同，不强行配对。

## 三、六个 init 变体，两个配置入口

| init 变体 | 调用入口 | Thumb 指针 literal |
| --- | --- | --- |
| `08010bf4`（精简） | `080108ac` | `0800f698` = `08010BF5` |
| `08010c6c`（精简） | `080108ac` | `0800f78c` = `08010C6D` |
| `080114bc` | `08010960` | `0800fa60` = `080114BD` |
| `08011914` | `080108ac` | `0800fc44` = `08011915` |
| `08011d90` | `08010960` | `0800fb74` = `08011D91` |
| `08012008` | `080108ac` | `0800fc88` = `08012009` |

`080108ac` 的 4 个调用点是 `08010bfa / 08010c72 / 080119ce / 080120bc`；`08010960` 的 2 个是 `08011570 / 08011e50`。前两个在既有工程里 `function=none`，是用范围导出读到的指令，不是靠函数识别猜的。`080108ac` 的条件 `hwrev - 0xA87 < 0x79` 即 `0x0A87..0x0AFF` 写 16MHz，否则 32MHz；`08010960` 固定写 8MHz。

## 四、系统时钟是运行时公式，不是 64MHz

`0800cd24()` 按 RCC 时钟源选择位分支：

| SWS | 返回值 |
| --- | --- |
| `0x00` HSI | `16000000 >> ((RCC_CR & 0x3fff) >> 11)` |
| `0x08` HSE | 直接返回软件输入字段 `0x20000474`（16/32/8MHz） |
| `0x10` PLL | 由 PLLMUL / PLLSRC / PLLDIV 字段做整数乘除 |
| `0x18` / `0x20` | 固定 32000（LSI） / 32768（LSE） |
| 其它 | 0 |

`0800cdb4` 再按 `0x080241cc` 的 16 项预分频移位表 `[0×8,1,2,3,4,6,7,8,9]` 右移，才写 `0x20000250`。所以 **SysTick 的时钟变量不一定等于核心时钟**，最大可分到 1/512；`0800995c` 再由它算 `q=floor(1000/step)`、`N=floor(clock/q)`、`LOAD=N-1`。

USB 侧「三配置软件解码均得 64MHz」是在自己的配置结构体里得出的；nonUSB 这里明确是读运行时寄存器算出来的。分析范围仅把 64MHz 用作 `LOAD=63999/639999` 的**公式校验**，没有声称 nonUSB 实际跑 64MHz。有限模型里一组假设寄存器算出的是 12.8MHz，正是为了说明输出随寄存器变化。

## 五、影响面不止软件 tick

`0800e8b4`（USART/外设时钟配置）在两处调用 `FUN_0800cd24()` 计算波特率寄存器。`0800cd24` 的 3 个调用点 `0800e9ba / 0800ea20 / 0800ce00` 中，最后一个在 writer 3 内部。因此错误的时钟变量或旧值会同时影响串口时序和软件 tick，而不只是采样时间戳。

## 六、106 条致命错误调用引用

按 4KB 段：`0x08008xxx` 27 条、`0x08009xxx` 27 条、`0x08010xxx` 4 条、`0x08011xxx` 48 条，全部 `UNCONDITIONAL_CALL`、106 个来源地址无重复。抽查 `080088f0`（启动/外设初始化）、`08009514`（初始化辅助）、`08011288`（应用回调注册）、`08011914`（同时调用 `080108ac` 的板级 init）。结论：通用致命错误出口，不是时钟专用。这是引用分布加 4 个抽样，**不是全程序 CFG 覆盖**。

## 适用范围与未解决问题

分析对象为所列官方样本，结论来自原字节、静态指令和有限模型。16／32／8MHz为软件输入；64MHz是依赖PLL锁定、切换成功与相关寄存器状态的计算值，不是实测频率。

14行硬件版本分派、setter写入快照、PLL与预分频、四种USART时钟源、整字除数及整数除法的所选输入验证已有技术章节。setter回调运行后的对象改写、hwrev/sku全部上报字段、型号/板型/晶振映射、实际RCC分支、波特率、切换过渡、丢tick、中断延迟和ADC采样时序仍需进一步代码或实机证据。

[配置对象与时钟源](config-object-snapshot-20261108.md) · [PLL计算](pll-sysclk-resolution-20261108.md) · [通道与USART](static-residual-closure-20261108.md) · [未解决问题](reverse-plan.md)


[完整中文结论](../analysis-tools/system-deepening/upstream-clock-selection/FINDINGS_ZH.txt) · [结构化链条](../analysis-tools/system-deepening/upstream-clock-selection/UPSTREAM_CHAIN.json) · [逐项字节核验](../analysis-tools/system-deepening/upstream-clock-selection/BYTE_VALIDATION.json) · [算术模型结果](../analysis-tools/system-deepening/upstream-clock-selection/MODEL_RESULTS.json) · [可复跑核验脚本](../analysis-tools/system-deepening/upstream-clock-selection/scripts/verify_upstream_bytes.py) · [算术复跑](../analysis-tools/system-deepening/upstream-clock-selection/model/system_clock_cases.py) · [输入 SHA 清单](../analysis-tools/system-deepening/upstream-clock-selection/SOURCE_MANIFEST.json) · [导出命令](../analysis-tools/system-deepening/upstream-clock-selection/EXPORT_COMMANDS.json) · [复跑说明](../analysis-tools/system-deepening/upstream-clock-selection/REPRODUCE.txt) · [残余缺口](../analysis-tools/system-deepening/upstream-clock-selection/COVERAGE_RESIDUAL.json)
