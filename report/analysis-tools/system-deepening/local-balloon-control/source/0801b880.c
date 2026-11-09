/* Ghidra static pseudocode; not original source. */

bool FUN_0801b880(int param_1)

{
  uint uVar1;
  bool bVar2;
  
  uVar1 = FUN_080173ac(param_1 + 0x30);
  bVar2 = false;
  if ((DAT_2000025c <= uVar1) && (bVar2 = true, uVar1 < 8000)) {
    bVar2 = 2 < *(byte *)(param_1 + 0x50);
  }
  return bVar2;
}


