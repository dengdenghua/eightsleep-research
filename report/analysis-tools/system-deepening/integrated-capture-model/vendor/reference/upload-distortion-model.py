#!/usr/bin/env python3
"""Bounded symbolic calculations from recovered code, NEVER firmware execution.

No account, network, native code, clinical waveform or device is used. Ordinals
are model provenance labels which the actual 0x3c protocol does not transmit.
"""
from __future__ import annotations
from collections import Counter, deque
from dataclasses import dataclass
import csv
import hashlib
import importlib.util
import json
from pathlib import Path
import statistics
import sys

OUT = Path(__file__).resolve().parent
ANALYSIS = OUT.parents[1]
EPOCH = 1700000000


def load_module(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


dual = load_module("retained_dual_model", ANALYSIS / "signal-host/dual-side/continuity_cases.py")
parser = load_module("retained_wire_parser", ANALYSIS / "signal-host/host_signal_parser.py")


def cache_case(name, update_masks, initial=None):
    # Track five active components; routing permutations preserve these counts.
    last = initial[:] if initial is not None else [0] * 5
    ages, stale_rows, helper_success = [], 0, 0
    for callback, mask in enumerate(update_masks, 1):
        helper_success += bool(mask)
        for ch in range(5):
            if mask & (1 << ch):
                last[ch] = callback
        row = [callback - generation for generation in last]
        ages.extend(row)
        stale_rows += any(age > 0 for age in row)
    return {"case": name, "callbacks": len(update_masks), "channel_values": len(ages),
            "helper_successes": helper_success, "stale_channel_values": sum(a > 0 for a in ages),
            "stale_channel_fraction": sum(a > 0 for a in ages) / len(ages),
            "snapshots_with_any_retained_value": stale_rows,
            "max_age_callback_intervals": max(ages), "mean_age_callback_intervals": statistics.mean(ages)}


def freshness():
    cases = [cache_case("all_five_updated_before_every_snapshot", [31] * 500),
             cache_case("ten_failed_reads_callbacks_100_to_109", [0 if 100 <= n <= 109 else 31 for n in range(1, 501)]),
             cache_case("one_ready_channel_per_callback_round_robin", [1 << ((n-1) % 5) for n in range(1, 501)], [-4, -3, -2, -1, 0]),
             cache_case("injected_three_replay_callbacks_100_to_102", [0 if 100 <= n <= 102 else 31 for n in range(1, 501)])]
    # The replay row intentionally specifies the replay count. It does not derive
    # three callbacks from the <8ms cache window or infer real conversion cadence.
    cases[-1]["helper_successes"] = 500
    cases[-1]["note"] = "Injected backup replay leaves cache unchanged but returns success; replay count is assumed."
    assert cases[1]["stale_channel_values"] == 50 and cases[1]["max_age_callback_intervals"] == 10
    assert cases[2]["stale_channel_fraction"] == .8 and cases[2]["helper_successes"] == 500
    return cases


class Queues:
    def __init__(self):
        self.adc, self.imu = deque(), deque()
        self.drops = Counter()

    def tick(self, n):
        if len(self.adc) < 30:
            self.adc.append(n)
        else:
            self.drops["adc"] += 1
        if n % 5 == 0:
            if len(self.imu) < 12:
                self.imu.append(n)
            else:
                self.drops["imu"] += 1

    def drain(self):
        packets = []
        while len(self.adc) >= 5 and self.imu:
            adc = [self.adc.popleft() for _ in range(5)]
            imu = self.imu.popleft()
            packets.append({"adc": adc, "imu": imu, "skew": imu - adc[-1]})
        return packets


def queue_case(stall):
    q = Queues()
    for n in range(1, stall+1):
        q.tick(n)
    initial = q.drain()
    resumed = []
    # Consumer is immediately available after every further callback. No flush,
    # restart, another overflow or rate drift is introduced during these 200 ticks.
    for n in range(stall+1, stall+201):
        q.tick(n)
        resumed.extend(q.drain())
    histogram = dict(sorted(Counter(p["skew"] for p in resumed).items()))
    return {"initial_stall_callbacks": stall, "initial_drained_packets": len(initial),
            "adc_drops": q.drops["adc"], "imu_drops": q.drops["imu"],
            "resumed_callbacks": 200, "resumed_packets": len(resumed),
            "resumed_skew_histogram_callback_intervals": histogram,
            "last_ten_packet_skews": [p["skew"] for p in resumed[-10:]],
            "last_packet": resumed[-1], "remaining_adc": len(q.adc), "remaining_imu": len(q.imu),
            "within_packet_adc_ordinals_contiguous": all(p["adc"] == list(range(p["adc"][0], p["adc"][0]+5)) for p in initial+resumed)}


def queues():
    rows = [queue_case(s) for s in (0, 30, 31, 35, 59, 60, 61, 65, 90, 120)]
    at60 = next(r for r in rows if r["initial_stall_callbacks"] == 60)
    assert at60["adc_drops"] == 30 and at60["imu_drops"] == 0
    assert at60["resumed_skew_histogram_callback_intervals"] == {-30: 40}
    return rows


@dataclass(frozen=True)
class Sample:
    epoch: int = 0
    relative: int = 0
    origin: int | None = None
    copied: bool = False


def host_map(holes, stop=1000):
    # Stable reference marker at tick 10000, ordinal 0; no drift/reanchor/wrap.
    # Existing bucket capacity/watermark gates allow the rows considered here.
    # Explicitly models the caller's epoch update BEFORE its copy branch.
    buckets, copies, overwrites = {}, [], []
    previous_tick = None
    for ordinal in range(stop):
        if ordinal in holes:
            continue
        tick = 10000 + ordinal * 2
        epoch = EPOCH + ordinal // 500
        relative = ordinal * 2
        inserted = []
        if previous_tick not in (None, 0) and tick - previous_tick == 4:
            copy = Sample(epoch, relative-2, ordinal, True)
            inserted.append(copy)
            copies.append({"source_ordinal": ordinal,
                           "actual_key": [epoch-EPOCH, ((relative-2) % 1000)//2],
                           "intended_missing_key": [(ordinal-1)//500, (ordinal-1) % 500]})
        inserted.append(Sample(epoch, relative, ordinal))
        for s in inserted:
            bucket = buckets.setdefault(s.epoch, [Sample() for _ in range(500)])
            slot = (s.relative % 1000)//2
            if bucket[slot].origin is not None:
                overwrites.append({"epoch_offset": s.epoch-EPOCH, "slot": slot,
                                   "previous_copy": bucket[slot].copied, "replacement_copy": s.copied})
            bucket[slot] = s
        previous_tick = tick
    return buckets, copies, overwrites


def buzzer_load(left, right, primary):
    # One representative scalar per side. This counts buzzer writes only;
    # does not extrapolate its tail loss to all IMU/compatibility branches.
    records = [left, right]
    epoch, guard, count, stop = 0, -1, 0, None
    output = {}
    for i in range(500):
        p = records[primary][i]
        if not ((guard == 0 and epoch == p.epoch) or epoch == 0):
            stop = i
            break
        if epoch == 0:
            epoch, guard = p.epoch, 0
        count += 1
        output[(p.relative % 1000)//2] = (left[i], right[i])
    # Reuse the previous independently reviewed whole-loader model as a narrow
    # regression oracle. It is also a model, NOT independent native execution.
    def cvt(rows, side):
        return [dual.Sample(s.epoch, s.relative, None if s.origin is None else f"{side}:{s.origin}") for s in rows]
    prior = dual.paired_load(cvt(left,"L"), cvt(right,"R"), primary)
    b = prior["buffers"]["buzzer"]
    assert b["accepted_count"] == count and b["unique_written_indices"] == len(output)
    assert prior["stopped_at"] == stop
    rows = []
    for side in (0, 1):
        inputs = {s.origin for s in records[side] if s.origin is not None and not s.copied}
        outputs = [pair[side] for pair in output.values() if pair[side].origin is not None]
        genuine_survivors = {s.origin for s in outputs if not s.copied}
        correct_time = sum(s.origin % 500 == slot and not s.copied
                           for slot,pair in output.items() if (s := pair[side]).origin is not None)
        rows.append({"side": side, "genuine_inputs_in_bucket": len(inputs),
                     "genuine_input_origins_surviving": len(inputs & genuine_survivors),
                     "genuine_input_origins_not_in_output": len(inputs - genuine_survivors),
                     "written_non_sentinel_values": len(outputs),
                     "synthetic_values_surviving": sum(s.copied for s in outputs),
                     "genuine_values_at_original_slot": correct_time,
                     "unwritten_or_sentinel_positions": 500 - len(outputs)})
    return {"primary": primary, "buzzer_writes": count, "unique_output_slots": len(output),
            "stopped_at": stop, "epoch_offset": epoch-EPOCH if epoch else None,
            "erased_both_buckets": True, "same_second_late_input_rejected_by_watermark": True,
            "sides": rows}


def host_cases():
    rows = []
    cases = [
        ("complete_baseline", set(), 0),
        ("one_missing_slot100_left_primary", {100}, 0),
        ("two_missing_slots100_101_left_primary", {100,101}, 0),
        ("lost_five_sample_packet100_104_left_primary", set(range(100,105)), 0),
        ("same_five_missing_left_secondary", set(range(100,105)), 1),
        ("one_missing_slot1_left_primary", {1}, 0),
        ("two_missing_slots1_2_left_primary", {1,2}, 0),
        ("leading_five_missing_left_primary", set(range(5)), 0),
        ("leading_five_missing_left_secondary", set(range(5)), 1),
    ]
    full, _, _ = host_map(set())
    for name, missing, primary in cases:
        left, copies, overwritten = host_map(missing)
        out = buzzer_load(left[EPOCH], full[EPOCH], primary)
        rows.append({"case": name, "injected_missing_left_ordinals": sorted(missing),
                     "assumed_bucket_counts_left_right": [3, 4 if primary else 3],
                     "host_copy_events": copies, "overwrites": overwritten, **out})
    one = next(r for r in rows if r["case"] == "one_missing_slot100_left_primary")
    five = next(r for r in rows if r["case"] == "lost_five_sample_packet100_104_left_primary")
    secondary = next(r for r in rows if r["case"] == "same_five_missing_left_secondary")
    assert one["sides"][0]["synthetic_values_surviving"] == 1 and one["buzzer_writes"] == 500
    assert five["buzzer_writes"] == 100 and five["sides"][0]["genuine_input_origins_not_in_output"] == 395
    assert secondary["buzzer_writes"] == 500 and secondary["sides"][0]["genuine_input_origins_not_in_output"] == 0
    cross = []
    for missing in ({499}, {499,999}):
        mapped, copies, overwritten = host_map(missing)
        out = buzzer_load(mapped[EPOCH+1], full[EPOCH+1], 0)
        cross.append({"case": "cross_second_copy" + ("_real_destination_missing" if 999 in missing else "_real_destination_arrives"),
                      "injected_missing_left_ordinals": sorted(missing), "copy_events": copies,
                      "overwrites": overwritten, "next_second_output": out,
                      "previous_second_missing_slot499_remains_unfilled": mapped[EPOCH][499].origin is None})
    assert cross[0]["next_second_output"]["sides"][0]["synthetic_values_surviving"] == 0
    assert cross[1]["next_second_output"]["sides"][0]["synthetic_values_surviving"] == 1
    return rows, cross


def wire_repetition():
    # Demonstrate parser boundary with a canonical five-frame 0x3c synthetic payload.
    import struct
    payload = struct.pack(">IHH", 10000, 0xf200, 500)
    payload += b"".join(struct.pack(">16i", *([n]*16)) for n in range(1,6))
    payload += struct.pack(">24h", *range(24))
    result = parser.parse_usb(payload)
    assert result["adc_frame_count"] == 5 and len(result["imu_groups_wire_order"]) == 4
    assert [s["device_tick_ms"] for s in result["samples"]] == [10000,10002,10004,10006,10008]
    return {"payload_bytes": len(payload), "adc_frames": 5, "imu_blocks_on_wire": 1,
            "host_internal_attachments_of_that_imu_block": 5,
            "loader_imu_selection": "one per five array indices, no five-point mean",
            "warning": "Repeated attachments are not five independent IMU measurements."}


def evidence():
    paths = [
        "sensor-mcu/freshness/freshness_model.py", "sensor-mcu/freshness/freshness_pseudocode.c",
        "sensor-mcu/SAMPLE_FRESHNESS_ZH.txt", "sensor-mcu/freshness/FRESHNESS_EVIDENCE.json",
        "signal-host/TIMING_CONTINUITY_ZH.txt", "signal-host/DUAL_SIDE_CONTINUITY_ZH.txt",
        "signal-host/dual-side/continuity_cases.py", "signal-host/host_signal_parser.py",
        "signal-host/timing/0021a5c0.asm.txt", "signal-host/timing/caller/0027e7b0.asm.txt",
        "signal-host/timing/001fdec0.asm.txt", "signal-host/timing/001ffa70.asm.txt",
        "signal-host/timing/001fee40.asm.txt"]
    return [{"relative_to_analysis": f, "sha256": hashlib.sha256((ANALYSIS/f).read_bytes()).hexdigest()} for f in paths]


def main():
    targets = [("mediatek/rootfs-selected/opt/eight/bin/frankenfirmware", "84727b57ef8b226c78618f9fa9257df7d8ae771c78d8a51e6f3cabf0acc0c375"),
               ("mediatek/rootfs-selected/opt/eight/lib/subsystem_updates/firmware-sensor-g0-usb.bbin", "1a125674542934f36266f88d9f8ca378a6a5ca696d9e58305d1b0e533f795563")]
    verified_targets = []
    for path, expected in targets:
        data = (ANALYSIS.parent/path).read_bytes()
        actual = hashlib.sha256(data).hexdigest()
        assert actual == expected
        verified_targets.append({"relative_to_research_root": path, "bytes":len(data), "sha256":actual})
    hosts, cross = host_cases()
    result = {"kind": "bounded symbolic model; not firmware, device or cloud execution",
              "firmware_scope": {"MCU": "USB 5.5.34.0 SHA256 1a125674542934f36266f88d9f8ca378a6a5ca696d9e58305d1b0e533f795563",
                                 "host": "84727b57ef8b226c78618f9fa9257df7d8ae771c78d8a51e6f3cabf0acc0c375"},
              "real_device_current_deployment_matched": False,
              "assumptions": ["all numeric results are conditional on named injected input sequences",
                              "callback intervals are ordinal time; 500Hz conversion to ms is conditional",
                              "host reference stable; bucket gates accept inputs before chosen flush",
                              "two paired second buckets and fresh destination buffers; one ADC scalar per side",
                              "caller flush gate is both sides >=3 buckets OR either side >=10; these [3,3]/[3,4] cases use only the both-sides >=3 branch, with additional future buckets outside the modeled second",
                              "queue cases start with empty ADC/IMU queues and mod5=0, matching the explicit start path at MCU 080268C8",
                              "primary0 corresponds to equal bucket counts; primary1 to right having more buckets",
                              "no automatic cloud compensation or physiology/clinical effect is modeled"],
              "cache_cases": freshness(), "queue_stall_cases": queues(),
              "host_pipeline_cases": hosts, "cross_second_cases": cross,
              "synthetic_wire_check": wire_repetition(), "verified_target_hashes":verified_targets, "source_files": evidence()}
    (OUT/"RESULTS.json").write_text(json.dumps(result, ensure_ascii=False, indent=2)+"\n")
    with (OUT/"HOST_CASES.csv").open("w", newline="") as f:
        writer = csv.writer(f)
        writer.writerow(["case","primary","side","buzzer_writes","genuine_inputs","genuine_input_lost","synthetic_surviving","missing_output_positions"])
        for r in hosts:
            for side in r["sides"]:
                writer.writerow([r["case"],r["primary"],side["side"],r["buzzer_writes"],side["genuine_inputs_in_bucket"],
                                 side["genuine_input_origins_not_in_output"],side["synthetic_values_surviving"],side["unwritten_or_sentinel_positions"]])
    print(json.dumps({"cache_cases":len(result["cache_cases"]),"queue_cases":len(result["queue_stall_cases"]),
                      "host_cases":len(hosts),"cross_second_cases":len(cross),"result":str(OUT/"RESULTS.json")}))


if __name__ == "__main__":
    main()
