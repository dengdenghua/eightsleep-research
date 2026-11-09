#!/usr/bin/env python3
"""Round-10+ read-only Ghidra export driver (one pass per invocation).

Usage: python3 scripts/run_export.py <pass-name> <target-list-file>

Each pass exports every flash-internal bl/blx target that still has no export in
the retained export set. Targets are derived by the caller from a fresh callee
scan, so each pass closes whatever the previous pass uncovered.

Every target is its own argv element (ExportSensorDiff.java parses them one by
one). -readOnly -noanalysis: nothing is written back to the project, nothing is
disassembled. No firmware is executed.
"""

import os
import subprocess
import sys
from pathlib import Path

ROOT = Path('/Volumes/My Passport/EightSleep')
if not ROOT.exists():
    ROOT = Path('/Volumes/EightSleepAPFS')
OUT = ROOT / 'report/analysis-tools/system-deepening/residual-target-closure'
HEADLESS = '/opt/homebrew/Cellar/ghidra/12.1.4/libexec/support/analyzeHeadless'
PROJECT = ('/Users/dangbei/Downloads/eightsleep-firmware-research-20261107/'
           'analysis/account-readonly/k60-binding/nonusb-flow/ghidra')
SCRIPT = str(ROOT / 'report/analysis-tools/system-deepening/'
             'sensor-nonusb-dispatch/scripts')
JAVA = '/opt/homebrew/opt/openjdk@21/libexec/openjdk.jdk/Contents/Home'


def main() -> int:
    if len(sys.argv) != 3:
        raise SystemExit(__doc__)
    name, list_file = sys.argv[1], Path(sys.argv[2])
    targets = [t.strip() for t in list_file.read_text().split() if t.strip()]
    if not targets:
        print('%s: empty target list, nothing to do' % name)
        return 0
    env = os.environ.copy()
    env['JAVA_HOME'] = JAVA
    env['PATH'] = JAVA + '/bin:' + env.get('PATH', '')

    outdir = OUT / name
    outdir.mkdir(parents=True, exist_ok=True)
    argv = [HEADLESS, PROJECT, 'NonUsbSensor', '-process', 'firmware-sensor-g0.bbin',
            '-readOnly', '-noanalysis', '-scriptPath', SCRIPT,
            '-postScript', 'ExportSensorDiff.java', str(outdir)] + targets
    log = OUT / ('%s-export.log' % name)
    with log.open('w') as fh:
        fh.write('COMMAND ' + ' '.join(argv) + '\n')
        r = subprocess.run(argv, stdout=subprocess.PIPE, stderr=subprocess.STDOUT,
                           text=True, env=env)
        fh.write(r.stdout)
    n = len(list(outdir.glob('*.txt')))
    print('%s: rc=%d targets=%d txt=%d' % (name, r.returncode, len(targets), n),
          flush=True)
    if r.returncode != 0:
        tail = '\n'.join(log.read_text().splitlines()[-25:])
        sys.exit('export failed:\n' + tail)
    return 0


if __name__ == '__main__':
    raise SystemExit(main())
