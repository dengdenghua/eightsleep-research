/* Static Ghidra pseudocode; not original source. */

void FUN_0003273c(int param_1,uint param_2,int param_3,int param_4,int param_5,int param_6)

{
  *(uint *)(param_1 * 4 + 0x50000700) =
       param_2 | param_3 << 1 | param_4 << 2 | param_5 << 8 | param_6 << 0x10;
  return;
}


