/* Ghidra static pseudocode; not original source. */

void FUN_08020a3c(void)

{
  int iVar1;
  undefined4 uVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  int iVar9;
  int iVar10;
  int iVar11;
  int iVar12;
  int iVar13;
  int iVar14;
  int iVar15;
  undefined1 uVar16;
  byte bVar17;
  uint uVar18;
  byte bVar19;
  uint uVar20;
  undefined *puVar21;
  byte bVar22;
  undefined1 uVar23;
  undefined1 *puVar24;
  undefined1 auStack_424 [8];
  int local_41c;
  undefined1 auStack_418 [1028];
  
  iVar1 = FUN_08016fe0(&DAT_2000cd80);
  if (iVar1 != 0) {
    bVar19 = DAT_2000cea3;
    if (5 < DAT_2000cea3) {
      bVar19 = 5;
    }
    iVar1 = FUN_0801f0a0(auStack_424,auStack_418,0);
    uVar2 = FUN_08011424();
    iVar3 = FUN_08016b52(auStack_424,uVar2);
    iVar4 = FUN_08016b52(auStack_424,DAT_2000c3e8);
    uVar18 = 0;
    for (uVar20 = 0; (uVar20 & 0xff) < (uint)DAT_2000c415; uVar20 = uVar20 + 1) {
      if ((byte)(&DAT_2000c410)[uVar20] < 8) {
        uVar18 = uVar18 | 1 << (uint)(byte)(&DAT_2000c410)[uVar20] & 0xffU;
      }
    }
    iVar5 = FUN_08016b52(auStack_424,uVar18);
    uVar2 = FUN_0801f338();
    iVar6 = FUN_08016b52(auStack_424,uVar2);
    iVar7 = FUN_08016b52(auStack_424,bVar19);
    iVar8 = FUN_08016b52(auStack_424,DAT_2000c514);
    iVar9 = FUN_08016b64(auStack_424,DAT_2000c4e8);
    iVar10 = FUN_08016b64(auStack_424,DAT_2000c508);
    iVar11 = FUN_08016b52(auStack_424,DAT_2000c4fc._1_1_);
    iVar12 = FUN_08016c1a(auStack_424);
    puVar24 = &DAT_2000b96f;
    iVar1 = (uint)(iVar12 == 0) +
            (uint)(iVar11 == 0) +
            (uint)(iVar10 == 0) +
            (uint)(iVar9 == 0) +
            (uint)(iVar8 == 0) +
            (uint)(iVar7 == 0) +
            (uint)(iVar6 == 0) +
            (uint)(iVar5 == 0) + (uint)(iVar3 == 0) + (uint)(iVar4 == 0) + iVar1;
    for (bVar22 = 0; (bVar22 < DAT_2000bb90 && (bVar22 != 4)); bVar22 = bVar22 + 1) {
      uVar16 = 0;
      if (puVar24[0xd] != '\0') {
        uVar16 = *puVar24;
      }
      iVar3 = FUN_08016b52(auStack_424,uVar16);
      iVar1 = iVar1 + (uint)(iVar3 == 0);
      puVar24 = puVar24 + 0x44;
    }
    iVar3 = FUN_08016c58(auStack_424);
    iVar4 = FUN_08016c1a(auStack_424);
    iVar1 = (uint)(iVar3 == 0) + (uint)(iVar4 == 0) + iVar1;
    puVar21 = &DAT_2000bf88;
    for (bVar22 = 0; bVar19 != bVar22; bVar22 = bVar22 + 1) {
      iVar3 = FUN_08016c1a();
      iVar4 = FUN_08016b80(auStack_424,*(undefined4 *)(puVar21 + 4));
      uVar2 = FUN_08020a1c(DAT_2000c408,bVar22);
      iVar5 = FUN_08016b80(auStack_424,uVar2);
      bVar17 = puVar21[1];
      if (7 < bVar17) {
        bVar17 = 0xff;
      }
      iVar6 = FUN_08016b52(auStack_424,bVar17);
      iVar7 = FUN_08016b52(auStack_424,puVar21[0xa1]);
      iVar8 = FUN_08016b52(auStack_424,puVar21[0xa2]);
      iVar9 = FUN_08016b80(auStack_424,*(undefined4 *)(puVar21 + 0xc));
      iVar10 = FUN_08016b80(auStack_424,*(undefined4 *)(puVar21 + 200));
      uVar2 = FUN_0801b824(puVar21);
      iVar11 = FUN_08016b80(auStack_424,uVar2);
      uVar2 = FUN_0801b7b8(puVar21);
      iVar12 = FUN_08016b80(auStack_424,uVar2);
      iVar14 = FUN_08016b64(auStack_424,puVar21[0x2e]);
      iVar15 = FUN_08016c58(auStack_424);
      iVar1 = (uint)(iVar15 == 0) +
              (uint)(iVar14 == 0) +
              (uint)(iVar12 == 0) +
              (uint)(iVar11 == 0) +
              (uint)(iVar10 == 0) +
              (uint)(iVar9 == 0) +
              (uint)(iVar8 == 0) +
              (uint)(iVar7 == 0) +
              (uint)(iVar6 == 0) +
              (uint)(iVar5 == 0) + (uint)(iVar3 == 0) + (uint)(iVar4 == 0) + iVar1;
      puVar21 = puVar21 + 0xe0;
    }
    iVar3 = FUN_08016c58(auStack_424);
    uVar2 = DAT_2000c500;
    uVar23 = DAT_2000c505;
    uVar16 = DAT_2000c504;
    if (DAT_2000c3e8 != '\x02') {
      uVar2 = 0;
      uVar23 = 0;
      uVar16 = 0;
    }
    iVar4 = FUN_08016c1a(auStack_424);
    iVar5 = FUN_08016b64(auStack_424,uVar23);
    iVar6 = FUN_08016b52(auStack_424,uVar16);
    iVar7 = FUN_08016b80(auStack_424,uVar2);
    iVar8 = FUN_08016c58(auStack_424);
    iVar9 = FUN_08011424();
    iVar10 = FUN_08016c1a(auStack_424);
    uVar16 = 4;
    if ((char)DAT_2000c538 != '\0') {
      uVar16 = DAT_2000c724;
    }
    iVar12 = FUN_08016b52(auStack_424,uVar16);
    iVar14 = FUN_08016b80(auStack_424,DAT_2000c728);
    iVar15 = FUN_080202d4(&DAT_2000c538);
    iVar11 = 0;
    if (iVar15 != 0) {
      iVar11 = iVar9 - DAT_2000c72c;
    }
    iVar9 = FUN_08016b52(auStack_424,iVar11);
    iVar11 = FUN_08016b52(auStack_424,DAT_2000c738);
    iVar15 = FUN_08016c58(auStack_424);
    iVar13 = FUN_0801f0f0(auStack_424);
    if ((uint)(iVar9 == 0) +
        (uint)(iVar14 == 0) +
        (uint)(iVar12 == 0) +
        (uint)(iVar10 == 0) +
        (uint)(iVar8 == 0) +
        (uint)(iVar7 == 0) +
        (uint)(iVar6 == 0) + (uint)(iVar5 == 0) + (uint)(iVar4 == 0) + (uint)(iVar3 == 0) + iVar1 +
        iVar13 + (uint)(iVar11 == 0) + (uint)(iVar15 == 0) == 0) {
      FUN_08017604(auStack_418,local_41c + 1);
    }
    else {
      FUN_08017634("[telemetry] enhanced payload did not fit, %u writes dropped");
    }
  }
  return;
}


