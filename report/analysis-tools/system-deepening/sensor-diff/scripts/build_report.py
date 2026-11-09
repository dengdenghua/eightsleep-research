#!/usr/bin/env python3
"""Build the bounded, source-linked offline USB/nonUSB comparison artifacts."""
import hashlib
import json
from pathlib import Path

OUT = Path(__file__).resolve().parent.parent
R = OUT.parents[2]


def src(path, anchors):
    return {"path": path, "anchors": anchors}


rows = []


def row(identifier, category, result, detail, usb, nonusb, limit):
    rows.append({"id": identifier, "category": category, "result": result,
                 "observed_contract_zh": detail, "usb_evidence": [src(*p) for p in usb],
                 "nonusb_evidence": [src(*p) for p in nonusb], "boundary_zh": limit})


row("adc-cache", "采样", "same_local_branch", "启用ADC后，距缓存时钟起点小于8时复制32B旧缓存并成功返回；未启用时成功返回但不写目标。阈值按源代码时钟计数记录。",
    [("usb-pass2/0801d7dc.txt", "0801d7dc; cache +0x64; elapsed +0x90")],
    [("nonusb-pass1/080139e4.txt", "080139e4; cache +0x64; elapsed +0x90")],
    "本轮未校准时钟计数单位；旧报告称8ms不作为本轮新增测量。成功返回不等于新转换。")
row("adc-partial-ready", "采样", "same_local_branch", "DRDY/SPI/帧校验失败或低8位ready mask为0时返回失败；仅更新ready通道。其他通道保留先前值，成功后复制整个32B为后备缓存。",
    [("usb-pass2/0801d7dc.txt", "ready-mask loop, map +0xc4, cache-copy tail")],
    [("nonusb-pass1/080139e4.txt", "ready-mask loop, map +0xc4, cache-copy tail")],
    "通道映射启动K60结论沿用既有证据，本轮不算新发现；实际逐通道年龄无法从该包直接恢复。")
row("imu-partial-ready", "采样", "same_local_branch", "读0x1e状态后以0xa2命令取12B；两个ready位分别控制两组三轴值写入，未ready或失败保留已有值。原始32767被限为32766后写BE16。",
    [("usb-pass2/0801ef68.txt", "0801ef68")], [("nonusb-pass2/08015170.txt", "08015170")],
    "该路径不是FIFO批量读取；不把四颗IMU顺序轮询当同时采样。")
row("imu-poll-loop", "采样", "same_local_branch", "四颗IMU依次轮询；输出地址每次加12B、对象加0xa8。每轮有DSB/DMB，已看范围未见关中断建立完整48B原子快照。",
    [("usb-pass1/0801f0d0.txt", "0801f840..0801f882")], [("nonusb-pass2/080152d8_08017a00.txt", "08015a48..08015a88")],
    "跨轮混合是竞争窗口推断；未测IRQ调度、SPI耗时或真实概率。")
row("queue-layout", "队列", "same_local_contract", "SamplingState=state+0xb08；ADC队列容量30，元素80B；IMU队列容量12，元素48B。读写单调计数之差判满，写/读序号对capacity取模决定槽地址。",
    [("usb-pass1/08027834.txt", "SamplingState clear 0x10f0; ADC 0x1e/0x50; IMU 0xc/0x30"), ("usb-pass2/0801c388.txt", "0801c388"), ("usb-pass2/0801c44c.txt", "0801c44c")],
    [("nonusb-pass1/0801d888.txt", "ADC state+0xb10, IMU state+0x1488; 0x1e/0x50 and 0xc/0x30"), ("nonusb-pass3/080130f0.txt", "080130f0"), ("nonusb-pass3/080131b4.txt", "080131b4")],
    "容量是记录条数；不是prepublish N-1 ring，不与主控NATS队列混用。计数溢出/所有并发交错未做全证明。")
