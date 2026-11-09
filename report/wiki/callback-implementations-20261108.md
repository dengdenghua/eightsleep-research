# nonUSB 回调实现、hwrev 标识与上报字段

上报对象的完整构造链与布局见[上报对象构造链与 0x3e28 布局分区图](report-object-layout-20261109.md)。GPIO 描述表 92 行全表、`0x10f0` 块字段台账与调用图见[GPIO 描述表、0x10f0 块字段与调用图](post-layout-closure-20261109.md)。

本章把配置对象里的函数指针解析为具体实现，解出 hwrev 对应的内部三字符标识公式，并枚举主分派对上报对象的写入台账。

全部结论来自冻结 BBIN 的只读字节与既有 Ghidra 工程的 `-readOnly -noanalysis` 导出；没有执行固件、没有联网、没有访问设备或账号。外设寄存器命名、BOM、晶振与实机时序仍需材料或设备，不在本章范围。

## 主要结论

| 项 | 结果 |
| --- | --- |
| 80 个回调指针 | 全部落到实现台账：**19 个**有 Ghidra 函数体，**61 个**由冻结镜像原始 Thumb 半字解出有界前缀，分 **21 类** |
| 短 thunk 语义 | `movs r0,#imm8` 是 `0x08027f10` 描述表的**索引 ID**，不是 ASCII 输出；`0801fdf0` 按 ID 写、`0801fdd0` 按 ID 读、`08010020` 发三脉冲 |
| 时钟链闭环 | `080108ac` 以 `hwrev - 0xA87 < 0x79` 在 16MHz / 32MHz 间选软件 HSE，`08010960` 选 8MHz；三个分支对应 writer2 的三版 CFGR2，均算出 64MHz SYSCLK |
| 内部三字符标识 | `0801dd62..0801dd80` 共 13 条指令把 hwrev 三个 nibble 转成 ASCII 写入 RAM `0x200014d8/d9/da`；**13 个真实阈值**与 flash 版本字符串逐项一致 |
| 上报字段台账 | 主分派 `0801d888` 有 **136 条**写入、**107 个**唯一偏移、**9 个**块操作，带来源类别与 hwrev/sku 条件 |
| 除数表引用点 | `0x0802420c` 全镜像仅 `0800ea48` 一处指针引用，末 4 项再无其它消费者 |

字节核验 **1250 项 0 失败**；三个模型 **39 条断言 0 失败**。见 [回调台账](../analysis-tools/system-deepening/callback-implementations/CALLBACK_LEDGER.json)、[标识映射](../analysis-tools/system-deepening/callback-implementations/HWREV_IDENTIFIERS.json)、[上报字段](../analysis-tools/system-deepening/callback-implementations/REPORT_FIELDS.json)、[逐项核验](../analysis-tools/system-deepening/callback-implementations/BYTE_VALIDATION.json) 与 [中文结论](../analysis-tools/system-deepening/callback-implementations/FINDINGS_ZH.txt)。

## 二、80 个回调解析方法

`CONFIG_SNAPSHOT.json` 里有 80 个唯一的 `thumb_function_pointer`（值带 Thumb bit0）。清 bit0 得偶数入口，四批 Ghidra 只读导出共 143 个 target，保留 147 份导出文本。

导出结果分为两类：19 个在工程里已有函数体（7~312 条 INSN），含 5 个大 init 回调 `080114bc`(176) / `08011914`(312) / `08011d90`(209) / `08012008`(210) / `08012274`(29)；61 个 `function=none`，是工程未解码区域。后者用 `scripts/thumb_lite.py` 从冻结镜像逐半字解码：**59 个**解到返回、**2 个**解到无条件跳转、**0 个** undecoded。其中 `0800f488` 是 125 个连续 `46c0` NOP 后接 `4770` 的 252B 占位 no-op 回调。


## 三、短 thunk 的真实语义

短thunk共享目标的行为如下：

