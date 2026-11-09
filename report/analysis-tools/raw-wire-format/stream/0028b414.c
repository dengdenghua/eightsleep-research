/* Reconstructed Ghidra pseudocode, not vendor source. */

undefined1  [16] FUN_0028b414(long param_1,undefined8 param_2,undefined8 param_3,ulong param_4)

{
  undefined1 auVar1 [16];
  long lVar2;
  undefined8 uVar3;
  ulong uVar4;
  ulong uVar5;
  undefined1 auVar6 [16];
  undefined1 auVar7 [16];
  undefined1 auVar8 [16];
  
  uVar4 = *(ulong *)(param_1 + 0x478);
  uVar5 = *(ulong *)(param_1 + 0x458);
  if (uVar4 < uVar5) {
    do {
      auVar6 = FUN_0028a82c(param_1,param_2,*(long *)(param_1 + 0x450) + uVar4,uVar5 - uVar4);
      if (auVar6._0_8_ != 0) {
        if (auVar6._0_8_ != 1) {
          return auVar6;
        }
        if (auVar6._8_8_ != 0) {
          auVar6._0_8_ = 1;
          return auVar6;
        }
        goto LAB_0028b480;
      }
      if (auVar6._8_8_ == 0) {
        uVar3 = FUN_00746978(0x17,"inner writer returned 0",0x17);
        auVar8._8_8_ = uVar3;
        auVar8._0_8_ = 1;
        return auVar8;
      }
      uVar5 = *(ulong *)(param_1 + 0x458);
      uVar4 = *(long *)(param_1 + 0x478) + auVar6._8_8_;
      *(ulong *)(param_1 + 0x478) = uVar4;
    } while (uVar4 < uVar5);
  }
  *(undefined8 *)(param_1 + 0x458) = 0;
  *(undefined8 *)(param_1 + 0x478) = 0;
LAB_0028b480:
  lVar2 = FUN_0027d50c(param_1,param_3,param_4,0);
  if (lVar2 != 0) {
    auVar7._8_8_ = lVar2;
    auVar7._0_8_ = 1;
    return auVar7;
  }
  uVar4 = *(ulong *)(param_1 + 0x478);
  uVar5 = *(ulong *)(param_1 + 0x458);
  *(undefined1 *)(param_1 + 0x480) = 1;
  if (uVar4 < uVar5) {
    do {
      auVar6 = FUN_0028a82c(param_1,param_2,*(long *)(param_1 + 0x450) + uVar4,uVar5 - uVar4);
      lVar2 = auVar6._8_8_;
      if (auVar6._0_8_ != 0) {
        if (auVar6._0_8_ == 1) {
          uVar3 = 0;
        }
        else {
          uVar3 = 1;
        }
        goto LAB_0028b52c;
      }
      if (lVar2 == 0) {
        lVar2 = FUN_00746978(0x17,"inner writer returned 0",0x17);
        uVar3 = 0;
        goto LAB_0028b52c;
      }
      uVar5 = *(ulong *)(param_1 + 0x458);
      uVar4 = *(long *)(param_1 + 0x478) + lVar2;
      *(ulong *)(param_1 + 0x478) = uVar4;
    } while (uVar4 < uVar5);
  }
  lVar2 = 0;
  uVar3 = 0;
  *(undefined8 *)(param_1 + 0x458) = 0;
  *(undefined8 *)(param_1 + 0x478) = 0;
LAB_0028b52c:
  FUN_0026de4c(uVar3,lVar2);
  auVar1._8_8_ = 0;
  auVar1._0_8_ = param_4;
  return auVar1 << 0x40;
}