row("queue-overflow", "队列", "same_local_branch", "定时回调先把当前tick与两组requested gain写入ADC记录，再尝试入队；满时拒绝新记录，旧队首保留并增加overflow计数。ADC成功与否均推进phase，每第5次另试IMU入队；IMU满亦增加overflow计数。",
    [("usb-pass1/080233f4.txt", "08023430..080234a2")],
    [("nonusb-pass3/08019648_080197b0.txt", "08019684..080196f6; code ends080196f6, later literal area not interpreted")],
    "nonUSB回调未建函数，结论来自指令范围与start callback指针08019649，非伪造反编译。")
row("pairing", "组包", "same_local_contract", "multi模式要求ADC>=5且IMU非空。连续pop 5条ADC，再pop最旧1条IMU，按FIFO配对；不比较ADC tick与IMU时间。",
    [("usb-pass1/0801f0d0.txt", "0801f900..0801f9aa")],
    [("nonusb-pass2/080152d8_08017a00.txt", "08015b08..08015bb2")],
    "相同payload不能单独证明旧值重放；错位示例是合成调度，不是实机记录。单ADC旧格式分支不在本轮包合同内。")
row("wire-fields", "组包", "same_local_contract", "0x3c body共377B：opcode1B+首条ADC tick BE32+当前全局flags BE16+常量500 BE16+5×16×BE32 ADC+48B IMU。序列化仅取ADC record+0xc..+0x48，丢弃两组requested gain和后四条tick；IMU队列项不带tick。",
    [("usb-pass1/0801f0d0.txt", "0801f92e..0801f9aa; global state+0x194c"), ("usb-pass1/080266dc.txt", "080266dc")],
    [("nonusb-pass2/080152d8_08017a00.txt", "08015b36..08015bb2; global state+0x194c"), ("nonusb-pass2/0801c730.txt", "0801c730")],
    "500是包字段与installer传参的常量，不借它测量实际采样率；flags不是每条记录自己的时间快照。")
row("flush", "控制", "same_local_branch", "flush分别pop清空ADC和IMU队列，返回两队列合计条数；helper不重置phase。dirty gain处理块无论写回是否成功，走公共flush→resync尾部；写失败保留dirty，可再次清队列。",
    [("usb-pass1/08026722.txt", "08026722"), ("usb-pass1/0801f0d0.txt", "dirty gain block ending0801f296/0801f2ac")],
    [("nonusb-pass2/0801c776.txt", "0801c776"), ("nonusb-pass2/080152d8_08017a00.txt", "08015442..080154b4")],
    "不能表述为任意命令都会清队列；限定changed gain>99触发dirty且进入处理块。")
row("gain-command-body", "控制", "matching_local_body_dispatch_incomplete", "两版四字节增益处理体按两组BE16解析，0沿用现值；setter仅对>99且改变的增益更新8通道请求并标dirty。本轮恢复nonUSB遗漏的1747e..174da处理体和174ae调用。",
    [("usb-pass1/0801f0d0.txt", "080213c6..08021410"), ("usb-pass2/08026758.txt", "08026758")],
    [("nonusb-pass10/0801747e_080174da.txt", "0801747e..080174da"), ("nonusb-pass2/0801c7ac.txt", "0801c7ac")],
    "USB既有证据把该处理体标0x2b；nonUSB dispatch表本轮未完整重建，不能仅凭相似body声称同opcode已独立证明。")
row("start", "控制", "same_local_branch", "start先flush，再phase=0、active=1、resync，随后安装timer callback并传常量500。USB回调080233f5；nonUSB回调08019649（Thumb低位1）。",
    [("usb-pass1/080268c8.txt", "080268c8")], [("nonusb-pass2/0801c91c.txt", "0801c91c..0801c950")],
    "本轮没有调用实际start，不把installer参数直接当实机频率。")
