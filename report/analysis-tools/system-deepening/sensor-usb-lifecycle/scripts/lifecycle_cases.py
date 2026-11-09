#!/usr/bin/env python3
"""Finite synthetic schedules of recovered branches, not target execution."""
from collections import deque
from copy import deepcopy
import json
from pathlib import Path

OUT = Path(__file__).resolve().parent.parent


class Lifecycle:
    def __init__(self):
        self.gate = self.class_exists = True
        self.software_busy = self.tx_state = 0
        self.start_tick = 0
        self.current = self.tx_buffer = self.actual_transfer = None
        self.queue = deque()
        self.status = {}
        self.submitted = []
        self.events = []

    def emit(self, event, **more):
        self.events.append({"event": event, **more, "current": self.current,
                            "queue": list(self.queue), "software_busy": self.software_busy,
                            "class_present": self.class_exists,
                            "class_TxState": self.tx_state, "class_TxBuffer": self.tx_buffer,
                            "actual_transfer_label": self.actual_transfer,
                            "slot_status": dict(self.status)})

    def start(self, name, tick):
        # 1BA8C: busy/gate check, then software flag, SetTxBuffer, TransmitPacket.
        if self.software_busy:
            if tick - self.start_tick <= 50:
                self.emit("start_rejected_software_busy", name=name)
                return False
            self.software_busy = 0
            self.emit("start_clears_overdue_software_busy_without_abort")
        if not self.gate:
            self.emit("start_rejected_gate", name=name)
            return False
        self.software_busy, self.start_tick = 1, tick
        if self.class_exists:
            self.tx_buffer = name  # 18080 writes before 180BE tests TxState
        if not self.class_exists or self.tx_state:
            self.software_busy = 0
            self.emit("start_rejected_class_state_after_SetTxBuffer", name=name)
            return False
        self.tx_state = 1
        self.actual_transfer = name
        self.submitted.append(name)
        self.emit("lowlevel_submit", name=name)
        return True

    def pump(self, tick):
        # 1D6C8: don't pop another while current exists; return value ignored.
        if self.software_busy:
            return
        if self.current is None:
            if not self.queue:
                return
            self.current = self.queue.popleft()
            self.emit("pop_descriptor_into_current")
        self.start(self.current, tick)

    def submit(self, name, tick=0):
        self.status.setdefault(name, 1)
        assert self.status[name] != 0
        if not self.gate:
            self.status[name] = 2
            self.emit("adapter_gate_reject_status2", name=name)
            return
        self.pump(tick)
        if self.current is None and not self.software_busy and self.start(name, tick):
            self.current = name
            self.status[name] = 0
            self.emit("adapter_accept_current", name=name)
        else:
            # Cases use at most two queued records, below recovered capacity64.
            assert len(self.queue) < 64
            self.status[name] = 0
            self.queue.append(name)
            self.emit("adapter_enqueue", name=name)

    def recycle_current(self, tick, cause):
        # 28E4C takes no descriptor token and uses the current globals.
        released = self.current
        if self.current is not None:
            self.status[self.current] = 1
            self.current = None
        self.emit("recycle_current_status1", released=released, cause=cause)
        self.pump(tick)

    def main_timeout(self, tick):
        if self.software_busy and tick - self.start_tick > 50:
            self.software_busy = 0
            self.emit("main_timeout_no_TxState_clear_no_USB_abort")
            self.recycle_current(tick, "main_timeout")

    def data_in(self, actual_label, tick, total_length, max_packet):
        assert self.class_exists and self.tx_state
        if total_length > 0 and total_length % max_packet == 0:
            self.emit("zero_length_packet_submitted_no_user_callback", actual_label=actual_label)
            return False
        self.tx_state = 0
        self.actual_transfer = None
        # 19578 ignores R0/R1/R2 supplied by class DataIn and clears app busy.
        self.software_busy = 0
        self.emit("class_done_callback_ignores_transfer_identity", actual_label=actual_label)
        self.recycle_current(tick, "callback_for_" + actual_label)
        return True

    def gate_drain(self):
        assert not self.gate
        while self.queue:
            name = self.queue.popleft()
            self.status[name] = 2
            self.emit("drain_queued_status2", name=name)

    def usb_reset(self):
        # 1C0D4 resets app flags; class DeInit clears class context, not adapter current.
        self.gate = self.class_exists = False
        self.software_busy = 0
        self.tx_state = self.tx_buffer = None  # class no longer exists; not a stored-field write
        self.actual_transfer = None  # modeled endpoint closure, no host receipt inference
        self.emit("USB_reset_no_adapter_current_release")

    def reconnect_and_valid_frame(self, tick):
        self.class_exists = self.gate = True
        self.tx_state = 0
        self.emit("assumed_reconfiguration_and_control_bit_ready")
        self.pump(tick)  # 20E20 is one explicitly recovered retry trigger


