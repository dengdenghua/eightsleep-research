/* Static Ghidra pseudocode; not original source. */

void FUN_00029d2c(void)

{
  int iVar1;
  undefined4 in_r3;
  uint uVar2;
  undefined4 local_10;
  
  uVar2 = 0;
  local_10 = in_r3;
  iVar1 = FUN_00033954();
  if (iVar1 != 0) {
    FUN_00026218(iVar1,0x58,"..\\..\\..\\OKIN_drive_pulse.c");
  }
  local_10 = 0x20002;
  do {
    FUN_00033884((&DAT_20003539)[uVar2],&local_10,0x303b1);
    uVar2 = uVar2 + 1 & 0xff;
  } while (uVar2 < 4);
  uVar2 = 0;
  do {
    FUN_000337e0((&DAT_20003539)[uVar2],1);
    uVar2 = uVar2 + 1 & 0xff;
  } while (uVar2 < 4);
  return;
}


