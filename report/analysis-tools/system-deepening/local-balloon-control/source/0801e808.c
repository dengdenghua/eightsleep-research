/* Ghidra static pseudocode; not original source. */

undefined1 FUN_0801e808(int param_1,uint param_2)

{
  undefined1 uVar1;
  
  uVar1 = 1;
  if ((param_1 != 0) && (param_2 < 6)) {
    uVar1 = *(undefined1 *)(param_1 + param_2 * 0x104 + 0x100);
  }
  return uVar1;
}


