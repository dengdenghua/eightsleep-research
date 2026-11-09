/* Ghidra static pseudocode; not original source. */

uint FUN_08026fb0(uint param_1)

{
  int iVar1;
  uint uVar2;
  uint uVar3;
  
  if (param_1 == 0) {
    uVar3 = 0;
    param_1 = 0;
  }
  else {
    iVar1 = FUN_080104dc();
    uVar3 = 0x9e - iVar1;
    if ((int)uVar3 < 0x97) {
      if (iVar1 == 8) {
        uVar3 = 0x96;
        param_1 = param_1 & 0x7fffff;
      }
      else {
        param_1 = param_1 << (iVar1 - 8U & 0xff) & 0x7fffff;
        uVar3 = uVar3 & 0xff;
      }
    }
    else {
      if ((int)uVar3 < 0x9a) {
        if (iVar1 != 5) {
          param_1 = param_1 << (iVar1 - 5U & 0xff);
        }
      }
      else {
        param_1 = param_1 >> (5U - iVar1 & 0xff) | (uint)(param_1 << (iVar1 + 0x1bU & 0xff) != 0);
      }
      uVar2 = param_1 & 0xfbffffff;
      if ((((param_1 & 7) != 0) && ((param_1 & 0xf) != 4)) &&
         (uVar2 = uVar2 + 4, (int)(uVar2 * 0x20) < 0)) {
        uVar2 = uVar2 & 0xfbffffff;
        uVar3 = 0x9f - iVar1;
      }
      param_1 = (uVar2 & 0x3ffffff) >> 3;
      uVar3 = uVar3 & 0xff;
    }
  }
  return uVar3 << 0x17 | param_1;
}


