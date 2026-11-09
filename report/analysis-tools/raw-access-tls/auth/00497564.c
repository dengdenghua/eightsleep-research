/* Reconstructed Ghidra pseudocode, not vendor source. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00497564(size_t *param_1,long param_2,undefined8 param_3,undefined8 param_4,
                 undefined8 param_5,undefined8 param_6,void *param_7,size_t param_8,
                 undefined8 param_9)

{
  long lVar1;
  long lVar2;
  long lVar3;
  long lVar4;
  undefined7 uVar5;
  long lVar6;
  size_t sVar7;
  void *pvVar8;
  undefined8 *puVar9;
  ulong uVar10;
  undefined1 uVar11;
  long lVar12;
  undefined1 extraout_w10;
  undefined1 uVar13;
  undefined1 extraout_w11;
  undefined1 uVar14;
  long *plVar15;
  void *pvVar16;
  long lVar17;
  long lVar18;
  long lVar19;
  undefined8 uVar20;
  long local_358;
  undefined8 local_350;
  undefined *puStack_320;
  undefined8 uStack_318;
  undefined **ppuStack_308;
  undefined8 uStack_300;
  size_t **ppsStack_2f8;
  undefined8 local_2f0;
  undefined8 uStack_2e8;
  undefined8 uStack_2e0;
  undefined8 uStack_2d8;
  undefined8 local_2d0;
  undefined8 uStack_2c8;
  undefined8 local_2c0;
  undefined8 uStack_2b8;
  undefined8 local_2b0;
  undefined8 uStack_2a8;
  undefined8 local_2a0;
  undefined8 uStack_298;
  undefined8 local_290;
  undefined8 uStack_288;
  undefined8 local_280;
  undefined8 uStack_278;
  undefined8 local_270;
  undefined8 uStack_268;
  undefined1 local_260 [48];
  undefined *local_230;
  undefined8 uStack_228;
  size_t *local_220;
  code *pcStack_218;
  undefined8 local_1e0;
  undefined8 uStack_1d8;
  undefined8 local_1d0;
  undefined8 uStack_1c8;
  undefined8 uStack_1c0;
  undefined7 uStack_1b8;
  undefined1 local_1b1;
  undefined7 uStack_1b0;
  undefined *puStack_1a9;
  size_t local_1a0;
  void *pvStack_198;
  undefined8 local_190;
  size_t sStack_188;
  size_t local_180;
  size_t sStack_178;
  undefined *local_170;
  size_t sStack_168;
  char local_158;
  undefined7 uStack_157;
  undefined1 uStack_150;
  undefined7 uStack_14f;
  undefined1 uStack_148;
  undefined7 uStack_147;
  undefined1 uStack_140;
  undefined7 uStack_13f;
  undefined1 uStack_138;
  undefined7 uStack_137;
  undefined1 local_130;
  undefined7 uStack_12f;
  undefined1 uStack_128;
  undefined7 uStack_127;
  undefined *local_120;
  undefined8 uStack_118;
  undefined4 local_110;
  undefined4 uStack_10c;
  undefined **ppuStack_108;
  undefined8 local_100;
  size_t **ppsStack_f8;
  undefined8 local_f0;
  undefined8 uStack_e8;
  undefined8 local_e0;
  undefined8 uStack_d8;
  undefined8 local_d0;
  undefined8 uStack_c8;
  undefined8 local_c0;
  undefined8 uStack_b8;
  undefined8 local_b0;
  undefined8 uStack_a8;
  undefined8 local_a0;
  undefined8 uStack_98;
  undefined8 local_90;
  undefined8 uStack_88;
  undefined8 local_80;
  undefined8 uStack_78;
  undefined8 local_70;
  undefined8 uStack_68;
  
  FUN_0050fefc(&local_158,param_3);
  local_358 = CONCAT71(uStack_157,local_158);
  if (local_358 == -0x7fffffffffffffff) {
    FUN_004b92d0(&local_1a0,&uStack_150);
    param_1[1] = (size_t)pvStack_198;
    *param_1 = local_1a0;
    param_1[3] = sStack_188;
    param_1[2] = local_190;
    param_1[5] = sStack_178;
    param_1[4] = local_180;
    param_1[7] = sStack_168;
    param_1[6] = (size_t)local_170;
    return;
  }
  local_350 = CONCAT71(uStack_14f,uStack_150);
  local_190._1_7_ = uStack_13f;
  lVar18 = *(long *)(param_2 + 0x10);
  lVar6 = lVar18 << 3;
  sStack_168 = uStack_118;
  local_170 = local_120;
  uStack_298 = uStack_98;
  local_2a0 = local_a0;
  uStack_288 = uStack_88;
  local_290 = local_90;
  uStack_278 = uStack_78;
  local_280 = local_80;
  uStack_268 = uStack_68;
  local_270 = local_70;
  uStack_2b8 = uStack_b8;
  local_2c0 = local_c0;
  uStack_2c8 = uStack_c8;
  local_2d0 = local_d0;
  uStack_228 = uStack_118;
  local_230 = local_120;
  uStack_2a8 = uStack_a8;
  local_2b0 = local_b0;
  ppuStack_308 = ppuStack_108;
  ppsStack_2f8 = ppsStack_f8;
  uStack_300 = local_100;
  uStack_2e8 = uStack_e8;
  local_2f0 = local_f0;
  uStack_2d8 = uStack_d8;
  uStack_2e0 = local_e0;
  uStack_318 = uStack_118;
  puStack_320 = local_120;
  if (lVar18 == 0) {
    pvStack_198 = (void *)0x0;
    uVar11 = 2;
    sVar7 = 8;
    uVar13 = extraout_w10;
    uVar14 = extraout_w11;
  }
  else {
    lVar19 = *(long *)(param_2 + 8);
    uVar13 = *PTR_DAT_009faac8;
    sVar7 = FUN_00318628(lVar6,8);
    lVar4 = _UNK_007a1a98;
    lVar3 = _DAT_007a1a90;
    lVar2 = _UNK_007a1a88;
    lVar1 = _DAT_007a1a80;
    if (sVar7 == 0) {
                    /* WARNING: Subroutine does not return */
      FUN_00191384(8,lVar6,&PTR_DAT_009e06d8);
    }
    uVar10 = lVar18 * 0x98 - 0x98;
    if (uVar10 < 0x1c8) {
      pvStack_198 = (void *)0x0;
      lVar12 = lVar19;
LAB_0049775c:
      do {
        lVar1 = lVar12 + 0x98;
        *(long *)(sVar7 + (long)pvStack_198 * 8) = lVar12;
        pvStack_198 = (void *)((long)pvStack_198 + 1);
        lVar12 = lVar1;
      } while (lVar1 != lVar19 + lVar18 * 0x98);
    }
    else {
      plVar15 = (long *)(sVar7 + 0x10);
      pvVar8 = (void *)(uVar10 / 0x98 + 1);
      pvStack_198 = (void *)((ulong)pvVar8 & 0x3fffffffffffffc);
      lVar12 = lVar19 + (long)pvStack_198 * 0x98;
      pvVar16 = pvStack_198;
      lVar17 = lVar19;
      do {
        pvVar16 = (void *)((long)pvVar16 + -4);
        plVar15[-1] = lVar17 + lVar2;
        plVar15[-2] = lVar17 + lVar1;
        plVar15[1] = lVar17 + lVar4;
        *plVar15 = lVar17 + lVar3;
        plVar15 = plVar15 + 4;
        lVar17 = lVar17 + 0x260;
      } while (pvVar16 != (void *)0x0);
      if (pvVar8 != pvStack_198) goto LAB_0049775c;
    }
    uVar13 = *(undefined1 *)(param_2 + 0x40);
    uVar14 = *(undefined1 *)(param_2 + 0x41);
    uVar11 = *(undefined1 *)(param_2 + 0x42);
  }
  uVar5 = local_190._1_7_;
  local_190._3_5_ = SUB75(uVar5,2);
  local_190._0_3_ = CONCAT12(uVar11,CONCAT11(uVar14,uVar13));
  local_1a0 = sVar7;
  FUN_004ad0a0(&local_158,&local_358,*(long *)(param_2 + 0x18) + 0x10,param_4,param_5,&local_1a0,
               param_9,*(undefined8 *)(param_2 + 0x20),*(undefined8 *)(param_2 + 0x28));
  if (local_158 == '\x16') {
    if ((param_8 != 0) && (*(long *)PTR_DAT_009fa8b0 == 5)) {
      if ((long)param_8 < 0) {
        uVar20 = 0;
LAB_004979f8:
                    /* WARNING: Subroutine does not return */
        FUN_00191384(uVar20,param_8,&PTR_DAT_009e0638);
      }
      uVar20 = 1;
      uVar13 = *PTR_DAT_009faac8;
      pvVar8 = (void *)FUN_00318628(param_8,1);
      if (pvVar8 == (void *)0x0) goto LAB_004979f8;
      memcpy(pvVar8,param_7,param_8);
      local_220 = &local_1a0;
      pcStack_218 = FUN_004fe198;
      local_1a0 = param_8;
      pvStack_198 = pvVar8;
      local_190 = param_8;
      puVar9 = (undefined8 *)FUN_00721c48(&PTR_DAT_009e0700);
      uStack_10c = *(undefined4 *)(puVar9 + 2);
      uStack_128 = 5;
      uStack_127 = 0;
      uStack_118 = 0x1f;
      ppuStack_108 = &PTR_DAT_009e06f0;
      ppsStack_f8 = &local_220;
      local_120 = &DAT_007a1c97;
      local_100 = 1;
      local_f0 = 1;
      uStack_e8 = 0;
      local_158 = '\0';
      uStack_157 = 0;
      uStack_150 = 0x97;
      uStack_14f = 0x7a1c;
      uStack_140 = (undefined1)_UNK_007a1ab8;
      uStack_13f = (undefined7)((ulong)_UNK_007a1ab8 >> 8);
      uStack_148 = (undefined1)_DAT_007a1ab0;
      uStack_147 = (undefined7)((ulong)_DAT_007a1ab0 >> 8);
      uStack_138 = (undefined1)*puVar9;
      uStack_137 = (undefined7)((ulong)*puVar9 >> 8);
      local_130 = (undefined1)puVar9[1];
      uStack_12f = (undefined7)((ulong)puVar9[1] >> 8);
      local_110 = 1;
      FUN_00721c0c(local_260,&local_158);
      if (local_1a0 != 0) {
        FUN_0031865c(pvStack_198,local_1a0,1);
      }
    }
    FUN_0051009c(&local_1a0,&local_358,param_6);
    if ((local_1a0 == 0x8000000000000032) ||
       (FUN_004b92d0(&local_158,&local_1a0), local_158 == '\x16')) {
      *(char *)param_1 = '\x16';
    }
    else {
      uStack_1c0 = CONCAT17(local_130,uStack_137);
      uStack_1d8 = CONCAT17(uStack_148,uStack_14f);
      local_1e0 = CONCAT17(uStack_150,uStack_157);
      *(char *)param_1 = local_158;
      uStack_1c8 = CONCAT17(uStack_138,uStack_13f);
      local_1d0 = CONCAT17(uStack_140,uStack_147);
      *(undefined8 *)((long)param_1 + 9) = uStack_1d8;
      *(undefined8 *)((long)param_1 + 1) = local_1e0;
      *(undefined8 *)((long)param_1 + 0x19) = uStack_1c8;
      *(undefined8 *)((long)param_1 + 0x11) = local_1d0;
      *(ulong *)((long)param_1 + 0x29) = CONCAT17(uStack_128,uStack_12f);
      *(undefined8 *)((long)param_1 + 0x21) = uStack_1c0;
      param_1[7] = (size_t)local_120;
      param_1[6] = CONCAT71(uStack_127,uStack_128);
      uStack_1b8 = uStack_12f;
      local_1b1 = uStack_128;
      uStack_1b0 = uStack_127;
      puStack_1a9 = local_120;
    }
  }
  else {
    param_1[1] = CONCAT71(uStack_14f,uStack_150);
    *param_1 = CONCAT71(uStack_157,local_158);
    param_1[3] = CONCAT71(uStack_13f,uStack_140);
    param_1[2] = CONCAT71(uStack_147,uStack_148);
    param_1[5] = CONCAT71(uStack_12f,local_130);
    param_1[4] = CONCAT71(uStack_137,uStack_138);
    param_1[7] = (size_t)local_120;
    param_1[6] = CONCAT71(uStack_127,uStack_128);
  }
  if (lVar18 != 0) {
    FUN_0031865c(sVar7,lVar6,8);
  }
  if ((local_358 != -0x8000000000000000) && (local_358 != 0)) {
    FUN_0031865c(local_350,local_358,1);
  }
  return;
}


