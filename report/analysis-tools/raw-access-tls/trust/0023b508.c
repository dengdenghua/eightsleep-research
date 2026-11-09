/* Ghidra static pseudocode; not original source. */

void FUN_0023b508(long *param_1,long *param_2,undefined8 param_3)

{
  undefined8 *puVar1;
  byte bVar2;
  undefined4 uVar3;
  int iVar4;
  void *pvVar5;
  undefined1 uVar6;
  long lVar7;
  void *pvVar8;
  long extraout_x9;
  long extraout_x9_00;
  long extraout_x9_01;
  long lVar9;
  long lVar10;
  void *pvVar11;
  undefined1 auVar12 [16];
  long local_70;
  long local_68;
  void *local_60;
  long local_58;
  
  bVar2 = *(byte *)(param_2 + 3);
  if (bVar2 < 2) {
    if (bVar2 != 0) {
                    /* WARNING: Subroutine does not return */
      FUN_00191a20(&PTR_DAT_009c3420);
    }
    lVar7 = *param_2;
    auVar12 = FUN_003a7400(lVar7 + 0x143e,*(undefined8 *)(lVar7 + 0x12b0),
                           *(undefined8 *)(lVar7 + 0x12b8),*(undefined2 *)(lVar7 + 0x143c));
    *(undefined1 (*) [16])(param_2 + 1) = auVar12;
  }
  else {
    if (bVar2 != 3) {
                    /* WARNING: Subroutine does not return */
      FUN_00191a54(&PTR_DAT_009c3420);
    }
    auVar12 = *(undefined1 (*) [16])(param_2 + 1);
  }
  (**(code **)(auVar12._8_8_ + 0x18))(&local_70,auVar12._0_8_,param_3);
  if (local_70 == 3) {
    uVar6 = 3;
    *param_1 = 3;
  }
  else {
    lVar7 = param_2[1];
    puVar1 = (undefined8 *)param_2[2];
    lVar9 = extraout_x9;
    if ((code *)*puVar1 != (code *)0x0) {
      (*(code *)*puVar1)(lVar7);
      lVar9 = extraout_x9_00;
    }
    lVar10 = puVar1[1];
    if (lVar10 != 0) {
      uVar3 = FUN_006212cc(puVar1[2],lVar10);
      FUN_00637bc0(lVar7,lVar10,uVar3);
      lVar9 = extraout_x9_01;
    }
    if (local_70 == 2) {
      pvVar5 = local_60;
      pvVar8 = (void *)0x1;
      pvVar11 = local_60;
      lVar10 = local_58;
    }
    else {
      lVar7 = *(long *)(*param_2 + 0x13b8);
      uVar6 = *PTR_DAT_009faac8;
      iVar4 = FUN_006212cc(1,0x200000);
      if (iVar4 == 0) {
        pvVar5 = malloc(0x200000);
      }
      else {
        pvVar5 = (void *)FUN_006341e8(0x200000,iVar4);
      }
      if (pvVar5 == (void *)0x0) {
                    /* WARNING: Subroutine does not return */
        FUN_00191384(1,0x200000,&PTR_s__project_rawrs_src_raw_client_rs_009cbe90);
      }
      pvVar11 = (void *)0x200000;
      lVar10 = 0;
      pvVar8 = local_60;
      lVar9 = local_68;
      local_68 = local_58;
    }
    param_1[2] = (long)pvVar8;
    param_1[3] = local_68;
    uVar6 = 1;
    *param_1 = local_70;
    param_1[1] = lVar9;
    param_1[4] = (long)pvVar11;
    param_1[5] = (long)pvVar5;
    param_1[6] = lVar10;
    param_1[7] = 0;
    param_1[8] = lVar7;
    *(undefined4 *)(param_1 + 9) = 0;
  }
  *(undefined1 *)(param_2 + 3) = uVar6;
  return;
}


