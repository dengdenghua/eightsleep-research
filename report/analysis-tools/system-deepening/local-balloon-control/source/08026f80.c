/* Ghidra static pseudocode; not original source. */

int FUN_08026f80(undefined4 param_1)

{
  int iVar1;
  
  iVar1 = FUN_08010578(param_1,0x4f000000);
  if (iVar1 == 0) {
    iVar1 = FUN_0802bb88(param_1);
  }
  else {
    FUN_0802b814(param_1,0x4f000000);
    iVar1 = FUN_0802bb88();
    iVar1 = iVar1 + -0x80000000;
  }
  return iVar1;
}


