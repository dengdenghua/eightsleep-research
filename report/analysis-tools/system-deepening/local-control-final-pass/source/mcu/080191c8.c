/* Ghidra static pseudocode; not original source. */

void FUN_080191c8(int param_1,int param_2,uint param_3)

{
  undefined1 uVar1;
  bool bVar2;
  undefined4 uVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  undefined4 uVar6;
  undefined4 uVar7;
  undefined4 uVar8;
  undefined4 uVar9;
  undefined4 uVar10;
  undefined4 uVar11;
  int iVar12;
  undefined4 uVar13;
  int iVar14;
  uint uVar15;
  undefined1 *puVar16;
  uint uVar17;
  undefined1 *puVar18;
  undefined4 *puVar19;
  char *pcVar20;
  char *pcVar21;
  bool bVar22;
  char *local_64;
  char *local_5c;
  char *local_58;
  char *local_54;
  undefined4 local_2c [6];
  
  if (((param_1 == 0) || (*(char *)(param_1 + 0x2384) == '\0')) ||
     (*(char *)(param_1 + 0x1b04) == '\0')) {
    FUN_08017634("[cmd] balloon controller not initialized");
LAB_080191ec:
    uVar3 = 1;
    goto LAB_08019212;
  }
  FUN_08017634("[cmd] pressure_set_setpoint called, payload_len=%lu",param_3);
  uVar15 = (uint)*(byte *)(param_1 + 0x2473);
  if (param_3 != uVar15 * 4) {
    FUN_08017634("[cmd] invalid setpoint payload: %u bags supported, got %lu pressure values",uVar15
                 ,param_3 >> 2);
    uVar3 = 6;
    goto LAB_08019212;
  }
  puVar19 = local_2c;
  local_2c[0] = 0xbf800000;
  local_2c[1] = 0xbf800000;
  local_2c[2] = 0xbf800000;
  local_2c[3] = 0xbf800000;
  local_2c[4] = 0xbf800000;
  for (uVar17 = 0; uVar3 = local_2c[0], (uVar17 & 0xff) < uVar15; uVar17 = uVar17 + 1) {
    FUN_08027fb8(puVar19,param_2 + uVar17 * 4,4);
    uVar3 = *puVar19;
    iVar12 = FUN_0801053c(uVar3,0xbf800000);
    if ((iVar12 != 0) ||
       ((iVar12 = FUN_08010564(uVar3,0x43480000), iVar12 != 0 &&
        (iVar12 = FUN_08010530(uVar3,0xbf800000), iVar12 == 0)))) {
      iVar12 = FUN_0801053c(uVar3,0);
      pcVar21 = "-";
      if (iVar12 == 0) {
        pcVar21 = "";
      }
      uVar13 = FUN_08016f60(uVar3,10);
      uVar3 = FUN_08016f6e(uVar3,10);
      FUN_08017634("[cmd] invalid setpoint[%u] %s%u.%01u kPa (must be -1.0 or 0-200)",uVar17,pcVar21
                   ,uVar13,uVar3);
      goto LAB_080191ec;
    }
    puVar19 = puVar19 + 1;
  }
  iVar12 = FUN_0801053c(local_2c[0],0);
  local_54 = "-";
  if (iVar12 == 0) {
    local_54 = "";
  }
  uVar13 = FUN_08016f60(uVar3,10);
  uVar4 = FUN_08016f6e(uVar3,10);
  uVar3 = local_2c[1];
  iVar12 = FUN_0801053c(local_2c[1],0);
  pcVar21 = "-";
  if (iVar12 == 0) {
    pcVar21 = "";
  }
  uVar5 = FUN_08016f60(uVar3,10);
  uVar6 = FUN_08016f6e(uVar3,10);
  uVar3 = local_2c[2];
  iVar12 = FUN_0801053c(local_2c[2],0);
  local_58 = "-";
  if (iVar12 == 0) {
    local_58 = "";
  }
  uVar7 = FUN_08016f60(uVar3,10);
  uVar8 = FUN_08016f6e(uVar3,10);
  uVar3 = local_2c[3];
  iVar12 = FUN_0801053c(local_2c[3],0);
  local_5c = "-";
  if (iVar12 == 0) {
    local_5c = "";
  }
  uVar9 = FUN_08016f60(uVar3,10);
  uVar10 = FUN_08016f6e(uVar3,10);
  uVar3 = local_2c[4];
  iVar12 = FUN_0801053c(local_2c[4],0);
  pcVar20 = "-";
  if (iVar12 == 0) {
    pcVar20 = "";
  }
  uVar11 = FUN_08016f60(uVar3,10);
  uVar3 = FUN_08016f6e(uVar3,10);
  FUN_08017634("[cmd] received setpoints: [%s%u.%01u, %s%u.%01u, %s%u.%01u, %s%u.%01u, %s%u.%01u] kPa (active=%u)"
               ,local_54,uVar13,uVar4,pcVar21,uVar5,uVar6,local_58,uVar7,uVar8,local_5c,uVar9,uVar10
               ,pcVar20,uVar11,uVar3,uVar15);
  for (uVar17 = 0; (uVar17 & 0xff) < uVar15; uVar17 = uVar17 + 1) {
    uVar3 = *(undefined4 *)(param_1 + 0x155c + uVar17 * 0xe0);
    uVar13 = local_2c[uVar17];
    iVar12 = FUN_08010578(uVar3,0);
    if ((((iVar12 == 0) || (iVar12 = FUN_08010550(uVar3,0x3dcccccd), iVar12 == 0)) ||
        ((iVar12 = FUN_08010578(uVar13,0), iVar12 == 0 ||
         (iVar12 = FUN_08010550(uVar13,0x3dcccccd), iVar12 == 0)))) &&
       (iVar12 = FUN_08010530(uVar3,uVar13), iVar12 == 0)) {
      puVar18 = (undefined1 *)(param_1 + 0x1558);
      local_54 = (char *)(param_1 + 0x1584);
      puVar16 = (undefined1 *)(param_1 + 0x15bc);
      local_58 = (char *)0x0;
      goto LAB_08019698;
    }
  }
LAB_08019350:
  uVar3 = local_2c[0];
  iVar12 = FUN_0801053c(local_2c[0],0);
  local_58 = "-";
  if (iVar12 == 0) {
    local_58 = "";
  }
  uVar13 = FUN_08016f60(uVar3,10);
  uVar4 = FUN_08016f6e(uVar3,10);
  uVar3 = local_2c[1];
  iVar12 = FUN_0801053c(local_2c[1],0);
  pcVar21 = "-";
  if (iVar12 == 0) {
    pcVar21 = "";
  }
  uVar5 = FUN_08016f60(uVar3,10);
  uVar6 = FUN_08016f6e(uVar3,10);
  uVar3 = local_2c[2];
  iVar12 = FUN_0801053c(local_2c[2],0);
  local_5c = "-";
  if (iVar12 == 0) {
    local_5c = "";
  }
  uVar7 = FUN_08016f60(uVar3,10);
  uVar8 = FUN_08016f6e(uVar3,10);
  uVar3 = local_2c[3];
  iVar12 = FUN_0801053c(local_2c[3],0);
  local_64 = "-";
  if (iVar12 == 0) {
    local_64 = "";
  }
  uVar9 = FUN_08016f60(uVar3,10);
  uVar10 = FUN_08016f6e(uVar3,10);
  uVar3 = local_2c[4];
  iVar12 = FUN_0801053c(local_2c[4],0);
  pcVar20 = "-";
  if (iVar12 == 0) {
    pcVar20 = "";
  }
  uVar11 = FUN_08016f60(uVar3,10);
  uVar3 = FUN_08016f6e(uVar3,10);
  FUN_08017634("[cmd] setpoints: [%s%u.%01u, %s%u.%01u, %s%u.%01u, %s%u.%01u, %s%u.%01u] kPa (%u bags configured)"
               ,local_58,uVar13,uVar4,pcVar21,uVar5,uVar6,local_5c,uVar7,uVar8,local_64,uVar9,uVar10
               ,pcVar20,uVar11,uVar3,uVar15);
  uVar3 = 0;
LAB_08019212:
  FUN_08015fec(uVar3);
  return;
LAB_08019698:
  if (uVar15 <= ((uint)local_58 & 0xff)) goto LAB_080196a8;
  uVar3 = local_2c[(int)local_58];
  if (puVar16[0x78] == '\0') {
    FUN_08017634("[cmd] failed to set bag %u setpoint",local_58,local_2c,0,pcVar21);
    goto LAB_080191ec;
  }
  uVar13 = *(undefined4 *)(puVar18 + 4);
  uVar4 = *(undefined4 *)(puVar18 + 0xc);
  iVar12 = FUN_0802b814(uVar3,uVar13);
  iVar14 = FUN_0801053c(iVar12,0);
  if (iVar14 != 0) {
    iVar12 = iVar12 + -0x80000000;
  }
  iVar14 = FUN_08010530(uVar13,0xbf800000);
  if ((iVar14 == 0) && (iVar12 = FUN_0801053c(uVar4,iVar12), iVar12 == 0)) {
    *(undefined4 *)(puVar18 + 4) = uVar3;
    *puVar16 = 0;
    puVar16[1] = 0;
    puVar16[0x11] = 0;
    puVar16[0x10] = 0;
    bVar2 = false;
  }
  else {
    *(undefined4 *)(puVar18 + 4) = uVar3;
    *puVar16 = 0;
    puVar16[1] = 0;
    puVar16[0x11] = 0;
    puVar16[0x10] = 0;
    *(undefined4 *)(puVar16 + 0x28) = 0;
    *(undefined4 *)(puVar16 + 0x2c) = 0;
    *(undefined4 *)(puVar16 + 0x30) = 0;
    puVar16[0x34] = 0;
    *(undefined4 *)(puVar16 + 0x38) = 0;
    FUN_08017634("[bag_task] bag %u: setpoint change, health reset",*puVar18);
    bVar2 = true;
  }
  FUN_08023eb8(puVar18);
  iVar12 = FUN_08010578(uVar13,0);
  bVar22 = false;
  if (iVar12 != 0) {
    iVar12 = FUN_08010550(uVar13,0x3dcccccd);
    bVar22 = false;
    if (iVar12 != 0) {
      iVar12 = FUN_08010578(uVar3,0);
      bVar22 = false;
      if (iVar12 != 0) {
        iVar12 = FUN_08010550(uVar3,0x3dcccccd);
        bVar22 = iVar12 != 0;
      }
    }
  }
  uVar5 = FUN_08020a1c(*(undefined4 *)(puVar18 + 0x14),*puVar18);
  iVar12 = FUN_08010530(uVar5,0xbf800000);
  if (iVar12 == 0) {
    FUN_0802b814(uVar5,uVar13);
    uVar6 = FUN_0802959c();
    iVar12 = FUN_08010578(uVar4,uVar6);
    if (iVar12 == 0) goto LAB_080196c4;
    FUN_0802b814(uVar5,uVar3);
    uVar4 = FUN_0802959c();
    iVar12 = FUN_08010564(uVar4,*(undefined4 *)(puVar18 + 0xc));
    if (iVar12 == 0) goto LAB_080196c4;
LAB_08019646:
    iVar12 = FUN_08010530(uVar13,uVar3);
    if ((iVar12 == 0) && (!bVar22)) {
      *local_54 = 1;
      local_54[1] = 0;
    }
  }
  else {
LAB_080196c4:
    if (bVar2) goto LAB_08019646;
  }
  uVar1 = *puVar18;
  iVar12 = FUN_0801053c(uVar3,0);
  pcVar20 = "-";
  if (iVar12 == 0) {
    pcVar20 = "";
  }
  uVar13 = FUN_08016f60(uVar3,10);
  pcVar21 = (char *)FUN_08016f6e(uVar3,10);
  FUN_08017634("[bag_task] bag %u: target set (setpoint=%s%u.%01u kPa)",uVar1,pcVar20,uVar13,pcVar21
              );
  puVar18 = puVar18 + 0xe0;
  local_58 = (char *)((int)local_58 + 1);
  puVar16 = puVar16 + 0xe0;
  local_54 = local_54 + 0xe0;
  goto LAB_08019698;
LAB_080196a8:
  FUN_080217a0(param_1 + 0x19b8);
  goto LAB_08019350;
}


