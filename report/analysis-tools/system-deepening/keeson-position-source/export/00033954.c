/* Static Ghidra pseudocode; not original source. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined4 FUN_00033954(void)

{
  uint uVar1;
  uint uVar2;
  byte bVar3;
  
  if (DAT_2000536a != '\0') {
    return 8;
  }
  uVar1 = 0;
  do {
    uVar2 = uVar1 + 1 & 0xff;
    (&DAT_20005340)[uVar1] = 0xff;
    uVar1 = uVar2;
  } while (uVar2 < 0x20);
  bVar3 = 0;
  do {
    FUN_0002ec34(bVar3);
    bVar3 = bVar3 + 1;
  } while (bVar3 < 0xe);
  DAT_20005366 = 0;
  DAT_e000e406 = 0xc0;
  _DAT_e000e280 = 0x40;
  _DAT_e000e100 = 0x40;
  FUN_00032854(0x17c);
  _DAT_40006304 = 0x80000000;
  DAT_2000536a = 1;
  return 0;
}


