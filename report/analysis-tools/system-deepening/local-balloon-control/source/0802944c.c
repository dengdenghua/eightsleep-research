/* Ghidra static pseudocode; not original source. */

undefined4 FUN_0802944c(undefined4 param_1)

{
  undefined4 uVar1;
  int iVar2;
  undefined4 *puVar3;
  
  uVar1 = FUN_080295a4();
  iVar2 = FUN_0802bb5c(param_1,param_1);
  if ((iVar2 == 0) && (iVar2 = FUN_0801053c(param_1,0), iVar2 != 0)) {
    puVar3 = (undefined4 *)FUN_08028048();
    *puVar3 = 0x21;
    uVar1 = FUN_0802b1cc(0);
  }
  return uVar1;
}


