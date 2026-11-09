/* Ghidra static pseudocode; not original source. */

undefined8 FUN_08020f20(undefined1 *param_1,undefined1 *param_2)

{
  byte bVar1;
  undefined1 uVar2;
  undefined4 uVar3;
  undefined1 *local_1c;
  
  local_1c = param_2;
  if ((param_1 != (undefined1 *)0x0) && (param_1[0xdc] != '\0')) {
    uVar2 = *param_1;
    uVar3 = *(undefined4 *)(param_1 + 0x14);
    local_1c = (undefined1 *)FUN_08020a1c(uVar3,uVar2);
    bVar1 = FUN_0801e808(uVar3,uVar2);
    *param_2 = uVar2;
    *(undefined1 **)(param_2 + 4) = local_1c;
    *(undefined4 *)(param_2 + 8) = *(undefined4 *)(param_1 + 4);
    *(undefined4 *)(param_2 + 0xc) = *(undefined4 *)(param_1 + 8);
    *(undefined4 *)(param_2 + 0x10) = *(undefined4 *)(param_1 + 0xc);
    param_2[0x14] = param_1[1];
    param_2[0x15] = bVar1 ^ 1;
    param_2[0x16] = param_1[0xa0];
    param_2[0x17] = param_1[0xa1];
    param_2[0x18] = param_1[0xa2];
    param_2[0x19] = param_1[100];
    param_2[0x1a] = param_1[0x65];
    param_2[0x1b] = param_1[0x75];
    uVar2 = FUN_0801b95a(param_1);
    param_2[0x1c] = uVar2;
    param_2[0x1d] = param_1[0x2c];
  }
  return CONCAT44(local_1c,param_1);
}


