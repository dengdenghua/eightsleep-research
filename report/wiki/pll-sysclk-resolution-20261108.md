# nonUSB PLL → SYSCLK：三套软件输入都算出 64MHz

相关实现与验证见[回调实现、hwrev 标识与上报字段](callback-implementations-20261108.md)；上报对象的完整布局见[上报对象构造链与 0x3e28 布局分区图](report-object-layout-20261109.md)。

本章将RCC复位态、PLL结构体、时钟源切换与SysTick除法连接为可复算链。三套软件输入在指定成功条件下均计算为64MHz。

## 主要结论

| 项 | 结果 |
| --- | --- |
| nonUSB独立频率推导 | nonUSB自身字节推导表明：16 / 32 / 8MHz 三套软件 HSE 输入算出同一 SYSCLK = 64MHz |
| 两个配置入口的局部结构体 | 14 个槽位用常量传播逐条复算，三版只有 `s[9]`（PREDIV 字段）不同：`0x10` / `0x30` / `0` |
| 预分频表的实际取值 | 第二个结构体 `s[2]=0` → 索引 0 → `table[0]=0` → 不分频，`0x20000250 = 64MHz` |
| SysTick 装载值 | `q=1000/step`、`N=clock/q`、`LOAD=N-1` → step 1 得 63999，step 10 得 639999 |
|  K87 频率分界的下游影响 | PREDIV 随同一分支从 4 改 2，PLL 输入恒为 8MHz，**SYSCLK 和 SysTick 装载值不变** |

字节核验 **1418 项检查 0 失败**（1340 条导出指令行、82 个 literal、73 个 BL、244 个直接分支、16 项预分频表、24 个 literal 常数、49 条关键指令、3 组 14 槽位结构体常量传播）；算术模型 **3 组输入 / 30 条断言 0 失败**。见[逐项核验](../analysis-tools/system-deepening/pll-sysclk-resolution/BYTE_VALIDATION.json)与[模型结果](../analysis-tools/system-deepening/pll-sysclk-resolution/MODEL_RESULTS.json)。

## 二、先把 RCC 复位成已知态

`0800c828` 在两个配置入口开头被调用，逐字节可核：

| 寄存器 | 写入值 | 指令 |
| --- | --- | --- |
| `0x40021000` CR | `0x100` | `0800c862` |
| `0x40021008` CFGR | `0`（SW=HSI） | `0800c856` |
| `0x4002100c` CFGR2 | `0x1000` | `0800c87e` |
| `0x20000250` 时钟变量 | `16000000` | `0800c88c` |

关键一步：`0x1000 & 0x11c1808c = 0`。writer2 写 CFGR2 时要保留 `old & 0x11c1808c` 这些位，而 writer1 刚把旧值定成 `0x1000`，**保留项恒为 0**，所以 CFGR2 最终值只由结构体槽位决定，不再含未知运行时位。

## 三、14 槽位结构体与 CFGR2 表达式

`verify_pll_chain.py` 内置一个只覆盖所用指令的 Thumb 常量传播器，从 `movs` / `lsls` / `adds` / `str [sp,#imm]` 逐条算出槽位值，不是抄反编译文本。三版 14 项与期望 0 差异：

| 槽位 | 值 | 用途 |
| --- | --- | --- |
| s[0] / s[1] | 9 / `0x10000` | 功能标志 / HSE 源选择 |
| s[2..5] | 0 | `080086a4(&local_40,0,0x38)` 清零后未赋值 |
| s[6] / s[7] / s[8] | 1 / 2 / 3 | LSI / 目标 SW / PLLSRC 低两位 |
| **s[9]** | **`0x10` / `0x30` / `0`** | **PREDIV 字段（唯一版本差异）** |
| s[10] / s[11] / s[12] / s[13] | `0x18` / `0x60000` / `0x6000000` / `0x40000000` | PLLMUL=24 / 其它字段 / PLLDIV 字段 |

`0800cc2c..0800cc64` 的 OR 序列：

```
CFGR2 = s[8] | s[9] | (old & 0x11c1808c) | s[11] | s[12] | s[13]
        | (s[10] << 8) | 0x10000000
     -> 0x56061813 (16MHz) / 0x56061833 (32MHz) / 0x56061803 (8MHz)
```

低两位 = 3 让 `0800cd24` 的 `(~CFGR2 & 3) == 0` 成立，选 HSE 软件输入；bits6:4 给出 PREDIV−1；bits14:8 = `0x18`；bits31:29 = 2。

## 四、SYSCLK 公式（按指令移位复算）

`0800cd52..0800cd78`：

