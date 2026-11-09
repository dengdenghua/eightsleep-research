/* Ghidra static pseudocode; not original source. */

void FUN_00368f74(undefined8 *param_1,undefined8 *param_2,undefined8 param_3)

{
  byte bVar1;
  undefined8 uVar2;
  undefined8 uVar3;
  undefined *puVar4;
  undefined *puVar5;
  undefined *puVar6;
  long ***ppplVar7;
  ulong uVar8;
  long ****pppplVar9;
  undefined4 uVar10;
  code *pcVar11;
  char cVar12;
  int iVar13;
  long *plVar14;
  long *****ppppplVar15;
  char *pcVar16;
  void *pvVar17;
  long *****ppppplVar18;
  long ****pppplVar19;
  long ****pppplVar20;
  undefined1 uVar21;
  long lVar22;
  long lVar23;
  undefined8 *puVar24;
  undefined8 uVar25;
  long *****ppppplVar26;
  long *****ppppplVar27;
  size_t __n;
  long *****unaff_x24;
  long *****unaff_x25;
  long ****local_1ac0;
  long ****pppplStack_1ab8;
  undefined8 *local_1ab0;
  undefined4 local_1a90;
  undefined3 uStack_1a8c;
  long ****local_1950;
  long ****pppplStack_1948;
  long ****local_1940;
  long ****pppplStack_1938;
  undefined8 local_1930;
  long lStack_1928;
  undefined8 uStack_1920;
  undefined8 uStack_1918;
  undefined4 local_1810;
  undefined3 uStack_180c;
  undefined1 auStack_1809 [313];
  undefined4 local_16d0;
  undefined3 uStack_16cc;
  undefined4 uStack_16c8;
  undefined3 uStack_16c4;
  long ***local_16c0;
  undefined8 *local_16b8;
  undefined *local_16b0;
  long ***local_12c0;
  long local_12b8;
  undefined8 local_12b0;
  undefined8 uStack_12a8;
  undefined8 local_12a0;
  undefined8 local_1060;
  undefined1 auStack_ec0 [1064];
  long ****local_a98;
  long ****local_a90;
  undefined1 auStack_a88 [1064];
  long ****local_660;
  long ****pppplStack_658;
  long ****local_650;
  undefined8 uStack_648;
  long ****local_640;
  undefined8 uStack_638;
  long local_630;
  undefined8 uStack_628;
  undefined8 local_620;
  undefined8 uStack_618;
  undefined8 local_610;
  undefined8 uStack_608;
  undefined8 local_600;
  undefined8 uStack_5f8;
  undefined8 local_5f0;
  undefined8 uStack_5e8;
  undefined8 local_5e0;
  long ****local_5d8;
  long ****local_5d0;
  long ****local_5c8;
  long ****local_5c0;
  long ****pppplStack_5b8;
  long ****local_5a8;
  long ****local_5a0;
  long ****local_598;
  long ****local_590;
  long ****pppplStack_588;
  ulong local_580;
  undefined8 uStack_578;
  long ****local_570;
  long ****pppplStack_568;
  long ****local_560;
  long ****pppplStack_558;
  undefined8 local_550;
  long lStack_548;
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
  undefined8 uStack_4d8;
  undefined8 local_4d0;
  undefined8 uStack_4c8;
  undefined8 local_4c0;
  undefined1 local_4b4 [4];
  long ****local_4b0;
  long ****pppplStack_4a8;
  undefined8 local_4a0;
  long ****pppplStack_498;
  long ****local_490;
  undefined8 uStack_488;
  long ****local_480;
  undefined4 uStack_478;
  undefined4 uStack_474;
  long local_470;
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
  
  puVar6 = PTR_DAT_009fac58;
  puVar5 = PTR_DAT_009faac8;
  local_1060 = 0;
  bVar1 = *(byte *)((long)param_2 + 0x22);
  if (bVar1 < 3) {
    if (bVar1 != 0) {
      if (bVar1 == 1) {
                    /* WARNING: Subroutine does not return */
        FUN_00191a20();
      }
                    /* WARNING: Subroutine does not return */
      FUN_00191a54(&PTR_s__cargo_registry_src_index_crates_009cd060);
    }
    *(undefined2 *)(param_2 + 4) = 1;
    puVar4 = PTR_PTR_009fa450;
    if ((*(ulong *)puVar6 < 2) &&
       ((((byte)PTR_PTR_009fa450[0x10] - 1 < 2 ||
         (((byte)PTR_PTR_009fa450[0x10] != 0 &&
          (cVar12 = FUN_0018fb0c(PTR_PTR_009fa450), cVar12 != '\0')))) &&
        (iVar13 = FUN_007243f8(*(undefined8 *)puVar4), iVar13 != 0)))) {
      lVar22 = *(long *)puVar4;
      local_12b8 = *(long *)(lVar22 + 0x38);
      if (local_12b8 == 0) {
                    /* WARNING: Subroutine does not return */
        FUN_0019151c("FieldSet corrupted (this is a bug)",0x22,
                     &PTR_s__cargo_registry_src_index_crates_009cd038);
      }
      uStack_12a8 = *(undefined8 *)(lVar22 + 0x48);
      local_12b0 = *(undefined8 *)(lVar22 + 0x40);
      local_1940 = (long ****)(lVar22 + 0x30);
      local_12c0 = *local_1940;
      local_16b8 = &local_4a0;
      local_12a0 = 0;
      local_4a0 = &PTR_DAT_009cd050;
      local_490 = (long ****)&DAT_00000008;
      local_16c0 = (long ***)&local_12c0;
      local_16b0 = &DAT_009cc820;
      local_1950 = &local_16c0;
      pppplStack_498 = (long ****)0x1;
      local_480 = (long ****)0x0;
      uStack_488 = (long *****)0x0;
      pppplStack_1948 = (long ****)0x1;
      FUN_00724b8c(lVar22,&local_1950);
    }
    lVar22 = param_2[2];
    *(undefined1 *)((long)param_2 + 0x15e) = 0;
    param_2[0x2a] = lVar22;
LAB_003690f4:
    param_2[10] = 0;
    param_2[0xb] = 8;
    param_2[0xc] = 0;
    *(undefined2 *)((long)param_2 + 0x15c) = 0;
    *(undefined4 *)(param_2 + 0x2b) = 0;
    param_2[9] = lVar22;
    *(undefined1 *)((long)param_2 + 0x15c) = 1;
    if ((*(long *)(lVar22 + 0x10) == 2) && (lVar23 = *(long *)(lVar22 + 0x178), lVar23 != 0)) {
LAB_00369268:
      lVar22 = *(long *)(lVar22 + 0x170);
      lVar23 = lVar22 + lVar23 * 0x18;
      param_2[0x31] = lVar22;
      param_2[0x32] = lVar23;
      if (lVar22 != lVar23) goto LAB_0036a500;
LAB_00369280:
      FUN_004bb998(&local_4a0);
      pppplStack_568 = (long ****)param_2[0xb];
      local_570 = (long ****)param_2[10];
      local_560 = (long ****)param_2[0xc];
      *(undefined1 *)((long)param_2 + 0x15c) = 0;
      FUN_003cbb2c(param_2 + 0xd,&local_4a0,&local_570);
      lVar22 = param_2[9];
      *(undefined1 *)((long)param_2 + 0x15a) = 1;
      if (*(long *)(lVar22 + 0x180) == -0x8000000000000000) {
        uStack_4e8 = param_2[0x1e];
        local_4f0 = param_2[0x1d];
        uStack_4d8 = param_2[0x20];
        local_4e0 = param_2[0x1f];
        uStack_4c8 = param_2[0x22];
        local_4d0 = param_2[0x21];
        local_4c0 = param_2[0x23];
        param_2[0x24] = 0x8000000000000000;
        uStack_528 = param_2[0x16];
        local_530 = param_2[0x15];
        uStack_518 = param_2[0x18];
        local_520 = param_2[0x17];
        *(undefined1 *)((long)param_2 + 0x15b) = 1;
        *(undefined1 *)((long)param_2 + 0x15a) = 0;
        uStack_508 = param_2[0x1a];
        local_510 = param_2[0x19];
        uStack_4f8 = param_2[0x1c];
        local_500 = param_2[0x1b];
        pppplStack_568 = (long ****)param_2[0xe];
        local_570 = (long ****)param_2[0xd];
        pppplStack_558 = (long ****)param_2[0x10];
        local_560 = (long ****)param_2[0xf];
        lStack_548 = param_2[0x12];
        local_550 = param_2[0x11];
        uStack_538 = param_2[0x14];
        local_540 = param_2[0x13];
        FUN_004bb3f4(&local_4a0,&local_570);
        unaff_x24 = (long *****)local_490;
        ppppplVar15 = (long *****)pppplStack_498;
        ppppplVar26 = (long *****)local_4a0;
        unaff_x25 = (long *****)((ulong)uStack_488 & 0xff);
        memcpy(&local_16c0,(void *)((long)&uStack_488 + 1),0x13f);
        bVar1 = *(byte *)((long)param_2 + 0x15a);
      }
      else {
        ppppplVar27 = *(long ******)(lVar22 + 400);
        if ((long)ppppplVar27 < 0) {
          uVar25 = 0;
LAB_00369a6c:
                    /* WARNING: Subroutine does not return */
          FUN_00191384(uVar25,ppppplVar27,&PTR_BYTE_009cdf58);
        }
        unaff_x25 = *(long ******)(lVar22 + 0x188);
        if (ppppplVar27 == (long *****)0x0) {
          pvVar17 = (void *)0x1;
        }
        else {
          uVar25 = 1;
          uVar21 = *PTR_DAT_009faac8;
          pvVar17 = (void *)FUN_00318628(ppppplVar27,1);
          if (pvVar17 == (void *)0x0) goto LAB_00369a6c;
        }
        memcpy(pvVar17,unaff_x25,(size_t)ppppplVar27);
        param_2[0x24] = ppppplVar27;
        param_2[0x25] = pvVar17;
        param_2[0x26] = ppppplVar27;
        *(undefined1 *)((long)param_2 + 0x15b) = 0;
        *(undefined1 *)((long)param_2 + 0x159) = 1;
        param_2[0x2d] = param_2[0x25];
        param_2[0x2c] = param_2[0x24];
        param_2[0x2e] = ppppplVar27;
        if (*(long *)(param_2[9] + 0x198) == -0x8000000000000000) {
          param_2[0x27] = 0x8000000000000000;
          *(undefined1 *)(param_2 + 0x2b) = 1;
        }
        else {
          FUN_0037fb24(param_2 + 0x27,param_2[9] + 0x198,&PTR_DAT_009cd460);
          *(undefined1 *)(param_2 + 0x2b) = 1;
          if (param_2[0x27] != -0x8000000000000000) {
            local_560 = (long ****)param_2[0x29];
            pppplStack_568 = (long ****)param_2[0x28];
            local_570 = (long ****)param_2[0x27];
            *(undefined1 *)(param_2 + 0x2b) = 0;
            *(undefined1 *)(param_2 + 0x33) = 0;
            param_2[0x30] = pppplStack_568;
            param_2[0x2f] = local_570;
            param_2[0x32] = pppplStack_558;
            param_2[0x31] = local_560;
LAB_00369534:
            pppplStack_498 = (long ****)param_2[0x30];
            local_4a0 = (undefined **)param_2[0x2f];
            local_490 = (long ****)param_2[0x31];
            uVar25 = FUN_003ad018(&local_4a0,&PTR_s__cargo_registry_src_index_crates_009cc980);
            param_2[0x32] = uVar25;
            goto LAB_0036955c;
          }
        }
        ppppplVar15 = (long *****)FUN_003c7128("found certificate, but no key",0x1d);
        ppppplVar26 = (long *****)0x2;
        lVar22 = param_2[0x27];
joined_r0x00369884:
        if (((lVar22 != -0x8000000000000000) && ((*(byte *)(param_2 + 0x2b) & 1) != 0)) &&
           (lVar22 != 0)) {
          FUN_0031865c(param_2[0x28],lVar22,1);
        }
        *(undefined1 *)(param_2 + 0x2b) = 0;
        if (((*(byte *)((long)param_2 + 0x159) & 1) != 0) && (param_2[0x2c] != 0)) {
          FUN_0031865c(param_2[0x2d],param_2[0x2c],1);
        }
        *(undefined1 *)((long)param_2 + 0x159) = 0;
        bVar1 = *(byte *)((long)param_2 + 0x15a);
        unaff_x24 = ppppplVar27;
      }
      if ((bVar1 & 1) != 0) {
        FUN_0036c8f8(param_2 + 0xd);
      }
      uVar21 = SUB81(unaff_x25,0);
      lVar22 = param_2[0x24];
      *(undefined1 *)((long)param_2 + 0x15a) = 0;
      if (((lVar22 != -0x8000000000000000) && ((*(byte *)((long)param_2 + 0x15b) & 1) != 0)) &&
         (lVar22 != 0)) {
        FUN_0031865c(param_2[0x25],lVar22,1);
      }
      *(undefined1 *)((long)param_2 + 0x15b) = 0;
joined_r0x003693ec:
      if (ppppplVar26 == (long *****)0x2) goto LAB_0036a65c;
      memcpy(&local_12c0,&local_16c0,0x13f);
      if ((*(byte *)((long)param_2 + 0x15c) & 1) != 0) {
        lVar22 = param_2[0xc];
        if (lVar22 != 0) {
          puVar24 = (undefined8 *)(param_2[0xb] + 0x20);
          do {
            lVar23 = puVar24[-4];
            if ((lVar23 != -0x8000000000000000) && (lVar23 != 0)) {
              FUN_0031865c(puVar24[-3],lVar23,1);
            }
            lVar23 = puVar24[-1];
            if ((lVar23 != -0x8000000000000000) && (lVar23 != 0)) {
              FUN_0031865c(*puVar24,lVar23,1);
            }
            lVar23 = puVar24[2];
            if ((-0x7fffffffffffffff < lVar23) && (lVar23 != 0)) {
              FUN_0031865c(puVar24[3],lVar23,1);
            }
            lVar22 = lVar22 + -1;
            puVar24 = puVar24 + 9;
          } while (lVar22 != 0);
        }
        if (param_2[10] != 0) {
          FUN_0031865c(param_2[0xb],param_2[10] * 0x48,8);
        }
      }
      *(undefined1 *)((long)param_2 + 0x15c) = 0;
      memcpy(&local_1950,&local_12c0,0x13f);
      *(undefined1 *)((long)param_2 + 0x15e) = 1;
      if (ppppplVar26 == (long *****)0x3) goto LAB_0036a5b0;
    }
    else {
      FUN_0046ba94(&local_570);
      if (local_570 != (long ****)&DAT_8000000000000000) {
        local_5d8 = local_570;
        local_5d0 = pppplStack_568;
        local_5c8 = local_560;
        FUN_003ef3b8(param_2 + 10,&local_5d8);
        lVar22 = param_2[9];
        if (*(long *)(lVar22 + 0x10) == 2) {
          lVar23 = *(long *)(lVar22 + 0x178);
          goto LAB_00369268;
        }
        FUN_003c7628(&local_4a0);
        unaff_x24 = (long *****)local_490;
        ppppplVar15 = (long *****)pppplStack_498;
        ppppplVar26 = (long *****)local_4a0;
        uVar21 = (undefined1)uStack_488;
        unaff_x25 = (long *****)((ulong)uStack_488 & 0xff);
        memcpy(&local_16c0,(void *)((long)&uStack_488 + 1),0x13f);
        goto joined_r0x003693ec;
      }
      local_4b0 = pppplStack_568;
      local_590 = (long ****)&local_4b0;
      local_480 = (long ****)0x0;
      local_4a0 = &PTR_s_could_not_load_platform_certs__009cc8b8;
      pppplStack_588 = (long ****)PTR_FUN_009faca0;
      local_490 = (long ****)&local_590;
      pppplStack_498 = (long ****)0x1;
      uStack_488 = (long *****)0x1;
      FUN_0076b8c0(&local_16c0,&local_4a0);
      puVar6 = local_16b0;
      puVar24 = local_16b8;
      ppplVar7 = local_16c0;
      uVar21 = *puVar5;
      plVar14 = (long *)FUN_00318628(0x18,8);
      if (plVar14 == (long *)0x0) {
                    /* WARNING: Subroutine does not return */
        FUN_0019139c(8,0x18);
      }
      *plVar14 = (long)ppplVar7;
      plVar14[1] = (long)puVar24;
      plVar14[2] = (long)puVar6;
      ppppplVar15 = (long *****)FUN_00746ab0(0x28,plVar14,&PTR_LAB_009cc8e8);
      unaff_x24 = (long *****)local_4b0;
      if (((ulong)local_4b0 & 3) == 1) {
        unaff_x24 = (long *****)((long)local_4b0 + -1);
        unaff_x25 = (long *****)*unaff_x24;
        puVar24 = *(undefined8 **)((long)local_4b0 + 7);
        if ((code *)*puVar24 != (code *)0x0) {
          (*(code *)*puVar24)(unaff_x25);
        }
        if (puVar24[1] != 0) {
          FUN_0031865c(unaff_x25,puVar24[1],puVar24[2]);
        }
        FUN_0031865c(unaff_x24,0x18,8);
      }
LAB_0036a65c:
      uVar21 = SUB81(unaff_x25,0);
      if ((*(byte *)((long)param_2 + 0x15c) & 1) != 0) {
        lVar22 = param_2[0xc];
        if (lVar22 != 0) {
          unaff_x24 = (long *****)0x8000000000000002;
          unaff_x25 = (long *****)(param_2[0xb] + 0x20);
          do {
            pppplVar20 = unaff_x25[-4];
            if ((pppplVar20 != (long ****)0x8000000000000000) && (pppplVar20 != (long ****)0x0)) {
              FUN_0031865c(unaff_x25[-3],pppplVar20,1);
            }
            pppplVar20 = unaff_x25[-1];
            if ((pppplVar20 != (long ****)0x8000000000000000) && (pppplVar20 != (long ****)0x0)) {
              FUN_0031865c(*unaff_x25,pppplVar20,1);
            }
            pppplVar20 = unaff_x25[2];
            if ((-0x7fffffffffffffff < (long)pppplVar20) && (pppplVar20 != (long ****)0x0)) {
              FUN_0031865c(unaff_x25[3],pppplVar20,1);
            }
            lVar22 = lVar22 + -1;
            unaff_x25 = unaff_x25 + 9;
          } while (lVar22 != 0);
        }
        uVar21 = SUB81(unaff_x25,0);
        if (param_2[10] != 0) {
          FUN_0031865c(param_2[0xb],param_2[10] * 0x48,8);
        }
      }
      *(undefined1 *)((long)param_2 + 0x15c) = 0;
      memcpy(&local_1950,&local_12c0,0x13f);
      ppppplVar26 = (long *****)0x2;
      *(undefined1 *)((long)param_2 + 0x15e) = 1;
    }
    local_1ab0 = param_2 + 5;
    memcpy(&local_1810,&local_1950,0x13f);
    FUN_00371150(local_1ab0);
    if (ppppplVar26 != (long *****)0x2) {
      memcpy(&local_470,auStack_1809,0x138);
      uStack_474 = CONCAT31(uStack_180c,local_1810._3_1_);
      uStack_478 = CONCAT31((int3)local_1810,uVar21);
      pppplStack_498 = (long ****)0x1;
      local_4a0 = (undefined **)0x1;
      local_490 = (long ****)ppppplVar26;
      uStack_488 = ppppplVar15;
      local_480 = (long ****)unaff_x24;
      pvVar17 = (void *)FUN_00318628(0x168,8);
      if (pvVar17 == (void *)0x0) {
                    /* WARNING: Subroutine does not return */
        FUN_0019139c(8,0x168);
      }
      memcpy(pvVar17,&local_4a0,0x168);
      *(undefined1 *)((long)param_2 + 0x21) = 0;
      param_2[5] = pvVar17;
      FUN_0045bd3c(param_2[3]);
      FUN_00604db8(&local_4a0);
      if ((char)local_4a0 != '\x02') {
        uVar10 = uStack_488._4_4_;
        *(char *)(param_2 + 0x8d) = (char)local_4a0;
        uStack_16c4 = (undefined3)((ulong)local_4a0 >> 0x28);
        uStack_16c8 = local_4a0._1_4_;
        uStack_16cc = (undefined3)((ulong)uStack_488 >> 0x28);
        *(undefined4 *)((long)param_2 + 0x469) = local_4a0._1_4_;
        *(int *)((long)param_2 + 0x46c) = (int)((ulong)local_4a0 >> 0x20);
        param_2[0x8f] = local_490;
        param_2[0x8e] = pppplStack_498;
        *(undefined1 *)(param_2 + 0x90) = (undefined1)uStack_488;
        *(undefined4 *)((long)param_2 + 0x481) = uStack_488._1_4_;
        *(undefined4 *)((long)param_2 + 0x484) = uVar10;
        local_16d0 = uStack_488._1_4_;
        FUN_006048ac(&local_1a90,param_2 + 0x8d);
        uVar25 = param_2[5];
        ppppplVar15 = (long *****)param_2[1];
        ppppplVar26 = (long *****)*param_2;
        *(undefined1 *)(param_2 + 4) = 0;
        lVar22 = FUN_0077c8d0(1,uVar25);
        if (lVar22 < 0) goto LAB_0036a3cc;
        FUN_004c9040(&local_4a0,uVar25,&local_1a90);
        ppppplVar18 = uStack_488;
        ppppplVar27 = (long *****)local_4a0;
        if ((long *****)local_4a0 == (long *****)0x2) {
          local_1930 = CONCAT44(uStack_474,uStack_478);
          pppplStack_1948 = local_490;
          local_1950 = pppplStack_498;
          pppplStack_1938 = local_480;
          local_1940 = (long ****)uStack_488;
          lStack_1928 = local_470;
          uStack_1918 = local_460;
          uStack_1920 = uStack_468;
          ppppplVar18 = (long *****)FUN_003c70a4(0x28,&local_1950);
          ppppplVar27 = (long *****)&DAT_00000004;
          local_1ac0 = (long ****)ppppplVar26;
          pppplStack_1ab8 = (long ****)ppppplVar15;
        }
        else {
          pppplStack_1ab8 = local_490;
          local_1ac0 = pppplStack_498;
          memcpy(&local_12c0,&local_480,0x400);
        }
        memcpy(&local_16c0,&local_12c0,0x400);
        param_2[6] = ppppplVar27;
        param_2[8] = pppplStack_1ab8;
        param_2[7] = local_1ac0;
        param_2[9] = ppppplVar18;
        memcpy(param_2 + 10,&local_16c0,0x400);
        *(undefined1 *)(param_2 + 0x8c) = 0;
        param_2[0x8b] = ppppplVar15;
        param_2[0x8a] = ppppplVar26;
        goto LAB_00369fac;
      }
      local_650 = (long ****)&DAT_009cf480;
      uStack_648._0_5_ = CONCAT41(local_16d0,5);
      uStack_648 = (long *****)
                   CONCAT44(CONCAT31(uStack_16cc,local_16d0._3_1_),(undefined4)uStack_648);
      pppplStack_658 = (long ****)0x1;
      local_660 = (long ****)&DAT_8000000000000000;
      goto LAB_0036a084;
    }
    local_4a0 = (undefined **)ppppplVar15;
    pppplStack_658 = (long ****)FUN_00318628(8,8);
    if ((long *****)pppplStack_658 == (long *****)0x0) {
                    /* WARNING: Subroutine does not return */
      FUN_0019139c(8,8);
    }
    *pppplStack_658 = (long ***)ppppplVar15;
    uStack_648._0_5_ = CONCAT41(local_1a90,5);
    uStack_648 = (long *****)CONCAT44(CONCAT31(uStack_1a8c,local_1a90._3_1_),(undefined4)uStack_648)
    ;
    local_650 = (long ****)&PTR_FUN_009cf2a0;
    local_660 = (long ****)&DAT_8000000000000000;
LAB_0036a0a8:
    *(undefined1 *)((long)param_2 + 0x21) = 0;
    if ((*(byte *)(param_2 + 4) & 1) != 0) {
      uVar25 = *param_2;
      puVar24 = (undefined8 *)param_2[1];
      if ((code *)*puVar24 != (code *)0x0) {
        (*(code *)*puVar24)(uVar25);
      }
      if (puVar24[1] != 0) {
        FUN_0031865c(uVar25,puVar24[1],puVar24[2]);
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
            FUN_00191a20(&PTR_s__cargo_registry_src_index_crates_009cc8a0);
          }
                    /* WARNING: Subroutine does not return */
          FUN_00191a54(&PTR_s__cargo_registry_src_index_crates_009cc8a0);
        }
        lVar22 = param_2[0x2a];
        goto LAB_003690f4;
      }
      if (bVar1 == 3) {
        while (FUN_00361d84(&local_4a0,param_2 + 0x2c,param_3), pppplVar20 = local_490,
              ppppplVar15 = (long *****)pppplStack_498, unaff_x25 = (long *****)local_4a0,
              local_4a0 != (undefined **)&DAT_8000000000000001) {
          if (*(char *)(param_2 + 0x30) == '\x03') {
            unaff_x24 = (long *****)param_2[0x2f];
            iVar13 = FUN_006fecdc(unaff_x24);
            if (iVar13 != 0) {
              FUN_00719400(unaff_x24);
            }
          }
          else if ((*(char *)(param_2 + 0x30) == '\0') && (param_2[0x2c] != 0)) {
            FUN_0031865c(param_2[0x2d],param_2[0x2c],1);
          }
          if (unaff_x25 == (long *****)&DAT_8000000000000000) goto LAB_0036a65c;
          local_4a0 = (undefined **)ppppplVar15;
          uStack_488 = ppppplVar15 + (long)pppplVar20 * 3;
          local_490 = (long ****)unaff_x25;
          pppplStack_498 = (long ****)ppppplVar15;
          FUN_00395840(&local_590,&local_4a0);
          uVar8 = local_580;
          pppplVar20 = pppplStack_588;
          if (local_590 == (long ****)&DAT_8000000000000000) {
            local_4b0 = (long ****)local_4b4;
            local_480 = (long ****)0x0;
            local_4b4[0] = pppplStack_588._0_1_;
            local_4a0 = &PTR_s_could_not_load_certs__009cc940;
            local_490 = (long ****)&local_4b0;
            pppplStack_4a8 = (long ****)PTR_LAB_009fab48;
            pppplStack_498 = (long ****)0x1;
            uStack_488 = (long *****)0x1;
            FUN_0076b8c0(&local_570,&local_4a0);
            ppppplVar15 = (long *****)FUN_004c2fb0(0x14,&local_570);
            goto LAB_0036a65c;
          }
          local_490 = local_590;
          uStack_488 = (long *****)(pppplStack_588 + local_580 * 9);
          lVar22 = param_2[0xc];
          local_4a0 = (undefined **)pppplStack_588;
          pppplStack_498 = pppplStack_588;
          if ((ulong)(param_2[10] - lVar22) < local_580) {
            FUN_00174798(param_2 + 10,lVar22,local_580,8,0x48);
            lVar22 = param_2[0xc];
          }
          memcpy((void *)(param_2[0xb] + lVar22 * 0x48),pppplVar20,uVar8 * 0x48);
          uStack_488 = (long *****)pppplVar20;
          param_2[0xc] = lVar22 + uVar8;
          FUN_0037e064(&local_4a0);
          lVar22 = param_2[0x31];
          if (lVar22 == param_2[0x32]) goto LAB_00369280;
LAB_0036a500:
          param_2[0x31] = lVar22 + 0x18;
          __n = *(size_t *)(lVar22 + 0x10);
          if ((long)__n < 0) {
            uVar25 = 0;
LAB_0036a748:
                    /* WARNING: Subroutine does not return */
            FUN_00191384(uVar25,__n,&PTR_BYTE_009cdf58);
          }
          unaff_x24 = *(long ******)(lVar22 + 8);
          pvVar17 = (void *)0x1;
          if (__n != 0) {
            uVar21 = *puVar5;
            uVar25 = 1;
            pvVar17 = (void *)FUN_00318628(__n,1);
            if (pvVar17 == (void *)0x0) goto LAB_0036a748;
          }
          memcpy(pvVar17,unaff_x24,__n);
          param_2[0x2c] = __n;
          param_2[0x2d] = pvVar17;
          param_2[0x2e] = __n;
          *(undefined1 *)(param_2 + 0x30) = 0;
        }
        uVar21 = 3;
LAB_0036a5ac:
        *(undefined1 *)((long)param_2 + 0x15e) = uVar21;
      }
      else {
        if (bVar1 != 4) {
LAB_00369634:
          local_1ab0 = param_2 + 5;
          FUN_00361d84(&local_570,param_2 + 0x2c,param_3);
          pppplVar20 = local_560;
          ppppplVar15 = (long *****)pppplStack_568;
          unaff_x24 = (long *****)local_570;
          if (local_570 != (long ****)&DAT_8000000000000001) {
            if (*(char *)(param_2 + 0x30) == '\x03') {
              FUN_00396dac(param_2 + 0x2f);
            }
            else if ((*(char *)(param_2 + 0x30) == '\0') && (param_2[0x2c] != 0)) {
              FUN_0031865c(param_2[0x2d],param_2[0x2c],1);
            }
            if (unaff_x24 != (long *****)&DAT_8000000000000000) {
              uStack_4e8 = param_2[0x1e];
              local_4f0 = param_2[0x1d];
              uStack_4d8 = param_2[0x20];
              local_4e0 = param_2[0x1f];
              uStack_4c8 = param_2[0x22];
              local_4d0 = param_2[0x21];
              local_4c0 = param_2[0x23];
              local_5a8 = (long ****)unaff_x24;
              uStack_528 = param_2[0x16];
              local_530 = param_2[0x15];
              uStack_518 = param_2[0x18];
              local_520 = param_2[0x17];
              uStack_4f8 = param_2[0x1c];
              local_500 = param_2[0x1b];
              uStack_508 = param_2[0x1a];
              local_510 = param_2[0x19];
              pppplStack_558 = (long ****)param_2[0x10];
              local_560 = (long ****)param_2[0xf];
              pppplStack_568 = (long ****)param_2[0xe];
              local_570 = (long ****)param_2[0xd];
              lStack_548 = param_2[0x12];
              local_550 = param_2[0x11];
              uStack_538 = param_2[0x14];
              local_540 = param_2[0x13];
              local_5a0 = (long ****)ppppplVar15;
              *(undefined1 *)((long)param_2 + 0x15a) = 0;
              *(undefined1 *)((long)param_2 + 0x15d) = 0;
              local_598 = pppplVar20;
              pppplStack_588 = (long ****)param_2[6];
              local_590 = (long ****)*local_1ab0;
              uStack_578 = param_2[8];
              local_580 = param_2[7];
              FUN_004bb1f4(&local_4a0,&local_570,&local_5a8,&local_590);
              ppppplVar27 = (long *****)local_490;
              ppppplVar15 = (long *****)pppplStack_498;
              ppppplVar26 = (long *****)local_4a0;
              if ((long *****)local_4a0 == (long *****)0x2) {
                local_550 = CONCAT44(uStack_474,uStack_478);
                pppplStack_568 = local_490;
                local_570 = pppplStack_498;
                pppplStack_558 = local_480;
                local_560 = (long ****)uStack_488;
                lStack_548 = local_470;
                uStack_538 = local_460;
                local_540 = uStack_468;
                pcVar16 = (char *)FUN_00318628(0x20,1);
                uVar3 = s_rtificate_or_key_00787c22._8_8_;
                uVar2 = s_rtificate_or_key_00787c22._0_8_;
                uVar25 = s_could_not_add_ce_00787c12._0_8_;
                if (pcVar16 == (char *)0x0) {
                    /* WARNING: Subroutine does not return */
                  FUN_00191384(1,0x20,&PTR_DAT_009cd288);
                }
                *(undefined8 *)(pcVar16 + 8) = s_could_not_add_ce_00787c12._8_8_;
                *(undefined8 *)pcVar16 = uVar25;
                *(undefined8 *)(pcVar16 + 0x18) = uVar3;
                *(undefined8 *)(pcVar16 + 0x10) = uVar2;
                puVar24 = (undefined8 *)FUN_00318628(0x18,8);
                if (puVar24 == (undefined8 *)0x0) {
                    /* WARNING: Subroutine does not return */
                  FUN_0019139c(8,0x18);
                }
                *puVar24 = 0x20;
                puVar24[1] = pcVar16;
                puVar24[2] = 0x20;
                ppppplVar15 = (long *****)FUN_00746ab0(0x28,puVar24,&PTR_LAB_009cc8e8);
                FUN_0036df28(&local_570);
                ppppplVar27 = unaff_x24;
              }
              else {
                unaff_x25 = (long *****)((ulong)uStack_488 & 0xff);
                memcpy(&local_16c0,(void *)((long)&uStack_488 + 1),0x13f);
              }
              *(undefined1 *)((long)param_2 + 0x15d) = 0;
              lVar22 = param_2[0x27];
              goto joined_r0x00369884;
            }
            if ((param_2[6] | 0x8000000000000000) != 0x8000000000000000) {
              FUN_0031865c(param_2[7],param_2[6],1);
            }
LAB_003696c8:
            *(undefined1 *)((long)param_2 + 0x15d) = 0;
            *(undefined1 *)(param_2 + 0x2b) = 0;
            if (((*(byte *)((long)param_2 + 0x159) & 1) != 0) && (param_2[0x2c] != 0)) {
              FUN_0031865c(param_2[0x2d],param_2[0x2c],1);
            }
            *(undefined1 *)((long)param_2 + 0x159) = 0;
            FUN_0036c8f8(param_2 + 0xd);
            *(undefined2 *)((long)param_2 + 0x15a) = 0;
            goto LAB_0036a65c;
          }
          uVar21 = 5;
          goto LAB_0036a5ac;
        }
        bVar1 = *(byte *)(param_2 + 0x33);
        if (bVar1 < 2) {
          if (bVar1 != 0) {
                    /* WARNING: Subroutine does not return */
            FUN_00191a20(&PTR_s__cargo_registry_src_index_crates_009cc998);
          }
          goto LAB_00369534;
        }
        if (bVar1 != 3) {
                    /* WARNING: Subroutine does not return */
          FUN_00191a54(&PTR_s__cargo_registry_src_index_crates_009cc998);
        }
LAB_0036955c:
        puVar24 = param_2 + 0x33;
        unaff_x24 = (long *****)(param_2 + 0x2f);
        FUN_00397478(&local_4a0,param_2 + 0x32,param_3);
        ppppplVar15 = (long *****)pppplStack_498;
        ppppplVar26 = (long *****)local_4a0;
        if (local_4a0 != (undefined **)&DAT_00000005) {
          unaff_x25 = (long *****)param_2[0x32];
          pppplStack_588 = (long ****)uStack_488;
          local_590 = local_490;
          iVar13 = FUN_006fecdc(unaff_x25);
          if (iVar13 != 0) {
            FUN_00719400(unaff_x25);
          }
          if (ppppplVar26 == (long *****)&DAT_00000004) {
            local_4a0 = (undefined **)ppppplVar15;
            local_490 = pppplStack_588;
            pppplStack_498 = local_590;
            ppppplVar15 = (long *****)FUN_0071d7cc(&local_4a0);
            *(undefined1 *)puVar24 = 1;
          }
          else {
            pppplStack_4a8 = pppplStack_588;
            local_4b0 = local_590;
            *(undefined1 *)puVar24 = 1;
            pppplStack_5b8 = pppplStack_588;
            local_5c0 = local_590;
            if (ppppplVar26 != (long *****)0x3) {
              *(undefined1 *)((long)param_2 + 0x15d) = 1;
              local_490 = (long ****)param_2[0x2e];
              param_2[5] = ppppplVar26;
              param_2[6] = ppppplVar15;
              param_2[8] = pppplStack_588;
              param_2[7] = local_590;
              pppplStack_498 = (long ****)param_2[0x2d];
              local_4a0 = (undefined **)param_2[0x2c];
              *(undefined1 *)((long)param_2 + 0x159) = 0;
              param_2[0x2f] = uStack_488;
              param_2[0x2e] = local_490;
              *(undefined1 *)(param_2 + 0x30) = 0;
              goto LAB_00369634;
            }
          }
          goto LAB_003696c8;
        }
        *(undefined1 *)puVar24 = 3;
        *(undefined1 *)((long)param_2 + 0x15e) = 4;
      }
LAB_0036a5b0:
      *param_1 = 0x8000000000000001;
      uVar21 = 3;
      goto LAB_0036a5bc;
    }