| 函数 | 行为 |
| --- | --- |
| `0801fdf0(id,value)` | `0800acc8(desc[id].base, desc[id].mask, value)`；`value==0` 写 `base+0x28`（清零），否则写 `base+0x18`（置位） |
| `0801fdd0(id)` | `0800acbc(desc[id].base, desc[id].mask)`，读 `base+0x10` 并判非零 |
| `08010020(id)` | `fdf0(id,1); fdf0(id,0); fdf0(id,1)` 三脉冲 |
| `0x08027f10` | 12B/项 `[u32 外设基址, u32 引脚与掩码, u32 端口索引]`，基址 `0x50000000..0x50001400`，端口索引 0..5 |

因此 `08010140` 一类的 `b510; movs r0,#0x50; bl 08010020; bd10` 是「对描述表第 `0x50` 项发三脉冲」的 thunk；`080110a4` 一类的 `movs r0,#0x53; bl 0801fdd0` 是「读第 `0x53` 项」。24 个被引用的 ID 全部有合法描述条目（基址在外设区间、掩码非零、端口索引 ≤ 5），逐项核验落在 `BYTE_VALIDATION.json`。

其它实现族：3 个索引范围检查写表 thunk（`0800f8a0` / `0800fbb0` / `0800fbe4`）、6 个传感通道读/写 thunk（`0800b988` / `0800bac0`）、RAM 全局量 getter（`0800f420/f430/f444`，`f430` 带 DSB/DMB 屏障）、RAM 全局量 writer（`0800f7a0` 写 `0x200014dc`）、常量返回（`0800f586` 返回 1；`0800f714` / `0800f964` 直接 `bx lr`）。

**边界**：61 个是「有界前缀」，止于首条返回/无条件跳转，不是完整反编译；GPIO 寄存器名按偏移用法归纳，不是器件手册命名。

## 四、hwrev 分派 → init 回调 → PLL

7 个 init 回调装在配置对象 `+0x4`。差异核心是两个时钟入口：

| 入口 | 条件 | 软件 HSE | `uVar2`（PREDIV 字段） | CFGR2 |
| --- | --- | --- | --- | --- |
| `080108ac` | `hwrev - 0xA87 < 0x79` | 16000000 | `0x10` | `0x56061813` |
| `080108ac` | 其余（hwrev < 0xA87） | 32000000 | `0x30` | `0x56061833` |
| `08010960` | 8MHz 版本 | 8000000 | `0` | `0x56061803` |

三个分支经 `(HSE/PREDIV)*24/3` 都得 **64MHz SYSCLK**；`08012274` 首指令 `bl 08012008` 复用上一 init，不增加独立时钟入口。完整调用关系为：14 行累加分派选 init 回调 → init 按 hwrev 选软件 HSE 与 PREDIV → writer2 构造 CFGR2 → `0800cd24` 解出 64MHz → `0800995c` 装 SysTick LOAD。

适用条件：HSE 是写入 `0x20000474` 的软件输入，64MHz 是条件性计算值，不是实测晶振或实测频率。

## 五、hwrev → 内部三字符标识

主分派 `0801d888` 在配置块解析成功后执行 `0801dd62..0801dd80` 共 13 条指令：

```
d8 = ((hwrev >> 8) & 0xF) + 0x41
d9 = ((hwrev >> 4) & 0xF) + 0x30
da = ( hwrev       & 0xF) + 0x30
```

写入 RAM `0x200014d8` / `+1` / `+2`，`0x20001cec` 同时置 1 作解析有效标志。于是 `0x0805 -> I05`、`0x0900 -> J00`、`0x0A00 -> K00`、`0x0A05 -> K05`、`0x0A10 -> K10`、`0x0A87 -> K87`、`0x0A90 -> K90`，正好解释字符串表为何是 I/J/K 三系列。全镜像 `0x200014d8` 小端指针只有 5 处（`08012a58` / `08012d08` / `08012ecc` / `0801cf14` / `0801ded0`），`0x200014d9` 与 `0x200014da` 零命中——它们只通过基址 +1/+2 访问。

**两套独立机制的交叉验证**：配置对象 `+0x0` 装的是 flash `0x08024234` 的 14 个 4B ASCII 字符串指针，主分派把它复制到上报 `+0x3d9c` 供 `FUN_08012754("[sensor] %s mode")` 使用。13 个真实阈值下运行时公式与 flash 字符串逐字一致。字符串表 idx4=`K10` / idx5=`K05` 与阈值行 4=`0x0A05` / 5=`0x0A10` 的顺序互换不是错配：setter 的 `string_index` 分别是 5 和 4，交叉引用后仍一致。

