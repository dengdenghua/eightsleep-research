# 枕头附件：采样、缓存与主控输出

本页针对 MTK 包内 90,220 字节 `firmware-pillow.bbin`，SHA256 为 `1344d170a6c74f0aa0e38195b89d687ea9f69105980db0a83ddb5e3ee68661d1`。它是独立固件；尚未证明用户设备安装了该附件或运行此版。

## 六个 IMU：缓存快照不是六路同步新测量

主循环依次检查六个 ICM 的状态并更新各自 12 字节缓存；定时回调再按 selection 复制缓存，形成 84 字节记录。队列容量为 20 条，满时拒收新记录。主控正常连接请求 200 Hz，MCU 还支持其他档位，但没有真实采样记录。

`0x38` 每包编码 10 行，六路全选时 body 为 730 字节。正常发送代码先取一条，再在每轮末尾继续取，合计 **11 次出队尝试、10 行编码**：有限模型中，进入时正好 10 条则末次失败；至少 11 条且没有中途新回调时，第 11 条被取出却未进入本包。这里说明代码行为，不推定实际丢样比例。

主控将每个器件拆为 accel/gyro 的 XYZ，原值 32767 改为 32766，给缺值 32767 留出标记。每轴固定保留 200 个槽，按 `(tick % 1000) / 5` 定位，输出数组为小端 int16。即使 MCU 可选其他频率，这个编码器仍写 200；不能称为自动重采样。

## 每种数据有自己的处理和时间规则

| 报文 | MCU 本地处理 | Frank 输出 |
| --- | --- | --- |
| 0x38 | 六路六轴缓存，selection 选择，10 行一包 | `pillow-accel` → `raw.pillow.laccel/raccel`；时间锚映射、固定槽和缺值 |
| 0x3a | FDC 四槽补偿/自动量程/缓存，实际只发槽 0/1 | `pillow-capsense` → `raw.pillow.capsense`；主控时间覆盖 MCU tick，−1.0 保留为值 |
| 0x3b | 每 5 tick 累加当前 LIS XYZ 缓存，每 1000 tick 求均值 | `pillow-orientation` → `raw.pillow.orientation`；主控赋时，结果仍为 XYZ |
| 0x43 回复 | ICM 内部温度、SHT40 温湿度、MCU 温度、TMP1075 板温 | `pillowTemp` → `raw.pillow.ltemp/rtemp`；按 ID 和 selection 组织 |

方向字段没有在这条链中变成姿势标签。LIS 均值按缓存读取次数计算，没有独立的新样本计数；电容虽有四槽内部计算，不能说四槽全部上传。

FDC 使用 `signed24 × 2^-19 + CAPDAC × 3.125`，含自动量程、grace 与 5500 tick 缓存年龄规则。该版 0x3a 的状态固定为 0，不能沿用传感垫的 railed/locked 诊断含义。

## 温湿度与缺值编码

SHT40 两项 CRC 均通过才更新缓存：`T=175×raw/65535−45+offset`，`RH=125×raw/65535−6`，本函数没有把湿度夹到 0..100。失败时保留旧值。TMP1075 将有符号 12 位原值乘 0.0625；MCU 温度按工厂校准点和 ADC 参考计算。

0x43 使用 `id + i16BE×100`。普通温度 −100 哨兵编码为 `0x8000`，湿度的相应缺值分支却编码为 `0x00ff`。主控先按 signed16/100 解码，因此不能把解出的 −327.68 或 2.55 当成真实测量，也不能统一声称它们已转 null。

## 敲击、自检与本地振动

LIS 敲击候选与按钮各有缓存和静默计时，再通过 0x36 进入主控已有的闹钟/调温分流。当前 Pillow 普通分支计算幅度后仍将候选入队，不能套用另一份 G0 的幅度否决规则。

启动自检比较六轴 self-test 开关前后的均值与 OTP trim，完成后再满足采样启动条件。七种振动模式的 step 表、计时和幅度回调也已保留；这些是控制规则，未验证人体效果和机械强度。

[全部入口、地址、字段及范围](../../evidence/analysis/system-deepening-20261108/local-pillow-closure/FINDINGS_ZH.txt) · [8 项有限模型](../../analysis-tools/system-deepening/local-pillow-closure/MODEL_RESULTS.json) · [原字节核验](../../analysis-tools/system-deepening/local-pillow-closure/BYTE_VALIDATION.json)
