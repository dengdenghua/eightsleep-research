/* Reconstructed Ghidra pseudocode, not vendor source. */

void FUN_003cc024(long *param_1,long *param_2,long *param_3)

{
  undefined *puVar1;
  char cVar2;
  char cVar3;
  undefined **ppuVar4;
  long lVar5;
  long lVar6;
  long lVar7;
  long lVar8;
  long lVar9;
  long lVar10;
  long lVar11;
  long lVar12;
  long lVar13;
  long lVar14;
  long lVar15;
  long lVar16;
  long lVar17;
  long lVar18;
  long lVar19;
  long lVar20;
  long lVar21;
  long lVar22;
  long lVar23;
  long lVar24;
  uint uVar25;
  char cVar26;
  long lVar27;
  long lVar28;
  long lVar29;
  undefined **local_1c0;
  long lStack_1b8;
  long local_1b0;
  long lStack_1a8;
  long local_1a0;
  long lStack_198;
  long local_190;
  long lStack_188;
  long local_180;
  long lStack_178;
  long local_170;
  long lStack_168;
  long local_160;
  long lStack_158;
  long local_150;
  long lStack_148;
  long local_140;
  long lStack_138;
  long local_130;
  long lStack_128;
  long local_120;
  long lStack_118;
  undefined **local_110;
  long lStack_108;
  long lStack_100;
  long lStack_f8;
  long local_f0;
  long lStack_e8;
  long lStack_e0;
  long lStack_d8;
  long local_d0;
  long lStack_c8;
  long lStack_c0;
  long lStack_b8;
  long local_b0;
  long lStack_a8;
  long lStack_a0;
  long lStack_98;
  long local_90;
  long lStack_88;
  long lStack_80;
  long lStack_78;
  long local_70;
  long lStack_68;
  char local_58;
  char local_57;
  undefined2 local_54;
  undefined1 local_52;
  
  lVar28 = *param_2;
  if (lVar28 == 0) {
    local_1c0 = &PTR_s_called_after_complete_009d30f8;
    lStack_1b8 = 1;
    lStack_1a8 = 0;
    local_1a0 = 0;
    local_1b0 = 8;
                    /* WARNING: Subroutine does not return */
    FUN_00191564(&local_1c0,&PTR_s__cargo_registry_src_index_crates_009d3108);
  }
  lVar29 = tpidr_el0;
  if (PTR_009fa8a8[lVar29 + 0x48] == '\0') {
    puVar1 = PTR_009fa8a8 + lVar29;
    FUN_0075592c(puVar1,FUN_00390bf4);
    puVar1[0x48] = 1;
LAB_003cc0b4:
    cVar2 = PTR_009fa8a8[lVar29 + 0x44];
    cVar3 = PTR_009fa8a8[lVar29 + 0x45];
    cVar26 = cVar3;
    if (cVar2 != '\x01') {
LAB_003cc0e4:
      local_52 = 0;
      PTR_009fa8a8[lVar29 + 0x45] = cVar26;
      local_54 = 0;
      FUN_00719eb4((ulong)&local_54 | 1);
      local_58 = cVar2;
      local_57 = cVar3;
      goto LAB_003cc110;
    }
    if (cVar3 != '\0') {
      cVar26 = cVar3 + -1;
      goto LAB_003cc0e4;
    }
    lVar29 = -0x7ffffffffffffffe;
    FUN_0071a370(param_3);
    local_52 = 0;
    local_54 = 0;
    FUN_00719eb4((ulong)&local_54 | 1);
  }
  else {
    if (PTR_009fa8a8[lVar29 + 0x48] == '\x01') goto LAB_003cc0b4;
    local_58 = '\0';
    local_57 = '\0';
LAB_003cc110:
    uVar25 = FUN_0070114c(lVar28 + 0x30,2);
    if ((uVar25 >> 1 & 1) == 0) {
      if ((uVar25 >> 2 & 1) != 0) {
        local_58 = '\0';
        lVar29 = -0x7fffffffffffffff;
        FUN_00719eb4(&local_58);
        goto LAB_003cc290;
      }
      if (((uVar25 & 1) == 0) ||
         ((*(long *)(lVar28 + 0x28) == ((long *)*param_3)[1] &&
          (*(long *)(lVar28 + 0x20) == *(long *)*param_3)))) {
LAB_003cc170:
        lVar29 = -0x7ffffffffffffffe;
        if ((uVar25 & 1) == 0) {
          FUN_00701094(lVar28 + 0x20,param_3);
          uVar25 = FUN_007010fc(lVar28 + 0x30);
          if ((uVar25 >> 1 & 1) != 0) goto LAB_003cc194;
        }
      }
      else {
        uVar25 = FUN_00701118(lVar28 + 0x30);
        if ((uVar25 >> 1 & 1) == 0) {
          FUN_00701088(lVar28 + 0x20);
          goto LAB_003cc170;
        }
        FUN_007010fc(lVar28 + 0x30);
        lVar29 = *(long *)(lVar28 + 0x38);
        local_58 = '\0';
        *(undefined8 *)(lVar28 + 0x38) = 0x8000000000000001;
        if (lVar29 != -0x7fffffffffffffff) {
          lStack_88 = *(long *)(lVar28 + 200);
          local_90 = *(long *)(lVar28 + 0xc0);
          lStack_78 = *(long *)(lVar28 + 0xd8);
          lStack_80 = *(long *)(lVar28 + 0xd0);
          lStack_68 = *(long *)(lVar28 + 0xe8);
          local_70 = *(long *)(lVar28 + 0xe0);
          lStack_c8 = *(long *)(lVar28 + 0x88);
          local_d0 = *(long *)(lVar28 + 0x80);
          lStack_b8 = *(long *)(lVar28 + 0x98);
          lStack_c0 = *(long *)(lVar28 + 0x90);
          goto LAB_003cc1c4;
        }
      }
    }
    else {
LAB_003cc194:
      lVar27 = *(long *)(lVar28 + 0x38);
      lVar29 = -0x7fffffffffffffff;
      local_58 = '\0';
      *(undefined8 *)(lVar28 + 0x38) = 0x8000000000000001;
      if (lVar27 != -0x7fffffffffffffff) {
        lStack_88 = *(long *)(lVar28 + 200);
        local_90 = *(long *)(lVar28 + 0xc0);
        lStack_78 = *(long *)(lVar28 + 0xd8);
        lStack_80 = *(long *)(lVar28 + 0xd0);
        lStack_68 = *(long *)(lVar28 + 0xe8);
        local_70 = *(long *)(lVar28 + 0xe0);
        lStack_c8 = *(long *)(lVar28 + 0x88);
        local_d0 = *(long *)(lVar28 + 0x80);
        lStack_b8 = *(long *)(lVar28 + 0x98);
        lStack_c0 = *(long *)(lVar28 + 0x90);
        lVar29 = lVar27;
LAB_003cc1c4:
        local_58 = '\0';
        lStack_a8 = *(long *)(lVar28 + 0xa8);
        local_b0 = *(long *)(lVar28 + 0xa0);
        lStack_98 = *(long *)(lVar28 + 0xb8);
        lStack_a0 = *(long *)(lVar28 + 0xb0);
        lStack_108 = *(long *)(lVar28 + 0x48);
        local_110 = *(undefined ***)(lVar28 + 0x40);
        lStack_f8 = *(long *)(lVar28 + 0x58);
        lStack_100 = *(long *)(lVar28 + 0x50);
        lStack_e8 = *(long *)(lVar28 + 0x68);
        local_f0 = *(long *)(lVar28 + 0x60);
        lStack_d8 = *(long *)(lVar28 + 0x78);
        lStack_e0 = *(long *)(lVar28 + 0x70);
      }
    }
    FUN_00719eb4(&local_58);
    if (lVar29 == -0x7fffffffffffffff) goto LAB_003cc290;
  }
  if (lVar29 == -0x7ffffffffffffffe) {
    *param_1 = -0x7ffffffffffffffe;
    return;
  }
  lStack_118 = lStack_68;
  local_120 = local_70;
  lStack_138 = lStack_88;
  local_140 = local_90;
  lStack_128 = lStack_78;
  local_130 = lStack_80;
  lStack_178 = lStack_c8;
  local_180 = local_d0;
  lStack_168 = lStack_b8;
  local_170 = lStack_c0;
  lStack_158 = lStack_a8;
  local_160 = local_b0;
  lStack_148 = lStack_98;
  local_150 = lStack_a0;
  lStack_1b8 = lStack_108;
  local_1c0 = local_110;
  lStack_1a8 = lStack_f8;
  local_1b0 = lStack_100;
  lStack_198 = lStack_e8;
  local_1a0 = local_f0;
  lStack_188 = lStack_d8;
  local_190 = lStack_e0;
LAB_003cc290:
  lVar24 = lStack_118;
  lVar23 = local_120;
  lVar22 = lStack_128;
  lVar21 = local_130;
  lVar20 = lStack_138;
  lVar19 = local_140;
  lVar18 = lStack_148;
  lVar17 = local_150;
  lVar16 = lStack_158;
  lVar15 = local_160;
  lVar14 = lStack_168;
  lVar13 = local_170;
  lVar12 = lStack_178;
  lVar11 = local_180;
  lVar10 = lStack_188;
  lVar9 = local_190;
  lVar8 = lStack_198;
  lVar7 = local_1a0;
  lVar6 = lStack_1a8;
  lVar5 = local_1b0;
  lVar27 = lStack_1b8;
  ppuVar4 = local_1c0;
  lVar28 = FUN_0077c930(0xffffffffffffffff,lVar28);
  if (lVar28 == 1) {
    DataMemoryBarrier(2,1);
    FUN_0044bb64(param_2);
  }
  *param_2 = 0;
  param_1[0x11] = lVar19;
  param_1[0x10] = lVar18;
  param_1[0x13] = lVar21;
  param_1[0x12] = lVar20;
  param_1[0x15] = lVar23;
  param_1[0x14] = lVar22;
  param_1[9] = lVar11;
  param_1[8] = lVar10;
  param_1[0xb] = lVar13;
  param_1[10] = lVar12;
  param_1[0x16] = lVar24;
  param_1[0xd] = lVar15;
  param_1[0xc] = lVar14;
  param_1[0xf] = lVar17;
  param_1[0xe] = lVar16;
  param_1[1] = (long)ppuVar4;
  *param_1 = lVar29;
  param_1[3] = lVar5;
  param_1[2] = lVar27;
  param_1[5] = lVar7;
  param_1[4] = lVar6;
  param_1[7] = lVar9;
  param_1[6] = lVar8;
  return;
}