| 边界情况 | 说明 |
| --- | --- |
| 阈值行 0 = `0x0000` | 无条件累加基线，不代表真实 hwrev；公式得 `A00`，flash 是 `I00`，已从 13/13 比对中单列剔除 |
| `hwrev 0x0AFF` | 公式得 `K??`（`+0x30` 遇 nibble>9 产生标点），flash 表无对应字符串 |
| `hwrev 0x0B00` | 公式得 `L00`，flash 表无对应字符串 |
| 配置块解析失败 | `0x20001cec=0`、三字节不写；RAM 里残留什么静态定不了 |
| `asrs` | 输入若确为零扩展16位值，则符号位为0，与逻辑右移结果相同；具体解释仍以载入宽度为准 |

## 六、上报字段台账

从 `pass2/0801d888.txt` 伪 C 扫描所有以 `param_2`（上报对象，声明 `undefined1*`，下标与加法都是字节偏移）为左值的赋值，按缩进维护 if 条件栈，得到 **136 条写入 / 107 个唯一偏移 / 9 个块操作**。每条记录偏移、宽度、值表达式、来源类别与外层条件；来源分 5 类：配置对象槽位、常量、回调/函数结果、运行时计算或自引用、RAM 全局/指针。

上报字段对应关系：

| 来源 | 上报偏移 | 说明 |
| --- | --- | --- |
| 配置 `+0x0` | `+0x3d9c` | 版本字符串指针，日志 `%s mode` |
| 配置 `+0x18c` | `+0x3a80` / `+0x3a81` | byte 状态，`0xff` 哨兵 |
| 配置 `+0x114..` | `+0x3e28` | `FUN_08020f94` 复制 `0x50` 字节 |
| 1000ms 超时块 | `+0x3e08` / `0x3e0c` / `0x3e10` / `0x3e14` | 由主分派装入 |

条件栈捕获到 hwrev 比较（`0xA32` / `0xA34` / `0x94F` / `0xA31` / `0xA33` / `0xA80` 等）与 sku 比较（`DAT_20001cf8 != 4`）。

**边界**：这是反编译重建的「可能写入」，不是执行轨迹；条件栈按缩进采集 `if`，不覆盖 switch/label 跳转的完整数据流；宽 memcpy/memset 只记为块操作；字段名称、单位与物理通道在冻结镜像里不存在，不作字段语义命名。

## 七、除数表引用点与残余

全镜像小端扫描 `0x0802420c` 指针只有 1 处：`0800ea48`（`0800e8b4` 内）。16 项 u16 表为 `[1,2,4,6,8,10,12,16,32,64,128,256,0x408,0x402,0x108,0x101]`。依据「末 4 项是整字传给除法 helper、无拆分指令」，引用点集合已核对；功能定论仍缺材料。

仍可做（纯静态）：描述表全表逐项端口/引脚语义、`0801fd60` 完整返回语义、7 个 init 回调逐条差异对照、上报字段条件栈完整数据流、9 个块操作展开、4 个标识读取者的使用上下文。

需要新增材料或设备：外设寄存器命名与 datasheet、板级 BOM 与晶振、末 4 项除数功能定论、通道 → 物理传感通道、上报字段名/单位、营销型号映射、运行时 RCC 走向/波特率/除数索引、64MHz 实测、PLL lock 与切换过渡、ADC 时序、解析失败时 RAM 标识残留值、回调是否真被调用、全部实机时序。

## 复现

`cd report/analysis-tools/system-deepening/callback-implementations` 后依次运行 `scripts/verify_callback_bytes.py`、`model/build_models.py`、`scripts/write_export_commands.py`、`scripts/write_source_manifest.py`。四批 Ghidra 导出的精确 argv 见 [EXPORT_COMMANDS.json](../analysis-tools/system-deepening/callback-implementations/EXPORT_COMMANDS.json)，完整步骤见 [REPRODUCE.txt](../analysis-tools/system-deepening/callback-implementations/REPRODUCE.txt)。
