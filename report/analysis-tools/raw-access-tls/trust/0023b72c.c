/* Ghidra static pseudocode; not original source. */

void FUN_0023b72c(undefined8 *param_1,long *param_2,undefined8 param_3)

{
  undefined8 *puVar1;
  byte bVar2;
  undefined4 uVar3;
  int iVar4;
  void *pvVar5;
  undefined1 uVar6;
  long lVar7;
  undefined8 uVar8;
  undefined8 uVar9;
  undefined1 auVar10 [16];
  undefined8 local_1130;
  undefined8 uStack_1128;
  undefined8 local_1120;
  undefined8 uStack_1118;
  undefined8 local_1110;
  undefined8 local_d08;
  undefined8 uStack_d00;
  undefined8 uStack_cf8;
  undefined8 uStack_cf0;
  undefined8 local_ce8;
  undefined1 auStack_ce0 [1024];
  undefined8 local_8e0;
  undefined8 uStack_8d8;
  undefined1 auStack_8d0 [1024];
  undefined8 local_4d0;
  undefined8 uStack_4c8;
  undefined8 local_4c0;
  undefined8 uStack_4b8;
  undefined8 local_4b0;
  long local_4a8;
  undefined8 local_4a0;
  undefined8 local_498;
  undefined8 local_490;
  undefined1 auStack_488 [1064];
  
  bVar2 = *(byte *)(param_2 + 3);
  if (bVar2 < 2) {
    if (bVar2 != 0) {
                    /* WARNING: Subroutine does not return */
      FUN_00191a20(&PTR_DAT_009c3420);
    }
    lVar7 = *param_2;
    auVar10 = FUN_003a7844(lVar7 + 0x1808,*(undefined8 *)(lVar7 + 0x16d8),
                           *(undefined8 *)(lVar7 + 0x16e0),*(undefined2 *)(lVar7 + 0x186c));
    *(undefined1 (*) [16])(param_2 + 1) = auVar10;
  }
  else {
    if (bVar2 != 3) {
                    /* WARNING: Subroutine does not return */
      FUN_00191a54(&PTR_DAT_009c3420);
    }
    auVar10 = *(undefined1 (*) [16])(param_2 + 1);
  }
  (**(code **)(auVar10._8_8_ + 0x18))(&local_4a8,auVar10._0_8_,param_3);
  if (local_4a8 == 3) {
    *param_1 = 2;
    uVar6 = 3;
  }
  else {
    memcpy(&local_d08,auStack_488,0x428);
    pvVar5 = (void *)param_2[1];
    puVar1 = (undefined8 *)param_2[2];
    if ((code *)*puVar1 != (code *)0x0) {
      (*(code *)*puVar1)(pvVar5);
    }
    lVar7 = puVar1[1];
    if (lVar7 != 0) {
      uVar3 = FUN_006212cc(puVar1[2],lVar7);
      FUN_00637bc0(pvVar5,lVar7,uVar3);
    }
    if (local_4a8 == 2) {
      uStack_4c8 = uStack_1128;
      local_4d0 = local_1130;
      uStack_4b8 = uStack_1118;
      local_4c0 = local_1120;
      local_4b0 = local_1110;
      uVar8 = 1;
      uVar9 = local_4a0;
      local_4a0 = 1;
    }
    else {
      lVar7 = *(long *)(*param_2 + 0x17e0);
      memcpy(auStack_488,&local_d08,0x428);
      uVar6 = *PTR_DAT_009faac8;
      iVar4 = FUN_006212cc(1,0x200000);
      if (iVar4 == 0) {
        pvVar5 = malloc(0x200000);
        local_4d0 = local_d08;
        uStack_4c8 = uStack_d00;
        local_4c0 = uStack_cf8;
        uStack_4b8 = uStack_cf0;
        local_4b0 = local_ce8;
      }
      else {
        pvVar5 = (void *)FUN_006341e8(0x200000,iVar4);
        local_4d0 = local_d08;
        uStack_4c8 = uStack_d00;
        local_4c0 = uStack_cf8;
        uStack_4b8 = uStack_cf0;
        local_4b0 = local_ce8;
      }
      if (pvVar5 == (void *)0x0) {
                    /* WARNING: Subroutine does not return */
        FUN_00191384(1,0x200000,&PTR_s__project_rawrs_src_raw_client_rs_009cbe90);
      }
      memcpy(auStack_8d0,auStack_ce0,0x400);
      uVar8 = 0;
      uStack_8d8 = 0;
      local_8e0 = 0;
      uVar9 = local_498;
      local_498 = local_490;
    }
    *param_1 = uVar8;
    param_1[1] = local_4a8;
    param_1[2] = local_4a0;
    param_1[3] = uVar9;
    param_1[4] = local_498;
    param_1[6] = uStack_4c8;
    param_1[5] = local_4d0;
    param_1[8] = uStack_4b8;
    param_1[7] = local_4c0;
    param_1[9] = local_4b0;
    memcpy(param_1 + 10,auStack_8d0,0x400);
    param_1[0x8b] = pvVar5;
    param_1[0x8a] = 0x200000;
    uVar6 = 1;
    param_1[0x8d] = uStack_8d8;
    param_1[0x8c] = local_8e0;
    param_1[0x8e] = lVar7;
    *(undefined4 *)(param_1 + 0x8f) = 0;
  }
  *(undefined1 *)(param_2 + 3) = uVar6;
  return;
}


