# nonUSB 上报对象构造链与 0x3e28 布局分区图

相关分析见[回调实现、hwrev 标识与上报字段](callback-implementations-20261108.md)。本章汇总上报对象布局，给出尺寸下界、持久尾部的存活机制、块操作全集与构造函数分区。`0xb08` 处 `0x10f0` 大块的字段台账、GPIO 描述表 92 行全表与全镜像调用图见[GPIO 描述表、0x10f0 块字段与调用图](post-layout-closure-20261109.md)。

全部结论来自冻结 BBIN 的只读字节与既有 Ghidra 工程的 `-readOnly -noanalysis` 导出；没有执行固件、没有联网、没有访问设备或账号。字段名、单位、上报帧格式与实机时序仍需材料或设备，不在本章范围。

## 主要结论

| 项 | 结果 |
| --- | --- |
| 对象尺寸下界 | **`0x3e88` = 16008B**：顶层 `FUN_080086a4(param_2,0,0x3e08)` 定义 15880B 主域，`[0x3e08,0x3e88)` 是 128B 持久尾部 |
| 尾部存活机制 | 5 条尾部写入/复制语句在 pseudo-C 中**全部排在顶层 memset 之前**，先写尾部再清主域，因此尾部跨清零存活 |
| 块操作全集 | 解析 `puVar` 别名后共 **12 处**（8 memset + 4 memcpy），其中经别名解析确认的 3 个位点为：`0x0000`、`0xb08`、`0x3df8` |
| 构造函数 | **12 个**唯一函数体（13 份含 memset 导出，1 份重复）；**7 对**成对实例的偏移差全部等于该构造函数的 memset 尺寸，零缝隙 |
| 分区覆盖 | 53 个区间；主域内具块级语义的区间合并后覆盖 **11297 / 15880 = 71.14%**，剩余 4583B 分成 14 个空洞 |
| 纠偏 | 9 个 `function=none` 导出中只有 8 个是代码入口；`080191f4` 是 `080190e4` 尾部 literal pool 的 `0x00006001` 常量槽，不是代码 |

字节核验 **203 项 0 失败**；模型 **99 条断言 0 失败**。见 [布局图](../analysis-tools/system-deepening/report-object-layout/LAYOUT_MAP.json)、[构造函数台账](../analysis-tools/system-deepening/report-object-layout/CONSTRUCTOR_LEDGER.json)、[模型断言](../analysis-tools/system-deepening/report-object-layout/MODEL_RESULTS.json)、[逐项核验](../analysis-tools/system-deepening/report-object-layout/BYTE_VALIDATION.json) 与 [中文结论](../analysis-tools/system-deepening/report-object-layout/FINDINGS_ZH.txt)。

## 对象尺寸与 0x3e08 分界

主分派签名 `void analyst_seed_801d888(undefined4 *param_1, undefined1 *param_2)`；`param_2` 是字节指针，所有 `param_2 + 0xNNNN` / `param_2[0xNNNN]` 都是字节偏移。顶层清零长度 `0x3e08` 由主分派在 `0x0801DC98` 的 literal 给出，并已从冻结镜像整字核验。

以下 5 条语句在 pseudo-C 行序上全部位于 `FUN_080086a4(param_2,0,0x3e08)` 之前：

```c
*(code **)(param_2 + 0x3e08) = pcVar42;
param_2[0x3e14] = 1;
*(undefined4 *)(param_2 + 0x3e10) = 1000;
*(int *)(param_2 + 0x3e0c) = iVar2 + -1000;
FUN_08020f94(param_2 + 0x3e28, param_1 + 0x45, 0x50);
```

因此 `[0x3e08,0x3e88)` 是不受清零影响的尾部配置区：

| 偏移 | 尺寸 | 类型 | 说明 |
| --- | --- | --- | --- |
| `0x3e08` | 4 | 函数指针 | `pcVar42` |
| `0x3e0c` | 4 | int32 | `iVar2 - 1000` |
| `0x3e10` | 4 | uint32 常量 | `1000` |
| `0x3e14` | 1 | byte 常量 | `1` |
| `0x3e18` | `0xc` | 定时器块 | `080138d0` + `080135fa` |
| `0x3e24` | 4 | uint32 | `param_1[5]` |
| `0x3e28` | `0x50` | 从配置对象复制 | `param_1 + 0x45` |
| `0x3e7c` | `0xc` | 定时器块 | `080134a8(...,300000,60000)` |

