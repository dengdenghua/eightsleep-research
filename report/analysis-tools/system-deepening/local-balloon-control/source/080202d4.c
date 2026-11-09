/* Ghidra static pseudocode; not original source. */

bool FUN_080202d4(char *param_1)

{
  bool bVar1;
  
  bVar1 = false;
  if ((param_1 != (char *)0x0) && (bVar1 = false, *param_1 != '\0')) {
    bVar1 = (byte)(param_1[0x1ec] - 1U) < 2;
  }
  return bVar1;
}


