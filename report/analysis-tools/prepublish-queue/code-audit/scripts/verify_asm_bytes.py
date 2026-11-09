#!/usr/bin/env python3
"""Verify static Ghidra instruction exports against the supplied ELF; never execute it."""
import argparse
import hashlib
import json
import re
import struct
from pathlib import Path

EXPECTED_SHA256 = "84727b57ef8b226c78618f9fa9257df7d8ae771c78d8a51e6f3cabf0acc0c375"


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("elf", type=Path)
    ap.add_argument("--exports", type=Path, default=Path(__file__).resolve().parents[1] / "pass1")
    ap.add_argument("--image-base", type=lambda x: int(x, 0), default=0x100000)
    ap.add_argument("--output", type=Path)
    args = ap.parse_args()
    blob = args.elf.read_bytes()
    digest = hashlib.sha256(blob).hexdigest()
    if digest != EXPECTED_SHA256:
        raise SystemExit("Unexpected ELF SHA-256; refusing to verify a different firmware")
    if blob[:6] != b"\x7fELF\x02\x01":
        raise SystemExit("Expected ELF64 little endian")
    phoff = struct.unpack_from("<Q", blob, 32)[0]
    phentsize, phnum = struct.unpack_from("<HH", blob, 54)
    segments = []
    for i in range(phnum):
        ptype, flags, offset, vaddr, paddr, filesz, memsz, align = struct.unpack_from("<IIQQQQQQ", blob, phoff+i*phentsize)
        if ptype == 1:
            segments.append({"offset": offset, "vaddr": vaddr, "filesz": filesz, "memsz": memsz, "flags": flags})
    failures, files = [], []
    checked, checked_bytes = 0, 0
    instruction = re.compile(r"^([0-9a-fA-F]+) ([0-9a-fA-F]+) (.*)$")
    for source in sorted(args.exports.glob("*.asm.txt")):
        file_count = 0
        for line_no, line in enumerate(source.read_text().splitlines(), 1):
            match = instruction.fullmatch(line)
            if not match:
                failures.append({"file": source.name, "line": line_no, "error": "malformed instruction export"})
                continue
            address, hexbytes, text = match.groups()
            data = bytes.fromhex(hexbytes)
            va = int(address, 16) - args.image_base
            matches = [seg for seg in segments if seg["vaddr"] <= va and va+len(data) <= seg["vaddr"]+seg["filesz"]]
            if len(matches) != 1:
                failures.append({"file": source.name, "line": line_no, "address": address, "error": "not exactly one file-backed PT_LOAD"})
                continue
            offset = matches[0]["offset"] + va - matches[0]["vaddr"]
            actual = blob[offset:offset+len(data)]
            if actual != data:
                failures.append({"file": source.name, "line": line_no, "address": address, "offset": offset, "expected": hexbytes, "actual": actual.hex()})
            checked += 1
            checked_bytes += len(data)
            file_count += 1
        files.append({"file": source.name, "sha256": hashlib.sha256(source.read_bytes()).hexdigest(), "instructions_checked": file_count})
    result = {"schema": "eightsleep.prepublish.asm-verification.v1", "input_sha256": digest,
              "input_size": len(blob), "ghidra_image_base": hex(args.image_base),
              "mapping": "ELF virtual address = Ghidra address - image base; file bytes located using ELF PT_LOAD",
              "pt_load_segments": segments, "export_files": len(files), "instructions_checked": checked,
              "instruction_bytes_checked": checked_bytes, "failures": failures,
              "ok": bool(files) and checked > 0 and not failures, "files": files,
              "limits": "Byte equality validates the exported instruction bytes, not every decompiler type, name, or interpretation."}
    output = json.dumps(result, indent=2, ensure_ascii=False) + "\n"
    if args.output:
        args.output.write_text(output)
    else:
        print(output, end="")
    print(json.dumps({key: result[key] for key in ("ok", "export_files", "instructions_checked", "instruction_bytes_checked")}), file=__import__("sys").stderr)
    raise SystemExit(0 if result["ok"] else 1)


if __name__ == "__main__":
    main()
