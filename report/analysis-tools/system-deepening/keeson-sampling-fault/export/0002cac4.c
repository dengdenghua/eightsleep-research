/* Static Ghidra pseudocode; not original source. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined4 FUN_0002cac4(int param_1,uint param_2,uint param_3,undefined4 param_4)

{
  undefined1 *puVar1;
  uint uVar2;
  uint local_28;
  undefined4 local_24;
  
  if ((DAT_2000549a != '\0') && (param_1 != 0)) {
    if (param_2 < 5) {
      return 7;
    }
    if (*(int *)(param_1 + 0x14) != 0) {
      uVar2 = param_2;
      if (*(char *)(param_1 + 0x11) != '\x01') {
        uVar2 = 0;
      }
      local_28 = param_3 & 0xffffff00;
      local_24 = param_4;
      FUN_0002cd5c(&local_28);
      puVar1 = (undefined1 *)FUN_000368e4(&local_24);
      if (puVar1 != (undefined1 *)0x0) {
        *puVar1 = 1;
        *(int *)(puVar1 + 4) = param_1;
        *(undefined4 *)(puVar1 + 8) = _DAT_40011504;
        *(uint *)(puVar1 + 0xc) = param_2;
        *(uint *)(puVar1 + 0x10) = uVar2;
        *(uint *)(puVar1 + 0x14) = param_3;
        DAT_20005499 = (undefined1)local_24;
        FUN_0002cda4(local_28 & 0xff);
        FUN_0002c406(0x14);
        return 0;
      }
      FUN_0002cda4(local_28 & 0xff);
      return 4;
    }
  }
  return 8;
}


