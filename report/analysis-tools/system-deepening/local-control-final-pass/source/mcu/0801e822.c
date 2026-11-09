/* Ghidra static pseudocode; not original source. */

int FUN_0801e822(int param_1,uint param_2)

{
  int iVar1;
  
  iVar1 = param_1 + 0x3c;
  if (param_2 != 8) {
    if (param_2 < 9) {
      if (param_2 == 0) {
        return param_1 + 0x34;
      }
      if (param_2 == 4) {
        return param_1 + 0x38;
      }
    }
    else if (param_2 == 0xc) {
      return param_1 + 0x40;
    }
    iVar1 = 0;
  }
  return iVar1;
}


