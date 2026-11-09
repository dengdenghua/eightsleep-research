/* Static Ghidra pseudocode; not original source. */

void FUN_00029500(void)

{
  int iVar1;
  int iVar2;
  uint uVar3;
  
  uVar3 = 0;
  do {
    FUN_0002afdc(uVar3 & 0xff,2);
    uVar3 = uVar3 + 1;
  } while ((int)uVar3 < 4);
  FUN_00029d00();
  iVar1 = 0;
  do {
    iVar2 = iVar1 + 1;
    (&DAT_20003f78)[iVar1] = 100;
    iVar1 = iVar2;
  } while (iVar2 < 4);
  return;
}


