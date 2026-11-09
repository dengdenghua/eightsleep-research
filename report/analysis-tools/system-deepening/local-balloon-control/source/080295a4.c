/* Ghidra static pseudocode; not original source. */

uint FUN_080295a4(uint param_1)

{
  int iVar1;
  int iVar2;
  undefined4 uVar3;
  undefined4 uVar4;
  int iVar5;
  uint uVar6;
  uint uVar7;
  int iVar8;
  uint uVar9;
  
  uVar4 = DAT_2000046c;
  if ((param_1 & 0x7fffffff) < 0x7f800000) {
    if ((param_1 & 0x7fffffff) != 0) {
      if ((int)param_1 < 0) {
        uVar4 = FUN_0802b814(param_1,param_1);
        param_1 = FUN_0802b1cc(uVar4,uVar4);
      }
      else {
        iVar1 = (int)param_1 >> 0x17;
        if ((param_1 & 0x7f800000) == 0) {
          if ((param_1 & 0x800000) == 0) {
            iVar5 = 0;
            do {
              iVar8 = iVar5;
              param_1 = param_1 << 1;
              iVar5 = iVar8 + 1;
            } while ((param_1 & 0x800000) == 0);
            iVar1 = iVar1 - iVar8;
          }
          else {
            iVar1 = iVar1 + 1;
          }
        }
        uVar7 = param_1 & 0x7fffff | 0x800000;
        if (-1 < iVar1 << 0x1f) {
          uVar7 = uVar7 << 1;
        }
        iVar5 = 0x19;
        uVar9 = 0;
        iVar8 = 0;
        uVar6 = 0x1000000;
        do {
          uVar7 = uVar7 * 2;
          iVar2 = iVar8 + uVar6;
          if (iVar2 <= (int)uVar7) {
            iVar8 = iVar2 + uVar6;
            uVar7 = uVar7 - iVar2;
            uVar9 = uVar9 + uVar6;
          }
          iVar5 = iVar5 + -1;
          uVar6 = uVar6 >> 1;
        } while (iVar5 != 0);
        if (uVar7 != 0) {
          uVar3 = FUN_0802b814(DAT_2000046c,DAT_20000468);
          iVar5 = FUN_08010550(uVar4,uVar3);
          if (iVar5 != 0) {
            uVar4 = FUN_0802aeb8(DAT_2000046c,DAT_20000468);
            iVar5 = FUN_0801053c(DAT_2000046c,uVar4);
            if (iVar5 == 0) {
              uVar9 = uVar9 + 1 & 0xfffffffe;
            }
            else {
              uVar9 = uVar9 + 2;
            }
          }
        }
        param_1 = (iVar1 + -0x7f >> 1) * 0x800000 + ((int)uVar9 >> 1) + 0x3f000000;
      }
    }
  }
  else {
    uVar4 = FUN_0802b598(param_1,param_1);
    param_1 = FUN_0802aeb8(uVar4,param_1);
  }
  return param_1;
}


