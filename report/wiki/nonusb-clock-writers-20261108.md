# nonUSB 时钟配置链：三个写入点、两个入口与复位请求

相关实现与验证见[回调实现、hwrev 标识与上报字段](callback-implementations-20261108.md)；上报对象的完整布局见[上报对象构造链与 0x3e28 布局分区图](report-object-layout-20261109.md)。

本章说明nonUSB的频率变量写入点、配置入口与复位请求，并对照USB相关代码。SYSRESETREQ写入来自原指令，不能仅按反编译死循环判断错误出口。

## 主要结论

| 缺口表项目 | 状态 | 依据 |
| --- | --- | --- |
| nonUSB 频率变量 writer | 已闭合 | 三个写 `0x20000250` 的函数、三个写点、三条到 SysTick 配置的调用均以 nonUSB 自身字节验收 |
| nonUSB 配置入口 | 已闭合 | `080108ac` / `08010960` 两个入口、首次调用未检查返回值、后两次失败进入致命错误 |
| 错误辅助函数副作用 | 已闭合，两版同解 | 写 `SCB->AIRCR = 0x05FA0004` 主动请求系统复位，两版 5 项字节完全相同 |
| 全部上游配置选择 | 仍是缺口 | `0x20001cfc` 区间判断未绑到板型、型号或外部晶振 |
| 切换过渡 | 仍是缺口 | 寄存器已写与 SysTick 重配之间是否丢 tick、超时循环依赖同一软件 tick，只有静态条件结论 |
| 物理时序 | 需实测 | PLL 锁定、核心时钟、中断延迟、ADC CLKIN/DRDY，静态分析不能替代 |

字节核验总计 2151 条指令行、4640 指令字节、150 个 flash literal、167 个 BL 与 359 个直接分支目标，1174 个唯一地址，**0 失败**；见[逐项核验结果](../analysis-tools/system-deepening/nonusb-clock-writers/BYTE_VALIDATION.json)。

## 二、三个写 `0x20000250` 的函数

| nonUSB 函数 / 写点 | USB 对应 | 做了什么 | 失败边界 |
| --- | --- | --- | --- |
| `0800c828` / `0800c88c` | `08014c8c` | RCC 等待循环（3 / 5001 / 3 tick 门限），成功后写 `16000000` 并重配 SysTick | 超时返回 3，反编译标成 bool 掩盖了实际三态返回 |
| `0800c8dc` / `0800ca00` | `08014d40` | 振荡器/PLL 路径，按 `RCC_CR` 右移解码 `16000000 >> n` 写入变量，再重配 SysTick | 返回非零不回滚已改的寄存器或变量 |
| `0800cdb4` / `0800ce1a` | `08015218` | 源/分频与 Flash 等待，用分频表（nonUSB `080241cc`）解码频率后写变量，再重配 SysTick | 报错发生在寄存器和变量都已改过之后 |

三个写点紧接 `bl 0800995c`，与既有 `pass3/20000250.txt` 的三条 WRITE 引用、三条 UNCONDITIONAL_CALL 引用一致。这些地址是 nonUSB 自己读出来的，不是按 USB 地址差算出来的。完整并排地址见[双版本链条表](../analysis-tools/system-deepening/nonusb-clock-writers/CLOCK_CHAIN.json)。

## 三、两个配置入口：第一次失败被静默忽略

`080108ac` 以 `0x20001cfc` 的 16 位字段做区间判断（`value - 0xA87 <= 0x78`）：真分支写 16MHz，假分支写 32MHz，目标都是软件输入字段 `0x20000474`。`08010960` 则直接写 8MHz。两者随后都调用第一个 writer，**没有检查它的返回值**，再调用第二、第三个 writer 并检查非零，非零即进 `08008c04`。

因此这不是「失败就恢复旧时钟继续采样」：首步失败被忽略，后两步失败直接进致命错误路径。这个弱点两版都有，但是从 nonUSB 自己的字节读出的。三个数值是**软件输入变量**，不是解码后的 PLL 或实测核心时钟；USB 侧「三配置软件解码均得 64MHz」的结论没有在 nonUSB 侧复现，此处明确不平移。

## 四、错误链：发出了复位请求，不是只等看门狗

`0800a430`（USB `08012430`）只有七条指令：`dsb` 后加载 `0xE000ED00`（SCB 基址）与 `0x05FA0004`（`VECTKEY | SYSRESETREQ`），`str` 写入 `AIRCR`（+0xC），再 `dsb` 并自循环。两个 literal 与整段机器码在两版中逐字节相同。反编译把它显示成「两个 dsb 后空循环」，是因为它不吃 MMIO 写副作用；以原指令字节为准。

