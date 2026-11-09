"""Exact retained Queues class; ordinals only, not hardware execution.
Extracted by prepare_vendor.py; full source in vendor/reference.
"""
from collections import Counter, deque

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
