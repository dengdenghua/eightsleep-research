/* Ghidra static pseudocode; not original source. */

uint FUN_0802b1cc(uint param_1,uint param_2)

{
  int iVar1;
  uint uVar2;
  uint uVar3;
  int iVar4;
  uint uVar5;
  uint uVar6;
  uint uVar7;
  uint uVar8;
  int iVar9;
  uint uVar10;
  int iVar11;
  bool bVar12;
  
  uVar6 = param_1 & 0x7fffff;
  uVar8 = (param_1 & 0x7fffffff) >> 0x17;
  uVar7 = param_1 >> 0x1f;
  if (uVar8 == 0) {
    if (uVar6 == 0) {
      uVar10 = 4;
      iVar11 = 1;
      iVar9 = 0;
    }
    else {
      iVar9 = FUN_080104dc(uVar6);
      uVar6 = uVar6 << (iVar9 - 5U & 0xff);
      uVar10 = 0;
      iVar11 = 0;
      iVar9 = -0x76 - iVar9;
    }
  }
  else if (uVar8 == 0xff) {
    if (uVar6 == 0) {
      uVar10 = 8;
      iVar11 = 2;
      iVar9 = 0xff;
    }
    else {
      uVar10 = 0xc;
      iVar11 = 3;
      iVar9 = 0xff;
    }
  }
  else {
    uVar10 = 0;
    iVar11 = 0;
    uVar6 = uVar6 << 3 | 0x4000000;
    iVar9 = uVar8 - 0x7f;
  }
  uVar2 = param_2 & 0x7fffff;
  uVar3 = (param_2 & 0x7fffffff) >> 0x17;
  uVar8 = param_2 >> 0x1f;
  if (uVar3 == 0) {
    if (uVar2 != 0) {
      iVar4 = FUN_080104dc(uVar2);
      uVar2 = uVar2 << (iVar4 - 5U & 0xff);
      iVar4 = -0x76 - iVar4;
      iVar1 = 0;
      goto LAB_0802b21e;
    }
    uVar2 = 1;
LAB_0802b24a:
    uVar3 = (param_1 ^ param_2) >> 0x1f;
    switch(uVar10 | uVar2) {
    case 2:
    case 4:
    case 6:
      goto switchD_0802b234_caseD_2;
    case 3:
    case 7:
    case 0xb:
      uVar6 = 0;
      uVar10 = -(uint)(uVar2 == 2) & 0xff;
      goto LAB_0802b2d0;
    case 5:
    case 10:
      goto switchD_0802b234_caseD_5;
    case 0xc:
    case 0xd:
    case 0xe:
      goto switchD_0802b234_caseD_c;
    }
switchD_0802b234_caseD_1:
    uVar7 = uVar3;
  }
  else {
    if (uVar3 == 0xff) {
      if (uVar2 == 0) {
        iVar9 = iVar9 + -0xff;
        uVar2 = 2;
        goto LAB_0802b24a;
      }
      uVar10 = uVar10 | 3;
      iVar1 = 3;
      iVar4 = 0xff;
    }
    else {
      uVar2 = uVar2 << 3 | 0x4000000;
      iVar1 = 0;
      iVar4 = uVar3 - 0x7f;
    }
LAB_0802b21e:
    iVar9 = iVar9 - iVar4;
    uVar3 = (param_1 ^ param_2) >> 0x1f;
    switch(uVar10) {
    default:
      uVar6 = uVar6 * 0x20;
      uVar7 = uVar2 * 0x20;
      bVar12 = uVar7 <= uVar6;
      if (bVar12) {
        iVar11 = 0x1a;
        uVar6 = uVar6 + uVar2 * -0x20;
      }
      else {
        iVar11 = 0x1b;
        iVar9 = iVar9 + -1;
      }
      uVar10 = (uint)bVar12;
      do {
        uVar10 = uVar10 << 1;
        uVar5 = uVar6 * 2;
        if (((int)uVar6 < 0) || (uVar7 < uVar5 || uVar7 + uVar6 * -2 == 0)) {
          uVar5 = uVar5 + uVar2 * -0x20;
          uVar10 = uVar10 | 1;
        }
        iVar11 = iVar11 + -1;
        uVar6 = uVar5;
      } while (iVar11 != 0);
      uVar8 = uVar3;
      uVar2 = uVar5 != 0 | uVar10;
      break;
    case 1:
    case 8:
    case 9:
      goto switchD_0802b234_caseD_1;
    case 2:
    case 4:
    case 6:
switchD_0802b234_caseD_2:
      uVar10 = 0;
      uVar6 = 0;
      uVar8 = uVar3;
      goto LAB_0802b2d0;
    case 3:
    case 7:
    case 0xb:
      uVar6 = uVar2;
      uVar7 = uVar8;
      if (iVar1 == 3) goto LAB_0802b35c;
      break;
    case 5:
    case 10:
switchD_0802b234_caseD_5:
      uVar10 = 0xff;
      uVar6 = 0x400000;
      uVar8 = 0;
      goto LAB_0802b2d0;
    case 0xc:
    case 0xd:
    case 0xe:
switchD_0802b234_caseD_c:
      if (iVar11 == 2) goto LAB_0802b2cc;
      if (iVar11 == 3) goto LAB_0802b35c;
      uVar8 = uVar7;
      uVar2 = uVar6;
      if (iVar11 != 1) break;
      goto LAB_0802b2fa;
    case 0xf:
      if (((uVar6 & 0x400000) != 0) && ((uVar2 & 0x400000) == 0)) {
        uVar10 = 0xff;
        uVar6 = uVar2 & 0x7fffff | 0x400000;
        goto LAB_0802b2d0;
      }
LAB_0802b35c:
      uVar10 = 0xff;
      uVar6 = uVar6 & 0x7fffff | 0x400000;
      uVar8 = uVar7;
      goto LAB_0802b2d0;
    }
    uVar10 = iVar9 + 0x7f;
    uVar7 = uVar8;
    if ((int)uVar10 < 1) {
      if ((int)(1 - uVar10) < 0x1c) {
        uVar7 = uVar2 >> (1 - uVar10 & 0xff);
        uVar6 = (uint)(uVar2 << (iVar9 + 0x9eU & 0xff) != 0);
        uVar2 = uVar7 | uVar6;
        if (((uVar7 & 7) != 0 || uVar6 != 0) && ((uVar7 & 0xf | uVar6) != 4)) {
          uVar2 = uVar2 + 4;
        }
        if ((int)(uVar2 << 5) < 0) {
          uVar10 = 1;
          uVar6 = 0;
        }
        else {
          uVar10 = 0;
          uVar6 = (uVar2 & 0x3ffffff) >> 3;
        }
      }
      else {
LAB_0802b2fa:
        uVar10 = 0;
        uVar6 = 0;
        uVar8 = uVar7;
      }
      goto LAB_0802b2d0;
    }
    if (((uVar2 & 7) != 0) && ((uVar2 & 0xf) != 4)) {
      uVar2 = uVar2 + 4;
    }
    if ((int)(uVar2 << 4) < 0) {
      uVar2 = uVar2 & 0xf7ffffff;
      uVar10 = iVar9 + 0x80;
    }
    if ((int)uVar10 < 0xff) {
      uVar6 = (uVar2 & 0x3ffffff) >> 3;
      uVar10 = uVar10 & 0xff;
      goto LAB_0802b2d0;
    }
  }
LAB_0802b2cc:
  uVar10 = 0xff;
  uVar6 = 0;
  uVar8 = uVar7;
LAB_0802b2d0:
  return uVar10 << 0x17 | uVar6 | uVar8 << 0x1f;
}