def main():
    cases = []

    def save(name, model, conclusion, assumptions=None):
        cases.append({"case": name, "status": "PASS", "events": deepcopy(model.events),
                      "conclusion": conclusion, "assumptions": assumptions or [],
                      "lowlevel_submitted_labels": list(model.submitted),
                      "host_receipt": "not_observed"})

    m = Lifecycle()
    m.submit("A"); m.submit("B")
    m.data_in("A", 1, 383, 64)
    assert m.status == {"A": 1, "B": 0} and m.current == "B" and m.submitted == ["A", "B"]
    m.data_in("B", 2, 383, 64)
    assert m.current is None and m.status == {"A": 1, "B": 1}
    save("normal_completion_advances_queue", m, "Callback recycles current and starts next descriptor.")

    m = Lifecycle(); m.submit("A")
    assert not m.data_in("A", 1, 384, 64)
    assert m.status["A"] == 0 and m.tx_state == 1 and m.software_busy == 1
    assert m.data_in("A", 2, 0, 64) and m.status["A"] == 1
    save("exact_packet_multiple_waits_for_ZLP_completion", m, "First DataIn does not release the slot.",
         ["384/64 are synthetic total-length/max-packet inputs, not a measured capture."])

    m = Lifecycle(); m.submit("A"); m.submit("B")
    m.gate = False; m.submit("C"); m.gate_drain()
    assert m.status == {"A": 0, "B": 2, "C": 2} and m.current == "A"
    save("gate_loss_drops_queue_not_current", m, "Queued B and new C become reusable status2; current A remains owned.")

    m = Lifecycle(); m.submit("A"); m.submit("B")
    m.main_timeout(50)
    assert m.current == "A" and m.status["A"] == 0
    m.main_timeout(51)
    assert m.status == {"A": 1, "B": 0} and m.current == "B"
    assert m.tx_state == 1 and m.tx_buffer == "B" and m.submitted == ["A"]
    save("timeout_does_not_abort_lower_transfer", m,
         "A slot is reusable while lower transfer A remains pending; B pointer overwrites class buffer but B submission is rejected busy.",
         ["No A completion before tick51; class TxState still1; B already queued; gate remains valid."])
    m.data_in("A", 52, 383, 64)
    assert m.status == {"A": 1, "B": 1} and m.current is None and m.submitted == ["A"]
    save("late_A_callback_releases_pending_B", m,
         "The current global descriptor B is released although lowlevel submit list has only A.",
         ["Continue prior conditional schedule; A final DataIn arrives later; no reset, gate change, or unrelated event intervenes.",
          "Demonstrates a possible local ownership mismatch, not a measured failure rate or physical corruption."])

    m = Lifecycle(); m.submit("A"); m.submit("B")
    m.usb_reset(); m.gate_drain(); m.main_timeout(100)
    assert m.current == "A" and m.status == {"A": 0, "B": 2}
    assert not m.class_exists and m.tx_state is None and m.tx_buffer is None
    m.reconnect_and_valid_frame(101)
    assert m.current == "A" and m.submitted == ["A", "A"]
    save("reset_retains_current_then_valid_frame_retries", m,
         "Queued B is discarded; retained A can be submitted again after the assumed recovery trigger.",
         ["Reset occurs without prior completion callback; class reconfiguration succeeds and control bit becomes ready.",
          "Destroyed class state/buffer are null in this model, not assertions about freed memory bytes; class Init supplies TxState0 only after successful reconfiguration.",
          "Whether first A reached the host is unknown; duplicate delivery is not asserted."])
    output = {"kind": "hand_written_synthetic_branch_model", "executes_firmware": False,
              "status": "PASS", "cases": cases,
              "limits": ["No timing or hardware measurement", "No claim all interrupts/interleavings are modeled",
                         "Pool allocation, 500 buffer wait, allocation exceptions, HAL peripheral progress and atomicity excluded",
                         "Synthetic descriptor labels are not wire sequence IDs"],
              "source_map": "EVIDENCE_MAP.json"}
    (OUT / "SYNTHETIC_CASES.json").write_text(json.dumps(output, ensure_ascii=False, indent=2) + "\n")
    print("PASS", len(cases), "synthetic lifecycle schedules")


if __name__ == "__main__":
    main()
