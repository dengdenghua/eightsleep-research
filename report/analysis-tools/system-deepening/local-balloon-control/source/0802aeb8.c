/* Ghidra static pseudocode; not original source. */

uint FUN_0802aeb8(uint param_1,uint param_2)

{
  uint uVar1;
  int iVar2;
  uint uVar3;
  uint uVar4;
  uint uVar5;
  uint uVar6;
  uint uVar7;
  int iVar8;
  uint uVar9;
  uint uVar10;
  uint uVar11;
  
  iVar8 = -((int)param_1 >> 0x1f);
  uVar10 = (param_1 & 0x7fffffff) >> 0x17;
  uVar1 = (param_2 & 0x7fffffff) >> 0x17;
  uVar3 = param_1 & 0x7fffff;
  uVar5 = uVar3 * 8;
  iVar2 = -((int)param_2 >> 0x1f);
  uVar9 = param_2 & 0x7fffff;
  uVar11 = uVar9 * 8;
  uVar4 = uVar10 - uVar1;
  uVar7 = uVar11;
  uVar6 = uVar5;
  if (iVar8 == iVar2) {
    if (0 < (int)uVar4) {
      if (uVar1 == 0) {
        iVar2 = iVar8;
        if (uVar9 == 0) goto LAB_0802b00c;
        uVar3 = uVar4 - 1;
        if (uVar4 == 1) {
          uVar6 = uVar5 + uVar11;
          uVar4 = 2;
          uVar10 = 1;
          if (-1 < (int)(uVar6 * 0x20)) goto LAB_0802af70;
LAB_0802b0ee:
          uVar6 = uVar6 >> 1 & 0x7dffffff | uVar6 & 1;
          goto LAB_0802b04c;
        }
        if (uVar4 != 0xff) goto LAB_0802af3c;
      }
      else if (uVar10 != 0xff) {
        uVar11 = uVar11 | 0x4000000;
        uVar3 = uVar4;
LAB_0802af3c:
        if ((int)uVar3 < 0x1c) {
          uVar6 = uVar5 + ((uint)(uVar11 << (0x20 - uVar3 & 0xff) != 0) | uVar11 >> (uVar3 & 0xff));
          goto LAB_0802aff8;
        }
        uVar6 = uVar5 + 1;
        uVar4 = uVar10;
LAB_0802af78:
        if ((uVar6 & 0xf) != 4) {
          uVar6 = uVar6 + 4;
        }
        goto LAB_0802af82;
      }
LAB_0802b056:
      iVar2 = iVar8;
      uVar6 = uVar6 >> 3;
      goto LAB_0802b012;
    }
    if (uVar4 != 0) {
      uVar4 = uVar1 - uVar10;
      if (uVar10 == 0) {
        uVar6 = uVar11;
        iVar2 = iVar8;
        if (uVar3 == 0) goto LAB_0802b00c;
        uVar3 = uVar4 - 1;
        if (uVar4 == 1) {
          uVar6 = uVar5 + uVar11;
          uVar4 = 2;
          uVar10 = 1;
          if ((int)(uVar6 * 0x20) < 0) goto LAB_0802b0ee;
          goto LAB_0802af70;
        }
        if (uVar4 != 0xff) goto LAB_0802b076;
      }
      else {
        uVar6 = uVar11;
        if (uVar1 != 0xff) {
          uVar5 = uVar5 | 0x4000000;
          uVar3 = uVar4;
LAB_0802b076:
          if (0x1b < (int)uVar3) {
            uVar6 = uVar11 + 1;
            uVar4 = uVar1;
            goto LAB_0802af78;
          }
          uVar6 = ((uint)(uVar5 << (0x20 - uVar3 & 0xff) != 0) | uVar5 >> (uVar3 & 0xff)) + uVar11;
          uVar10 = uVar1;
LAB_0802aff8:
          if ((int)(uVar6 << 5) < 0) {
            uVar4 = uVar10 + 1;
            if (uVar10 != 0xfe) goto LAB_0802b0ee;
            goto LAB_0802b002;
          }
LAB_0802af70:
          uVar4 = uVar10;
          iVar2 = iVar8;
          if ((uVar6 & 7) == 0) goto LAB_0802b00c;
          goto LAB_0802af78;
        }
      }
      goto LAB_0802b056;
    }
    uVar4 = uVar10 + 1;
    if ((uVar4 & 0xfe) != 0) {
      if (uVar4 == 0xff) goto LAB_0802b002;
      uVar6 = uVar5 + uVar11 >> 1;
      if ((uVar6 & 7) != 0) goto LAB_0802af78;
LAB_0802b118:
      uVar6 = uVar6 >> 3;
LAB_0802b0a0:
      uVar6 = uVar6 & 0x7fffff;
      uVar4 = uVar4 & 0xff;
      goto LAB_0802af92;
    }
    if (uVar10 == 0) {
      if ((uVar3 == 0) || (uVar7 = uVar5, uVar9 == 0)) goto LAB_0802b09c;
      uVar6 = uVar5 + uVar11;
      uVar4 = 0;
      if (-1 < (int)(uVar6 * 0x20)) goto LAB_0802b118;
      uVar6 = (uVar6 & 0xfbffffff) >> 3;
      uVar4 = 1;
      goto LAB_0802b0a0;
    }
    uVar6 = uVar11;
    if ((uVar3 == 0) || (uVar6 = uVar5, uVar9 == 0)) goto LAB_0802b056;
    if ((0x3fffff < (param_1 & 0x7fffff)) && ((param_2 & 0x7fffff) < 0x400000)) {
      uVar5 = uVar11;
    }
LAB_0802b16a:
    uVar6 = uVar5 >> 3;
LAB_0802b016:
    uVar4 = 0xff;
    uVar6 = uVar6 & 0x7fffff | 0x400000;
  }
  else {
    if ((int)uVar4 < 1) {
      if (uVar4 != 0) {
        uVar4 = uVar1 - uVar10;
        if (uVar10 == 0) {
          uVar6 = uVar11;
          if (uVar3 == 0) goto LAB_0802b00c;
          uVar9 = uVar4 - 1;
          if (uVar4 == 1) {
            uVar6 = uVar11 + uVar3 * -8;
            uVar1 = 1;
            goto LAB_0802af6c;
          }
          iVar8 = iVar2;
          if (uVar4 != 0xff) goto LAB_0802b0b2;
        }
        else {
          uVar6 = uVar11;
          iVar8 = iVar2;
          if (uVar1 != 0xff) {
            uVar5 = uVar5 | 0x4000000;
            uVar9 = uVar4;
LAB_0802b0b2:
            uVar6 = 1;
            if ((int)uVar9 < 0x1c) {
              uVar6 = uVar5 >> (uVar9 & 0xff) | (uint)(uVar5 << (0x20 - uVar9 & 0xff) != 0);
            }
            uVar6 = uVar11 - uVar6;
            goto LAB_0802af6c;
          }
        }
        goto LAB_0802b056;
      }
      if ((uVar10 + 1 & 0xfe) == 0) {
        if (uVar10 == 0) {
          if (uVar3 == 0) {
            iVar8 = iVar2;
            if (uVar9 != 0) {
LAB_0802b09c:
              uVar4 = 0;
              uVar6 = uVar7 >> 3;
              goto LAB_0802b0a0;
            }
          }
          else {
            uVar7 = uVar5;
            if (uVar9 == 0) goto LAB_0802b09c;
            uVar5 = uVar5 + uVar9 * -8;
            if ((int)(uVar5 * 0x20) < 0) {
              uVar6 = uVar11 + uVar3 * -8;
              iVar8 = iVar2;
              goto LAB_0802b04c;
            }
            if (uVar5 != 0) {
              uVar6 = uVar5 >> 3;
              goto LAB_0802b0a0;
            }
          }
LAB_0802b0da:
          iVar8 = 0;
          uVar4 = 0;
          uVar6 = 0;
          goto LAB_0802af92;
        }
        if (uVar3 == 0) {
          uVar6 = uVar11;
          iVar8 = iVar2;
          if (uVar9 == 0) {
            iVar8 = 0;
            uVar4 = 0xff;
            uVar6 = 0x400000;
            goto LAB_0802af92;
          }
        }
        else if (uVar9 != 0) {
          if ((0x3fffff < (param_1 & 0x7fffff)) && ((param_2 & 0x7fffff) < 0x400000)) {
            uVar5 = uVar11;
            iVar8 = iVar2;
          }
          goto LAB_0802b16a;
        }
        goto LAB_0802b056;
      }
      uVar6 = uVar5 + uVar9 * -8;
      if ((int)(uVar6 * 0x20) < 0) {
        uVar6 = uVar11 + uVar3 * -8;
      }
      else {
        iVar2 = iVar8;
        if (uVar6 == 0) goto LAB_0802b0da;
      }
LAB_0802b028:
      iVar8 = FUN_080104dc(uVar6);
      uVar4 = iVar8 - 5;
      uVar6 = uVar6 << (uVar4 & 0xff);
      iVar8 = iVar2;
      if ((int)uVar4 < (int)uVar10) {
        uVar4 = uVar10 - uVar4;
        uVar6 = uVar6 & 0xfbffffff;
      }
      else {
        uVar3 = (uVar4 - uVar10) + 1;
        uVar4 = 0;
        uVar6 = uVar6 >> (uVar3 & 0xff) | (uint)(uVar6 << (0x20 - uVar3 & 0xff) != 0);
      }
LAB_0802b04c:
      if ((uVar6 & 7) != 0) goto LAB_0802af78;
LAB_0802af82:
      iVar2 = iVar8;
      if (-1 < (int)(uVar6 << 5)) goto LAB_0802b00c;
      if (uVar4 != 0xfe) {
        uVar4 = uVar4 + 1 & 0xff;
        uVar6 = (uVar6 & 0x3ffffff) >> 3;
        goto LAB_0802af92;
      }
    }
    else {
      if (uVar1 != 0) {
        if (uVar10 != 0xff) {
          uVar11 = uVar11 | 0x4000000;
          uVar3 = uVar4;
LAB_0802af52:
          uVar6 = 1;
          if ((int)uVar3 < 0x1c) {
            uVar6 = uVar11 >> (uVar3 & 0xff) | (uint)(uVar11 << (0x20 - uVar3 & 0xff) != 0);
          }
          uVar6 = uVar5 - uVar6;
          iVar2 = iVar8;
          uVar1 = uVar10;
LAB_0802af6c:
          iVar8 = iVar2;
          uVar10 = uVar1;
          if (-1 < (int)(uVar6 << 5)) goto LAB_0802af70;
          uVar6 = uVar6 & 0x3ffffff;
          goto LAB_0802b028;
        }
        goto LAB_0802b056;
      }
      iVar2 = iVar8;
      if (uVar9 != 0) {
        uVar3 = uVar4 - 1;
        if (uVar4 == 1) {
          uVar6 = uVar5 + uVar9 * -8;
          uVar1 = 1;
          goto LAB_0802af6c;
        }
        if (uVar4 != 0xff) goto LAB_0802af52;
        goto LAB_0802b056;
      }
LAB_0802b00c:
      uVar6 = uVar6 >> 3;
      iVar8 = iVar2;
      if (uVar4 != 0xff) goto LAB_0802b0a0;
LAB_0802b012:
      iVar8 = iVar2;
      if (uVar6 != 0) goto LAB_0802b016;
    }
LAB_0802b002:
    uVar4 = 0xff;
    uVar6 = 0;
  }
LAB_0802af92:
  return uVar4 << 0x17 | uVar6 | iVar8 << 0x1f;
}


