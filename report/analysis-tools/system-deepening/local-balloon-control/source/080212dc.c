/* Ghidra static pseudocode; not original source. */

void FUN_080212dc(int param_1)

{
  byte bVar1;
  
  bVar1 = 0;
  if (param_1 != 0) {
    for (; bVar1 < *(byte *)(param_1 + 0x230); bVar1 = bVar1 + 1) {
      FUN_08021204(param_1,bVar1,0);
    }
  }
  return;
}