`08008c04`（USB `08010c04`）先调该辅助函数，再 `cpsid i` 加死循环，字节也两版相同。由于辅助函数末尾是无条件自跳转，后面的关中断与尾循环在正常控制流中**不可达**，只是复位未生效时的冗余兜底。导出记录该入口有 **106 条调用引用**；HardFault 风格处理器 `080127c4` 打印 r0..r3/r12/lr/pc/psr、用 32000000 次空循环延时后也走同一个复位辅助函数。所以它是通用致命错误出口，不能写成「仅时钟配置失败触发」。

静态字节只证明发出了复位请求，不能证明实机复位完成、看门狗行为或恢复后的状态。

## 五、双版本地址差必须分区看

前段 SysTick 配置与错误辅助函数是纯映像基址平移 `+0x8000`，5 项字节完全相同；三个 writer 与两个配置入口所在区段实际差 `+0x8464`；数据表与后段代码没有固定差（分频表 `080241cc` 对 `0802DFA0`）。起初按 `+0x8000` 把 `0800c828` 对到 `08014828` 得到 DIFFER，是把前段的差误用到了后段。三个 writer 的首 16 字节抽查里，writer 1 与 USB 不同，writer 2/3 相同——这只能说明局部，不能据此宣称整个 writer 区段等价。

**结构相同是逐项比对得出的结论，不是靠地址差推出来的；地址差也不能反过来代替证据。**

## 六、整数算术模型与一处自纠错

`model/clock_cases.py` 只重述已由 `0800995c` 与 NU-05 证明的公式：`q=floor(1000/step)`、`N=floor(clock/q)`、`LOAD=N-1`、`VAL=0`、`CTRL=7`。6 组（三个软件输入 × step 1/10）得到 LOAD `15999/159999`、`31999/319999`、`7999/79999`，7 条断言 0 失败，均落在 24 位字段内。

首版把条件性名义单位写成 `q/1000`，`step=10` 会得出 0.1 ms，与 USB 侧已证的「64MHz / step10 / LOAD 639999 / 10 ms」矛盾。正确推导是：一次 SysTick 为 N 个核心周期，仅在「运行中核心时钟等于该变量且中断正常服务」时等于 `1000/q` 毫秒。已改正单位、补上条件说明和防回归断言，修正过程保留在[模型结果](../analysis-tools/system-deepening/nonusb-clock-writers/MODEL_RESULTS.json)的 `corrections` 中。整数 q/N/LOAD 从未出错，修正只涉及单位解释，也不改变任何原字节证据。

## 适用范围与未解决问题

分析对象为所列官方样本，结论来自原字节、静态指令和有限模型。16／32／8MHz为软件输入；64MHz是依赖PLL锁定、切换成功与相关寄存器状态的计算值，不是实测频率。

14行硬件版本分派、setter写入快照、PLL与预分频、四种USART时钟源、整字除数及整数除法的所选输入验证已有技术章节。setter回调运行后的对象改写、hwrev/sku全部上报字段、型号/板型/晶振映射、实际RCC分支、波特率、切换过渡、丢tick、中断延迟和ADC采样时序仍需进一步代码或实机证据。

[配置对象与时钟源](config-object-snapshot-20261108.md) · [PLL计算](pll-sysclk-resolution-20261108.md) · [通道与USART](static-residual-closure-20261108.md) · [未解决问题](reverse-plan.md)


[完整中文结论](../analysis-tools/system-deepening/nonusb-clock-writers/FINDINGS_ZH.txt) · [双版本链条表](../analysis-tools/system-deepening/nonusb-clock-writers/CLOCK_CHAIN.json) · [逐项字节核验](../analysis-tools/system-deepening/nonusb-clock-writers/BYTE_VALIDATION.json) · [整数模型结果](../analysis-tools/system-deepening/nonusb-clock-writers/MODEL_RESULTS.json) · [可复跑脚本](../analysis-tools/system-deepening/nonusb-clock-writers/scripts/verify_clock_bytes.py) · [算术复跑](../analysis-tools/system-deepening/nonusb-clock-writers/model/clock_cases.py) · [输入 SHA 清单](../analysis-tools/system-deepening/nonusb-clock-writers/SOURCE_MANIFEST.json) · [导出命令](../analysis-tools/system-deepening/nonusb-clock-writers/EXPORT_COMMANDS.json) · [复跑说明](../analysis-tools/system-deepening/nonusb-clock-writers/REPRODUCE.txt) · [残余缺口](../analysis-tools/system-deepening/nonusb-clock-writers/COVERAGE_RESIDUAL.json)
