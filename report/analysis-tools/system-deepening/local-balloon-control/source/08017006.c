/* Ghidra static pseudocode; not original source. */

void FUN_08017006(undefined4 *param_1)

{
  undefined4 uVar1;
  
  uVar1 = FUN_08011424();
  param_1[1] = uVar1;
  *param_1 = uVar1;
  *(undefined1 *)(param_1 + 2) = 1;
  return;
}


