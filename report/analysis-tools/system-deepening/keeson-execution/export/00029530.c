/* Static Ghidra pseudocode; not original source. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined4 thunk_FUN_00033df0(int param_1,undefined4 param_2)

{
  undefined4 uVar1;
  int iVar2;
  int iVar3;
  uint uVar4;
  
  if (DAT_200053cc == '\0') {
    DAT_200053cc = 1;
    _DAT_40007308 = 3;
    FUN_00033178(param_2,1);
    if (1 < DAT_200053e9) {
      uVar4 = 0;
      do {
        FUN_00033188(uVar4 & 0xff,0);
        uVar4 = uVar4 + 1;
      } while (uVar4 < 8);
    }
    FUN_00033188(param_1,(&DAT_200053d8)[param_1 * 2],(&DAT_200053d9)[param_1 * 2]);
    uVar1 = 0;
    _DAT_40007000 = 1;
    _DAT_40007004 = 1;
    iVar3 = 10000;
    do {
      iVar2 = FUN_0003319c(0x104);
      if (iVar2 != 0) break;
      FUN_000337c0(0);
      iVar3 = iVar3 + -1;
    } while (iVar3 != 0);
    FUN_000331ac(0x100);
    FUN_000331ac(0x104);
    if (1 < DAT_200053e9) {
      uVar4 = 0;
      do {
        FUN_00033188(uVar4 & 0xff,(&DAT_200053d8)[uVar4 * 2],(&DAT_200053d9)[uVar4 * 2]);
        uVar4 = uVar4 + 1;
      } while (uVar4 < 8);
    }
    if (DAT_200053ea == '\0') {
      _DAT_40007304 = 2;
    }
    else {
      _DAT_40007304 = 3;
    }
    DAT_200053cc = '\0';
  }
  else {
    uVar1 = 0x11;
  }
  return uVar1;
}


