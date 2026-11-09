/* Ghidra static pseudocode; not original source. */

uint FUN_0802b598(uint param_1,uint param_2)

{
  uint uVar1;
  int iVar2;
  uint uVar3;
  uint uVar4;
  int iVar5;
  uint uVar6;
  int iVar7;
  uint uVar8;
  int iVar9;
  int iVar10;
  uint uVar11;
  uint uVar12;
  
  uVar3 = param_1 & 0x7fffff;
  uVar8 = (param_1 & 0x7fffffff) >> 0x17;
  uVar11 = param_1 >> 0x1f;
  if (uVar8 == 0) {
    if (uVar3 == 0) {
      uVar6 = 4;
      iVar7 = 1;
      iVar10 = 0;
    }
    else {
      iVar10 = FUN_080104dc(uVar3);
      uVar3 = uVar3 << (iVar10 - 5U & 0xff);
      uVar6 = 0;
      iVar7 = 0;
      iVar10 = -0x76 - iVar10;
    }
  }
  else if (uVar8 == 0xff) {
    if (uVar3 == 0) {
      uVar6 = 8;
      iVar7 = 2;
      iVar10 = 0xff;
    }
    else {
      uVar6 = 0xc;
      iVar7 = 3;
      iVar10 = 0xff;
    }
  }
  else {
    uVar3 = uVar3 << 3 | 0x4000000;
    uVar6 = 0;
    iVar7 = 0;
    iVar10 = uVar8 - 0x7f;
  }
  uVar8 = param_2 & 0x7fffff;
  uVar4 = (param_2 & 0x7fffffff) >> 0x17;
  uVar12 = param_2 >> 0x1f;
  uVar1 = uVar3;
  if (uVar4 != 0) {
    if (uVar4 == 0xff) {
      iVar5 = iVar10 + 0xff;
      if (uVar8 == 0) {
        uVar6 = uVar6 | 2;
        iVar9 = iVar10 + 0x100;
        if (uVar6 < 0xb) {
          iVar2 = 2;
          iVar10 = iVar5;
          goto LAB_0802b5f8;
        }
        goto LAB_0802b654;
      }
      uVar6 = uVar6 | 3;
      uVar4 = (param_1 ^ param_2) >> 0x1f;
      iVar9 = iVar10 + 0x100;
      if (uVar6 < 0xb) {
        iVar2 = 3;
        goto LAB_0802b646;
      }
      uVar1 = uVar12;
      uVar4 = uVar8;
      if (((uVar6 == 0xf) && (uVar1 = uVar11, uVar4 = uVar3, (uVar3 & 0x400000) != 0)) &&
         ((param_2 & 0x400000) == 0)) {
        uVar11 = 0xff;
        uVar8 = uVar8 | 0x400000;
        goto LAB_0802b612;
      }
    }
    else {
      uVar8 = uVar8 << 3 | 0x4000000;
      iVar10 = (uVar4 - 0x7f) + iVar10;
      iVar9 = iVar10 + 1;
joined_r0x0802b74c:
      iVar2 = 0;
      if (uVar6 < 0xb) goto LAB_0802b5f8;
LAB_0802b654:
      uVar8 = uVar1;
      iVar10 = iVar9;
      uVar12 = uVar11;
      if (iVar7 == 2) goto LAB_0802b6e8;
      uVar1 = uVar11;
      uVar4 = uVar8;
      if (iVar7 != 3) {
        if (iVar7 == 1) goto LAB_0802b60e;
        goto LAB_0802b668;
      }
    }
    uVar12 = uVar1;
    uVar11 = 0xff;
    uVar8 = uVar4 & 0x7fffff | 0x400000;
    goto LAB_0802b612;
  }
  if (uVar8 != 0) {
    iVar9 = FUN_080104dc(uVar8);
    uVar8 = uVar8 << (iVar9 - 5U & 0xff);
    iVar9 = iVar10 - iVar9;
    iVar10 = iVar9 + -0x76;
    iVar9 = iVar9 + -0x75;
    goto joined_r0x0802b74c;
  }
  uVar6 = uVar6 | 1;
  iVar2 = 1;
  iVar9 = iVar10 + 1;
  if (10 < uVar6) goto LAB_0802b654;
LAB_0802b5f8:
  uVar4 = (param_1 ^ param_2) >> 0x1f;
  iVar5 = iVar10;
  if (2 < uVar6) {
LAB_0802b646:
    uVar6 = 1 << uVar6;
    uVar11 = uVar4;
    if ((uVar6 & 0x530) == 0) {
      if ((uVar6 & 0x240) != 0) {
        uVar12 = 0;
        uVar11 = 0xff;
        uVar8 = 0x400000;
        goto LAB_0802b612;
      }
      iVar10 = iVar5;
      uVar11 = uVar12;
      uVar1 = uVar8;
      iVar7 = iVar2;
      if ((uVar6 & 0x88) == 0) goto LAB_0802b782;
    }
    goto LAB_0802b654;
  }
  if (uVar6 - 1 < 2) {
    uVar12 = uVar4;
    if (iVar2 == 2) goto LAB_0802b6e8;
    iVar10 = iVar9;
    if (iVar2 != 1) goto LAB_0802b668;
  }
  else {
LAB_0802b782:
    uVar6 = (uVar3 >> 0x10) * (uVar8 & 0xffff);
    uVar12 = (uVar3 & 0xffff) * (uVar8 & 0xffff);
    iVar7 = (uVar8 >> 0x10) * (uVar3 >> 0x10);
    uVar11 = (uVar12 >> 0x10) + (uVar3 & 0xffff) * (uVar8 >> 0x10) + uVar6;
    if (uVar11 <= uVar6 && uVar6 - uVar11 != 0) {
      iVar7 = iVar7 + 0x10000;
    }
    uVar6 = uVar11 * 0x10000 + (uVar12 & 0xffff);
    uVar3 = (uint)((uVar6 & 0x3ffffff) != 0);
    uVar6 = uVar6 >> 0x1a;
    iVar7 = (uVar11 >> 0x10) + iVar7;
    uVar8 = uVar3 | uVar6 | iVar7 * 0x40;
    uVar12 = uVar4;
    if (iVar7 * 0x400 < 0) {
      uVar8 = uVar3 | uVar6 & 1 | uVar8 >> 1;
      iVar10 = iVar9;
    }
LAB_0802b668:
    uVar11 = iVar10 + 0x7f;
    if (0 < (int)uVar11) {
      if (((uVar8 & 7) != 0) && ((uVar8 & 0xf) != 4)) {
        uVar8 = uVar8 + 4;
      }
      if ((int)(uVar8 << 4) < 0) {
        uVar8 = uVar8 & 0xf7ffffff;
        uVar11 = iVar10 + 0x80;
      }
      if ((int)uVar11 < 0xff) {
        uVar8 = (uVar8 & 0x3ffffff) >> 3;
        uVar11 = uVar11 & 0xff;
        goto LAB_0802b612;
      }
LAB_0802b6e8:
      uVar11 = 0xff;
      uVar8 = 0;
      goto LAB_0802b612;
    }
    if ((int)(1 - uVar11) < 0x1c) {
      uVar3 = uVar8 >> (1 - uVar11 & 0xff);
      uVar11 = (uint)(uVar8 << (iVar10 + 0x9eU & 0xff) != 0);
      uVar8 = uVar3 | uVar11;
      if (((uVar3 & 7) != 0 || uVar11 != 0) && ((uVar3 & 0xf | uVar11) != 4)) {
        uVar8 = uVar8 + 4;
      }
      if ((int)(uVar8 << 5) < 0) {
        uVar11 = 1;
        uVar8 = 0;
      }
      else {
        uVar11 = 0;
        uVar8 = (uVar8 & 0x3ffffff) >> 3;
      }
      goto LAB_0802b612;
    }
  }
LAB_0802b60e:
  uVar11 = 0;
  uVar8 = 0;
LAB_0802b612:
  return uVar11 << 0x17 | uVar8 | uVar12 << 0x1f;
}


