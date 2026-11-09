#!/usr/bin/env python3
"""Offline ADS131M0x receive-frame decoder recovered from sensor 5.5.34.0.

Evidence: BBIN SHA256 1a125674542934f36266f88d9f8ca378a6a5ca696d9e58305d1b0e533f795563,
0801D228 (transfer/CRC), 08029218 (CRC), 0801D7DC (sample/status/map).
This decodes ADC SPI frames, NOT USB/LSP packets. No device I/O is performed.
Synthetic fixtures validate byte arithmetic; no real-device capture is available.
"""
import argparse
import json
from pathlib import Path


def crc16_spi(data: bytes, seed: int = 0xFFFF) -> int:
    """MSB-first polynomial 0x1021, no final xor/reflection."""
    state = seed
    for byte in data:
        state ^= byte << 8
        for _ in range(8):
            state = ((state << 1) ^ (0x1021 if state & 0x8000 else 0)) & 0xFFFF
    return state


def pga_code(request: int) -> int:
    """Recovered integer-gain thresholds; request=100 corresponds to 1x."""
    if not 0 <= request <= 0xFFFF:
        raise ValueError("gain request must fit unsigned 16 bits")
    return sum(request >= threshold for threshold in (200, 400, 800, 1600, 3200, 6400, 12800))


def decode_ads_frame(data: bytes, channels: int, *, channel_map=None,
                     multiplier: int = 1, previous=None, check_crc: bool = True) -> dict:
    """Apply only valid channel updates to eight destination slots.

    Firmware accepts channel counts 2..8 from ID, with special clock masks for 2/4/8.
    Destination initialization belongs to the caller; defaults here are explicitly
    None, so absent measurements cannot be mistaken for zero ADC readings.
    Duplicate channel-map destinations are allowed by the device command.
    """
    if not 2 <= channels <= 8:
        raise ValueError("channel count outside firmware's 2..8 accepted range")
    if len(data) != 3 * (channels + 2):
        raise ValueError("expected one 24-bit status, N samples, and one CRC word")
    if channel_map is None:
        channel_map = list(range(8))
    if len(channel_map) != 8 or any(not 0 <= n <= 7 for n in channel_map):
        raise ValueError("map must contain eight destination indices in 0..7")
    if previous is None:
        previous = [None] * 8
    if len(previous) != 8:
        raise ValueError("previous must contain eight destination slots")
    residue = crc16_spi(data)
    if check_crc and residue:
        raise ValueError(f"ADC SPI CRC residue is {residue:04x}, expected zero")
    status = int.from_bytes(data[:2], "big")
    mask = status & 0xFF
    slots = list(previous)
    updates = []
    for channel in range(channels):
        raw = int.from_bytes(data[3 + channel*3:6 + channel*3], "big", signed=True)
        if mask & (1 << channel):
            destination = channel_map[channel]
            value = raw * multiplier
            # ARM 32-bit integer destination; observed multipliers 1 and 4 do not overflow.
            value = ((value + (1 << 31)) & 0xFFFFFFFF) - (1 << 31)
            slots[destination] = value
            updates.append({"source_channel": channel, "destination_slot": destination,
                            "adc_signed24": raw, "scaled_int32": value})
    return {"status_word": status, "valid_mask": mask,
            "has_new_samples": bool(mask), "crc_residue": residue,
            "slots": slots, "updates": updates}


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("frame", type=Path)
    p.add_argument("--channels", type=int, required=True)
    p.add_argument("--multiplier", type=int, default=1)
    args = p.parse_args()
    print(json.dumps(decode_ads_frame(args.frame.read_bytes(), args.channels,
                                     multiplier=args.multiplier), indent=2))


if __name__ == "__main__":
    main()
