/* Reconstructed Ghidra pseudocode, not vendor source. */

void FUN_003a6cdc(long *param_1,undefined8 ****param_2,undefined8 param_3)

{
  undefined1 uVar1;
  undefined *puVar2;
  undefined4 uVar3;
  char cVar4;
  int iVar5;
  long *plVar6;
  ulong *puVar7;
  undefined8 *puVar8;
  void *__dest;
  long lVar9;
  undefined **ppuVar10;
  long lVar11;
  undefined8 ****local_358;
  long lStack_350;
  ulong *local_348;
  undefined **ppuStack_340;
  long local_338 [5];
  undefined4 local_310;
  long local_308;
  ulong *puStack_300;
  undefined **local_2f8;
  undefined8 ***local_2f0;
  long lStack_2e8;
  long local_2e0;
  undefined1 local_2d8 [16];
  undefined8 local_2c8;
  undefined8 uStack_2c0;
  undefined8 local_2b8;
  undefined8 ****local_2b0;
  undefined *puStack_2a8;
  ulong *local_2a0;
  undefined **ppuStack_298;
  undefined8 local_290;
  undefined8 ***local_288;
  undefined8 local_280;
  undefined8 local_278;
  undefined *local_270;
  undefined8 ****local_268;
  undefined *puStack_260;
  undefined8 local_258;
  undefined8 ***local_1c0;
  undefined *puStack_1b8;
  undefined8 ****local_1b0;
  undefined *local_1a8;
  undefined1 *local_1a0;
  undefined *puStack_198;
  undefined8 ****local_58;
  undefined8 ***pppuStack_50;
  undefined *local_48;
  
  puStack_1b8 = (undefined *)CONCAT26(puStack_1b8._6_2_,1);
  local_1c0 = DAT_00789318;
  FUN_00746424(&local_278,&local_1c0,param_2,param_3);
  puVar2 = PTR_DAT_009faac8;
  local_2f0 = param_2;
  lStack_2e8 = param_3;
  if (((ulong)local_278 & 1) != 0) {
    local_2b0 = (undefined8 ****)0x3;
    puStack_2a8 = local_270;
    local_278 = (undefined **)&local_2f0;
    local_270 = PTR_FUN_009facc8;
    local_1a8 = (undefined *)0x2;
    local_1a0 = (undefined1 *)0x0;
    puStack_260 = PTR_FUN_009faab8;
    local_1c0 = (undefined8 ***)&PTR_DAT_009d0008;
    puStack_1b8 = (undefined *)0x2;
    local_268 = &local_2b0;
    local_1b0 = (undefined8 ****)&local_278;
    FUN_0076b8c0(&local_58,&local_1c0);
    uVar1 = *PTR_DAT_009faac8;
    plVar6 = (long *)FUN_00318628(0x18,8);
    if (plVar6 != (long *)0x0) {
      plVar6[1] = (long)pppuStack_50;
      *plVar6 = (long)local_58;
      plVar6[2] = (long)local_48;
      FUN_003a2768(&local_2b0);
      *param_1 = (long)plVar6;
      param_1[1] = (long)&PTR_LAB_009cee70;
      return;
    }
                    /* WARNING: Subroutine does not return */
    FUN_0019139c(8,0x18);
  }
  uVar3 = local_278._4_4_;
  uVar1 = *PTR_DAT_009faac8;
  local_338[0] = FUN_00318628(0x2000,1);
  if (local_338[0] == 0) {
                    /* WARNING: Subroutine does not return */
    FUN_00191384(1,0x2000,&PTR_DAT_009cf100);
  }
  local_338[3] = 0;
  local_338[4] = 0;
  local_338[1] = 0x2000;
  local_310 = uVar3;
  local_338[2] = 0;
  FUN_0039562c(&local_358,local_338);
  if (local_358 == (undefined8 ****)&DAT_00000005) {
    puVar7 = local_348;
    if (lStack_350 != -0x8000000000000000) {
      local_2f8 = ppuStack_340;
      local_2f0 = (undefined8 ****)0x0;
      local_308 = lStack_350;
      puStack_300 = local_348;
      lStack_2e8 = 8;
      local_2e0 = 0;
      local_2d8 = FUN_003ef3b8(&local_2f0,&local_308);
      if (local_2d8._0_8_ == 0) {
        local_278 = (undefined **)&local_2b0;
        local_270 = PTR_FUN_009facc8;
        local_268 = (undefined8 ****)(local_2d8 + 8);
        puStack_260 = PTR_FUN_009fa168;
        local_1c0 = (undefined8 ***)&PTR_DAT_009cff38;
        puStack_1b8 = (undefined *)0x3;
        local_1b0 = (undefined8 ****)&local_278;
        local_1a8 = (undefined *)0x2;
        local_1a0 = (undefined1 *)0x0;
        local_2b0 = param_2;
        puStack_2a8 = (undefined *)param_3;
        FUN_0076b8c0(&local_2c8,&local_1c0);
        uVar1 = *puVar2;
        puVar8 = (undefined8 *)FUN_00318628(0x18,8);
        if (puVar8 == (undefined8 *)0x0) {
                    /* WARNING: Subroutine does not return */
          FUN_0019139c(8,0x18);
        }
        puVar8[2] = local_2b8;
        puVar8[1] = uStack_2c0;
        *puVar8 = local_2c8;
        *param_1 = (long)puVar8;
        param_1[1] = (long)&PTR_LAB_009cee70;
        if (local_2e0 != 0) {
          puVar8 = (undefined8 *)(lStack_2e8 + 0x20);
          lVar11 = local_2e0;
          do {
            lVar9 = puVar8[-4];
            if ((lVar9 != -0x8000000000000000) && (lVar9 != 0)) {
              FUN_0031865c(puVar8[-3],lVar9,1);
            }
            lVar9 = puVar8[-1];
            if ((lVar9 != -0x8000000000000000) && (lVar9 != 0)) {
              FUN_0031865c(*puVar8,lVar9,1);
            }
            lVar9 = puVar8[2];
            if ((-0x7fffffffffffffff < lVar9) && (lVar9 != 0)) {
              FUN_0031865c(puVar8[3],lVar9,1);
            }
            lVar11 = lVar11 + -1;
            puVar8 = puVar8 + 9;
          } while (lVar11 != 0);
        }
        if ((undefined8 ****)local_2f0 == (undefined8 ****)0x0) {
          return;
        }
        FUN_0031865c(lStack_2e8,(long)local_2f0 * 0x48,8);
        return;
      }
      if (local_2d8._8_8_ == 0) {
        if (2 < *(ulong *)PTR_DAT_009fac58) goto LAB_003a7234;
        if (1 < DAT_009fb230 - 1) {
          if (DAT_009fb230 == 0) goto LAB_003a7234;
          cVar4 = FUN_0018fb0c(&PTR_DAT_009fb220);
          if (cVar4 == '\0') goto LAB_003a7234;
        }
        iVar5 = FUN_007243f8(PTR_DAT_009fb220);
        if (iVar5 != 0) {
          local_270 = *(undefined **)(PTR_DAT_009fb220 + 0x38);
          if (local_270 == (undefined *)0x0) {
            ppuVar10 = &PTR_DAT_009cff68;
            goto LAB_003a7324;
          }
          puStack_260 = *(undefined **)(PTR_DAT_009fb220 + 0x48);
          local_268 = *(undefined8 *****)(PTR_DAT_009fb220 + 0x40);
          local_258 = 0;
          local_348 = (ulong *)(PTR_DAT_009fb220 + 0x30);
          local_278 = (undefined **)*local_348;
          local_2b0 = &local_288;
          puStack_2a8 = PTR_FUN_009facc8;
          local_2a0 = (ulong *)local_2d8;
          ppuStack_298 = (undefined **)PTR_FUN_009fa168;
          local_1c0 = (undefined8 ***)&PTR_DAT_009cff80;
          puStack_1b8 = (undefined *)0x3;
          local_1b0 = &local_2b0;
          local_58 = (undefined8 ****)&local_278;
          local_1a8 = (undefined *)0x2;
          local_1a0 = (undefined1 *)0x0;
          pppuStack_50 = &local_1c0;
          local_48 = &DAT_009ceb90;
          local_358 = &local_58;
          lStack_350 = 1;
          local_288 = param_2;
          local_280 = param_3;
          FUN_00724b8c(PTR_DAT_009fb220,&local_358);
        }
      }
      else {
        if (3 < *(ulong *)PTR_DAT_009fac58) goto LAB_003a7234;
        if (1 < DAT_009fb218 - 1) {
          if (DAT_009fb218 == 0) goto LAB_003a7234;
          cVar4 = FUN_0018fb0c(&PTR_DAT_009fb208);
          if (cVar4 == '\0') goto LAB_003a7234;
        }
        iVar5 = FUN_007243f8(PTR_DAT_009fb208);
        if (iVar5 != 0) {
          puStack_2a8 = *(undefined **)(PTR_DAT_009fb208 + 0x38);
          if (puStack_2a8 == (undefined *)0x0) {
            ppuVar10 = &PTR_DAT_009cffb0;
LAB_003a7324:
                    /* WARNING: Subroutine does not return */
            FUN_0019151c(&DAT_0078c24b,0x22,ppuVar10);
          }
          ppuStack_298 = *(undefined ***)(PTR_DAT_009fb208 + 0x48);
          local_2a0 = *(ulong **)(PTR_DAT_009fb208 + 0x40);
          local_290 = 0;
          local_348 = (ulong *)(PTR_DAT_009fb208 + 0x30);
          local_2b0 = (undefined8 ****)*local_348;
          local_1c0 = &local_288;
          puStack_1b8 = PTR_FUN_009facc8;
          local_1b0 = (undefined8 ****)local_2d8;
          local_1a8 = PTR_FUN_009fa168;
          local_1a0 = local_2d8 + 8;
          puStack_198 = PTR_FUN_009fa168;
          local_278 = &PTR_DAT_009cffc8;
          local_270 = (undefined *)0x4;
          local_268 = &local_1c0;
          local_58 = &local_2b0;
          puStack_260 = (undefined *)0x3;
          local_258 = 0;
          pppuStack_50 = (undefined8 ***)&local_278;
          local_48 = &DAT_009ceb90;
          local_358 = &local_58;
          lStack_350 = 1;
          local_288 = param_2;
          local_280 = param_3;
          FUN_00724b8c(PTR_DAT_009fb208,&local_358);
        }
      }
LAB_003a7234:
      FUN_004bb998(&local_1c0);
      local_2a0 = (ulong *)local_2e0;
      puStack_2a8 = (undefined *)lStack_2e8;
      local_2b0 = (undefined8 ****)local_2f0;
      FUN_003cbb2c(&local_278,&local_1c0,&local_2b0);
      FUN_004bb3f4(&local_1b0,&local_278);
      puStack_1b8 = (undefined *)0x1;
      local_1c0 = (undefined8 ***)0x1;
      uVar1 = *puVar2;
      __dest = (void *)FUN_00318628(0x168,8);
      if (__dest == (void *)0x0) {
                    /* WARNING: Subroutine does not return */
        FUN_0019139c(8,0x168);
      }
      memcpy(__dest,&local_1c0,0x168);
      *param_1 = 0;
      param_1[1] = (long)__dest;
      return;
    }
  }
  else {
    local_278 = (undefined **)&local_2f0;
    puStack_2a8 = (undefined *)lStack_350;
    local_2b0 = local_358;
    ppuStack_298 = ppuStack_340;
    local_2a0 = local_348;
    local_270 = PTR_FUN_009facc8;
    local_268 = &local_2b0;
    puStack_260 = PTR_FUN_009faab8;
    local_1c0 = (undefined8 ***)&PTR_DAT_009d0028;
    puStack_1b8 = (undefined *)0x2;
    local_1b0 = (undefined8 ****)&local_278;
    local_1a8 = (undefined *)0x2;
    local_1a0 = (undefined1 *)0x0;
    FUN_0076b8c0(&local_58,&local_1c0);
    uVar1 = *puVar2;
    puVar7 = (ulong *)FUN_00318628(0x18,8);
    if (puVar7 == (ulong *)0x0) {
                    /* WARNING: Subroutine does not return */
      FUN_0019139c(8,0x18);
    }
    puVar7[1] = (ulong)pppuStack_50;
    *puVar7 = (ulong)local_58;
    puVar7[2] = (ulong)local_48;
    FUN_003a2768(&local_2b0);
    ppuStack_340 = &PTR_LAB_009cee70;
  }
  *param_1 = (long)puVar7;
  param_1[1] = (long)ppuStack_340;
  return;
}


