/* Reconstructed Ghidra pseudocode, not vendor source. */

void FUN_00438384(uint *param_1,long param_2,long param_3,ulong param_4,long param_5,ulong param_6,
                 int param_7)

{
  byte *pbVar1;
  byte *pbVar2;
  byte *pbVar3;
  byte bVar4;
  ushort *puVar5;
  uint uVar6;
  undefined **ppuVar7;
  uint uVar8;
  ulong uVar9;
  long lVar10;
  byte *pbVar11;
  ulong extraout_x8;
  ulong uVar12;
  ulong uVar13;
  uint uVar14;
  uint uVar15;
  uint uVar16;
  uint uVar17;
  uint uVar18;
  uint uVar19;
  uint uVar20;
  uint uVar21;
  ulong uVar22;
  long lVar23;
  long lVar24;
  long lVar25;
  undefined1 auVar26 [16];
  ulong local_b0;
  uint local_a8;
  ulong local_a0;
  undefined8 local_98;
  long lStack_90;
  ulong local_88;
  long local_80;
  ulong uStack_78;
  undefined8 local_70;
  undefined8 uStack_68;
  
  if (param_6 == 0) {
    *(undefined8 *)param_1 = DAT_00797170;
    param_1[4] = 0;
    param_1[5] = 0;
    param_1[2] = 0;
    param_1[3] = 0;
  }
  else if (*(int *)(param_2 + 0x100a4) == 1) {
    param_1[2] = 0;
    param_1[3] = 0;
    param_1[4] = 0;
    param_1[5] = 0;
    if (param_7 == 4) {
      *(undefined8 *)param_1 = DAT_00784100;
    }
    else {
      *(undefined8 *)param_1 = DAT_00797170;
    }
  }
  else {
    if (param_7 == 4) {
      lVar24 = 0;
      lVar25 = 0;
LAB_00438420:
      local_70 = 0;
      uStack_68 = 0;
      local_98 = 1;
      lStack_90 = param_5;
      local_88 = param_6;
      local_80 = param_3;
      uStack_78 = param_4;
      FUN_004369a8(&local_b0,param_2,&local_98,4);
      if (param_4 < local_b0) {
LAB_004385b4:
        FUN_00191908(local_b0,param_4,&PTR_s__cargo_registry_src_index_crates_009d9cc8);
        local_a0 = extraout_x8;
      }
      else if (local_a0 <= param_6) {
        lVar24 = local_b0 + lVar24;
        lVar25 = local_a0 + lVar25;
        if (local_a8 == 0) goto code_r0x0043846c;
        if (local_a8 == 0xfffffffe) {
LAB_00438560:
          uVar8 = 1;
          local_a8 = 0xffffd8f0;
        }
        else {
joined_r0x00438554:
          if (local_a8 == 0xffffffff) {
            uVar8 = 1;
            local_a8 = 0xfffffffe;
          }
          else {
            uVar8 = 0;
          }
        }
        goto LAB_00438568;
      }
LAB_004385c4:
      ppuVar7 = &PTR_s__cargo_registry_src_index_crates_009d9cb0;
      auVar26 = FUN_00191908(local_a0,param_6);
      lVar24 = auVar26._8_8_;
      puVar5 = auVar26._0_8_;
      uVar8 = (uint)puVar5[1];
      uVar13 = (ulong)ppuVar7 & 0xfffffffffffffffc;
      uVar9 = ((ulong)ppuVar7 / 0x56c0) * 0x56c0;
      lVar25 = uVar13 + ((ulong)ppuVar7 / 0x56c0) * -0x56c0;
      uVar12 = (ulong)ppuVar7 & 3;
      uVar14 = (uint)*puVar5;
      if (uVar9 >> 6 < 0x15b) {
        uVar20 = 0;
        uVar21 = 0;
        uVar17 = 0;
        uVar15 = 0;
        uVar16 = 0;
        uVar19 = 0;
        uVar6 = 0;
        uVar18 = 0;
      }
      else {
        uVar17 = 0;
        uVar21 = 0;
        uVar20 = 0;
        uVar15 = 0;
        uVar16 = 0;
        uVar19 = 0;
        uVar18 = 0;
        uVar6 = 0;
        lVar10 = lVar24;
        uVar22 = uVar9;
        do {
          lVar23 = 0;
          do {
            pbVar11 = (byte *)(lVar10 + lVar23);
            lVar23 = lVar23 + 4;
            uVar18 = uVar18 + *pbVar11;
            uVar19 = uVar19 + pbVar11[1];
            uVar16 = uVar16 + pbVar11[2];
            uVar15 = uVar15 + pbVar11[3];
            uVar6 = uVar18 + uVar6;
            uVar20 = uVar19 + uVar20;
            uVar21 = uVar16 + uVar21;
            uVar17 = uVar15 + uVar17;
          } while (lVar23 != 0x56c0);
          uVar22 = uVar22 - 0x56c0;
          lVar10 = lVar10 + 0x56c0;
          uVar18 = uVar18 % 0xfff1;
          uVar15 = uVar15 % 0xfff1;
          uVar19 = uVar19 % 0xfff1;
          uVar16 = uVar16 % 0xfff1;
          uVar6 = uVar6 % 0xfff1;
          uVar20 = uVar20 % 0xfff1;
          uVar21 = uVar21 % 0xfff1;
          uVar17 = uVar17 % 0xfff1;
          uVar8 = (uVar8 + uVar14 * 0x56c0) % 0xfff1;
        } while (0x15a < uVar22 >> 6);
      }
      if (lVar25 != 0) {
        pbVar11 = (byte *)(lVar24 + uVar9);
        lVar10 = uVar9 - uVar13;
        do {
          bVar4 = *pbVar11;
          pbVar1 = pbVar11 + 1;
          lVar10 = lVar10 + 4;
          pbVar2 = pbVar11 + 2;
          pbVar3 = pbVar11 + 3;
          pbVar11 = pbVar11 + 4;
          uVar18 = uVar18 + bVar4;
          uVar19 = uVar19 + *pbVar1;
          uVar16 = uVar16 + *pbVar2;
          uVar15 = uVar15 + *pbVar3;
          uVar6 = uVar18 + uVar6;
          uVar20 = uVar19 + uVar20;
          uVar21 = uVar16 + uVar21;
          uVar17 = uVar15 + uVar17;
        } while (lVar10 != 0);
        uVar18 = uVar18 % 0xfff1;
        uVar19 = uVar19 % 0xfff1;
        uVar16 = uVar16 % 0xfff1;
        uVar6 = uVar6 % 0xfff1;
        uVar15 = uVar15 % 0xfff1;
        uVar20 = uVar20 % 0xfff1;
        uVar21 = uVar21 % 0xfff1;
        uVar17 = uVar17 % 0xfff1;
      }
      uVar18 = uVar15 + uVar14 + uVar16 + uVar19 + uVar18;
      uVar8 = (((uVar8 + uVar14 * (int)lVar25) % 0xfff1 + (uVar21 + uVar20) * 4 +
               (0xfff1 - uVar15) * 3) - (uVar19 + uVar16 * 2)) + (uVar6 + uVar17) * 4 + 0x2ffd3;
      if (uVar12 != 0) {
        pbVar11 = (byte *)(lVar24 + uVar13);
        uVar18 = uVar18 + *pbVar11;
        uVar8 = uVar18 + uVar8;
        if (uVar12 != 1) {
          uVar18 = uVar18 + pbVar11[1];
          uVar8 = uVar18 + uVar8;
          if (uVar12 != 2) {
            uVar18 = uVar18 + pbVar11[2];
            uVar8 = uVar18 + uVar8;
          }
        }
      }
      *puVar5 = (short)uVar18 + (short)(uVar18 / 0xfff1) * 0xf;
      puVar5[1] = (short)uVar8 + (short)(uVar8 / 0xfff1) * 0xf;
      return;
    }
    lVar24 = 0;
    lVar25 = 0;
    do {
      local_70 = 0;
      uStack_68 = 0;
      local_98 = 1;
      lStack_90 = param_5;
      local_88 = param_6;
      local_80 = param_3;
      uStack_78 = param_4;
      FUN_004369a8(&local_b0,param_2,&local_98,
                   0x403020000U >> ((ulong)(uint)(param_7 << 3) & 0x3f) & 0xffffffff);
      uVar9 = param_4 - local_b0;
      if (param_4 < local_b0) goto LAB_004385b4;
      if (param_6 < local_a0) goto LAB_004385c4;
      lVar24 = local_b0 + lVar24;
      lVar25 = local_a0 + lVar25;
      if (local_a8 != 0) {
        if (local_a8 != 0xfffffffe) goto joined_r0x00438554;
        goto LAB_00438560;
      }
      if (param_6 - local_a0 == 0) goto LAB_00438520;
      param_3 = param_3 + local_b0;
      param_5 = param_5 + local_a0;
      param_6 = param_6 - local_a0;
      param_4 = uVar9;
    } while (uVar9 != 0);
    if (lVar25 == 0) {
      uVar8 = (uint)(param_7 == 0 && lVar24 == 0);
      local_a8 = 0xfffffffb;
      if (uVar8 == 0) {
        local_a8 = 0;
      }
    }
    else {
LAB_00438520:
      local_a8 = 0;
      uVar8 = 0;
    }
LAB_00438568:
    *(long *)(param_1 + 2) = lVar24;
    *(long *)(param_1 + 4) = lVar25;
    *param_1 = uVar8;
    param_1[1] = local_a8;
  }
  return;
code_r0x0043846c:
  param_6 = param_6 - local_a0;
  param_3 = param_3 + local_b0;
  param_5 = param_5 + local_a0;
  param_4 = param_4 - local_b0;
  if (param_6 == 0) goto LAB_00438520;
  goto LAB_00438420;
}


