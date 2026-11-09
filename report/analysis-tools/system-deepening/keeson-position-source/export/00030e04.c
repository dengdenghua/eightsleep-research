/* Static Ghidra pseudocode; not original source. */

void FUN_00030e04(uint param_1,int param_2)

{
  *(byte *)(param_2 + (param_1 >> 3)) =
       *(byte *)(param_2 + (param_1 >> 3)) | (byte)(1 << (param_1 & 7));
  return;
}


