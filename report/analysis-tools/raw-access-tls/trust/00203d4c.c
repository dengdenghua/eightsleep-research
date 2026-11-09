/* Ghidra static pseudocode; not original source. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00203d4c(undefined8 *param_1,long *param_2,undefined8 param_3)

{
  undefined1 (**ppauVar1) [16];
  undefined1 (*pauVar2) [16];
  undefined *puVar3;
  code *pcVar4;
  char cVar5;
  byte bVar6;
  int iVar7;
  undefined4 uVar8;
  undefined1 (*pauVar9) [16];
  undefined1 *puVar10;
  ulong uVar11;
  long lVar12;
  long lVar13;
  void *pvVar14;
  undefined1 (*pauVar15) [16];
  undefined8 *puVar16;
  undefined1 uVar17;
  long *plVar18;
  undefined1 (*pauVar19) [16];
  undefined1 (*pauVar20) [16];
  undefined1 (*unaff_x20) [16];
  undefined1 (*pauVar21) [16];
  undefined **ppuVar22;
  undefined1 (*pauVar23) [16];
  undefined1 (*pauVar24) [16];
  int *piVar25;
  long *plVar26;
  undefined8 uVar27;
  undefined1 (*pauVar28) [16];
  undefined1 auVar29 [16];
  undefined1 auVar30 [12];
  undefined1 (*local_33c8) [16];
  long *local_3388;
  undefined4 local_337c;
  undefined1 (*local_3378) [16];
  undefined1 (*local_3370) [16];
  undefined1 (*pauStack_3368) [16];
  undefined1 (*local_3360) [16];
  undefined1 (*pauStack_3358) [16];
  undefined1 (*local_3350) [16];
  undefined1 (*pauStack_3348) [16];
  undefined1 (*pauStack_3340) [16];
  undefined1 (*pauStack_3338) [16];
  undefined1 (*local_3330) [16];
  undefined1 (*pauStack_3328) [16];
  undefined1 (*pauStack_3320) [16];
  undefined1 (*pauStack_3318) [16];
  undefined1 (*local_3310) [16];
  undefined1 (*pauStack_3308) [16];
  undefined1 (*pauStack_3300) [16];
  undefined1 (*pauStack_32f8) [16];
  undefined1 (*local_32f0) [16];
  undefined1 (*pauStack_32e8) [16];
  undefined1 (*pauStack_32e0) [16];
  undefined1 (*pauStack_32d8) [16];
  undefined1 (*local_32d0) [16];
  undefined1 (*pauStack_32c8) [16];
  undefined1 (*pauStack_32c0) [16];
  undefined1 (*pauStack_32b8) [16];
  undefined1 (*local_32b0) [16];
  undefined1 (*pauStack_32a8) [16];
  undefined1 (*pauStack_32a0) [16];
  undefined1 (*pauStack_3298) [16];
  undefined1 (*local_3290) [16];
  undefined1 (*pauStack_3288) [16];
  undefined1 (*pauStack_3280) [16];
  undefined1 (*pauStack_3278) [16];
  undefined1 (*local_3270) [16];
  undefined1 (*pauStack_3268) [16];
  undefined1 (*pauStack_3260) [16];
  undefined1 (*pauStack_3258) [16];
  undefined1 (*local_3250) [16];
  undefined1 (*pauStack_3248) [16];
  undefined1 (*pauStack_3240) [16];
  undefined1 (*pauStack_3238) [16];
  undefined1 (*local_3230) [16];
  undefined1 (*pauStack_3228) [16];
  undefined1 (*pauStack_3220) [16];
  undefined1 (*pauStack_3218) [16];
  undefined1 (*local_3210) [16];
  undefined1 (*pauStack_3208) [16];
  undefined1 (*pauStack_3200) [16];
  undefined1 (*pauStack_31f8) [16];
  undefined1 (*local_31f0) [16];
  undefined1 (*pauStack_31e8) [16];
  long lStack_31e0;
  undefined1 (*pauStack_31d8) [16];
  undefined1 (*local_31d0) [16];
  undefined1 (*pauStack_31c8) [16];
  undefined1 (*local_31c0) [16];
  undefined1 (*local_31b8) [16];
  undefined1 (*local_31b0) [16];
  undefined1 (*pauStack_31a8) [16];
  undefined1 (*pauStack_31a0) [16];
  undefined1 (*pauStack_3198) [16];
  undefined1 (*local_3190) [16];
  undefined1 (*pauStack_3188) [16];
  undefined1 (*pauStack_3180) [16];
  undefined1 (*pauStack_3178) [16];
  undefined1 (*local_3170) [16];
  undefined1 (*pauStack_3168) [16];
  undefined1 (*local_3160) [16];
  undefined1 (*pauStack_3158) [16];
  undefined8 local_3150;
  undefined8 uStack_3148;
  undefined8 local_3140;
  undefined1 (*local_3130) [16];
  undefined1 (*pauStack_3128) [16];
  undefined1 (*pauStack_3120) [16];
  undefined1 (*pauStack_3118) [16];
  undefined1 (*local_3110) [16];
  undefined1 (*pauStack_3108) [16];
  undefined1 (*pauStack_3100) [16];
  undefined1 (*pauStack_30f8) [16];
  undefined1 (*local_30f0) [16];
  undefined1 (*pauStack_30e8) [16];
  undefined1 (*pauStack_30e0) [16];
  undefined1 (*pauStack_30d8) [16];
  undefined1 (*local_30d0) [16];
  undefined1 (*pauStack_30c8) [16];
  undefined1 (*pauStack_30c0) [16];
  undefined1 (*pauStack_30b8) [16];
  undefined8 local_30b0;
  undefined8 uStack_30a8;
  undefined8 local_30a0;
  undefined1 (*local_3090) [16];
  undefined1 (*local_3088) [16];
  undefined1 (*pauStack_3080) [16];
  undefined1 (*local_3078) [16];
  undefined1 (*pauStack_3070) [16];
  undefined1 (*local_3068) [16];
  undefined1 (*pauStack_3060) [16];
  undefined1 (*local_3058) [16];
  undefined1 (*pauStack_3050) [16];
  undefined1 (*local_3048) [16];
  undefined1 (*pauStack_3040) [16];
  undefined1 (*local_3038) [16];
  undefined1 (*pauStack_3030) [16];
  undefined1 (*local_3028) [16];
  undefined1 (*pauStack_3020) [16];
  undefined1 (*local_3018) [16];
  undefined1 (*pauStack_3010) [16];
  undefined8 local_3008;
  undefined8 uStack_3000;
  undefined8 local_2ff8;
  long local_2fa8;
  long local_2fa0;
  undefined1 local_2f97;
  undefined1 (*local_2e60) [16];
  undefined1 (*pauStack_2e58) [16];
  undefined1 (*local_2e50) [16];
  undefined1 (*pauStack_2e48) [16];
  undefined1 (*local_2e40) [16];
  undefined1 (*pauStack_2e38) [16];
  undefined1 (*local_2e30) [16];
  undefined1 (*pauStack_2e28) [16];
  undefined1 (*local_2e20) [16];
  undefined1 (*pauStack_2e18) [16];
  undefined1 (*local_2e10) [16];
  undefined1 (*pauStack_2e08) [16];
  undefined1 (*local_2e00) [16];
  undefined1 (*pauStack_2df8) [16];
  undefined1 (*local_2df0) [16];
  undefined1 (*pauStack_2de8) [16];
  undefined1 (*local_2de0) [16];
  undefined1 (*pauStack_2dd8) [16];
  undefined1 (*local_2dd0) [16];
  undefined1 (*pauStack_2dc8) [16];
  int *local_2dc0;
  long lStack_2db8;
  long local_2db0;
  undefined1 (*local_2da0) [16];
  undefined1 (*pauStack_2d98) [16];
  undefined1 (*local_2d90) [16];
  undefined1 (*pauStack_2d88) [16];
  undefined1 (**local_2d78) [16];
  undefined8 local_2d70;
  undefined8 *local_2d68;
  undefined1 (*local_2d60) [16];
  undefined1 (*pauStack_2d58) [16];
  undefined1 (*local_2d50) [16];
  undefined1 (*local_2d48) [16];
  undefined8 local_2d40;
  undefined1 (*local_2d38) [16];
  undefined1 (*local_2d30) [16];
  undefined1 (*pauStack_2d28) [16];
  undefined1 (*local_2d20) [16];
  undefined1 uStack_2d18;
  uint7 uStack_2d17;
  undefined1 (*local_2d10) [16];
  undefined1 (*pauStack_2d08) [16];
  undefined1 (*local_2d00) [16];
  undefined1 (*pauStack_2cf8) [16];
  undefined1 (*local_2cf0) [16];
  undefined1 (*pauStack_2ce8) [16];
  undefined1 (*local_2ce0) [16];
  undefined1 (*pauStack_2cd8) [16];
  undefined1 (*local_2cd0) [16];
  undefined1 (*pauStack_2cc8) [16];
  undefined1 (*local_2cc0) [16];
  undefined1 (*pauStack_2cb8) [16];
  undefined1 (*local_2cb0) [16];
  undefined1 (*pauStack_2ca8) [16];
  undefined1 (*local_2ca0) [16];
  undefined1 (*pauStack_2c98) [16];
  undefined1 (*local_2c90) [16];
  undefined1 (*pauStack_2c88) [16];
  undefined1 (*local_2c80) [16];
  undefined1 (*pauStack_2c78) [16];
  undefined1 (*pauStack_2c70) [16];
  undefined1 (*local_2c60) [16];
  undefined1 (*pauStack_2c58) [16];
  undefined1 (*local_2c50) [16];
  undefined1 (*pauStack_2c48) [16];
  undefined8 local_2c40;
  undefined1 (*local_2c30) [16];
  undefined1 (*pauStack_2c28) [16];
  undefined1 (*local_2c20) [16];
  undefined1 (*pauStack_2c18) [16];
  undefined1 (*local_2c10) [16];
  undefined1 (*pauStack_2c08) [16];
  undefined1 (*local_2c00) [16];
  long *plStack_2bf8;
  undefined *local_2bf0;
  undefined1 (**ppauStack_2be8) [16];
  undefined1 (**local_2be0) [16];
  undefined *puStack_2bd8;
  undefined1 (**local_2bd0) [16];
  long lStack_2bc8;
  undefined **local_2bc0;
  undefined1 (**ppauStack_2bb8) [16];
  long local_2bb0;
  undefined *puStack_2ba8;
  undefined1 (**local_2ba0) [16];
  undefined8 local_2b98;
  undefined *local_2b90;
  long local_2ae0;
  long local_2ad8;
  undefined1 local_2aa0;
  long local_2a00;
  long lStack_29f8;
  long local_29f0;
  long lStack_29e8;
  long local_29e0;
  undefined8 local_2060;
  undefined1 (*local_16b0) [16];
  undefined1 (*pauStack_16a8) [16];
  undefined1 (*pauStack_16a0) [16];
  undefined1 (*pauStack_1698) [16];
  undefined1 (*pauStack_1690) [16];
  undefined1 (*local_1688) [16];
  undefined1 (*pauStack_1680) [16];
  undefined1 (*local_1678) [16];
  undefined1 (*pauStack_1670) [16];
  undefined1 (*local_1668) [16];
  undefined1 (*pauStack_1660) [16];
  undefined1 (*local_1658) [16];
  undefined1 (*pauStack_1650) [16];
  undefined1 (*local_1648) [16];
  undefined1 (*pauStack_1640) [16];
  undefined1 (*local_1638) [16];
  undefined1 (*pauStack_1630) [16];
  undefined1 (*local_1628) [16];
  undefined8 local_1620;
  undefined1 (*pauStack_1618) [16];
  undefined8 local_1610;
  undefined5 uStack_1608;
  undefined3 uStack_1603;
  undefined5 uStack_1600;
  long lStack_15fb;
  undefined8 local_1060;
  long local_130;
  long lStack_128;
  long local_120;
  long lStack_118;
  long local_110;
  undefined1 (*local_100) [16];
  undefined1 (*pauStack_f8) [16];
  undefined1 (*local_f0) [16];
  undefined1 (*pauStack_e8) [16];
  undefined1 (*local_e0) [16];
  undefined1 (*pauStack_d8) [16];
  undefined1 (*local_d0) [16];
  undefined1 (*pauStack_c8) [16];
  undefined1 (*local_c0) [16];
  undefined1 (*pauStack_b8) [16];
  undefined1 (*local_b0) [16];
  undefined1 (*pauStack_a8) [16];
  undefined1 (*local_a0) [16];
  undefined1 (*pauStack_98) [16];
  undefined1 (*local_90) [16];
  undefined1 (*pauStack_88) [16];
  undefined8 local_80;
  undefined8 uStack_78;
  undefined8 local_70;
  
  local_1060 = 0;
  local_2060 = 0;
  pauStack_3060 = (undefined1 (*) [16])0x0;
  bVar6 = *(byte *)(param_2 + 0x16);
  if (4 < bVar6) {
    if (bVar6 == 5) goto LAB_00204c2c;
    if (bVar6 == 6) {
      bVar6 = *(byte *)(param_2 + 0x48);
      if (2 < bVar6) {
        if (bVar6 != 3) goto LAB_0020507c;
        lVar12 = param_2[0x2fa];
        goto joined_r0x00203de8;
      }
      if (bVar6 == 0) {
        lVar12 = param_2[0x2c];
        plVar18 = (long *)param_2[0x2d];
        lVar13 = param_2[0x2a];
        uVar8 = (undefined4)param_2[0x2b];
        goto LAB_00204d64;
      }
      if (bVar6 == 1) {
                    /* WARNING: Subroutine does not return */
        FUN_00191a20(&PTR_s__project_rawrs_src_raw_uploader__009c05b0);
      }
                    /* WARNING: Subroutine does not return */
      FUN_00191a54(&PTR_s__project_rawrs_src_raw_uploader__009c05b0);
    }
    bVar6 = *(byte *)(param_2 + 0x25);
    if (bVar6 < 2) {
      if (bVar6 == 0) goto LAB_0020643c;
                    /* WARNING: Subroutine does not return */
      FUN_00191a20(&PTR_s__cargo_registry_src_index_crates_009c0c10);
    }
    if (bVar6 != 3) {
                    /* WARNING: Subroutine does not return */
      FUN_00191a54(&PTR_s__cargo_registry_src_index_crates_009c0c10);
    }
    bVar6 = *(byte *)(param_2 + 0x24);
    if (bVar6 < 2) {
      if (bVar6 == 0) {
        lVar12 = param_2[0x18];
        goto LAB_00206450;
      }
                    /* WARNING: Subroutine does not return */
      FUN_00191a20(&PTR_s__cargo_registry_src_index_crates_009c0c28);
    }
    if (bVar6 != 3) {
                    /* WARNING: Subroutine does not return */
      FUN_00191a54(&PTR_s__cargo_registry_src_index_crates_009c0c28);
    }
    bVar6 = *(byte *)(param_2 + 0x1b);
    if (2 < bVar6) {
      if (bVar6 != 3) goto LAB_00206488;
      lVar12 = param_2[0x1a];
      goto LAB_00206464;
    }
    if (bVar6 == 0) {
      lVar12 = param_2[0x19];
      param_2[0x1a] = lVar12;
      goto LAB_00206464;
    }
    if (bVar6 == 1) {
                    /* WARNING: Subroutine does not return */
      FUN_00191a20(&PTR_s__cargo_registry_src_index_crates_009c0c40);
    }
                    /* WARNING: Subroutine does not return */
    FUN_00191a54(&PTR_s__cargo_registry_src_index_crates_009c0c40);
  }
  if (bVar6 < 3) {
    if (bVar6 == 0) {
      param_2[1] = 0;
      goto LAB_00204b04;
    }
    if (bVar6 == 1) {
                    /* WARNING: Subroutine does not return */
      FUN_00191a20();
    }
                    /* WARNING: Subroutine does not return */
    FUN_00191a54(&PTR_s__project_rawrs_src_raw_uploader__009c0968);
  }
  if (bVar6 != 3) {
    bVar6 = *(byte *)((long)param_2 + 0x102);
    if (2 < bVar6) {
      if (bVar6 == 3) {
        lVar12 = param_2[0x68];
        goto joined_r0x00203e28;
      }
      bVar6 = *(byte *)((long)param_2 + 0x209);
      if (4 < bVar6) goto LAB_0020589c;
      goto LAB_00203ea4;
    }
    if (bVar6 == 0) {
      lVar12 = param_2[0x1e];
      plVar18 = (long *)param_2[0x1f];
      goto LAB_00205564;
    }
    if (bVar6 == 1) {
                    /* WARNING: Subroutine does not return */
      FUN_00191a20(&PTR_s__project_rawrs_src_raw_uploader__009c04d0);
    }
                    /* WARNING: Subroutine does not return */
    FUN_00191a54(&PTR_s__project_rawrs_src_raw_uploader__009c04d0);
  }
