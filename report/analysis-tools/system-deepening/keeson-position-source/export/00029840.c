/* Static Ghidra pseudocode; not original source. */

void FUN_00029840(void)

{
  int iVar1;
  undefined1 auStack_30 [24];
  int local_18;
  
  iVar1 = 0;
  while (FUN_00032300(&DAT_20003748,iVar1 * 0x20 + 0x76000,auStack_30,0x20), local_18 != -1) {
    if (100 < local_18) {
      FUN_000320e4(&DAT_20003748,0x76000,1,0);
      goto LAB_000298a4;
    }
    if ((local_18 == -1) || (iVar1 = iVar1 + 1, 99 < iVar1)) break;
  }
  if (iVar1 == 0) {
LAB_000298a4:
    FUN_000264be(&DAT_20003c68,0x20);
  }
  else {
    FUN_00032300(&DAT_20003748,iVar1 * 0x20 + 0x75fe0,auStack_30,0x20);
    FUN_0002648c(&DAT_20003c68,auStack_30,0x20);
  }
  FUN_0002b680();
  return;
}


