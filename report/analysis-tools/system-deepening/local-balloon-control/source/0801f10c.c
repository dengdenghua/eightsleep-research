/* Ghidra static pseudocode; not original source. */

byte FUN_0801f10c(int param_1,undefined4 param_2)

{
  byte bVar1;
  int iVar2;
  undefined4 uVar3;
  
  bVar1 = 0;
  if ((param_1 != 0) && (bVar1 = 0, *(char *)(param_1 + 0x5c) != '\0')) {
    uVar3 = *(undefined4 *)(param_1 + 0x50);
    iVar2 = FUN_08010550(param_2,uVar3);
    bVar1 = 0;
    if (iVar2 == 0) {
      iVar2 = FUN_08010578(param_2,*(undefined4 *)(param_1 + 0x54));
      bVar1 = 9;
      if (iVar2 == 0) {
        uVar3 = FUN_0802b814(param_2,uVar3);
        FUN_0802b1cc(uVar3,*(undefined4 *)(param_1 + 0x58));
        FUN_08029488();
        bVar1 = FUN_08026f80();
        if (9 < bVar1) {
          bVar1 = 9;
        }
      }
    }
  }
  return bVar1;
}