row("resync", "控制", "same_local_branch", "resync调用同步callback，设2和300000的计时器，读取两ADC到临时缓存直到停止成功返回，最后重启ADC缓存计时；周期resync调用点未先flush，也不重置phase。",
    [("usb-pass1/08026810.txt", "08026810"), ("usb-pass1/0801f0d0.txt", "0801f2c4")],
    [("nonusb-pass1/0801c864.txt", "0801c864"), ("nonusb-pass2/080152d8_08017a00.txt", "080154b8..080154cc")],
    "不推断物理同步成功；实际ADC与IRQ相位关系需实时材料。")
row("framing", "发送", "same_local_contract", "两版都有32个buffer槽，stride0x401（1B状态+1024B数据），初始状态1。输出0x7e起始符，长度字段1/2/4B，body与16位校验字段；0x7e/0x7d转义为7d5e/7d5d。377B batch即使按4B长度且全部转义也≤767B，不触发1024B分段边界。",
    [("usb-pass1/08027834.txt", "0802792e..08027972 and framer init"), ("usb-pass4/0801c764.txt", "0801c764"), ("usb-pass5/080292a0.txt", "080292a0")],
    [("nonusb-pass1/0801d888.txt", "0801d982..0801d9c8 and framer init"), ("nonusb-pass4/0801f2d4.txt", "0801f2d4"), ("nonusb-pass5/080186cc.txt", "080186cc")],
    "不在本轮命名校验多项式；buffer可用状态不是主控/云端ACK。更大消息跨buffer行为未覆盖。")
row("send-buffer-wait", "发送", "different", "USB每轮先算elapsed，>=500即清当前buffer/status指针，encode helper遇null不写，flush不提交并返回失败；nonUSB对应32槽扫描没有这条elapsed截止，全部不可用时回到扫描起点。",
    [("usb-pass4/0801c764.txt", "0801c764..0801c889"), ("usb-pass5/080292a0.txt", "null guard"), ("usb-pass5/08029254.txt", "null pointer resets pending count"), ("usb-pass5/0801c57e.txt", "elapsed"), ("usb-pass6/080119ec.txt", "RAM tick2000121c")],
    [("nonusb-pass4/0801f2d4.txt", "0801f2d4..0801f3b1"), ("nonusb-pass6/08013658.txt", "elapsed statistics"), ("nonusb-pass7/080099ec.txt", "RAM tick20001144")],
    "500单位未追时基，不能写500ms。nonUSB只证明该函数无此截止，不证明整机永远不复位、无看门狗或永远卡死。")
row("send-status-gate", "发送", "different", "USB adapter另有gate：flag2000abfc!=0且predicate194a4为false时拒绝本次提交，status置2（若非null），错误计数++并置失败flag。predicate要求20001648非0且2000abbc==3。nonUSB对应adapter没有这段gate。",
    [("usb-pass6/0801d6fc.txt", "0801d6fc"), ("usb-pass7/080194a4.txt", "080194a4")],
    [("nonusb-pass7/0801321c.txt", "0801321c")],
    "gate物理状态名与运行触发条件未完全绑定；不能仅凭文件名标为拔USB/离线。")
row("adapter-queue", "发送", "mostly_same_with_extra_USB_gate", "adapter在无pending且底层busy()==0、start返回非0时直接挂在途；否则向容量64、每项12B的descriptor queue入队（ptr,len,statusptr）。成功接收把status置0，队列满则增加错误计数并置wrapper失败flag。",
    [("usb-pass1/08027834.txt", "descriptor queue cap0x40 elem0xc"), ("usb-pass6/0801d6fc.txt", "0801d6fc"), ("usb-pass7/0801d6c8.txt", "0801d6c8")],
    [("nonusb-pass1/0801d888.txt", "descriptor queue cap0x40 elem0xc"), ("nonusb-pass7/0801321c.txt", "0801321c"), ("nonusb-pass7/080131e6.txt", "080131e6")],
    "64 descriptor容量不等于可容纳64个独立采样batch：buffer池仅32槽且共享其他消息；底层callback绑定/完成IRQ尚未完整对照。")
