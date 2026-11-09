#!/usr/bin/env python3
"""Project retained K60/I35 code conditions into a wiring worksheet, not a device reading."""
import argparse
import csv
import hashlib
import json
import re
from pathlib import Path


def sha(data):
    return hashlib.sha256(data).hexdigest()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--research-root', type=Path, required=True)
    parser.add_argument('--output', type=Path, default=Path(__file__).resolve().parent)
    args = parser.parse_args()
    root, out = args.research_root.resolve(), args.output.resolve()
    out.mkdir(parents=True, exist_ok=True)
    inputs = []

    def read(rel):
        data = (root / rel).read_bytes()
        inputs.append({'path': rel, 'bytes': len(data), 'sha256': sha(data)})
        return data

    sample = read('mediatek/rootfs-selected/opt/eight/lib/subsystem_updates/firmware-sensor-g0-usb.bbin')
    assert sha(sample) == '1a125674542934f36266f88d9f8ca378a6a5ca696d9e58305d1b0e533f795563'
    host = read('mediatek/rootfs-selected/opt/eight/bin/frankenfirmware')
    assert sha(host) == '84727b57ef8b226c78618f9fa9257df7d8ae771c78d8a51e6f3cabf0acc0c375'
    ledger = json.loads(read('analysis/signal-host/later-revision-routing/SOURCE_LEDGER.json'))
    retained = []
    for ref in ledger['references']:
        data = read(ref['path'])
        assert sha(data) == ref['sha256'], ref['path']
        lines = data.decode().splitlines()
        excerpt = '\n'.join(f'{n}: {lines[n - 1]}' for n in range(ref['start_line'], ref['end_line'] + 1))
        assert sha(excerpt.encode()) == ref['excerpt_sha256'], ref['path']
        retained.append({**ref, 'verified': True})
    for rel in ['analysis/account-readonly/k60-binding/FINDINGS_ZH.txt',
                'analysis/account-readonly/k60-binding/nonusb-flow/FINDINGS_ZH.txt',
                'analysis/signal-host/SIGNAL_HOST_ANALYSIS.txt']:
        read(rel)

    map_address, image_base = 0x0802FD0C, 0x08010000
    mapping = list(sample[map_address - image_base:map_address - image_base + 8])
    assert mapping == [3, 2, 1, 0, 4, 5, 6, 7]
    machine_bytes = read('mediatek/rootfs-selected/opt/eight/config/machine.json')
    machine = json.loads(machine_bytes)
    section = max(k for k in machine if re.fullmatch('[A-Z][0-9]{2}', k) and k <= 'I35')
    assert section == 'I21'

    rows = []
    for side, port_key in [('left', 'leftA32SensorPort'), ('right', 'rightA32SensorPort')]:
        for wire in range(16):
            source = mapping.index(wire - 8) if wire >= 8 else None
            output_index = wire - 8 if 8 <= wire <= 12 else None
            rows.append({
                'logical_side': side,
                'conditional_usb_root': machine[section][port_key],
                'wire_adc_slot': wire,
                'adc_target': 'ADC1' if wire >= 8 else 'ADC0_descriptor_disabled',
                'adc_source_channel': source,
                'bus': 'SPI2' if wire >= 8 else None,
                'chip_select': 'PD0' if wire >= 8 else None,
                'data_ready': 'PE2' if wire >= 8 else None,
                'buzzer_output_index': output_index,
                'output_under_k60_stealth': 'piezo-buzzer' if output_index is not None else 'not_routed_to_reviewed_stealth_cbor',
                'conditional_wire_multiplier': 4 if wire >= 8 else None,
                'physical_board_id': None,
                'physical_adc_package': None,
                'physical_piezo_id': None,
                'bed_position': None,
                'observed_on_device': False,
            })
    result = {
        'evidence_kind': 'conditional code projection and physical-mapping worksheet',
        'sensor_revision_condition': 'K60 / 0x0A60',
        'hub_revision_condition': 'I35',
        'sample_machine_section': section,
        'map': {'address': hex(map_address), 'image_base': hex(image_base),
                'file_offset': map_address - image_base, 'source_to_destination': mapping},
        'conditions': [
            'Fixed downloaded samples apply to the initialization under analysis; deployed images not bound.',
            'API labels agree with actual manufacturing fields; not read from MCU manufacturing page.',
            'Initialization succeeds and opcode 0x47 does not later change the map.',
            'ADC1 enable flag is present for its wire values to be consumed.',
            'K60 host all-types=false route is used; this does not describe every historical mode.',
        ],
        'interpretation': [
            'One logical side has multiple channels read through one configured ADC1 target and packed by its sensor MCU.',
            'This is not evidence of one acquisition card for each piezo or one physical PCB for the whole side.',
            'ADC0/ADC1 name banks within one logical side, not left/right halves of the bed.',
            'Four IMU protocol groups do not independently establish four installed IC packages or their coordinates.',
            'Rows left/right repeat the same conditional channel rule; actual USB placement remains unobserved.',
        ],
        'physical_columns_are_unknown': True,
        'rows': rows,
        'verified_prior_references': len(retained),
    }
    (out / 'MATRIX.json').write_text(json.dumps(result, ensure_ascii=False, indent=2) + '\n')
    with (out / 'MATRIX.csv').open('w', newline='') as handle:
        writer = csv.DictWriter(handle, fieldnames=list(rows[0]))
        writer.writeheader()
        writer.writerows(rows)
    (out / 'MAP_BYTES.bin').write_bytes(bytes(mapping))
    (out / 'INPUTS.json').write_text(json.dumps(inputs, ensure_ascii=False, indent=2) + '\n')
    (out / 'VERIFIED_PRIOR_REFERENCES.json').write_text(json.dumps(retained, ensure_ascii=False, indent=2) + '\n')
    print(json.dumps({'rows': len(rows), 'prior_references_verified': len(retained),
                      'source_order_buzzer': [mapping.index(x) for x in range(5)],
                      'device_observation': False}))


if __name__ == '__main__':
    main()
