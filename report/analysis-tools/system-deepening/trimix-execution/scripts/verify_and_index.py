#!/usr/bin/env python3
"""Check exported instructions against V25 payload and its shipped outer package."""
import hashlib
import json
import re
from pathlib import Path

O = Path(__file__).resolve().parent.parent
R = O.parents[2]


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def branch32(address, raw, mnemonic):
    h1, h2 = int.from_bytes(raw[:2], "little"), int.from_bytes(raw[2:], "little")
    assert h1 & 0xF800 == 0xF000
    assert h2 & 0xD000 == (0xD000 if mnemonic == "bl" else 0x9000)
    s = h1 >> 10 & 1
    i1, i2 = 1 ^ ((h2 >> 13 & 1) ^ s), 1 ^ ((h2 >> 11 & 1) ^ s)
    displacement = s << 24 | i1 << 23 | i2 << 22 | (h1 & 1023) << 12 | (h2 & 2047) << 1
    if s:
        displacement -= 1 << 25
    return (address + 4 + displacement) & 0xFFFFFFFF


def main():
    inp = json.loads((O / "INPUTS.json").read_text())
    payload = R / inp["payload_path"]
    package = R / "mediatek/rootfs-selected/opt/eight/firmware/8Sleep_H6_SW-V25-2025-07-24.bin"
    data, outer = payload.read_bytes(), package.read_bytes()
    assert digest(payload) == inp["sha256"] and outer[128:] == data
    base = int(inp["mapping_base"], 16)
    counts = {"instruction_occurrences": 0, "instruction_bytes": 0, "flash_literals": 0, "bl_and_bw_targets": 0}
    seen, files = {}, []
    for path in sorted(O.glob("pass*/*.txt")):
        num = 0
        for line in path.read_text().splitlines():
            m = re.match(r"INSN ([0-9a-f]{8}) ([0-9a-f]+) (.*)", line)
            if not m:
                continue
            address, raw, asm = int(m[1], 16), bytes.fromhex(m[2]), m[3]
            offset = address - base
            assert 0 <= offset <= len(data) - len(raw)
            assert data[offset:offset + len(raw)] == raw, (path.name, hex(address))
            assert outer[offset + 128:offset + 128 + len(raw)] == raw
            if address in seen:
                assert seen[address] == raw
            seen[address] = raw
            num += 1
            counts["instruction_occurrences"] += 1
            counts["instruction_bytes"] += len(raw)
            b = re.match(r"(bl|b\.w) 0x([0-9a-f]{8})\b", asm)
            if b:
                assert branch32(address, raw, b[1]) == int(b[2], 16), (path.name, hex(address), "branch")
                counts["bl_and_bw_targets"] += 1
            for a, v in re.findall(r"REF\[READ:([0-9a-f]{8})=([0-9a-f]+)\]", asm):
                off = int(a, 16) - base
                if 0 <= off <= len(data) - 4:
                    assert int.from_bytes(data[off:off + 4], "little") == int(v, 16)
                    counts["flash_literals"] += 1
        files.append({"path": str(path.relative_to(O)), "instruction_occurrences": num, "sha256": digest(path)})
    table_address = 0x0800B976
    table = data[table_address - base:table_address - base + 6]
    targets = [table_address + 2 * x for x in table]
    assert targets == [0x0800B97C, 0x0800B982, 0x0800B988, 0x0800B98C, 0x0800B990, 0x0800B998]
    result = {"status": "PASS", "kind": "offline_original_byte_checks_not_runtime_measurement",
              "payload": {"path": inp["payload_path"], "size": len(data), "sha256": digest(payload)},
              "original_package": {"path": str(package.relative_to(R)), "size": len(outer), "sha256": digest(package)},
              "mapping": "payload offset=address-0x08008000; original package offset adds128",
              "totals": counts, "unique_instruction_addresses": len(seen),
              "unique_instruction_bytes": sum(map(len, seen.values())),
              "selector_table": {"address": hex(table_address), "bytes_hex": table.hex(), "targets_for_values_1_to_6": [hex(x) for x in targets]},
              "files": files, "limit": "Byte identity and local branch arithmetic do not prove physical motor position or all control paths."}
    (O / "BYTE_VALIDATION.json").write_text(json.dumps(result, ensure_ascii=False, indent=2) + "\n")
    jobs = {"all_processes_ended": True, "method": "Ghidra readOnly/noanalysis; local DecompInterface respectReadOnly=false from pass3; never mutate SRAM flags",
            "processes": [{"pass": p, "exec_session_id": h, "exit_code": 0,
                           "artifact_status": "script_error_before_instructions" if p == 2 else "complete"}
                          for p, h in [(1,39172),(2,84806),(3,34327),(4,96289),(5,16276),(6,81688),(7,96678),(8,21288),(9,27507)]],
            "failed_attempt": "pass2 local exporter edit accidentally commented openProgram; NPE logged, corrected and rerun as pass3. No source binary or DB altered."}
    (O / "JOBS.json").write_text(json.dumps(jobs, ensure_ascii=False, indent=2) + "\n")
    sources = []
    for path in sorted(O.rglob("*")):
        if path.is_file() and path.name != "SOURCE_MANIFEST.json" and "__pycache__" not in path.parts:
            sources.append({"root": "trimix-execution", "path": str(path.relative_to(O)), "size": path.stat().st_size, "sha256": digest(path), "kind": "analysis_artifact_not_original_firmware"})
    previous = [payload, package,
                R / "analysis/finishable-20261107/trimix/FINDINGS_ZH.txt",
                R / "analysis/finishable-20261107/trimix/targeted/0800b64c.txt",
                R / "analysis/finishable-20261107/trimix/targeted/08014a80.txt",
                R / "analysis/finishable-20261107/trimix/targeted/0800fad8.txt",
                R / "analysis/sleep-pipeline/decompiled/Eight.BedFrame/Eight.TriMix/TriMixBedFrame.cs"]
    for path in previous:
        assert path.is_file(), path
        sources.append({"root": "research", "path": str(path.relative_to(R)), "size": path.stat().st_size, "sha256": digest(path),
                        "kind": "shipped_package" if path == package else "prior_analysis_or_extracted_payload"})
    (O / "SOURCE_MANIFEST.json").write_text(json.dumps({"self_hash_excluded": True, "files": sources}, ensure_ascii=False, indent=2) + "\n")
    print(json.dumps({"status": "PASS", **counts, "source_hashes": len(sources)}))


if __name__ == "__main__":
    main()
