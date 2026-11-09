/* Reconstructed Ghidra pseudocode, not vendor source. */

void FUN_0051009c(long *param_1,long param_2,byte *param_3)

{
  byte *pbVar1;
  long lVar2;
  long lVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  ushort uVar6;
  long lVar7;
  uint uVar8;
  long lVar9;
  long lVar10;
  long local_c0;
  long local_b8;
  long local_b0;
  long local_a0;
  long lStack_98;
  long local_90;
  undefined8 local_88;
  undefined8 local_80;
  long local_78;
  long local_70;
  long local_68;
  long lStack_60;
  long local_58;
  
  if ((*param_3 & 1) == 0) {
    FUN_0050e3b8(param_1,param_3 + 8);
    return;
  }
  lVar2 = *(long *)(param_2 + 0xd8);
  lVar3 = *(long *)(param_2 + 0xe0);
  local_b0 = 0;
  lVar10 = 0x10;
  if (param_3[1] == 0) {
    lVar10 = 4;
  }
  local_c0 = lVar2;
  local_b8 = lVar3;
  if (lVar2 != 0) {
    do {
      if (local_b0 == local_b8) break;
      FUN_00514494(&local_88,&local_c0);
      if (local_88 != -0x7fffffffffffffce) {
        uVar8 = local_80._4_4_;
        local_90 = local_58;
        lStack_98 = lStack_60;
        local_a0 = local_68;
        lVar10 = local_88;
        local_88 = CONCAT44(uVar8 >> 8,local_80._1_4_);
LAB_00510218:
        uVar4 = (undefined4)local_88;
        *(char *)(param_1 + 1) = (char)local_80;
        param_1[2] = local_78;
        param_1[3] = local_70;
        *param_1 = lVar10;
        *(undefined4 *)((long)param_1 + 9) = uVar4;
        *(undefined4 *)((long)param_1 + 0xc) = local_88._3_4_;
        param_1[5] = lStack_98;
        param_1[4] = local_a0;
        param_1[6] = local_90;
        return;
      }
      if (((char)local_80 == '\x02') && (local_70 == lVar10)) {
        lVar9 = 0;
        do {
          if (lVar10 == lVar9) {
            local_80._0_1_ = '\x02';
            local_70 = lVar10;
            lVar10 = -0x7fffffffffffffce;
            goto LAB_00510218;
          }
          pbVar1 = (byte *)(local_78 + lVar9);
          lVar7 = lVar9 + 2;
          lVar9 = lVar9 + 1;
        } while (*pbVar1 == param_3[lVar7]);
      }
    } while (local_c0 != 0);
  }
  lVar10 = *(long *)(param_3 + 8);
  uVar6 = *(ushort *)(param_3 + 0x10);
  local_78 = 0;
  local_88 = lVar2;
  local_80 = lVar3;
  FUN_00518590(param_1,&local_88,&PTR_s__rust_lib_rustlib_src_rust_libra_009e7cc8);
  uVar4 = *(undefined4 *)(param_3 + 1);
  uVar5 = *(undefined4 *)(param_3 + 4);
  *(undefined1 *)(param_1 + 3) = 1;
  *(undefined4 *)((long)param_1 + 0x19) = uVar4;
  *(undefined4 *)((long)param_1 + 0x1c) = uVar5;
  param_1[4] = lVar10;
  param_1[5] = (ulong)uVar6;
  return;
}


