#!/usr/bin/env python3
"""Regenerate EXPORT_COMMANDS.json from the two retained Ghidra invocation logs.

The logs embed the exact argv of each read-only analyzeHeadless call, so this
script never relies on a human-transcribed target list.
"""
from __future__ import annotations

import json
from pathlib import Path

TOOL = Path(__file__).resolve().parent.parent
NAMES = {
    'pass1': 'pass1_dispatcher_callees_and_constructors',
    'pass2': 'pass2_helpers_and_decoded_ranges',
}
NOTES = {
    'pass1': ('41 targets from the 22 FUN_* callees of the 0801d888 pseudo-C '
              'that were not yet exported as TARGET, plus the constructor '
              'neighbourhood and decoded ranges. 42 txt retained including '
              'program.txt.'),
    'pass2': ('16 auxiliary targets: memset/memcpy helpers, timer initialisers, '
              'callbacks referenced by LAB_ labels, and two decoded ranges. '
              '17 txt retained including program.txt.'),
}

passes = []
for name, title in NAMES.items():
    log = (TOOL / ('%s-export.log' % name)).read_text()
    line = next(l for l in log.splitlines() if l.startswith('COMMAND '))
    argv = line[len('COMMAND '):].split()
    i = argv.index('-postScript')
    out_dir = argv[i + 2]
    targets = argv[i + 3:]
    txts = sorted((TOOL / name).glob('*.txt'))
    passes.append(dict(name=title, output_directory=name,
                       export_log='%s-export.log' % name,
                       command_argv=argv, target_count=len(targets),
                       targets=targets, output_txt_files=len(txts),
                       note=NOTES[name]))

doc = {
    'schema': 'eightsleep.nonusb.report-object-layout.export-commands.v1',
    'date': '2026-11-09',
    'purpose': ('Exact read-only Ghidra invocations retained for this evidence '
                'folder, plus the Ghidra-independent verification path.'),
    'toolchain': {
        'ghidra_analyzeHeadless': '/opt/homebrew/Cellar/ghidra/12.1.4/libexec/support/analyzeHeadless',
        'java_home': '/opt/homebrew/opt/openjdk@21/libexec/openjdk.jdk/Contents/Home',
        'java_home_required': ('Without exporting JAVA_HOME, analyzeHeadless '
                               'aborts with "Unable to locate a Java Runtime" / '
                               '"no TTY detected".'),
        'project_directory': ('/Users/dangbei/Downloads/eightsleep-firmware-research-20261107/'
                              'analysis/account-readonly/k60-binding/nonusb-flow/ghidra'),
        'project_file': 'NonUsbSensor.gpr',
        'program_name_in_project': 'firmware-sensor-g0.bbin',
        'script_directory': 'report/analysis-tools/system-deepening/sensor-nonusb-dispatch/scripts',
        'post_script': 'ExportSensorDiff.java',
    },
    'safety_flags': {
        'readOnly': 'opens the existing project read-only; nothing is written back',
        'noanalysis': 'no auto-analysis; only already-decoded instruction rows are exported',
        'script_sha_gate': ('ExportSensorDiff.java refuses to run unless the '
                            'program SHA256 equals 51531576...a891'),
        'range_targets': ('a start:end target dumps only already-decoded '
                          'instructions; it never disassembles or mutates'),
        'no_execution': 'no firmware executed; no device/account/API/network access',
    },
    'command_template': ('export JAVA_HOME="..."; export PATH="$JAVA_HOME/bin:$PATH"; '
                         '"$HEADLESS" "$GHIDRA_PROJECT_DIR" NonUsbSensor -process '
                         'firmware-sensor-g0.bbin -readOnly -noanalysis -scriptPath '
                         '"$SCRIPT_DIR" -postScript ExportSensorDiff.java "$OUT_DIR" '
                         '<one argv per target>'),
    'argument_rule': ('ExportSensorDiff.java parses each script arg separately '
                      'with Long.parseLong(args[n],16); every target must be '
                      'its own argv element (learned in round 7).'),
    'passes': passes,
    'ghidra_independent_path': {
        'commands': [
            'cd report/analysis-tools/system-deepening/report-object-layout',
            'python3 scripts/verify_layout_bytes.py',
            'python3 model/build_layout.py',
            'python3 scripts/write_export_commands.py',
            'python3 scripts/write_source_manifest.py',
        ],
        'statement': ('All published claims can be re-verified from the retained '
                      'pass1/pass2 exports, the round-7 0801d888 export and '
                      'REPORT_FIELDS.json, plus the frozen BBIN. The Ghidra '
                      'project is only needed to regenerate the exports.'),
    },
    'frozen_input': {
        'path': ('materials/eightsleep-full-evidence-20261107/firmware/mtk/'
                 'rootfs/files/opt/eight/lib/subsystem_updates/firmware-sensor-g0.bbin'),
        'bytes': 132896,
        'sha256': '51531576fd31af96f7239b71d26e1f175815f5cb21dbe9ab305fa9a33cc6a891',
    },
}
out = TOOL / 'EXPORT_COMMANDS.json'
out.write_text(json.dumps(doc, ensure_ascii=False, indent=2, sort_keys=True) + '\n')
print('passes:', [(p['output_directory'], p['target_count'],
                   p['output_txt_files']) for p in passes])
