/* Ghidra static pseudocode; not original source. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_001c1810(undefined8 param_1,long *param_2,undefined8 param_3)

{
  long *plVar1;
  uint uVar2;
  undefined *puVar3;
  undefined1 *puVar4;
  char cVar5;
  int iVar6;
  undefined4 uVar7;
  undefined1 *puVar8;
  ulong uVar9;
  long lVar10;
  void *pvVar11;
  byte bVar12;
  undefined1 uVar13;
  long lVar14;
  undefined8 *puVar15;
  long lVar16;
  undefined8 uVar17;
  undefined8 uVar18;
  long lVar19;
  long *plVar20;
  undefined **ppuVar21;
  uint *puVar22;
  short *psVar23;
  long *unaff_x26;
  long *plVar24;
  long *plVar25;
  long *unaff_x27;
  undefined8 uVar26;
  undefined8 uVar27;
  long lVar28;
  undefined8 uVar29;
  long lVar30;
  undefined8 uVar31;
  long lVar32;
  long lVar33;
  long lVar34;
  long lVar35;
  long lVar36;
  long lVar37;
  long lVar38;
  long lVar39;
  undefined1 auVar40 [16];
  undefined1 auVar41 [12];
  undefined1 auStack_7060 [28672];
  
  puVar8 = &stack0xffffffffffffffa0;
  do {
    puVar4 = puVar8;
    *(undefined8 *)(puVar4 + -0x1000) = 0;
    puVar8 = puVar4 + -0x1000;
  } while (puVar4 + -0x1000 != auStack_7060);
  *(undefined8 *)(puVar4 + -0x1600) = 0;
  bVar12 = *(byte *)(param_2 + 0x9b);
  plVar1 = (long *)(puVar4 + 0x3d10);
  *(undefined8 *)(puVar4 + -0x15c8) = param_1;
  if (4 < bVar12) {
    if (bVar12 == 5) goto LAB_001c273c;
    if (bVar12 != 6) goto LAB_001c3e8c;
    bVar12 = *(byte *)(param_2 + 0x1d6);
    if (2 < bVar12) {
      if (bVar12 != 3) goto LAB_001c2b28;
      lVar19 = param_2[0x50c];
      goto joined_r0x001c18b8;
    }
    if (bVar12 == 0) {
      lVar10 = param_2[0x135];
      lVar19 = param_2[0x133];
      uVar2 = *(uint *)(param_2 + 0x134);
      unaff_x27 = (long *)param_2[0x136];
      goto LAB_001c2808;
    }
    if (bVar12 != 1) {
                    /* WARNING: Subroutine does not return */
      FUN_00191a54(&PTR_s__project_rawrs_src_raw_uploader__009bd4d0);
    }
                    /* WARNING: Subroutine does not return */
    FUN_00191a20(&PTR_s__project_rawrs_src_raw_uploader__009bd4d0);
  }
  if (bVar12 < 3) {
    if (bVar12 == 0) {
      param_2[1] = 0;
      goto LAB_001c26b0;
    }
    if (bVar12 != 1) {
                    /* WARNING: Subroutine does not return */
      FUN_00191a54(&PTR_s__project_rawrs_src_raw_uploader__009bda30);
    }
                    /* WARNING: Subroutine does not return */
    FUN_00191a20();
  }
  if (bVar12 != 3) {
    bVar12 = *(byte *)((long)param_2 + 0x522);
    *(long *)(puVar4 + -0x15a0) = (long)param_2 + 0x522;
    if (2 < bVar12) {
      if (bVar12 != 3) {
        bVar12 = *(byte *)((long)param_2 + 0xe81);
        if (4 < bVar12) goto LAB_001c3278;
        goto LAB_001c1938;
      }
      lVar19 = param_2[0x1f8];
      goto joined_r0x001c18f8;
    }
    if (bVar12 != 0) {
      *(long **)(puVar4 + -0x15d0) = param_2 + 0x9c;
      if (bVar12 != 1) {
                    /* WARNING: Subroutine does not return */
        FUN_00191a54(&PTR_s__project_rawrs_src_raw_uploader__009bd3f0);
      }
                    /* WARNING: Subroutine does not return */
      FUN_00191a20(&PTR_s__project_rawrs_src_raw_uploader__009bd3f0);
    }
    lVar19 = param_2[0xa2];
    plVar20 = (long *)param_2[0xa3];
    goto LAB_001c2f34;
  }
LAB_001c2d54:
  FUN_001bfdfc(puVar4 + 0x3d10,param_2 + 0x9c,param_3);
  lVar19 = *(long *)(puVar4 + 0x3d10);
  if (lVar19 == 0x10) {
    **(undefined8 **)(puVar4 + -0x15c8) = 0x10;
    uVar13 = 3;
LAB_001c4264:
    *(undefined1 *)(param_2 + 0x9b) = uVar13;
    return;
  }
  cVar5 = *(char *)((long)param_2 + 0x4f9);
  *(undefined8 *)(puVar4 + 0x2378) = *(undefined8 *)(puVar4 + 0x3d20);
  *(undefined8 *)(puVar4 + 0x2370) = *(undefined8 *)(puVar4 + 0x3d18);
  *(undefined8 *)(puVar4 + 0x2388) = *(undefined8 *)(puVar4 + 0x3d30);
  *(undefined8 *)(puVar4 + 0x2380) = *(undefined8 *)(puVar4 + 0x3d28);
  *(undefined8 *)(puVar4 + 0x2398) = *(undefined8 *)(puVar4 + 0x3d40);
  *(undefined8 *)(puVar4 + 0x2390) = *(undefined8 *)(puVar4 + 0x3d38);
  *(undefined8 *)(puVar4 + 0x23a0) = *(undefined8 *)(puVar4 + 0x3d48);
  if (cVar5 == '\x05') {
    if (*(char *)((long)param_2 + 0xb81) == '\x03') {
      FUN_001a43d0(param_2 + 0xa4);
    }
  }
  else if (((cVar5 == '\x04') || (cVar5 == '\x03')) && ((char)param_2[0x307] == '\x03')) {
    FUN_001ad200(param_2 + 0xa3);
  }
  puVar3 = PTR_PTR_009fa838;
  if (lVar19 != 0xf) {
    *(long *)(puVar4 + 0x3d10) = lVar19;
    *(undefined8 *)(puVar4 + 0x3d20) = *(undefined8 *)(puVar4 + 0x2378);
    *(undefined8 *)(puVar4 + 0x3d18) = *(undefined8 *)(puVar4 + 0x2370);
    *(undefined8 *)(puVar4 + 0x3d30) = *(undefined8 *)(puVar4 + 0x2388);
    *(undefined8 *)(puVar4 + 0x3d28) = *(undefined8 *)(puVar4 + 0x2380);
    *(undefined8 *)(puVar4 + 0x3d40) = *(undefined8 *)(puVar4 + 0x2398);
    *(undefined8 *)(puVar4 + 0x3d38) = *(undefined8 *)(puVar4 + 0x2390);
    *(undefined8 *)(puVar4 + 0x3d48) = *(undefined8 *)(puVar4 + 0x23a0);
    if ((*(ulong *)PTR_DAT_009fac58 < 4) &&
       ((((byte)PTR_PTR_009fa838[0x10] - 1 < 2 ||
         (((byte)PTR_PTR_009fa838[0x10] != 0 &&
          (cVar5 = FUN_0018fb0c(PTR_PTR_009fa838), cVar5 != '\0')))) &&
        (uVar9 = FUN_007243f8(*(undefined8 *)puVar3), (uVar9 & 1) != 0)))) {
      lVar19 = *(long *)puVar3;
      if (*(long *)(lVar19 + 0x38) == 0) {
                    /* WARNING: Subroutine does not return */
        FUN_0019151c(&DAT_0077e2f7,0x22,&PTR_s__project_rawrs_src_raw_uploader__009bda78);
      }
      *(long *)(puVar4 + 0x56f0) = *(long *)(lVar19 + 0x38);
      uVar17 = *(undefined8 *)(lVar19 + 0x30);
      uVar18 = *(undefined8 *)(lVar19 + 0x48);
      uVar26 = *(undefined8 *)(lVar19 + 0x40);
      *(undefined8 *)(puVar4 + 0x5708) = 0;
      *(undefined8 *)(puVar4 + 0x56e8) = uVar17;
      *(undefined8 *)(puVar4 + 0x5700) = uVar18;
      *(undefined8 *)(puVar4 + 0x56f8) = uVar26;
      *(undefined1 **)(puVar4 + -0x1598) = puVar4 + 0x3d10;
      *(code **)(puVar4 + -0x1590) = FUN_001afd90;
      *(undefined ***)(puVar4 + 0x210) = &PTR_DAT_009bda90;
      *(undefined1 **)(puVar4 + 0x220) = puVar4 + -0x1598;
      *(undefined8 *)(puVar4 + 0x218) = 2;
      *(undefined1 **)(puVar4 + -0x780) = puVar4 + 0x56e8;
      *(undefined **)(puVar4 + -0x770) = &DAT_009bb780;
      *(undefined8 *)(puVar4 + 0x230) = 0;
      *(undefined8 *)(puVar4 + 0x228) = 1;
      *(undefined1 **)(puVar4 + -0x778) = puVar4 + 0x210;
      *(undefined1 **)(puVar4 + 0xca8) = puVar4 + -0x780;
      *(undefined8 *)(puVar4 + 0xcb0) = 1;
      *(undefined8 **)(puVar4 + 0xcb8) = (undefined8 *)(lVar19 + 0x30);
      FUN_00724b8c(lVar19,puVar4 + 0xca8);
    }
    FUN_001a7064(puVar4 + 0x3d10);
  }
  lVar19 = *param_2;
LAB_001c2f18:
  plVar20 = param_2 + 1;
  param_2[0xa2] = lVar19;
  param_2[0xa3] = (long)plVar20;
  *(long *)(puVar4 + -0x15a0) = (long)param_2 + 0x522;
  *(undefined1 *)((long)param_2 + 0x522) = 0;
