/* Ghidra static pseudocode; not original source. */

undefined8 FUN_08021204(uint param_1,uint param_2,int param_3,int param_4)

{
  short sVar1;
  int iVar2;
  uint uVar3;
  undefined4 uVar4;
  uint local_20;
  
  uVar3 = 0;
  local_20 = param_1;
  if ((param_1 != 0) && (uVar3 = 0, param_2 < *(byte *)(param_1 + 0x230))) {
    iVar2 = param_1 + param_2 * 0x44;
    uVar3 = (uint)*(byte *)(iVar2 + 0x1c);
    if (uVar3 != 0) {
      if (param_3 == 0) {
        *(undefined1 **)(iVar2 + 0x2c) = &LAB_080211ac_1;
        *(undefined1 *)(iVar2 + 0x30) = 4;
        FUN_08016fce(iVar2 + 0x34,*(undefined4 *)(iVar2 + 0x28));
        local_20 = (uint)*(byte *)(iVar2 + 0xf);
        *(byte *)(iVar2 + 0x3c) = *(byte *)(iVar2 + 0xf);
        uVar4 = *(undefined4 *)(iVar2 + 0x24);
        *(undefined2 *)(iVar2 + 0x3e) = 0;
        sVar1 = FUN_08010160(uVar4,*(undefined4 *)(iVar2 + 0x28));
        *(short *)(iVar2 + 0x40) = sVar1;
        if (sVar1 != 0) {
          FUN_08017634("[pwm_pumps] ramping down from %u%% to 0%% over %ums (%u steps)",local_20,
                       uVar4,sVar1);
          goto LAB_0802127a;
        }
        *(undefined **)(iVar2 + 0x2c) = &DAT_0801e849;
        *(undefined1 *)(iVar2 + 0x30) = 0;
      }
      else {
        if (*(char *)(iVar2 + 0x10) != '\0') {
          if (param_4 == 0) {
            FUN_080210e0(iVar2);
          }
          else {
            *(undefined1 **)(iVar2 + 0x2c) = &LAB_08021140_1;
            *(undefined1 *)(iVar2 + 0x30) = 1;
            *(int *)(iVar2 + 0x40) = param_4;
            FUN_08017484(iVar2 + 0x34);
            FUN_08017006(iVar2 + 0x34);
            FUN_08017634("[pwm_pumps] scheduled ramp to %u%% after %ums delay",
                         *(undefined1 *)(iVar2 + 0x10),param_4);
          }
          goto LAB_0802127a;
        }
        *(undefined **)(iVar2 + 0x2c) = &DAT_0801e849;
        *(undefined1 *)(iVar2 + 0x30) = 0;
      }
      FUN_08020fbc(iVar2);
    }
  }
LAB_0802127a:
  return CONCAT44(local_20,uVar3);
}