LAB_00369fac:
    FUN_003cd044(&local_4a0,param_2 + 6,param_3);
    ppppplVar15 = uStack_488;
    pppplVar9 = local_490;
    pppplVar20 = pppplStack_498;
    ppppplVar26 = (long *****)local_4a0;
    if ((long *****)local_4a0 == (long *****)0x2) {
      if (*uStack_488 != (long ****)0x0) {
        (*(code *)*uStack_488)(local_490);
      }
      pppplVar19 = ppppplVar15[1];
      if (pppplVar19 != (long ****)0x0) {
        FUN_0031865c(pppplVar9,pppplVar19,ppppplVar15[2]);
      }
    }
    else {
      if ((long *****)local_4a0 == (long *****)0x3) {
        *param_1 = 0x8000000000000001;
        uVar21 = 4;
        goto LAB_0036a5bc;
      }
      memcpy(auStack_ec0,&local_490,0x428);
    }
    FUN_0036b8d4(param_2 + 6);
    if (ppppplVar26 == (long *****)0x2) {
      FUN_0044f90c((ulong)&local_660 | 8,pppplVar20);
      local_660 = (long ****)&DAT_8000000000000000;
      if ((((*(byte *)(param_2 + 0x8d) & 1) == 0) &&
          (lVar22 = param_2[0x8e], lVar22 != -0x8000000000000000)) && (lVar22 != 0)) {
        FUN_0031865c(param_2[0x8f],lVar22,1);
      }
LAB_0036a084:
      lVar22 = FUN_0077c930(0xffffffffffffffff,param_2[5]);
      if (lVar22 == 1) {
        DataMemoryBarrier(2,1);
        FUN_004b7ab4(param_2 + 5);
      }
      goto LAB_0036a0a8;
    }
    memcpy(auStack_a88,auStack_ec0,0x428);
    local_a98 = (long ****)ppppplVar26;
    local_a90 = pppplVar20;
    pvVar17 = (void *)FUN_00318628(0x438,8);
    if (pvVar17 == (void *)0x0) {
                    /* WARNING: Subroutine does not return */
      FUN_0019139c(8,0x438);
    }
    memcpy(pvVar17,&local_a98,0x438);
    uVar25 = *(undefined8 *)(param_2[2] + 0x2b8);
    lVar22 = FUN_0077c8d0(1,uVar25);
    if (lVar22 < 0) {
LAB_0036a3cc:
                    /* WARNING: Does not return */
      pcVar11 = (code *)SoftwareBreakpoint(1,0x36a3d0);
      (*pcVar11)();
    }
    FUN_0045e848(&local_4a0,pvVar17,&PTR_FUN_009cd098,0,uVar25);
    uStack_5f8 = uStack_438;
    local_600 = local_440;
    uStack_638 = CONCAT44(uStack_474,uStack_478);
    uStack_5e8 = uStack_428;
    local_5f0 = local_430;
    local_640 = local_480;
    local_5e0 = local_420;
    uStack_628 = uStack_468;
    local_630 = local_470;
    uStack_618 = uStack_458;
    local_620 = local_460;
    uStack_608 = uStack_448;
    local_610 = local_450;
    uStack_648 = uStack_488;
    local_650 = local_490;
    pppplStack_658 = pppplStack_498;
    local_660 = (long ****)local_4a0;
    if ((((*(byte *)(param_2 + 0x8d) & 1) == 0) &&
        (lVar22 = param_2[0x8e], lVar22 != -0x8000000000000000)) && (lVar22 != 0)) {
      FUN_0031865c(param_2[0x8f],lVar22,1);
    }
    lVar22 = FUN_0077c930(0xffffffffffffffff,param_2[5]);
    if (lVar22 == 1) {
      DataMemoryBarrier(2,1);
      FUN_004b7ab4(param_2 + 5);
    }
    *(undefined1 *)((long)param_2 + 0x21) = 0;
  }
  param_1[0xd] = uStack_5f8;
  param_1[0xc] = local_600;
  param_1[0xf] = uStack_5e8;
  param_1[0xe] = local_5f0;
  param_1[0x10] = local_5e0;
  uVar21 = 1;
  param_1[5] = uStack_638;
  param_1[4] = local_640;
  param_1[7] = uStack_628;
  param_1[6] = local_630;
  param_1[9] = uStack_618;
  param_1[8] = local_620;
  param_1[0xb] = uStack_608;
  param_1[10] = local_610;
  param_1[1] = pppplStack_658;
  *param_1 = local_660;
  param_1[3] = uStack_648;
  param_1[2] = local_650;
LAB_0036a5bc:
  *(undefined1 *)((long)param_2 + 0x22) = uVar21;
  return;
}