LAB_0020538c:
  FUN_00202334(&local_16b0,param_2 + 0x17,param_3);
  pauVar20 = local_16b0;
  if (local_16b0 == (undefined1 (*) [16])&DAT_00000010) {
    *param_1 = 0x10;
    uVar17 = 3;
LAB_0020685c:
    *(undefined1 *)(param_2 + 0x16) = uVar17;
    return;
  }
  cVar5 = *(char *)((long)param_2 + 0xd1);
  local_2c00 = local_1678;
  pauStack_2c28 = pauStack_16a0;
  local_2c30 = pauStack_16a8;
  pauStack_2c18 = pauStack_1690;
  local_2c20 = pauStack_1698;
  pauStack_2c08 = pauStack_1680;
  local_2c10 = local_1688;
  if (cVar5 == '\x05') {
    if (*(char *)((long)param_2 + 0x759) == '\x03') {
      FUN_001eaa8c(param_2 + 0x1f);
    }
  }
  else if (((cVar5 == '\x04') || (cVar5 == '\x03')) && ((char)param_2[0x282] == '\x03')) {
    FUN_001f2aa0(param_2 + 0x1e);
  }
  puVar3 = PTR_PTR_009fa838;
  unaff_x20 = pauVar20;
  if (pauVar20 != (undefined1 (*) [16])&DAT_0000000f) {
    pauStack_16a0 = pauStack_2c28;
    pauStack_16a8 = local_2c30;
    pauStack_1690 = pauStack_2c18;
    pauStack_1698 = local_2c20;
    pauStack_1680 = pauStack_2c08;
    local_1688 = local_2c10;
    local_1678 = local_2c00;
    local_16b0 = pauVar20;
    if (((*(ulong *)PTR_DAT_009fac58 < 4) &&
        ((unaff_x20 = (undefined1 (*) [16])puVar3, (byte)PTR_PTR_009fa838[0x10] - 1 < 2 ||
         (((byte)PTR_PTR_009fa838[0x10] != 0 &&
          (cVar5 = FUN_0018fb0c(PTR_PTR_009fa838), cVar5 != '\0')))))) &&
       (uVar11 = FUN_007243f8(*(undefined8 *)puVar3), (uVar11 & 1) != 0)) {
      lVar12 = *(long *)puVar3;
      if (*(undefined1 (**) [16])(lVar12 + 0x38) == (undefined1 (*) [16])0x0) {
                    /* WARNING: Subroutine does not return */
        FUN_0019151c(0x780351,0x22,&PTR_s__project_rawrs_src_raw_uploader__009c09b0);
      }
      local_2e50 = (undefined1 (*) [16])(lVar12 + 0x30);
      local_100 = *(undefined1 (**) [16])*local_2e50;
      pauStack_e8 = *(undefined1 (**) [16])(lVar12 + 0x48);
      local_f0 = *(undefined1 (**) [16])(lVar12 + 0x40);
      pauStack_31c8 = (undefined1 (*) [16])&local_3090;
      local_e0 = (undefined1 (*) [16])0x0;
      local_3370 = (undefined1 (*) [16])&local_16b0;
      pauStack_3368 = (undefined1 (*) [16])FUN_001f4d78;
      local_3090 = (undefined1 (*) [16])&PTR_DAT_009c09c8;
      pauStack_3080 = (undefined1 (*) [16])&local_3370;
      local_31d0 = (undefined1 (*) [16])&local_100;
      local_3088 = (undefined1 (*) [16])0x2;
      local_31c0 = (undefined1 (*) [16])&DAT_009bec08;
      local_2e60 = (undefined1 (*) [16])&local_31d0;
      pauStack_3070 = (undefined1 (*) [16])0x0;
      local_3078 = (undefined1 (*) [16])0x1;
      pauStack_2e58 = (undefined1 (*) [16])0x1;
      pauStack_f8 = *(undefined1 (**) [16])(lVar12 + 0x38);
      FUN_00724b8c(lVar12,&local_2e60);
    }
    FUN_001edb28(&local_16b0);
  }
  lVar12 = *param_2;
LAB_00205550:
  plVar18 = param_2 + 1;
  param_2[0x1e] = lVar12;
  param_2[0x1f] = (long)plVar18;
  *(undefined1 *)((long)param_2 + 0x102) = 0;
