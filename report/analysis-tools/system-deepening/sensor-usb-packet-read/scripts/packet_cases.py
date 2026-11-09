#!/usr/bin/env python3
"""Recovered single-buffer branches, synthetic inputs only; never executes BBIN."""
import json
from copy import deepcopy
from pathlib import Path

OUT = Path(__file__).resolve().parent.parent


def pma_copy(source, start, length):
    """1779c byte loads -> little-endian word stores, zero padded final word."""
    reads, words = [], []
    for off in range(0, length, 4):
        word = 0
        for i in range(min(4, length - off)):
            pos = start + off + i
            reads.append(pos)
            word |= source[pos] << (8 * i)
        words.append(word)
    raw = b"".join(w.to_bytes(4, "little") for w in words)
    return raw, reads


class SingleBuffer:
    def __init__(self, source):
        self.source = bytearray(source)
        self.ptr = 0
        self.remaining = len(source)
        self.trace = []
        self.packets = []
        self.finished = False
        self.copy_next()

    def copy_next(self):
        n = min(self.remaining, 64)
        padded, reads = pma_copy(self.source, self.ptr, n)
        self.pma = padded[:n]
        self.count = n
        self.trace.append({"event": "copy_to_PMA", "source_range": [self.ptr, self.ptr+n],
                           "count": n, "read_offsets": reads, "pma_hex": self.pma.hex()})

    def overwrite(self, start, end, value):
        self.source[start:end] = bytes([value]) * (end-start)
        self.trace.append({"event": "synthetic_same_slot_write", "range": [start, end], "value": value})

    def tx_event(self):
        assert not self.finished
        # Model assumes endpoint count equals this copied packet's programmed length.
        self.packets.append(self.pma)
        n = self.count
        self.trace.append({"event": "modeled_endpoint_TX_event", "count": n})
        if self.remaining > n:  # 1452c..14552: final branch does not advance pointer/count
            self.remaining -= n
            self.ptr += n
            self.copy_next()
        else:
            self.remaining = 0
            self.finished = True
            self.trace.append({"event": "lower_DataIn_callback", "source_reads": 0})

    def finish(self):
        while not self.finished:
            self.tx_event()
        return b"".join(self.packets)


def main():
    cases = []
    for n in [0,1,2,3,4,5,63,64]:
        src = bytes(range(n))
        padded, reads = pma_copy(src,0,n)
        assert reads == list(range(n)) and padded[:n] == src
        assert padded[n:] == bytes((-n) % 4)
    cases.append({"name": "copy_helper_boundaries", "status": "PASS", "lengths": [0,1,2,3,4,5,63,64],
                  "conclusion": "No read beyond requested n; only the final PMA word is zero padded."})

    def save(name, m, expected_changed, original):
        wire_candidate = m.finish()
        changed = [i for i, (a,b) in enumerate(zip(original,wire_candidate)) if a != b]
        assert changed == expected_changed
        cases.append({"name": name, "status": "PASS", "events": deepcopy(m.trace),
                      "changed_offsets": changed, "programmed_packet_lengths": [len(x) for x in m.packets],
                      "host_receipt": "not_observed", "note": "PMA byte candidates under this synthetic schedule, not a captured USB transfer"})

    original = bytes([0x11])*40
    m=SingleBuffer(original);m.overwrite(0,40,0x22)
    save("one_packet_already_copied",m,[],original)
    original=bytes([0x11])*130
    m=SingleBuffer(original);m.overwrite(0,130,0x22)
    save("overwrite_before_second_copy",m,list(range(64,130)),original)
    m=SingleBuffer(original);m.tx_event();m.overwrite(0,130,0x22)
    save("overwrite_after_two_copies",m,[128,129],original)
    m=SingleBuffer(original);m.overwrite(0,100,0x22)
    save("partial_rewrite_changes_only_unread_overlap",m,list(range(64,100)),original)
    m=SingleBuffer(original);m.overwrite(0,130,0x11)
    save("same_bytes_rewrite_not_detectable_as_change",m,[],original)
    original=bytes([0x11])*64
    m=SingleBuffer(original);m.overwrite(0,64,0x22)
    save("exact_64_original_bytes_already_copied",m,[],original)
    padded,reads=pma_copy(b"",0,0)
    assert padded==b"" and reads==[]
    cases[-1]["class_ZLP_note"]="A later class ZLP uses length0 and performs no source RAM byte read; this case does not simulate the class callback."

    # Representative instruction-boundary interleaving, not a full IRQ emulator.
    state={"current":"A","slot_status":{"A":0,"B":0},"softbusy":1,"TxState":1}
    events=[{"at":"20c2e condition accepted", "state":deepcopy(state), "elapsed":51}]
    state["TxState"]=0;state["softbusy"]=0;state["slot_status"]["A"]=1
    state["current"]="B";state["softbusy"]=1;state["TxState"]=1
    events.append({"at":"IRQ8 completes A and pumps B before main20c30", "state":deepcopy(state)})
    state["softbusy"]=0;state["slot_status"][state["current"]]=1;state["current"]=None
    events.append({"at":"main resumes20c30..3c using earlier accepted condition", "state":deepcopy(state)})
    assert state["slot_status"]["B"]==1 and state["TxState"]==1
    cases.append({"name":"IRQ_after_timeout_test_before_recycle", "status":"PASS", "events":events,
                  "assumptions":["IRQ8 enabled and pending in selected instruction gap", "A final completion starts queued B successfully", "No other mutation intervenes"],
                  "conclusion":"No local recheck makes B's local slot reusable while B lower transfer is busy; not an observed hardware incident."})
    out={"kind":"hand_written_synthetic_branch_checks", "executes_firmware":False, "status":"PASS", "cases":cases,
         "limits":["130/40 byte inputs are synthetic encoded byte buffers, not record sizes or measured captures",
                   "Normal endpoint events assumed to report the count programmed for the preceding packet",
                   "Synthetic overwrites occur between PMA copies; no full peripheral or interrupt arbitration emulation",
                   "No host ACK, CRC acceptance, real fault rate or all-schedules claim",
                   "Only single-buffer EP81, normal speed1/64-byte branch; double-buffer paths excluded"]}
    (OUT/'SYNTHETIC_CASES.json').write_text(json.dumps(out,ensure_ascii=False,indent=2)+'\n')
    print('PASS',len(cases),'synthetic packet/IRQ cases')


if __name__=='__main__':
    main()
