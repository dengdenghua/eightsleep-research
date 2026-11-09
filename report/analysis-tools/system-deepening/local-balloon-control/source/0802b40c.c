/* Ghidra static pseudocode; not original source. */

uint FUN_0802b40c(uint param_1,uint param_2)

{
  uint uVar1;
  uint uVar2;
  uint uVar3;
  uint uVar4;
  
  uVar4 = param_1 & 0x7fffff;
  uVar2 = (param_1 & 0x7fffffff) >> 0x17;
  uVar3 = (param_2 & 0x7fffffff) >> 0x17;
  if (uVar2 == 0xff) {
    uVar1 = 1;
    if ((uVar3 == 0xff) && (uVar4 == 0 && (param_2 & 0x7fffff) == 0)) {
      uVar1 = (param_1 ^ param_2) >> 0x1f;
    }
  }
  else if (uVar3 == 0xff) {
    uVar1 = 1;
  }
  else {
    uVar1 = 1;
    if ((uVar2 == uVar3) && (uVar4 == (param_2 & 0x7fffff))) {
      if (-((int)param_1 >> 0x1f) == -((int)param_2 >> 0x1f)) {
        uVar1 = 0;
      }
      else if (uVar2 == 0) {
        uVar1 = (uint)(uVar4 != 0);
      }
    }
  }
  return uVar1;
}