```
PREDIV = ((CFGR2 << 25) >> 29) + 1
PLL输入 = (~CFGR2 & 3) == 0 ? 0x20000474 : 16000000
r0      = PLL输入 / PREDIV                 // bl 08008174 @0800cd6a
PLLMUL  = (CFGR2 << 17) >> 25
r0      = r0 × PLLMUL                     // 0800cd72 muls
PLLDIV  = (CFGR2 >> 29) + 1
SYSCLK  = r0 / PLLDIV                     // bl 08008174 @0800cd78
```

| 软件 HSE 输入 | PREDIV | HSE/PREDIV | PLLMUL | ×后 | PLLDIV | SYSCLK |
| --- | --- | --- | --- | --- | --- | --- |
| 16MHz | 2 | 8MHz | 24 | 192MHz | 3 | **64MHz** |
| 32MHz | 4 | 8MHz | 24 | 192MHz | 3 | **64MHz** |
| 8MHz | 1 | 8MHz | 24 | 192MHz | 3 | **64MHz** |

`0800cd24` 只在 `(CFGR & 0x38) == 0x10`（SWS 已切到 PLL）时走这一支。`0800cdb4` 的第二个结构体是 `[7, 2, 0, 0x4000]`：目标 SW=2（PLL）、预分频索引 0，切换成功后调用 `0800cd24()`，按 `0x080241cc` 表首项（0）右移写入 `0x20000250`，再由 `0800995c` 算 SysTick。反事实用例：若 32MHz 版误用 PREDIV=2，模型得出 128MHz，说明 PREDIV 必须随软件输入缩放。

**这直接解释了的 K87 分界**：K87 起软件 HSE 字段从 32MHz 改 16MHz，PREDIV 同步从 4 改 2，PLL 输入恒为 8MHz，因此核心时钟与 SysTick 装载值不变。分派表改变的是「用哪个软件字段」，不是「tick 多快」。

## 五、边界（必须一起读）

- **HSE 16/32/8MHz 是固件写入 `0x20000474` 的软件输入，不是实测晶振。** 闭合的是「软件输入 → 固件计算并写入的 SYSCLK」；「物理晶振 → 实际核心时钟」仍需实机。
- 64MHz 是**条件性**结果：依赖 PLL 锁定、SW=2 切换成功且 SWS 读回 `0x10`、writer1 复位态未被其它代码改写、没有进入 `08008c04` 致命错误出口。静态字节不能证明这些运行时事件。
- `08008174` 的整数除法语义来自三处调用点（1000/step、clock/q、PLL 两次除法）都把返回值当商使用，未对 helper 做指令级验证。`step` 是 `0x20000258` 的 RAM 字节，模型里的 1 / 10 是显式假设。
- `0800e8b4` 用同一 `0800cd24()` 算 USART 波特率，分析范围仅记录影响面，未重算波特率寄存器。切换过渡与累计 tick 损失、PLL lock 时间、中断延迟、ADC CLKIN/DRDY 与实际采样率仍需实机。
- 原始证据按来源版本保留，正文采用当前有效结论。气囊与床架的实现与残余问题另列专题；核心生理算法、Autopilot、姿态分类、实机绑定、音箱 DSP、USB `0x2B` 首次生产者与旧波形 RAW writer 保持原状。共享日志格式缓冲/重入专项此前被自动安全检查中止并标记未验收，分析未重试、未改写措辞、未引用草稿结论。

[完整中文结论](../analysis-tools/system-deepening/pll-sysclk-resolution/FINDINGS_ZH.txt) · [结构化链条](../analysis-tools/system-deepening/pll-sysclk-resolution/PLL_CHAIN.json) · [逐项字节核验](../analysis-tools/system-deepening/pll-sysclk-resolution/BYTE_VALIDATION.json) · [算术模型结果](../analysis-tools/system-deepening/pll-sysclk-resolution/MODEL_RESULTS.json) · [核验脚本](../analysis-tools/system-deepening/pll-sysclk-resolution/scripts/verify_pll_chain.py) · [算术复跑](../analysis-tools/system-deepening/pll-sysclk-resolution/model/pll_cases.py) · [输入 SHA 清单](../analysis-tools/system-deepening/pll-sysclk-resolution/SOURCE_MANIFEST.json) · [导出命令](../analysis-tools/system-deepening/pll-sysclk-resolution/EXPORT_COMMANDS.json) · [复跑说明](../analysis-tools/system-deepening/pll-sysclk-resolution/REPRODUCE.txt) · [残余缺口](../analysis-tools/system-deepening/pll-sysclk-resolution/COVERAGE_RESIDUAL.json)
