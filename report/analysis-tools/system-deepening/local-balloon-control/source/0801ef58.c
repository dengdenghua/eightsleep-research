/* Ghidra static pseudocode; not original source. */

void FUN_0801ef58(int param_1)

{
  char cVar1;
  
  cVar1 = *(char *)(param_1 + 0x21);
  if (cVar1 == '\0') {
    *(undefined **)(param_1 + 0x30) = &DAT_0801e855;
    *(undefined1 *)(param_1 + 0x34) = 0;
  }
  else {
    *(undefined1 **)(param_1 + 0x30) = &LAB_0801ef08_1;
    *(undefined1 *)(param_1 + 0x34) = 5;
    *(undefined1 *)(param_1 + 0x44) = 0;
    FUN_08017484(param_1 + 0x38);
    FUN_08017006(param_1 + 0x38);
  }
  FUN_0801ec3c(param_1,cVar1);
  return;
}