定时器块尺寸 `0xc` 来自 `080138d0` 的 `memset(param_1,0,0xc)`；`080134a8` 只写 `param_1[0]` / `param_1[1]`，是同一块的赋值变体。衔接关系 `0x3e18+0xc=0x3e24`、`0x3e28+0x50=0x3e78`、`0x3e7c+0xc=0x3e88` 全部由模型逐项断言。

**`0x3e88` 是有写入证据的下界，不是 `sizeof`**：静态材料里没有分配点或长度常量可以定死上界。

## 12 处块操作与别名解析

显式 `param_2 + 0xNN` 可识别 9 处；按语句位置解析别名赋值 `puVar44 = param_2 + 0x3df8`、`puVar38 = param_2 + 0xb08`，可识别共 12 处：

| 偏移 | 类型 | 尺寸 | 说明 |
| --- | --- | --- | --- |
| `0x0000` | memset | `0x3e08` | 顶层主域清零 |
| `0x3e28` | memcpy | `0x50` | 从 `param_1 + 0x45` |
| `0x3df8` | memset | 9 | 标志块清零分支 |
| `0x3df8` | memcpy | 9 | 从 `0x080241a3` 复制默认模板 |
| `0x2a0` | memset | `0x868` | 传感子块区 |
| `0x37a4` | memset | `0x2dc` | 键盘/控制子块区 |
| `0xb08` | memset | `0x10f0` | 大块清零（别名解析新增） |
| `0x3dac` | memset | `0x18` | 第一路描述块 |
| `0x3dc4` | memset | `0x18` | 第二路描述块 |
| `0x1c0c` | memset | `0x444` | 采样区 |
| `0x1bf8` | memcpy | 8 | `param_1[0x68]` |
| `0x1c00` | memcpy | 8 | `param_1[0x69]` |

`0x3df8` 是同偏移的两个互斥分支：要么清零 9B，要么从冻结镜像 `0x080241a3` 复制 9B。该常量为 `01 01 01 01 00 00 00 00 01`，与 pseudo-C 中 `param_2[0x3df8..0x3e00]` 那组 byte 标志（4 个条件标志 + 4 个保留零 + 1 个标志）对应，是默认标志模板。

大块衔接链：`0x2a0+0x868=0xb08` → `0xb08+0x10f0=0x1bf8` → 两处 8B memcpy 到 `0x1c08` → `0x1c0c+0x444=0x2050`；另一条 `0x37a4+0x2dc=0x3a80` → `0x3dac+0x18=0x3dc4` → `0x3dc4+0x18=0x3ddc` → `0x3df8+9=0x3e01`。

## 构造函数台账与 7 对相邻实例

规则：构造函数以自己的 `FUN_080086a4(param_1,0,SIZE)` 清零 `param_1`，该 `SIZE` 就是它在主分派对象里占据的块长度。

| 函数 | 尺寸 | 主分派调用偏移 |
| --- | --- | --- |
| `080138d0` | `0xc` | 13 处定时器散点（含 `0x3e18`） |
| `08013cc0` | `0xc8` | `0x16e4` / `0x17ac` |
| `08014fcc` | `0x9c` | `0x2054` / `0x20f0` |
| `08017b80` | `0xa8` | 动态 `0x1170 + local_90*0xa8`，索引 `0xc..0xf` |
| `080190e4` | `0x60` | `0x3a84` / `0x3ae4` |
| `080192e4` | `0x108` | `0x37a4` / `0x38ac` |
| `08019718` | `0x58` | `0x1b8` |
| `0801991c` | `0xc0` | 由 `08019bac` 内部调用，不直接出现在主分派 |
| `08019bac` | `0x250` | `0x3b48` |
| `08019f7c` | `0x428` | `0x2a4` / `0x6cc` |
| `0801ab8c` | `0x2d8` | `0x2250` / `0x2528` |
| `0801c524` | `0x58` | `0x219c` / `0x21f4` |

13 份含 memset 的导出对应 12 个唯一函数体：`080190e4` 与 `08019170` 两个 TARGET 都解析到同一 Ghidra body `[[080190e4,080191e3]]`，按 owner 去重。

