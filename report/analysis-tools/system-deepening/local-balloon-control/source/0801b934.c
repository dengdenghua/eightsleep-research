/* Ghidra static pseudocode; not original source. */

char FUN_0801b934(int param_1,uint param_2)

{
  char cVar1;
  
  if (param_2 == 5) {
    cVar1 = '\x01' - (*(char *)(param_1 + 0xa1) == '\x01');
  }
  else {
    if (5 < param_2) {
      param_2 = param_2 - 6 & 0xff;
    }
    cVar1 = param_2 < 2;
  }
  return cVar1;
}


