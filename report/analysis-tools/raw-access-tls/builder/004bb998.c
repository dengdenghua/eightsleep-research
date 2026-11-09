/* Reconstructed Ghidra pseudocode, not vendor source. */

void FUN_004bb998(long *param_1)

{
  undefined1 uVar1;
  code *pcVar2;
  long *plVar3;
  long lVar4;
  long local_118;
  long lStack_110;
  long local_108;
  long lStack_100;
  long local_f8;
  long lStack_f0;
  long local_e8;
  long lStack_e0;
  long local_d8;
  long lStack_d0;
  long local_c8;
  long lStack_c0;
  long local_b8;
  long lStack_b0;
  long local_a8;
  long lStack_a0;
  long local_98;
  long lStack_90;
  long local_88;
  long lStack_80;
  long local_78;
  long local_70;
  undefined8 *puStack_68;
  undefined *local_60;
  long lStack_58;
  long local_50;
  long lStack_48;
  long lStack_40;
  long lStack_38;
  
  plVar3 = (long *)FUN_0049702c();
  lVar4 = FUN_0077c8d0(1,*plVar3);
  if (-1 < lVar4) {
    lVar4 = *plVar3;
    uVar1 = *PTR_DAT_009faac8;
    local_118 = lVar4;
    puStack_68 = (undefined8 *)FUN_00318628(0x10,8);
    if (puStack_68 == (undefined8 *)0x0) {
                    /* WARNING: Subroutine does not return */
      FUN_0019139c(8,0x10);
    }
    local_60 = &DAT_009e27c0;
    puStack_68[1] = 1;
    *puStack_68 = 1;
    local_70 = lVar4;
    FUN_004bab44(&local_118,&local_70,&PTR_DAT_009e2698,2);
    if (local_118 != -0x7ffffffffffffffd) {
      param_1[0x11] = lStack_90;
      param_1[0x10] = local_98;
      param_1[0x13] = lStack_80;
      param_1[0x12] = local_88;
      param_1[0x14] = local_78;
      param_1[9] = lStack_d0;
      param_1[8] = local_d8;
      param_1[0xb] = lStack_c0;
      param_1[10] = local_c8;
      param_1[0xd] = lStack_b0;
      param_1[0xc] = local_b8;
      param_1[0xf] = lStack_a0;
      param_1[0xe] = local_a8;
      param_1[1] = lStack_110;
      *param_1 = local_118;
      param_1[3] = lStack_100;
      param_1[2] = local_108;
      param_1[5] = lStack_f0;
      param_1[4] = local_f8;
      param_1[7] = lStack_e0;
      param_1[6] = local_e8;
      return;
    }
    puStack_68 = (undefined8 *)local_108;
    local_70 = lStack_110;
    lStack_58 = local_f8;
    local_60 = (undefined *)lStack_100;
    lStack_48 = local_e8;
    local_50 = lStack_f0;
    lStack_38 = local_d8;
    lStack_40 = lStack_e0;
    FUN_00191874(&BYTE_007a59a9,0x2b,&local_70,&PTR_FUN_009e2570,&PTR_DAT_009e27a8);
  }
                    /* WARNING: Does not return */
  pcVar2 = (code *)SoftwareBreakpoint(1,0x4bbae4);
  (*pcVar2)();
}


