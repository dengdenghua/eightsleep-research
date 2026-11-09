/* Ghidra static pseudocode; not original source. Read-only project; no target execution. */

void FUN_001998f0(undefined8 *param_1)

{
  if ((undefined8 *)*param_1 != param_1 + 2) {
    operator_delete((undefined8 *)*param_1,param_1[2] + 1);
    return;
  }
  return;
}


