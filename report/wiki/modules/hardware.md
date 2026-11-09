# 硬件平台与版本对应

本页核对硬件与固件对应关系：主控芯片、传感器小板和各自的软件都有自己的版本号。现在已知道若干型号，但还不能把下载的每个文件都认定为你这台机器正在使用的版本。

研究对象是用户确认采用 MT8365 的国行 Pod6。已取得的官方 MTK 系统包确实以 `mt8365-8sleep` 为目标，FIT 设备树写明 MT8365 Pumpkin。**同一主控、相近产品名称或相同硬件修订，均不足以证明实机正在运行这份镜像。** 本页把已下载样本、账号给出的非唯一硬件标签和代码条件分开。[平台证据](../../evidence/analysis/system/MTK_COMPARISON.txt)

## 系统中的硬件层次

| 层次 | 样本中承担的工作 | 与上下游的关系 |
| --- | --- | --- |
| MT8365 Linux 主机 | 运行 Frank、Capybara、DAC、NATS 和 uploader | 接收 MCU 数据；执行控制编排；与云端通信 |
| 每侧逻辑传感设备 | MCU 管理压电 ADC、IMU 与数字按键输入 | 通过串口或 USB CDC 把 LSP 数据送给主机 |
| 外置 ADC 与 IMU | 模拟转换、器件内滤波、六轴读数 | MCU 读取后保存 counts；未在该链换成压力或床体坐标 |
| Frozen 热管理 MCU | 本地温度控制、泵风扇和保护 | 由主机发送目标与模式；不是睡眠分期引擎 |
| Balloon 等附件 | 气囊、机械状态和独立故障遥测 | Capybara 解析、控制；附件修订单独选择固件 |

前两层传感拓扑有明确代码证据：主机依据 USB 树给逻辑设备分配左右侧；单个数据包中的 ADC0 与 ADC1 不代表床的左右侧。协议有 16 个 ADC 槽，不等于每侧 16 片压电元件；Stealth 路径取其中 5 路 buzzer 和 4 组 IMU，也不能仅凭这个组合确定实体 BOM。[主机拓扑](../../evidence/analysis/signal-host/SIGNAL_HOST_ANALYSIS.txt)

## 版本不能合并成一个编号

| 名称空间 | 已下载样本中的值 | 可以说明什么 |
| --- | --- | --- |
| SWU 与 `/etc/rat_version` | `4b7552d5a9aed31997ff22cf193240800056ef6a` | 系统镜像标识，OTA CurrentRev 的设备端来源 |
| Frank sysinfo build | `92f66c9f` | 此 native 二进制编译进来的构建字符串 |
| DAC clientVersion | `1.6.0` | Node 包版本，进入设备握手字段 |
| Capybara assembly | `1.0.0+f9ce9ce8d3678940189d79fbac13febbfef00073` | .NET 程序集元数据 |
| sensor MCU | USB 与 nonUSB 均为 `5.5.34.0` | 版本字段相同，文件、基址和代码并不相同 |
| 移动 API firmwareCommit | 另一个服务端提供的提交字段 | 尚未闭合它与上述任何一个版本来源的映射 |

主机硬件 Ixx、传感板 Kxx、附件 Axx 又是不同的修订空间。用户确认 Pod5 与 Pod6 主控未变，因此不能将 MTK/NXP 两个官方包的差异直接称为 Pod5/Pod6 差异。[版本来源链](../../evidence/analysis/account-readonly/current-firmware-match/namespace-trace/FINDINGS_ZH.txt)

## K60 条件下可以落到哪一步

保留的账号报告给出传感部件 PN 20600/20601、SKU 0006、修订 K60；主机非唯一标签为 PN 20500、SKU 0007、修订 I35。这些是 API 元数据，未直接读取 MCU 制造页。

把 K60 代入原样本的修订解析规则得到 `0x0A60`。累积配置回调到 K37 为止，K33 已禁用 ADC0 描述符，K37 把 ADC1 的源到目的映射设为 `[3,2,1,0,4,5,6,7]`。若初始化成功且未通过运行期命令改表，主机 wire8..12 对应 ADC1 源3、2、1、0、4；请求 PGA 1×，读出后软件乘4，接口为 SPI2、CS PD0、ready PE2。它确定的是逻辑通道关系，仍不能定位传感片在床上的位置。[K60 条件推导](../../evidence/analysis/account-readonly/k60-binding/FINDINGS_ZH.txt)

