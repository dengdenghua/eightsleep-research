/* Ghidra static pseudocode; not original source. */

undefined4 FUN_0801b95a(int param_1)

{
  undefined4 uVar1;
  
  uVar1 = 0;
  if ((((param_1 != 0) && (uVar1 = 0, *(char *)(param_1 + 0xdc) != '\0')) &&
      (uVar1 = 0, *(char *)(param_1 + 0x2c) != '\x01')) &&
     ((*(byte *)(param_1 + 1) < 2 || (*(byte *)(param_1 + 1) == 7)))) {
    uVar1 = FUN_080202d4(*(undefined4 *)(param_1 + 0x28));
  }
  return uVar1;
}


