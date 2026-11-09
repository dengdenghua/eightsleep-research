/* Reconstructed Ghidra pseudocode, not vendor source. */

void FUN_003a78d8(undefined8 *param_1,long *param_2,undefined8 param_3)

{
  byte bVar1;
  undefined5 uVar2;
  undefined4 uVar3;
  undefined8 *puVar4;
  code *pcVar5;
  char cVar6;
  long lVar7;
  undefined8 **ppuVar8;
  undefined8 **ppuVar9;
  ulong uVar10;
  long lVar11;
  undefined1 uVar12;
  long **pplVar13;
  undefined **unaff_x23;
  long lVar14;
  void *__src;
  undefined8 uVar15;
  undefined1 auStack_1e48 [1072];
  undefined4 local_1a18;
  undefined2 local_1a14;
  undefined8 **local_1a10;
  undefined8 **local_1a08;
  long **local_1a00;
  undefined1 auStack_19f8 [1072];
  undefined8 local_15c8;
  undefined8 **local_15c0;
  long **pplStack_15b8;
  long lStack_15b0;
  undefined8 local_15a8;
  undefined8 *local_1180;
  undefined8 *puStack_1178;
  undefined *local_1170;
  long lStack_1168;
  undefined8 local_1060;
  undefined1 auStack_d48 [1072];
  long *local_918;
  undefined *local_910;
  undefined1 auStack_908 [1072];
  undefined8 local_4d8;
  undefined8 **local_4d0;
  long **pplStack_4c8;
  undefined8 *local_4c0;
  long lStack_4b8;
  undefined8 local_4b0;
  undefined8 **local_90;
  long **pplStack_88;
  undefined8 *local_80;
  long lStack_78;
  undefined8 local_70;
  
  local_1060 = 0;
  bVar1 = *(byte *)((long)param_2 + 100);
  if (bVar1 < 3) {
    if (bVar1 != 0) {
      if (bVar1 == 1) {
                    /* WARNING: Subroutine does not return */
        FUN_00191a20();
      }
                    /* WARNING: Subroutine does not return */
      FUN_00191a54(&PTR_DAT_009d0270);
    }
    *(undefined2 *)((long)param_2 + 0x62) = 0;
    lVar11 = param_2[0xc];
    lVar14 = *(long *)param_2[0xb];
    lVar7 = FUN_0077c8d0(1,lVar14);
    if (lVar7 < 0) {
                    /* WARNING: Does not return */
      pcVar5 = (code *)SoftwareBreakpoint(1,0x3a7fbc);
      (*pcVar5)();
    }
    pplVar13 = (long **)param_2[9];
    param_2[10] = lVar14;
    if ((long)pplVar13 < 0) {
      uVar15 = 0;
LAB_003a7f58:
                    /* WARNING: Subroutine does not return */
      FUN_00191384(uVar15,pplVar13,&PTR_DAT_009cec98);
    }
    __src = (void *)param_2[8];
    if (pplVar13 == (long **)0x0) {
      ppuVar8 = (undefined8 **)0x1;
    }
    else {
      uVar15 = 1;
      uVar12 = *PTR_DAT_009faac8;
      ppuVar8 = (undefined8 **)FUN_00318628(pplVar13,1);
      if (ppuVar8 == (undefined8 **)0x0) goto LAB_003a7f58;
    }
    memcpy(ppuVar8,__src,(size_t)pplVar13);
    local_15c8 = pplVar13;
    local_15c0 = ppuVar8;
    pplStack_15b8 = pplVar13;
    FUN_00604b48(&local_4d8,&local_15c8);
    if ((char)local_4d8 != '\x02') {
      uVar3 = local_4d8._4_4_;
      *(char *)(param_2 + 0x22) = (char)local_4d8;
      *(short *)(param_2 + 0xf) = (short)lVar11;
      uVar2 = CONCAT14(local_15c8._7_1_,uVar3);
      local_15c8 = (long **)CONCAT44((int)((uint5)uVar2 >> 8),local_4d8._1_4_);
      *(undefined1 *)((long)param_2 + 99) = 1;
      *(undefined4 *)((long)param_2 + 0x111) = local_4d8._1_4_;
      *(undefined4 *)((long)param_2 + 0x114) = local_15c8._3_4_;
      param_2[0x25] = (long)local_4c0;
      param_2[0x24] = (long)pplStack_4c8;
      param_2[0x23] = (long)local_4d0;
      *(undefined1 *)((long)param_2 + 0x82) = 0;
      param_2[0xd] = param_2[8];
      param_2[0xe] = param_2[9];
      goto LAB_003a7a78;
    }
    unaff_x23 = (undefined **)&UNK_009d02b0;
    ppuVar8 = (undefined8 **)0x1;
LAB_003a7e44:
    *(undefined1 *)((long)param_2 + 99) = 0;
    lVar11 = FUN_0077c930(0xffffffffffffffff,param_2[10]);
    if (lVar11 == 1) {
      DataMemoryBarrier(2,1);
      FUN_004b7ab4(param_2 + 10);
    }
    ppuVar9 = (undefined8 **)0x2;
  }
  else {
    if (bVar1 == 3) {
LAB_003a7a78:
      FUN_003a4758(&local_4d8,param_2 + 0xd,param_3);
      puVar4 = local_4c0;
      pplVar13 = pplStack_4c8;
      ppuVar9 = local_4d0;
      ppuVar8 = (undefined8 **)local_4d8;
      if ((undefined8 **)local_4d8 == (undefined8 **)0x3) {
        uVar12 = 3;
        *param_1 = 3;
        goto LAB_003a7e90;
      }
      FUN_003a0c78(param_2 + 0xd);
      if (ppuVar8 != (undefined8 **)0x2) {
        *param_2 = (long)ppuVar8;
        *(undefined1 *)((long)param_2 + 0x62) = 1;
        param_2[2] = (long)pplVar13;
        param_2[1] = (long)ppuVar9;
        param_2[3] = (long)puVar4;
        ppuVar9 = (undefined8 **)FUN_00707314(param_2,1);
        if (ppuVar9 == (undefined8 **)0x0) {
          ppuVar8 = (undefined8 **)FUN_003a6290(param_2);
          if (ppuVar8 == (undefined8 **)0x0) {
            FUN_00707224(&local_4d8,param_2);
            FUN_003a4038(&local_15c8,&local_4d8);
            if ((short)local_15c8 != 2) {
              *(short *)(param_2 + 4) = (short)local_15c8;
              param_2[6] = (long)pplStack_15b8;
              param_2[5] = (long)local_15c0;
              pplStack_88 = (long **)param_2[0x23];
              local_90 = (undefined8 **)param_2[0x22];
              lStack_78 = param_2[0x25];
              local_80 = (undefined8 *)param_2[0x24];
              local_1a18 = local_15c8._2_4_;
              local_1a14 = local_15c8._6_2_;
              puStack_1178 = (undefined8 *)param_2[1];
              local_1180 = (undefined8 *)*param_2;
              lStack_1168 = param_2[3];
              local_1170 = (undefined *)param_2[2];
              *(undefined4 *)((long)param_2 + 0x22) = local_15c8._2_4_;
              *(undefined2 *)((long)param_2 + 0x26) = local_15c8._6_2_;
              param_2[7] = lStack_15b0;
              *(undefined2 *)((long)param_2 + 0x62) = 0;
              FUN_003b89cc(&local_4d8,param_2 + 10,&local_90,&local_1180);
              memcpy(&local_15c8,&local_4d8,0x448);
              memcpy(param_2 + 0xd,&local_15c8,0x448);
              unaff_x23 = (undefined **)0x0;
              goto LAB_003a7938;
            }
            bVar1 = *(byte *)((long)param_2 + 0x62);
            unaff_x23 = (undefined **)pplStack_15b8;
            ppuVar8 = local_15c0;
            goto joined_r0x003a7dac;
          }
          bVar1 = *(byte *)((long)param_2 + 0x62);
        }
        else {
          uVar12 = *PTR_DAT_009faac8;
          local_4d8 = (undefined **)ppuVar9;
          ppuVar8 = (undefined8 **)FUN_00318628(8,8);
          if (ppuVar8 == (undefined8 **)0x0) {
                    /* WARNING: Subroutine does not return */
            FUN_0019139c(8,8);
          }
          *ppuVar8 = ppuVar9;
          bVar1 = *(byte *)((long)param_2 + 0x62);
        }
        unaff_x23 = &PTR_FUN_009cfee0;
        goto joined_r0x003a7dac;
      }
      local_4d8 = (undefined **)ppuVar9;
      uVar12 = *PTR_DAT_009faac8;
      ppuVar8 = (undefined8 **)FUN_00318628(8,8);
      if (ppuVar8 == (undefined8 **)0x0) {
                    /* WARNING: Subroutine does not return */
        FUN_0019139c(8,8);
      }
      unaff_x23 = &PTR_FUN_009cfee0;
      *ppuVar8 = ppuVar9;
LAB_003a7e10:
      *(undefined1 *)((long)param_2 + 0x62) = 0;
      if (((((*(byte *)((long)param_2 + 99) & 1) != 0) && ((*(byte *)(param_2 + 0x22) & 1) == 0)) &&
          (lVar11 = param_2[0x23], lVar11 != -0x8000000000000000)) && (lVar11 != 0)) {
        FUN_0031865c(param_2[0x24],lVar11,1);
      }
      goto LAB_003a7e44;
    }
LAB_003a7938:
    FUN_003cc4a8(&local_4d8,param_2 + 0xd,param_3);
    pplVar13 = pplStack_4c8;
    ppuVar8 = local_4d0;
    ppuVar9 = (undefined8 **)local_4d8;
    if ((undefined8 **)local_4d8 == (undefined8 **)0x2) {
      pplStack_88 = pplStack_4c8;
      local_90 = local_4d0;
      lStack_78 = lStack_4b8;
      local_80 = local_4c0;
      local_70 = local_4b0;
      FUN_003bfd98((ulong)&local_90 | 8);
      if ((int)local_70 != -1) {
        close((int)local_70);
      }
      FUN_003a2fa8((ulong)&local_90 | 8);
    }
    else {
      if ((undefined8 **)local_4d8 == (undefined8 **)0x3) {
        *param_1 = 3;
        uVar12 = 4;
        goto LAB_003a7e90;
      }
      memcpy(&local_1180,&local_4c0,0x430);
      unaff_x23 = (undefined **)pplVar13;
    }
    memcpy(auStack_d48,&local_1180,0x430);
    FUN_003a34f4(param_2 + 0xd);
    if (ppuVar9 == (undefined8 **)0x2) {
      local_4d8 = (undefined **)ppuVar8;
      uVar12 = *PTR_DAT_009faac8;
      ppuVar9 = (undefined8 **)FUN_00318628(8,8);
      if (ppuVar9 == (undefined8 **)0x0) {
                    /* WARNING: Subroutine does not return */
        FUN_0019139c(8,8);
      }
      *ppuVar9 = ppuVar8;
      unaff_x23 = &PTR_FUN_009cfee0;
      bVar1 = *(byte *)((long)param_2 + 0x62);
      ppuVar8 = ppuVar9;
joined_r0x003a7dac:
      if ((bVar1 & 1) != 0) {
        FUN_003bfd98(param_2);
        if ((int)param_2[3] != -1) {
          close((int)param_2[3]);
        }
        FUN_003a2fa8(param_2);
      }
      goto LAB_003a7e10;
    }
    memcpy(auStack_19f8,auStack_d48,0x430);
    local_1a10 = ppuVar9;
    local_1a08 = ppuVar8;
    local_1a00 = (long **)unaff_x23;
    if (((*(ulong *)PTR_DAT_009fac58 < 3) &&
        ((DAT_009fb200 - 1 < 2 ||
         ((DAT_009fb200 != 0 && (cVar6 = FUN_0018fb0c(&PTR_DAT_009fb1f0), cVar6 != '\0')))))) &&
       (uVar10 = FUN_007243f8(PTR_DAT_009fb1f0), (uVar10 & 1) != 0)) {
      if (*(undefined8 ***)(PTR_DAT_009fb1f0 + 0x38) == (undefined8 **)0x0) {
                    /* WARNING: Subroutine does not return */
        FUN_0019151c(&DAT_0078c24b,0x22,&PTR_DAT_009d0288);
      }
      lStack_15b0 = *(long *)(PTR_DAT_009fb1f0 + 0x48);
      pplStack_15b8 = *(long ***)(PTR_DAT_009fb1f0 + 0x40);
      local_80 = (undefined8 *)(PTR_DAT_009fb1f0 + 0x30);
      local_15c8 = (long **)*local_80;
      local_15a8 = 0;
      local_918 = param_2 + 4;
      local_4d8 = &PTR_DAT_009d02a0;
      puStack_1178 = &local_4d8;
      pplStack_4c8 = &local_918;
      local_910 = PTR_FUN_009faee8;
      local_1180 = &local_15c8;
      local_1170 = &DAT_009ceb90;
      local_90 = &local_1180;
      local_4d0 = (undefined8 **)0x1;
      lStack_4b8 = 0;
      local_4c0 = (undefined8 *)0x1;
      pplStack_88 = (long **)0x1;
      local_15c0 = *(undefined8 ***)(PTR_DAT_009fb1f0 + 0x38);
      FUN_00724b8c(PTR_DAT_009fb1f0,&local_90);
    }
    memcpy(auStack_1e48,auStack_19f8,0x430);
    *(undefined2 *)((long)param_2 + 0x62) = 0;
    lVar11 = FUN_0077c930(0xffffffffffffffff,param_2[10]);
    if (lVar11 == 1) {
      DataMemoryBarrier(2,1);
      FUN_004b7ab4(param_2 + 10);
    }
    memcpy(auStack_908,auStack_1e48,0x430);
  }
  *param_1 = ppuVar9;
  param_1[1] = ppuVar8;
  param_1[2] = unaff_x23;
  memcpy(param_1 + 3,auStack_908,0x430);
  uVar12 = 1;
LAB_003a7e90:
  *(undefined1 *)((long)param_2 + 100) = uVar12;
  return;
}