**7 对成对实例的偏移差全部等于该构造函数的 memset 尺寸**，这是块尺寸最硬的交叉验证——两个互相独立的来源（构造函数内部的清零长度、主分派里两处调用偏移）：

| 函数 | 实例 1 → 实例 2 | 差 | memset 尺寸 |
| --- | --- | --- | --- |
| `08019f7c` | `0x02a4` → `0x06cc` | `0x428` | `0x428` |
| `08013cc0` | `0x16e4` → `0x17ac` | `0xc8` | `0xc8` |
| `08014fcc` | `0x2054` → `0x20f0` | `0x9c` | `0x9c` |
| `0801c524` | `0x219c` → `0x21f4` | `0x58` | `0x58` |
| `0801ab8c` | `0x2250` → `0x2528` | `0x2d8` | `0x2d8` |
| `080192e4` | `0x37a4` → `0x38ac` | `0x108` | `0x108` |
| `080190e4` | `0x3a84` → `0x3ae4` | `0x60` | `0x60` |

单实例也有衔接证据：`0x1b8+0x58=0x210`（下一处定时器）、`0x2a4+2*0x428=0xaf4`（下一处 `080134a8`）、`0x3b48+0x250=0x3d98`（`param_2[0x3d98]` 写入点）。动态数组 `08017b80` 的 stride `0xa8` 也正好等于其 memset 尺寸，循环 `local_90 = 0xc` 到 `!= 0x10` 共 4 个实例。

## 覆盖率与 14 个空洞

`LAYOUT_MAP.json` 共 53 个区间。主域 `[0,0x3e08)` 内具块级语义的区间合并后覆盖 11297B，剩余 4583B 分成 14 个空洞。最大的是 `0x2800..0x37a4`（4004B，区间内只有 14 个标量写入），线索是 `param_2 + 0x2a3c` 存了 `param_2 + 0x2808` 指针，旁边 `0x2a40=0x14`、`0x2a44=0x1c` 像容量与步长；但静态没有任何块级初始化写入这片区域，**不能断言它是环形缓冲或采样队列**。其余空洞从 4B 到 320B，只有零散标量写入。

每个空洞都记录了区间内的标量写入条数，见 [布局图](../analysis-tools/system-deepening/report-object-layout/LAYOUT_MAP.json) 的 `coverage.holes`。

## literal pool 纠偏

首版核验把所有 `function=none` 导出都当代码入口做 Thumb 前缀扫描，在 `080191f4` 前缀的半字 `c925` 上误报 `undecoded_16`。实证：`pass1/080191f4.txt` 全文只有 `TARGET ... function=none` 与 `REF_TO 0801916a READ` 两行；`0801916a` 的指令是 `ldr r3,[0x080191f4] REF[READ:080191f4=6001]`；冻结镜像该处整字是 `0x00006001`；`080190e4` 的函数体止于 `0x080191e2`，之后到 `0x08019208` 是它的 literal pool。`c925` 是常量的一半，不是 `LDMIA` 指令——给解码器补 `LDMIA` 只会把数据继续误当代码。

正确做法是**先按 `REF[READ:addr=value]` 判定数据槽，再对其余入口做前缀解码**。修正后 9 个 `function=none` = 1 个数据槽 + 8 个真实代码入口；8 个前缀中 7 个止于 return、1 个止于无条件跳转、0 个 undecoded，172 项前缀机器码逐字节比对全过。

## 跨轮交叉验证与边界

[上报字段台账](../analysis-tools/system-deepening/callback-implementations/REPORT_FIELDS.json) 的 136 条写入、107 个唯一写入偏移、9 处块位点，作为输入做**子集断言**，全部落在布局分析识别的 156 个「pseudo-C 中出现的 `param_2` 偏移」与 12 处块操作内。两个数字是包含关系，不是矛盾。13 项构造函数 memset 尺寸另由 INSN 的 `movs r2,#imm` / `lsls r2,r2,#imm` / `ldr literal` 常量传播独立算出，与 pseudo-C 的 `SIZE` 逐项一致，0 失配。

边界：伪 C 的语句是**可能路径**不是执行轨迹；`0x3e88` 只是下界；空洞区字段名、单位、打包顺序、上报帧格式未定；构造分支实际走哪条、实机时序仍需设备。后续可继续的纯静态方向见 [残余清单](../analysis-tools/system-deepening/report-object-layout/COVERAGE_RESIDUAL.json)。
