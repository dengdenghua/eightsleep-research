/* Static Ghidra pseudocode; not original source. */

void FUN_00036100(uint *param_1)

{
  uint *puVar1;
  uint uVar2;
  uint *puVar3;
  uint *puVar4;
  uint uVar5;
  
  if (DAT_20003674 != (uint *)0x0) {
    uVar2 = *param_1;
    puVar1 = DAT_20003674;
    puVar3 = DAT_20003674;
    if (*DAT_20003674 < uVar2) {
      do {
        puVar4 = puVar1;
        uVar5 = *puVar4;
        if (uVar2 <= uVar5) {
          *puVar4 = uVar5 - uVar2;
          puVar1 = puVar4;
          puVar4 = puVar3;
          break;
        }
        puVar1 = (uint *)puVar4[7];
        uVar2 = uVar2 - uVar5;
        puVar3 = puVar4;
      } while (puVar1 != (uint *)0x0);
      *param_1 = uVar2;
      param_1[7] = (uint)puVar1;
      puVar4[7] = (uint)param_1;
      return;
    }
    *DAT_20003674 = *DAT_20003674 - uVar2;
    param_1[7] = (uint)DAT_20003674;
  }
  DAT_20003674 = param_1;
  return;
}


