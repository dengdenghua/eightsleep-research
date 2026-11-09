/* Ghidra static pseudocode; not original source. Read-only project; no target execution. */

void FUN_0019d6e0(long *param_1)

{
  if ((long *)*param_1 != (long *)0x0) {
                    /* WARNING: Could not recover jumptable at 0x0019d6f8. Too many branches */
                    /* WARNING: Treating indirect jump as call */
    (**(code **)(*(long *)*param_1 + 8))();
    return;
  }
  return;
}


