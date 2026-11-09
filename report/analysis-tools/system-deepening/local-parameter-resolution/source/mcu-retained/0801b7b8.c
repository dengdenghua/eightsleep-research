/* Ghidra static pseudocode; not original source. */

undefined4 FUN_0801b7b8(int param_1)

{
  int iVar1;
  undefined4 uVar2;
  int iVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  
  iVar3 = *(int *)(param_1 + 0x20);
  uVar2 = *(undefined4 *)(param_1 + 4);
  if ((iVar3 != 0) && (*(char *)(iVar3 + 0x14) != '\0')) {
    iVar1 = FUN_0801053c(uVar2,0x3f800000);
    if (iVar1 == 0) {
      uVar5 = *(undefined4 *)(iVar3 + 4);
      uVar4 = *(undefined4 *)(iVar3 + 8);
    }
    else {
      uVar5 = *(undefined4 *)(iVar3 + 0xc);
      uVar4 = *(undefined4 *)(iVar3 + 0x10);
    }
    iVar3 = FUN_08010550(uVar5,0);
    if (iVar3 == 0) {
      uVar2 = FUN_0802b814(uVar2,uVar4);
      uVar2 = FUN_0802b1cc(uVar2,uVar5);
    }
  }
  return uVar2;
}


