/* Static Ghidra pseudocode; not original source. */

void FUN_000303b0(undefined4 param_1)

{
  int iVar1;
  undefined1 uVar2;
  uint uVar3;
  int iVar4;
  undefined4 uVar5;
  
  if (DAT_20003fb7 != '\0') {
    return;
  }
  iVar1 = FUN_00029c40(param_1);
  if ((&DAT_20003be1)[iVar1 * 0x28] == '\0') {
    iVar1 = FUN_00029c40(param_1);
    if ((&DAT_20003bcc)[iVar1 * 10] != -1) {
      iVar1 = FUN_00029c40(param_1);
      (&DAT_20003bcc)[iVar1 * 10] = (&DAT_20003bcc)[iVar1 * 10] + 1;
      iVar1 = FUN_00029c40(param_1);
      uVar5 = (&DAT_20003bcc)[iVar1 * 10];
      iVar1 = FUN_00029c40(param_1);
      (&DAT_20003bc8)[iVar1 * 10] = uVar5;
    }
    iVar1 = FUN_00029c40(param_1);
    iVar1 = iVar1 * 0x28;
    uVar3 = *(uint *)(&DAT_20003bd8 + iVar1);
    *(uint *)(&DAT_20003bd8 + iVar1) = uVar3 + 1;
    *(uint *)(&DAT_20003bdc + iVar1) = *(int *)(&DAT_20003bdc + iVar1) + (uint)(0xfffffffe < uVar3);
    iVar1 = FUN_00029c40(param_1);
    uVar2 = 0;
  }
  else {
    iVar1 = FUN_00029c40(param_1);
    if ((&DAT_20003be1)[iVar1 * 0x28] != '\x01') {
      iVar1 = FUN_00029c40(param_1);
      if ((&DAT_20003be1)[iVar1 * 0x28] != '\x02') {
        return;
      }
      iVar1 = FUN_00029c40(param_1);
      if ((&DAT_20003be0)[iVar1 * 0x28] == '\0') {
        iVar1 = FUN_00029c40(param_1);
        if ((&DAT_20003bcc)[iVar1 * 10] == -1) goto LAB_00030552;
        iVar1 = FUN_00029c40(param_1);
        iVar4 = (&DAT_20003bcc)[iVar1 * 10] + 1;
      }
      else {
        iVar1 = FUN_00029c40(param_1);
        if ((&DAT_20003be0)[iVar1 * 0x28] != '\x01') {
          return;
        }
        iVar1 = FUN_00029c40(param_1);
        if ((int)(&DAT_20003bcc)[iVar1 * 10] < 1) goto LAB_00030552;
        iVar1 = FUN_00029c40(param_1);
        iVar4 = (&DAT_20003bcc)[iVar1 * 10] + -1;
      }
      (&DAT_20003bcc)[iVar1 * 10] = iVar4;
      iVar1 = FUN_00029c40(param_1);
      uVar5 = (&DAT_20003bcc)[iVar1 * 10];
      iVar1 = FUN_00029c40(param_1);
      (&DAT_20003bc8)[iVar1 * 10] = uVar5;
      goto LAB_00030552;
    }
    iVar1 = FUN_00029c40(param_1);
    if (0 < (int)(&DAT_20003bcc)[iVar1 * 10]) {
      iVar1 = FUN_00029c40(param_1);
      (&DAT_20003bcc)[iVar1 * 10] = (&DAT_20003bcc)[iVar1 * 10] + -1;
      iVar1 = FUN_00029c40(param_1);
      uVar5 = (&DAT_20003bcc)[iVar1 * 10];
      iVar1 = FUN_00029c40(param_1);
      (&DAT_20003bc8)[iVar1 * 10] = uVar5;
    }
    iVar1 = FUN_00029c40(param_1);
    iVar1 = iVar1 * 0x28;
    uVar3 = *(uint *)(&DAT_20003bd8 + iVar1);
    *(uint *)(&DAT_20003bd8 + iVar1) = uVar3 + 1;
    *(uint *)(&DAT_20003bdc + iVar1) = *(int *)(&DAT_20003bdc + iVar1) + (uint)(0xfffffffe < uVar3);
    iVar1 = FUN_00029c40(param_1);
    uVar2 = 1;
  }
  (&DAT_20003be0)[iVar1 * 0x28] = uVar2;
LAB_00030552:
  iVar1 = FUN_00029c40(param_1);
  (&DAT_20003f5e)[iVar1] = 0x55;
  return;
}


