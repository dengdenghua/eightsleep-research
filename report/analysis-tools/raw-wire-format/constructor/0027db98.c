/* Reconstructed Ghidra pseudocode, not vendor source. */

void FUN_0027db98(void *param_1,void *param_2)

{
  undefined1 uVar1;
  int iVar2;
  void *pvVar3;
  undefined8 local_480 [137];
  undefined8 local_38;
  undefined8 uStack_30;
  undefined8 local_28;
  
  local_480[0] = 0;
  memcpy(local_480,param_2,0x448);
  FUN_00433f24(&local_38,6,0);
  uVar1 = *PTR_DAT_009faac8;
  iVar2 = FUN_006212cc(1,0x8000);
  if (iVar2 == 0) {
    pvVar3 = malloc(0x8000);
  }
  else {
    pvVar3 = (void *)FUN_006341e8(0x8000,iVar2);
  }
  if (pvVar3 != (void *)0x0) {
    memcpy(param_1,local_480,0x448);
    *(void **)((long)param_1 + 0x450) = pvVar3;
    *(undefined8 *)((long)param_1 + 0x458) = 0;
    *(undefined8 *)((long)param_1 + 0x448) = 0x8000;
    *(undefined8 *)((long)param_1 + 0x468) = uStack_30;
    *(undefined8 *)((long)param_1 + 0x460) = local_38;
    *(undefined8 *)((long)param_1 + 0x470) = local_28;
    *(undefined8 *)((long)param_1 + 0x478) = 0;
    *(undefined1 *)((long)param_1 + 0x480) = 0;
    return;
  }
                    /* WARNING: Subroutine does not return */
  FUN_00191384(1,0x8000,&PTR_s__project_rawrs_src_raw_deflate_r_009c3d70);
}


