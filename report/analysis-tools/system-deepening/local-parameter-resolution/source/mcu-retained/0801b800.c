/* Ghidra static pseudocode; not original source. */

undefined4 FUN_0801b800(int param_1)

{
  undefined4 uVar1;
  undefined4 *puVar2;
  undefined4 uVar3;
  
  puVar2 = *(undefined4 **)(param_1 + 0x20);
  if ((puVar2 == (undefined4 *)0x0) || (*(char *)(puVar2 + 5) == '\0')) {
    uVar1 = 0;
  }
  else {
    uVar3 = *(undefined4 *)(param_1 + 4);
    uVar1 = FUN_0802aeb8(uVar3,*puVar2);
    uVar1 = FUN_0802b814(uVar1,uVar3);
  }
  return uVar1;
}


