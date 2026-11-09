/* Static Ghidra pseudocode; not original source. */

void thunk_FUN_00036080(void)

{
  uint *puVar1;
  int iVar2;
  int iVar3;
  uint *puVar4;
  uint uVar5;
  uint in_r3;
  uint *puVar6;
  uint uVar7;
  uint uStack_28;
  
  iVar3 = DAT_20003678;
  puVar1 = DAT_20003674;
  uStack_28 = in_r3;
  iVar2 = FUN_0002f63c(&uStack_28);
  if (iVar2 == 0) {
    iVar3 = FUN_000307f8(0);
    if (iVar3 == 0) {
      DAT_20003673 = 0;
      return;
    }
  }
  else {
    iVar2 = 0;
    puVar4 = DAT_20003674;
    uVar5 = uStack_28;
    puVar6 = (uint *)0x0;
    while (DAT_20003674 = puVar4, DAT_20003674 != (uint *)0x0) {
      uVar7 = *DAT_20003674;
      if (uVar5 < uVar7) {
        *DAT_20003674 = uVar7 - uVar5;
        break;
      }
      uVar5 = uVar5 - uVar7;
      iVar2 = iVar2 + uVar7;
      *DAT_20003674 = 0;
      puVar4 = (uint *)DAT_20003674[7];
      if (DAT_20003674[3] != 0) {
        DAT_20003674[1] = iVar3 + iVar2 & 0xffffff;
        DAT_20003674[2] = DAT_20003674[3];
        DAT_20003674[7] = (uint)puVar6;
        puVar6 = DAT_20003674;
      }
    }
    FUN_000307f8(puVar6);
  }
  FUN_0002efbc(puVar1);
  DAT_20003673 = 0;
  return;
}


