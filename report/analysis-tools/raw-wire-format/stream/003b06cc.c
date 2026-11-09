/* Reconstructed Ghidra pseudocode, not vendor source. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_003b06cc(long param_1,long *param_2,undefined8 *param_3)

{
  bool bVar1;
  int *piVar2;
  byte bVar3;
  undefined1 uVar4;
  int iVar5;
  bool bVar6;
  undefined ******__n;
  undefined *puVar7;
  long *plVar8;
  undefined *****pppppuVar9;
  code *pcVar10;
  char cVar11;
  int iVar12;
  int *piVar13;
  undefined ******ppppppuVar14;
  undefined **ppuVar15;
  undefined *****pppppuVar16;
  long lVar17;
  undefined8 *puVar18;
  long lVar19;
  ulong uVar20;
  ulong uVar21;
  ulong uVar22;
  undefined *****pppppuVar23;
  ulong uVar24;
  long lVar25;
  undefined8 uVar26;
  long *plVar27;
  void *__src;
  long *plVar28;
  undefined ******ppppppuVar29;
  undefined ******ppppppuVar30;
  undefined ******ppppppuVar31;
  undefined ****local_168;
  undefined *****local_160;
  int *piStack_158;
  undefined *****local_150;
  undefined ****local_148;
  undefined8 *puStack_140;
  undefined *****local_138;
  undefined *****pppppuStack_130;
  undefined *local_128;
  undefined *****local_120;
  int *piStack_118;
  undefined *****local_110;
  undefined *puStack_108;
  undefined8 local_100;
  undefined8 local_f8;
  undefined8 uStack_f0;
  undefined *****local_e8;
  undefined1 *puStack_e0;
  undefined8 local_d8;
  undefined *****local_c8;
  undefined1 *puStack_c0;
  undefined8 *local_b8;
  undefined *****local_b0;
  long *plStack_a8;
  undefined *****local_a0;
  long *plStack_98;
  undefined *****local_90;
  undefined *****pppppuStack_88;
  undefined *****local_80;
  undefined *****pppppuStack_78;
  undefined8 local_70;
  undefined8 uStack_68;
  
  puVar7 = PTR_DAT_009fac58;
  pppppuVar16 = *(undefined ******)(param_1 + 0x8a0);
  ppppppuVar29 = (undefined ******)(param_3 + 0x10);
  pppppuVar23 = *ppppppuVar29;
  if (pppppuVar16 < pppppuVar23) {
    local_148 = (undefined ****)((long)pppppuVar23 + -1);
    pppppuVar23 = (undefined *****)((long)local_148 + (1 - (long)pppppuVar16));
    *(long *)(param_1 + 0x8c8) = *(long *)(param_1 + 0x8c8) + (long)pppppuVar23;
    local_168 = (undefined ****)pppppuVar16;
    if (((*(ulong *)puVar7 < 4) &&
        ((DAT_009fb518 - 1 < 2 ||
         ((DAT_009fb518 != 0 && (cVar11 = FUN_0018fb0c(&PTR_DAT_009fb508), cVar11 != '\0')))))) &&
       (iVar12 = FUN_007243f8(PTR_DAT_009fb508), iVar12 != 0)) {
      piStack_118 = *(int **)(PTR_DAT_009fb508 + 0x38);
      if (piStack_118 == (int *)0x0) {
                    /* WARNING: Subroutine does not return */
        FUN_0019151c("FieldSet corrupted (this is a bug)",0x22,
                     &PTR_s_rawrs_src_raw_chunker_rs_009d0850);
      }
      puStack_108 = *(undefined **)(PTR_DAT_009fb508 + 0x48);
      local_110 = *(undefined ******)(PTR_DAT_009fb508 + 0x40);
      local_100 = 0;
      local_b8 = (undefined8 *)(PTR_DAT_009fb508 + 0x30);
      local_120 = (undefined *****)*local_b8;
      local_b0 = &local_168;
      plStack_a8 = (long *)PTR_FUN_009fa3a0;
      local_a0 = &local_148;
      plStack_98 = (long *)PTR_FUN_009fa3a0;
      local_90 = (undefined *****)&local_160;
      pppppuStack_88 = (undefined *****)PTR_FUN_009fa3a0;
      local_f8 = &PTR_s_SKIP_MISSING_from__count___the_s_009d0868;
      uStack_f0 = (int *)&DAT_00000004;
      local_e8 = (undefined *****)&local_b0;
      local_138 = (undefined *****)&local_120;
      puStack_e0 = (undefined1 *)0x3;
      local_d8 = 0;
      pppppuStack_130 = (undefined *****)&local_f8;
      local_128 = &DAT_009d05d8;
      local_c8 = (undefined *****)&local_138;
      puStack_c0 = (undefined1 *)0x1;
      local_160 = pppppuVar23;
      FUN_00724b8c(PTR_DAT_009fb508,&local_c8);
    }
    pppppuVar23 = *ppppppuVar29;
  }
  plStack_a8 = (long *)param_3[1];
  local_b0 = (undefined *****)*param_3;
  lVar17 = param_2[3];
  lVar25 = param_2[5];
  *(long *)(param_1 + 0x8a0) = (long)pppppuVar23 + 1;
  if (lVar25 == lVar17) {
    FUN_003e28fc(param_2 + 3,&PTR_s_rawrs_src_raw_chunker_rs_009d08a8);
  }
  puVar18 = (undefined8 *)(param_2[4] + lVar25 * 0x18);
  *puVar18 = pppppuVar23;
  puVar18[2] = plStack_a8;
  puVar18[1] = local_b0;
  bVar3 = *(byte *)(param_1 + 0x8d0);
  param_2[5] = lVar25 + 1;
  if ((bVar3 & 1) == 0) {
    local_f8 = (undefined **)0x0;
    uStack_f0 = (int *)0x1;
    local_e8 = (undefined *****)0x0;
    pppppuStack_88 = (undefined *****)CONCAT71(pppppuStack_88._1_7_,3);
    local_80 = (undefined *****)&local_f8;
    local_b0 = (undefined *****)0x0;
    local_a0 = (undefined *****)0x0;
    local_90 = (undefined *****)DAT_0077e1d8;
    pppppuStack_78 = (undefined *****)&PTR_LAB_009d0490;
    iVar12 = FUN_00448e30(param_3 + 2,&local_b0);
    if (iVar12 != 0) {
      FUN_00191874(&DAT_0078e3b1,0x37,&local_120,&DAT_009d04d8,&PTR_DAT_009d04c0);
                    /* WARNING: Does not return */
      pcVar10 = (code *)SoftwareBreakpoint(1,0x3b167c);
      (*pcVar10)();
    }
    piStack_158 = uStack_f0;
    local_160 = (undefined *****)local_f8;
    local_150 = local_e8;
    uVar24 = param_3[0xe];
    if (uVar24 != 0) goto LAB_003b0934;
LAB_003b0a98:
    if (((*(ulong *)PTR_DAT_009fac58 < 4) &&
        ((DAT_009fb530 - 1 < 2 ||
         ((DAT_009fb530 != 0 && (cVar11 = FUN_0018fb0c(&PTR_DAT_009fb520), cVar11 != '\0')))))) &&
       (iVar12 = FUN_007243f8(PTR_DAT_009fb520), iVar12 != 0)) {
      if (*(int **)(PTR_DAT_009fb520 + 0x38) == (int *)0x0) {
        ppuVar15 = &PTR_s_rawrs_src_raw_chunker_rs_009d08c0;
LAB_003b1630:
                    /* WARNING: Subroutine does not return */
        FUN_0019151c("FieldSet corrupted (this is a bug)",0x22,ppuVar15);
      }
      puStack_e0 = *(undefined1 **)(PTR_DAT_009fb520 + 0x48);
      local_e8 = *(undefined ******)(PTR_DAT_009fb520 + 0x40);
      local_d8 = 0;
      local_b8 = (undefined8 *)(PTR_DAT_009fb520 + 0x30);
      local_f8 = (undefined **)*local_b8;
      local_120 = (undefined *****)&local_160;
      piStack_118 = (int *)&LAB_003ad630;
      plStack_98 = (long *)0x2;
      local_90 = (undefined *****)0x0;
      puStack_108 = PTR_FUN_009fa3a0;
      local_b0 = (undefined *****)&PTR_s_empty_payload__subject__seq__009d08d8;
      plStack_a8 = (long *)0x2;
      local_a0 = (undefined *****)&local_120;
      pppppuStack_130 = (undefined *****)&local_b0;
      local_138 = (undefined *****)&local_f8;
      local_128 = &DAT_009d05d8;
      local_c8 = (undefined *****)&local_138;
      puStack_c0 = (undefined1 *)0x1;
      local_110 = (undefined *****)ppppppuVar29;
      uStack_f0 = *(int **)(PTR_DAT_009fb520 + 0x38);
      FUN_00724b8c(PTR_DAT_009fb520,&local_c8);
    }
  }
  else {
    piVar2 = (int *)param_3[3];
    local_150 = (undefined *****)param_3[4];
    if ((local_150 < &DAT_00000007) ||
       (_s_raw_007921d6 != *piVar2 ||
        CONCAT31(s_mem__007921d9._1_3_,s_mem__007921d9[0]) != *(int *)((long)piVar2 + 3))) {
joined_r0x003b08a4:
      piStack_118 = piVar2;
      local_110 = local_150;
      if ((long)local_150 < 0) {
        uVar26 = 0;
LAB_003b0cd8:
                    /* WARNING: Subroutine does not return */
        FUN_00191384(uVar26,local_150,&PTR_DAT_009d04f8);
      }
      if ((undefined ******)local_150 == (undefined ******)0x0) {
        piVar13 = (int *)0x1;
      }
      else {
        uVar26 = 1;
        piVar13 = (int *)FUN_00318628(local_150,1);
        if (piVar13 == (int *)0x0) goto LAB_003b0cd8;
      }
      memcpy(piVar13,piVar2,(size_t)local_150);
      uVar24 = param_3[0xe];
      piStack_158 = piVar13;
      local_160 = local_150;
    }
    else {
      local_c8 = (undefined *****)((long)piVar2 + 7);
      local_f8 = &PTR_s_raw_query_009d4440;
      uStack_f0 = (int *)&LAB_003a0878;
      local_e8 = (undefined *****)&local_c8;
      puStack_e0 = &LAB_003a0878;
      local_b0 = (undefined *****)&DAT_007921e0;
      plStack_a8 = (long *)0x2;
      local_a0 = (undefined *****)&local_f8;
      plStack_98 = (long *)0x2;
      local_90 = (undefined *****)0x0;
      puStack_c0 = (undefined1 *)((long)local_150 + -7);
      FUN_0076b8c0(&local_120,&local_b0);
      piVar2 = piStack_118;
      local_150 = local_110;
      if (local_120 == (undefined *****)&DAT_8000000000000000) goto joined_r0x003b08a4;
      uVar24 = param_3[0xe];
      piStack_158 = piStack_118;
      local_160 = local_120;
    }
    if (uVar24 == 0) goto LAB_003b0a98;
LAB_003b0934:
    if (uVar24 < 0xbb801) {
      if (bVar3 == 0) {
        iVar12 = ((int)*(uint *)(param_3 + 1) >> 10) + 999999;
        uVar21 = (long)iVar12 * 0x5b5;
        iVar5 = (int)((ulong)((long)iVar12 * -0x51eb851f) >> 0x20);
        uVar20 = uVar21 + 3;
        if (-1 < (long)uVar21) {
          uVar20 = uVar21;
        }
        lVar17 = (((ulong)*(byte *)((long)param_3 + 4) | 0xffffe33e1b82b180) -
                 (long)(char)*(undefined2 *)((long)param_3 + 0xc)) +
                 (long)(int)((uint)*(byte *)((long)param_3 + 5) -
                            (int)(char)((ushort)*(undefined2 *)((long)param_3 + 0xc) >> 8)) * 0x3c +
                 (long)(int)((uint)*(byte *)((long)param_3 + 6) -
                            (int)*(char *)((long)param_3 + 0xe)) * 0xe10 +
                 (long)(int)(((iVar5 >> 5) - (iVar5 >> 0x1f)) + (*(uint *)(param_3 + 1) & 0x1ff) +
                             iVar12 / 400 + (int)(uVar20 >> 2)) * 0x15180;
        __src = (void *)param_3[0xd];
        piVar2 = piStack_158;
        __n = (undefined ******)local_150;
      }
      else {
        plStack_a8 = (long *)param_3[1];
        local_b0 = (undefined *****)*param_3;
        lVar17 = FUN_003ebc78(param_3 + 6,"Raw-Mem-Time",0xc);
        if (lVar17 == 0) {
          uVar26 = 0;
        }
        else {
          uVar26 = *(undefined8 *)(lVar17 + 8);
        }
        FUN_003e5814(&local_f8,&local_b0,uVar26);
        iVar12 = ((int)(uint)uStack_f0 >> 10) + 999999;
        uVar24 = param_3[0xe];
        uVar21 = (long)iVar12 * 0x5b5;
        uVar20 = uVar21 + 3;
        if (-1 < (long)uVar21) {
          uVar20 = uVar21;
        }
        iVar5 = (int)((ulong)((long)iVar12 * -0x51eb851f) >> 0x20);
        lVar17 = (((ulong)local_f8 >> 0x20 & 0xff | 0xffffe33e1b82b180) -
                 (long)(char)((ulong)uStack_f0 >> 0x20)) +
                 (long)(int)(((iVar5 >> 5) - (iVar5 >> 0x1f)) + ((uint)uStack_f0 & 0x1ff) +
                             iVar12 / 400 + (int)(uVar20 >> 2)) * 0x15180 +
                 (long)(int)((uint)local_f8._5_1_ - (int)(char)((ulong)uStack_f0 >> 0x28)) * 0x3c +
                 (long)(int)((uint)local_f8._6_1_ - (int)uStack_f0._6_1_) * 0xe10;
        __src = (void *)param_3[0xd];
        piVar2 = piStack_158;
        __n = (undefined ******)local_150;
      }
      piStack_158 = piVar2;
      local_150 = (undefined *****)__n;
      if (lVar17 != 0) {
        lVar25 = param_2[2];
        if (lVar25 == *param_2) {
          FUN_003e25fc(param_2,&PTR_s_rawrs_src_raw_chunker_rs_009d0738);
        }
        *(long *)(param_2[1] + lVar25 * 8) = lVar17;
        param_2[2] = lVar25 + 1;
      }
      if ((long)__n < 0) {
        uVar26 = 0;
LAB_003b1574:
        ppuVar15 = &PTR_DAT_009d04f8;
        goto LAB_003b157c;
      }
      if (__n == (undefined ******)0x0) {
        piVar13 = (int *)0x1;
      }
      else {
        uVar4 = *PTR_DAT_009faac8;
        uVar26 = 1;
        piVar13 = (int *)FUN_00318628(__n,1);
        if (piVar13 == (int *)0x0) goto LAB_003b1574;
      }
      memcpy(piVar13,piVar2,(size_t)__n);
      local_f8 = (undefined **)__n;
      uStack_f0 = piVar13;
      local_e8 = (undefined *****)__n;
      FUN_003f0cac(&local_b0,param_2 + 6,&local_f8);
      pppppuVar9 = local_90;
      plVar8 = plStack_98;
      pppppuVar23 = local_a0;
      plVar28 = plStack_a8;
      pppppuVar16 = local_b0;
      plVar27 = plStack_a8;
      if (local_b0 != (undefined *****)&DAT_8000000000000000) {
        plVar27 = param_2 + 0xc;
        ppppppuVar31 = (undefined ******)*plVar27;
        if (__n == (undefined ******)0x0) {
          ppppppuVar30 = (undefined ******)0x1;
        }
        else {
          uVar4 = *PTR_DAT_009faac8;
          ppppppuVar30 = (undefined ******)FUN_00318628(__n,1);
          if (ppppppuVar30 == (undefined ******)0x0) {
                    /* WARNING: Subroutine does not return */
            FUN_00191384(1,__n,&PTR_s__rust_lib_rustlib_src_rust_libra_009d6048);
          }
        }
        memcpy(ppppppuVar30,piVar2,(size_t)__n);
        puVar7 = PTR_DAT_009faac8;
        uVar4 = *PTR_DAT_009faac8;
        ppppppuVar14 = (undefined ******)FUN_00318628(0xffff,1);
        if (ppppppuVar14 == (undefined ******)0x0) {
                    /* WARNING: Subroutine does not return */
          FUN_00191384(1,0xffff,&PTR_s_rawrs_src_raw_mod_rs_009d63e0);
        }
        plStack_98 = (long *)0x0;
        plStack_a8 = _UNK_0078e238;
        local_b0 = (undefined *****)_DAT_0078e230;
        *plVar27 = *plVar27 + 1;
        uVar4 = *puVar7;
        local_a0 = (undefined *****)ppppppuVar14;
        local_90 = (undefined *****)ppppppuVar31;
        pppppuStack_88 = (undefined *****)__n;
        local_80 = (undefined *****)ppppppuVar30;
        pppppuStack_78 = (undefined *****)__n;
        puVar18 = (undefined8 *)FUN_00318628(0x50,0x10);
        if (puVar18 == (undefined8 *)0x0) {
                    /* WARNING: Subroutine does not return */
          FUN_0019139c(0x10,0x50);
        }
        puVar18[8] = 0;
        puVar18[1] = plStack_a8;
        *puVar18 = local_b0;
        puVar18[3] = plStack_98;
        puVar18[2] = local_a0;
        puVar18[5] = pppppuStack_88;
        puVar18[4] = local_90;
        puVar18[7] = pppppuStack_78;
        puVar18[6] = local_80;
        plVar27 = (long *)*plVar8;
        uVar21 = plVar8[1];
        uVar20 = uVar21 & (ulong)pppppuVar9;
        lVar25 = *(long *)((long)plVar27 + uVar20);
        uVar22 = CONCAT17(-(lVar25 < 0),
                          CONCAT16(-((char)((ulong)lVar25 >> 0x30) < '\0'),
                                   CONCAT15(-((char)((ulong)lVar25 >> 0x28) < '\0'),
                                            CONCAT14(-((char)((ulong)lVar25 >> 0x20) < '\0'),
                                                     CONCAT13(-((char)((ulong)lVar25 >> 0x18) < '\0'
                                                               ),CONCAT12(-((char)((ulong)lVar25 >>
                                                                                  0x10) < '\0'),
                                                                          CONCAT11(-((char)((ulong)
                                                  lVar25 >> 8) < '\0'),-((char)lVar25 < '\0'))))))))
        ;
        if (uVar22 == 0) {
          lVar25 = 8;
          do {
            uVar20 = uVar20 + lVar25;
            lVar25 = lVar25 + 8;
            uVar20 = uVar20 & uVar21;
            lVar19 = *(long *)((long)plVar27 + uVar20);
            uVar22 = CONCAT17(-(lVar19 < 0),
                              CONCAT16(-((char)((ulong)lVar19 >> 0x30) < '\0'),
                                       CONCAT15(-((char)((ulong)lVar19 >> 0x28) < '\0'),
                                                CONCAT14(-((char)((ulong)lVar19 >> 0x20) < '\0'),
                                                         CONCAT13(-((char)((ulong)lVar19 >> 0x18) <
                                                                   '\0'),CONCAT12(-((char)((ulong)
                                                  lVar19 >> 0x10) < '\0'),
                                                  CONCAT11(-((char)((ulong)lVar19 >> 8) < '\0'),
                                                           -((char)lVar19 < '\0'))))))));
          } while (uVar22 == 0);
        }
        uVar22 = (uVar22 & 0xaaaaaaaaaaaaaaaa) >> 1 | (uVar22 & 0x5555555555555555) << 1;
        uVar22 = (uVar22 & 0xcccccccccccccccc) >> 2 | (uVar22 & 0x3333333333333333) << 2;
        uVar22 = (uVar22 & 0xf0f0f0f0f0f0f0f0) >> 4 | (uVar22 & 0xf0f0f0f0f0f0f0f) << 4;
        uVar22 = (uVar22 & 0xff00ff00ff00ff00) >> 8 | (uVar22 & 0xff00ff00ff00ff) << 8;
        uVar22 = (uVar22 & 0xffff0000ffff0000) >> 0x10 | (uVar22 & 0xffff0000ffff) << 0x10;
        uVar22 = uVar20 + ((ulong)LZCOUNT(uVar22 >> 0x20 | uVar22 << 0x20) >> 3) & uVar21;
        uVar20 = (ulong)*(char *)((long)plVar27 + uVar22);
        if (-1 < *(char *)((long)plVar27 + uVar22)) {
          lVar25 = *plVar27;
          uVar20 = CONCAT17(-(lVar25 < 0),
                            CONCAT16(-((char)((ulong)lVar25 >> 0x30) < '\0'),
                                     CONCAT15(-((char)((ulong)lVar25 >> 0x28) < '\0'),
                                              CONCAT14(-((char)((ulong)lVar25 >> 0x20) < '\0'),
                                                       CONCAT13(-((char)((ulong)lVar25 >> 0x18) <
                                                                 '\0'),CONCAT12(-((char)((ulong)
                                                  lVar25 >> 0x10) < '\0'),
                                                  CONCAT11(-((char)((ulong)lVar25 >> 8) < '\0'),
                                                           -((char)lVar25 < '\0'))))))));
          uVar20 = (uVar20 & 0xaaaaaaaaaaaaaaaa) >> 1 | (uVar20 & 0x5555555555555555) << 1;
          uVar20 = (uVar20 & 0xcccccccccccccccc) >> 2 | (uVar20 & 0x3333333333333333) << 2;
          uVar20 = (uVar20 & 0xf0f0f0f0f0f0f0f0) >> 4 | (uVar20 & 0xf0f0f0f0f0f0f0f) << 4;
          uVar20 = (uVar20 & 0xff00ff00ff00ff00) >> 8 | (uVar20 & 0xff00ff00ff00ff) << 8;
          uVar20 = (uVar20 & 0xffff0000ffff0000) >> 0x10 | (uVar20 & 0xffff0000ffff) << 0x10;
          uVar22 = (ulong)LZCOUNT(uVar20 >> 0x20 | uVar20 << 0x20) >> 3;
          uVar20 = (ulong)*(byte *)((long)plVar27 + uVar22);
        }
        bVar3 = (byte)((ulong)pppppuVar9 >> 0x38);
        *(byte *)((long)plVar27 + uVar22) = bVar3 >> 1;
        *(byte *)((long)plVar27 + (uVar22 - 8 & uVar21) + 8) = bVar3 >> 1;
        plVar8[2] = plVar8[2] - (uVar20 & 1);
        plVar27 = plVar27 + uVar22 * -7;
        plVar27[-1] = lVar17;
        plVar27[-7] = (long)pppppuVar16;
        plVar27[-6] = (long)plVar28;
        plVar27[-5] = (long)pppppuVar23;
        plVar27[-4] = 1;
        plVar27[-3] = (long)puVar18;
        plVar27[-2] = 1;
        plVar8[3] = plVar8[3] + 1;
      }
      plVar28 = param_2 + 0xc;
      lVar25 = plVar27[-2];
      if (lVar25 == 0) {
        ppuVar15 = &PTR_s_rawrs_src_raw_chunker_rs_009d0750;
        goto LAB_003b14dc;
      }
      lVar19 = plVar27[-3] + lVar25 * 0x50;
      if (*(long *)(lVar19 + -0x50) != -0x7fffffffffffffff) {
        ppuVar15 = &PTR_s_rawrs_src_raw_mod_rs_009d6438;
        goto LAB_003b14dc;
      }
      lVar19 = *(long *)(lVar19 + -0x38);
      if (lVar19 == 0) {
LAB_003b1060:
        bVar6 = false;
        bVar1 = false;
      }
      else {
        uVar20 = lVar19 + uVar24;
        bVar1 = 0xbb800 < uVar20;
        if ((lVar17 == 0) || (plVar27[-1] == 0)) {
          bVar6 = false;
          if (uVar20 < 0xbb801) {
            bVar1 = false;
            goto LAB_003b1190;
          }
          bVar6 = false;
          bVar1 = true;
          ppppppuVar31 = (undefined ******)*plVar28;
          if (__n != (undefined ******)0x0) goto LAB_003b1090;
LAB_003b1058:
          ppppppuVar30 = (undefined ******)0x1;
        }
        else {
          lVar19 = lVar17 - plVar27[-1];
          bVar6 = uVar20 < 0xbb801 || param_2[0xe] < lVar19;
          if (uVar20 < 0xbb801 && lVar19 <= param_2[0xe]) goto LAB_003b1060;
          ppppppuVar31 = (undefined ******)*plVar28;
          if (__n == (undefined ******)0x0) goto LAB_003b1058;
LAB_003b1090:
          uVar26 = 1;
          uVar4 = *PTR_DAT_009faac8;
          ppppppuVar30 = (undefined ******)FUN_00318628(__n,1);
          if (ppppppuVar30 == (undefined ******)0x0) {
            ppuVar15 = &PTR_s__rust_lib_rustlib_src_rust_libra_009d6048;
LAB_003b157c:
                    /* WARNING: Subroutine does not return */
            FUN_00191384(uVar26,__n,ppuVar15);
          }
        }
        memcpy(ppppppuVar30,piVar2,(size_t)__n);
        uVar4 = *PTR_DAT_009faac8;
        ppppppuVar14 = (undefined ******)FUN_00318628(0xffff,1);
        if (ppppppuVar14 == (undefined ******)0x0) {
                    /* WARNING: Subroutine does not return */
          FUN_00191384(1,0xffff,&PTR_s_rawrs_src_raw_mod_rs_009d63e0);
        }
        plStack_98 = (long *)0x0;
        plStack_a8 = _UNK_0078e238;
        local_b0 = (undefined *****)_DAT_0078e230;
        local_70 = 0;
        lVar25 = plVar27[-2];
        local_a0 = (undefined *****)ppppppuVar14;
        local_90 = (undefined *****)ppppppuVar31;
        pppppuStack_88 = (undefined *****)__n;
        local_80 = (undefined *****)ppppppuVar30;
        pppppuStack_78 = (undefined *****)__n;
        if (lVar25 == plVar27[-4]) {
          FUN_003e26b0(plVar27 + -4,&PTR_s_rawrs_src_raw_chunker_rs_009d0768);
        }
        puVar18 = (undefined8 *)(plVar27[-3] + lVar25 * 0x50);
        puVar18[3] = plStack_98;
        puVar18[2] = local_a0;
        puVar18[5] = pppppuStack_88;
        puVar18[4] = local_90;
        puVar18[7] = pppppuStack_78;
        puVar18[6] = local_80;
        puVar18[9] = uStack_68;
        puVar18[8] = local_70;
        puVar18[1] = plStack_a8;
        *puVar18 = local_b0;
        plVar27[-2] = lVar25 + 1;
        *plVar28 = *plVar28 + 1;
        lVar25 = plVar27[-2];
        plVar27[-1] = lVar17;
        if (lVar25 == 0) {
          ppuVar15 = &PTR_s_rawrs_src_raw_chunker_rs_009d0780;
LAB_003b14dc:
                    /* WARNING: Subroutine does not return */
          FUN_00191500(ppuVar15);
        }
      }
LAB_003b1190:
      lVar17 = plVar27[-3] + lVar25 * 0x50;
      if (*(long *)(lVar17 + -0x50) == -0x7fffffffffffffff) {
        lVar25 = *(long *)(lVar17 + -0x38);
        if ((ulong)(*(long *)(lVar17 + -0x48) - lVar25) < uVar24) {
          FUN_00174798((long *)(lVar17 + -0x48),lVar25,uVar24,1,1);
          lVar25 = *(long *)(lVar17 + -0x38);
        }
        memcpy((void *)(*(long *)(lVar17 + -0x40) + lVar25),__src,uVar24);
        *(ulong *)(lVar17 + -0x38) = lVar25 + uVar24;
        *(long *)(lVar17 + -0x10) = *(long *)(lVar17 + -0x10) + 1;
        param_2[0xd] = param_2[0xd] + 1;
        if ((((!(bool)(bVar1 | bVar6 ^ 1U)) && (*(ulong *)PTR_DAT_009fac58 < 2)) &&
            ((DAT_009fb560 - 1 < 2 ||
             ((DAT_009fb560 != 0 && (cVar11 = FUN_0018fb0c(&PTR_DAT_009fb550), cVar11 != '\0'))))))
           && (iVar12 = FUN_007243f8(PTR_DAT_009fb550), iVar12 != 0)) {
          if (*(int **)(PTR_DAT_009fb550 + 0x38) == (int *)0x0) {
                    /* WARNING: Subroutine does not return */
            FUN_0019151c("FieldSet corrupted (this is a bug)",0x22,
                         &PTR_s_rawrs_src_raw_chunker_rs_009d08f8);
          }
          puStack_e0 = *(undefined1 **)(PTR_DAT_009fb550 + 0x48);
          local_e8 = *(undefined ******)(PTR_DAT_009fb550 + 0x40);
          local_120 = (undefined *****)&local_160;
          local_b8 = (undefined8 *)(PTR_DAT_009fb550 + 0x30);
          local_f8 = (undefined **)*local_b8;
          local_d8 = 0;
          piStack_118 = (int *)&LAB_003ad630;
          local_110 = (undefined *****)(param_1 + 0x840);
          puStack_108 = PTR_FUN_009fae90;
          local_b0 = (undefined *****)&PTR_s_time_based_chunk_split_for___chu_009d0910;
          plStack_a8 = (long *)0x3;
          local_a0 = (undefined *****)&local_120;
          local_138 = (undefined *****)&local_f8;
          plStack_98 = (long *)0x2;
          local_90 = (undefined *****)0x0;
          pppppuStack_130 = (undefined *****)&local_b0;
          local_128 = &DAT_009d05d8;
          local_c8 = (undefined *****)&local_138;
          puStack_c0 = (undefined1 *)0x1;
          uStack_f0 = *(int **)(PTR_DAT_009fb550 + 0x38);
          FUN_00724b8c(PTR_DAT_009fb550,&local_c8);
        }
      }
      else {
        uVar4 = *PTR_DAT_009faac8;
        pppppuVar16 = (undefined *****)FUN_00318628(0x10,8);
        if (pppppuVar16 == (undefined *****)0x0) {
                    /* WARNING: Subroutine does not return */
          FUN_0019139c(8,0x10);
        }
        *pppppuVar16 = (undefined ****)
                       "chunk was unexpected value (this should not happen)make_jetstreamrawrs::rawRecevierHangupRawClientMioUsbEnumerationNotifyEssentialTaskFailureRawChunkEncLsp"
        ;
        pppppuVar16[1] = (undefined ****)0x33;
        puStack_140 = &DAT_009d6418;
        puVar18 = &DAT_009d6418;
        local_148 = (undefined ****)pppppuVar16;
        if (*(ulong *)PTR_DAT_009fac58 < 5) {
          if (DAT_009fb578 - 1 < 2) {
LAB_003b136c:
            uVar24 = FUN_007243f8(PTR_DAT_009fb568);
            if ((uVar24 & 1) == 0) {
LAB_003b1440:
              puVar18 = &DAT_009d6418;
            }
            else {
              if (*(int **)(PTR_DAT_009fb568 + 0x38) == (int *)0x0) {
                    /* WARNING: Subroutine does not return */
                FUN_0019151c("FieldSet corrupted (this is a bug)",0x22,
                             &PTR_s_rawrs_src_raw_chunker_rs_009d0940);
              }
              puStack_108 = *(undefined **)(PTR_DAT_009fb568 + 0x48);
              local_110 = *(undefined ******)(PTR_DAT_009fb568 + 0x40);
              local_100 = 0;
              local_b8 = (undefined8 *)(PTR_DAT_009fb568 + 0x30);
              local_120 = (undefined *****)*local_b8;
              local_a0 = (undefined *****)&local_160;
              plStack_a8 = (long *)PTR_FUN_009fa3a0;
              plStack_98 = (long *)&LAB_003ad630;
              local_90 = &local_148;
              pppppuStack_88 = (undefined *****)&LAB_003a538c;
              local_f8 = &PTR_s_dropping_message__failed_to_add_s_009d0958;
              uStack_f0 = (int *)0x3;
              local_e8 = (undefined *****)&local_b0;
              puStack_e0 = (undefined1 *)0x3;
              local_d8 = 0;
              pppppuStack_130 = (undefined *****)&local_f8;
              local_138 = (undefined *****)&local_120;
              local_128 = &DAT_009d05d8;
              local_c8 = (undefined *****)&local_138;
              puStack_c0 = (undefined1 *)0x1;
              piStack_118 = *(int **)(PTR_DAT_009fb568 + 0x38);
              local_b0 = (undefined *****)ppppppuVar29;
              FUN_00724b8c(PTR_DAT_009fb568,&local_c8);
              pppppuVar16 = (undefined *****)local_148;
              puVar18 = puStack_140;
            }
          }
          else if (DAT_009fb578 != 0) {
            cVar11 = FUN_0018fb0c(&PTR_DAT_009fb568);
            if (cVar11 != '\0') goto LAB_003b136c;
            goto LAB_003b1440;
          }
        }
        if ((code *)*puVar18 != (code *)0x0) {
          (*(code *)*puVar18)(pppppuVar16);
        }
        if (puVar18[1] != 0) {
          FUN_0031865c(pppppuVar16,puVar18[1],puVar18[2]);
        }
      }
      if ((undefined ******)local_160 != (undefined ******)0x0) {
        FUN_0031865c(piStack_158,local_160,1);
      }
      (**(code **)(param_3[2] + 0x20))(param_3[5],param_3[3],param_3[4]);
      FUN_003efb9c(param_3 + 6);
      goto LAB_003b1498;
    }
    if ((*(ulong *)PTR_DAT_009fac58 < 5) &&
       (((DAT_009fb548 - 1 < 2 ||
         ((DAT_009fb548 != 0 && (cVar11 = FUN_0018fb0c(&PTR_DAT_009fb538), cVar11 != '\0')))) &&
        (iVar12 = FUN_007243f8(PTR_DAT_009fb538), iVar12 != 0)))) {
      if (*(int **)(PTR_DAT_009fb538 + 0x38) == (int *)0x0) {
        ppuVar15 = &PTR_s_rawrs_src_raw_chunker_rs_009d0988;
        goto LAB_003b1630;
      }
      puStack_108 = *(undefined **)(PTR_DAT_009fb538 + 0x48);
      local_110 = *(undefined ******)(PTR_DAT_009fb538 + 0x40);
      local_148 = (undefined ****)param_3[0xe];
      local_b8 = (undefined8 *)(PTR_DAT_009fb538 + 0x30);
      local_120 = (undefined *****)*local_b8;
      local_100 = 0;
      local_b0 = &local_148;
      plStack_a8 = (long *)PTR_FUN_009fa168;
      local_a0 = (undefined *****)0x78e220;
      plStack_98 = (long *)PTR_FUN_009fa168;
      local_90 = (undefined *****)&local_160;
      pppppuStack_88 = (undefined *****)&LAB_003ad630;
      puStack_e0 = (undefined1 *)0x4;
      local_d8 = 0;
      pppppuStack_78 = (undefined *****)PTR_FUN_009fa3a0;
      local_f8 = &PTR_s_dropping_message__size_exceeds_c_009d09a0;
      uStack_f0 = (int *)&DAT_00000004;
      local_e8 = (undefined *****)&local_b0;
      pppppuStack_130 = (undefined *****)&local_f8;
      local_138 = (undefined *****)&local_120;
      local_128 = &DAT_009d05d8;
      local_c8 = (undefined *****)&local_138;
      puStack_c0 = (undefined1 *)0x1;
      piStack_118 = *(int **)(PTR_DAT_009fb538 + 0x38);
      local_80 = (undefined *****)ppppppuVar29;
      FUN_00724b8c(PTR_DAT_009fb538,&local_c8);
    }
  }
  if ((undefined ******)local_160 != (undefined ******)0x0) {
    FUN_0031865c(piStack_158,local_160,1);
  }
  (**(code **)(param_3[2] + 0x20))(param_3[5],param_3[3],param_3[4]);
  FUN_003efb9c(param_3 + 6);
LAB_003b1498:
  (**(code **)(param_3[0xc] + 0x20))(param_3[0xf],param_3[0xd],param_3[0xe]);
  return;
}


