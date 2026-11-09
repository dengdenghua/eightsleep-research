/* Ghidra static pseudocode; not original source. */

undefined4 FUN_08020a1c(int param_1,uint param_2)

{
  undefined4 uVar1;
  
  if ((param_1 == 0) || (5 < param_2)) {
    uVar1 = 0xbf800000;
  }
  else {
    uVar1 = *(undefined4 *)(param_1 + param_2 * 0x104 + 0xf0);
  }
  return uVar1;
}


