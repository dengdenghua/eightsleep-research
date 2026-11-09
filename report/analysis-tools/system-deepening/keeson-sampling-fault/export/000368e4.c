/* Static Ghidra pseudocode; not original source. */

undefined1 * FUN_000368e4(char *param_1)

{
  char cVar1;
  
  cVar1 = DAT_20005499 + 1;
  if (DAT_2000549a == cVar1) {
    cVar1 = '\0';
  }
  if (DAT_20005498 == cVar1) {
    return (undefined1 *)0x0;
  }
  *param_1 = cVar1;
  return &DAT_2000549c + (uint)DAT_20005499 * 0x18;
}


