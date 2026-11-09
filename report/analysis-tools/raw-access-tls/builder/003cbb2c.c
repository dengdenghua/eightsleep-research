/* Reconstructed Ghidra pseudocode, not vendor source. */

void FUN_003cbb2c(undefined8 *param_1,undefined8 *param_2,undefined8 *param_3)

{
  undefined1 uVar1;
  undefined *puVar2;
  undefined8 *puVar3;
  undefined8 *puVar4;
  long lVar5;
  undefined8 uVar6;
  undefined8 uVar7;
  undefined8 uVar8;
  undefined8 uVar9;
  undefined8 uVar10;
  undefined8 uVar11;
  undefined8 uVar12;
  undefined8 uVar13;
  undefined8 uVar14;
  undefined8 uVar15;
  undefined8 uVar16;
  undefined8 uVar17;
  undefined5 uStack_3d;
  
  puVar2 = PTR_DAT_009faac8;
  uVar9 = param_2[0x11];
  uVar8 = param_2[0x10];
  uVar12 = param_2[0x13];
  uVar11 = param_2[0x12];
  lVar5 = param_2[0x12];
  uVar7 = param_2[0x14];
  uVar15 = *(undefined8 *)(lVar5 + 0x48);
  uVar14 = *(undefined8 *)(lVar5 + 0x40);
  uVar17 = *(undefined8 *)(lVar5 + 0x58);
  uVar16 = *(undefined8 *)(lVar5 + 0x50);
  uVar6 = param_3[2];
  uVar13 = param_3[1];
  uVar10 = *param_3;
  uVar1 = *PTR_DAT_009faac8;
  puVar3 = (undefined8 *)FUN_00318628(0x28,8);
  if (puVar3 == (undefined8 *)0x0) {
                    /* WARNING: Subroutine does not return */
    FUN_0019139c(8,0x28);
  }
  puVar3[1] = 1;
  *puVar3 = 1;
  puVar3[3] = uVar13;
  puVar3[2] = uVar10;
  puVar3[4] = uVar6;
  uVar1 = *puVar2;
  puVar4 = (undefined8 *)FUN_00318628(0x58,8);
  if (puVar4 != (undefined8 *)0x0) {
    puVar4[9] = uVar17;
    puVar4[8] = uVar16;
    puVar4[5] = puVar3;
    puVar4[4] = 0;
    puVar4[7] = uVar15;
    puVar4[6] = uVar14;
    puVar4[10] = CONCAT53(uStack_3d,0x10001);
    param_1[0x10] = puVar4;
    param_1[0x11] = &PTR_FUN_009d3058;
    puVar4[1] = 1;
    *puVar4 = 1;
    puVar4[3] = 8;
    puVar4[2] = 0;
    uVar14 = param_2[9];
    uVar13 = param_2[8];
    uVar10 = param_2[0xb];
    uVar6 = param_2[10];
    param_1[0x16] = uVar7;
    param_1[9] = uVar14;
    param_1[8] = uVar13;
    param_1[0xb] = uVar10;
    param_1[10] = uVar6;
    uVar10 = param_2[0xc];
    uVar7 = param_2[0xf];
    uVar6 = param_2[0xe];
    param_1[0xd] = param_2[0xd];
    param_1[0xc] = uVar10;
    param_1[0xf] = uVar7;
    param_1[0xe] = uVar6;
    uVar10 = *param_2;
    uVar7 = param_2[3];
    uVar6 = param_2[2];
    param_1[1] = param_2[1];
    *param_1 = uVar10;
    param_1[3] = uVar7;
    param_1[2] = uVar6;
    uVar10 = param_2[4];
    uVar7 = param_2[7];
    uVar6 = param_2[6];
    param_1[5] = param_2[5];
    param_1[4] = uVar10;
    param_1[7] = uVar7;
    param_1[6] = uVar6;
    param_1[0x13] = uVar9;
    param_1[0x12] = uVar8;
    param_1[0x15] = uVar12;
    param_1[0x14] = uVar11;
    return;
  }
                    /* WARNING: Subroutine does not return */
  FUN_0019139c(8,0x58);
}


