/* Ghidra static pseudocode; not original source. */

bool FUN_0802bb5c(uint param_1,uint param_2)

{
  bool bVar1;
  
  if ((((param_1 & 0x7fffffff) >> 0x17 != 0xff) || (bVar1 = true, (param_1 & 0x7fffff) == 0)) &&
     (bVar1 = false, (param_2 & 0x7fffffff) >> 0x17 == 0xff)) {
    bVar1 = (param_2 & 0x7fffff) != 0;
  }
  return bVar1;
}


