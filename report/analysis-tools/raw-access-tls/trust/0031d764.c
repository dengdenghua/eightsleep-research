/* Ghidra static pseudocode; not original source. */

void FUN_0031d764(undefined8 *param_1,undefined8 *param_2,undefined8 param_3)

{
  byte bVar1;
  undefined8 uVar2;
  undefined8 uVar3;
  undefined *puVar4;
  undefined *puVar5;
  char ****ppppcVar6;
  code *pcVar7;
  char cVar8;
  int iVar9;
  undefined4 uVar10;
  undefined8 *puVar11;
  char *****pppppcVar12;
  void *pvVar13;
  void *pvVar14;
  char *****pppppcVar15;
  undefined1 uVar16;
  long lVar17;
  long lVar18;
  char *****unaff_x21;
  char ****ppppcVar19;
  char *pcVar20;
  size_t sVar21;
  ulong uVar22;
  undefined8 uVar23;
  char ****ppppcVar24;
  char *****pppppcVar25;
  char *****pppppcVar26;
  char ****local_1b10;
  char ****ppppcStack_1b08;
  undefined4 local_1ae0;
  undefined3 uStack_1adc;
  char ****local_19a0;
  char ****ppppcStack_1998;
  char ****local_1990;
  char ****ppppcStack_1988;
  undefined8 local_1980;
  undefined8 uStack_1978;
  undefined8 uStack_1970;
  undefined8 uStack_1968;
  undefined4 local_1858;
  undefined3 uStack_1854;
  undefined1 auStack_1851 [313];
  undefined4 local_1718;
  undefined3 uStack_1714;
  undefined4 uStack_1710;
  undefined3 uStack_170c;
  char ***local_1708;
  char ****local_1700;
  undefined *local_16f8;
  char ***local_1308;
  long local_1300;
  undefined8 local_12f8;
  undefined8 uStack_12f0;
  undefined8 local_12e8;
  undefined8 local_1060;
  undefined1 auStack_ee0 [1064];
  char ****local_ab8;
  char ****local_ab0;
  undefined1 auStack_aa8 [1064];
  char ****local_680;
  undefined1 auStack_678 [16];
  undefined8 uStack_668;
  char ****local_660;
  undefined8 uStack_658;
  undefined8 local_650;
  undefined8 uStack_648;
  undefined8 local_640;
  undefined8 uStack_638;
  undefined8 local_630;
  undefined8 uStack_628;
  undefined8 local_620;
  undefined8 uStack_618;
  undefined8 local_610;
  undefined8 uStack_608;
  undefined8 local_600;
  char ***local_5f8;
  char ****local_5f0;
  undefined *local_5e8;
  char ****local_5e0;
  char ****ppppcStack_5d8;
  char ****local_5c8;
  char ****local_5c0;
  char ****local_5b8;
  char ****local_5b0;
  char ****ppppcStack_5a8;
  char ****local_5a0;
  undefined8 uStack_598;
  char ****local_590;
  char ****ppppcStack_588;
  char ****local_580;
  char ****ppppcStack_578;
  undefined8 local_570;
  undefined8 uStack_568;
  undefined8 local_560;
  undefined8 uStack_558;
  undefined8 local_550;
  undefined8 uStack_548;
  undefined8 local_540;
  undefined8 uStack_538;
  undefined8 local_530;
  undefined8 uStack_528;
  undefined8 local_520;
  undefined8 uStack_518;
  undefined8 local_510;
  undefined8 uStack_508;
  undefined8 local_500;
  undefined8 uStack_4f8;
  undefined8 local_4f0;
  undefined8 uStack_4e8;
  undefined8 local_4e0;
  undefined8 local_4d0;
  undefined8 uStack_4c8;
  undefined8 local_4c0;
  undefined1 local_4b4 [4];
  char ****local_4b0;
  char ****ppppcStack_4a8;
  undefined8 local_4a0;
  char ****ppppcStack_498;
  char ****local_490;
  undefined8 uStack_488;
  char ****local_480;
  undefined4 uStack_478;
  undefined4 uStack_474;
  undefined8 local_470;
  undefined8 uStack_468;
  undefined8 local_460;
  undefined8 uStack_458;
  undefined8 local_450;
  undefined8 uStack_448;
  undefined8 local_440;
  undefined8 uStack_438;
  undefined8 local_430;
  undefined8 uStack_428;
  undefined8 local_420;
  
  puVar5 = PTR_DAT_009fac58;
  local_1060 = 0;
  bVar1 = *(byte *)((long)param_2 + 0x22);
  if (bVar1 < 3) {
    if (bVar1 != 0) {
      if (bVar1 == 1) {
                    /* WARNING: Subroutine does not return */
        FUN_00191a20();
      }
                    /* WARNING: Subroutine does not return */
      FUN_00191a54(&PTR_s__cargo_registry_src_index_crates_009ca2e0);
    }
    *(undefined2 *)(param_2 + 4) = 1;
    puVar4 = PTR_PTR_009fa450;
    if ((*(ulong *)puVar5 < 2) &&
       (((unaff_x21 = (char *****)puVar4, (byte)PTR_PTR_009fa450[0x10] - 1 < 2 ||
         (((byte)PTR_PTR_009fa450[0x10] != 0 &&
          (cVar8 = FUN_0018fb0c(PTR_PTR_009fa450), cVar8 != '\0')))) &&
        (iVar9 = FUN_007243f8(*(undefined8 *)puVar4), iVar9 != 0)))) {
      lVar17 = *(long *)puVar4;
      local_1300 = *(long *)(lVar17 + 0x38);
      if (local_1300 == 0) {
                    /* WARNING: Subroutine does not return */
        FUN_0019151c("FieldSet corrupted (this is a bug)",0x22,
                     &PTR_s__cargo_registry_src_index_crates_009ca2b8);
      }
      uStack_12f0 = *(undefined8 *)(lVar17 + 0x48);
      local_12f8 = *(undefined8 *)(lVar17 + 0x40);
      local_1990 = (char ****)(lVar17 + 0x30);
      local_1308 = *local_1990;
      local_1700 = (char ****)&local_4a0;
      local_12e8 = 0;
      local_4a0 = &PTR_s_upgrading_connection_to_TLS_009ca2d0;
      local_490 = (char ****)&DAT_00000008;
      local_1708 = (char ***)&local_1308;
      local_16f8 = &DAT_009c9a88;
      local_19a0 = &local_1708;
      ppppcStack_498 = (char ****)0x1;
      local_480 = (char ****)0x0;
      uStack_488 = (char *****)0x0;
      ppppcStack_1998 = (char ****)0x1;
      FUN_00724b8c(lVar17,&local_19a0);
    }
    lVar17 = param_2[2];
    *(undefined1 *)((long)param_2 + 0x15e) = 0;
    param_2[0x2a] = lVar17;
LAB_0031d8d0:
    pppppcVar26 = (char *****)((long)param_2 + 0x15e);
    param_2[10] = 0;
    param_2[0xb] = 8;
    param_2[0xc] = 0;
    *(undefined2 *)((long)param_2 + 0x15c) = 0;
    *(undefined4 *)(param_2 + 0x2b) = 0;
    param_2[9] = lVar17;
    *(undefined1 *)((long)param_2 + 0x15c) = 1;
    if ((*(long *)(lVar17 + 0x10) == 2) && (lVar18 = *(long *)(lVar17 + 0x178), lVar18 != 0)) {
LAB_0031da74:
      lVar17 = *(long *)(lVar17 + 0x170);
      lVar18 = lVar17 + lVar18 * 0x18;
      param_2[0x31] = lVar17;
      param_2[0x32] = lVar18;
      if (lVar17 != lVar18) goto LAB_0031e688;
LAB_0031da8c:
      pppppcVar26 = (char *****)((long)param_2 + 0x15e);
      FUN_004bb998(&local_4a0);
      ppppcStack_588 = (char ****)param_2[0xb];
      local_590 = (char ****)param_2[10];
      local_580 = (char ****)param_2[0xc];
      *(undefined1 *)((long)param_2 + 0x15c) = 0;
      FUN_002b9ed4(param_2 + 0xd,&local_4a0,&local_590);
      lVar17 = param_2[9];
      *(undefined1 *)((long)param_2 + 0x15a) = 1;
      if (*(long *)(lVar17 + 0x180) == -0x8000000000000000) {
        uStack_508 = param_2[0x1e];
        local_510 = param_2[0x1d];
        uStack_4f8 = param_2[0x20];
        local_500 = param_2[0x1f];
        uStack_4e8 = param_2[0x22];
        local_4f0 = param_2[0x21];
        local_4e0 = param_2[0x23];
        param_2[0x24] = 0x8000000000000000;
        uStack_548 = param_2[0x16];
        local_550 = param_2[0x15];
        uStack_538 = param_2[0x18];
        local_540 = param_2[0x17];
        *(undefined1 *)((long)param_2 + 0x15b) = 1;
        *(undefined1 *)((long)param_2 + 0x15a) = 0;
        uStack_528 = param_2[0x1a];
        local_530 = param_2[0x19];
        uStack_518 = param_2[0x1c];
        local_520 = param_2[0x1b];
        ppppcStack_588 = (char ****)param_2[0xe];
        local_590 = (char ****)param_2[0xd];
        ppppcStack_578 = (char ****)param_2[0x10];
        local_580 = (char ****)param_2[0xf];
        uStack_568 = param_2[0x12];
        local_570 = param_2[0x11];
        uStack_558 = param_2[0x14];
        local_560 = param_2[0x13];
        FUN_004bb3f4(&local_4a0,&local_590);
        pppppcVar26 = (char *****)local_490;
        pppppcVar12 = (char *****)ppppcStack_498;
        pppppcVar25 = (char *****)local_4a0;
        unaff_x21 = (char *****)((ulong)uStack_488 & 0xff);
        memcpy(&local_1708,(void *)((long)&uStack_488 + 1),0x13f);
        bVar1 = *(byte *)((long)param_2 + 0x15a);
      }
      else {
        sVar21 = *(size_t *)(lVar17 + 400);
        if ((long)sVar21 < 0) {
          uVar23 = 0;
LAB_0031e2a8:
                    /* WARNING: Subroutine does not return */
          FUN_00191384(uVar23,sVar21,&PTR_DAT_009c7858);
        }
        pvVar14 = *(void **)(lVar17 + 0x188);
        unaff_x21 = (char *****)0x1;
        if (sVar21 == 0) {
          pvVar13 = (void *)0x1;
        }
        else {
          uVar16 = *PTR_DAT_009faac8;
          iVar9 = FUN_006212cc(1,sVar21);
          if (iVar9 == 0) {
            pvVar13 = malloc(sVar21);
          }
          else {
            pvVar13 = (void *)FUN_006341e8(sVar21,iVar9);
          }
          if (pvVar13 == (void *)0x0) {
            uVar23 = 1;
            goto LAB_0031e2a8;
          }
        }
        memcpy(pvVar13,pvVar14,sVar21);
        param_2[0x24] = sVar21;
        param_2[0x25] = pvVar13;
        param_2[0x26] = sVar21;
        *(undefined1 *)((long)param_2 + 0x15b) = 0;
        *(undefined1 *)((long)param_2 + 0x159) = 1;
        param_2[0x2d] = param_2[0x25];
        param_2[0x2c] = param_2[0x24];
        param_2[0x2e] = sVar21;
        if (*(long *)(param_2[9] + 0x198) == -0x8000000000000000) {
          param_2[0x27] = 0x8000000000000000;
          *(undefined1 *)(param_2 + 0x2b) = 1;
        }
        else {
          FUN_002dccac(param_2 + 0x27,param_2[9] + 0x198,
                       &PTR_s__rust_lib_rustlib_src_rust_libra_009ca740);
          *(undefined1 *)(param_2 + 0x2b) = 1;
          if (param_2[0x27] != -0x8000000000000000) {
            local_580 = (char ****)param_2[0x29];
            ppppcStack_588 = (char ****)param_2[0x28];
            local_590 = (char ****)param_2[0x27];
            *(undefined1 *)(param_2 + 0x2b) = 0;
            *(undefined1 *)(param_2 + 0x33) = 0;
            param_2[0x30] = ppppcStack_588;
            param_2[0x2f] = local_590;
            param_2[0x32] = ppppcStack_578;
            param_2[0x31] = local_580;
LAB_0031dd6c:
            ppppcStack_498 = (char ****)param_2[0x30];
            local_4a0 = (undefined **)param_2[0x2f];
            local_490 = (char ****)param_2[0x31];
            uVar23 = FUN_002b9314(&local_4a0,&PTR_s__cargo_registry_src_index_crates_009c9be8);
            param_2[0x32] = uVar23;
            goto LAB_0031dd94;
          }
        }
        pppppcVar12 = (char *****)FUN_003041b8("found certificate, but no key",0x1d);
        pppppcVar25 = (char *****)0x2;
        lVar17 = param_2[0x27];
joined_r0x0031e110:
        if ((lVar17 != -0x8000000000000000) && ((*(byte *)(param_2 + 0x2b) & 1) != 0)) {
          FUN_0027e678(param_2 + 0x27);
        }
        *(undefined1 *)(param_2 + 0x2b) = 0;
        if ((*(byte *)((long)param_2 + 0x159) & 1) != 0) {
          FUN_0027e678(param_2 + 0x2c);
        }
        *(undefined1 *)((long)param_2 + 0x159) = 0;
        bVar1 = *(byte *)((long)param_2 + 0x15a);
      }
      if ((bVar1 & 1) != 0) {
        FUN_00320a74(param_2 + 0xd);
      }
      uVar16 = SUB81(unaff_x21,0);
      lVar17 = param_2[0x24];
      *(undefined1 *)((long)param_2 + 0x15a) = 0;
      if (((lVar17 != -0x8000000000000000) && ((*(byte *)((long)param_2 + 0x15b) & 1) != 0)) &&
         (lVar17 != 0)) {
        uVar23 = param_2[0x25];
        uVar10 = FUN_006212cc(1,lVar17);
        FUN_00637bc0(uVar23,lVar17,uVar10);
      }
      *(undefined1 *)((long)param_2 + 0x15b) = 0;
      if (pppppcVar25 != (char *****)0x2) goto LAB_0031e198;
LAB_0031e804:
      uVar16 = SUB81(unaff_x21,0);
      if ((*(byte *)((long)param_2 + 0x15c) & 1) != 0) {
        lVar17 = param_2[0xc] + 1;
        lVar18 = param_2[0xb];
        while (lVar17 = lVar17 + -1, lVar17 != 0) {
          FUN_002d7404(lVar18);
          lVar18 = lVar18 + 0x48;
        }
        uVar16 = 0;
        if (param_2[10] != 0) {
          uVar23 = param_2[0xb];
          lVar17 = param_2[10] * 0x48;
          uVar10 = FUN_006212cc(8,lVar17);
          FUN_00637bc0(uVar23,lVar17,uVar10);
        }
      }
      *(undefined1 *)((long)param_2 + 0x15c) = 0;
      memcpy(&local_19a0,&local_1308,0x13f);
      pppppcVar25 = (char *****)0x2;
      *(undefined1 *)((long)param_2 + 0x15e) = 1;
    }
    else {
      FUN_0046ba94(&local_1708);
      if (local_1708 == (char ***)&DAT_8000000000000000) {
        local_5b0 = local_1700;
        local_590 = (char ****)&local_5b0;
        local_480 = (char ****)0x0;
        local_4a0 = &PTR_s_could_not_load_platform_certs__009c9b20;
        ppppcStack_588 = (char ****)PTR_FUN_009faca0;
        local_490 = (char ****)&local_590;
        ppppcStack_498 = (char ****)0x1;
        uStack_488 = (char *****)0x1;
        FUN_0076b8c0(&local_4d0,&local_4a0);
        uVar16 = *PTR_DAT_009faac8;
        iVar9 = FUN_006212cc(8,0x18);
        if (iVar9 == 0) {
          puVar11 = malloc(0x18);
        }
        else {
          puVar11 = (undefined8 *)FUN_006341e8(0x18,iVar9);
        }
        if (puVar11 == (undefined8 *)0x0) {
                    /* WARNING: Subroutine does not return */
          FUN_0019139c(8,0x18);
        }
        puVar11[1] = uStack_4c8;
        *puVar11 = local_4d0;
        puVar11[2] = local_4c0;
        pppppcVar12 = (char *****)FUN_00746ab0(0x28,puVar11,&PTR_FUN_009c9b50);
        if (((ulong)local_5b0 & 3) == 1) {
          pcVar20 = (char *)((long)local_5b0 + -1);
          uVar23 = *(undefined8 *)pcVar20;
          unaff_x21 = *(char ******)((long)local_5b0 + 7);
          if (*unaff_x21 != (char ****)0x0) {
            (*(code *)*unaff_x21)(uVar23);
          }
          ppppcVar24 = unaff_x21[1];
          if (ppppcVar24 != (char ****)0x0) {
            uVar10 = FUN_006212cc(unaff_x21[2],ppppcVar24);
            FUN_00637bc0(uVar23,ppppcVar24,uVar10);
          }
          uVar10 = FUN_006212cc(8,0x18);
          FUN_00637bc0(pcVar20,0x18,uVar10);
        }
        goto LAB_0031e804;
      }
      local_5f8 = local_1708;
      local_5f0 = local_1700;
      local_5e8 = local_16f8;
      FUN_0035d460(param_2 + 10,&local_5f8);
      lVar17 = param_2[9];
      if (*(long *)(lVar17 + 0x10) == 2) {
        lVar18 = *(long *)(lVar17 + 0x178);
        goto LAB_0031da74;
      }
      FUN_00336a1c(&local_4a0);
      pppppcVar26 = (char *****)local_490;
      pppppcVar12 = (char *****)ppppcStack_498;
      pppppcVar25 = (char *****)local_4a0;
      uVar16 = (undefined1)uStack_488;
      unaff_x21 = (char *****)((ulong)uStack_488 & 0xff);
      memcpy(&local_1708,(void *)((long)&uStack_488 + 1),0x13f);
      if (pppppcVar25 == (char *****)0x2) goto LAB_0031e804;
LAB_0031e198:
      memcpy(&local_1308,&local_1708,0x13f);
      if ((*(byte *)((long)param_2 + 0x15c) & 1) != 0) {
        lVar17 = param_2[0xc] + 1;
        lVar18 = param_2[0xb];
        while (lVar17 = lVar17 + -1, lVar17 != 0) {
          FUN_002d7404(lVar18);
          lVar18 = lVar18 + 0x48;
        }
        if (param_2[10] != 0) {
          uVar23 = param_2[0xb];
          lVar17 = param_2[10] * 0x48;
          uVar10 = FUN_006212cc(8,lVar17);
          FUN_00637bc0(uVar23,lVar17,uVar10);
        }
      }
      *(undefined1 *)((long)param_2 + 0x15c) = 0;
      memcpy(&local_19a0,&local_1308,0x13f);
      *(undefined1 *)((long)param_2 + 0x15e) = 1;
      if (pppppcVar25 == (char *****)0x3) goto LAB_0031e77c;
    }
    memcpy(&local_1858,&local_19a0,0x13f);
    FUN_00325a3c(param_2 + 5);
    if (pppppcVar25 != (char *****)0x2) {
      memcpy(&local_470,auStack_1851,0x138);
      uStack_474 = CONCAT31(uStack_1854,local_1858._3_1_);
      uStack_478 = CONCAT31((int3)local_1858,uVar16);
      ppppcStack_498 = (char ****)0x1;
      local_4a0 = (undefined **)0x1;
      uVar16 = *PTR_DAT_009faac8;
      local_490 = (char ****)pppppcVar25;
      uStack_488 = pppppcVar12;
      local_480 = (char ****)pppppcVar26;
      iVar9 = FUN_006212cc(8,0x168);
      if (iVar9 == 0) {
        pvVar14 = malloc(0x168);
      }
      else {
        pvVar14 = (void *)FUN_006341e8(0x168,iVar9);
      }
      if (pvVar14 == (void *)0x0) {
                    /* WARNING: Subroutine does not return */
        FUN_0019139c(8,0x168);
      }
      memcpy(pvVar14,&local_4a0,0x168);
      *(undefined1 *)((long)param_2 + 0x21) = 0;
      param_2[5] = pvVar14;
      FUN_0045bd3c(param_2[3]);
      FUN_00604db8(&local_4a0);
      if ((char)local_4a0 != '\x02') {
        uVar10 = uStack_488._4_4_;
        *(char *)(param_2 + 0x8d) = (char)local_4a0;
        uStack_170c = (undefined3)((ulong)local_4a0 >> 0x28);
        uStack_1710 = local_4a0._1_4_;
        uStack_1714 = (undefined3)((ulong)uStack_488 >> 0x28);
        *(undefined4 *)((long)param_2 + 0x469) = local_4a0._1_4_;
        *(int *)((long)param_2 + 0x46c) = (int)((ulong)local_4a0 >> 0x20);
        *(undefined1 *)(param_2 + 0x90) = (undefined1)uStack_488;
        param_2[0x8f] = local_490;
        param_2[0x8e] = ppppcStack_498;
        *(undefined4 *)((long)param_2 + 0x481) = uStack_488._1_4_;
        *(undefined4 *)((long)param_2 + 0x484) = uVar10;
        local_1718 = uStack_488._1_4_;
        FUN_006048ac(&local_1ae0,param_2 + 0x8d);
        uVar23 = param_2[5];
        pppppcVar12 = (char *****)param_2[1];
        pppppcVar26 = (char *****)*param_2;
        *(undefined1 *)(param_2 + 4) = 0;
        lVar17 = FUN_0077c8d0(1,uVar23);
        if (lVar17 < 0) goto LAB_0031e54c;
        FUN_004c9040(&local_4a0,uVar23,&local_1ae0);
        pppppcVar15 = uStack_488;
        pppppcVar25 = (char *****)local_4a0;
        if ((char *****)local_4a0 == (char *****)0x2) {
          local_1980 = CONCAT44(uStack_474,uStack_478);
          ppppcStack_1998 = local_490;
          local_19a0 = ppppcStack_498;
          ppppcStack_1988 = local_480;
          local_1990 = (char ****)uStack_488;
          uStack_1978 = local_470;
          uStack_1968 = local_460;
          uStack_1970 = uStack_468;
          pppppcVar15 = (char *****)FUN_003c70a4(0x28,&local_19a0);
          pppppcVar25 = (char *****)&DAT_00000004;
          local_1b10 = (char ****)pppppcVar26;
          ppppcStack_1b08 = (char ****)pppppcVar12;
        }
        else {
          ppppcStack_1b08 = local_490;
          local_1b10 = ppppcStack_498;
          memcpy(&local_1308,&local_480,0x400);
        }
        memcpy(&local_1708,&local_1308,0x400);
        param_2[6] = pppppcVar25;
        param_2[8] = ppppcStack_1b08;
        param_2[7] = local_1b10;
        param_2[9] = pppppcVar15;
        memcpy(param_2 + 10,&local_1708,0x400);
        *(undefined1 *)(param_2 + 0x8c) = 0;
        param_2[0x8b] = pppppcVar12;
        param_2[0x8a] = pppppcVar26;
        goto LAB_0031eb54;
      }
      auStack_678._8_8_ = &DAT_009c6160;
      uStack_668._0_5_ = CONCAT41(local_1718,5);
      uStack_668 = (char *****)
                   CONCAT44(CONCAT31(uStack_1714,local_1718._3_1_),(undefined4)uStack_668);
      auStack_678._0_8_ = 1;
      local_680 = (char ****)&DAT_8000000000000000;
      goto LAB_0031ec60;
    }
    auStack_678 = FUN_002ce23c(pppppcVar12);
    uStack_668._0_5_ = CONCAT41(local_1ae0,5);
    uStack_668 = (char *****)CONCAT44(CONCAT31(uStack_1adc,local_1ae0._3_1_),(undefined4)uStack_668)
    ;
    local_680 = (char ****)&DAT_8000000000000000;
LAB_0031ec84:
    *(undefined1 *)((long)param_2 + 0x21) = 0;
    if ((*(byte *)(param_2 + 4) & 1) != 0) {
      uVar23 = *param_2;
      puVar11 = (undefined8 *)param_2[1];
      if ((code *)*puVar11 != (code *)0x0) {
        (*(code *)*puVar11)(uVar23);
      }
      lVar17 = puVar11[1];
      if (lVar17 != 0) {
        uVar10 = FUN_006212cc(puVar11[2],lVar17);
        FUN_00637bc0(uVar23,lVar17,uVar10);
      }
    }
  }
  else {
    if (bVar1 == 3) {
      bVar1 = *(byte *)((long)param_2 + 0x15e);
      if (bVar1 < 3) {
        if (bVar1 != 0) {
          if (bVar1 == 1) {
                    /* WARNING: Subroutine does not return */
            FUN_00191a20(&PTR_s__cargo_registry_src_index_crates_009c9b08);
          }
                    /* WARNING: Subroutine does not return */
          FUN_00191a54(&PTR_s__cargo_registry_src_index_crates_009c9b08);
        }
        lVar17 = param_2[0x2a];
        goto LAB_0031d8d0;
      }
      if (bVar1 != 3) {
        if (bVar1 == 4) {
          bVar1 = *(byte *)(param_2 + 0x33);
          if (bVar1 < 2) {
            if (bVar1 != 0) {
                    /* WARNING: Subroutine does not return */
              FUN_00191a20(&PTR_s__cargo_registry_src_index_crates_009c9c00);
            }
            goto LAB_0031dd6c;
          }
          if (bVar1 != 3) {
                    /* WARNING: Subroutine does not return */
            FUN_00191a54(&PTR_s__cargo_registry_src_index_crates_009c9c00);
          }
LAB_0031dd94:
          unaff_x21 = (char *****)(param_2 + 0x33);
          FUN_00348fd8(&local_4a0,param_2 + 0x32,param_3);
          pppppcVar12 = (char *****)ppppcStack_498;
          pppppcVar26 = (char *****)local_4a0;
          if (local_4a0 == (undefined **)&DAT_00000005) {
            *(char *)unaff_x21 = '\x03';
            *(undefined1 *)((long)param_2 + 0x15e) = 4;
            goto LAB_0031e77c;
          }
          uVar23 = param_2[0x32];
          ppppcStack_5a8 = (char ****)uStack_488;
          local_5b0 = local_490;
          iVar9 = FUN_006fecdc(uVar23);
          if (iVar9 != 0) {
            FUN_00719400(uVar23);
          }
          if (pppppcVar26 == (char *****)&DAT_00000004) {
            local_4a0 = (undefined **)pppppcVar12;
            local_490 = ppppcStack_5a8;
            ppppcStack_498 = local_5b0;
            pppppcVar12 = (char *****)FUN_0071d7cc(&local_4a0);
            *(char *)unaff_x21 = '\x01';
          }
          else {
            ppppcStack_4a8 = ppppcStack_5a8;
            local_4b0 = local_5b0;
            *(char *)unaff_x21 = '\x01';
            ppppcStack_5d8 = ppppcStack_5a8;
            local_5e0 = local_5b0;
            if (pppppcVar26 != (char *****)0x3) {
              *(undefined1 *)((long)param_2 + 0x15d) = 1;
              local_490 = (char ****)param_2[0x2e];
              param_2[5] = pppppcVar26;
              param_2[6] = pppppcVar12;
              param_2[8] = ppppcStack_5a8;
              param_2[7] = local_5b0;
              ppppcStack_498 = (char ****)param_2[0x2d];
              local_4a0 = (undefined **)param_2[0x2c];
              *(undefined1 *)((long)param_2 + 0x159) = 0;
              param_2[0x2f] = uStack_488;
              param_2[0x2e] = local_490;
              *(undefined1 *)(param_2 + 0x30) = 0;
              goto LAB_0031de74;
            }
          }
        }
        else {
LAB_0031de74:
          FUN_003188c4(&local_590,param_2 + 0x2c,param_3);
          unaff_x21 = (char *****)local_580;
          pppppcVar12 = (char *****)ppppcStack_588;
          ppppcVar24 = local_590;
          if (local_590 == (char ****)&DAT_8000000000000001) {
            uVar16 = 5;
            goto LAB_0031e778;
          }
          if (*(char *)(param_2 + 0x30) == '\x03') {
            FUN_00348b78(param_2 + 0x2f);
          }
          else if (*(char *)(param_2 + 0x30) == '\0') {
            FUN_0027e678(param_2 + 0x2c);
          }
          if (ppppcVar24 != (char ****)&DAT_8000000000000000) {
            uStack_508 = param_2[0x1e];
            local_510 = param_2[0x1d];
            uStack_4f8 = param_2[0x20];
            local_500 = param_2[0x1f];
            uStack_4e8 = param_2[0x22];
            local_4f0 = param_2[0x21];
            local_4e0 = param_2[0x23];
            local_5c8 = ppppcVar24;
            uStack_548 = param_2[0x16];
            local_550 = param_2[0x15];
            uStack_538 = param_2[0x18];
            local_540 = param_2[0x17];
            uStack_518 = param_2[0x1c];
            local_520 = param_2[0x1b];
            uStack_528 = param_2[0x1a];
            local_530 = param_2[0x19];
            ppppcStack_578 = (char ****)param_2[0x10];
            local_580 = (char ****)param_2[0xf];
            ppppcStack_588 = (char ****)param_2[0xe];
            local_590 = (char ****)param_2[0xd];
            uStack_568 = param_2[0x12];
            local_570 = param_2[0x11];
            uStack_558 = param_2[0x14];
            local_560 = param_2[0x13];
            local_5c0 = (char ****)pppppcVar12;
            *(undefined1 *)((long)param_2 + 0x15a) = 0;
            *(undefined1 *)((long)param_2 + 0x15d) = 0;
            local_5b8 = (char ****)unaff_x21;
            ppppcStack_5a8 = (char ****)param_2[6];
            local_5b0 = (char ****)param_2[5];
            uStack_598 = param_2[8];
            local_5a0 = (char ****)param_2[7];
            unaff_x21 = (char *****)&local_4a0;
            FUN_004bb1f4(&local_4a0,&local_590,&local_5c8,&local_5b0);
            pppppcVar26 = (char *****)local_490;
            pppppcVar12 = (char *****)ppppcStack_498;
            pppppcVar25 = (char *****)local_4a0;
            if ((char *****)local_4a0 == (char *****)0x2) {
              local_570 = CONCAT44(uStack_474,uStack_478);
              ppppcStack_588 = local_490;
              local_590 = ppppcStack_498;
              ppppcStack_578 = local_480;
              local_580 = (char ****)uStack_488;
              uStack_568 = local_470;
              uStack_558 = local_460;
              local_560 = uStack_468;
              FUN_0027d3f0(&local_5b0,0x20,0,1,1);
              uVar3 = s_rtificate_or_key_00787c22._8_8_;
              uVar2 = s_rtificate_or_key_00787c22._0_8_;
              uVar23 = s_could_not_add_ce_00787c12._0_8_;
              if ((int)local_5b0 == 1) {
                    /* WARNING: Subroutine does not return */
                FUN_00191384(ppppcStack_5a8,local_5a0,
                             &PTR_s__rust_lib_rustlib_src_rust_libra_009ca568);
              }
              local_5a0[1] = (char ***)s_could_not_add_ce_00787c12._8_8_;
              *local_5a0 = (char ***)uVar23;
              local_5a0[3] = (char ***)uVar3;
              local_5a0[2] = (char ***)uVar2;
              local_5b0 = ppppcStack_5a8;
              ppppcStack_5a8 = local_5a0;
              local_5a0 = (char ****)&DAT_00000020;
              uVar16 = *PTR_DAT_009faac8;
              puVar11 = (undefined8 *)FUN_00318628(0x18,8);
              if (puVar11 == (undefined8 *)0x0) {
                    /* WARNING: Subroutine does not return */
                FUN_0019139c(8,0x18);
              }
              puVar11[1] = ppppcStack_5a8;
              *puVar11 = local_5b0;
              puVar11[2] = local_5a0;
              pppppcVar12 = (char *****)FUN_00746ab0(0x28,puVar11,&PTR_FUN_009c9b50);
              FUN_00322370(&local_590);
              pppppcVar26 = (char *****)((long)param_2 + 0x15e);
            }
            else {
              unaff_x21 = (char *****)((ulong)uStack_488 & 0xff);
              memcpy(&local_1708,(void *)((long)&uStack_488 + 1),0x13f);
            }
            *(undefined1 *)((long)param_2 + 0x15d) = 0;
            lVar17 = param_2[0x27];
            goto joined_r0x0031e110;
          }
          uVar22 = param_2[6];
          if ((uVar22 | 0x8000000000000000) != 0x8000000000000000) {
            uVar23 = param_2[7];
            uVar10 = FUN_006212cc(1,uVar22);
            FUN_00637bc0(uVar23,uVar22,uVar10);
          }
        }
        pppppcVar26 = (char *****)((long)param_2 + 0x15e);
        *(undefined1 *)((long)param_2 + 0x15d) = 0;
        *(undefined1 *)(param_2 + 0x2b) = 0;
        if (((*(byte *)((long)param_2 + 0x159) & 1) != 0) && (lVar17 = param_2[0x2c], lVar17 != 0))
        {
          uVar23 = param_2[0x2d];
          uVar10 = FUN_006212cc(1,lVar17);
          FUN_00637bc0(uVar23,lVar17,uVar10);
        }
        *(undefined1 *)((long)param_2 + 0x159) = 0;
        FUN_00320a74(param_2 + 0xd);
        *(undefined2 *)((long)param_2 + 0x15a) = 0;
        goto LAB_0031e804;
      }
      while( true ) {
        pppppcVar26 = (char *****)((long)param_2 + 0x15e);
        FUN_003188c4(&local_4a0,param_2 + 0x2c,param_3);
        ppppcVar24 = local_490;
        pppppcVar12 = (char *****)ppppcStack_498;
        unaff_x21 = (char *****)local_4a0;
        if (local_4a0 == (undefined **)&DAT_8000000000000001) break;
        if (*(char *)(param_2 + 0x30) == '\x03') {
          uVar23 = param_2[0x2f];
          iVar9 = FUN_006fecdc(uVar23);
          if (iVar9 != 0) {
            FUN_00719400(uVar23);
          }
        }
        else if ((*(char *)(param_2 + 0x30) == '\0') && (lVar17 = param_2[0x2c], lVar17 != 0)) {
          uVar23 = param_2[0x2d];
          uVar10 = FUN_006212cc(1,lVar17);
          FUN_00637bc0(uVar23,lVar17,uVar10);
        }
        if (unaff_x21 == (char *****)&DAT_8000000000000000) goto LAB_0031e804;
        local_4a0 = (undefined **)pppppcVar12;
        uStack_488 = pppppcVar12 + (long)ppppcVar24 * 3;
        local_490 = (char ****)unaff_x21;
        ppppcStack_498 = (char ****)pppppcVar12;
        FUN_002b65a8(&local_5b0,&local_4a0);
        ppppcVar6 = local_5a0;
        ppppcVar24 = ppppcStack_5a8;
        if (local_5b0 == (char ****)&DAT_8000000000000000) {
          local_4b0 = (char ****)local_4b4;
          local_480 = (char ****)0x0;
          local_4b4[0] = ppppcStack_5a8._0_1_;
          local_4a0 = &PTR_s_could_not_load_certs__009c9ba8;
          local_490 = (char ****)&local_4b0;
          ppppcStack_4a8 = (char ****)PTR_LAB_009fab48;
          ppppcStack_498 = (char ****)0x1;
          uStack_488 = (char *****)0x1;
          FUN_0076b8c0(&local_590,&local_4a0);
          pppppcVar12 = (char *****)FUN_004c2fb0(0x14,&local_590);
          goto LAB_0031e804;
        }
        local_490 = local_5b0;
        uStack_488 = (char *****)(ppppcStack_5a8 + (long)local_5a0 * 9);
        lVar17 = param_2[0xc];
        local_4a0 = (undefined **)ppppcStack_5a8;
        ppppcStack_498 = ppppcStack_5a8;
        if ((char *****)(param_2[10] - lVar17) < local_5a0) {
          FUN_00172ac4(param_2 + 10,lVar17,local_5a0,8,0x48);
          lVar17 = param_2[0xc];
        }
        memcpy((void *)(param_2[0xb] + lVar17 * 0x48),ppppcVar24,(long)ppppcVar6 * 0x48);
        uStack_488 = (char *****)ppppcVar24;
        param_2[0xc] = (char *)((long)ppppcVar6 + lVar17);
        FUN_002bce40(&local_4a0);
        lVar17 = param_2[0x31];
        if (lVar17 == param_2[0x32]) goto LAB_0031da8c;
LAB_0031e688:
        param_2[0x31] = lVar17 + 0x18;
        sVar21 = *(size_t *)(lVar17 + 0x10);
        if ((long)sVar21 < 0) {
          uVar23 = 0;
LAB_0031eeb8:
                    /* WARNING: Subroutine does not return */
          FUN_00191384(uVar23,sVar21,&PTR_DAT_009c7858);
        }
        pvVar13 = *(void **)(lVar17 + 8);
        pvVar14 = (void *)0x1;
        if (sVar21 != 0) {
          uVar16 = *PTR_DAT_009faac8;
          iVar9 = FUN_006212cc(1,sVar21);
          if (iVar9 == 0) {
            pvVar14 = malloc(sVar21);
          }
          else {
            pvVar14 = (void *)FUN_006341e8(sVar21,iVar9);
          }
          if (pvVar14 == (void *)0x0) {
            uVar23 = 1;
            goto LAB_0031eeb8;
          }
        }
        memcpy(pvVar14,pvVar13,sVar21);
        param_2[0x2c] = sVar21;
        param_2[0x2d] = pvVar14;
        param_2[0x2e] = sVar21;
        *(undefined1 *)(param_2 + 0x30) = 0;
      }
      uVar16 = 3;
LAB_0031e778:
      *(undefined1 *)((long)param_2 + 0x15e) = uVar16;
LAB_0031e77c:
      *param_1 = 0x8000000000000001;
      uVar16 = 3;
      goto LAB_0031ee4c;
    }
LAB_0031eb54:
    FUN_00334124(&local_4a0,param_2 + 6,param_3);
    pppppcVar12 = uStack_488;
    ppppcVar6 = local_490;
    ppppcVar24 = ppppcStack_498;
    pppppcVar26 = (char *****)local_4a0;
    if ((char *****)local_4a0 == (char *****)0x2) {
      if (*uStack_488 != (char ****)0x0) {
        (*(code *)*uStack_488)(local_490);
      }
      ppppcVar19 = pppppcVar12[1];
      if (ppppcVar19 != (char ****)0x0) {
        uVar10 = FUN_006212cc(pppppcVar12[2],ppppcVar19);
        FUN_00637bc0(ppppcVar6,ppppcVar19,uVar10);
      }
    }
    else {
      if ((char *****)local_4a0 == (char *****)0x3) {
        *param_1 = 0x8000000000000001;
        uVar16 = 4;
        goto LAB_0031ee4c;
      }
      memcpy(&local_1308,&local_490,0x428);
    }
    memcpy(auStack_ee0,&local_1308,0x428);
    FUN_0031fb3c(param_2 + 6);
    if (pppppcVar26 == (char *****)0x2) {
      FUN_0044f90c((ulong)&local_680 | 8,ppppcVar24);
      local_680 = (char ****)&DAT_8000000000000000;
      if ((((*(byte *)(param_2 + 0x8d) & 1) == 0) &&
          (lVar17 = param_2[0x8e], lVar17 != -0x8000000000000000)) && (lVar17 != 0)) {
        uVar23 = param_2[0x8f];
        uVar10 = FUN_006212cc(1,lVar17);
        FUN_00637bc0(uVar23,lVar17,uVar10);
      }
LAB_0031ec60:
      lVar17 = FUN_0077c930(0xffffffffffffffff,param_2[5]);
      if (lVar17 == 1) {
        DataMemoryBarrier(2,1);
        FUN_004b7ab4(param_2 + 5);
      }
      goto LAB_0031ec84;
    }
    memcpy(auStack_aa8,auStack_ee0,0x428);
    local_ab8 = (char ****)pppppcVar26;
    local_ab0 = ppppcVar24;
    uVar16 = *PTR_DAT_009faac8;
    iVar9 = FUN_006212cc(8,0x438);
    if (iVar9 == 0) {
      pvVar14 = malloc(0x438);
    }
    else {
      pvVar14 = (void *)FUN_006341e8(0x438,iVar9);
    }
    if (pvVar14 == (void *)0x0) {
                    /* WARNING: Subroutine does not return */
      FUN_0019139c(8,0x438);
    }
    memcpy(pvVar14,&local_ab8,0x438);
    uVar23 = *(undefined8 *)(param_2[2] + 0x2b8);
    lVar17 = FUN_0077c8d0(1,uVar23);
    if (lVar17 < 0) {
LAB_0031e54c:
                    /* WARNING: Does not return */
      pcVar7 = (code *)SoftwareBreakpoint(1,0x31e550);
      (*pcVar7)();
    }
    FUN_0045e848(&local_4a0,pvVar14,&PTR_FUN_009ca318,0,uVar23);
    uStack_618 = uStack_438;
    local_620 = local_440;
    uStack_658 = CONCAT44(uStack_474,uStack_478);
    uStack_608 = uStack_428;
    local_610 = local_430;
    local_660 = local_480;
    local_600 = local_420;
    uStack_648 = uStack_468;
    local_650 = local_470;
    uStack_638 = uStack_458;
    local_640 = local_460;
    uStack_628 = uStack_448;
    local_630 = local_450;
    uStack_668 = uStack_488;
    auStack_678._8_8_ = local_490;
    auStack_678._0_8_ = ppppcStack_498;
    local_680 = (char ****)local_4a0;
    if ((((*(byte *)(param_2 + 0x8d) & 1) == 0) &&
        (lVar17 = param_2[0x8e], lVar17 != -0x8000000000000000)) && (lVar17 != 0)) {
      uVar23 = param_2[0x8f];
      uVar10 = FUN_006212cc(1,lVar17);
      FUN_00637bc0(uVar23,lVar17,uVar10);
    }
    lVar17 = FUN_0077c930(0xffffffffffffffff,param_2[5]);
    if (lVar17 == 1) {
      DataMemoryBarrier(2,1);
      FUN_004b7ab4(param_2 + 5);
    }
    *(undefined1 *)((long)param_2 + 0x21) = 0;
  }
  param_1[0xd] = uStack_618;
  param_1[0xc] = local_620;
  param_1[0xf] = uStack_608;
  param_1[0xe] = local_610;
  param_1[0x10] = local_600;
  uVar16 = 1;
  param_1[5] = uStack_658;
  param_1[4] = local_660;
  param_1[7] = uStack_648;
  param_1[6] = local_650;
  param_1[9] = uStack_638;
  param_1[8] = local_640;
  param_1[0xb] = uStack_628;
  param_1[10] = local_630;
  param_1[1] = auStack_678._0_8_;
  *param_1 = local_680;
  param_1[3] = uStack_668;
  param_1[2] = auStack_678._8_8_;
LAB_0031ee4c:
  *(undefined1 *)((long)param_2 + 0x22) = uVar16;
  return;
}


