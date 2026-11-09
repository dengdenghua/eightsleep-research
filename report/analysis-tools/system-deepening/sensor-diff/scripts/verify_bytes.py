#!/usr/bin/env python3
"""Read-only identity checks against the two original BBIN files; no execution."""
import hashlib
import json
import re
from pathlib import Path

HERE = Path(__file__).resolve().parent.parent
RESEARCH = HERE.parents[2]
TARGETS = {
    "usb": (0x08010000, "firmware-sensor-g0-usb.bbin",
            "1a125674542934f36266f88d9f8ca378a6a5ca696d9e58305d1b0e533f795563"),
    "nonusb": (0x08008000, "firmware-sensor-g0.bbin",
               "51531576fd31af96f7239b71d26e1f175815f5cb21dbe9ab305fa9a33cc6a891"),
}


def thumb_bl(address, raw):
    h1, h2 = int.from_bytes(raw[:2], "little"), int.from_bytes(raw[2:], "little")
    assert h1 & 0xF800 == 0xF000 and h2 & 0xD000 == 0xD000
    s = (h1 >> 10) & 1
    i1, i2 = 1 ^ (((h2 >> 13) & 1) ^ s), 1 ^ (((h2 >> 11) & 1) ^ s)
    value = (s << 24) | (i1 << 23) | (i2 << 22) | ((h1 & 1023) << 12) | ((h2 & 2047) << 1)
    if s:
        value -= 1 << 25
    return (address + 4 + value) & 0xFFFFFFFF


def main():
    totals = {"instruction_occurrences": 0, "instruction_bytes": 0,
              "flash_literal_reads": 0, "bl_targets": 0}
    report = {"kind": "original_BBIN_identity_validation", "executes_firmware": False,
              "mapping": "file_offset = virtual_address - image_base; header remains in image",
              "limit": "Byte identity and BL arithmetic do not prove function recovery or whole-program behavior.",
              "targets": {}, "files": [], "errors": []}
    for variant, (base, name, expected) in TARGETS.items():
        source = RESEARCH / "mediatek/rootfs-selected/opt/eight/lib/subsystem_updates" / name
        data = source.read_bytes()
        digest = hashlib.sha256(data).hexdigest()
        assert digest == expected, (variant, "source identity changed")
        seen = {}
        report["targets"][variant] = {"source": str(source.relative_to(RESEARCH)),
                                         "sha256": digest, "size": len(data), "base": hex(base)}
        for path in sorted(HERE.glob(variant + "-pass*/*.txt")):
            counts = dict.fromkeys(totals, 0)
            for line in path.read_text().splitlines():
                m = re.match(r"INSN ([0-9a-f]{8}) ([0-9a-f]+) (.*)", line)
                if not m:
                    continue
                address, raw, asm = int(m[1], 16), bytes.fromhex(m[2]), m[3]
                offset = address - base
                assert 0 <= offset <= len(data) - len(raw), (path.name, hex(address), "bounds")
                assert data[offset:offset + len(raw)] == raw, (path.name, hex(address), "bytes")
                if address in seen:
                    assert seen[address] == raw
                seen[address] = raw
                counts["instruction_occurrences"] += 1
                counts["instruction_bytes"] += len(raw)
                bl = re.match(r"bl 0x([0-9a-f]{8})\b", asm)
                if bl:
                    assert thumb_bl(address, raw) == int(bl[1], 16), (path.name, hex(address), "BL")
                    counts["bl_targets"] += 1
                for a, value in re.findall(r"REF\[READ:([0-9a-f]{8})=([0-9a-f]+)\]", asm):
                    off = int(a, 16) - base
                    if 0 <= off <= len(data) - 4:
                        assert int.from_bytes(data[off:off + 4], "little") == int(value, 16), (path.name, a, "literal")
                        counts["flash_literal_reads"] += 1
            report["files"].append({"path": str(path.relative_to(HERE)), "sha256": hashlib.sha256(path.read_bytes()).hexdigest(), **counts})
            for key, value in counts.items():
                totals[key] += value
        report["targets"][variant]["unique_instruction_addresses"] = len(seen)
        report["targets"][variant]["unique_instruction_bytes"] = sum(map(len, seen.values()))
    report["totals"] = totals
    report["status"] = "PASS"
    (HERE / "BYTE_VALIDATION.json").write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n")
    print(json.dumps({"status": "PASS", **totals}))


if __name__ == "__main__":
    main()
