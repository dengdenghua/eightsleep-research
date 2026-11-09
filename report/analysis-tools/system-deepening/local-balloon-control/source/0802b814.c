/* Ghidra static pseudocode; not original source. */

uint FUN_0802b814(uint param_1,uint param_2)

{
  uint uVar1;
  int iVar2;
  uint uVar3;
  uint uVar4;
  uint uVar5;
  uint uVar6;
  uint uVar7;
  uint uVar8;
  uint uVar9;
  uint uVar10;
  uint uVar11;
  uint uVar12;
  bool bVar13;
  
  uVar10 = -((int)param_1 >> 0x1f);
  uVar11 = (param_1 & 0x7fffffff) >> 0x17;
  uVar6 = param_1 & 0x7fffff;
  uVar7 = uVar6 * 8;
  uVar1 = (param_2 & 0x7fffffff) >> 0x17;
  uVar3 = -((int)param_2 >> 0x1f);
  uVar4 = param_2 & 0x7fffff;
  uVar12 = uVar4 * 8;
  uVar8 = uVar12;
  uVar9 = uVar7;
  if (uVar1 == 0xff) {
    if (uVar4 == 0) {
      uVar3 = uVar3 ^ 1;
      if (uVar10 == uVar3) {
        if (uVar11 == 0xff) goto LAB_0802b944;
        if (uVar11 == 0) goto LAB_0802ba5a;
        uVar9 = 0;
        goto LAB_0802b8a4;
      }
LAB_0802b892:
      if (uVar11 == 0xff) {
LAB_0802b9d4:
        if ((uVar11 + 1 & 0xfe) != 0) {
          uVar7 = uVar7 + uVar4 * -8;
          if ((int)(uVar7 * 0x20) < 0) {
            uVar7 = uVar12 + uVar6 * -8;
            uVar10 = uVar3;
          }
          else if (uVar7 == 0) goto LAB_0802ba0c;
          goto LAB_0802b9a8;
        }
        if (uVar11 == 0) {
          if (uVar6 == 0) {
            uVar10 = uVar3;
            if (uVar4 != 0) goto LAB_0802b960;
          }
          else {
            uVar8 = uVar7;
            if (uVar4 == 0) {
LAB_0802b960:
              uVar5 = 0;
              uVar7 = uVar8 >> 3;
              goto LAB_0802b964;
            }
            uVar7 = uVar7 + uVar4 * -8;
            if ((int)(uVar7 * 0x20) < 0) {
              uVar5 = 0;
              uVar9 = uVar12 + uVar6 * -8;
              uVar10 = uVar3;
              goto LAB_0802b9cc;
            }
            if (uVar7 != 0) {
              uVar5 = 0;
              uVar7 = uVar7 >> 3;
              goto LAB_0802b964;
            }
          }
LAB_0802ba0c:
          uVar10 = 0;
          uVar5 = 0;
          uVar7 = 0;
          goto LAB_0802b904;
        }
        if (uVar6 != 0) goto LAB_0802baac;
        uVar9 = uVar12;
        uVar10 = uVar3;
        if (uVar4 == 0) {
          uVar10 = 0;
          uVar5 = 0xff;
          uVar7 = 0x400000;
          goto LAB_0802b904;
        }
      }
      else {
        uVar9 = uVar12;
        uVar10 = uVar3;
        if (uVar11 == 0) {
          uVar5 = 0xff;
LAB_0802b992:
          uVar9 = uVar12;
          if (uVar6 == 0) goto LAB_0802b99a;
          uVar10 = uVar3;
          if (uVar5 == 1) {
            uVar11 = 1;
            uVar9 = uVar12 + uVar6 * -8;
            goto LAB_0802b8de;
          }
          bVar13 = uVar5 != 0xff;
          uVar5 = uVar5 - 1;
          if (bVar13) goto LAB_0802ba3a;
        }
      }
LAB_0802b8a4:
      uVar7 = uVar9 >> 3;
LAB_0802b8a6:
      if (uVar7 == 0) goto LAB_0802b98a;
    }
    else {
      if (uVar10 != uVar3) goto LAB_0802b892;
      if (uVar11 != 0xff) {
        uVar9 = uVar12;
        if (uVar11 == 0) {
LAB_0802ba5a:
          uVar5 = 0xff;
          goto LAB_0802ba5c;
        }
        goto LAB_0802b8a4;
      }
LAB_0802b944:
      uVar5 = uVar11 + 1;
      if ((uVar5 & 0xfe) != 0) {
        if (uVar5 == 0xff) goto LAB_0802b98a;
        uVar9 = uVar7 + uVar12 >> 1;
        if ((uVar9 & 7) != 0) goto LAB_0802b8ea;
LAB_0802ba82:
        uVar7 = uVar9 >> 3;
        goto LAB_0802b964;
      }
      if (uVar11 == 0) {
        if ((uVar6 != 0) && (uVar8 = uVar7, uVar4 != 0)) {
          uVar9 = uVar7 + uVar12;
          uVar5 = 0;
          if (-1 < (int)(uVar9 * 0x20)) goto LAB_0802ba82;
          uVar7 = (uVar9 & 0xfbffffff) >> 3;
          uVar5 = 1;
          goto LAB_0802b964;
        }
        goto LAB_0802b960;
      }
      uVar9 = uVar12;
      if (uVar6 == 0) goto LAB_0802b8a4;
LAB_0802baac:
      uVar9 = uVar7;
      if (uVar4 == 0) goto LAB_0802b8a4;
      if ((0x3fffff < (param_1 & 0x7fffff)) && ((param_2 & 0x7fffff) < 0x400000)) {
        uVar7 = uVar12;
        uVar10 = uVar3;
      }
      uVar7 = uVar7 >> 3;
    }
    uVar5 = 0xff;
    uVar7 = uVar7 & 0x7fffff | 0x400000;
  }
  else {
    uVar3 = uVar3 ^ 1;
    uVar5 = uVar11 - uVar1;
    if (uVar10 == uVar3) {
      if (0 < (int)uVar5) {
        if (uVar1 != 0) {
          if (uVar11 != 0xff) {
            uVar12 = uVar12 | 0x4000000;
            uVar6 = uVar5;
LAB_0802b878:
            if ((int)uVar6 < 0x1c) {
              uVar9 = uVar7 + ((uint)(uVar12 << (0x20 - uVar6 & 0xff) != 0) |
                              uVar12 >> (uVar6 & 0xff));
              goto LAB_0802b980;
            }
            uVar9 = uVar7 + 1;
            uVar5 = uVar11;
            goto LAB_0802b8ea;
          }
          goto LAB_0802b8a4;
        }
        uVar3 = uVar10;
        if (uVar4 != 0) {
          uVar6 = uVar5 - 1;
          if (uVar5 == 1) {
LAB_0802ba14:
            uVar11 = 1;
            uVar9 = uVar7 + uVar12;
            uVar5 = 1;
            if ((int)(uVar9 * 0x20) < 0) goto LAB_0802ba20;
            goto LAB_0802b8e2;
          }
          if (uVar5 != 0xff) goto LAB_0802b878;
          goto LAB_0802b8a4;
        }
        goto LAB_0802b99a;
      }
      if (uVar5 == 0) goto LAB_0802b944;
      uVar4 = uVar1 - uVar11;
      uVar5 = uVar4;
      if (uVar11 == 0) {
LAB_0802ba5c:
        uVar9 = uVar12;
        uVar3 = uVar10;
        if (uVar6 == 0) goto LAB_0802b99a;
        uVar4 = uVar5 - 1;
        if (uVar5 == 1) goto LAB_0802ba14;
        if (uVar5 == 0xff) goto LAB_0802b8a4;
      }
      else {
        uVar7 = uVar7 | 0x4000000;
      }
      if (0x1b < (int)uVar4) {
        uVar9 = uVar12 + 1;
        uVar5 = uVar1;
        goto LAB_0802b8ea;
      }
      uVar9 = ((uint)(uVar7 << (0x20 - uVar4 & 0xff) != 0) | uVar7 >> (uVar4 & 0xff)) + uVar12;
      uVar11 = uVar1;
LAB_0802b980:
      uVar5 = uVar11;
      if (-1 < (int)(uVar9 << 5)) goto LAB_0802b8e2;
      if (uVar11 != 0xfe) {
LAB_0802ba20:
        uVar5 = uVar11 + 1;
        uVar9 = uVar9 >> 1 & 0x7dffffff | uVar9 & 1;
        goto LAB_0802b9cc;
      }
    }
    else {
      if ((int)uVar5 < 1) {
        if (uVar5 == 0) goto LAB_0802b9d4;
        uVar5 = uVar1 - uVar11;
        if (uVar11 == 0) goto LAB_0802b992;
        uVar7 = uVar7 | 0x4000000;
LAB_0802ba3a:
        uVar9 = 1;
        if ((int)uVar5 < 0x1c) {
          uVar9 = uVar7 >> (uVar5 & 0xff) | (uint)(uVar7 << (0x20 - uVar5 & 0xff) != 0);
        }
        uVar9 = uVar12 - uVar9;
        uVar10 = uVar3;
        uVar11 = uVar1;
      }
      else {
        if (uVar1 == 0) {
          uVar3 = uVar10;
          if (uVar4 == 0) goto LAB_0802b99a;
          uVar6 = uVar5 - 1;
          if (uVar5 == 1) {
            uVar11 = 1;
            uVar9 = uVar7 + uVar4 * -8;
            goto LAB_0802b8de;
          }
          if (uVar5 != 0xff) goto LAB_0802b8c4;
          goto LAB_0802b8a4;
        }
        if (uVar11 == 0xff) goto LAB_0802b8a4;
        uVar12 = uVar12 | 0x4000000;
        uVar6 = uVar5;
LAB_0802b8c4:
        uVar9 = 1;
        if ((int)uVar6 < 0x1c) {
          uVar9 = uVar12 >> (uVar6 & 0xff) | (uint)(uVar12 << (0x20 - uVar6 & 0xff) != 0);
        }
        uVar9 = uVar7 - uVar9;
      }
LAB_0802b8de:
      uVar5 = uVar11;
      if ((int)(uVar9 << 5) < 0) {
        uVar7 = uVar9 & 0x3ffffff;
LAB_0802b9a8:
        iVar2 = FUN_080104dc(uVar7);
        uVar5 = iVar2 - 5;
        uVar7 = uVar7 << (uVar5 & 0xff);
        if ((int)uVar5 < (int)uVar11) {
          uVar5 = uVar11 - uVar5;
          uVar9 = uVar7 & 0xfbffffff;
        }
        else {
          uVar6 = (uVar5 - uVar11) + 1;
          uVar5 = 0;
          uVar9 = uVar7 >> (uVar6 & 0xff) | (uint)(uVar7 << (0x20 - uVar6 & 0xff) != 0);
        }
LAB_0802b9cc:
        if ((uVar9 & 7) != 0) goto LAB_0802b8ea;
      }
      else {
LAB_0802b8e2:
        uVar3 = uVar10;
        if ((uVar9 & 7) == 0) goto LAB_0802b99a;
LAB_0802b8ea:
        if ((uVar9 & 0xf) != 4) {
          uVar9 = uVar9 + 4;
        }
      }
      uVar3 = uVar10;
      if (-1 < (int)(uVar9 << 5)) {
LAB_0802b99a:
        uVar7 = uVar9 >> 3;
        uVar10 = uVar3;
        if (uVar5 != 0xff) {
LAB_0802b964:
          uVar7 = uVar7 & 0x7fffff;
          uVar5 = uVar5 & 0xff;
          goto LAB_0802b904;
        }
        goto LAB_0802b8a6;
      }
      if (uVar5 != 0xfe) {
        uVar5 = uVar5 + 1 & 0xff;
        uVar7 = (uVar9 & 0x3ffffff) >> 3;
        goto LAB_0802b904;
      }
    }
LAB_0802b98a:
    uVar5 = 0xff;
    uVar7 = 0;
  }
LAB_0802b904:
  return uVar5 << 0x17 | uVar7 | uVar10 << 0x1f;
}


