/* Ghidra static pseudocode; not original source. */

void FUN_0801bae4(undefined4 *param_1,uint param_2)

{
  undefined4 uVar1;
  uint uVar2;
  int iVar3;
  
  if (100 < param_2) {
    param_2 = 100;
  }
  iVar3 = *(int *)*param_1;
  uVar1 = FUN_08010160((param_2 & 0xff) * *(int *)(iVar3 + 0x2c),100);
  uVar2 = param_1[1];
  if (uVar2 == 0) {
    *(undefined4 *)(iVar3 + 0x34) = uVar1;
  }
  else if (uVar2 == 0xc) {
    *(undefined4 *)(iVar3 + 0x40) = uVar1;
  }
  else {
    if (uVar2 < 0xd) {
      if (uVar2 == 4) {
        *(undefined4 *)(iVar3 + 0x38) = uVar1;
        goto LAB_0801bb08;
      }
      if (uVar2 == 8) {
        *(undefined4 *)(iVar3 + 0x3c) = uVar1;
        goto LAB_0801bb08;
      }
    }
    else if (uVar2 == 0x10) {
      *(undefined4 *)(iVar3 + 0x58) = uVar1;
      goto LAB_0801bb08;
    }
    *(undefined4 *)(iVar3 + 0x5c) = uVar1;
  }
LAB_0801bb08:
  *(char *)(param_1 + 3) = (char)param_2;
  return;
}


