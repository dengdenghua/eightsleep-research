/* Ghidra static pseudocode; not original source. */

uint FUN_0801e6a0(int param_1)

{
  bool bVar1;
  int iVar2;
  int iVar3;
  byte bVar4;
  bool bVar5;
  undefined4 uVar6;
  byte bVar7;
  undefined4 uVar8;
  
  if ((*(char *)(param_1 + 0x16) != '\0') || (bVar7 = *(byte *)(param_1 + 0x14), bVar7 == 5)) {
    bVar7 = 5;
    bVar5 = *(char *)(param_1 + 0x17) == '\x01';
    bVar4 = 100;
    goto LAB_0801e6c0;
  }
  bVar1 = false;
  bVar5 = bVar1;
  bVar4 = bVar1;
  if ((bVar7 == 6) || (bVar7 == 7)) goto LAB_0801e6c0;
  uVar6 = *(undefined4 *)(param_1 + 8);
  iVar2 = FUN_08010530(uVar6,0xbf800000);
  if ((iVar2 != 0) || (iVar2 = FUN_0801053c(uVar6,0), iVar2 != 0)) {
    bVar7 = false;
    bVar4 = 0x14;
    bVar5 = (bool)bVar7;
    goto LAB_0801e6c0;
  }
  if (*(char *)(param_1 + 0x1d) == '\x02') {
    bVar4 = 0;
    bVar5 = false;
    if (bVar7 < 2) goto LAB_0801e6c0;
  }
  uVar8 = *(undefined4 *)(param_1 + 4);
  iVar2 = FUN_08010578(uVar6,0);
  if ((iVar2 == 0) || (iVar2 = FUN_08010550(uVar6,0x3dcccccd), iVar2 == 0)) {
    if (bVar7 == 4) {
      bVar4 = 0x28;
      bVar5 = true;
      goto LAB_0801e6c0;
    }
    uVar6 = FUN_0802b814(uVar8,uVar6);
    iVar2 = *(int *)(param_1 + 0x10);
    if (*(char *)(param_1 + 0x1c) != '\0') {
      iVar3 = FUN_08010564(uVar6,iVar2);
      bVar4 = 0;
      bVar5 = false;
      if (iVar3 != 0) goto LAB_0801e6c0;
      iVar3 = FUN_08010564(iVar2 + -0x80000000,uVar6);
      bVar4 = 0;
      bVar5 = false;
      if (iVar3 != 0) goto LAB_0801e6c0;
    }
    iVar3 = FUN_08010564(uVar6,iVar2);
    if (iVar3 == 0) {
      iVar2 = FUN_08010564(iVar2 + -0x80000000,uVar6);
      if (iVar2 == 0) {
        bVar7 = 1;
        bVar4 = 0;
        bVar5 = false;
      }
      else {
        bVar4 = 0x50;
        bVar7 = 2;
        bVar5 = true;
      }
    }
    else {
      bVar4 = 0x50;
      bVar7 = 3;
      bVar5 = true;
    }
    goto LAB_0801e6c0;
  }
  iVar2 = FUN_08010530(uVar8,0xbf800000);
  if (iVar2 == 0) {
    if (bVar7 == 4) {
      if (*(char *)(param_1 + 0x19) == '\0') {
LAB_0801e74c:
        bVar4 = 0x28;
        bVar5 = true;
        goto LAB_0801e6c0;
      }
    }
    else {
      bVar4 = 0x14;
      bVar7 = 0;
      bVar5 = bVar1;
      if (*(char *)(param_1 + 0x1a) != '\0' || *(char *)(param_1 + 0x1b) != '\0') goto LAB_0801e6c0;
      iVar2 = FUN_08010564(uVar8,0x3e99999a);
      if ((iVar2 != 0) || (iVar2 = FUN_0801053c(uVar8,0xbe99999a), iVar2 != 0)) {
        bVar7 = 4;
        goto LAB_0801e74c;
      }
    }
  }
  bVar7 = 0;
  bVar4 = 0x14;
  bVar5 = false;
LAB_0801e6c0:
  return (uint)CONCAT12(bVar5,CONCAT11(bVar4,bVar7));
}