LAB_00205564:
  *(undefined2 *)(param_2 + 0x20) = 0;
  *(long **)*(undefined1 (*) [16])(param_2 + 0x18) = plVar18;
  puVar3 = PTR_PTR_009fa640;
  if ((2 < *(ulong *)PTR_DAT_009fac58) ||
     (((unaff_x20 = (undefined1 (*) [16])puVar3, 1 < (byte)PTR_PTR_009fa640[0x10] - 1 &&
       (((byte)PTR_PTR_009fa640[0x10] == 0 ||
        (cVar5 = FUN_0018fb0c(PTR_PTR_009fa640), cVar5 == '\0')))) ||
      (uVar11 = FUN_007243f8(*(undefined8 *)puVar3), (uVar11 & 1) == 0)))) {
    param_2[0x1d] = 0;
    *(undefined1 *)(param_2 + 0x20) = 1;
    *(undefined1 *)((long)param_2 + 0x101) = 1;
    local_2fa0 = param_2[0x18];
    param_2[0x19] = 2;
LAB_00205878:
    local_2f97 = 0;
    *(undefined1 *)((long)param_2 + 0x101) = 0;
    local_2fa8 = lVar12;
    memcpy(param_2 + 0x22,&local_3090,0x230);
    bVar6 = *(byte *)((long)param_2 + 0x209);
    if (bVar6 < 5) {
LAB_00203ea4:
      plVar18 = param_2 + 0x22;
      if (bVar6 < 3) {
        if (bVar6 != 0) {
          if (bVar6 == 1) {
                    /* WARNING: Subroutine does not return */
            FUN_00191a20(&PTR_s__project_rawrs_src_raw_uploader__009c0498);
          }
                    /* WARNING: Subroutine does not return */
          FUN_00191a54(&PTR_s__project_rawrs_src_raw_uploader__009c0498);
        }
        pauVar20 = (undefined1 (*) [16])param_2[0x3f];
        *(undefined1 *)(param_2 + 0x41) = 0;
        *(undefined1 *)((long)param_2 + 0x242) = 0;
        param_2[0x47] = (long)pauVar20;
        *(undefined2 *)(param_2 + 0x48) = 0;
        uVar11 = *(ulong *)PTR_DAT_009fac58;
        plVar26 = (long *)PTR_PTR_009fab90;
joined_r0x00203fa8:
        PTR_PTR_009fab90 = (undefined *)plVar26;
        if (uVar11 < 3) {
          local_3388 = param_2 + 0x42;
          if (((1 < *(byte *)(plVar26 + 2) - 1) &&
              ((*(byte *)(plVar26 + 2) == 0 || (cVar5 = FUN_0018fb0c(plVar26), cVar5 == '\0')))) ||
             (uVar11 = FUN_007243f8(*plVar26), (uVar11 & 1) == 0)) goto LAB_002041c4;
          lVar12 = *plVar26;
          pauVar19 = *(undefined1 (**) [16])(lVar12 + 0x38);
          if (pauVar19 == (undefined1 (*) [16])0x0) {
                    /* WARNING: Subroutine does not return */
            FUN_0019151c(0x780351,0x22,&PTR_s__project_rawrs_src_raw_uploader__009c09e8);
          }
          local_2d50 = *(undefined1 (**) [16])(lVar12 + 0x40);
          local_2d48 = *(undefined1 (**) [16])(lVar12 + 0x48);
          local_2d60 = *(undefined1 (**) [16])(lVar12 + 0x30);
          local_2d38 = pauVar20 + 0x11e;
          local_2d40 = 0;
          pauStack_2d58 = pauVar19;
          if (pauVar19 == (undefined1 (*) [16])0x1) {
                    /* WARNING: Subroutine does not return */
            FUN_0019151c(0x780351,0x22,&PTR_s__project_rawrs_src_raw_uploader__009c09e8);
          }
          local_2c40 = 1;
          local_2c60 = local_2d60;
          pauStack_2c58 = pauVar19;
          local_2c50 = local_2d50;
          pauStack_2c48 = local_2d48;
          if (pauVar19 < (undefined1 (*) [16])0x3) {
                    /* WARNING: Subroutine does not return */
            FUN_0019151c(0x780351,0x22,&PTR_s__project_rawrs_src_raw_uploader__009c09e8);
          }
          local_2dc0 = (int *)0x2;
          local_2de0 = local_2d60;
          pauStack_2dd8 = pauVar19;
          local_2dd0 = local_2d50;
          pauStack_2dc8 = local_2d48;
          if (pauVar19 == (undefined1 (*) [16])0x3) {
                    /* WARNING: Subroutine does not return */
            FUN_0019151c(0x780351,0x22,&PTR_s__project_rawrs_src_raw_uploader__009c09e8);
          }
          pauStack_16a8 = (undefined1 (*) [16])&local_2d38;
          local_2c80 = (undefined1 (*) [16])0x3;
          local_16b0 = (undefined1 (*) [16])&local_2d60;
          pauStack_16a0 = (undefined1 (*) [16])&DAT_009c0438;
          pauStack_1690 = pauVar20 + 300;
          local_1678 = (undefined1 (*) [16])((long)pauVar20[0x140] + 8);
          local_1688 = (undefined1 (*) [16])&PTR_FUN_009c03a0;
          pauStack_1680 = (undefined1 (*) [16])&local_2de0;
          pauStack_1670 = (undefined1 (*) [16])&DAT_009c03c0;
          local_1668 = (undefined1 (*) [16])&local_2ca0;
          local_1658 = (undefined1 (*) [16])&DAT_009c03e0;
          pauStack_1698 = (undefined1 (*) [16])&local_2c60;
          local_2d78 = &local_16b0;
          pauStack_1660 = (undefined1 (*) [16])0x1;
          local_2d70 = 4;
          local_2d68 = (undefined8 *)(lVar12 + 0x30);
          local_2ca0 = local_2d60;
          pauStack_2c98 = pauVar19;
          local_2c90 = local_2d50;
          pauStack_2c88 = local_2d48;
          FUN_00723fe4(local_3388,lVar12,&local_2d78);
          *(undefined1 *)(param_2 + 0x48) = 1;
          *(undefined1 *)((long)param_2 + 0x241) = 1;
          uStack_2d18 = 0;
          if (param_2[0x42] != 2) {
            local_2cd0 = (undefined1 (*) [16])((ulong)uStack_2d17 << 8);
            *(undefined2 *)(param_2 + 0x48) = 0;
            local_2cf0 = (undefined1 (*) [16])param_2[0x46];
            pauStack_2d08 = (undefined1 (*) [16])param_2[0x43];
            local_2d10 = (undefined1 (*) [16])*local_3388;
            pauStack_2cf8 = (undefined1 (*) [16])param_2[0x45];
            local_2d00 = (undefined1 (*) [16])param_2[0x44];
            param_2[0x51] = (long)local_2cd0;
            param_2[0x4a] = (long)pauStack_2d08;
            param_2[0x49] = (long)local_2d10;
            param_2[0x4c] = (long)pauStack_2cf8;
            param_2[0x4b] = (long)local_2d00;
            param_2[0x4e] = (long)pauVar20;
            param_2[0x4d] = (long)local_2cf0;
            param_2[0x50] = (long)local_2d20;
            param_2[0x4f] = (long)pauStack_2d28;
            lVar12 = param_2[0x49];
            pauStack_2cd8 = local_2d20;
            local_2ce0 = pauStack_2d28;
            local_2d30 = pauVar20;
            pauStack_2ce8 = pauVar20;
            goto joined_r0x002041bc;
          }
        }
        else {
LAB_002041c4:
          param_2[0x46] = 0;
          *(undefined2 *)(param_2 + 0x48) = 0x101;
          param_2[0x42] = 2;
        }
        uStack_2d18 = 0;
        *(undefined1 *)((long)param_2 + 0x241) = 0;
        param_2[0x4a] = (long)pauStack_2d28;
        param_2[0x49] = (long)pauVar20;
        param_2[0x4c] = (ulong)uStack_2d17 << 8;
        param_2[0x4b] = (long)local_2d20;
        local_2d30 = pauVar20;
LAB_002041f4:
        bVar6 = *(byte *)(param_2 + 0x4c);
        if (bVar6 < 2) {
          if (bVar6 != 0) {
                    /* WARNING: Subroutine does not return */
            FUN_00191a20(&PTR_s__project_rawrs_src_raw_uploader__009c09e8);
          }
          lVar12 = param_2[0x49];
          auVar29 = FUN_003a7400(lVar12 + 0x143e,*(undefined8 *)(lVar12 + 0x12b0),
                                 *(undefined8 *)(lVar12 + 0x12b8),*(undefined2 *)(lVar12 + 0x143c));
          *(undefined1 (*) [16])(param_2 + 0x4a) = auVar29;
        }
        else {
          if (bVar6 != 3) {
                    /* WARNING: Subroutine does not return */
            FUN_00191a54(&PTR_s__project_rawrs_src_raw_uploader__009c09e8);
          }
          auVar29 = *(undefined1 (*) [16])(param_2 + 0x4a);
        }
        (**(code **)(auVar29._8_8_ + 0x18))(&local_16b0,auVar29._0_8_,param_3);
        pauVar20 = pauStack_1698;
        pauVar15 = pauStack_16a0;
        pauVar19 = pauStack_16a8;
        unaff_x20 = local_16b0;
        if (local_16b0 != (undefined1 (*) [16])0x3) {
          puVar16 = (undefined8 *)param_2[0x4b];
          lVar12 = param_2[0x4a];
          if ((code *)*puVar16 != (code *)0x0) {
            (*(code *)*puVar16)(lVar12);
          }
          pauVar28 = (undefined1 (*) [16])puVar16[1];
          if (pauVar28 != (undefined1 (*) [16])0x0) {
            uVar8 = FUN_006212cc(puVar16[2],pauVar28);
            FUN_00637bc0(lVar12,pauVar28,uVar8);
          }
          if (unaff_x20 == (undefined1 (*) [16])0x2) {
            pauVar21 = (undefined1 (*) [16])0x1;
            pauVar23 = pauVar20;
            pauVar24 = pauVar15;
            pauVar20 = pauVar19;
            pauVar9 = pauVar15;
            pauVar19 = pauVar28;
          }
          else {
            local_33c8 = *(undefined1 (**) [16])(param_2[0x49] + 0x13b8);
            uVar17 = *PTR_DAT_009faac8;
            local_16b0 = unaff_x20;
            pauStack_16a8 = pauVar19;
            pauStack_16a0 = pauVar15;
            pauStack_1698 = pauVar20;
            iVar7 = FUN_006212cc(1,0x200000);
            if (iVar7 == 0) {
              pauVar9 = malloc(0x200000);
            }
            else {
              pauVar9 = (undefined1 (*) [16])FUN_006341e8(0x200000,iVar7);
            }
            if (pauVar9 == (undefined1 (*) [16])0x0) {
                    /* WARNING: Subroutine does not return */
              FUN_00191384(1,0x200000,&PTR_s__project_rawrs_src_raw_client_rs_009cbe90);
            }
            pauVar24 = (undefined1 (*) [16])0x200000;
            pauVar23 = (undefined1 (*) [16])0x0;
            pauVar21 = pauVar15;
          }
          pauVar15 = (undefined1 (*) [16])0x0;
          *(undefined1 *)(param_2 + 0x4c) = 1;
          pauVar28 = (undefined1 (*) [16])0x0;
          bVar6 = *(byte *)(param_2 + 0x48);
          *(undefined1 *)((long)param_2 + 0x241) = 0;
          pauVar2 = local_33c8;
joined_r0x00204340:
          if ((bVar6 & 1) != 0) {
            local_3388 = param_2 + 0x42;
            lVar12 = *local_3388;
            if (((lVar12 != 2) && (FUN_0072686c(local_3388,param_2[0x45]), lVar12 != 0)) &&
               (lVar12 = FUN_0077c930(0xffffffffffffffff,param_2[0x43]), lVar12 == 1)) {
              DataMemoryBarrier(2,1);
              FUN_0072502c(param_2 + 0x43);
            }
          }
          local_3388 = param_2 + 0x42;
          *(undefined1 *)(param_2 + 0x48) = 0;
          *(undefined1 *)((long)param_2 + 0x242) = 1;
          param_2[0x2c] = (long)unaff_x20;
          param_2[0x2d] = (long)pauVar19;
          param_2[0x2e] = (long)pauVar21;
          param_2[0x2f] = (long)pauVar20;
          param_2[0x30] = (long)pauVar24;
          param_2[0x31] = (long)pauVar9;
          param_2[0x32] = (long)pauVar23;
          param_2[0x33] = (long)pauVar28;
          param_2[0x34] = (long)pauVar2;
          param_2[0x35] = (long)pauVar15;
          FUN_001e7508(local_3388);
          if (param_2[0x2c] != 2) {
            *(undefined1 *)(param_2 + 0x41) = 1;
            param_2[0x27] = param_2[0x31];
            param_2[0x26] = param_2[0x30];
            param_2[0x29] = param_2[0x33];
            param_2[0x28] = param_2[0x32];
            param_2[0x2b] = param_2[0x35];
            param_2[0x2a] = param_2[0x34];
            param_2[0x23] = param_2[0x2d];
            *plVar18 = param_2[0x2c];
            param_2[0x25] = param_2[0x2f];
            param_2[0x24] = param_2[0x2e];
            *(undefined4 *)(param_2[0x3f] + 5000) = 1000000000;
            FUN_0076ca70(&local_2c60,param_2[0x3f] + 0x12c0);
            FUN_0076ca70(&local_2de0,param_2[0x3f] + 0x12d8);
            uVar17 = *PTR_DAT_009faac8;
            iVar7 = FUN_006212cc(1,1);
            if (iVar7 == 0) {
              puVar10 = malloc(1);
            }
            else {
              puVar10 = (undefined1 *)FUN_006341e8(1,iVar7);
            }
            if (puVar10 == (undefined1 *)0x0) {
                    /* WARNING: Subroutine does not return */
              FUN_00191384(1,1,&PTR_DAT_009bf880);
            }
            *puVar10 = 0x32;
            param_2[0x43] = (long)pauStack_2c58;
            *local_3388 = (long)local_2c60;
            param_2[0x45] = (long)local_2de0;
            param_2[0x44] = (long)local_2c50;
            param_2[0x47] = (long)local_2dd0;
            param_2[0x46] = (long)pauStack_2dd8;
            param_2[0x48] = 1;
            param_2[0x4a] = 1;
            *(undefined1 *)(param_2 + 0x4b) = 1;
            param_2[0x52] = (long)local_1688;
            param_2[0x51] = (long)pauStack_1690;
            param_2[0x54] = (long)local_1678;
            param_2[0x53] = (long)pauStack_1680;
            param_2[0x49] = (long)puVar10;
            param_2[0x4c] = (long)plVar18;
            param_2[0x56] = (long)local_1668;
            param_2[0x55] = (long)pauStack_1670;
            param_2[0x57] = (long)pauStack_1660;
            param_2[0x4e] = (long)pauStack_16a8;
            param_2[0x4d] = (long)local_16b0;
            param_2[0x50] = (long)pauStack_1698;
            param_2[0x4f] = (long)pauStack_16a0;
            *(undefined1 *)(param_2 + 0x58) = 0;
            local_2d00 = local_2c50;
            pauStack_2cf8 = local_2de0;
            local_2cf0 = pauStack_2dd8;
            pauStack_2ce8 = local_2dd0;
            local_2ca0 = local_2c60;
            pauStack_2c98 = pauStack_2c58;
            local_2c90 = local_2c50;
            pauStack_2c88 = local_2de0;
            local_2c80 = pauStack_2dd8;
            pauStack_2c78 = local_2dd0;
            goto LAB_00205a88;
          }
          param_2[0x61] = param_2[0x2f];
          param_2[0x60] = param_2[0x2e];
          param_2[99] = param_2[0x31];
          param_2[0x62] = param_2[0x30];
          param_2[0x65] = param_2[0x33];
          param_2[100] = param_2[0x32];
          param_2[0x67] = param_2[0x35];
          param_2[0x66] = param_2[0x34];
          puVar3 = PTR_PTR_009fad28;
          if (*(ulong *)PTR_DAT_009fac58 < 5) {
            unaff_x20 = (undefined1 (*) [16])(param_2 + 0x60);
            if ((((byte)PTR_PTR_009fad28[0x10] - 1 < 2) ||
                (((byte)PTR_PTR_009fad28[0x10] != 0 &&
                 (cVar5 = FUN_0018fb0c(PTR_PTR_009fad28), cVar5 != '\0')))) &&
               (iVar7 = FUN_007243f8(*(undefined8 *)puVar3), iVar7 != 0)) {
              lVar12 = *(long *)puVar3;
              if (*(undefined1 (**) [16])(lVar12 + 0x38) == (undefined1 (*) [16])0x0) {
                    /* WARNING: Subroutine does not return */
                FUN_0019151c(0x780351,0x22,&PTR_s__project_rawrs_src_raw_uploader__009c04e8);
              }
              pauStack_2c58 = (undefined1 (*) [16])FUN_001f4d78;
              local_16b0 = (undefined1 (*) [16])&PTR_s_raw_client_connect_failure_009c0500;
              pauStack_16a0 = (undefined1 (*) [16])&local_2c60;
              local_2dd0 = (undefined1 (*) [16])(lVar12 + 0x30);
              local_2d10 = *(undefined1 (**) [16])*local_2dd0;
              local_2ca0 = (undefined1 (*) [16])&local_2d10;
              pauStack_2cf8 = *(undefined1 (**) [16])(lVar12 + 0x48);
              local_2d00 = *(undefined1 (**) [16])(lVar12 + 0x40);
              pauStack_2c98 = (undefined1 (*) [16])&local_16b0;
              local_2c90 = (undefined1 (*) [16])&DAT_009bec08;
              local_2de0 = (undefined1 (*) [16])&local_2ca0;
              local_2cf0 = (undefined1 (*) [16])0x0;
              pauStack_16a8 = (undefined1 (*) [16])0x1;
              pauStack_1690 = (undefined1 (*) [16])0x0;
              pauStack_1698 = (undefined1 (*) [16])0x1;
              pauStack_2dd8 = (undefined1 (*) [16])0x1;
              pauStack_2d08 = *(undefined1 (**) [16])(lVar12 + 0x38);
              local_2c60 = unaff_x20;
              FUN_00724b8c(lVar12,&local_2de0);
            }
          }
          param_2[0x47] = param_2[0x3f];
          *(undefined1 (**) [16])((long)param_2 + 0x2cb) = local_1628;
          *(undefined1 (**) [16])((long)param_2 + 0x2c3) = pauStack_1630;
          *(undefined1 (**) [16])((long)param_2 + 0x2db) = pauStack_1618;
          *(long *)((long)param_2 + 0x2d3) = local_1620;
          *(ulong *)((long)param_2 + 0x2eb) = CONCAT35(uStack_1603,uStack_1608);
          *(undefined8 *)((long)param_2 + 0x2e3) = local_1610;
          param_2[0x5f] = lStack_15fb;
          param_2[0x5e] = CONCAT53(uStack_1600,uStack_1603);
          *(undefined1 *)((long)param_2 + 0x242) = 0;
          *(undefined1 (**) [16])((long)param_2 + 0x28b) = local_1668;
          *(undefined1 (**) [16])((long)param_2 + 0x283) = pauStack_1670;
          *(undefined1 (**) [16])((long)param_2 + 0x29b) = local_1658;
          *(undefined1 (**) [16])((long)param_2 + 0x293) = pauStack_1660;
          *(undefined1 (**) [16])((long)param_2 + 0x2ab) = local_1648;
          *(undefined1 (**) [16])((long)param_2 + 0x2a3) = pauStack_1650;
          *(undefined1 (**) [16])((long)param_2 + 699) = local_1638;
          *(undefined1 (**) [16])((long)param_2 + 0x2b3) = pauStack_1640;
          *(undefined1 (**) [16])((long)param_2 + 0x24b) = pauStack_16a8;
          *(undefined1 (**) [16])((long)param_2 + 0x243) = local_16b0;
          *(undefined1 (**) [16])((long)param_2 + 0x25b) = pauStack_1698;
          *(undefined1 (**) [16])((long)param_2 + 0x253) = pauStack_16a0;
          *(undefined1 (**) [16])((long)param_2 + 0x26b) = local_1688;
          *(undefined1 (**) [16])((long)param_2 + 0x263) = pauStack_1690;
          *(undefined1 (**) [16])((long)param_2 + 0x27b) = local_1678;
          *(undefined1 (**) [16])((long)param_2 + 0x273) = pauStack_1680;
          goto LAB_00204534;
        }
        *(undefined1 *)(param_2 + 0x4c) = 3;
        uVar17 = 4;
LAB_00204740:
        *(undefined1 *)((long)param_2 + 0x242) = uVar17;
        uVar17 = 3;
LAB_00206844:
        *(undefined1 *)((long)param_2 + 0x209) = uVar17;
        uVar17 = 4;
        goto LAB_0020684c;
      }
      if (bVar6 == 3) {
        bVar6 = *(byte *)((long)param_2 + 0x242);
        if (bVar6 < 3) {
          if (bVar6 != 0) {
            if (bVar6 == 1) {
                    /* WARNING: Subroutine does not return */
              FUN_00191a20(&PTR_s__project_rawrs_src_raw_uploader__009c0a00);
            }
                    /* WARNING: Subroutine does not return */
            FUN_00191a54(&PTR_s__project_rawrs_src_raw_uploader__009c0a00);
          }
          pauVar20 = (undefined1 (*) [16])param_2[0x47];
          *(undefined2 *)(param_2 + 0x48) = 0;
          uVar11 = *(ulong *)PTR_DAT_009fac58;
          plVar26 = (long *)PTR_PTR_009fab90;
          goto joined_r0x00203fa8;
        }
        if (bVar6 != 3) goto LAB_002041f4;
        lVar12 = param_2[0x49];
joined_r0x002041bc:
        if (lVar12 != 2) {
          FUN_00726804(param_2 + 0x49,param_2 + 0x4c);
        }
        plVar26 = param_2 + 0x49;
        FUN_0023b508(&local_16b0,param_2 + 0x4e,param_3);
        if (*plVar26 != 2) {
          FUN_00726838(plVar26,param_2 + 0x4c);
        }
        pauVar15 = local_1668;
        pauVar2 = pauStack_1670;
        pauVar28 = local_1678;
        pauVar23 = pauStack_1680;
        pauVar9 = local_1688;
        pauVar24 = pauStack_1690;
        pauVar20 = pauStack_1698;
        pauVar21 = pauStack_16a0;
        pauVar19 = pauStack_16a8;
        unaff_x20 = local_16b0;
        if (local_16b0 == (undefined1 (*) [16])0x3) {
          uVar17 = 3;
          goto LAB_00204740;
        }
        FUN_001ea464(plVar26);
        bVar6 = *(byte *)(param_2 + 0x48);
        *(undefined1 *)((long)param_2 + 0x241) = 0;
        goto joined_r0x00204340;
      }
LAB_00204534:
      uVar11 = FUN_0020713c(param_2 + 0x42,param_3);
      if ((uVar11 & 1) != 0) {
        uVar17 = 4;
        goto LAB_00206844;
      }
      FUN_001e7650(param_2 + 0x42);
      FUN_001edb28(param_2 + 0x60);
LAB_00206284:
      pauVar20 = (undefined1 (*) [16])0x2;
    }
    else {
LAB_0020589c:
      if (bVar6 < 7) {
        if (bVar6 == 5) {
          bVar6 = *(byte *)(param_2 + 0x58);
          if (bVar6 < 3) {
            if (bVar6 != 0) {
              if (bVar6 == 1) {
                    /* WARNING: Subroutine does not return */
                FUN_00191a20(&PTR_DAT_009bfc78);
              }
                    /* WARNING: Subroutine does not return */
              FUN_00191a54(&PTR_DAT_009bfc78);
            }
            plVar18 = (long *)param_2[0x4c];
LAB_00205a88:
            param_2[0x4d] = (long)plVar18;
            param_2[0x55] = param_2[0x49];
            param_2[0x54] = param_2[0x48];
            param_2[0x57] = param_2[0x4b];
            param_2[0x56] = param_2[0x4a];
            param_2[0x51] = param_2[0x45];
            param_2[0x50] = param_2[0x44];
            param_2[0x53] = param_2[0x47];
            param_2[0x52] = param_2[0x46];
            param_2[0x4f] = param_2[0x43];
            param_2[0x4e] = param_2[0x42];
            if (plVar18[7] != 0) {
              plVar18[7] = 0;
            }
            plVar18[6] = 0;
            auVar29 = FUN_003a6640(param_2 + 0x4e,param_2[0x4d] + 0x20);
            if (auVar29._0_8_ != 0) {
              FUN_001ef3bc(param_2 + 0x4e);
              *(undefined1 (*) [16])(param_2 + 0x36) = auVar29;
              *(undefined1 *)(param_2 + 0x58) = 1;
              if (auVar29._0_8_ == 0) goto LAB_00205ae8;
LAB_002058ec:
              *(undefined1 (*) [16])(param_2 + 0x42) = auVar29;
              puVar3 = PTR_PTR_009fa448;
              if ((*(ulong *)PTR_DAT_009fac58 < 5) &&
                 ((((byte)PTR_PTR_009fa448[0x10] - 1 < 2 ||
                   (((byte)PTR_PTR_009fa448[0x10] != 0 &&
                    (cVar5 = FUN_0018fb0c(PTR_PTR_009fa448), cVar5 != '\0')))) &&
                  (iVar7 = FUN_007243f8(*(undefined8 *)puVar3), iVar7 != 0)))) {
                lVar12 = *(long *)puVar3;
                if (*(undefined1 (**) [16])(lVar12 + 0x38) == (undefined1 (*) [16])0x0) {
                    /* WARNING: Subroutine does not return */
                  FUN_0019151c(0x780351,0x22,&PTR_s__project_rawrs_src_raw_uploader__009c0510);
                }
                pauStack_2d28 = (undefined1 (*) [16])&LAB_002cee7c;
                local_2d10 = (undefined1 (*) [16])&PTR_s_failed_to_start_session__009c0528;
                local_2d00 = (undefined1 (*) [16])&local_2d30;
                local_2d50 = (undefined1 (*) [16])(lVar12 + 0x30);
                local_2de0 = *(undefined1 (**) [16])*local_2d50;
                local_2c60 = (undefined1 (*) [16])&local_2de0;
                pauStack_2dc8 = *(undefined1 (**) [16])(lVar12 + 0x48);
                local_2dd0 = *(undefined1 (**) [16])(lVar12 + 0x40);
                pauStack_2c58 = (undefined1 (*) [16])&local_2d10;
                local_2c50 = (undefined1 (*) [16])&DAT_009bec08;
                local_2d60 = (undefined1 (*) [16])&local_2c60;
                local_2dc0 = (int *)0x0;
                pauStack_2d08 = (undefined1 (*) [16])0x1;
                local_2cf0 = (undefined1 (*) [16])0x0;
                pauStack_2cf8 = (undefined1 (*) [16])0x1;
                pauStack_2d58 = (undefined1 (*) [16])0x1;
                pauStack_2dd8 = *(undefined1 (**) [16])(lVar12 + 0x38);
                local_2d30 = (undefined1 (*) [16])(param_2 + 0x42);
                FUN_00724b8c(lVar12,&local_2d60);
              }
              *(undefined1 *)((long)param_2 + 0x252) = 0;
              param_2[0x49] = param_2[0x3f];
              goto LAB_002059e0;
            }
            param_2[0x59] = param_2[0x4d];
            param_2[0x5a] = param_2[0x4d] + 0x20;
LAB_00205e4c:
            auVar29 = FUN_002a6b60(param_2 + 0x59,param_3);
            pauVar20 = auVar29._8_8_;
            if (auVar29._0_8_ != 0) {
              *(undefined1 *)(param_2 + 0x58) = 3;
              uVar17 = 5;
              goto LAB_00206844;
            }
            if (pauVar20 == (undefined1 (*) [16])0x0) {
              param_2[0x59] = param_2[0x4d];
              FUN_001ef3bc(param_2 + 0x4e);
              param_2[0x36] = 0;
              param_2[0x37] = (long)&PTR_FUN_009bfc18;
              *(undefined1 *)(param_2 + 0x58) = 1;
            }
            else {
              uVar17 = *PTR_DAT_009faac8;
              local_2d10 = pauVar20;
              iVar7 = FUN_006212cc(8,8);
              if (iVar7 == 0) {
                puVar16 = malloc(8);
              }
              else {
                puVar16 = (undefined8 *)FUN_006341e8(8,iVar7);
              }
              if (puVar16 == (undefined8 *)0x0) {
                    /* WARNING: Subroutine does not return */
                FUN_0019139c(8,8);
              }
              *puVar16 = pauVar20;
              auVar29._8_8_ = &PTR_FUN_009bfc18;
              auVar29._0_8_ = puVar16;
              FUN_001ef3bc(param_2 + 0x4e);
              param_2[0x36] = (long)puVar16;
              param_2[0x37] = (long)&PTR_FUN_009bfc18;
              *(undefined1 *)(param_2 + 0x58) = 1;
              if (puVar16 != (undefined8 *)0x0) goto LAB_002058ec;
            }
          }
          else {
            if (bVar6 == 3) goto LAB_00205e4c;
            FUN_001ef3bc(param_2 + 0x4e);
            param_2[0x36] = 0;
            param_2[0x37] = (long)&PTR_FUN_009bfc18;
            *(undefined1 *)(param_2 + 0x58) = 1;
          }
LAB_00205ae8:
          plVar18 = param_2 + 0x22;
          param_2[0x56] = (long)plVar18;
          *(undefined1 *)((long)param_2 + 0x2b9) = 0;
LAB_00205b00:
          *(undefined1 *)(param_2 + 0x57) = 0;
          puVar3 = PTR_DAT_009faac8;
          param_2[0x52] = (long)plVar18;
          uVar17 = *puVar3;
          iVar7 = FUN_006212cc(1,0x80);
          if (iVar7 == 0) {
            pvVar14 = malloc(0x80);
          }
          else {
            pvVar14 = (void *)FUN_006341e8(0x80,iVar7);
          }
          if (pvVar14 == (void *)0x0) {
                    /* WARNING: Subroutine does not return */
            FUN_00191384(1,0x80,&PTR_DAT_009bfbd0);
          }
          lVar12 = param_2[0x52];
          param_2[0x54] = (long)pvVar14;
          param_2[0x53] = 0x80;
          param_2[0x55] = 0;
          *(undefined1 *)(param_2 + 0x57) = 1;
          uVar27 = *(undefined8 *)(lVar12 + 0x40);
          uVar8 = *(undefined4 *)(lVar12 + 0x48);
          auVar30 = thunk_FUN_00702ec8();
          local_16b0 = auVar30._0_8_;
          pauStack_16a8 = (undefined1 (*) [16])CONCAT44(pauStack_16a8._4_4_,auVar30._8_4_);
          auVar29 = FUN_00705ec0(&local_16b0,uVar27,uVar8);
          if (auVar29._8_4_ == 1000000000) {
            FUN_0071aaa0(&local_16b0,0);
          }
          else {
            FUN_0071a8c8(&local_16b0,auVar29._0_8_,auVar29._8_8_,0,&PTR_DAT_009bfbe8);
          }
          pauStack_2cc8 = local_1668;
          local_2cd0 = pauStack_1670;
          pauStack_2cb8 = local_1658;
          local_2cc0 = pauStack_1660;
          pauStack_2ca8 = local_1648;
          local_2cb0 = pauStack_1650;
          pauStack_2d08 = pauStack_16a8;
          local_2d10 = local_16b0;
          pauStack_2cf8 = pauStack_1698;
          local_2d00 = pauStack_16a0;
          pauStack_2cd8 = local_1678;
          local_2ce0 = pauStack_1680;
          pauStack_2ce8 = local_1688;
          local_2cf0 = pauStack_1690;
          param_2[0x43] = (long)pauStack_16a8;
          param_2[0x42] = (long)local_16b0;
          param_2[0x45] = (long)pauStack_1698;
          param_2[0x44] = (long)pauStack_16a0;
          param_2[0x4b] = (long)local_1668;
          param_2[0x4a] = (long)pauStack_1670;
          param_2[0x4d] = (long)local_1658;
          param_2[0x4c] = (long)pauStack_1660;
          param_2[0x4f] = (long)local_1648;
          param_2[0x4e] = (long)pauStack_1650;
          param_2[0x47] = (long)local_1688;
          param_2[0x46] = (long)pauStack_1690;
          param_2[0x49] = (long)local_1678;
          param_2[0x48] = (long)pauStack_1680;
          param_2[0x50] = lVar12;
          param_2[0x51] = (long)(param_2 + 0x53);
          goto LAB_00205c08;
        }
LAB_002059e0:
        uVar11 = FUN_0020713c(param_2 + 0x44,param_3);
        if ((uVar11 & 1) != 0) {
          uVar17 = 6;
          goto LAB_00206844;
        }
        FUN_001e7650(param_2 + 0x44);
        unaff_x20 = (undefined1 (*) [16])param_2[0x43];
        piVar25 = (int *)param_2[0x42];
        if (*(code **)*unaff_x20 != (code *)0x0) {
          (**(code **)*unaff_x20)(piVar25);
        }
LAB_00206258:
        pauVar20 = *(undefined1 (**) [16])((long)*unaff_x20 + 8);
        if (pauVar20 != (undefined1 (*) [16])0x0) {
          uVar8 = FUN_006212cc(*(undefined **)unaff_x20[1],pauVar20);
LAB_00206278:
          FUN_00637bc0(piVar25,pauVar20,uVar8);
        }
LAB_0020627c:
        FUN_001f4178(param_2 + 0x22);
        goto LAB_00206284;
      }
      if (bVar6 != 7) {
LAB_00206228:
        uVar11 = FUN_0020713c(param_2 + 0x44,param_3);
        if ((uVar11 & 1) != 0) {
          uVar17 = 8;
          goto LAB_00206844;
        }
        FUN_001e7650(param_2 + 0x44);
        unaff_x20 = (undefined1 (*) [16])param_2[0x43];
        piVar25 = (int *)param_2[0x42];
        if (*(code **)*unaff_x20 != (code *)0x0) {
          (**(code **)*unaff_x20)(piVar25);
        }
        goto LAB_00206258;
      }
      bVar6 = *(byte *)((long)param_2 + 0x2b9);
      if (bVar6 < 2) {
        if (bVar6 != 0) {
                    /* WARNING: Subroutine does not return */
          FUN_00191a20(&PTR_DAT_009bfc00);
        }
        plVar18 = (long *)param_2[0x56];
        goto LAB_00205b00;
      }
      if (bVar6 != 3) {
                    /* WARNING: Subroutine does not return */
        FUN_00191a54(&PTR_DAT_009bfc00);
      }
LAB_00205c08:
      pauVar19 = (undefined1 (*) [16])(param_2 + 0x42);
      auVar29 = FUN_00330f80(pauVar19,param_3);
      pauVar20 = auVar29._8_8_;
      lVar12 = auVar29._0_8_;
      if (lVar12 == 3) {
        *(undefined1 *)((long)param_2 + 0x2b9) = 3;
        uVar17 = 7;
        goto LAB_00206844;
      }
      FUN_001ee020(pauVar19);
      if (lVar12 == 2) {
        local_16b0 = (undefined1 (*) [16])&PTR_s_recv_message_timed_out_after_s_009bfc38;
        pauStack_16a8 = (undefined1 (*) [16])0x2;
        local_2d60 = (undefined1 (*) [16])&local_2d78;
        local_2d78 = *(undefined1 (***) [16])(param_2[0x52] + 0x40);
        pauStack_1690 = (undefined1 (*) [16])0x0;
        pauStack_2d58 = (undefined1 (*) [16])PTR_FUN_009fa3a0;
        pauStack_16a0 = (undefined1 (*) [16])&local_2d60;
        pauStack_1698 = (undefined1 (*) [16])0x1;
        FUN_0076b8c0(&local_2d30,&local_16b0);
        pauStack_2c98 = pauStack_2d28;
        local_2ca0 = local_2d30;
        local_2c90 = local_2d20;
        pauVar20 = (undefined1 (*) [16])FUN_004c2fb0(0x16,&local_2ca0);
        uVar17 = *PTR_DAT_009faac8;
        local_16b0 = pauVar20;
        iVar7 = FUN_006212cc(8,8);
        if (iVar7 == 0) {
          pauVar15 = malloc(8);
        }
        else {
          pauVar15 = (undefined1 (*) [16])FUN_006341e8(8,iVar7);
        }
        if (pauVar15 == (undefined1 (*) [16])0x0) {
                    /* WARNING: Subroutine does not return */
          FUN_0019139c(8,8);
        }
LAB_00206074:
        *(undefined1 (**) [16])*pauVar15 = pauVar20;
        lVar12 = param_2[0x53];
        if (lVar12 != 0) {
          lVar13 = param_2[0x54];
          uVar8 = FUN_006212cc(1,lVar12);
          FUN_00637bc0(lVar13,lVar12,uVar8);
        }
        ppuVar22 = &PTR_FUN_009bfc18;
LAB_002060a8:
        unaff_x20 = (undefined1 (*) [16])&DAT_8000000000000000;
      }
      else {
        if (lVar12 == 1) {
          uVar17 = *PTR_DAT_009faac8;
          local_16b0 = pauVar20;
          iVar7 = FUN_006212cc(8,8);
          if (iVar7 == 0) {
            pauVar15 = malloc(8);
          }
          else {
            pauVar15 = (undefined1 (*) [16])FUN_006341e8(8,iVar7);
          }
          if (pauVar15 == (undefined1 (*) [16])0x0) {
                    /* WARNING: Subroutine does not return */
            FUN_0019139c(8,8);
          }
          goto LAB_00206074;
        }
        if (pauVar20 == (undefined1 (*) [16])0x0) {
          pauVar20 = (undefined1 (*) [16])FUN_00746978(3,&DAT_00780ca0,0x29);
          uVar17 = *PTR_DAT_009faac8;
          local_16b0 = pauVar20;
          iVar7 = FUN_006212cc(8,8);
          if (iVar7 == 0) {
            pauVar15 = malloc(8);
          }
          else {
            pauVar15 = (undefined1 (*) [16])FUN_006341e8(8,iVar7);
          }
          if (pauVar15 == (undefined1 (*) [16])0x0) {
                    /* WARNING: Subroutine does not return */
            FUN_0019139c(8,8);
          }
          goto LAB_00206074;
        }
        pauStack_2d58 = (undefined1 (*) [16])param_2[0x54];
        local_2d60 = (undefined1 (*) [16])param_2[0x53];
        local_2d50 = (undefined1 (*) [16])param_2[0x55];
        *(undefined1 *)(param_2 + 0x57) = 0;
        local_2d48 = (undefined1 (*) [16])0x0;
        memset(&local_16b0,0,0x1000);
        pauStack_2cf8 = (undefined1 (*) [16])&local_2d60;
        pauStack_2ce8 = (undefined1 (*) [16])CONCAT71(pauStack_2ce8._1_7_,6);
        local_2cf0 = (undefined1 (*) [16])0x0;
        local_2d00 = _UNK_0077e058;
        pauStack_2d08 = _DAT_0077e050;
        local_2d10 = (undefined1 (*) [16])&local_16b0;
        FUN_002e68b4(&local_2ca0,&local_2d10,"RawApiResp",10,&PTR_s_prot_009cbe60,3);
        ppuVar22 = (undefined **)local_2c90;
        pauVar15 = pauStack_2c98;
        unaff_x20 = local_2ca0;
        pauVar28 = pauStack_2d58;
        pauVar20 = local_2d60;
        if (local_2ca0 == (undefined1 (*) [16])&DAT_8000000000000000) {
          uVar17 = *PTR_DAT_009faac8;
          iVar7 = FUN_006212cc(8,0x28);
          if (iVar7 == 0) {
            pauVar15 = malloc(0x28);
            pauVar20 = local_2d60;
            pauVar28 = pauStack_2d58;
          }
          else {
            pauVar15 = (undefined1 (*) [16])FUN_006341e8(0x28,iVar7);
            pauVar20 = local_2d60;
            pauVar28 = pauStack_2d58;
          }
          local_2d60 = pauVar20;
          pauStack_2d58 = pauVar28;
          if (pauVar15 == (undefined1 (*) [16])0x0) {
                    /* WARNING: Subroutine does not return */
            FUN_0019139c(8,0x28);
          }
          *(undefined1 (**) [16])((long)pauVar15[1] + 8) = local_2c80;
          *(undefined1 (**) [16])pauVar15[1] = pauStack_2c88;
          *(undefined1 (**) [16])((long)*pauVar15 + 8) = local_2c90;
          *(undefined1 (**) [16])*pauVar15 = pauStack_2c98;
          *(undefined1 (**) [16])pauVar15[2] = pauStack_2c78;
          if (pauVar20 != (undefined1 (*) [16])0x0) {
            uVar8 = FUN_006212cc(1,pauVar20);
            FUN_00637bc0(pauVar28,pauVar20,uVar8);
          }
          ppuVar22 = &PTR_FUN_009bfc58;
          goto LAB_002060a8;
        }
        pauStack_2c58 = local_2c80;
        local_2c60 = pauStack_2c88;
        pauStack_2c48 = pauStack_2c70;
        local_2c50 = pauStack_2c78;
        if (local_2d60 != (undefined1 (*) [16])0x0) {
          uVar8 = FUN_006212cc(1,local_2d60);
          FUN_00637bc0(pauVar28,pauVar20,uVar8);
        }
      }
      *(undefined2 *)(param_2 + 0x57) = 0x100;
      param_2[0x38] = (long)unaff_x20;
      param_2[0x39] = (long)pauVar15;
      param_2[0x3a] = (long)ppuVar22;
      param_2[0x3c] = (long)pauStack_2c58;
      param_2[0x3b] = (long)local_2c60;
      param_2[0x3e] = (long)pauStack_2c48;
      param_2[0x3d] = (long)local_2c50;
      pauStack_2d98 = pauStack_2c58;
      local_2da0 = local_2c60;
      pauStack_2d88 = pauStack_2c48;
      local_2d90 = local_2c50;
      if (*(char *)((long)param_2 + 0x2b9) == '\x03') {
        FUN_001ee020(pauVar19);
        lVar12 = param_2[0x53];
        if (lVar12 != 0) {
          lVar13 = param_2[0x54];
          uVar8 = FUN_006212cc(1,lVar12);
          FUN_00637bc0(lVar13,lVar12,uVar8);
        }
        *(undefined1 *)(param_2 + 0x57) = 0;
        unaff_x20 = (undefined1 (*) [16])param_2[0x38];
      }
      puVar3 = PTR_PTR_009fad98;
      if (unaff_x20 == (undefined1 (*) [16])&DAT_8000000000000000) {
        param_2[0x42] = param_2[0x39];
        param_2[0x43] = param_2[0x3a];
        puVar3 = PTR_PTR_009fad20;
        if (((*(ulong *)PTR_DAT_009fac58 < 5) &&
            (((byte)PTR_PTR_009fad20[0x10] - 1 < 2 ||
             (((byte)PTR_PTR_009fad20[0x10] != 0 &&
              (cVar5 = FUN_0018fb0c(PTR_PTR_009fad20), cVar5 != '\0')))))) &&
           (iVar7 = FUN_007243f8(*(undefined8 *)puVar3), iVar7 != 0)) {
          lVar12 = *(long *)puVar3;
          if (*(undefined1 (**) [16])(lVar12 + 0x38) == (undefined1 (*) [16])0x0) {
                    /* WARNING: Subroutine does not return */
            FUN_0019151c(0x780351,0x22,&PTR_s__project_rawrs_src_raw_uploader__009c0550);
          }
          pauStack_2d58 = (undefined1 (*) [16])&LAB_002cee7c;
          local_16b0 = (undefined1 (*) [16])&PTR_s_failed_to_recv_session_start_ack_009c0568;
          pauStack_16a0 = (undefined1 (*) [16])&local_2d60;
          local_2c50 = (undefined1 (*) [16])(lVar12 + 0x30);
          local_2d10 = *(undefined1 (**) [16])*local_2c50;
          local_2ca0 = (undefined1 (*) [16])&local_2d10;
          pauStack_2cf8 = *(undefined1 (**) [16])(lVar12 + 0x48);
          local_2d00 = *(undefined1 (**) [16])(lVar12 + 0x40);
          pauStack_2c98 = (undefined1 (*) [16])&local_16b0;
          local_2c90 = (undefined1 (*) [16])&DAT_009bec08;
          local_2c60 = (undefined1 (*) [16])&local_2ca0;
          local_2cf0 = (undefined1 (*) [16])0x0;
          pauStack_16a8 = (undefined1 (*) [16])0x1;
          pauStack_1690 = (undefined1 (*) [16])0x0;
          pauStack_1698 = (undefined1 (*) [16])0x1;
          pauStack_2c58 = (undefined1 (*) [16])0x1;
          local_2d60 = pauVar19;
          pauStack_2d08 = *(undefined1 (**) [16])(lVar12 + 0x38);
          FUN_00724b8c(lVar12,&local_2c60);
        }
        *(undefined1 *)((long)param_2 + 0x252) = 0;
        param_2[0x49] = param_2[0x3f];
        goto LAB_00206228;
      }
      pauStack_2dd8 = (undefined1 (*) [16])param_2[0x39];
      local_2de0 = (undefined1 (*) [16])param_2[0x38];
      pauStack_2dc8 = (undefined1 (*) [16])param_2[0x3b];
      local_2dd0 = (undefined1 (*) [16])param_2[0x3a];
      lStack_2db8 = param_2[0x3d];
      local_2dc0 = (int *)param_2[0x3c];
      local_2db0 = param_2[0x3e];
      if (((*(ulong *)PTR_DAT_009fac58 < 3) &&
          ((unaff_x20 = (undefined1 (*) [16])puVar3, (byte)PTR_PTR_009fad98[0x10] - 1 < 2 ||
           (((byte)PTR_PTR_009fad98[0x10] != 0 &&
            (cVar5 = FUN_0018fb0c(PTR_PTR_009fad98), cVar5 != '\0')))))) &&
         (iVar7 = FUN_007243f8(*(undefined8 *)puVar3), iVar7 != 0)) {
        lVar12 = *(long *)puVar3;
        if (*(undefined1 (**) [16])(lVar12 + 0x38) == (undefined1 (*) [16])0x0) {
                    /* WARNING: Subroutine does not return */
          FUN_0019151c(0x780351,0x22,&PTR_s__project_rawrs_src_raw_uploader__009c0538);
        }
        pauStack_2d58 = (undefined1 (*) [16])FUN_0020ac78;
        local_2c50 = (undefined1 (*) [16])(lVar12 + 0x30);
        local_2d10 = *(undefined1 (**) [16])*local_2c50;
        local_16b0 = (undefined1 (*) [16])&DAT_0077e060;
        pauStack_16a0 = (undefined1 (*) [16])&local_2d60;
        pauStack_2cf8 = *(undefined1 (**) [16])(lVar12 + 0x48);
        local_2d00 = *(undefined1 (**) [16])(lVar12 + 0x40);
        local_2ca0 = (undefined1 (*) [16])&local_2d10;
        local_2d60 = (undefined1 (*) [16])&local_2de0;
        pauStack_2c98 = (undefined1 (*) [16])&local_16b0;
        local_2c90 = (undefined1 (*) [16])&DAT_009bec08;
        local_2c60 = (undefined1 (*) [16])&local_2ca0;
        local_2cf0 = (undefined1 (*) [16])0x0;
        pauStack_16a8 = (undefined1 (*) [16])0x1;
        pauStack_1690 = (undefined1 (*) [16])0x0;
        pauStack_1698 = (undefined1 (*) [16])0x1;
        pauStack_2c58 = (undefined1 (*) [16])0x1;
        pauStack_2d08 = *(undefined1 (**) [16])(lVar12 + 0x38);
        FUN_00724b8c(lVar12,&local_2c60);
      }
      pauVar19 = pauStack_2dd8;
      pauVar20 = local_2de0;
      if ((((local_2dd0 != (undefined1 (*) [16])0x3) ||
           (*(short *)*pauStack_2dd8 != 0x6172 || *(char *)((long)*pauStack_2dd8 + 2) != 'w')) ||
          (lStack_2db8 != 7)) ||
         (*local_2dc0 != 0x73736573 || *(int *)((long)local_2dc0 + 3) != 0x6e6f6973)) {
        if (local_2de0 != (undefined1 (*) [16])0x0) {
          uVar8 = FUN_006212cc(1,local_2de0);
          FUN_00637bc0(pauVar19,pauVar20,uVar8);
        }
        piVar25 = local_2dc0;
        pauVar20 = pauStack_2dc8;
        if (pauStack_2dc8 != (undefined1 (*) [16])0x0) {
          uVar8 = FUN_006212cc(1,pauStack_2dc8);
          goto LAB_00206278;
        }
        goto LAB_0020627c;
      }
      *(undefined8 *)param_2[0x40] = 0;
      auVar30 = FUN_0074bcf0();
      *(undefined1 (*) [12])(param_2[0x3f] + 0x1370) = auVar30;
      pauStack_2ce8 = (undefined1 (*) [16])param_2[0x27];
      local_2cf0 = (undefined1 (*) [16])param_2[0x26];
      pauStack_2cd8 = (undefined1 (*) [16])param_2[0x29];
      local_2ce0 = (undefined1 (*) [16])param_2[0x28];
      pauStack_2cc8 = (undefined1 (*) [16])param_2[0x2b];
      local_2cd0 = (undefined1 (*) [16])param_2[0x2a];
      *(undefined1 *)(param_2 + 0x41) = 0;
      pauStack_2c98 = (undefined1 (*) [16])param_2[0x23];
      local_2ca0 = (undefined1 (*) [16])param_2[0x22];
      pauStack_2cf8 = (undefined1 (*) [16])param_2[0x25];
      local_2d00 = (undefined1 (*) [16])param_2[0x24];
      pauStack_2d08 = (undefined1 (*) [16])param_2[0x23];
      local_2d10 = (undefined1 (*) [16])param_2[0x22];
      pauStack_2c88 = (undefined1 (*) [16])param_2[0x25];
      local_2c90 = (undefined1 (*) [16])param_2[0x24];
      FUN_0027dac4(&local_16b0,&local_2ca0);
      pauVar19 = pauStack_2dd8;
      pauVar20 = local_2de0;
      pauStack_3168 = pauStack_2ce8;
      local_3170 = local_2cf0;
      pauStack_3158 = pauStack_2cd8;
      local_3160 = local_2ce0;
      local_3378 = local_2cd0;
      pauStack_31a8 = local_1688;
      local_31b0 = pauStack_1690;
      pauStack_3198 = local_1678;
      pauStack_31a0 = pauStack_1680;
      local_337c = pauStack_2cc8._0_4_;
      pauStack_3188 = local_1668;
      local_3190 = pauStack_1670;
      pauStack_3178 = local_1658;
      pauStack_3180 = pauStack_1660;
      pauStack_31c8 = pauStack_16a8;
      local_31d0 = local_16b0;
      local_31b8 = pauStack_1698;
      local_31c0 = pauStack_16a0;
      pauStack_a8 = local_1658;
      local_b0 = pauStack_1660;
      pauStack_b8 = local_1668;
      local_c0 = pauStack_1670;
      pauStack_d8 = local_1688;
      local_e0 = pauStack_1690;
      pauStack_c8 = local_1678;
      local_d0 = pauStack_1680;
      pauStack_f8 = pauStack_16a8;
      local_100 = local_16b0;
      pauStack_e8 = pauStack_1698;
      local_f0 = pauStack_16a0;
      pauStack_88 = pauStack_2cd8;
      local_90 = local_2ce0;
      pauStack_98 = pauStack_2ce8;
      local_a0 = local_2cf0;
      if (local_2de0 != (undefined1 (*) [16])0x0) {
        uVar8 = FUN_006212cc(1,local_2de0);
        FUN_00637bc0(pauVar19,pauVar20,uVar8);
      }
      piVar25 = local_2dc0;
      pauVar20 = pauStack_2dc8;
      if (pauStack_2dc8 != (undefined1 (*) [16])0x0) {
        uVar8 = FUN_006212cc(1,pauStack_2dc8);
        FUN_00637bc0(piVar25,pauVar20,uVar8);
      }
      pauVar20 = (undefined1 (*) [16])0x3;
    }
    iVar7 = (int)param_2 + 0x102;
    *(undefined2 *)(param_2 + 0x41) = 0x100;
    pauStack_2e18 = pauStack_b8;
    local_2e20 = local_c0;
    pauStack_2e08 = pauStack_a8;
    local_2e10 = local_b0;
    pauStack_2de8 = pauStack_88;
    local_2df0 = local_90;
    pauStack_2df8 = pauStack_98;
    local_2e00 = local_a0;
    pauStack_2e48 = pauStack_e8;
    local_2e50 = local_f0;
    pauStack_2e58 = pauStack_f8;
    local_2e60 = local_100;
    pauStack_2e38 = pauStack_d8;
    local_2e40 = local_e0;
    pauStack_2e28 = pauStack_c8;
    local_2e30 = local_d0;
    FUN_001e9344(param_2 + 0x22);
    bVar6 = *(byte *)(param_2 + 0x20);
    *(undefined1 *)((long)param_2 + 0x101) = 0;
    uVar8 = local_337c;
    pauVar19 = local_3378;
joined_r0x002062e8:
    if ((bVar6 & 1) != 0) {
      lVar12 = param_2[0x19];
      if ((lVar12 != 2) && (FUN_0072686c(param_2 + 0x19,param_2[0x1c]), lVar12 != 0)) {
        lVar12 = FUN_0077c930(0xffffffffffffffff,param_2[0x1a]);
        if (lVar12 == 1) {
          DataMemoryBarrier(2,1);
          FUN_0072502c(param_2 + 0x1a);
        }
      }
    }
    *(undefined1 *)(param_2 + 0x20) = 0;
    pauStack_3328 = pauStack_2e18;
    local_3330 = local_2e20;
    pauStack_3318 = pauStack_2e08;
    pauStack_3320 = local_2e10;
    *(undefined1 *)((long)param_2 + 0x102) = 1;
    pauStack_3308 = pauStack_2df8;
    local_3310 = local_2e00;
    pauStack_32f8 = pauStack_2de8;
    pauStack_3300 = local_2df0;
    pauStack_3368 = pauStack_2e58;
    local_3370 = local_2e60;
    pauStack_3358 = pauStack_2e48;
    local_3360 = local_2e50;
    pauStack_3348 = pauStack_2e38;
    local_3350 = local_2e40;
    pauStack_3338 = pauStack_2e28;
    pauStack_3340 = local_2e30;
    pauStack_32a8 = pauStack_2e18;
    local_32b0 = local_2e20;
    pauStack_3298 = pauStack_2e08;
    pauStack_32a0 = local_2e10;
    pauStack_3288 = pauStack_2df8;
    local_3290 = local_2e00;
    pauStack_3278 = pauStack_2de8;
    pauStack_3280 = local_2df0;
    pauStack_32e8 = pauStack_2e58;
    local_32f0 = local_2e60;
    pauStack_32d8 = pauStack_2e48;
    pauStack_32e0 = local_2e50;
    pauStack_32c8 = pauStack_2e38;
    local_32d0 = local_2e40;
    pauStack_32b8 = pauStack_2e28;
    pauStack_32c0 = local_2e30;
    FUN_001e7e8c(param_2 + 0x18);
    lVar12 = *param_2;
    if (*(long *)(lVar12 + 0x11e0) != 4) {
      uVar11 = *(long *)(lVar12 + 0x11e0) - 2;
      if (1 < uVar11) {
        uVar11 = 2;
      }
      if (uVar11 != 0) {
        lVar13 = lVar12 + 0x11e0;
        if (uVar11 == 1) {
          lVar13 = lVar12 + 0x11e8;
        }
        FUN_001e80d8(lVar13);
        lVar12 = *param_2;
      }
    }
    *(undefined1 (**) [16])(lVar12 + 0x11e0) = pauVar20;
    *(undefined1 (**) [16])(lVar12 + 0x1268) = pauVar19;
    *(undefined1 (**) [16])(lVar12 + 0x1230) = pauStack_32a8;
    *(undefined1 (**) [16])(lVar12 + 0x1228) = local_32b0;
    *(undefined1 (**) [16])(lVar12 + 0x1240) = pauStack_3298;
    *(undefined1 (**) [16])(lVar12 + 0x1238) = pauStack_32a0;
    *(undefined4 *)(lVar12 + 0x1270) = uVar8;
    *(int *)(lVar12 + 0x1274) = iVar7;
    *(undefined1 (**) [16])(lVar12 + 0x1250) = pauStack_3288;
    *(undefined1 (**) [16])(lVar12 + 0x1248) = local_3290;
    *(undefined1 (**) [16])(lVar12 + 0x1260) = pauStack_3278;
    *(undefined1 (**) [16])(lVar12 + 0x1258) = pauStack_3280;
    *(undefined1 (**) [16])(lVar12 + 0x1278) = unaff_x20;
    *(undefined1 (**) [16])(lVar12 + 0x11f0) = pauStack_32e8;
    *(undefined1 (**) [16])(lVar12 + 0x11e8) = local_32f0;
    *(undefined1 (**) [16])(lVar12 + 0x1200) = pauStack_32d8;
    *(undefined1 (**) [16])(lVar12 + 0x11f8) = pauStack_32e0;
    *(undefined1 (**) [16])(lVar12 + 0x1210) = pauStack_32c8;
    *(undefined1 (**) [16])(lVar12 + 0x1208) = local_32d0;
    *(undefined1 (**) [16])(lVar12 + 0x1220) = pauStack_32b8;
    *(undefined1 (**) [16])(lVar12 + 0x1218) = pauStack_32c0;
    do {
      while( true ) {
        auVar30 = FUN_0074bcf0();
        *(undefined1 (*) [12])(param_2 + 0x26) = auVar30;
        param_2[0x17] = *(long *)(*param_2 + 0x13e8) + 0x10;
        *(undefined1 *)(param_2 + 0x25) = 0;
LAB_0020643c:
        lVar12 = param_2[0x17];
        param_2[0x18] = lVar12;
        *(undefined1 *)(param_2 + 0x24) = 0;
LAB_00206450:
        param_2[0x1a] = lVar12;
        param_2[0x19] = lVar12;
        *(undefined1 *)(param_2 + 0x1b) = 0;
LAB_00206464:
        pauStack_16a8 = (undefined1 (*) [16])0x0;
        param_2[0x1c] = lVar12;
        param_2[0x1d] = 0;
        pauStack_16a0 = (undefined1 (*) [16])0x0;
        param_2[0x1f] = 0;
        param_2[0x1e] = (long)local_16b0;
        param_2[0x20] = 0;
        param_2[0x21] = 1;
        param_2[0x22] = 1;
        *(undefined1 *)(param_2 + 0x23) = 0;
LAB_00206488:
        unaff_x20 = (undefined1 (*) [16])(param_2 + 0x1b);
        bVar6 = FUN_00711c60(param_2 + 0x1c,param_3);
        if (bVar6 == 2) {
          (*unaff_x20)[0] = 4;
          uVar17 = 7;
          *(undefined1 *)(param_2 + 0x24) = 3;
          *(undefined1 *)(param_2 + 0x25) = 3;
          *param_1 = 0x10;
          goto LAB_0020685c;
        }
        FUN_00712274(param_2 + 0x1c);
        if (param_2[0x1d] != 0) {
          (**(code **)(param_2[0x1d] + 0x18))(param_2[0x1e]);
        }
        if ((bVar6 & 1) != 0) {
          FUN_001915c0(&DAT_00780aaf,0x28,&PTR_s__cargo_registry_src_index_crates_009c0c58);
                    /* WARNING: Does not return */
          pcVar4 = (code *)SoftwareBreakpoint(1,0x206ae4);
          (*pcVar4)();
        }
        lVar13 = param_2[0x18];
        *(undefined1 *)(param_2 + 0x1b) = 1;
        *(undefined1 *)(param_2 + 0x24) = 1;
        *(undefined1 *)(param_2 + 0x25) = 1;
        lVar12 = param_2[0x27];
        *(long *)(lVar13 + 0x28) = param_2[0x26];
        *(int *)(lVar13 + 0x30) = (int)lVar12;
        FUN_00711600(lVar13,1);
        FUN_002b6e28(*param_2);
LAB_00204b04:
        lVar13 = *param_2;
        local_1620 = *(long *)(lVar13 + 0x1278);
        local_1648 = *(undefined1 (**) [16])(lVar13 + 0x1250);
        pauStack_1650 = *(undefined1 (**) [16])(lVar13 + 0x1248);
        local_1638 = *(undefined1 (**) [16])(lVar13 + 0x1260);
        pauStack_1640 = *(undefined1 (**) [16])(lVar13 + 0x1258);
        local_1628 = *(undefined1 (**) [16])(lVar13 + 0x1270);
        pauStack_1630 = *(undefined1 (**) [16])(lVar13 + 0x1268);
        lVar12 = *(long *)(lVar13 + 0x11e0);
        local_1688 = *(undefined1 (**) [16])(lVar13 + 0x1210);
        pauStack_1690 = *(undefined1 (**) [16])(lVar13 + 0x1208);
        local_1678 = *(undefined1 (**) [16])(lVar13 + 0x1220);
        pauStack_1680 = *(undefined1 (**) [16])(lVar13 + 0x1218);
        local_1668 = *(undefined1 (**) [16])(lVar13 + 0x1230);
        pauStack_1670 = *(undefined1 (**) [16])(lVar13 + 0x1228);
        local_1658 = *(undefined1 (**) [16])(lVar13 + 0x1240);
        pauStack_1660 = *(undefined1 (**) [16])(lVar13 + 0x1238);
        pauStack_16a8 = *(undefined1 (**) [16])(lVar13 + 0x11f0);
        local_16b0 = *(undefined1 (**) [16])(lVar13 + 0x11e8);
        pauStack_1698 = *(undefined1 (**) [16])(lVar13 + 0x1200);
        pauStack_16a0 = *(undefined1 (**) [16])(lVar13 + 0x11f8);
        *(undefined8 *)(lVar13 + 0x11e0) = 4;
        if (lVar12 == 4) {
                    /* WARNING: Subroutine does not return */
          FUN_00191500(&PTR_s__project_rawrs_src_raw_uploader__009c0998);
        }
        uVar11 = lVar12 - 2;
        param_2[0x10] = (long)local_1648;
        param_2[0xf] = (long)pauStack_1650;
        if (1 < uVar11) {
          uVar11 = 2;
        }
        param_2[0x12] = (long)local_1638;
        param_2[0x11] = (long)pauStack_1640;
        param_2[0x14] = (long)local_1628;
        param_2[0x13] = (long)pauStack_1630;
        param_2[8] = (long)local_1688;
        param_2[7] = (long)pauStack_1690;
        param_2[10] = (long)local_1678;
        param_2[9] = (long)pauStack_1680;
        param_2[0xc] = (long)local_1668;
        param_2[0xb] = (long)pauStack_1670;
        param_2[0xe] = (long)local_1658;
        param_2[0xd] = (long)pauStack_1660;
        param_2[4] = (long)pauStack_16a8;
        param_2[3] = (long)local_16b0;
        param_2[2] = lVar12;
        param_2[0x15] = local_1620;
        param_2[6] = (long)pauStack_1698;
        param_2[5] = (long)pauStack_16a0;
        if (uVar11 != 2) break;
        plVar18 = param_2 + 1;
        uVar8 = (undefined4)param_2[0x15];
        lVar12 = *param_2;
        *(undefined1 *)(param_2 + 0x48) = 0;
        param_2[0x25] = param_2[0xf];
        param_2[0x24] = param_2[0xe];
        param_2[0x27] = param_2[0x11];
        param_2[0x26] = param_2[0x10];
        param_2[0x29] = param_2[0x13];
        param_2[0x28] = param_2[0x12];
        *(undefined4 *)(param_2 + 0x2b) = uVar8;
        param_2[0x1d] = param_2[7];
        param_2[0x1c] = param_2[6];
        param_2[0x1f] = param_2[9];
        param_2[0x1e] = param_2[8];
        param_2[0x2c] = lVar12;
        param_2[0x2d] = (long)plVar18;
        param_2[0x21] = param_2[0xb];
        param_2[0x20] = param_2[10];
        param_2[0x23] = param_2[0xd];
        param_2[0x22] = param_2[0xc];
        lVar13 = param_2[0x14];
        param_2[0x19] = param_2[3];
        param_2[0x18] = param_2[2];
        param_2[0x1b] = param_2[5];
        param_2[0x1a] = param_2[4];
        param_2[0x2a] = lVar13;
LAB_00204d64:
        *(undefined2 *)((long)param_2 + 0x241) = 0;
        *(undefined1 *)((long)param_2 + 0x243) = 1;
        ppauVar1 = (undefined1 (**) [16])(param_2 + 0x2e);
        param_2[0x3b] = param_2[0x25];
        param_2[0x3a] = param_2[0x24];
        param_2[0x3d] = param_2[0x27];
        param_2[0x3c] = param_2[0x26];
        param_2[0x3f] = param_2[0x29];
        param_2[0x3e] = param_2[0x28];
        param_2[0x40] = lVar13;
        param_2[0x33] = param_2[0x1d];
        param_2[0x32] = param_2[0x1c];
        param_2[0x35] = param_2[0x1f];
        param_2[0x34] = param_2[0x1e];
        *(undefined4 *)(param_2 + 0x41) = uVar8;
        param_2[0x42] = (long)plVar18;
        param_2[0x37] = param_2[0x21];
        param_2[0x36] = param_2[0x20];
        param_2[0x39] = param_2[0x23];
        param_2[0x38] = param_2[0x22];
        param_2[0x2f] = param_2[0x19];
        param_2[0x2e] = param_2[0x18];
        param_2[0x31] = param_2[0x1b];
        param_2[0x30] = param_2[0x1a];
        puVar3 = PTR_PTR_009fa100;
        if (*(ulong *)PTR_DAT_009fac58 < 3) {
          pauVar20 = (undefined1 (*) [16])(param_2 + 0x40);
          if (((1 < (byte)PTR_PTR_009fa100[0x10] - 1) &&
              (((byte)PTR_PTR_009fa100[0x10] == 0 ||
               (cVar5 = FUN_0018fb0c(PTR_PTR_009fa100), cVar5 == '\0')))) ||
             (uVar11 = FUN_007243f8(*(undefined8 *)puVar3), (uVar11 & 1) == 0)) goto LAB_00204ff0;
          lVar13 = *(long *)puVar3;
          pauVar19 = *(undefined1 (**) [16])(lVar13 + 0x38);
          if (pauVar19 == (undefined1 (*) [16])0x0) {
                    /* WARNING: Subroutine does not return */
            FUN_0019151c(0x780351,0x22,&PTR_s__project_rawrs_src_raw_uploader__009c0578);
          }
          local_2c50 = *(undefined1 (**) [16])(lVar13 + 0x40);
          pauStack_2c48 = *(undefined1 (**) [16])(lVar13 + 0x48);
          local_2c60 = *(undefined1 (**) [16])*(undefined1 (*) [16])(lVar13 + 0x30);
          local_2c40 = 0;
          local_2d78 = ppauVar1;
          pauStack_2c58 = pauVar19;
          if (pauVar19 == (undefined1 (*) [16])0x1) {
                    /* WARNING: Subroutine does not return */
            FUN_0019151c(0x780351,0x22,&PTR_s__project_rawrs_src_raw_uploader__009c0578);
          }
          local_2dc0 = (int *)0x1;
          local_2de0 = local_2c60;
          pauStack_2dd8 = pauVar19;
          local_2dd0 = local_2c50;
          pauStack_2dc8 = pauStack_2c48;
          local_2da0 = pauVar20;
          if (pauVar19 < (undefined1 (*) [16])0x3) {
                    /* WARNING: Subroutine does not return */
            FUN_0019151c(0x780351,0x22,&PTR_s__project_rawrs_src_raw_uploader__009c0578);
          }
          local_2c80 = (undefined1 (*) [16])0x2;
          local_2ca0 = local_2c60;
          pauStack_2c98 = pauVar19;
          local_2c90 = local_2c50;
          pauStack_2c88 = pauStack_2c48;
          if (pauVar19 == (undefined1 (*) [16])0x3) {
                    /* WARNING: Subroutine does not return */
            FUN_0019151c(0x780351,0x22,&PTR_s__project_rawrs_src_raw_uploader__009c0578);
          }
          local_2cf0 = (undefined1 (*) [16])0x3;
          local_2d30 = (undefined1 (*) [16])(lVar12 + 0x11e0);
          local_2d10 = local_2c60;
          pauStack_2d08 = pauVar19;
          local_2d00 = local_2c50;
          pauStack_2cf8 = pauStack_2c48;
          if (pauVar19 < (undefined1 (*) [16])&DAT_00000005) {
                    /* WARNING: Subroutine does not return */
            FUN_0019151c(0x780351,0x22,&PTR_s__project_rawrs_src_raw_uploader__009c0578);
          }
          local_3350 = (undefined1 (*) [16])&DAT_00000004;
          local_3370 = local_2c60;
          pauStack_3368 = pauVar19;
          local_3360 = local_2c50;
          pauStack_3358 = pauStack_2c48;
          if (pauVar19 == (undefined1 (*) [16])&DAT_00000005) {
                    /* WARNING: Subroutine does not return */
            FUN_0019151c(0x780351,0x22,&PTR_s__project_rawrs_src_raw_uploader__009c0578);
          }
          local_2e40 = (undefined1 (*) [16])&DAT_00000005;
          local_2e60 = local_2c60;
          pauStack_2e58 = pauVar19;
          local_2e50 = local_2c50;
          pauStack_2e48 = pauStack_2c48;
          if (pauVar19 < (undefined1 (*) [16])&DAT_00000007) {
                    /* WARNING: Subroutine does not return */
            FUN_0019151c(0x780351,0x22,&PTR_s__project_rawrs_src_raw_uploader__009c0578);
          }
          pauStack_3070 = (undefined1 (*) [16])&DAT_00000006;
          local_2c30 = (undefined1 (*) [16])&local_2c60;
          pauStack_2c28 = (undefined1 (*) [16])&local_2d78;
          local_2c20 = (undefined1 (*) [16])&DAT_009c0418;
          local_2c10 = (undefined1 (*) [16])&local_2da0;
          pauStack_2c18 = (undefined1 (*) [16])&local_2de0;
          local_2c00 = (undefined1 (*) [16])&local_2ca0;
          ppauStack_2be8 = &local_2d10;
          pauStack_2c08 = (undefined1 (*) [16])&DAT_009c0590;
          local_2be0 = &local_2d30;
          local_2bf0 = &DAT_009c04b0;
          puStack_2bd8 = &DAT_009c0438;
          local_2bd0 = &local_3370;
          lStack_2bc8 = lVar12 + 0x12c0;
          local_2bc0 = &PTR_FUN_009c03a0;
          local_2bb0 = lVar12 + 0x1408;
          local_2ba0 = &local_3090;
          ppauStack_2bb8 = &local_2e60;
          puStack_2ba8 = &DAT_009c03c0;
          local_2b90 = &DAT_009c03e0;
          local_2d60 = (undefined1 (*) [16])&local_2c30;
          local_2b98 = 1;
          pauStack_2d58 = (undefined1 (*) [16])&DAT_00000007;
          local_3090 = local_2c60;
          local_3088 = pauVar19;
          pauStack_3080 = local_2c50;
          local_3078 = pauStack_2c48;
          local_2d50 = (undefined1 (*) [16])(lVar13 + 0x30);
          plStack_2bf8 = param_2 + 0x42;
          FUN_00723fe4(param_2 + 0x43,lVar13,&local_2d60);
          lVar13 = param_2[0x43];
          *(undefined1 *)((long)param_2 + 0x241) = 1;
        }
        else {
LAB_00204ff0:
          lVar13 = 2;
          *(undefined1 *)((long)param_2 + 0x241) = 1;
          param_2[0x43] = 2;
          param_2[0x47] = 0;
        }
        lStack_2bc8 = param_2[0x3b];
        local_2bd0 = (undefined1 (**) [16])param_2[0x3a];
        ppauStack_2bb8 = (undefined1 (**) [16])param_2[0x3d];
        local_2bc0 = (undefined **)param_2[0x3c];
        puStack_2ba8 = (undefined *)param_2[0x3f];
        local_2bb0 = param_2[0x3e];
        *(undefined2 *)((long)param_2 + 0x242) = 1;
        local_2ba0 = (undefined1 (**) [16])param_2[0x40];
        pauStack_2c08 = (undefined1 (*) [16])param_2[0x33];
        local_2c10 = (undefined1 (*) [16])param_2[0x32];
        plStack_2bf8 = (long *)param_2[0x35];
        local_2c00 = (undefined1 (*) [16])param_2[0x34];
        local_2ad8 = param_2[0x42];
        ppauStack_2be8 = (undefined1 (**) [16])param_2[0x37];
        local_2bf0 = (undefined *)param_2[0x36];
        puStack_2bd8 = (undefined *)param_2[0x39];
        local_2be0 = (undefined1 (**) [16])param_2[0x38];
        local_2b98 = CONCAT44(local_2b98._4_4_,(int)param_2[0x41]);
        pauStack_2c28 = (undefined1 (*) [16])param_2[0x2f];
        local_2c30 = *ppauVar1;
        pauStack_2c18 = (undefined1 (*) [16])param_2[0x31];
        local_2c20 = (undefined1 (*) [16])param_2[0x30];
        local_2aa0 = 0;
        local_2ae0 = lVar12;
        if (lVar13 == 2) {
          *(undefined1 *)((long)param_2 + 0x242) = 0;
          memcpy(param_2 + 0x4a,&local_2c30,0x1580);
LAB_0020507c:
          FUN_001ff97c(&local_3090,param_2 + 0x4a,param_3);
          pauVar20 = local_3090;
          if (local_3090 == (undefined1 (*) [16])&DAT_00000005) {
            uVar17 = 4;
LAB_00205f4c:
            *(undefined1 *)(param_2 + 0x48) = uVar17;
            *param_1 = 0x10;
            uVar17 = 6;
            goto LAB_0020685c;
          }
          local_70 = local_2ff8;
          pauStack_98 = pauStack_3020;
          local_a0 = local_3028;
          pauStack_88 = pauStack_3010;
          local_90 = local_3018;
          pauStack_d8 = pauStack_3060;
          local_e0 = local_3068;
          uStack_78 = uStack_3000;
          local_80 = local_3008;
          pauStack_c8 = pauStack_3050;
          local_d0 = local_3058;
          pauStack_a8 = pauStack_3030;
          local_b0 = local_3038;
          pauStack_b8 = pauStack_3040;
          local_c0 = local_3048;
          pauStack_f8 = pauStack_3080;
          local_100 = local_3088;
          pauStack_e8 = pauStack_3070;
          local_f0 = local_3078;
          FUN_001e9540(param_2 + 0x4a);
        }
        else {
          *(undefined1 *)((long)param_2 + 0x242) = 0;
          memcpy(&local_16b0,&local_2c30,0x1580);
          lStack_128 = param_2[0x44];
          local_130 = param_2[0x43];
          lStack_118 = param_2[0x46];
          local_120 = param_2[0x45];
          local_110 = param_2[0x47];
          *(undefined1 *)((long)param_2 + 0x241) = 0;
          memcpy(param_2 + 0x4a,&local_16b0,0x15b0);
          lVar12 = param_2[0x2fa];
joined_r0x00203de8:
          if (lVar12 != 2) {
            FUN_00726804(param_2 + 0x2fa,param_2 + 0x2fd);
          }
          FUN_0023515c(&local_3090,param_2 + 0x4a,param_3);
          if (param_2[0x2fa] != 2) {
            FUN_00726838(param_2 + 0x2fa,param_2 + 0x2fd);
          }
          pauVar20 = local_3090;
          if (local_3090 == (undefined1 (*) [16])&DAT_00000005) {
            uVar17 = 3;
            goto LAB_00205f4c;
          }
          local_70 = local_2ff8;
          pauStack_98 = pauStack_3020;
          local_a0 = local_3028;
          pauStack_88 = pauStack_3010;
          local_90 = local_3018;
          pauStack_d8 = pauStack_3060;
          local_e0 = local_3068;
          uStack_78 = uStack_3000;
          local_80 = local_3008;
          pauStack_c8 = pauStack_3050;
          local_d0 = local_3058;
          pauStack_a8 = pauStack_3030;
          local_b0 = local_3038;
          pauStack_b8 = pauStack_3040;
          local_c0 = local_3048;
          pauStack_f8 = pauStack_3080;
          local_100 = local_3088;
          pauStack_e8 = pauStack_3070;
          local_f0 = local_3078;
          FUN_001eaba0(param_2 + 0x4a);
        }
        *(undefined1 *)((long)param_2 + 0x242) = 0;
        if (((((*(byte *)((long)param_2 + 0x241) & 1) != 0) && (lVar12 = param_2[0x43], lVar12 != 2)
             ) && (FUN_0072686c(param_2 + 0x43,param_2[0x46]), lVar12 != 0)) &&
           (lVar12 = FUN_0077c930(0xffffffffffffffff,param_2[0x44]), lVar12 == 1)) {
          DataMemoryBarrier(2,1);
          FUN_0072502c(param_2 + 0x44);
        }
        *(undefined1 *)((long)param_2 + 0x241) = 0;
        pauStack_3168 = pauStack_98;
        local_3170 = local_a0;
        pauStack_3158 = pauStack_88;
        local_3160 = local_90;
        uStack_3148 = uStack_78;
        local_3150 = local_80;
        local_3140 = local_70;
        pauStack_31a8 = pauStack_d8;
        local_31b0 = local_e0;
        pauStack_3198 = pauStack_c8;
        pauStack_31a0 = local_d0;
        *(undefined1 *)(param_2 + 0x48) = 1;
        pauStack_3188 = pauStack_b8;
        local_3190 = local_c0;
        pauStack_3178 = pauStack_a8;
        pauStack_3180 = local_b0;
        *(undefined1 *)((long)param_2 + 0x243) = 0;
        pauStack_31c8 = pauStack_f8;
        local_31d0 = local_100;
        local_31b8 = pauStack_e8;
        local_31c0 = local_f0;
        local_30a0 = local_70;
        pauStack_30c8 = pauStack_98;
        local_30d0 = local_a0;
        pauStack_30b8 = pauStack_88;
        pauStack_30c0 = local_90;
        uStack_30a8 = uStack_78;
        local_30b0 = local_80;
        pauStack_3108 = pauStack_d8;
        local_3110 = local_e0;
        pauStack_30f8 = pauStack_c8;
        pauStack_3100 = local_d0;
        pauStack_30e8 = pauStack_b8;
        local_30f0 = local_c0;
        pauStack_30d8 = pauStack_a8;
        pauStack_30e0 = local_b0;
        pauStack_3128 = pauStack_f8;
        local_3130 = local_100;
        pauStack_3118 = pauStack_e8;
        pauStack_3120 = local_f0;
        FUN_001e7f6c(param_2 + 0x18);
        if (pauVar20 == (undefined1 (*) [16])&DAT_00000004) {
          param_1[1] = pauStack_3120;
          *param_1 = pauStack_3128;
          param_1[3] = local_3110;
          param_1[2] = pauStack_3118;
          uVar17 = 1;
          param_1[5] = pauStack_3100;
          param_1[4] = pauStack_3108;
          param_1[7] = local_30f0;
          param_1[6] = pauStack_30f8;
          goto LAB_0020685c;
        }
        lVar12 = *param_2;
        if (*(long *)(lVar12 + 0x11e0) != 4) {
          uVar11 = *(long *)(lVar12 + 0x11e0) - 2;
          if (1 < uVar11) {
            uVar11 = 2;
          }
          if (uVar11 != 0) {
            lVar13 = lVar12 + 0x11e0;
            if (uVar11 == 1) {
              lVar13 = lVar12 + 0x11e8;
            }
            FUN_001e80d8(lVar13);
            lVar12 = *param_2;
          }
        }
        *(undefined1 (**) [16])(lVar12 + 0x11e0) = pauVar20;
        *(undefined1 (**) [16])(lVar12 + 0x1210) = pauStack_3108;
        *(undefined1 (**) [16])(lVar12 + 0x1208) = local_3110;
        *(undefined1 (**) [16])(lVar12 + 0x1220) = pauStack_30f8;
        *(undefined1 (**) [16])(lVar12 + 0x1218) = pauStack_3100;
        *(undefined1 (**) [16])(lVar12 + 0x11f0) = pauStack_3128;
        *(undefined1 (**) [16])(lVar12 + 0x11e8) = local_3130;
        *(undefined1 (**) [16])(lVar12 + 0x1200) = pauStack_3118;
        *(undefined1 (**) [16])(lVar12 + 0x11f8) = pauStack_3120;
        *(undefined1 (**) [16])(lVar12 + 0x1248) = local_30d0;
        *(undefined1 (**) [16])(lVar12 + 0x1240) = pauStack_30d8;
        *(undefined1 (**) [16])(lVar12 + 0x1258) = pauStack_30c0;
        *(undefined1 (**) [16])(lVar12 + 0x1250) = pauStack_30c8;
        *(undefined8 *)(lVar12 + 0x1268) = local_30b0;
        *(undefined1 (**) [16])(lVar12 + 0x1260) = pauStack_30b8;
        *(undefined8 *)(lVar12 + 0x1278) = local_30a0;
        *(undefined8 *)(lVar12 + 0x1270) = uStack_30a8;
        *(undefined1 (**) [16])(lVar12 + 0x1228) = local_30f0;
        *(undefined1 (**) [16])(lVar12 + 0x1238) = pauStack_30e0;
        *(undefined1 (**) [16])(lVar12 + 0x1230) = pauStack_30e8;
      }
      if (uVar11 != 1) goto LAB_00205360;
      *(undefined1 *)(param_2 + 0x43) = 0;
      param_2[0x22] = param_2[0xe];
      param_2[0x21] = param_2[0xd];
      param_2[0x24] = param_2[0x10];
      param_2[0x23] = param_2[0xf];
      param_2[0x26] = param_2[0x12];
      param_2[0x25] = param_2[0x11];
      param_2[0x28] = param_2[0x14];
      param_2[0x27] = param_2[0x13];
      param_2[0x1a] = param_2[6];
      param_2[0x19] = param_2[5];
      param_2[0x1c] = param_2[8];
      param_2[0x1b] = param_2[7];
      param_2[0x1e] = param_2[10];
      param_2[0x1d] = param_2[9];
      param_2[0x20] = param_2[0xc];
      param_2[0x1f] = param_2[0xb];
      param_2[0x18] = param_2[4];
      param_2[0x17] = param_2[3];
      param_2[0x29] = *param_2;
      param_2[0x2a] = param_2[1];
LAB_00204c2c:
      FUN_001fee18(&local_16b0,param_2 + 0x17,param_3);
      if (local_16b0 == (undefined1 (*) [16])&DAT_00000004) {
        *param_1 = 0x10;
        uVar17 = 5;
        goto LAB_0020685c;
      }
      pauStack_3208 = local_1648;
      local_3210 = pauStack_1650;
      pauStack_31f8 = local_1638;
      pauStack_3200 = pauStack_1640;
      pauStack_31e8 = local_1628;
      local_31f0 = pauStack_1630;
      pauStack_31d8 = pauStack_1618;
      lStack_31e0 = local_1620;
      pauStack_3248 = local_1688;
      local_3250 = pauStack_1690;
      pauStack_3238 = local_1678;
      pauStack_3240 = pauStack_1680;
      pauStack_3228 = local_1668;
      local_3230 = pauStack_1670;
      pauStack_3218 = local_1658;
      pauStack_3220 = pauStack_1660;
      pauStack_3268 = pauStack_16a8;
      local_3270 = local_16b0;
      pauStack_3258 = pauStack_1698;
      pauStack_3260 = pauStack_16a0;
      FUN_001e7af0(param_2 + 0x17);
      lVar12 = *param_2;
      if (*(long *)(lVar12 + 0x11e0) != 4) {
        uVar11 = *(long *)(lVar12 + 0x11e0) - 2;
        if (1 < uVar11) {
          uVar11 = 2;
        }
        if (uVar11 != 0) {
          lVar13 = lVar12 + 0x11e0;
          if (uVar11 == 1) {
            lVar13 = lVar12 + 0x11e8;
          }
          FUN_001e80d8(lVar13);
          lVar12 = *param_2;
        }
      }
      *(undefined1 (**) [16])(lVar12 + 0x1248) = pauStack_3208;
      *(undefined1 (**) [16])(lVar12 + 0x1240) = local_3210;
      *(undefined1 (**) [16])(lVar12 + 0x1258) = pauStack_31f8;
      *(undefined1 (**) [16])(lVar12 + 0x1250) = pauStack_3200;
      *(undefined1 (**) [16])(lVar12 + 0x1268) = pauStack_31e8;
      *(undefined1 (**) [16])(lVar12 + 0x1260) = local_31f0;
      *(undefined1 (**) [16])(lVar12 + 0x1278) = pauStack_31d8;
      *(long *)(lVar12 + 0x1270) = lStack_31e0;
      *(undefined1 (**) [16])(lVar12 + 0x1208) = pauStack_3248;
      *(undefined1 (**) [16])(lVar12 + 0x1200) = local_3250;
      *(undefined1 (**) [16])(lVar12 + 0x1218) = pauStack_3238;
      *(undefined1 (**) [16])(lVar12 + 0x1210) = pauStack_3240;
      *(undefined1 (**) [16])(lVar12 + 0x1228) = pauStack_3228;
      *(undefined1 (**) [16])(lVar12 + 0x1220) = local_3230;
      *(undefined1 (**) [16])(lVar12 + 0x1238) = pauStack_3218;
      *(undefined1 (**) [16])(lVar12 + 0x1230) = pauStack_3220;
      *(undefined1 (**) [16])(lVar12 + 0x11e8) = pauStack_3268;
      *(undefined1 (**) [16])(lVar12 + 0x11e0) = local_3270;
      *(undefined1 (**) [16])(lVar12 + 0x11f8) = pauStack_3258;
      *(undefined1 (**) [16])(lVar12 + 0x11f0) = pauStack_3260;
    } while( true );
  }
  lVar13 = *(long *)puVar3;
  pauVar20 = *(undefined1 (**) [16])(lVar13 + 0x38);
  if (pauVar20 == (undefined1 (*) [16])0x0) {
                    /* WARNING: Subroutine does not return */
    FUN_0019151c(0x780351,0x22,&PTR_s__project_rawrs_src_raw_uploader__009c0498);
  }
  local_2c90 = *(undefined1 (**) [16])(lVar13 + 0x40);
  pauStack_2c88 = *(undefined1 (**) [16])(lVar13 + 0x48);
  local_2ca0 = *(undefined1 (**) [16])*(undefined1 (*) [16])(lVar13 + 0x30);
  local_2c80 = (undefined1 (*) [16])0x0;
  pauStack_2c98 = pauVar20;
  if (pauVar20 == (undefined1 (*) [16])0x1) {
                    /* WARNING: Subroutine does not return */
    FUN_0019151c(0x780351,0x22,&PTR_s__project_rawrs_src_raw_uploader__009c0498);
  }
  local_2cf0 = (undefined1 (*) [16])0x1;
  local_2c60 = (undefined1 (*) [16])(lVar12 + 0x11e0);
  local_2d10 = local_2ca0;
  pauStack_2d08 = pauVar20;
  local_2d00 = local_2c90;
  pauStack_2cf8 = pauStack_2c88;
  if (pauVar20 < (undefined1 (*) [16])0x3) {
                    /* WARNING: Subroutine does not return */
    FUN_0019151c(0x780351,0x22,&PTR_s__project_rawrs_src_raw_uploader__009c0498);
  }
  local_31b0 = (undefined1 (*) [16])0x2;
  local_31d0 = local_2ca0;
  pauStack_31c8 = pauVar20;
  local_31c0 = local_2c90;
  local_31b8 = pauStack_2c88;
  if (pauVar20 == (undefined1 (*) [16])0x3) {
                    /* WARNING: Subroutine does not return */
    FUN_0019151c(0x780351,0x22,&PTR_s__project_rawrs_src_raw_uploader__009c0498);
  }
  local_e0 = (undefined1 (*) [16])0x3;
  local_100 = local_2ca0;
  pauStack_f8 = pauVar20;
  local_f0 = local_2c90;
  pauStack_e8 = pauStack_2c88;
  if (pauVar20 < (undefined1 (*) [16])&DAT_00000005) {
                    /* WARNING: Subroutine does not return */
    FUN_0019151c(0x780351,0x22,&PTR_s__project_rawrs_src_raw_uploader__009c0498);
  }
  unaff_x20 = (undefined1 (*) [16])0x1;
  pauStack_3070 = (undefined1 (*) [16])&DAT_00000004;
  local_16b0 = (undefined1 (*) [16])&local_2ca0;
  pauStack_1698 = (undefined1 (*) [16])&local_2d10;
  pauStack_1690 = (undefined1 (*) [16])&local_2c60;
  pauStack_16a0 = (undefined1 (*) [16])&DAT_009c04b0;
  local_1688 = (undefined1 (*) [16])&DAT_009c0438;
  pauStack_1680 = (undefined1 (*) [16])&local_31d0;
  local_1678 = (undefined1 (*) [16])(lVar12 + 0x12c0);
  pauStack_1670 = (undefined1 (*) [16])&PTR_FUN_009c03a0;
  pauStack_1660 = (undefined1 (*) [16])(lVar12 + 0x1408);
  pauStack_1650 = (undefined1 (*) [16])&local_3090;
  pauStack_1640 = (undefined1 (*) [16])&DAT_009c03e0;
  local_1668 = (undefined1 (*) [16])&local_100;
  local_1658 = (undefined1 (*) [16])&DAT_009c03c0;
  local_2de0 = (undefined1 (*) [16])&local_16b0;
  local_1648 = (undefined1 (*) [16])0x1;
  pauStack_2dd8 = (undefined1 (*) [16])&DAT_00000005;
  local_3090 = local_2ca0;
  local_3088 = pauVar20;
  pauStack_3080 = local_2c90;
  local_3078 = pauStack_2c88;
  local_2dd0 = (undefined1 (*) [16])(lVar13 + 0x30);
  pauStack_16a8 = (undefined1 (*) [16])(param_2 + 0x18);
  FUN_00723fe4(param_2 + 0x19,lVar13,&local_2de0);
  local_2fa0 = param_2[0x18];
  *(undefined1 *)(param_2 + 0x20) = 1;
  *(undefined1 *)((long)param_2 + 0x101) = 1;
  local_2f97 = 0;
  if (param_2[0x19] == 2) goto LAB_00205878;
  *(undefined1 *)((long)param_2 + 0x101) = 0;
  local_2fa8 = lVar12;
  memcpy(&local_2c30,&local_3090,0x230);
  lStack_29f8 = param_2[0x1a];
  local_2a00 = param_2[0x19];
  lStack_29e8 = param_2[0x1c];
  local_29f0 = param_2[0x1b];
  local_29e0 = param_2[0x1d];
  *(undefined1 *)(param_2 + 0x20) = 0;
  memcpy(param_2 + 0x22,&local_2c30,0x260);
  lVar12 = param_2[0x68];
