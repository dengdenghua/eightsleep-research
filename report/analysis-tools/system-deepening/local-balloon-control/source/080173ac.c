/* Ghidra static pseudocode; not original source. */

int FUN_080173ac(int *param_1)

{
  int iVar1;
  
  if ((char)param_1[2] == '\0') {
    iVar1 = param_1[1];
  }
  else {
    iVar1 = FUN_08011424();
  }
  return iVar1 - *param_1;
}


