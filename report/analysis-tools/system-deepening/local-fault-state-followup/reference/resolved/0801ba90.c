/* Ghidra static pseudocode; not original source. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_0801ba90(undefined4 *param_1,uint param_2)

{
  int iVar1;
  undefined4 uVar2;
  int *piVar3;
  int iVar4;
  
  if (param_2 < 0x4e21) {
    if ((param_2 & 0xffff) < 100) {
      param_2 = 100;
    }
  }
  else {
    param_2 = 20000;
  }
  iVar4 = *(int *)(*(int *)*param_1 + 0x28);
  iVar1 = FUN_0801406c();
  if ((_DAT_40021008 & 0x7fff) >> 0xc != 0) {
    iVar1 = iVar1 << 1;
  }
  uVar2 = FUN_08010160(iVar1,iVar4 + 1);
  iVar1 = FUN_08010160(uVar2,param_2 & 0xffff);
  piVar3 = (int *)*param_1;
  *(int *)(*piVar3 + 0x2c) = iVar1 + -1;
  piVar3[3] = iVar1 + -1;
  *(short *)((int)param_1 + 10) = (short)param_2;
  return;
}


