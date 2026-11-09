/* Ghidra static pseudocode; not original source. */

void FUN_08023eb8(undefined1 *param_1)

{
  undefined1 uVar1;
  int iVar2;
  undefined4 uVar3;
  undefined4 uVar4;
  int iVar5;
  undefined4 *puVar6;
  undefined4 uVar7;
  undefined4 uVar8;
  char *pcVar9;
  undefined4 uVar10;
  char *pcVar11;
  
  if ((param_1[0xdc] != '\0') && (iVar5 = *(int *)(param_1 + 0x18), iVar5 != 0)) {
    uVar10 = *(undefined4 *)(param_1 + 4);
    iVar2 = FUN_08010530(uVar10,0xbf800000);
    if ((iVar2 == 0) && (iVar2 = FUN_0801053c(uVar10,0), iVar2 == 0)) {
      if (*(char *)(iVar5 + 0x5c) == '\0') {
        uVar7 = FUN_08016f60(uVar10,10);
        uVar10 = FUN_08016f6e(uVar10,10);
        FUN_08017634("[bag_task] bag %u: tolerance lookup failed for setpoint=%s%u.%01u kPa",
                     *param_1,"",uVar7,uVar10);
      }
      else {
        iVar2 = FUN_0801f10c(iVar5,uVar10);
        puVar6 = (undefined4 *)(iVar5 + iVar2 * 8);
        uVar8 = *puVar6;
        uVar7 = puVar6[1];
        *(undefined4 *)(param_1 + 8) = uVar8;
        *(undefined4 *)(param_1 + 0xc) = uVar7;
        uVar10 = FUN_0801f10c(*(undefined4 *)(param_1 + 0x18),uVar10);
        uVar1 = *param_1;
        iVar5 = FUN_0801053c(uVar8,0);
        pcVar9 = "-";
        if (iVar5 == 0) {
          pcVar9 = "";
        }
        uVar3 = FUN_08016f60(uVar8,100);
        uVar8 = FUN_08016f6e(uVar8,100);
        iVar5 = FUN_0801053c(uVar7,0);
        pcVar11 = "-";
        if (iVar5 == 0) {
          pcVar11 = "";
        }
        uVar4 = FUN_08016f60(uVar7,100);
        uVar7 = FUN_08016f6e(uVar7,100);
        FUN_08017634("[bag_task] bag %u: tolerances updated from bin %u (arr=%s%u.%02u, dep=%s%u.%02u kPa)"
                     ,uVar1,uVar10,pcVar9,uVar3,uVar8,pcVar11,uVar4,uVar7);
      }
    }
  }
  return;
}


