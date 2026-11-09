/* Static Ghidra pseudocode; not original source. */

void FUN_0002c406(uint param_1)

{
  if (-1 < (int)param_1) {
    *(int *)((param_1 >> 5) * 4 + -0x1fff1e00) = 1 << (param_1 & 0x1f);
  }
  return;
}