同包 nonUSB 镜像已独立追到配置复制、ADC 对象指针与采样写入，确认上述窄范围的 K60 启动映射一致；并未证明两镜像全程序等价。主机用设备路径末段是否以 `ttyACM` 开头选择 USB 镜像，K60 标签本身不选择 transport。I35 代入原 `machine.json` 选择 I21 配置，左右 USB 根分别是 `1-1.4`、`1-1.3`，也仍待实机核对。[nonUSB 独立链](../../evidence/analysis/account-readonly/k60-binding/nonusb-flow/FINDINGS_ZH.txt)

## 压电、ADC与采集板怎样对应

**当前代码支持“一个逻辑侧由传感MCU读取多个通道后统一封包”，不足以证明“每片压电各有一张采集卡”。** ADC0/ADC1是同侧内部的两组ADC来源；左右侧由主控的设备路径区分。实际ADC封装、PCB数量和压电片位置仍需硬件材料。

按上述K60启动条件，所审链为：

```text
物理压电/模拟前端（布线未知）→ ADC1多通道目标（SPI2 / PD0 / PE2）
→ 该侧传感MCU → LSP中的wire槽 → 主控该侧buzzer输出
```

| ADC1源通道 | LSP槽 | 所审K60 Stealth输出 | 物理元件/位置 |
| --- | --- | --- | --- |
| 3 | wire8 | buzzer data[0] | 未知 |
| 2 | wire9 | buzzer data[1] | 未知 |
| 1 | wire10 | buzzer data[2] | 未知 |
| 0 | wire11 | buzzer data[3] | 未知 |
| 4 | wire12 | buzzer data[4] | 未知 |
| 5 | wire13 | 本条件不输出；旧兼容路径另有用途 | 未知 |
| 6、7 | wire14、15 | 本条件不输出multi | 未知 |

这张表对两侧分别适用，不能将五路输出理解为已确认五张采集板。4组IMU协议字段也不直接证明4个实体IC及其安装坐标。配置请求PGA、MCU软件乘4和主控gain元数据是三项独立信息，不能相乘后就给出压力标定。

已直接重读原BBIN的8字节map，并重核42份既有引用；[32槽核对表JSON](../../analysis-tools/system-deepening/channel-topology-matrix/MATRIX.json)与[CSV](../../analysis-tools/system-deepening/channel-topology-matrix/MATRIX.csv)逐侧列出来源、输出及空缺的物理字段。它是后续板级核对表，所有`observed_on_device`均为false。[映射与来源证据](../../evidence/analysis/system-deepening-20261108/channel-topology-matrix/FINDINGS_ZH.txt)

## 时钟与物理量边界

在制造 PN 与 K60 条件成立、未跳过 clockgen 且寄存器写入成功的分支中，会选 `gm` 表，活动输出2、3明确配置 R-divider=1；再假设实际 CLKIN 为32 MHz，计算得到8.192 MHz。其他修订的输出7可能缺 R-divider 状态，不能套用同一确定值。以上仍未测到 PCB 连线、实际时钟、DRDY 相位、ADC 参考电压、模拟增益与机械传递函数。[时钟条件](../../evidence/analysis/account-readonly/k60-binding/FINDINGS_ZH.txt)

## 待办与验收

- **HW-01，需实机材料：** 收集同一次启动的系统标识、组件构建号、传感 MCU 版本和 transport，建立 API 字段到设备版本的对应表；验收时必须有同源时间与哈希或可验证版本，不能只比主控型号。
- **HW-02，需实机材料：** 取得制造页、板卡照片或原理图，将逻辑槽映射到实际元件与床上位置；输出逐项已知与未知的 BOM/坐标表。
- **HW-03，需实机材料：** 读取运行时 map、PGA、时钟寄存器并测量 CLKIN/DRDY；只有测量闭合后才报告实际采样率与 counts 标定。

关联模块：[传感采集](sensor-mcu.md)、[主机信号组织](host-signal.md)、[缓存与上传](raw-upload.md)。
