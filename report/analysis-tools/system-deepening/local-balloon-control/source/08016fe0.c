/* Ghidra static pseudocode; not original source. */

bool FUN_08016fe0(int *param_1,undefined4 param_2,undefined4 param_3,undefined4 param_4)

{
  int iVar1;
  uint uVar2;
  int extraout_r1;
  undefined4 extraout_r2;
  uint uVar3;
  int iVar4;
  
  iVar4 = *param_1;
  uVar3 = param_1[1];
  iVar1 = FUN_08011424();
  uVar2 = iVar1 - iVar4;
  if (uVar3 <= uVar2) {
    FUN_0801026c(uVar2,uVar3,extraout_r2,0,param_4);
    *param_1 = iVar1 - extraout_r1;
  }
  return uVar3 <= uVar2;
}


