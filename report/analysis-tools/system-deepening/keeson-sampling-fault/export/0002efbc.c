/* Static Ghidra pseudocode; not original source. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_0002efbc(void)

{
  int iVar1;
  int iVar2;
  uint uVar3;
  uint uVar4;
  
  iVar2 = _DAT_40011504;
  iVar1 = DAT_20003678;
  if (DAT_20003674 == (uint *)0x0) {
    FUN_0003573c();
    return;
  }
  uVar4 = *DAT_20003674;
  uVar3 = (_DAT_40011504 - DAT_20003678 & 0xffffffU) + 3;
  if (DAT_20003672 == '\0') {
    _DAT_40011344 = 0x10000;
    _DAT_40011304 = 0x10000;
    FUN_0002c348(0x11);
    FUN_0002c3b8(0x11);
    _DAT_40011000 = 1;
    FUN_000337d0(0x2f);
    DAT_20003672 = '\x01';
  }
  if (uVar3 < uVar4) {
    uVar3 = uVar4;
  }
  _DAT_40011540 = uVar3 + iVar1 & 0xffffff;
  if ((_DAT_40011540 - iVar2 & 0xffffff) < (_DAT_40011504 - iVar2 & 0xffffffU) + 3) {
    _DAT_40011540 = _DAT_40011504;
    FUN_000337d0(0x2f);
    FUN_0002c406(0x11);
    return;
  }
  return;
}


