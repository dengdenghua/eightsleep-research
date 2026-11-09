/* Ghidra static pseudocode; not original source. */

int FUN_0802b45c(uint param_1,uint param_2)

{
  int iVar1;
  uint uVar2;
  int iVar3;
  uint uVar4;
  int iVar5;
  uint uVar6;
  uint uVar7;
  
  iVar5 = -((int)param_1 >> 0x1f);
  uVar6 = param_1 & 0x7fffff;
  uVar4 = (param_1 & 0x7fffffff) >> 0x17;
  uVar7 = param_2 & 0x7fffff;
  uVar2 = (param_2 & 0x7fffffff) >> 0x17;
  iVar3 = -((int)param_2 >> 0x1f);
  if (uVar4 == 0xff) {
    if (uVar6 != 0) {
      return -2;
    }
    if (uVar2 == 0xff) {
      if (uVar7 != 0) {
        return -2;
      }
      if (iVar5 == iVar3) {
        return 0;
      }
    }
    goto LAB_0802b4b2;
  }
  iVar1 = iVar3;
  if (uVar2 == 0xff) {
    if (uVar7 != 0) {
      return -2;
    }
    if (uVar4 == 0) {
LAB_0802b49a:
      if (uVar6 == 0) goto joined_r0x0802b48c;
    }
    iVar1 = iVar5;
    if (iVar5 == iVar3) {
joined_r0x0802b48c:
      if (iVar1 == 0) {
        return -1;
      }
      return iVar1;
    }
  }
  else {
    if (uVar4 == 0) {
      if (uVar2 != 0) goto LAB_0802b49a;
      if (uVar7 == 0) {
        if (uVar6 == 0) {
          return 0;
        }
        goto LAB_0802b4b2;
      }
      if (uVar6 == 0) goto joined_r0x0802b48c;
      if (iVar5 != iVar3) goto LAB_0802b4b2;
    }
    else {
      if (((uVar2 == 0) || (iVar5 != iVar3)) || (uVar2 < uVar4)) goto LAB_0802b4b2;
      iVar1 = iVar5;
      if (uVar4 < uVar2) goto joined_r0x0802b48c;
    }
    if (uVar6 <= uVar7) {
      iVar1 = iVar5;
      if (uVar7 <= uVar6) {
        return 0;
      }
      goto joined_r0x0802b48c;
    }
  }
LAB_0802b4b2:
  return (iVar5 - 1U & 2) - 1;
}


