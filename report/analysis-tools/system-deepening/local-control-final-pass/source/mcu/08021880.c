/* Ghidra static pseudocode; not original source. */

void FUN_08021880(void)

{
  int iVar1;
  undefined4 uVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  undefined1 uVar9;
  byte bVar10;
  uint uVar11;
  uint uVar12;
  undefined1 *puVar13;
  uint uVar14;
  undefined1 auStack_424 [8];
  int local_41c;
  undefined1 auStack_418 [1028];
  
  uVar14 = 0;
  puVar13 = &DAT_2000bbe8;
  uVar11 = (uint)DAT_2000bf84;
  for (uVar12 = 0; (uVar12 != uVar11 << 1 && (uVar12 != 0x10)); uVar12 = uVar12 + 2) {
    iVar1 = FUN_0802186e(puVar13 + -0x50);
    if (iVar1 != 0) {
      uVar14 = uVar14 | 1 << (uVar12 & 0xff) & 0xffffU;
    }
    iVar1 = FUN_0802186e(puVar13);
    if (iVar1 != 0) {
      uVar14 = uVar14 | 1 << (uVar12 + 1 & 0xff) & 0xffffU;
    }
    puVar13 = puVar13 + 0xa8;
  }
  uVar11 = (uint)DAT_2000cd74;
  iVar1 = FUN_08016fe0(&DAT_2000cd88);
  if ((uVar11 != uVar14) || (iVar1 != 0)) {
    iVar1 = FUN_0801f0a0(auStack_424,auStack_418,3);
    uVar2 = FUN_08011424();
    iVar3 = FUN_08016b52(auStack_424,uVar2);
    iVar4 = FUN_08016b52(auStack_424,uVar11 ^ uVar14);
    iVar5 = FUN_08016c1a(auStack_424);
    puVar13 = &DAT_2000bbe4;
    iVar1 = (uint)(iVar5 == 0) + (uint)(iVar3 == 0) + (uint)(iVar4 == 0) + iVar1;
    bVar10 = 0;
    while( true ) {
      if (DAT_2000bf84 <= bVar10) break;
      iVar3 = FUN_08016c1a(auStack_424);
      uVar2 = FUN_0802186e(puVar13 + -0x4c);
      iVar4 = FUN_08016b52(auStack_424,uVar2);
      uVar9 = 0;
      if (puVar13[-0x4c] != '\0') {
        uVar9 = *puVar13;
      }
      iVar5 = FUN_08016b52(auStack_424,uVar9);
      uVar2 = FUN_0802186e(puVar13 + 4);
      iVar6 = FUN_08016b52(auStack_424,uVar2);
      uVar9 = 0;
      if (puVar13[4] != '\0') {
        uVar9 = puVar13[0x50];
      }
      iVar7 = FUN_08016b52(auStack_424,uVar9);
      iVar8 = FUN_08016c58(auStack_424);
      iVar1 = (uint)(iVar8 == 0) +
              (uint)(iVar7 == 0) +
              (uint)(iVar6 == 0) +
              (uint)(iVar5 == 0) + (uint)(iVar3 == 0) + (uint)(iVar4 == 0) + iVar1;
      bVar10 = bVar10 + 1;
      puVar13 = puVar13 + 0xa8;
    }
    iVar3 = FUN_08016c58(auStack_424);
    iVar4 = FUN_0801f0f0(auStack_424);
    if ((uint)(iVar3 == 0) + iVar1 + iVar4 == 0) {
      iVar1 = FUN_08017604(auStack_418,local_41c + 1);
      if (iVar1 != 0) {
        DAT_2000cd74 = (ushort)uVar14;
      }
    }
    else {
      FUN_08017634("[telemetry] solenoid state did not fit, %u writes dropped");
    }
  }
  return;
}


