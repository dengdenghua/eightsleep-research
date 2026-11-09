#!/usr/bin/env python3
"""Regenerate EXPORT_COMMANDS.json for round 9 from the seven retained logs.

The logs embed the exact argv of each read-only analyzeHeadless call, so this
script never relies on a hand-transcribed target list. The delivery root path
contains a space ("/Volumes/My Passport/..."), therefore the target list is cut
with an explicit marker instead of a plain whitespace split.
"""
from __future__ import annotations

import json
from pathlib import Path

TOOL = Path(__file__).resolve().parent.parent
FOLDER_NAME = TOOL.name
NAMES = {
    'pass1': 'pass1_first_residual_set',
    'pass2': 'pass2_second_residual_set',
    'pass3': 'pass3_third_residual_set',
    'pass4': 'pass4_fourth_residual_set',
    'pass5': 'pass5_fifth_residual_set',
    'pass6': 'pass6_sixth_residual_set',
    'pass7': 'pass7_seventh_residual_set',
    'pass8': 'pass8_trampoline_region_range',
}
NOTES = {
    'pass1': '99 flash-internal BL targets that no earlier export covered. 100 txt retained including program.txt.',
    'pass2': 'the 18 targets revealed by pass1. 19 txt retained.',
    'pass3': 'the 3 targets revealed by pass2. 4 txt retained.',
    'pass4': 'the 1 target revealed by pass3. 2 txt retained.',
    'pass5': 'the 1 target revealed by pass4. 2 txt retained.',
    'pass6': 'the 1 target revealed by pass5. 2 txt retained.',
    'pass7': 'the 1 target revealed by pass6. 2 txt retained.',
    'pass8': 'RANGE 08015e00:08017000 covering the whole trampoline cluster. 2 txt retained.',
}
MARKER = '/%s/' % FOLDER_NAME


POST = '-postScript ExportSensorDiff.java '


def parse_log(name: str) -> tuple[str, list[str], str]:
    log = (TOOL / ('%s-export.log' % name)).read_text()
    line = next(l for l in log.splitlines() if l.startswith('COMMAND '))
    argv = line[len('COMMAND '):]
    marker = '%s%s ' % (MARKER, name)
    idx = argv.index(marker)
    head_end = argv.index(POST) + len(POST)
    out_dir = argv[head_end:idx + len(marker) - 1]   # absolute output directory
    targets = argv[idx + len(marker):].split()
    head = argv[:head_end].rstrip()                   # raw prefix, paths unquoted
    return head, targets, out_dir


passes = []
for name, title in NAMES.items():
    head, targets, out_dir = parse_log(name)
    all_txt = sorted((TOOL / name).glob('*.txt'))
    target_txt = [p for p in all_txt if p.name != 'program.txt']
    passes.append(dict(name=title, output_directory=name,
                       output_directory_absolute=out_dir,
                       export_log='%s-export.log' % name,
                       command_head=head, target_count=len(targets),
                       targets=targets, target_txt_files=len(target_txt),
                       disk_txt_files=len(all_txt),
                       note=NOTES[name]))

total_targets = sum(p['target_count'] for p in passes)
total_txt = sum(p['target_txt_files'] for p in passes)
total_disk = sum(p['disk_txt_files'] for p in passes)

doc = {
    'schema': 'eightsleep.nonusb.residual-target-closure.export-commands.v1',
    'date': '2026-11-09',
    'round': 10,
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
                      'its own argv element. Targets cannot be concatenated '
                      'into a comma list.'),
    'path_rule': ('The delivery root contains a space, so EXPORT_TARGETS.json and '
                  'this file both cut the target list at the literal marker '
                  '"/residual-target-closure/<pass> " instead of whitespace splitting.'),
    'passes': passes,
    'totals': dict(passes=len(passes), targets=total_targets,
                   target_txt_files=total_txt, disk_txt_files=total_disk),
    'ghidra_independent_path': {
        'commands': [
            'cd report/analysis-tools/system-deepening/residual-target-closure',
            'python3 model/build_round10.py',
            'python3 scripts/verify_round10.py',
            'python3 scripts/write_export_commands.py',
            'python3 scripts/write_source_manifest.py',
        ],
        'statement': ('All published claims can be re-verified from the retained '
                      'pass1..pass7 exports plus the frozen BBIN. The Ghidra '
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
print('totals:', doc['totals'])
print('per pass:', [(p['output_directory'], p['target_count'],
                     p['target_txt_files'], p['disk_txt_files']) for p in passes])
print('out_dir sample:', passes[1]['output_directory_absolute'])
print('head sample:', passes[1]['command_head'][:120], '...')
