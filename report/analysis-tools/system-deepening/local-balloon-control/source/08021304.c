/* Ghidra static pseudocode; not original source. */

void FUN_08021304(void)

{
  char cVar1;
  byte bVar2;
  undefined4 uVar3;
  int iVar4;
  undefined4 uVar5;
  undefined4 uVar6;
  char *pcVar7;
  int iVar8;
  byte bVar9;
  uint uVar10;
  int iVar11;
  uint uVar12;
  int iVar13;
  int iVar14;
  uint uVar15;
  byte bVar16;
  byte *pbVar17;
  uint uVar18;
  char *pcVar19;
  uint uVar20;
  int local_54;
  undefined1 local_50;
  uint local_4c;
  int local_3c;
  int local_2c;
  char local_20 [12];
  
  uVar3 = DAT_2000c408;
  iVar8 = DAT_2000c404;
  if (DAT_2000c404 == 0) {
    return;
  }
  uVar12 = (uint)DAT_2000c415;
  for (uVar10 = 0; (uVar10 & 0xff) < uVar12; uVar10 = uVar10 + 1) {
    iVar13 = (&DAT_2000c3ec)[(byte)(&DAT_2000c410)[uVar10]];
    if ((iVar13 != 0) && (*(char *)(iVar13 + 1) == '\x02')) {
      uVar15 = 0;
      local_54 = 0;
      local_2c = 0x447a0000;
      local_50 = 0;
      local_4c = 0;
      uVar10 = uVar15;
      uVar20 = uVar15;
      goto LAB_080213d4;
    }
  }
  bVar16 = 0;
  if (DAT_2000c4e8 == '\0') {
    local_54 = 0;
    local_50 = 0;
    local_4c = 0;
    bVar16 = 0;
  }
  else {
    FUN_080212dc(DAT_2000c404);
    DAT_2000c508 = '\0';
    DAT_2000c4e8 = '\0';
    local_50 = 0;
    local_4c = 0;
    local_54 = 0;
  }
  goto LAB_0802155c;
LAB_080213d4:
  if (uVar12 <= (uVar15 & 0xff)) goto code_r0x080213dc;
  pbVar17 = (byte *)(&DAT_2000c3ec)[(byte)(&DAT_2000c410)[uVar15]];
  uVar18 = uVar10;
  if ((pbVar17 != (byte *)0x0) && (pbVar17[1] == 2)) {
    bVar16 = *pbVar17;
    uVar5 = FUN_08020a1c(uVar3,(uint)bVar16);
    iVar4 = FUN_0802b814(*(undefined4 *)(pbVar17 + 4),uVar5);
    iVar11 = FUN_0801053c(iVar4,0);
    local_3c = iVar4 + -0x80000000;
    if (iVar11 == 0) {
      local_3c = iVar4;
    }
    bVar2 = pbVar17[0x2c];
    if (uVar10 != 0) {
      if (bVar2 == 1) {
        if (uVar20 == 0) goto LAB_080213b8;
      }
      else {
        uVar18 = uVar20;
        if (uVar20 != 0) goto LAB_080213d2;
      }
      iVar11 = FUN_08010564(local_2c,local_3c);
      uVar18 = uVar10;
      if (iVar11 == 0) goto LAB_080213d2;
    }
LAB_080213b8:
    uVar20 = (uint)(bVar2 == 1);
    local_2c = local_3c;
    local_50 = 1;
    uVar18 = 1;
    local_54 = iVar4;
    local_4c = (uint)bVar16;
  }
LAB_080213d2:
  uVar15 = uVar15 + 1;
  uVar10 = uVar18;
  goto LAB_080213d4;
code_r0x080213dc:
  bVar16 = 0;
  if (uVar10 == 0) goto LAB_0802155c;
  uVar3 = FUN_0801b800((&DAT_2000c3ec)[local_4c]);
  uVar3 = FUN_0802aeb8(uVar3,local_54);
  bVar16 = 100;
  if (DAT_2000c4fe != '\0') {
    iVar4 = FUN_0801053c(uVar3,0);
    uVar5 = uVar3;
    if (iVar4 != 0) {
      uVar5 = 0;
    }
    uVar5 = FUN_0802b598(uVar5,DAT_2000c4f8);
    bVar2 = (byte)DAT_2000c4fc;
    uVar6 = FUN_08026fb0((byte)DAT_2000c4fc);
    iVar4 = FUN_0801053c(uVar5,uVar6);
    bVar16 = DAT_2000c4fc._1_1_;
    if (iVar4 == 0) {
      uVar6 = FUN_08026fb0(DAT_2000c4fc._1_1_);
      iVar4 = FUN_08010564(uVar5,uVar6);
      bVar2 = bVar16;
      if (iVar4 == 0) {
        bVar2 = FUN_08026f80(uVar5);
      }
    }
    iVar4 = FUN_08010578(uVar3,0x3f800000);
    bVar16 = bVar2;
    if (iVar4 == 0) {
      bVar16 = DAT_2000c4fc._1_1_;
      if (0x1e < DAT_2000c4fc._1_1_) {
        bVar16 = 0x1e;
      }
      if (bVar16 < bVar2) {
        bVar16 = bVar2;
      }
    }
  }
  if (DAT_2000c508 == '\0') {
    iVar4 = FUN_0801053c(local_54,0x3f800000);
    if (iVar4 != 0) {
      DAT_2000c508 = '\x01';
      FUN_08021204(iVar8,1,0,0);
      iVar8 = FUN_0801053c(local_54,0);
      pcVar19 = "-";
      if (iVar8 == 0) {
        pcVar19 = "";
      }
      uVar3 = FUN_08016f60(local_54,100);
      uVar5 = FUN_08016f6e(local_54,100);
      pcVar7 = "[scheduler] single-pump mode (error=%s%u.%02u kPa)";
      goto LAB_080214ca;
    }
  }
  else {
    iVar4 = FUN_08010564(local_54,0x3fc00000);
    if (iVar4 != 0) {
      DAT_2000c508 = '\0';
      if (DAT_2000c4e8 != '\0') {
        FUN_08021204(iVar8,1);
      }
      iVar8 = FUN_0801053c(local_54,0);
      pcVar19 = "-";
      if (iVar8 == 0) {
        pcVar19 = "";
      }
      uVar3 = FUN_08016f60(local_54,100);
      uVar5 = FUN_08016f6e(local_54,100);
      pcVar7 = "[scheduler] dual-pump mode (error=%s%u.%02u kPa)";
LAB_080214ca:
      FUN_08017634(pcVar7,pcVar19,uVar3,uVar5);
    }
  }
  cVar1 = DAT_2000c508;
  iVar8 = DAT_2000c404;
  if (DAT_2000c4e8 != '\0') {
    if (DAT_2000c508 == '\0') {
      if (DAT_2000c404 != 0) {
        for (uVar10 = 0; uVar10 < *(byte *)(iVar8 + 0x230); uVar10 = uVar10 + 1 & 0xff) {
          iVar13 = iVar8 + uVar10 * 0x44;
          if ((*(char *)(iVar13 + 0x1c) != '\0') &&
             (*(byte *)(iVar13 + 0x10) = bVar16, *(char *)(iVar13 + 0x30) == '\x03')) {
            FUN_08020fbc(iVar13,bVar16);
          }
        }
      }
    }
    else if ((((DAT_2000c404 != 0) && (*(char *)(DAT_2000c404 + 0x230) != '\0')) &&
             (*(char *)(DAT_2000c404 + 0x1c) != '\0')) &&
            (*(byte *)(DAT_2000c404 + 0x10) = bVar16, *(char *)(iVar8 + 0x30) == '\x03')) {
      FUN_08020fbc(iVar8,bVar16);
    }
    goto LAB_0802155c;
  }
  iVar4 = *(int *)(iVar13 + 0x10);
  iVar13 = 0;
  if (((iVar4 != 0) && (iVar13 = 0, *(char *)(iVar4 + 0xa4) != '\0')) &&
     (*(char *)(iVar4 + 4) != '\0')) {
    iVar11 = *(int *)(iVar4 + 0x18);
    iVar14 = *(int *)(iVar4 + 0x20);
    if (*(char *)(iVar4 + 0x1c) != '\0') {
      iVar13 = FUN_08010274(100);
      iVar13 = iVar13 * iVar11 + iVar14;
    }
  }
  if (cVar1 == '\0') {
    if (iVar8 != 0) {
      bVar2 = *(byte *)(iVar8 + 0x230);
      for (iVar4 = iVar8; (uint)bVar2 * 0x44 + iVar8 != iVar4; iVar4 = iVar4 + 0x44) {
        *(byte *)(iVar4 + 0x10) = bVar16;
      }
      for (bVar2 = 0; bVar2 < *(byte *)(iVar8 + 0x230); bVar2 = bVar2 + 1) {
        FUN_08021204(iVar8,bVar2,1,iVar13);
      }
    }
  }
  else {
    if (((iVar8 != 0) && (*(char *)(iVar8 + 0x230) != '\0')) && (*(char *)(iVar8 + 0x1c) != '\0')) {
      if (bVar16 < 0x65) {
        bVar2 = 0;
        bVar9 = bVar16;
        if (bVar16 != 0) goto LAB_0802166e;
      }
      else {
        bVar9 = 100;
LAB_0802166e:
        bVar2 = *(byte *)(iVar8 + 0xc);
        if ((bVar2 <= bVar9) && (bVar2 = *(byte *)(iVar8 + 0xd), bVar9 < *(byte *)(iVar8 + 0xd))) {
          bVar2 = bVar9;
        }
      }
      *(byte *)(iVar8 + 0x10) = bVar2;
    }
    FUN_08021204(iVar8,0,1,iVar13);
  }
  DAT_2000c4e8 = '\x01';
LAB_0802155c:
  FUN_0801066c(local_20,0,5);
  for (uVar10 = 0; (uVar10 & 0xff) < (uint)DAT_2000c415; uVar10 = uVar10 + 1) {
    uVar12 = (uint)(byte)(&DAT_2000c410)[uVar10];
    if (((uVar12 < 5) && ((&DAT_2000c3ec)[uVar12] != 0)) &&
       (*(char *)((&DAT_2000c3ec)[uVar12] + 1) == '\x02')) {
      local_20[uVar12] = '\x01';
    }
  }
  iVar8 = 0;
  do {
    if ((&DAT_2000c3ec)[iVar8] != 0) {
      *(byte *)((&DAT_2000c3ec)[iVar8] + 0x24) = -('\x01' - (local_20[iVar8] == '\0')) & bVar16;
    }
    iVar8 = iVar8 + 1;
  } while (iVar8 != 5);
  DAT_2000c505 = local_50;
  DAT_2000c504 = (char)local_4c;
  DAT_2000c500 = local_54;
  return;
}