LAB_001c2f34:
  *(undefined2 *)(param_2 + 0xa4) = 0;
  plVar24 = param_2 + 0x9c;
  *plVar24 = (long)plVar20;
  puVar3 = PTR_PTR_009fa640;
  if (((2 < *(ulong *)PTR_DAT_009fac58) ||
      ((1 < (byte)PTR_PTR_009fa640[0x10] - 1 &&
       (((byte)PTR_PTR_009fa640[0x10] == 0 ||
        (cVar5 = FUN_0018fb0c(PTR_PTR_009fa640), cVar5 == '\0')))))) ||
     (uVar9 = FUN_007243f8(*(undefined8 *)puVar3), (uVar9 & 1) == 0)) {
    param_2[0xa1] = 0;
    *(undefined1 *)(param_2 + 0xa4) = 1;
    *(undefined1 *)((long)param_2 + 0x521) = 1;
    param_2[0x9d] = 2;
    *(long *)(puVar4 + 0xb58) = param_2[0x9c];
    *(long *)(puVar4 + 0xb50) = lVar19;
    puVar4[0xb61] = 0;
LAB_001c3250:
    *(undefined1 *)((long)param_2 + 0x521) = 0;
    memcpy(param_2 + 0xa6,puVar4 + 0x210,0xa90);
    bVar12 = *(byte *)((long)param_2 + 0xe81);
    if (bVar12 < 5) {
LAB_001c1938:
      puVar22 = (uint *)(param_2 + 0xa6);
      plVar20 = param_2 + 0x9c;
      if (bVar12 < 3) {
        if (bVar12 != 0) {
          *(uint **)(puVar4 + -0x15a8) = puVar22;
          *(long **)(puVar4 + -0x15d0) = plVar20;
          if (bVar12 != 1) {
                    /* WARNING: Subroutine does not return */
            FUN_00191a54(&PTR_s__project_rawrs_src_raw_uploader__009bd3b8);
          }
                    /* WARNING: Subroutine does not return */
          FUN_00191a20(&PTR_s__project_rawrs_src_raw_uploader__009bd3b8);
        }
        lVar19 = param_2[0x1ce];
        *(undefined1 *)(param_2 + 0x1d0) = 0;
        *(undefined1 *)((long)param_2 + 0xec2) = 0;
        param_2[0x1d7] = lVar19;
        *(long **)(puVar4 + -0x15b0) = param_2 + 0x1d2;
        *(undefined2 *)(param_2 + 0x1d8) = 0;
        uVar9 = *(ulong *)PTR_DAT_009fac58;
        plVar24 = (long *)PTR_PTR_009fab90;
joined_r0x001c1a84:
        PTR_PTR_009fab90 = (undefined *)plVar24;
        if (((uVar9 < 3) &&
            ((*(byte *)(plVar24 + 2) - 1 < 2 ||
             ((*(byte *)(plVar24 + 2) != 0 && (cVar5 = FUN_0018fb0c(plVar24), cVar5 != '\0')))))) &&
           (uVar9 = FUN_007243f8(*plVar24), (uVar9 & 1) != 0)) {
          lVar10 = *plVar24;
          uVar9 = *(ulong *)(lVar10 + 0x38);
          if (uVar9 == 0) {
            *(uint **)(puVar4 + -0x15a8) = puVar22;
            *(long **)(puVar4 + -0x15d0) = plVar20;
                    /* WARNING: Subroutine does not return */
            FUN_0019151c(&DAT_0077e2f7,0x22,&PTR_s__project_rawrs_src_raw_uploader__009bdab0);
          }
          uVar17 = *(undefined8 *)(lVar10 + 0x40);
          uVar26 = *(undefined8 *)(lVar10 + 0x48);
          uVar18 = *(undefined8 *)(lVar10 + 0x30);
          *(ulong *)(puVar4 + 0x1a50) = uVar9;
          *(undefined8 *)(puVar4 + 0x1a58) = uVar17;
          *(undefined8 *)(puVar4 + 0x1a60) = uVar26;
          *(undefined8 *)(puVar4 + 0x1a48) = uVar18;
          *(undefined8 *)(puVar4 + 0x1a68) = 0;
          *(long *)(puVar4 + 0x1a70) = lVar19 + 0x11e0;
          if (uVar9 == 1) {
            *(uint **)(puVar4 + -0x15a8) = puVar22;
            *(long **)(puVar4 + -0x15d0) = plVar20;
                    /* WARNING: Subroutine does not return */
            FUN_0019151c(&DAT_0077e2f7,0x22,&PTR_s__project_rawrs_src_raw_uploader__009bdab0);
          }
          *(undefined8 *)(puVar4 + 0x1a78) = uVar18;
          *(ulong *)(puVar4 + 0x1a80) = uVar9;
          *(undefined8 *)(puVar4 + 0x1a88) = uVar17;
          *(undefined8 *)(puVar4 + 0x1a90) = uVar26;
          *(undefined8 *)(puVar4 + 0x1a98) = 1;
          if (uVar9 < 3) {
            *(uint **)(puVar4 + -0x15a8) = puVar22;
            *(long **)(puVar4 + -0x15d0) = plVar20;
                    /* WARNING: Subroutine does not return */
            FUN_0019151c(&DAT_0077e2f7,0x22,&PTR_s__project_rawrs_src_raw_uploader__009bdab0);
          }
          *(undefined8 *)(puVar4 + 0x5bb0) = uVar18;
          *(ulong *)(puVar4 + 0x5bb8) = uVar9;
          *(undefined8 *)(puVar4 + 0x5bc0) = uVar17;
          *(undefined8 *)(puVar4 + 0x5bc8) = uVar26;
          *(undefined8 *)(puVar4 + 0x5bd0) = 2;
          if (uVar9 == 3) {
            *(uint **)(puVar4 + -0x15a8) = puVar22;
            *(long **)(puVar4 + -0x15d0) = plVar20;
                    /* WARNING: Subroutine does not return */
            FUN_0019151c(&DAT_0077e2f7,0x22,&PTR_s__project_rawrs_src_raw_uploader__009bdab0);
          }
          *(ulong *)(puVar4 + 0x15b8) = uVar9;
          *(undefined8 *)(puVar4 + 0x15c0) = uVar17;
          *(undefined8 *)(puVar4 + 0x15d0) = 3;
          *(undefined1 **)(puVar4 + 0x3d18) = puVar4 + 0x1a70;
          *(undefined1 **)(puVar4 + 0x3d10) = puVar4 + 0x1a48;
          *(undefined **)(puVar4 + 0x3d20) = &DAT_009bd2e0;
          *(long *)(puVar4 + 0x3d30) = lVar19 + 0x16e8;
          *(undefined ***)(puVar4 + 0x3d38) = &PTR_FUN_009bd300;
          *(long *)(puVar4 + 0x3d48) = lVar19 + 0x1838;
          *(undefined1 **)(puVar4 + 0x3d40) = puVar4 + 0x5bb0;
          *(undefined **)(puVar4 + 0x3d50) = &DAT_009bd320;
          *(undefined8 *)(puVar4 + 0x15c8) = uVar26;
          *(undefined **)(puVar4 + 0x3d68) = &DAT_009bd340;
          *(undefined1 **)(puVar4 + 0x3d58) = puVar4 + 0x15b0;
          *(undefined8 *)(puVar4 + 0x15b0) = uVar18;
          *(undefined1 **)(puVar4 + 0x3d28) = puVar4 + 0x1a78;
          *(undefined8 *)(puVar4 + 0x3d60) = 1;
          *(undefined1 **)(puVar4 + 0x1a30) = puVar4 + 0x3d10;
          *(undefined8 *)(puVar4 + 0x1a38) = 4;
          *(undefined8 **)(puVar4 + 0x1a40) = (undefined8 *)(lVar10 + 0x30);
          FUN_00723fe4(*(undefined8 *)(puVar4 + -0x15b0),lVar10,puVar4 + 0x1a30);
          lVar10 = param_2[0x1d2];
          *(undefined1 *)(param_2 + 0x1d8) = 1;
          *(undefined1 *)((long)param_2 + 0xec1) = 1;
          *(long *)(puVar4 + 0x1aa0) = lVar19;
          puVar4[0x1ab8] = 0;
          if (lVar10 == 2) goto LAB_001c1cd8;
          uVar26 = *(undefined8 *)(puVar4 + 0x1ab8);
          uVar17 = *(undefined8 *)(puVar4 + 0x1ab0);
          uVar27 = *(undefined8 *)(puVar4 + 0x1aa8);
          uVar18 = *(undefined8 *)(puVar4 + 0x1aa0);
          plVar24 = *(long **)(puVar4 + -0x15b0);
          *(undefined2 *)(param_2 + 0x1d8) = 0;
          lVar19 = plVar24[4];
          *(undefined8 *)(puVar4 + 0x1b00) = uVar26;
          *(undefined8 *)(puVar4 + 0x1af8) = uVar17;
          *(undefined8 *)(puVar4 + 0x1af0) = uVar27;
          *(undefined8 *)(puVar4 + 0x1ae8) = uVar18;
          lVar14 = plVar24[1];
          lVar10 = *plVar24;
          lVar28 = plVar24[3];
          lVar16 = plVar24[2];
          *(long *)(puVar4 + 0x1ae0) = lVar19;
          lVar19 = *(long *)(puVar4 + 0x1b00);
          *(long *)(puVar4 + 0x1ac8) = lVar14;
          *(long *)(puVar4 + 0x1ac0) = lVar10;
          *(long *)(puVar4 + 0x1ad8) = lVar28;
          *(long *)(puVar4 + 0x1ad0) = lVar16;
          param_2[0x1da] = lVar14;
          param_2[0x1d9] = lVar10;
          param_2[0x1dc] = lVar28;
          param_2[0x1db] = lVar16;
          lVar28 = *(long *)(puVar4 + 0x1ae8);
          lVar16 = *(long *)(puVar4 + 0x1ae0);
          lVar14 = *(long *)(puVar4 + 0x1af8);
          lVar10 = *(long *)(puVar4 + 0x1af0);
          param_2[0x1e1] = lVar19;
          param_2[0x1de] = lVar28;
          param_2[0x1dd] = lVar16;
          param_2[0x1e0] = lVar14;
          param_2[0x1df] = lVar10;
          lVar19 = param_2[0x1d9];
          *(long **)(puVar4 + -0x15d0) = plVar20;
          *(uint **)(puVar4 + -0x15a8) = puVar22;
joined_r0x001c1cac:
          if (lVar19 != 2) {
            FUN_00726804(param_2 + 0x1d9,param_2 + 0x1dc);
          }
          plVar20 = param_2 + 0x1d9;
          FUN_0023b72c(puVar4 + 0x3d10,param_2 + 0x1de,param_3);
          if (*plVar20 != 2) {
            FUN_00726838(plVar20,param_2 + 0x1dc);
          }
          lVar19 = *(long *)(puVar4 + 0x3d10);
          if (lVar19 != 2) {
            lVar10 = *(long *)(puVar4 + 0x3d18);
            plVar25 = *(long **)(puVar4 + 0x3d20);
            unaff_x27 = *(long **)(puVar4 + 0x3d28);
            plVar24 = *(long **)(puVar4 + 0x3d30);
            *(undefined8 *)(puVar4 + 0x2348) = *(undefined8 *)(puVar4 + 0x3d40);
            *(undefined8 *)(puVar4 + 0x2340) = *(undefined8 *)(puVar4 + 0x3d38);
            *(undefined8 *)(puVar4 + 0x2358) = *(undefined8 *)(puVar4 + 0x3d50);
            *(undefined8 *)(puVar4 + 0x2350) = *(undefined8 *)(puVar4 + 0x3d48);
            *(undefined8 *)(puVar4 + 0x2360) = *(undefined8 *)(puVar4 + 0x3d58);
            memcpy(puVar4 + 8000,puVar4 + 0x3d60,0x400);
            *(undefined8 *)(puVar4 + -0x15e8) = *(undefined8 *)(puVar4 + 0x4160);
            *(undefined8 *)(puVar4 + -0x15e0) = *(undefined8 *)(puVar4 + 0x4168);
            *(undefined8 *)(puVar4 + 0x1f38) = *(undefined8 *)(puVar4 + 0x4178);
            *(undefined8 *)(puVar4 + 0x1f30) = *(undefined8 *)(puVar4 + 0x4170);
            *(undefined8 *)(puVar4 + -0x15d8) = *(undefined8 *)(puVar4 + 0x4180);
            *(undefined4 *)(puVar4 + -0x15f0) = *(undefined4 *)(puVar4 + 0x418c);
            *(undefined4 *)(puVar4 + -0x15ec) = *(undefined4 *)(puVar4 + 0x4188);
            FUN_001a3dbc(plVar20);
            bVar12 = *(byte *)(param_2 + 0x1d8);
            *(undefined1 *)((long)param_2 + 0xec1) = 0;
            goto joined_r0x001c1e14;
          }
          uVar13 = 3;
        }
        else {
          param_2[0x1d6] = 0;
          param_2[0x1d2] = 2;
          *(undefined2 *)(param_2 + 0x1d8) = 0x101;
          *(long *)(puVar4 + 0x1aa0) = lVar19;
          puVar4[0x1ab8] = 0;
LAB_001c1cd8:
          lVar10 = *(long *)(puVar4 + 0x1aa8);
          lVar19 = *(long *)(puVar4 + 0x1aa0);
          lVar16 = *(long *)(puVar4 + 0x1ab8);
          lVar14 = *(long *)(puVar4 + 0x1ab0);
          *(undefined1 *)((long)param_2 + 0xec1) = 0;
          param_2[0x1da] = lVar10;
          param_2[0x1d9] = lVar19;
          param_2[0x1dc] = lVar16;
          param_2[0x1db] = lVar14;
LAB_001c1cec:
          bVar12 = *(byte *)(param_2 + 0x1dc);
          *(long **)(puVar4 + -0x15d0) = plVar20;
          *(uint **)(puVar4 + -0x15a8) = puVar22;
          if (bVar12 < 2) {
            if (bVar12 != 0) {
                    /* WARNING: Subroutine does not return */
              FUN_00191a20(&PTR_s__project_rawrs_src_raw_uploader__009bdab0);
            }
            lVar19 = param_2[0x1d9];
            auVar40 = FUN_003a7844(lVar19 + 0x1808,*(undefined8 *)(lVar19 + 0x16d8),
                                   *(undefined8 *)(lVar19 + 0x16e0),*(undefined2 *)(lVar19 + 0x186c)
                                  );
            *(undefined1 (*) [16])(param_2 + 0x1da) = auVar40;
          }
          else {
            if (bVar12 != 3) {
                    /* WARNING: Subroutine does not return */
              FUN_00191a54(&PTR_s__project_rawrs_src_raw_uploader__009bdab0);
            }
            auVar40 = *(undefined1 (*) [16])(param_2 + 0x1da);
          }
          (**(code **)(auVar40._8_8_ + 0x18))(puVar4 + 0x3d10,auVar40._0_8_,param_3);
          lVar10 = *(long *)(puVar4 + 0x3d10);
          if (lVar10 != 3) {
            plVar25 = *(long **)(puVar4 + 0x3d18);
            plVar20 = *(long **)(puVar4 + 0x3d20);
            plVar24 = *(long **)(puVar4 + 0x3d28);
            memcpy(puVar4 + 0x1b08,puVar4 + 0x3d30,0x428);
            puVar15 = (undefined8 *)param_2[0x1db];
            lVar19 = param_2[0x1da];
            if ((code *)*puVar15 != (code *)0x0) {
              (*(code *)*puVar15)(lVar19);
            }
            lVar14 = puVar15[1];
            if (lVar14 != 0) {
              uVar7 = FUN_006212cc(puVar15[2],lVar14);
              FUN_00637bc0(lVar19,lVar14,uVar7);
            }
            if (lVar10 == 2) {
              lVar19 = 1;
              *(undefined8 *)(puVar4 + 0x2348) = *(undefined8 *)(puVar4 + 0x15b8);
              *(undefined8 *)(puVar4 + 0x2340) = *(undefined8 *)(puVar4 + 0x15b0);
              *(undefined8 *)(puVar4 + 0x2358) = *(undefined8 *)(puVar4 + 0x15c8);
              *(undefined8 *)(puVar4 + 0x2350) = *(undefined8 *)(puVar4 + 0x15c0);
              *(undefined8 *)(puVar4 + 0x2360) = *(undefined8 *)(puVar4 + 0x15d0);
              *(undefined1 *)(param_2 + 0x1dc) = 1;
              bVar12 = *(byte *)(param_2 + 0x1d8);
              *(undefined1 *)((long)param_2 + 0xec1) = 0;
              unaff_x27 = plVar25;
              plVar24 = plVar20;
              plVar25 = (long *)0x1;
            }
            else {
              uVar17 = *(undefined8 *)(param_2[0x1d9] + 0x17e0);
              *(long *)(puVar4 + 0x3d10) = lVar10;
              *(long **)(puVar4 + 0x3d18) = plVar25;
              *(undefined8 *)(puVar4 + -0x15d8) = uVar17;
              *(long **)(puVar4 + 0x3d20) = plVar20;
              *(long **)(puVar4 + 0x3d28) = plVar24;
              memcpy(puVar4 + 0x3d30,puVar4 + 0x1b08,0x428);
              uVar13 = *PTR_DAT_009faac8;
              iVar6 = FUN_006212cc(1,0x200000);
              if (iVar6 == 0) {
                pvVar11 = malloc(0x200000);
                *(void **)(puVar4 + -0x15e0) = pvVar11;
              }
              else {
                pvVar11 = (void *)FUN_006341e8(0x200000,iVar6);
                *(void **)(puVar4 + -0x15e0) = pvVar11;
              }
              if (pvVar11 == (void *)0x0) {
                    /* WARNING: Subroutine does not return */
                FUN_00191384(1,0x200000,&PTR_s__project_rawrs_src_raw_client_rs_009cbe90);
              }
              *(undefined8 *)(puVar4 + 0x2348) = *(undefined8 *)(puVar4 + 0x1b10);
              *(undefined8 *)(puVar4 + 0x2340) = *(undefined8 *)(puVar4 + 0x1b08);
              *(undefined8 *)(puVar4 + 0x2360) = *(undefined8 *)(puVar4 + 0x1b28);
              *(undefined8 *)(puVar4 + 0x2358) = *(undefined8 *)(puVar4 + 0x1b20);
              *(undefined8 *)(puVar4 + 0x2350) = *(undefined8 *)(puVar4 + 0x1b18);
              memcpy(puVar4 + 8000,puVar4 + 0x1b30,0x400);
              lVar19 = 0;
              *(undefined4 *)(puVar4 + -0x15ec) = 0;
              *(undefined8 *)(puVar4 + 0x1f38) = 0;
              *(undefined8 *)(puVar4 + -0x15e8) = 0x200000;
              *(undefined8 *)(puVar4 + 0x1f30) = 0;
              *(undefined1 *)(param_2 + 0x1dc) = 1;
              bVar12 = *(byte *)(param_2 + 0x1d8);
              *(undefined1 *)((long)param_2 + 0xec1) = 0;
              unaff_x27 = plVar20;
            }
joined_r0x001c1e14:
            if (((((bVar12 & 1) != 0) && (lVar14 = **(long **)(puVar4 + -0x15b0), lVar14 != 2)) &&
                (FUN_0072686c(*(undefined8 *)(puVar4 + -0x15b0),param_2[0x1d5]), lVar14 != 0)) &&
               (lVar14 = FUN_0077c930(0xffffffffffffffff,param_2[0x1d3]), lVar14 == 1)) {
              DataMemoryBarrier(2,1);
              FUN_0072502c(param_2 + 0x1d3);
            }
            unaff_x26 = param_2 + 0x1d9;
            uVar17 = *(undefined8 *)(puVar4 + 0x2360);
            uVar18 = *(undefined8 *)(puVar4 + 0x2348);
            uVar26 = *(undefined8 *)(puVar4 + 0x2340);
            uVar29 = *(undefined8 *)(puVar4 + 0x2358);
            uVar27 = *(undefined8 *)(puVar4 + 0x2350);
            *(undefined1 *)(param_2 + 0x1d8) = 0;
            *(undefined8 *)(puVar4 + 0x1568) = uVar18;
            *(undefined8 *)(puVar4 + 0x1560) = uVar26;
            *(undefined8 *)(puVar4 + 0x1578) = uVar29;
            *(undefined8 *)(puVar4 + 0x1570) = uVar27;
            *(undefined8 *)(puVar4 + 0x1580) = uVar17;
            memcpy(puVar4 + 0x1160,puVar4 + 8000,0x400);
            uVar17 = *(undefined8 *)(puVar4 + 0x1f38);
            lVar16 = *(long *)(puVar4 + 0x1f30);
            lVar30 = *(long *)(puVar4 + 0x1578);
            lVar28 = *(long *)(puVar4 + 0x1570);
            lVar14 = *(long *)(puVar4 + 0x1580);
            param_2[0xa6] = lVar19;
            *(undefined8 *)(puVar4 + 0x1158) = uVar17;
            *(long *)(puVar4 + 0x1150) = lVar16;
            lVar16 = *(long *)(puVar4 + 0x1568);
            lVar19 = *(long *)(puVar4 + 0x1560);
            *(undefined1 *)((long)param_2 + 0xec2) = 1;
            param_2[0xa7] = lVar10;
            param_2[0xa8] = (long)plVar25;
            param_2[0xa9] = (long)unaff_x27;
            param_2[0xaa] = (long)plVar24;
            param_2[0xac] = lVar16;
            param_2[0xab] = lVar19;
            param_2[0xae] = lVar30;
            param_2[0xad] = lVar28;
            param_2[0xaf] = lVar14;
            memcpy(param_2 + 0xb0,puVar4 + 0x1160,0x400);
            lVar19 = *(long *)(puVar4 + -0x15e8);
            lVar10 = *(long *)(puVar4 + -0x15e0);
            lVar14 = *(long *)(puVar4 + 0x1150);
            param_2[0x133] = *(long *)(puVar4 + 0x1158);
            param_2[0x132] = lVar14;
            param_2[0x131] = lVar10;
            lVar10 = *(long *)(puVar4 + -0x15d8);
            plVar20 = *(long **)(puVar4 + -0x15d0);
            param_2[0x130] = lVar19;
            param_2[0x134] = lVar10;
            uVar7 = *(undefined4 *)(puVar4 + -0x15f0);
            *(undefined4 *)(param_2 + 0x135) = *(undefined4 *)(puVar4 + -0x15ec);
            *(undefined4 *)((long)param_2 + 0x9ac) = uVar7;
            puVar22 = *(uint **)(puVar4 + -0x15a8);
            FUN_001a02a0(*(undefined8 *)(puVar4 + -0x15b0));
            if ((*puVar22 & 1) == 0) {
              plVar24 = param_2 + 0x138;
              *(undefined1 *)(param_2 + 0x1d0) = 1;
              memcpy(plVar24,param_2 + 0xa7,0x478);
              *(undefined4 *)(param_2[0x1ce] + 0x17b0) = 1000000000;
              FUN_0076ca70(puVar4 + 0x1ac0,param_2[0x1ce] + 0x16e8);
              FUN_0076ca70(puVar4 + 8000,param_2[0x1ce] + 0x1700);
              uVar13 = *PTR_DAT_009faac8;
              iVar6 = FUN_006212cc(1,1);
              if (iVar6 == 0) {
                puVar8 = malloc(1);
              }
              else {
                puVar8 = (undefined1 *)FUN_006341e8(1,iVar6);
              }
              if (puVar8 == (undefined1 *)0x0) {
                    /* WARNING: Subroutine does not return */
                FUN_00191384(1,1,&PTR_DAT_009bc390);
              }
              *puVar8 = 0x32;
              *(undefined8 *)(puVar4 + 0x15d8) = *(undefined8 *)(puVar4 + 0x1f50);
              *(undefined8 *)(puVar4 + 0x15d0) = *(undefined8 *)(puVar4 + 0x1f48);
              *(undefined8 *)(puVar4 + 0x15c8) = *(undefined8 *)(puVar4 + 8000);
              *(undefined8 *)(puVar4 + 0x15c0) = *(undefined8 *)(puVar4 + 0x1ad0);
              *(undefined8 *)(puVar4 + 0x5bb8) = *(undefined8 *)(puVar4 + 0x1ac8);
              *(undefined8 *)(puVar4 + 0x5bb0) = *(undefined8 *)(puVar4 + 0x1ac0);
              uVar29 = *(undefined8 *)(puVar4 + 0x5bb0);
              puVar15 = *(undefined8 **)(puVar4 + -0x15b0);
              *(undefined8 *)(puVar4 + 0x5bd8) = *(undefined8 *)(puVar4 + 0x15d8);
              *(undefined8 *)(puVar4 + 0x5bd0) = *(undefined8 *)(puVar4 + 0x15d0);
              *(undefined8 *)(puVar4 + 0x5bc8) = *(undefined8 *)(puVar4 + 0x15c8);
              *(undefined8 *)(puVar4 + 0x5bc0) = *(undefined8 *)(puVar4 + 0x15c0);
              uVar26 = *(undefined8 *)(puVar4 + 0x5bd8);
              uVar17 = *(undefined8 *)(puVar4 + 0x5bd0);
              uVar27 = *(undefined8 *)(puVar4 + 0x5bc8);
              uVar18 = *(undefined8 *)(puVar4 + 0x5bc0);
              puVar15[1] = *(undefined8 *)(puVar4 + 0x5bb8);
              *puVar15 = uVar29;
              puVar15[3] = uVar27;
              puVar15[2] = uVar18;
              puVar15[5] = uVar26;
              puVar15[4] = uVar17;
              lVar14 = *(long *)(puVar4 + 0x3d38);
              lVar10 = *(long *)(puVar4 + 0x3d30);
              lVar28 = *(long *)(puVar4 + 0x3d48);
              lVar16 = *(long *)(puVar4 + 0x3d40);
              param_2[0x1d8] = 1;
              param_2[0x1da] = 1;
              lVar32 = *(long *)(puVar4 + 0x3d58);
              lVar30 = *(long *)(puVar4 + 0x3d50);
              lVar19 = *(long *)(puVar4 + 0x3d60);
              *(undefined1 *)(param_2 + 0x1db) = 1;
              param_2[0x1e2] = lVar14;
              param_2[0x1e1] = lVar10;
              param_2[0x1e4] = lVar28;
              param_2[0x1e3] = lVar16;
              lVar14 = *(long *)(puVar4 + 0x3d18);
              lVar10 = *plVar1;
              lVar28 = *(long *)(puVar4 + 0x3d28);
              lVar16 = *(long *)(puVar4 + 0x3d20);
              param_2[0x1d9] = (long)puVar8;
              param_2[0x1dc] = (long)plVar24;
              param_2[0x1e6] = lVar32;
              param_2[0x1e5] = lVar30;
              param_2[0x1e7] = lVar19;
              param_2[0x1de] = lVar14;
              param_2[0x1dd] = lVar10;
              param_2[0x1e0] = lVar28;
              param_2[0x1df] = lVar16;
              *(undefined1 *)(param_2 + 0x1e8) = 0;
              goto LAB_001c3330;
            }
            param_2[0x1f1] = param_2[0xa9];
            param_2[0x1f0] = param_2[0xa8];
            param_2[499] = param_2[0xab];
            param_2[0x1f2] = param_2[0xaa];
            param_2[0x1f5] = param_2[0xad];
            param_2[500] = param_2[0xac];
            param_2[0x1f7] = param_2[0xaf];
            param_2[0x1f6] = param_2[0xae];
            puVar3 = PTR_PTR_009fad28;
            if (*(ulong *)PTR_DAT_009fac58 < 5) {
              if ((((byte)PTR_PTR_009fad28[0x10] - 1 < 2) ||
                  (((byte)PTR_PTR_009fad28[0x10] != 0 &&
                   (cVar5 = FUN_0018fb0c(PTR_PTR_009fad28), cVar5 != '\0')))) &&
                 (iVar6 = FUN_007243f8(*(undefined8 *)puVar3), iVar6 != 0)) {
                lVar19 = *(long *)puVar3;
                if (*(long *)(lVar19 + 0x38) == 0) {
                    /* WARNING: Subroutine does not return */
                  FUN_0019151c(&DAT_0077e2f7,0x22,&PTR_s__project_rawrs_src_raw_uploader__009bd408);
                }
                *(long *)(puVar4 + 0x15b8) = *(long *)(lVar19 + 0x38);
                *(code **)(puVar4 + 0x1ac8) = FUN_001afd90;
                *(undefined ***)(puVar4 + 0x3d10) = &PTR_s_raw_client_connect_failure_009bd420;
                uVar18 = *(undefined8 *)(lVar19 + 0x48);
                uVar26 = *(undefined8 *)(lVar19 + 0x40);
                *(undefined1 **)(puVar4 + 0x3d20) = puVar4 + 0x1ac0;
                uVar17 = *(undefined8 *)(lVar19 + 0x30);
                *(undefined1 **)(puVar4 + 0x5bb0) = puVar4 + 0x15b0;
                *(undefined8 *)(puVar4 + 0x15c8) = uVar18;
                *(undefined8 *)(puVar4 + 0x15c0) = uVar26;
                *(undefined **)(puVar4 + 0x5bc0) = &DAT_009bb780;
                *(undefined8 *)(puVar4 + 0x15b0) = uVar17;
                *(undefined8 *)(puVar4 + 0x15d0) = 0;
                *(long **)(puVar4 + 0x1ac0) = param_2 + 0x1f0;
                *(undefined8 *)(puVar4 + 0x3d18) = 1;
                *(undefined8 *)(puVar4 + 0x3d30) = 0;
                *(undefined8 *)(puVar4 + 0x3d28) = 1;
                *(undefined1 **)(puVar4 + 0x5bb8) = puVar4 + 0x3d10;
                *(undefined1 **)(puVar4 + 8000) = puVar4 + 0x5bb0;
                *(undefined8 *)(puVar4 + 0x1f48) = 1;
                *(undefined8 **)(puVar4 + 0x1f50) = (undefined8 *)(lVar19 + 0x30);
                FUN_00724b8c(lVar19,puVar4 + 8000);
              }
            }
            uVar26 = *(undefined8 *)(puVar4 + 0x3d98);
            uVar17 = *(undefined8 *)(puVar4 + 0x3d90);
            uVar27 = *(undefined8 *)(puVar4 + 0x3da8);
            uVar18 = *(undefined8 *)(puVar4 + 0x3da0);
            uVar31 = *(undefined8 *)(puVar4 + 0x3db8);
            uVar29 = *(undefined8 *)(puVar4 + 0x3db0);
            *(undefined1 *)((long)param_2 + 0xec2) = 0;
            param_2[0x1d7] = param_2[0x1ce];
            *(undefined8 *)((long)param_2 + 0xf4b) = uVar26;
            *(undefined8 *)((long)param_2 + 0xf43) = uVar17;
            *(undefined8 *)((long)param_2 + 0xf5b) = uVar27;
            *(undefined8 *)((long)param_2 + 0xf53) = uVar18;
            lVar10 = *(long *)(puVar4 + 0x3dc5);
            lVar19 = *(long *)(puVar4 + 0x3dbd);
            *(undefined8 *)((long)param_2 + 0xf6b) = uVar31;
            *(undefined8 *)((long)param_2 + 0xf63) = uVar29;
            param_2[0x1ef] = lVar10;
            param_2[0x1ee] = lVar19;
            uVar18 = *(undefined8 *)(puVar4 + 0x3d50);
            uVar26 = *(undefined8 *)(puVar4 + 0x3d68);
            uVar17 = *(undefined8 *)(puVar4 + 0x3d60);
            *(undefined8 *)((long)param_2 + 0xf0b) = *(undefined8 *)(puVar4 + 0x3d58);
            *(undefined8 *)((long)param_2 + 0xf03) = uVar18;
            *(undefined8 *)((long)param_2 + 0xf1b) = uVar26;
            *(undefined8 *)((long)param_2 + 0xf13) = uVar17;
            uVar18 = *(undefined8 *)(puVar4 + 0x3d70);
            uVar26 = *(undefined8 *)(puVar4 + 0x3d88);
            uVar17 = *(undefined8 *)(puVar4 + 0x3d80);
            *(undefined8 *)((long)param_2 + 0xf2b) = *(undefined8 *)(puVar4 + 0x3d78);
            *(undefined8 *)((long)param_2 + 0xf23) = uVar18;
            *(undefined8 *)((long)param_2 + 0xf3b) = uVar26;
            *(undefined8 *)((long)param_2 + 0xf33) = uVar17;
            lVar19 = *plVar1;
            uVar26 = *(undefined8 *)(puVar4 + 0x3d28);
            uVar17 = *(undefined8 *)(puVar4 + 0x3d20);
            *(undefined8 *)((long)param_2 + 0xecb) = *(undefined8 *)(puVar4 + 0x3d18);
            *(long *)((long)param_2 + 0xec3) = lVar19;
            *(undefined8 *)((long)param_2 + 0xedb) = uVar26;
            *(undefined8 *)((long)param_2 + 0xed3) = uVar17;
            uVar18 = *(undefined8 *)(puVar4 + 0x3d30);
            uVar26 = *(undefined8 *)(puVar4 + 0x3d48);
            uVar17 = *(undefined8 *)(puVar4 + 0x3d40);
            *(undefined8 *)((long)param_2 + 0xeeb) = *(undefined8 *)(puVar4 + 0x3d38);
            *(undefined8 *)((long)param_2 + 0xee3) = uVar18;
            *(undefined8 *)((long)param_2 + 0xefb) = uVar26;
            *(undefined8 *)((long)param_2 + 0xef3) = uVar17;
            goto LAB_001c2178;
          }
          *(undefined1 *)(param_2 + 0x1dc) = 3;
          uVar13 = 4;
        }
        *(undefined1 *)((long)param_2 + 0xec2) = uVar13;
        uVar13 = 3;
LAB_001c4244:
        *(undefined1 *)((long)param_2 + 0xe81) = uVar13;
        uVar13 = 4;
        goto LAB_001c424c;
      }
      if (bVar12 == 3) {
        bVar12 = *(byte *)((long)param_2 + 0xec2);
        *(long **)(puVar4 + -0x15b0) = param_2 + 0x1d2;
        if (bVar12 < 3) {
          if (bVar12 != 0) {
            *(uint **)(puVar4 + -0x15a8) = puVar22;
            *(long **)(puVar4 + -0x15d0) = plVar20;
            if (bVar12 != 1) {
                    /* WARNING: Subroutine does not return */
              FUN_00191a54(&PTR_s__project_rawrs_src_raw_uploader__009bdac8);
            }
                    /* WARNING: Subroutine does not return */
            FUN_00191a20(&PTR_s__project_rawrs_src_raw_uploader__009bdac8);
          }
          lVar19 = param_2[0x1d7];
          *(undefined2 *)(param_2 + 0x1d8) = 0;
          uVar9 = *(ulong *)PTR_DAT_009fac58;
          plVar24 = (long *)PTR_PTR_009fab90;
          goto joined_r0x001c1a84;
        }
        if (bVar12 == 3) {
          lVar19 = param_2[0x1d9];
          *(long **)(puVar4 + -0x15d0) = plVar20;
          *(uint **)(puVar4 + -0x15a8) = puVar22;
          goto joined_r0x001c1cac;
        }
        goto LAB_001c1cec;
      }
LAB_001c2178:
      uVar9 = FUN_001c4b00(param_2 + 0x1d2,param_3);
      if ((uVar9 & 1) != 0) {
        uVar13 = 4;
        goto LAB_001c4244;
      }
      FUN_001a03e8(param_2 + 0x1d2);
      FUN_001a7064(param_2 + 0x1f0);
LAB_001c3d48:
      lVar19 = 2;
    }
    else {
LAB_001c3278:
      puVar22 = (uint *)(param_2 + 0xa6);
      plVar20 = param_2 + 0x9c;
      if (bVar12 < 7) {
        if (bVar12 == 5) {
          bVar12 = *(byte *)(param_2 + 0x1e8);
          if (bVar12 < 3) {
            if (bVar12 != 0) {
              *(uint **)(puVar4 + -0x15a8) = puVar22;
              *(long **)(puVar4 + -0x15d0) = plVar20;
              if (bVar12 != 1) {
                    /* WARNING: Subroutine does not return */
                FUN_00191a54(&PTR_DAT_009bc908);
              }
                    /* WARNING: Subroutine does not return */
              FUN_00191a20(&PTR_DAT_009bc908);
            }
            plVar24 = (long *)param_2[0x1dc];
LAB_001c3330:
            param_2[0x1dd] = (long)plVar24;
            param_2[0x1df] = param_2[0x1d3];
            param_2[0x1de] = param_2[0x1d2];
            param_2[0x1e1] = param_2[0x1d5];
            param_2[0x1e0] = param_2[0x1d4];
            param_2[0x1e7] = param_2[0x1db];
            param_2[0x1e6] = param_2[0x1da];
            param_2[0x1e5] = param_2[0x1d9];
            param_2[0x1e4] = param_2[0x1d8];
            param_2[0x1e3] = param_2[0x1d7];
            param_2[0x1e2] = param_2[0x1d6];
            if (plVar24[0x8c] != 0) {
              plVar24[0x8c] = 0;
            }
            plVar24[0x8b] = 0;
            auVar40 = FUN_003a6640(param_2 + 0x1de,param_2[0x1dd] + 0x448);
            if (auVar40._0_8_ == 0) {
              param_2[0x1e9] = param_2[0x1dd];
              param_2[0x1ea] = param_2[0x1dd] + 0x448;
              goto LAB_001c3394;
            }
          }
          else {
            if (bVar12 == 3) {
LAB_001c3394:
              auVar40 = FUN_002a6da0(param_2 + 0x1e9,param_3);
              lVar19 = auVar40._8_8_;
              if (auVar40._0_8_ != 0) {
                uVar13 = 3;
                goto LAB_001c423c;
              }
              if (lVar19 == 0) {
                lVar19 = param_2[0x1dd];
                param_2[0x1e9] = lVar19;
                goto LAB_001c33ec;
              }
              *(long *)(puVar4 + 0x15b0) = lVar19;
              uVar13 = *PTR_DAT_009faac8;
              iVar6 = FUN_006212cc(8,8);
              if (iVar6 == 0) {
                plVar24 = malloc(8);
              }
              else {
                plVar24 = (long *)FUN_006341e8(8,iVar6);
              }
              if (plVar24 == (long *)0x0) {
                *(uint **)(puVar4 + -0x15a8) = puVar22;
                *(long **)(puVar4 + -0x15d0) = plVar20;
                    /* WARNING: Subroutine does not return */
                FUN_0019139c(8,8);
              }
LAB_001c34c8:
              *plVar24 = lVar19;
            }
            else {
              lVar19 = param_2[0x1e9];
LAB_001c33ec:
              auVar40 = FUN_0028a4dc(lVar19,param_3);
              lVar19 = auVar40._8_8_;
              if (auVar40._0_8_ != 0) {
                uVar13 = 4;
LAB_001c423c:
                *(undefined1 *)(param_2 + 0x1e8) = uVar13;
                uVar13 = 5;
                goto LAB_001c4244;
              }
              plVar24 = (long *)0x0;
              if (lVar19 != 0) {
                *(long *)(puVar4 + 0x15b0) = lVar19;
                uVar13 = *PTR_DAT_009faac8;
                iVar6 = FUN_006212cc(8,8);
                if (iVar6 == 0) {
                  plVar24 = malloc(8);
                }
                else {
                  plVar24 = (long *)FUN_006341e8(8,iVar6);
                }
                if (plVar24 == (long *)0x0) {
                  *(uint **)(puVar4 + -0x15a8) = puVar22;
                  *(long **)(puVar4 + -0x15d0) = plVar20;
                    /* WARNING: Subroutine does not return */
                  FUN_0019139c(8,8);
                }
                goto LAB_001c34c8;
              }
            }
            auVar40._8_8_ = &PTR_FUN_009bc8a8;
            auVar40._0_8_ = plVar24;
          }
          unaff_x27 = auVar40._8_8_;
          FUN_001a9158(param_2 + 0x1de);
          param_2[0x136] = auVar40._0_8_;
          *(undefined1 *)(param_2 + 0x1e8) = 1;
          param_2[0x137] = (long)unaff_x27;
          if (auVar40._0_8_ == 0) {
            *(uint **)(puVar4 + -0x15a8) = puVar22;
            plVar24 = param_2 + 0x138;
            param_2[0x1e6] = (long)plVar24;
            *(undefined1 *)((long)param_2 + 0xf39) = 0;
            goto LAB_001c364c;
          }
          *(undefined1 (*) [16])(param_2 + 0x1d2) = auVar40;
          puVar3 = PTR_PTR_009fa448;
          if (((*(ulong *)PTR_DAT_009fac58 < 5) &&
              (((byte)PTR_PTR_009fa448[0x10] - 1 < 2 ||
               (((byte)PTR_PTR_009fa448[0x10] != 0 &&
                (cVar5 = FUN_0018fb0c(PTR_PTR_009fa448), cVar5 != '\0')))))) &&
             (iVar6 = FUN_007243f8(*(undefined8 *)puVar3), iVar6 != 0)) {
            lVar19 = *(long *)puVar3;
            if (*(long *)(lVar19 + 0x38) == 0) {
              *(uint **)(puVar4 + -0x15a8) = puVar22;
              *(long **)(puVar4 + -0x15d0) = plVar20;
                    /* WARNING: Subroutine does not return */
              FUN_0019151c(&DAT_0077e2f7,0x22,&PTR_s__project_rawrs_src_raw_uploader__009bd430);
            }
            *(long *)(puVar4 + 0x1f48) = *(long *)(lVar19 + 0x38);
            *(undefined1 **)(puVar4 + 0x1a80) = &LAB_002cee7c;
            *(undefined ***)(puVar4 + 0x15b0) = &PTR_s_failed_to_start_session__009bd448;
            uVar17 = *(undefined8 *)(lVar19 + 0x30);
            *(undefined1 **)(puVar4 + 0x15c0) = puVar4 + 0x1a78;
            uVar18 = *(undefined8 *)(lVar19 + 0x48);
            uVar26 = *(undefined8 *)(lVar19 + 0x40);
            *(undefined8 *)(puVar4 + 8000) = uVar17;
            *(undefined1 **)(puVar4 + 0x1ac0) = puVar4 + 8000;
            *(undefined **)(puVar4 + 0x1ad0) = &DAT_009bb780;
            *(undefined8 *)(puVar4 + 0x1f60) = 0;
            *(undefined8 *)(puVar4 + 0x1f58) = uVar18;
            *(undefined8 *)(puVar4 + 0x1f50) = uVar26;
            *(long **)(puVar4 + 0x1a78) = param_2 + 0x1d2;
            *(undefined8 *)(puVar4 + 0x15b8) = 1;
            *(undefined8 *)(puVar4 + 0x15d0) = 0;
            *(undefined8 *)(puVar4 + 0x15c8) = 1;
            *(undefined1 **)(puVar4 + 0x1ac8) = puVar4 + 0x15b0;
            *(undefined1 **)(puVar4 + 0x2340) = puVar4 + 0x1ac0;
            *(undefined8 *)(puVar4 + 0x2348) = 1;
            *(undefined8 **)(puVar4 + 0x2350) = (undefined8 *)(lVar19 + 0x30);
            FUN_00724b8c(lVar19,puVar4 + 0x2340);
          }
          *(undefined1 *)((long)param_2 + 0xed2) = 0;
          param_2[0x1d9] = param_2[0x1ce];
        }
        uVar9 = FUN_001c4b00(param_2 + 0x1d4,param_3);
        if ((uVar9 & 1) != 0) {
          uVar13 = 6;
          goto LAB_001c4244;
        }
        FUN_001a03e8(param_2 + 0x1d4);
        puVar15 = (undefined8 *)param_2[0x1d3];
        plVar24 = (long *)param_2[0x1d2];
        if ((code *)*puVar15 != (code *)0x0) {
          (*(code *)*puVar15)(plVar24);
        }
LAB_001c3cf4:
        plVar25 = (long *)puVar15[1];
        unaff_x26 = plVar25;
        if (plVar25 != (long *)0x0) {
          uVar7 = FUN_006212cc(puVar15[2],plVar25);
LAB_001c3d14:
          FUN_00637bc0(plVar24,plVar25,uVar7);
        }
LAB_001c3d18:
        FUN_001ae348(param_2 + 0x138);
        lVar19 = param_2[0x1c1];
        if (lVar19 != 0) {
          unaff_x26 = (long *)param_2[0x1c2];
          uVar7 = FUN_006212cc(1,lVar19);
          FUN_00637bc0(unaff_x26,lVar19,uVar7);
        }
        goto LAB_001c3d48;
      }
      if (bVar12 != 7) {
LAB_001c3cc4:
        uVar9 = FUN_001c4b00(param_2 + 0x1d4,param_3);
        if ((uVar9 & 1) != 0) {
          uVar13 = 8;
          goto LAB_001c4244;
        }
        FUN_001a03e8(param_2 + 0x1d4);
        puVar15 = (undefined8 *)param_2[0x1d3];
        plVar24 = (long *)param_2[0x1d2];
        if ((code *)*puVar15 != (code *)0x0) {
          (*(code *)*puVar15)(plVar24);
        }
        goto LAB_001c3cf4;
      }
      bVar12 = *(byte *)((long)param_2 + 0xf39);
      *(uint **)(puVar4 + -0x15a8) = puVar22;
      if (bVar12 < 2) {
        if (bVar12 != 0) {
          *(long **)(puVar4 + -0x15d0) = plVar20;
                    /* WARNING: Subroutine does not return */
          FUN_00191a20(&PTR_DAT_009bc890);
        }
        plVar24 = (long *)param_2[0x1e6];
LAB_001c364c:
        *(undefined1 *)(param_2 + 0x1e7) = 0;
        puVar3 = PTR_DAT_009faac8;
        param_2[0x1e2] = (long)plVar24;
        uVar13 = *puVar3;
        iVar6 = FUN_006212cc(1,0x80);
        if (iVar6 == 0) {
          pvVar11 = malloc(0x80);
        }
        else {
          pvVar11 = (void *)FUN_006341e8(0x80,iVar6);
        }
        if (pvVar11 == (void *)0x0) {
          *(long **)(puVar4 + -0x15d0) = plVar20;
                    /* WARNING: Subroutine does not return */
          FUN_00191384(1,0x80,&PTR_DAT_009bc860);
        }
        lVar19 = param_2[0x1e2];
        param_2[0x1e4] = (long)pvVar11;
        param_2[0x1e3] = 0x80;
        param_2[0x1e5] = 0;
        *(undefined1 *)(param_2 + 0x1e7) = 1;
        uVar17 = *(undefined8 *)(lVar19 + 0x468);
        uVar7 = *(undefined4 *)(lVar19 + 0x470);
        auVar41 = thunk_FUN_00702ec8();
        *(undefined1 (*) [12])(puVar4 + 0x3d10) = auVar41;
        auVar40 = FUN_00705ec0(puVar4 + 0x3d10,uVar17,uVar7);
        if (auVar40._8_4_ == 1000000000) {
          FUN_0071aaa0(puVar4 + 0x3d10,0);
        }
        else {
          FUN_0071a8c8(puVar4 + 0x3d10,auVar40._0_8_,auVar40._8_8_,0,&PTR_DAT_009bc878);
        }
        lVar14 = *(long *)(puVar4 + 0x3d58);
        lVar10 = *(long *)(puVar4 + 0x3d50);
        lVar28 = *(long *)(puVar4 + 0x3d68);
        lVar16 = *(long *)(puVar4 + 0x3d60);
        lVar33 = *(long *)(puVar4 + 0x3d18);
        lVar32 = *plVar1;
        lVar35 = *(long *)(puVar4 + 0x3d28);
        lVar34 = *(long *)(puVar4 + 0x3d20);
        lVar39 = *(long *)(puVar4 + 0x3d38);
        lVar38 = *(long *)(puVar4 + 0x3d30);
        lVar37 = *(long *)(puVar4 + 0x3d48);
        lVar36 = *(long *)(puVar4 + 0x3d40);
        lVar30 = *(long *)(puVar4 + 0x3d70);
        *(long *)(puVar4 + 0x15f8) = lVar14;
        *(long *)(puVar4 + 0x15f0) = lVar10;
        *(long *)(puVar4 + 0x1608) = lVar28;
        *(long *)(puVar4 + 0x1600) = lVar16;
        *(long *)(puVar4 + 0x1618) = *(long *)(puVar4 + 0x3d78);
        *(long *)(puVar4 + 0x1610) = lVar30;
        *(long *)(puVar4 + 0x15b8) = lVar33;
        *(long *)(puVar4 + 0x15b0) = lVar32;
        *(long *)(puVar4 + 0x15c8) = lVar35;
        *(long *)(puVar4 + 0x15c0) = lVar34;
        *(long *)(puVar4 + 0x15d8) = lVar39;
        *(long *)(puVar4 + 0x15d0) = lVar38;
        *(long *)(puVar4 + 0x15e8) = lVar37;
        *(long *)(puVar4 + 0x15e0) = lVar36;
        param_2[0x1df] = *(long *)(puVar4 + 0x3d78);
        param_2[0x1de] = lVar30;
        param_2[0x1d3] = lVar33;
        param_2[0x1d2] = lVar32;
        param_2[0x1d5] = lVar35;
        param_2[0x1d4] = lVar34;
        param_2[0x1d7] = lVar39;
        param_2[0x1d6] = lVar38;
        param_2[0x1d9] = lVar37;
        param_2[0x1d8] = lVar36;
        param_2[0x1db] = lVar14;
        param_2[0x1da] = lVar10;
        param_2[0x1dd] = lVar28;
        param_2[0x1dc] = lVar16;
        param_2[0x1e0] = lVar19;
        param_2[0x1e1] = (long)(param_2 + 0x1e3);
      }
      else if (bVar12 != 3) {
        *(long **)(puVar4 + -0x15d0) = plVar20;
                    /* WARNING: Subroutine does not return */
        FUN_00191a54(&PTR_DAT_009bc890);
      }
      plVar24 = param_2 + 0x1d2;
      auVar40 = FUN_00331150(plVar24,param_3);
      lVar10 = auVar40._8_8_;
      lVar19 = auVar40._0_8_;
      if (lVar19 == 3) {
        *(undefined1 *)((long)param_2 + 0xf39) = 3;
        uVar13 = 7;
        goto LAB_001c4244;
      }
      FUN_001a78e0(plVar24);
      if (lVar19 == 2) {
        lVar19 = param_2[0x1e2];
        *(undefined ***)(puVar4 + 0x3d10) = &PTR_s_recv_message_timed_out_after_s_009bc8c8;
        *(undefined8 *)(puVar4 + 0x3d18) = 2;
        uVar17 = *(undefined8 *)(lVar19 + 0x468);
        *(undefined1 **)(puVar4 + 0x2340) = puVar4 + 0x1a48;
        *(undefined8 *)(puVar4 + 0x1a48) = uVar17;
        *(undefined **)(puVar4 + 0x2348) = PTR_FUN_009fa3a0;
        *(undefined8 *)(puVar4 + 0x3d30) = 0;
        *(undefined1 **)(puVar4 + 0x3d20) = puVar4 + 0x2340;
        *(undefined8 *)(puVar4 + 0x3d28) = 1;
        FUN_0076b8c0(puVar4 + 0x1a78,puVar4 + 0x3d10);
        *(undefined8 *)(puVar4 + 0x5bb8) = *(undefined8 *)(puVar4 + 0x1a80);
        *(undefined8 *)(puVar4 + 0x5bb0) = *(undefined8 *)(puVar4 + 0x1a78);
        *(undefined8 *)(puVar4 + 0x5bc0) = *(undefined8 *)(puVar4 + 0x1a88);
        puVar22 = *(uint **)(puVar4 + -0x15a8);
        lVar10 = FUN_004c2fb0(0x16,puVar4 + 0x5bb0);
        *(long *)(puVar4 + 0x3d10) = lVar10;
        uVar13 = *PTR_DAT_009faac8;
        iVar6 = FUN_006212cc(8,8);
        if (iVar6 == 0) {
          unaff_x26 = malloc(8);
        }
        else {
          unaff_x26 = (long *)FUN_006341e8(8,iVar6);
        }
        if (unaff_x26 == (long *)0x0) {
          *(long **)(puVar4 + -0x15d0) = plVar20;
                    /* WARNING: Subroutine does not return */
          FUN_0019139c(8,8);
        }
LAB_001c3ae8:
        *unaff_x26 = lVar10;
        unaff_x27 = (long *)param_2[0x1e3];
        if (unaff_x27 != (long *)0x0) {
          lVar19 = param_2[0x1e4];
          uVar7 = FUN_006212cc(1,unaff_x27);
          FUN_00637bc0(lVar19,unaff_x27,uVar7);
        }
        ppuVar21 = &PTR_FUN_009bc8a8;
LAB_001c3b1c:
        lVar19 = -0x8000000000000000;
      }
      else {
        if (lVar19 == 1) {
          *(long *)(puVar4 + 0x3d10) = lVar10;
          uVar13 = *PTR_DAT_009faac8;
          iVar6 = FUN_006212cc(8,8);
          if (iVar6 == 0) {
            unaff_x26 = malloc(8);
            puVar22 = *(uint **)(puVar4 + -0x15a8);
          }
          else {
            unaff_x26 = (long *)FUN_006341e8(8,iVar6);
            puVar22 = *(uint **)(puVar4 + -0x15a8);
          }
          if (unaff_x26 == (long *)0x0) {
            *(uint **)(puVar4 + -0x15a8) = puVar22;
            *(long **)(puVar4 + -0x15d0) = plVar20;
                    /* WARNING: Subroutine does not return */
            FUN_0019139c(8,8);
          }
          goto LAB_001c3ae8;
        }
        if (lVar10 == 0) {
          lVar10 = FUN_00746978(3,&DAT_0077efb1,0x29);
          *(long *)(puVar4 + 0x3d10) = lVar10;
          uVar13 = *PTR_DAT_009faac8;
          iVar6 = FUN_006212cc(8,8);
          puVar22 = *(uint **)(puVar4 + -0x15a8);
          if (iVar6 == 0) {
            unaff_x26 = malloc(8);
          }
          else {
            unaff_x26 = (long *)FUN_006341e8(8,iVar6);
          }
          if (unaff_x26 == (long *)0x0) {
            *(long **)(puVar4 + -0x15d0) = plVar20;
                    /* WARNING: Subroutine does not return */
            FUN_0019139c(8,8);
          }
          goto LAB_001c3ae8;
        }
        lVar10 = param_2[0x1e3];
        lVar19 = param_2[0x1e5];
        *(undefined1 *)(param_2 + 0x1e7) = 0;
        *(long *)(puVar4 + 0x2348) = param_2[0x1e4];
        *(long *)(puVar4 + 0x2340) = lVar10;
        *(long *)(puVar4 + 0x2350) = lVar19;
        *(undefined8 *)(puVar4 + 0x2358) = 0;
        memset(puVar4 + 0x3d10,0,0x1000);
        *(undefined8 *)(puVar4 + 0x15d0) = 0;
        puVar4[0x15d8] = 6;
        *(undefined1 **)(puVar4 + 0x15c8) = puVar4 + 0x2340;
        *(undefined1 **)(puVar4 + 0x15b0) = puVar4 + 0x3d10;
        *(undefined8 *)(puVar4 + 0x15c0) = _UNK_0077e058;
        *(undefined8 *)(puVar4 + 0x15b8) = _DAT_0077e050;
        FUN_002e68b4(puVar4 + 0x5bb0,puVar4 + 0x15b0,"RawApiResp",10,&PTR_s_prot_009cbe60,3);
        lVar19 = *(long *)(puVar4 + 0x5bb0);
        puVar22 = *(uint **)(puVar4 + -0x15a8);
        if (lVar19 == -0x8000000000000000) {
          uVar13 = *PTR_DAT_009faac8;
          iVar6 = FUN_006212cc(8,0x28);
          if (iVar6 == 0) {
            unaff_x26 = malloc(0x28);
          }
          else {
            unaff_x26 = (long *)FUN_006341e8(0x28,iVar6);
          }
          if (unaff_x26 == (long *)0x0) {
            *(long **)(puVar4 + -0x15d0) = plVar20;
                    /* WARNING: Subroutine does not return */
            FUN_0019139c(8,0x28);
          }
          lVar19 = *(long *)(puVar4 + 0x5bc8);
          unaff_x26[3] = *(long *)(puVar4 + 0x5bd0);
          unaff_x26[2] = lVar19;
          lVar19 = *(long *)(puVar4 + 0x5bb8);
          unaff_x26[1] = *(long *)(puVar4 + 0x5bc0);
          *unaff_x26 = lVar19;
          unaff_x26[4] = *(long *)(puVar4 + 0x5bd8);
          unaff_x27 = *(long **)(puVar4 + 0x2340);
          if (unaff_x27 != (long *)0x0) {
            uVar17 = *(undefined8 *)(puVar4 + 0x2348);
            uVar7 = FUN_006212cc(1,unaff_x27);
            FUN_00637bc0(uVar17,unaff_x27,uVar7);
          }
          ppuVar21 = &PTR_FUN_009bc8e8;
          goto LAB_001c3b1c;
        }
        unaff_x27 = *(long **)(puVar4 + 0x2340);
        unaff_x26 = *(long **)(puVar4 + 0x5bb8);
        ppuVar21 = *(undefined ***)(puVar4 + 0x5bc0);
        *(undefined8 *)(puVar4 + 0x1ac8) = *(undefined8 *)(puVar4 + 0x5bd0);
        *(undefined8 *)(puVar4 + 0x1ac0) = *(undefined8 *)(puVar4 + 0x5bc8);
        *(undefined8 *)(puVar4 + 0x1ad8) = *(undefined8 *)(puVar4 + 0x5be0);
        *(undefined8 *)(puVar4 + 0x1ad0) = *(undefined8 *)(puVar4 + 0x5bd8);
        if (unaff_x27 != (long *)0x0) {
          uVar17 = *(undefined8 *)(puVar4 + 0x2348);
          uVar7 = FUN_006212cc(1,unaff_x27);
          FUN_00637bc0(uVar17,unaff_x27,uVar7);
        }
      }
      lVar14 = *(long *)(puVar4 + 0x1ac8);
      lVar10 = *(long *)(puVar4 + 0x1ac0);
      lVar28 = *(long *)(puVar4 + 0x1ad8);
      lVar16 = *(long *)(puVar4 + 0x1ad0);
      param_2[0x1c7] = lVar19;
      *(undefined2 *)(param_2 + 0x1e7) = 0x100;
      param_2[0x1c8] = (long)unaff_x26;
      param_2[0x1c9] = (long)ppuVar21;
      param_2[0x1cb] = lVar14;
      param_2[0x1ca] = lVar10;
      param_2[0x1cd] = lVar28;
      param_2[0x1cc] = lVar16;
      cVar5 = *(char *)((long)param_2 + 0xf39);
      *(long *)(puVar4 + 0x1598) = lVar14;
      *(long *)(puVar4 + 0x1590) = lVar10;
      *(long *)(puVar4 + 0x15a8) = lVar28;
      *(long *)(puVar4 + 0x15a0) = lVar16;
      if (cVar5 == '\x03') {
        FUN_001a78e0(plVar24);
        unaff_x26 = (long *)param_2[0x1e3];
        if (unaff_x26 != (long *)0x0) {
          unaff_x27 = (long *)param_2[0x1e4];
          uVar7 = FUN_006212cc(1,unaff_x26);
          FUN_00637bc0(unaff_x27,unaff_x26,uVar7);
        }
        *(undefined1 *)(param_2 + 0x1e7) = 0;
        lVar19 = param_2[0x1c7];
      }
      puVar3 = PTR_PTR_009fad98;
      if (lVar19 == -0x8000000000000000) {
        param_2[0x1d2] = param_2[0x1c8];
        param_2[0x1d3] = param_2[0x1c9];
        puVar3 = PTR_PTR_009fad20;
        if (((*(ulong *)PTR_DAT_009fac58 < 5) &&
            (((byte)PTR_PTR_009fad20[0x10] - 1 < 2 ||
             (((byte)PTR_PTR_009fad20[0x10] != 0 &&
              (cVar5 = FUN_0018fb0c(PTR_PTR_009fad20), cVar5 != '\0')))))) &&
           (iVar6 = FUN_007243f8(*(undefined8 *)puVar3), iVar6 != 0)) {
          lVar19 = *(long *)puVar3;
          if (*(long *)(lVar19 + 0x38) == 0) {
            *(uint **)(puVar4 + -0x15a8) = puVar22;
            *(long **)(puVar4 + -0x15d0) = plVar20;
                    /* WARNING: Subroutine does not return */
            FUN_0019151c(&DAT_0077e2f7,0x22,&PTR_s__project_rawrs_src_raw_uploader__009bd470);
          }
          *(long *)(puVar4 + 0x15b8) = *(long *)(lVar19 + 0x38);
          *(undefined1 **)(puVar4 + 0x2348) = &LAB_002cee7c;
          *(undefined ***)(puVar4 + 0x3d10) = &PTR_s_failed_to_recv_session_start_ack_009bd488;
          uVar18 = *(undefined8 *)(lVar19 + 0x48);
          uVar26 = *(undefined8 *)(lVar19 + 0x40);
          *(undefined1 **)(puVar4 + 0x3d20) = puVar4 + 0x2340;
          uVar17 = *(undefined8 *)(lVar19 + 0x30);
          *(undefined1 **)(puVar4 + 0x5bb0) = puVar4 + 0x15b0;
          *(undefined8 *)(puVar4 + 0x15c8) = uVar18;
          *(undefined8 *)(puVar4 + 0x15c0) = uVar26;
          *(undefined **)(puVar4 + 0x5bc0) = &DAT_009bb780;
          *(undefined8 *)(puVar4 + 0x15b0) = uVar17;
          *(undefined8 *)(puVar4 + 0x15d0) = 0;
          *(long **)(puVar4 + 0x2340) = plVar24;
          *(undefined8 *)(puVar4 + 0x3d18) = 1;
          *(undefined8 *)(puVar4 + 0x3d30) = 0;
          *(undefined8 *)(puVar4 + 0x3d28) = 1;
          *(undefined1 **)(puVar4 + 0x5bb8) = puVar4 + 0x3d10;
          *(undefined1 **)(puVar4 + 0x1ac0) = puVar4 + 0x5bb0;
          *(undefined8 *)(puVar4 + 0x1ac8) = 1;
          *(undefined8 **)(puVar4 + 0x1ad0) = (undefined8 *)(lVar19 + 0x30);
          FUN_00724b8c(lVar19,puVar4 + 0x1ac0);
        }
        *(undefined1 *)((long)param_2 + 0xed2) = 0;
        param_2[0x1d9] = param_2[0x1ce];
        goto LAB_001c3cc4;
      }
      lVar14 = param_2[0x1c8];
      lVar10 = param_2[0x1c7];
      lVar28 = param_2[0x1ca];
      lVar16 = param_2[0x1c9];
      lVar30 = param_2[0x1cb];
      lVar19 = param_2[0x1cd];
      *(long *)(puVar4 + 0x1f68) = param_2[0x1cc];
      *(long *)(puVar4 + 0x1f60) = lVar30;
      *(long *)(puVar4 + 0x1f48) = lVar14;
      *(long *)(puVar4 + 8000) = lVar10;
      *(long *)(puVar4 + 0x1f58) = lVar28;
      *(long *)(puVar4 + 0x1f50) = lVar16;
      *(long *)(puVar4 + 0x1f70) = lVar19;
      if ((*(ulong *)PTR_DAT_009fac58 < 3) &&
         ((((byte)PTR_PTR_009fad98[0x10] - 1 < 2 ||
           (((byte)PTR_PTR_009fad98[0x10] != 0 &&
            (cVar5 = FUN_0018fb0c(PTR_PTR_009fad98), cVar5 != '\0')))) &&
          (iVar6 = FUN_007243f8(*(undefined8 *)puVar3), iVar6 != 0)))) {
        lVar19 = *(long *)puVar3;
        if (*(long *)(lVar19 + 0x38) == 0) {
          *(uint **)(puVar4 + -0x15a8) = puVar22;
          *(long **)(puVar4 + -0x15d0) = plVar20;
                    /* WARNING: Subroutine does not return */
          FUN_0019151c(&DAT_0077e2f7,0x22,&PTR_s__project_rawrs_src_raw_uploader__009bd458);
        }
        *(long *)(puVar4 + 0x15b8) = *(long *)(lVar19 + 0x38);
        *(code **)(puVar4 + 0x2348) = FUN_001cbc30;
        *(undefined **)(puVar4 + 0x3d10) = &DAT_0077e060;
        uVar17 = *(undefined8 *)(lVar19 + 0x30);
        *(undefined1 **)(puVar4 + 0x3d20) = puVar4 + 0x2340;
        uVar18 = *(undefined8 *)(lVar19 + 0x48);
        uVar26 = *(undefined8 *)(lVar19 + 0x40);
        *(undefined8 *)(puVar4 + 0x15b0) = uVar17;
        *(undefined1 **)(puVar4 + 0x5bb0) = puVar4 + 0x15b0;
        *(undefined8 *)(puVar4 + 0x15c8) = uVar18;
        *(undefined8 *)(puVar4 + 0x15c0) = uVar26;
        *(undefined **)(puVar4 + 0x5bc0) = &DAT_009bb780;
        *(undefined1 **)(puVar4 + 0x2340) = puVar4 + 8000;
        *(undefined8 *)(puVar4 + 0x15d0) = 0;
        *(undefined8 *)(puVar4 + 0x3d18) = 1;
        *(undefined8 *)(puVar4 + 0x3d30) = 0;
        *(undefined8 *)(puVar4 + 0x3d28) = 1;
        *(undefined1 **)(puVar4 + 0x5bb8) = puVar4 + 0x3d10;
        *(undefined1 **)(puVar4 + 0x1ac0) = puVar4 + 0x5bb0;
        *(undefined8 *)(puVar4 + 0x1ac8) = 1;
        *(undefined8 **)(puVar4 + 0x1ad0) = (undefined8 *)(lVar19 + 0x30);
        FUN_00724b8c(lVar19,puVar4 + 0x1ac0);
      }
      psVar23 = *(short **)(puVar4 + 0x1f48);
      if ((((*(long *)(puVar4 + 0x1f50) != 3) || (*psVar23 != 0x6172 || (char)psVar23[1] != 'w')) ||
          (*(long *)(puVar4 + 0x1f68) != 7)) ||
         (**(int **)(puVar4 + 0x1f60) != 0x73736573 ||
          *(int *)((long)*(int **)(puVar4 + 0x1f60) + 3) != 0x6e6f6973)) {
        unaff_x26 = *(long **)(puVar4 + 8000);
        if (unaff_x26 != (long *)0x0) {
          uVar7 = FUN_006212cc(1,unaff_x26);
          FUN_00637bc0(psVar23,unaff_x26,uVar7);
        }
        plVar25 = *(long **)(puVar4 + 0x1f58);
        if (plVar25 != (long *)0x0) {
          plVar24 = *(long **)(puVar4 + 0x1f60);
          uVar7 = FUN_006212cc(1,plVar25);
          unaff_x26 = plVar24;
          goto LAB_001c3d14;
        }
        goto LAB_001c3d18;
      }
      *(undefined8 *)param_2[0x1cf] = 0;
      auVar41 = FUN_0074bcf0();
      *(undefined1 (*) [12])(param_2[0x1ce] + 0x1798) = auVar41;
      *(undefined1 *)(param_2 + 0x1d0) = 0;
      memcpy(puVar4 + 0x15b0,param_2 + 0x138,0x478);
      memcpy(puVar4 + 0x5bb0,param_2 + 0x138,0x448);
      FUN_0027db98(puVar4 + 0x3d10,puVar4 + 0x5bb0);
      *(undefined8 *)(puVar4 + -0x15b8) = *(undefined8 *)(puVar4 + 0x1a18);
      *(undefined8 *)(puVar4 + -0x2f0) = *(undefined8 *)(puVar4 + 0x1a00);
      *(undefined8 *)(puVar4 + -0x2f8) = *(undefined8 *)(puVar4 + 0x19f8);
      *(undefined8 *)(puVar4 + -0x2e0) = *(undefined8 *)(puVar4 + 0x1a10);
      *(undefined8 *)(puVar4 + -0x2e8) = *(undefined8 *)(puVar4 + 0x1a08);
      *(undefined4 *)(puVar4 + -0x15bc) = *(undefined4 *)(puVar4 + 0x1a20);
      memcpy(puVar4 + -0x780,puVar4 + 0x3d10,0x488);
      memcpy(puVar4 + 0x56e8,puVar4 + -0x780,0x4a8);
      lVar19 = *(long *)(puVar4 + 8000);
      if (lVar19 != 0) {
        unaff_x26 = *(long **)(puVar4 + 0x1f48);
        uVar7 = FUN_006212cc(1,lVar19);
        FUN_00637bc0(unaff_x26,lVar19,uVar7);
      }
      lVar19 = *(long *)(puVar4 + 0x1f58);
      if (lVar19 != 0) {
        unaff_x26 = *(long **)(puVar4 + 0x1f60);
        uVar7 = FUN_006212cc(1,lVar19);
        FUN_00637bc0(unaff_x26,lVar19,uVar7);
      }
      lVar19 = 3;
    }
    *(undefined1 *)(param_2 + 0x1d0) = 0;
    memcpy(puVar4 + 0xca8,puVar4 + 0x56e8,0x4a8);
    *(undefined1 *)((long)param_2 + 0xe81) = 1;
    FUN_001a2494(puVar22);
    uVar17 = *(undefined8 *)(puVar4 + -0x15b8);
    uVar7 = *(undefined4 *)(puVar4 + -0x15bc);
    bVar12 = *(byte *)(param_2 + 0xa4);
    *(undefined1 *)((long)param_2 + 0x521) = 0;
joined_r0x001c3d88:
    if ((((bVar12 & 1) != 0) && (lVar10 = param_2[0x9d], lVar10 != 2)) &&
       ((FUN_0072686c(param_2 + 0x9d,param_2[0xa0]), lVar10 != 0 &&
        (lVar10 = FUN_0077c930(0xffffffffffffffff,param_2[0x9e]), lVar10 == 1)))) {
      DataMemoryBarrier(2,1);
      FUN_0072502c(param_2 + 0x9e);
    }
    *(undefined1 *)(param_2 + 0xa4) = 0;
    memcpy(puVar4 + -0x1598,puVar4 + 0xca8,0x4a8);
    *(undefined1 *)((long)param_2 + 0x522) = 1;
    memcpy(puVar4 + -0x10f0,puVar4 + -0x1598,0x4a8);
    FUN_001a0a30(plVar20);
    lVar10 = *param_2;
    if (*(long *)(lVar10 + 0x11e0) != 4) {
      uVar9 = *(long *)(lVar10 + 0x11e0) - 2;
      if (1 < uVar9) {
        uVar9 = 2;
      }
      if (uVar9 != 0) {
        lVar14 = lVar10 + 0x11e0;
        if (uVar9 == 1) {
          lVar14 = lVar10 + 0x11e8;
        }
        FUN_001a3938(lVar14);
        lVar10 = *param_2;
      }
    }
    *(long *)(lVar10 + 0x11e0) = lVar19;
    memcpy((void *)(lVar10 + 0x11e8),puVar4 + -0x10f0,0x4a8);
    *(undefined8 *)(lVar10 + 0x1690) = uVar17;
    *(undefined4 *)(lVar10 + 0x1698) = uVar7;
    *(int *)(lVar10 + 0x169c) = (int)unaff_x26;
    *(long **)(lVar10 + 0x16a0) = unaff_x27;
    do {
      auVar41 = FUN_0074bcf0();
      *(undefined1 (*) [12])(param_2 + 0xab) = auVar41;
      lVar19 = *(long *)(*param_2 + 0x1818);
      *(undefined1 *)(param_2 + 0xaa) = 0;
      param_2[0x9c] = lVar19 + 0x10;
LAB_001c3e8c:
      lVar19 = FUN_001cb608(param_2 + 0x9c,param_3);
      if (lVar19 == 0) {
        **(undefined8 **)(puVar4 + -0x15c8) = 0x10;
        uVar13 = 7;
        goto LAB_001c4264;
      }
      if ((((char)param_2[0xaa] == '\x03') && ((char)param_2[0xa9] == '\x03')) &&
         ((char)param_2[0xa0] == '\x04')) {
        FUN_00712274(param_2 + 0xa1);
        if (param_2[0xa2] != 0) {
          (**(code **)(param_2[0xa2] + 0x18))(param_2[0xa3]);
        }
      }
      lVar10 = param_2[0xac];
      *(long *)(lVar19 + 0x28) = param_2[0xab];
      *(int *)(lVar19 + 0x30) = (int)lVar10;
      FUN_00711600(lVar19,1);
      FUN_002b6974(*param_2);
LAB_001c26b0:
      lVar10 = *param_2;
      lVar19 = *(long *)(lVar10 + 0x11e0);
      memcpy(puVar4 + 0x3d10,(void *)(lVar10 + 0x11e8),0x4c0);
      *(undefined8 *)(lVar10 + 0x11e0) = 4;
      if (lVar19 == 4) {
                    /* WARNING: Subroutine does not return */
        FUN_00191500(&PTR_s__project_rawrs_src_raw_uploader__009bda60);
      }
      param_2[2] = lVar19;
      memcpy(param_2 + 3,puVar4 + 0x3d10,0x4c0);
      uVar9 = lVar19 - 2;
      if (1 < uVar9) {
        uVar9 = 2;
      }
      if (uVar9 == 2) {
        lVar19 = param_2[0x99];
        uVar2 = *(uint *)(param_2 + 0x9a);
        lVar10 = *param_2;
        unaff_x27 = param_2 + 1;
        memcpy(param_2 + 0x9c,param_2 + 2,0x4b8);
        param_2[0x133] = lVar19;
        *(uint *)(param_2 + 0x134) = uVar2;
        param_2[0x135] = lVar10;
        param_2[0x136] = (long)unaff_x27;
        *(undefined1 *)(param_2 + 0x1d6) = 0;
LAB_001c2808:
        unaff_x26 = (long *)(ulong)uVar2;
        plVar20 = param_2 + 0x137;
        *(undefined2 *)((long)param_2 + 0xeb1) = 0;
        *(undefined1 *)((long)param_2 + 0xeb3) = 1;
        memcpy(plVar20,param_2 + 0x9c,0x4b8);
        param_2[0x1ce] = lVar19;
        *(uint *)(param_2 + 0x1cf) = uVar2;
        param_2[0x1d0] = (long)unaff_x27;
        puVar3 = PTR_PTR_009fa100;
        if (*(ulong *)PTR_DAT_009fac58 < 3) {
          unaff_x26 = param_2 + 0x1ce;
          unaff_x27 = (long *)puVar3;
          if (((1 < (byte)PTR_PTR_009fa100[0x10] - 1) &&
              (((byte)PTR_PTR_009fa100[0x10] == 0 ||
               (cVar5 = FUN_0018fb0c(PTR_PTR_009fa100), cVar5 == '\0')))) ||
             (uVar9 = FUN_007243f8(*(undefined8 *)puVar3), (uVar9 & 1) == 0)) goto LAB_001c2ab0;
          lVar19 = *(long *)puVar3;
          uVar9 = *(ulong *)(lVar19 + 0x38);
          if (uVar9 == 0) {
                    /* WARNING: Subroutine does not return */
            FUN_0019151c(&DAT_0077e2f7,0x22,&PTR_s__project_rawrs_src_raw_uploader__009bd498);
          }
          uVar17 = *(undefined8 *)(lVar19 + 0x40);
          uVar26 = *(undefined8 *)(lVar19 + 0x48);
          uVar18 = *(undefined8 *)(lVar19 + 0x30);
          *(ulong *)(puVar4 + 0x1168) = uVar9;
          *(undefined8 *)(puVar4 + 0x1170) = uVar17;
          *(undefined8 *)(puVar4 + 0x1178) = uVar26;
          *(undefined8 *)(puVar4 + 0x1160) = uVar18;
          *(undefined8 *)(puVar4 + 0x1180) = 0;
          *(long **)(puVar4 + 0x1a48) = plVar20;
          if (uVar9 == 1) {
                    /* WARNING: Subroutine does not return */
            FUN_0019151c(&DAT_0077e2f7,0x22,&PTR_s__project_rawrs_src_raw_uploader__009bd498);
          }
          *(undefined8 *)(puVar4 + 8000) = uVar18;
          *(ulong *)(puVar4 + 0x1f48) = uVar9;
          *(undefined8 *)(puVar4 + 0x1f50) = uVar17;
          *(undefined8 *)(puVar4 + 0x1f58) = uVar26;
          *(undefined8 *)(puVar4 + 0x1f60) = 1;
          *(long **)(puVar4 + 0x1a78) = unaff_x26;
          if (uVar9 < 3) {
                    /* WARNING: Subroutine does not return */
            FUN_0019151c(&DAT_0077e2f7,0x22,&PTR_s__project_rawrs_src_raw_uploader__009bd498);
          }
          *(undefined8 *)(puVar4 + 0x5bb0) = uVar18;
          *(ulong *)(puVar4 + 0x5bb8) = uVar9;
          *(undefined8 *)(puVar4 + 0x5bc0) = uVar17;
          *(undefined8 *)(puVar4 + 0x5bc8) = uVar26;
          *(undefined8 *)(puVar4 + 0x5bd0) = 2;
          if (uVar9 == 3) {
                    /* WARNING: Subroutine does not return */
            FUN_0019151c(&DAT_0077e2f7,0x22,&PTR_s__project_rawrs_src_raw_uploader__009bd498);
          }
          *(undefined8 *)(puVar4 + 0x15d0) = 3;
          *(undefined8 *)(puVar4 + 0x15b0) = uVar18;
          *(ulong *)(puVar4 + 0x15b8) = uVar9;
          *(undefined8 *)(puVar4 + 0x15c0) = uVar17;
          *(undefined8 *)(puVar4 + 0x15c8) = uVar26;
          *(long *)(puVar4 + 0x2340) = lVar10 + 0x11e0;
          if (uVar9 < 5) {
                    /* WARNING: Subroutine does not return */
            FUN_0019151c(&DAT_0077e2f7,0x22,&PTR_s__project_rawrs_src_raw_uploader__009bd498);
          }
          *(undefined8 *)(puVar4 + -0x1598) = uVar18;
          *(ulong *)(puVar4 + -0x1590) = uVar9;
          *(undefined8 *)(puVar4 + -0x1588) = uVar17;
          *(undefined8 *)(puVar4 + -0x1580) = uVar26;
          *(undefined8 *)(puVar4 + -0x1578) = 4;
          if (uVar9 == 5) {
                    /* WARNING: Subroutine does not return */
            FUN_0019151c(&DAT_0077e2f7,0x22,&PTR_s__project_rawrs_src_raw_uploader__009bd498);
          }
          *(undefined8 *)(puVar4 + 0xca8) = uVar18;
          *(ulong *)(puVar4 + 0xcb0) = uVar9;
          *(undefined8 *)(puVar4 + 0xcb8) = uVar17;
          *(undefined8 *)(puVar4 + 0xcc0) = uVar26;
          *(undefined8 *)(puVar4 + 0xcc8) = 5;
          if (uVar9 < 7) {
                    /* WARNING: Subroutine does not return */
            FUN_0019151c(&DAT_0077e2f7,0x22,&PTR_s__project_rawrs_src_raw_uploader__009bd498);
          }
          *(ulong *)(puVar4 + 0x218) = uVar9;
          unaff_x26 = (long *)0x1;
          *(undefined8 *)(puVar4 + 0x230) = 6;
          *(undefined8 *)(puVar4 + 0x220) = uVar17;
          *(undefined1 **)(puVar4 + 0x2370) = puVar4 + 0x1160;
          *(undefined **)(puVar4 + 0x2380) = &DAT_009bd2c0;
          *(undefined1 **)(puVar4 + 0x2378) = puVar4 + 0x1a48;
          *(undefined1 **)(puVar4 + 0x2390) = puVar4 + 0x1a78;
          *(undefined1 **)(puVar4 + 0x2388) = puVar4 + 8000;
          *(undefined1 **)(puVar4 + 0x23a0) = puVar4 + 0x5bb0;
          *(undefined **)(puVar4 + 0x2398) = &DAT_009bd4b0;
          *(undefined1 **)(puVar4 + 0x23b8) = puVar4 + 0x15b0;
          *(undefined **)(puVar4 + 0x23b0) = &DAT_009bd3d0;
          *(undefined1 **)(puVar4 + 0x23c0) = puVar4 + 0x2340;
          *(undefined **)(puVar4 + 0x23c8) = &DAT_009bd2e0;
          *(undefined1 **)(puVar4 + 0x23d0) = puVar4 + -0x1598;
          *(long *)(puVar4 + 0x23d8) = lVar10 + 0x16e8;
          *(undefined ***)(puVar4 + 0x23e0) = &PTR_FUN_009bd300;
          *(long *)(puVar4 + 0x23f0) = lVar10 + 0x1838;
          *(undefined8 *)(puVar4 + 0x228) = uVar26;
          *(undefined1 **)(puVar4 + 0x2400) = puVar4 + 0x210;
          *(undefined **)(puVar4 + 0x2410) = &DAT_009bd340;
          *(undefined **)(puVar4 + 0x23f8) = &DAT_009bd320;
          *(undefined8 *)(puVar4 + 0x210) = uVar18;
          *(long **)(puVar4 + 0x23a8) = param_2 + 0x1d0;
          *(undefined1 **)(puVar4 + 0x23e8) = puVar4 + 0xca8;
          *(undefined8 *)(puVar4 + 0x2408) = 1;
          *(undefined1 **)(puVar4 + 0x1ac0) = puVar4 + 0x2370;
          *(undefined8 *)(puVar4 + 0x1ac8) = 7;
          *(undefined8 **)(puVar4 + 0x1ad0) = (undefined8 *)(lVar19 + 0x30);
          FUN_00723fe4(param_2 + 0x1d1,lVar19,puVar4 + 0x1ac0);
          lVar19 = param_2[0x1d1];
          *(undefined1 *)((long)param_2 + 0xeb1) = 1;
        }
        else {
LAB_001c2ab0:
          *(undefined1 *)((long)param_2 + 0xeb1) = 1;
          lVar19 = 2;
          param_2[0x1d1] = 2;
          param_2[0x1d5] = 0;
        }
        *(undefined2 *)((long)param_2 + 0xeb2) = 1;
        *(long *)(puVar4 + 0x28e8) = lVar10;
        memcpy(puVar4 + 0x2430,plVar20,0x4b8);
        lVar14 = param_2[0x1ce];
        lVar10 = param_2[0x1cf];
        lVar16 = param_2[0x1d0];
        puVar4[0x2928] = 0;
        *(long *)(puVar4 + 0x2370) = lVar14;
        *(int *)(puVar4 + 0x2378) = (int)lVar10;
        *(long *)(puVar4 + 0x28f0) = lVar16;
        if (lVar19 == 2) {
          *(undefined1 *)((long)param_2 + 0xeb2) = 0;
          memcpy(param_2 + 0x1d8,puVar4 + 0x2370,0x19a0);
LAB_001c2b28:
          FUN_001bd33c(puVar4 + 0x210,param_2 + 0x1d8,param_3);
          uVar9 = *(ulong *)(puVar4 + 0x210);
          if (uVar9 == 2) {
            uVar13 = 4;
LAB_001c3478:
            puVar15 = *(undefined8 **)(puVar4 + -0x15c8);
            *(undefined1 *)(param_2 + 0x1d6) = uVar13;
            *puVar15 = 0x10;
            uVar13 = 6;
            goto LAB_001c4264;
          }
          memcpy(puVar4 + 0x56e8,(void *)((ulong)(puVar4 + 0x210) | 8),0x4c8);
          FUN_001a26f0(param_2 + 0x1d8);
        }
        else {
          *(undefined1 *)((long)param_2 + 0xeb2) = 0;
          memcpy(puVar4 + 0x3d10,puVar4 + 0x2370,0x19a0);
          lVar10 = param_2[0x1d1];
          lVar16 = param_2[0x1d4];
          lVar14 = param_2[0x1d3];
          lVar19 = param_2[0x1d5];
          *(undefined1 *)((long)param_2 + 0xeb1) = 0;
          *(long *)(puVar4 + 0x56b8) = param_2[0x1d2];
          *(long *)(puVar4 + 0x56b0) = lVar10;
          *(long *)(puVar4 + 0x56c8) = lVar16;
          *(long *)(puVar4 + 0x56c0) = lVar14;
          *(long *)(puVar4 + 0x56d0) = lVar19;
          memcpy(param_2 + 0x1d8,puVar4 + 0x3d10,0x19d0);
          lVar19 = param_2[0x50c];
joined_r0x001c18b8:
          if (lVar19 != 2) {
            FUN_00726804(param_2 + 0x50c,param_2 + 0x50f);
          }
          FUN_002372b0(puVar4 + 0x210,param_2 + 0x1d8,param_3);
          if (param_2[0x50c] != 2) {
            FUN_00726838(param_2 + 0x50c,param_2 + 0x50f);
          }
          uVar9 = *(ulong *)(puVar4 + 0x210);
          if (uVar9 == 2) {
            uVar13 = 3;
            goto LAB_001c3478;
          }
          memcpy(puVar4 + 0x56e8,(void *)((ulong)(puVar4 + 0x210) | 8),0x4c8);
          FUN_001a44e4(param_2 + 0x1d8);
        }
        *(undefined1 *)((long)param_2 + 0xeb2) = 0;
        if (((((*(byte *)((long)param_2 + 0xeb1) & 1) != 0) &&
             (lVar19 = param_2[0x1d1], lVar19 != 2)) &&
            (FUN_0072686c(param_2 + 0x1d1,param_2[0x1d4]), lVar19 != 0)) &&
           (lVar19 = FUN_0077c930(0xffffffffffffffff,param_2[0x1d2]), lVar19 == 1)) {
          DataMemoryBarrier(2,1);
          FUN_0072502c(param_2 + 0x1d2);
        }
        *(undefined1 *)((long)param_2 + 0xeb1) = 0;
        *(undefined1 *)((long)param_2 + 0xeb3) = 0;
        memcpy(puVar4 + -0x780,puVar4 + 0x56e8,0x4c8);
        *(undefined1 *)(param_2 + 0x1d6) = 1;
        memcpy(puVar4 + -0x2b8,puVar4 + -0x780,0x4c8);
        FUN_001a0b10(param_2 + 0x9c);
        if ((uVar9 & 1) != 0) {
          puVar15 = *(undefined8 **)(puVar4 + -0x15c8);
          uVar17 = *(undefined8 *)(puVar4 + -0x2b0);
          uVar18 = *(undefined8 *)(puVar4 + -0x298);
          uVar26 = *(undefined8 *)(puVar4 + -0x2a0);
          uVar29 = *(undefined8 *)(puVar4 + -0x288);
          uVar27 = *(undefined8 *)(puVar4 + -0x290);
          puVar15[1] = *(undefined8 *)(puVar4 + -0x2a8);
          *puVar15 = uVar17;
          puVar15[3] = uVar18;
          puVar15[2] = uVar26;
          uVar26 = *(undefined8 *)(puVar4 + -0x278);
          uVar17 = *(undefined8 *)(puVar4 + -0x280);
          uVar13 = 1;
          puVar15[5] = uVar29;
          puVar15[4] = uVar27;
          puVar15[7] = uVar26;
          puVar15[6] = uVar17;
          goto LAB_001c4264;
        }
        lVar19 = *param_2;
        if (*(long *)(lVar19 + 0x11e0) != 4) {
          uVar9 = *(long *)(lVar19 + 0x11e0) - 2;
          if (1 < uVar9) {
            uVar9 = 2;
          }
          if (uVar9 != 0) {
            lVar10 = lVar19 + 0x11e0;
            if (uVar9 == 1) {
              lVar10 = lVar19 + 0x11e8;
            }
            FUN_001a3938(lVar10);
            lVar19 = *param_2;
          }
        }
        puVar8 = puVar4 + -0x2b8;
      }
      else {
        if (uVar9 != 1) goto LAB_001c2d28;
        lVar19 = *param_2;
        lVar10 = param_2[1];
        memcpy(param_2 + 0x9c,param_2 + 3,0x4b8);
        param_2[0x133] = lVar19;
        param_2[0x134] = lVar10;
        *(undefined1 *)(param_2 + 0x1d2) = 0;
LAB_001c273c:
        FUN_001bc8f8(puVar4 + 0x3d10,param_2 + 0x9c,param_3);
        if (*(long *)(puVar4 + 0x3d10) == 4) {
          **(undefined8 **)(puVar4 + -0x15c8) = 0x10;
          uVar13 = 5;
          goto LAB_001c4264;
        }
        memcpy(puVar4 + -0xc48,puVar4 + 0x3d10,0x4c8);
        FUN_001a0830(param_2 + 0x9c);
        lVar19 = *param_2;
        if (*(long *)(lVar19 + 0x11e0) != 4) {
          uVar9 = *(long *)(lVar19 + 0x11e0) - 2;
          if (1 < uVar9) {
            uVar9 = 2;
          }
          if (uVar9 != 0) {
            lVar10 = lVar19 + 0x11e0;
            if (uVar9 == 1) {
              lVar10 = lVar19 + 0x11e8;
            }
            FUN_001a3938(lVar10);
            lVar19 = *param_2;
          }
        }
        puVar8 = puVar4 + -0xc48;
      }
      memcpy((void *)(lVar19 + 0x11e0),puVar8,0x4c8);
    } while( true );
  }
  lVar10 = *(long *)puVar3;
  uVar9 = *(ulong *)(lVar10 + 0x38);
  if (uVar9 == 0) {
    *(long **)(puVar4 + -0x15d0) = plVar24;
                    /* WARNING: Subroutine does not return */
    FUN_0019151c(&DAT_0077e2f7,0x22,&PTR_s__project_rawrs_src_raw_uploader__009bd3b8);
  }
  uVar17 = *(undefined8 *)(lVar10 + 0x40);
  uVar26 = *(undefined8 *)(lVar10 + 0x48);
  uVar18 = *(undefined8 *)(lVar10 + 0x30);
  *(ulong *)(puVar4 + 0x5bb8) = uVar9;
  *(undefined8 *)(puVar4 + 0x5bc0) = uVar17;
  *(undefined8 *)(puVar4 + 0x5bc8) = uVar26;
  *(undefined8 *)(puVar4 + 0x5bb0) = uVar18;
  *(undefined8 *)(puVar4 + 0x5bd0) = 0;
  if (uVar9 == 1) {
    *(long **)(puVar4 + -0x15d0) = plVar24;
                    /* WARNING: Subroutine does not return */
    FUN_0019151c(&DAT_0077e2f7,0x22,&PTR_s__project_rawrs_src_raw_uploader__009bd3b8);
  }
  *(undefined8 *)(puVar4 + 0x15d0) = 1;
  *(undefined8 *)(puVar4 + 0x15b0) = uVar18;
  *(ulong *)(puVar4 + 0x15b8) = uVar9;
  *(undefined8 *)(puVar4 + 0x15c0) = uVar17;
  *(undefined8 *)(puVar4 + 0x15c8) = uVar26;
  *(long *)(puVar4 + 0x1160) = lVar19 + 0x11e0;
  if (uVar9 < 3) {
    *(long **)(puVar4 + -0x15d0) = plVar24;
                    /* WARNING: Subroutine does not return */
    FUN_0019151c(&DAT_0077e2f7,0x22,&PTR_s__project_rawrs_src_raw_uploader__009bd3b8);
  }
  *(undefined8 *)(puVar4 + -0x780) = uVar18;
  *(ulong *)(puVar4 + -0x778) = uVar9;
  *(undefined8 *)(puVar4 + -0x770) = uVar17;
  *(undefined8 *)(puVar4 + -0x768) = uVar26;
  *(undefined8 *)(puVar4 + -0x760) = 2;
  if (uVar9 == 3) {
    *(long **)(puVar4 + -0x15d0) = plVar24;
                    /* WARNING: Subroutine does not return */
    FUN_0019151c(&DAT_0077e2f7,0x22,&PTR_s__project_rawrs_src_raw_uploader__009bd3b8);
  }
  *(undefined8 *)(puVar4 + 0x56e8) = uVar18;
  *(ulong *)(puVar4 + 0x56f0) = uVar9;
  *(undefined8 *)(puVar4 + 0x56f8) = uVar17;
  *(undefined8 *)(puVar4 + 0x5700) = uVar26;
  *(undefined8 *)(puVar4 + 0x5708) = 3;
  if (uVar9 < 5) {
    *(long **)(puVar4 + -0x15d0) = plVar24;
                    /* WARNING: Subroutine does not return */
    FUN_0019151c(&DAT_0077e2f7,0x22,&PTR_s__project_rawrs_src_raw_uploader__009bd3b8);
  }
  *(ulong *)(puVar4 + 0x218) = uVar9;
  *(undefined8 *)(puVar4 + 0x230) = 4;
  *(undefined8 *)(puVar4 + 0x220) = uVar17;
  *(undefined1 **)(puVar4 + 0x3d10) = puVar4 + 0x5bb0;
  *(undefined **)(puVar4 + 0x3d20) = &DAT_009bd3d0;
  *(undefined1 **)(puVar4 + 0x3d28) = puVar4 + 0x15b0;
  *(undefined **)(puVar4 + 0x3d38) = &DAT_009bd2e0;
  *(undefined1 **)(puVar4 + 0x3d30) = puVar4 + 0x1160;
  *(undefined1 **)(puVar4 + 0x3d40) = puVar4 + -0x780;
  *(long *)(puVar4 + 0x3d48) = lVar19 + 0x16e8;
  *(undefined ***)(puVar4 + 0x3d50) = &PTR_FUN_009bd300;
  *(long *)(puVar4 + 0x3d60) = lVar19 + 0x1838;
  *(undefined8 *)(puVar4 + 0x228) = uVar26;
  *(undefined1 **)(puVar4 + 0x3d70) = puVar4 + 0x210;
  *(undefined **)(puVar4 + 0x3d80) = &DAT_009bd340;
  *(undefined **)(puVar4 + 0x3d68) = &DAT_009bd320;
  *(undefined8 *)(puVar4 + 0x210) = uVar18;
  *(long **)(puVar4 + 0x3d18) = plVar24;
  *(undefined1 **)(puVar4 + 0x3d58) = puVar4 + 0x56e8;
  *(undefined8 *)(puVar4 + 0x3d78) = 1;
  *(undefined1 **)(puVar4 + 8000) = puVar4 + 0x3d10;
  *(undefined8 *)(puVar4 + 0x1f48) = 5;
  *(undefined8 **)(puVar4 + 0x1f50) = (undefined8 *)(lVar10 + 0x30);
  FUN_00723fe4(param_2 + 0x9d,lVar10,puVar4 + 8000);
  lVar10 = param_2[0x9d];
  lVar14 = param_2[0x9c];
  *(undefined1 *)(param_2 + 0xa4) = 1;
  *(undefined1 *)((long)param_2 + 0x521) = 1;
  *(long *)(puVar4 + 0xb50) = lVar19;
  *(long *)(puVar4 + 0xb58) = lVar14;
  puVar4[0xb61] = 0;
  if (lVar10 == 2) goto LAB_001c3250;
  *(undefined1 *)((long)param_2 + 0x521) = 0;
  memcpy(puVar4 + 0x2370,puVar4 + 0x210,0xa90);
  lVar10 = param_2[0x9d];
  lVar16 = param_2[0xa0];
  lVar14 = param_2[0x9f];
  lVar19 = param_2[0xa1];
  *(undefined1 *)(param_2 + 0xa4) = 0;
  *(long *)(puVar4 + 0x2e08) = param_2[0x9e];
  *(long *)(puVar4 + 0x2e00) = lVar10;
  *(long *)(puVar4 + 0x2e18) = lVar16;
  *(long *)(puVar4 + 0x2e10) = lVar14;
  *(long *)(puVar4 + 0x2e20) = lVar19;
  memcpy(param_2 + 0xa6,puVar4 + 0x2370,0xac0);
  lVar19 = param_2[0x1f8];
