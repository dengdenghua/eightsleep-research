/* Static Ghidra pseudocode; not original source. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void vector_handler_33(void)

{
  uint uVar1;
  uint *puVar2;
  uint *puVar3;
  uint uVar4;
  int iVar5;
  bool bVar6;
  
  _DAT_40011140 = 0;
  _DAT_40011144 = 0;
  _DAT_40011148 = 0;
  _DAT_4001114c = 0;
  _DAT_40011100 = 0;
  _DAT_40011104 = 0;
  if (DAT_20003674 == (uint *)0x0) {
    return;
  }
  iVar5 = 0;
  uVar4 = _DAT_40011504 - DAT_20003678 & 0xffffff;
  puVar2 = DAT_20003674;
  do {
    uVar1 = *puVar2;
    if (uVar4 < uVar1) break;
    uVar4 = uVar4 - uVar1;
    iVar5 = iVar5 + uVar1;
    puVar3 = (uint *)puVar2[7];
    if ((char)puVar2[4] != '\0') {
      *(undefined1 *)(puVar2 + 4) = 0;
      (*(code *)puVar2[5])(puVar2[6]);
    }
    puVar2 = puVar3;
  } while (puVar3 != (uint *)0x0);
  if ((DAT_20003670 == DAT_20003671) &&
     (bVar6 = DAT_20003671 == 1, DAT_20003671 = DAT_20003671 + 1, bVar6)) {
    DAT_20003671 = 0;
  }
  (&DAT_2000367c)[DAT_20003671] = iVar5;
  FUN_0002c406(0x14);
  return;
}


