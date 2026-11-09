/* Ghidra static pseudocode; not original source. */

void FUN_0801b824(int param_1)

{
  undefined4 uVar1;
  int iVar2;
  undefined4 uVar3;
  undefined4 uVar4;
  
  uVar4 = *(undefined4 *)(param_1 + 4);
  uVar1 = FUN_0801b800();
  if (*(char *)(param_1 + 0x24) != '\0') {
    uVar3 = FUN_08026fb0();
    FUN_0802b1cc(uVar3,0x42c80000);
    uVar3 = FUN_0802944c();
    iVar2 = FUN_08010564(uVar3,0x3f800000);
    if (iVar2 == 0) {
      iVar2 = FUN_0801053c(uVar3,0x3f0ccccd);
      if (iVar2 != 0) {
        uVar3 = 0x3f0ccccd;
      }
      goto LAB_0801b83c;
    }
  }
  uVar3 = 0x3f800000;
LAB_0801b83c:
  uVar1 = FUN_0802b598(uVar1,uVar3);
  FUN_0802aeb8(uVar1,uVar4);
  return;
}