joined_r0x001c18f8:
  if (lVar19 != 2) {
    FUN_00726804(param_2 + 0x1f8,param_2 + 0x1fb);
  }
  plVar20 = param_2 + 0x9c;
  FUN_00233948(puVar4 + 0x3d10,param_2 + 0xa6,param_3);
  if (param_2[0x1f8] != 2) {
    FUN_00726838(param_2 + 0x1f8,param_2 + 0x1fb);
  }
  lVar19 = *(long *)(puVar4 + 0x3d10);
  if (lVar19 != 4) {
    memcpy(puVar4 + 0xca8,puVar4 + 0x3d18,0x4a8);
    uVar17 = *(undefined8 *)(puVar4 + 0x41c0);
    uVar7 = *(undefined4 *)(puVar4 + 0x41c8);
    unaff_x26 = (long *)(ulong)*(uint *)(puVar4 + 0x41cc);
    unaff_x27 = *(long **)(puVar4 + 0x41d0);
    FUN_001a42d8(param_2 + 0xa6);
    bVar12 = *(byte *)(param_2 + 0xa4);
    *(undefined1 *)((long)param_2 + 0x521) = 0;
    goto joined_r0x001c3d88;
  }
  uVar13 = 3;
LAB_001c424c:
  **(undefined1 **)(puVar4 + -0x15a0) = uVar13;
  **(undefined8 **)(puVar4 + -0x15c8) = 0x10;
  uVar13 = 4;
  goto LAB_001c4264;
LAB_001c2d28:
  *(undefined4 *)(*param_2 + 0x17a0) = 1000000000;
  lVar19 = *param_2;
  if (*(long *)(lVar19 + 0x1730) == -0x8000000000000000) goto code_r0x001c2d4c;
  goto LAB_001c2f18;
code_r0x001c2d4c:
  param_2[0x9e] = lVar19;
  *(undefined1 *)((long)param_2 + 0x4f9) = 0;
  goto LAB_001c2d54;
}


