/* Static Ghidra pseudocode; not original source. */

void FUN_0002b6a8(void)

{
  bool bVar1;
  uint uVar2;
  int iVar3;
  
  uVar2 = 0;
  bVar1 = false;
  do {
    (&DAT_20003c68)[uVar2] = (&DAT_20003bc8)[uVar2 * 10];
    if ((&DAT_20003be1)[uVar2 * 0x28] != '\x02') {
      bVar1 = true;
    }
    uVar2 = uVar2 + 1 & 0xff;
  } while (uVar2 < 4);
  if ((!bVar1 && DAT_200030f9 == '\0') &&
     (iVar3 = FUN_0002f28c(0xffffffff,&DAT_20003c68,0x18), DAT_20003c84 != iVar3)) {
    DAT_20003fc0 = 0;
    DAT_20003c84 = iVar3;
  }
  return;
}