joined_r0x00203e28:
  if (lVar12 != 2) {
    FUN_00726804(param_2 + 0x68,param_2 + 0x6b);
  }
  FUN_0023224c(&local_16b0,param_2 + 0x22,param_3);
  if (param_2[0x68] != 2) {
    FUN_00726838(param_2 + 0x68,param_2 + 0x6b);
  }
  unaff_x20 = pauStack_1618;
  pauVar19 = local_1628;
  pauVar20 = local_16b0;
  if (local_16b0 != (undefined1 (*) [16])&DAT_00000004) {
    uVar8 = (undefined4)local_1620;
    iVar7 = local_1620._4_4_;
    pauStack_2e18 = pauStack_1660;
    local_2e20 = local_1668;
    pauStack_2e08 = pauStack_1650;
    local_2e10 = local_1658;
    pauStack_2de8 = pauStack_1630;
    local_2df0 = local_1638;
    pauStack_2e58 = pauStack_16a0;
    local_2e60 = pauStack_16a8;
    pauStack_2e48 = pauStack_1690;
    local_2e50 = pauStack_1698;
    pauStack_2df8 = pauStack_1640;
    local_2e00 = local_1648;
    pauStack_2e38 = pauStack_1680;
    local_2e40 = local_1688;
    pauStack_2e28 = pauStack_1670;
    local_2e30 = local_1678;
    FUN_001ea994(param_2 + 0x22);
    bVar6 = *(byte *)(param_2 + 0x20);
    *(undefined1 *)((long)param_2 + 0x101) = 0;
    goto joined_r0x002062e8;
  }
  uVar17 = 3;
LAB_0020684c:
  *(undefined1 *)((long)param_2 + 0x102) = uVar17;
  *param_1 = 0x10;
  uVar17 = 4;
  goto LAB_0020685c;
LAB_00205360:
  *(undefined4 *)(*param_2 + 0x1378) = 1000000000;
  lVar12 = *param_2;
  if (*(long *)(lVar12 + 0x1308) == -0x8000000000000000) goto code_r0x00205384;
  goto LAB_00205550;
code_r0x00205384:
  param_2[0x19] = lVar12;
  *(undefined1 *)((long)param_2 + 0xd1) = 0;
  goto LAB_0020538c;
}


