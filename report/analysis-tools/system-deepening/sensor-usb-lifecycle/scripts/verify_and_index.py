#!/usr/bin/env python3
"""Offline source identity, instruction bytes, branches, and initialized callback tables."""
import hashlib
import json
import re
from pathlib import Path

O = Path(__file__).resolve().parent.parent
R = O.parents[2]


def sha(p):
    return hashlib.sha256(p.read_bytes()).hexdigest()


def branch32(address, raw, mnemonic):
    h1, h2 = int.from_bytes(raw[:2], "little"), int.from_bytes(raw[2:], "little")
    assert h1 & 0xF800 == 0xF000
    assert h2 & 0xD000 == (0xD000 if mnemonic == "bl" else 0x9000)
    s = h1 >> 10 & 1
    i1, i2 = 1 ^ ((h2 >> 13 & 1) ^ s), 1 ^ ((h2 >> 11 & 1) ^ s)
    d = s << 24 | i1 << 23 | i2 << 22 | (h1 & 1023) << 12 | (h2 & 2047) << 1
    if s:
        d -= 1 << 25
    return (address + 4 + d) & 0xFFFFFFFF


def write(name, x):
    (O / name).write_text(json.dumps(x, ensure_ascii=False, indent=2) + "\n")


def main():
    inp = json.loads((O / "INPUTS.json").read_text())
    source = R / inp["source"]
    data, base = source.read_bytes(), int(inp["mapping_base"], 16)
    assert sha(source) == inp["sha256"]
    counts = {"instruction_occurrences": 0, "instruction_bytes": 0, "flash_literals": 0, "bl_and_bw_targets": 0}
    seen, files = {}, []
    for p in sorted(O.glob("pass*/*.txt")):
        n = 0
        for line in p.read_text().splitlines():
            m = re.match(r"INSN ([0-9a-f]{8}) ([0-9a-f]+) (.*)", line)
            if not m:
                continue
            a, raw, asm = int(m[1], 16), bytes.fromhex(m[2]), m[3]
            off = a - base
            assert 0 <= off <= len(data) - len(raw)
            assert data[off:off + len(raw)] == raw, (p.name, hex(a))
            if a in seen:
                assert seen[a] == raw
            seen[a] = raw
            n += 1
            counts["instruction_occurrences"] += 1
            counts["instruction_bytes"] += len(raw)
            b = re.match(r"(bl|b\.w) 0x([0-9a-f]{8})\b", asm)
            if b:
                assert branch32(a, raw, b[1]) == int(b[2], 16), (p.name, hex(a), "branch")
                counts["bl_and_bw_targets"] += 1
            for aa, v in re.findall(r"REF\[READ:([0-9a-f]{8})=([0-9a-f]+)\]", asm):
                x = int(aa, 16) - base
                if 0 <= x <= len(data) - 4:
                    assert int.from_bytes(data[x:x + 4], "little") == int(v, 16)
                    counts["flash_literals"] += 1
        files.append({"path": str(p.relative_to(O)), "instructions": n, "sha256": sha(p)})
    tables = []
    for ram, n, name in [(0x20000508, 20, "interface_callbacks"), (0x200002A4, 56, "class_callbacks")]:
        flash = 0x08032288 + ram - 0x20000200
        raw = data[flash - base:flash - base + n]
        words = [int.from_bytes(raw[i:i + 4], "little") for i in range(0, n, 4)]
        tables.append({"name": name, "RAM": hex(ram), "initializer_flash": hex(flash),
                       "source_file_offset": flash - base, "raw_hex": raw.hex(), "words": [hex(x) for x in words]})
    assert tables[0]["words"] == ["0x801bc81", "0x8019429", "0x801942d", "0x801bbfd", "0x8019579"]
    assert tables[1]["words"][5] == "0x8017dbd"
    table_base = 0x080184F8
    targets = [table_base + 2 * int.from_bytes(data[table_base - base + 2 * i:table_base - base + 2 * i + 2], "little") for i in range(10)]
    assert targets[9] == 0x0801863C
    write("INITIALIZED_BINDINGS.json", {"kind": "raw_initializer_mapping_not_live_RAM_dump",
                                        "reset_mapping_source": "../sensor-timebase/usb-pass4/08029ad4_08029b12.txt",
                                        "RAM_data_start": "0x20000200", "flash_data_start": "0x08032288",
                                        "tables": tables,
                                        "standard_request_table": {"base": hex(table_base), "kind": "unsigned_halfword_times2_relative_to_aligned_LR", "targets_by_request_0_to_9": [hex(x) for x in targets], "request9_target": "0x0801863c"}})
    write("BYTE_VALIDATION.json", {"status": "PASS", "source": inp, "totals": counts,
                                    "unique_instruction_addresses": len(seen), "unique_instruction_bytes": sum(map(len, seen.values())),
                                    "files": files, "extra_checks": ["five interface callback pointers", "class DataIn pointer", "request9 switch target"],
                                    "limit": "Byte identity validates source alignment, not all function boundaries or physical behavior."})
    handles = [60967,78992,48812,42034,40879,42110,30547,56743,82183]
    jobs = [{"pass": i, "exec_session_id": h, "status": "completed_exit0", "log": f"pass{i}.log"} for i,h in enumerate(handles,1)]
    write("JOBS.json", {"all_processes_ended": True, "method": "Ghidra -readOnly -noanalysis; no target execution", "jobs": jobs})
    commands = ["Read-only analysis reproduction; these commands do not execute firmware.",
                "JAVA_HOME=/opt/homebrew/opt/openjdk@21/libexec/openjdk.jdk/Contents/Home", ""]
    for i in range(1,10):
        log = (O / f"pass{i}.log").read_text()
        script_lines = [s for s in log.splitlines() if "REPORT: Execute script: ExportUsbLifecycle.java " in s]
        assert script_lines and "REPORT SCRIPT ERROR" not in log, i
        args = script_lines[-1].split("ExportUsbLifecycle.java ",1)[1].split(" (HeadlessAnalyzer)",1)[0].strip()
        commands.append(f"{i}. /opt/homebrew/Cellar/ghidra/12.1.4/libexec/support/analyzeHeadless '{R}/analysis/sensor-mcu/ghidra' sensor -process firmware-sensor-g0-usb.bbin -readOnly -noanalysis -scriptPath '{O}/scripts' -postScript ExportUsbLifecycle.java {args}")
    (O / "REPRODUCE.txt").write_text("\n".join(commands) + "\n")
    historical = [
        source, R / "analysis/system-deepening-20261108/sensor-diff/FINDINGS_ZH.txt",
        R / "analysis/system-deepening-20261108/sensor-timebase/FINDINGS_ZH.txt",
        R / "analysis/system-deepening-20261108/sensor-timebase/RAW_INIT_FACTS.json",
        R / "analysis/system-deepening-20261108/sensor-timebase/usb-pass4/08029ad4_08029b12.txt"]
    records = []
    for p in sorted(O.rglob("*")):
        if p.is_file() and p.name != "SOURCE_MANIFEST.json" and "__pycache__" not in p.parts:
            records.append({"root": "sensor-usb-lifecycle", "path": str(p.relative_to(O)), "size": p.stat().st_size, "sha256": sha(p), "kind": "derived_analysis"})
    for p in historical:
        assert p.is_file(), p
        records.append({"root": "research", "path": str(p.relative_to(R)), "size": p.stat().st_size, "sha256": sha(p), "kind": "original_BBIN" if p==source else "prior_evidence_read_only"})
    write("SOURCE_MANIFEST.json", {"self_hash_excluded": True, "files": records})
    print(json.dumps({"status": "PASS", **counts, "manifest_records": len(records)}))


if __name__ == "__main__":
    main()
