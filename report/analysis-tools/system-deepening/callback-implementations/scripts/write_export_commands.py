#!/usr/bin/env python3
"""Regenerate EXPORT_COMMANDS.json from the four retained Ghidra invocation logs.

The logs embed the exact argv of each read-only analyzeHeadless call, so this
script does not rely on a human-transcribed target list.
"""
from __future__ import annotations

import json
import re
from pathlib import Path

TOOL = Path(__file__).resolve().parent.parent
NAMES = {
    'pass1': 'pass1_all_80_callbacks',
    'pass2': 'pass2_dispatcher_and_identifier_references',
    'pass3': 'pass3_identifier_readers_and_report_ranges',
    'pass4': 'pass4_shared_callees_and_clock_chain',
}
NOTES = {
    'pass1': ('80 even-aligned callback entry points, derived by clearing bit0 '
              'of the 80 unique thumb_function_pointer values in CONFIG_SNAPSHOT.json. '
              'The first attempt passed all 80 addresses as ONE shell argument and '
              'failed at ExportSensorDiff.java line 47 with NumberFormatException; '
              'the fix is one argv element per target.'),
    'pass2': 'Main dispatcher, the 0x200014d8 literal slots and the USART function.',
    'pass3': ('5 identifier reference sites plus decoded ranges covering the '
              '3-byte identifier generation and the report object writes.'),
    'pass4': ('Shared callees of the short thunks: GPIO id accessors, descriptor '
              'consumers, clock writers and memcpy/memset helpers.'),
}

passes = []
for name, title in NAMES.items():
    log = (TOOL / ('%s-export.log' % name)).read_text()
    line = next(l for l in log.splitlines() if l.startswith('COMMAND '))
    argv = line[len('COMMAND '):].split()
    i = argv.index('-postScript')
    out_dir = argv[i + 2]
    targets = argv[i + 3:]
    passes.append(dict(name=title, output_directory='pass%s' % name[-1],
                       export_log='%s-export.log' % name,
                       target_count=len(targets), targets=targets, note=NOTES[name]))

doc = {
    'schema': 'eightsleep.nonusb.callback-implementations.export-commands.v1',
    'date': '2026-11-08',
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
    'argument_bug_fix': ('ExportSensorDiff.java parses each script arg separately '
                         'with Long.parseLong(args[n],16). Joining 80 addresses '
                         'into one string yields NumberFormatException. Use a '
                         'shell/Python array with one element per target.'),
    'passes': passes,
    'ghidra_independent_path': {
        'commands': [
            'cd report/analysis-tools/system-deepening/callback-implementations',
            'python3 scripts/verify_callback_bytes.py',
            'python3 model/build_models.py',
            'python3 scripts/write_export_commands.py',
            'python3 scripts/write_source_manifest.py',
        ],
        'statement': ('All published claims can be re-verified from the retained '
                      'pass1..pass4 exports plus the frozen BBIN and the sixth-round '
                      'CONFIG_SNAPSHOT.json. The Ghidra project is only needed to '
                      'regenerate the exports.'),
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
print('passes:', [(p['name'], p['target_count']) for p in passes])
