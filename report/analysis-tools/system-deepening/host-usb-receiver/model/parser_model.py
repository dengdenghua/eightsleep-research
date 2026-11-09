"""Bounded synthetic transcription of Frank's USB LSP receive path.

Not firmware execution. Addresses identify the validated instruction sources.
No emulated adjacent RAM: an oversized CRC read is reported and stops the case.
"""
from collections import deque
from hashlib import sha256


def crc16(body):
    """001d9dc0: init 0x1d0f, polynomial 0x1021, body only."""
    crc = 0x1d0f
    for byte in body:
        crc ^= byte << 8
        for _ in range(8):
            crc = ((crc & 0x7fff) << 1) ^ (0x1021 if crc & 0x8000 else 0)
    return crc


def escape(data):
    """001d9f34/001da1f0 canonical sender encoding."""
    result = bytearray()
    for byte in data:
        if byte in (0x7d, 0x7e):
            result.extend((0x7d, byte ^ 0x20))
        else:
            result.append(byte)
    return bytes(result)


def frame(body, declared_length=None):
    length = len(body) if declared_length is None else declared_length
    return b'\x7e' + escape(length.to_bytes(2, 'big') + body + crc16(body).to_bytes(2, 'big'))


class UnsafeCrcRead(Exception):
    """Native CRC range extends beyond configured storage; result unknown."""


class Receiver:
    def __init__(self, capacity=2048):
        self.capacity = capacity
        self.chunks = deque()
        self.input_buffer = b''
        self.cursor = 0
        self.raw_count = 0
        self.escape_pending = False
        self.state = 0
        self.length = 0
        self.count = 0
        self.wire_crc = 0
        self.body = bytearray(capacity)
        self.accepted = []
        self.events = []

    def event(self, kind, **data):
        self.events.append(dict(event=kind, raw_consumed=self.raw_count, state=self.state, **data))

    def add(self, chunk):
        """An empty item models one read()==0/EAGAIN result, not EOF/reset."""
        self.chunks.append(bytes(chunk))

    def token(self):
        # 001d9e40: refill <=0x800 bytes; actual wrapper maps all read errors to 0.
        while True:
            if self.cursor >= len(self.input_buffer):
                item = self.chunks.popleft() if self.chunks else b''
                self.input_buffer, rest = item[:2048], item[2048:]
                if rest:
                    self.chunks.appendleft(rest)
                self.cursor = 0
                if not self.input_buffer:
                    self.event('no_input', escape_pending=self.escape_pending)
                    return None
            byte = self.input_buffer[self.cursor]
            self.cursor += 1
            self.raw_count += 1
            if self.escape_pending:
                self.escape_pending = False
                self.event('escaped_byte', wire_byte=byte, value=byte ^ 0x20)
                return False, byte ^ 0x20
            if byte == 0x7d:
                self.escape_pending = True
                continue
            return byte == 0x7e, byte

    def receive(self):
        """One 001d9bc0 call: returns on accepted CRC or no input."""
        while True:
            token = self.token()
            if token is None:
                return None
            delimiter, byte = token
            if delimiter:
                old = self.state
                self.state, self.length, self.count, self.wire_crc = 1, 0, 0, 0
                self.event('start_or_resync', previous_state=old)
            elif self.state == 1:
                self.length = byte << 8
                self.state = 2
            elif self.state == 2:
                self.length |= byte
                self.state = 3
                self.event('length', declared=self.length, capacity=self.capacity)
            elif self.state == 3:
                old_count = self.count
                self.count += 1
                if old_count < self.capacity:
                    self.body[old_count] = byte
                elif old_count == self.capacity:
                    self.event('first_unstored_body_byte', body_index=old_count)
                if self.count == self.length:
                    self.state = 4
                    self.event('body_complete', count=self.count)
            elif self.state == 4:
                self.wire_crc = byte << 8
                self.state = 5
            elif self.state == 5:
                self.wire_crc |= byte
                self.state = 0
                if self.count > self.capacity:
                    self.event('crc_read_outside_configured_body', requested=self.count,
                               stored_capacity=self.capacity, native_outcome='not_modelled')
                    raise UnsafeCrcRead(self.count)
                result = bytes(self.body[:self.count])
                calculated = crc16(result)
                if self.wire_crc == calculated:
                    self.accepted.append(result)
                    self.event('accepted_crc', length=self.count, body_sha256=sha256(result).hexdigest())
                    return result
                self.event('crc_mismatch', received=self.wire_crc, calculated=calculated)

    def drain(self):
        while self.receive() is not None:
            pass

    def snapshot(self):
        return dict(state=self.state, declared_length=self.length, received_count=self.count,
                    escape_pending=self.escape_pending, raw_consumed=self.raw_count,
                    accepted=[dict(length=len(x), sha256=sha256(x).hexdigest(), hex=x.hex())
                              for x in self.accepted])