row("batch-send-return", "发送", "same_callsite_limitation", "batch先pop五ADC和一IMU，再调用发送wrapper；调用后直接继续主循环，没有检查成功返回、重试或重新入采样队列。USB wrapper只累计失败并void返回，nonUSB wrapper返回失败位反值，但该batch调用点未使用。",
    [("usb-pass1/0801f0d0.txt", "0801f9aa→0801f374→0801f378"), ("usb-pass3/0801c8c8.txt", "0801c8c8")],
    [("nonusb-pass2/080152d8_08017a00.txt", "08015bb2→0801557c→08015580"), ("nonusb-pass3/080122d0.txt", "080122d0")],
    "仅本地提交失败分支可证明batch不可由此调用点恢复；正常返回也不能证明硬件/主控/云端已经接收。")


def write_json(name, content):
    (OUT / name).write_text(json.dumps(content, ensure_ascii=False, indent=2) + "\n")


def main():
    write_json("DIFF_TABLE.json", {"scope": "Two shipped G0 BBINs; bounded local functional comparison", "version_label": "5.5.34.0 (existing package metadata)", "claim": "not_whole_program_equivalence", "rows": rows})
    coverage = {
        "completed": ["ADC cache/ready branches", "4-IMU update loop", "timer snapshot and independent overflow", "sampling ring layout and push/pop", "multi 0x3c FIFO batching and serialization", "gain dirty→flush/resync", "start/reset phase", "framing pool", "USB bounded vs nonUSB unbounded buffer scan", "submission adapter and ignored batch send result"],
        "remaining": [
            {"id": "clock-units", "question": "elapsed 500与cache 8的真实时钟单位", "next": "追tick RAM写入者、定时器/SysTick初始化和分频；验证中断被屏蔽时是否推进。", "needs_device": False},
            {"id": "nonusb-command-dispatch", "question": "nonUSB增益/开始处理体对应的opcode", "next": "恢复缺失的Thumb switch表与分支地址，验证1747e/1721c可达边；本轮只确认局部处理体。", "needs_device": False},
            {"id": "hardware-completion", "question": "两版callback +0x30/+0x34和完成IRQ如何释放32槽", "next": "从各硬件配置表绑定busy/start及完成callback，追descriptor完成、status回收与USB gate设置者，不猜物理连接名。", "needs_device": False},
            {"id": "actual-timing", "question": "混合快照、配对错位或发送失败在实机何时发生", "next": "获得被动串口/USB抓包或合法设备研究数据后，以tick、包长度、样本内容与诊断计数对照；不以恒值当重放证据。", "needs_device": True},
            {"id": "larger-frames", "question": "大于1024转义输出后的分段buffer所有权", "next": "独立审计非0x3c大消息的flush和buffer复用，不把377B合同外推。", "needs_device": False},
            {"id": "global-proof", "question": "全程序等价/所有硬件SKU/全部命令", "next": "不在该有限交付声明内；需独立覆盖计划。", "needs_device": False}
        ],
        "analysis_gaps": [
            "nonUSB persisted function080152d8错误地只覆盖到080152fd，C反编译报jumptable错误；用现有listing的明确指令段代替，未修改DB。",
            "nonUSB callback08019648无函数定义；用start的08019649 Thumb指针、明确指令范围和原文件字节支持。",
            "nonUSB gain体在持久listing未解码：PseudoDisassembler只临时解码1747e..174da，TMode在内存上下文设1，无程序数据库写入。",
            "nonusb-pass8脚本context未启动失败；pass9第二范围误穿switch数据后停止，保留日志作诊断，不用pass9 17200范围支撑语义。pass10取gain体完整范围，start仅使用1721c..17228；其1721a为表尾数据不作指令语义。",
            "REA MCP工具未加载；按skill要求发现缺失后复用已安装Ghidra12.1.4，未联网安装，不伪造REA Evidence标识。"
        ],
        "exclusions": ["执行BBIN或设备固件", "账号/API/联网/浏览器", "改写持久Ghidra程序", "重算K60启动map作为新增", "实机部署与实际丢包率", "整程序等价", "P网页与F冻结包修改"],
        "checks": {"bytes": "BYTE_VALIDATION.json", "synthetic": "CONTRACT_CHECKS.json"}
    }
    write_json("COVERAGE.json", coverage)
    jobs = {"method": "readOnly/noanalysis Ghidra; tools execute analysis only, never target code", "no_active_process": True,
            "jobs": [{"name": name, "exec_session_id": sid, "process_exit": 0, "artifact_status": status} for name, sid, status in [
                ("usb-pass1",97851,"complete"),("nonusb-pass1",81441,"complete"),("nonusb-pass2",75527,"complete"),
                ("usb-pass2",75476,"complete"),("nonusb-pass3",38083,"complete"),("usb-pass3",42195,"complete"),
                ("nonusb-pass4",69919,"complete"),("usb-pass4",18556,"complete"),("nonusb-pass5",69313,"complete"),
                ("usb-pass5",51147,"complete"),("nonusb-pass6",85455,"complete"),("usb-pass6",83173,"complete"),
                ("nonusb-pass7",61912,"complete"),("usb-pass7",89208,"complete"),
                ("nonusb-pass8",76882,"script_error_context_not_started_no_output"),
                ("nonusb-pass9",89517,"gain_range_complete_second_range_failed_partial_diagnostic"),
                ("nonusb-pass10",67330,"complete_with_start_range_first_halfword_table_data_excluded")]],
            "lesson": "Headless process exit0 is not enough: inspect script errors and output coverage. Failed logs are retained, not silently relabeled successful."}
    write_json("JOBS.json", jobs)
    historical = [
        "analysis/sensor-mcu/SAMPLE_FRESHNESS_ZH.txt", "analysis/sensor-mcu/FRONTEND_DSP_ZH.txt",
        "analysis/sensor-mcu/frontend/FLAGS_ADDENDUM.txt", "analysis/sensor-mcu/freshness/freshness_model.py",
        "analysis/account-readonly/k60-binding/nonusb-flow/FINDINGS_ZH.txt",
        "analysis/account-readonly/k60-binding/nonusb-flow/config-chain/FINDINGS_ZH.txt",
        "analysis/account-readonly/k60-binding/nonusb-flow/adc-sample/080139e4.txt",
        "analysis/account-readonly/k60-binding/nonusb-flow/copy-final/0801d888.txt"
    ]
    files = []
    for path in sorted(OUT.rglob("*")):
        if not path.is_file() or path.name == "SOURCE_MANIFEST.json" or "__pycache__" in path.parts:
            continue
        files.append({"root": "sensor-diff", "path": str(path.relative_to(OUT)), "size": path.stat().st_size,
                      "sha256": hashlib.sha256(path.read_bytes()).hexdigest(),
                      "kind": "local_analysis_artifact_not_original_firmware"})
    for rel in historical:
        path = R / rel
        assert path.is_file(), rel
        files.append({"root": "research", "path": rel, "size": path.stat().st_size,
                      "sha256": hashlib.sha256(path.read_bytes()).hexdigest(), "kind": "prior_analysis_read_only"})
    for target in json.loads((OUT / "BYTE_VALIDATION.json").read_text())["targets"].values():
        files.append({"root": "research", "path": target["source"], "size": target["size"],
                      "sha256": target["sha256"], "kind": "original_shipped_BBIN", "mapping_base": target["base"]})
    write_json("SOURCE_MANIFEST.json", {"self_hash_excluded": True, "files": files,
                                        "integrity_limit": "Hash identity tracks retained evidence; analysis artifacts are not original binaries."})
    print("Built", len(rows), "comparison rows;", len(files), "hashed sources/artifacts")


if __name__ == "__main__":
    main()
