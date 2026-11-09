/* Reconstructed Ghidra pseudocode, not vendor source. */

undefined8 FUN_0028b2b8(long param_1,undefined8 param_2)

{
  long lVar1;
  undefined8 uVar2;
  ulong uVar3;
  ulong uVar4;
  undefined1 auVar5 [16];
  
  uVar3 = *(ulong *)(param_1 + 0x478);
  uVar4 = *(ulong *)(param_1 + 0x458);
  if (uVar3 < uVar4) {
    do {
      auVar5 = FUN_0028a82c(param_1,param_2,*(long *)(param_1 + 0x450) + uVar3,uVar4 - uVar3);
      lVar1 = auVar5._8_8_;
      if (auVar5._0_8_ != 0) {
        if (auVar5._0_8_ != 1) {
          return 1;
        }
        if (lVar1 != 0) {
          return 0;
        }
        goto LAB_0028b318;
      }
      if (lVar1 == 0) goto LAB_0028b3c0;
      uVar4 = *(ulong *)(param_1 + 0x458);
      uVar3 = *(long *)(param_1 + 0x478) + lVar1;
      *(ulong *)(param_1 + 0x478) = uVar3;
    } while (uVar3 < uVar4);
  }
  *(undefined8 *)(param_1 + 0x458) = 0;
  *(undefined8 *)(param_1 + 0x478) = 0;
LAB_0028b318:
  if ((*(byte *)(param_1 + 0x480) & 1) != 0) {
    lVar1 = FUN_0027d50c(param_1,1,0,2);
    if (lVar1 != 0) {
      return 0;
    }
    *(undefined1 *)(param_1 + 0x480) = 0;
  }
  uVar3 = *(ulong *)(param_1 + 0x478);
  uVar4 = *(ulong *)(param_1 + 0x458);
  if (uVar3 < uVar4) {
    do {
      auVar5 = FUN_0028a82c(param_1,param_2,*(long *)(param_1 + 0x450) + uVar3,uVar4 - uVar3);
      lVar1 = auVar5._8_8_;
      if (auVar5._0_8_ != 0) {
        if (auVar5._0_8_ != 1) {
          return 1;
        }
        if (lVar1 != 0) {
          return 0;
        }
        goto LAB_0028b38c;
      }
      if (lVar1 == 0) {
LAB_0028b3c0:
        FUN_00746978(0x17,"inner writer returned 0",0x17);
        return 0;
      }
      uVar4 = *(ulong *)(param_1 + 0x458);
      uVar3 = *(long *)(param_1 + 0x478) + lVar1;
      *(ulong *)(param_1 + 0x478) = uVar3;
    } while (uVar3 < uVar4);
  }
  *(undefined8 *)(param_1 + 0x458) = 0;
  *(undefined8 *)(param_1 + 0x478) = 0;
LAB_0028b38c:
  uVar2 = FUN_0028a4dc(param_1,param_2);
  return uVar2;
}


