/* Static Ghidra pseudocode; not original source. */

undefined4 FUN_0002ca48(int *param_1,undefined1 param_2,int param_3)

{
  int iVar1;
  
  if (DAT_2000549a != '\0') {
    if ((param_3 == 0) || (param_1 == (int *)0x0)) {
      return 7;
    }
    iVar1 = *param_1;
    if (*(char *)(iVar1 + 0x10) == '\0') {
      *(undefined1 *)(iVar1 + 0x10) = 0;
      *(undefined1 *)(iVar1 + 0x11) = param_2;
      *(int *)(iVar1 + 0x14) = param_3;
      return 0;
    }
  }
  return 8;
}


