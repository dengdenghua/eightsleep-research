/* Reconstructed Ghidra pseudocode, not vendor source. */

undefined8 FUN_0027d50c(long param_1,long param_2,ulong param_3,uint param_4)

{
  void *pvVar1;
  code *pcVar2;
  char cVar3;
  int iVar4;
  undefined8 uVar5;
  ulong uVar6;
  ulong uVar7;
  ulong uVar8;
  size_t __n;
  ulong uVar9;
  long lVar10;
  long lVar11;
  ulong uVar12;
  undefined8 local_d0;
  undefined8 uStack_c8;
  undefined8 local_c0;
  undefined8 local_b8;
  undefined8 uStack_b0;
  undefined8 local_a8;
  undefined8 auStack_a0 [2];
  undefined8 local_90;
  undefined8 local_80;
  undefined1 local_78;
  undefined8 *local_70;
  undefined **ppuStack_68;
  
  uVar6 = param_3 >> 3;
  uVar8 = *(ulong *)(param_1 + 0x458);
  if (uVar6 < 0x1001) {
    uVar6 = 0x1000;
  }
  __n = uVar6 - 1;
  if ((param_4 & 0xff) == 2) {
    uVar9 = 0;
    do {
      uVar7 = uVar8;
      if (*(long *)(param_1 + 0x448) - uVar8 < uVar6) {
        FUN_00172ac4(param_1 + 0x448,uVar8,uVar6,1,1);
        uVar7 = *(ulong *)(param_1 + 0x458);
      }
      pvVar1 = (void *)(*(long *)(param_1 + 0x450) + uVar7);
      memset(pvVar1,0,__n);
      uVar7 = uVar7 + uVar6;
      *(undefined1 *)((long)pvVar1 + __n) = 0;
      *(ulong *)(param_1 + 0x458) = uVar7;
      if (param_3 < uVar9) goto LAB_0027d79c;
      if (uVar7 < uVar8) goto LAB_0027d78c;
      lVar10 = *(long *)(param_1 + 0x468);
      lVar11 = *(long *)(param_1 + 0x470);
      cVar3 = FUN_00433f48(param_1 + 0x460,param_2 + uVar9,param_3 - uVar9,
                           *(long *)(param_1 + 0x450) + uVar8,uVar7 - uVar8,2);
      if (cVar3 == '\x03') goto LAB_0027d704;
      uVar7 = *(long *)(param_1 + 0x470) - lVar11;
      uVar12 = uVar7 + uVar8;
      uVar8 = *(ulong *)(param_1 + 0x458);
      if (uVar12 <= *(ulong *)(param_1 + 0x458)) {
        *(ulong *)(param_1 + 0x458) = uVar12;
        uVar8 = uVar12;
      }
      uVar9 = (*(long *)(param_1 + 0x468) - lVar10) + uVar9;
    } while ((uVar9 < param_3) || (uVar7 == uVar6));
  }
  else {
    uVar9 = (ulong)param_4;
    uVar12 = 0;
    do {
      uVar7 = uVar8;
      if (*(long *)(param_1 + 0x448) - uVar8 < uVar6) {
        FUN_00172ac4(param_1 + 0x448,uVar8,uVar6,1,1);
        uVar7 = *(ulong *)(param_1 + 0x458);
      }
      pvVar1 = (void *)(*(long *)(param_1 + 0x450) + uVar7);
      memset(pvVar1,0,__n);
      uVar7 = uVar7 + uVar6;
      *(undefined1 *)((long)pvVar1 + __n) = 0;
      *(ulong *)(param_1 + 0x458) = uVar7;
      if (uVar7 < uVar8) goto LAB_0027d78c;
      lVar10 = *(long *)(param_1 + 0x468);
      lVar11 = *(long *)(param_1 + 0x470);
      cVar3 = FUN_00433f48(param_1 + 0x460,param_2 + uVar12,param_3 - uVar12,
                           *(long *)(param_1 + 0x450) + uVar8,uVar7 - uVar8,uVar9);
      if (cVar3 == '\x03') goto LAB_0027d704;
      uVar7 = (*(long *)(param_1 + 0x470) - lVar11) + uVar8;
      uVar8 = *(ulong *)(param_1 + 0x458);
      if (uVar7 <= *(ulong *)(param_1 + 0x458)) {
        *(ulong *)(param_1 + 0x458) = uVar7;
        uVar8 = uVar7;
      }
      uVar12 = (*(long *)(param_1 + 0x468) - lVar10) + uVar12;
    } while (uVar12 < param_3);
  }
  return 0;
LAB_0027d704:
  local_b8 = 0;
  uStack_b0 = 1;
  local_a8 = 0;
  auStack_a0[0] = 0;
  local_78 = 3;
  local_70 = &local_b8;
  local_90 = 0;
  local_80 = DAT_0077e1d8;
  ppuStack_68 = &PTR_FUN_009c3c88;
  iVar4 = FUN_00433f2c(&local_d0,auStack_a0);
  if (iVar4 == 0) {
    uStack_c8 = uStack_b0;
    local_d0 = local_b8;
    local_c0 = local_a8;
    uVar5 = FUN_004c2fb0(0x28,&local_d0);
    return uVar5;
  }
  goto LAB_0027d7b0;
LAB_0027d78c:
  FUN_00191908(uVar8,uVar7,&PTR_s__project_rawrs_src_raw_deflate_r_009c3d40);
LAB_0027d79c:
  FUN_00191908(uVar9,param_3,&PTR_s__project_rawrs_src_raw_deflate_r_009c3d58);
LAB_0027d7b0:
  FUN_00191874("a Display implementation returned an error unexpectedly",0x37,&local_d0,
               &DAT_009c3cd0,&PTR_s__rust_lib_rustlib_src_rust_libra_009c3cb8);
                    /* WARNING: Does not return */
  pcVar2 = (code *)SoftwareBreakpoint(1,0x27d7d8);
  (*pcVar2)();
}


