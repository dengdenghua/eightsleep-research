/* Ghidra static pseudocode; not original source. */

undefined8 FUN_080210e0(uint param_1,undefined4 param_2,undefined4 param_3)

{
  byte bVar1;
  ushort uVar2;
  uint uVar3;
  undefined4 uVar4;
  
  *(undefined1 **)(param_1 + 0x2c) = &LAB_08021162_1;
  *(undefined1 *)(param_1 + 0x30) = 2;
  uVar3 = param_1;
  FUN_08016fce(param_1 + 0x34,*(undefined4 *)(param_1 + 0x28));
  uVar4 = *(undefined4 *)(param_1 + 0x20);
  *(undefined2 *)(param_1 + 0x3c) = 0;
  uVar2 = FUN_08010160(uVar4,*(undefined4 *)(param_1 + 0x28));
  bVar1 = *(byte *)(param_1 + 0x10);
  *(ushort *)(param_1 + 0x3e) = uVar2;
  if (*(byte *)(param_1 + 0xf) < bVar1) {
    if (uVar2 != 0) {
      uVar3 = (uint)uVar2;
      FUN_08017634("[pwm_pumps] ramping up from %u%% to %u%% over %ums (%u steps)",
                   *(byte *)(param_1 + 0xf),bVar1,uVar4,uVar3,param_2,param_3);
      goto LAB_08021118;
    }
    FUN_08020fbc(param_1,bVar1);
  }
  FUN_0801e9a4(param_1);
LAB_08021118:
  return CONCAT44(param_2,uVar3);
}


