#!/usr/bin/env python3
"""Synthetic checks of the recovered local contract, NOT an MCU emulator."""
from collections import deque
import json
from pathlib import Path

OUT = Path(__file__).resolve().parent.parent


class SamplingQueues:
    def __init__(self):
        self.adc, self.imu = deque(), deque()
        self.phase = self.rejected_adc = self.rejected_imu = 0

    def tick(self, synthetic_id):
        if len(self.adc) == 30:
            self.rejected_adc += 1
        else:
            self.adc.append(synthetic_id)
        self.phase += 1  # advances even when ADC rejected
        if self.phase == 5:
            self.phase = 0
            if len(self.imu) == 12:
                self.rejected_imu += 1
            else:
                self.imu.append(synthetic_id)

    def batch(self):
        if len(self.adc) < 5 or not self.imu:
            return None
        return {"adc_synthetic_ids": [self.adc.popleft() for _ in range(5)],
                "imu_synthetic_id": self.imu.popleft()}

    def flush(self):
        count = len(self.adc) + len(self.imu)
        self.adc.clear()
        self.imu.clear()
        return count  # deliberately no phase reset in the flush helper


def select_buffer(variant, observations):
    """Finite observations of source loop; nonUSB exhaustion means still waiting."""
    for elapsed_clock_units, available in observations:
        if variant == "usb" and elapsed_clock_units >= 500:
            return "timeout_local_failure"
        if available:
            return "buffer_selected_not_delivery_ack"
    return "still_waiting_at_observation_bound"


def main():
    results = []
    q = SamplingQueues()
    for step in range(1, 36):
        q.tick(step)
    assert (len(q.adc), len(q.imu), q.rejected_adc, q.phase) == (30, 7, 5, 0)
    first = [q.batch() for _ in range(6)]
    assert first[-1] == {"adc_synthetic_ids": [26, 27, 28, 29, 30], "imu_synthetic_id": 30}
    for step in range(36, 41):
        q.tick(step)
    later = q.batch()
    assert later == {"adc_synthetic_ids": [36, 37, 38, 39, 40], "imu_synthetic_id": 35}
    results.append({"case": "ADC_full_phase_continues_FIFO_pairing", "status": "PASS",
                    "initial_batches": first, "next_batch": later,
                    "adc_rejections": q.rejected_adc,
                    "meaning": "Constructed schedule shows possible pairing skew; IDs are synthetic, not wire fields or actual time."})
    q = SamplingQueues()
    for step in range(1, 66):
        q.tick(step)
    assert (len(q.adc), len(q.imu), q.rejected_adc, q.rejected_imu) == (30, 12, 35, 1)
    results.append({"case": "both_queues_full_reject_new", "status": "PASS",
                    "adc_rejections": q.rejected_adc, "imu_rejections": q.rejected_imu,
                    "first_adc_retained": q.adc[0], "last_adc_retained": q.adc[-1]})
    q = SamplingQueues()
    for step in range(1, 8):
        q.tick(step)
    n = q.flush()
    assert n == 8 and q.phase == 2 and not q.adc and not q.imu
    results.append({"case": "flush_does_not_reset_phase", "status": "PASS", "removed": n, "phase_after_flush": q.phase})
    for variant in ("usb", "nonusb"):
        q = SamplingQueues()
        for step in range(1, 6):
            q.tick(step)
        packet = q.batch()
        outcome = select_buffer(variant, [(0, False), (499, False), (500, False), (1000, False)])
        assert not q.adc and not q.imu
        expected = "timeout_local_failure" if variant == "usb" else "still_waiting_at_observation_bound"
        assert outcome == expected
        results.append({"case": variant + "_batch_popped_before_buffer_wait", "status": "PASS",
                        "already_removed_packet": packet, "observed_outcome": outcome,
                        "queue_counts": [0, 0], "host_delivery": "not_observed"})
    assert select_buffer("usb", [(499, True)]) == "buffer_selected_not_delivery_ack"
    assert select_buffer("usb", [(500, True)]) == "timeout_local_failure"
    assert select_buffer("nonusb", [(500, True)]) == "buffer_selected_not_delivery_ack"
    results.append({"case": "500_boundary_is_checked_before_USB_slot_scan", "status": "PASS"})
    result = {"artifact_type": "synthetic_contract_checks", "status": "PASS", "cases": results,
              "source_contracts": ["DIFF_TABLE.json#queue-overflow", "DIFF_TABLE.json#pairing", "DIFF_TABLE.json#flush", "DIFF_TABLE.json#send-buffer-wait"],
              "not_covered": ["firmware execution", "interrupt timing and priority", "clock calibration", "allocation faults", "hardware transfer completion", "host receipt", "whole-program equivalence"],
              "interpretation": "Hand-written model tests consequences of stated branches; does not independently prove the binary."}
    (OUT / "CONTRACT_CHECKS.json").write_text(json.dumps(result, ensure_ascii=False, indent=2) + "\n")
    print("PASS", len(results), "synthetic contract checks")


if __name__ == "__main__":
    main()
