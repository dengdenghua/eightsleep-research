/* Ghidra static pseudocode; not original source. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_08020fbc(undefined4 *param_1,uint param_2)

{
  int *piVar1;
  char cVar2;
  undefined4 uVar3;
  undefined4 *puVar4;
  byte bVar5;
  uint uVar6;
  int iVar7;
  int iVar8;
  int local_1c;
  
  if (param_2 < 0x65) {
    uVar6 = 0;
    if (param_2 == 0) goto LAB_08020fde;
  }
  else {
    param_2 = 100;
  }
  uVar6 = (uint)*(byte *)(param_1 + 3);
  if (uVar6 <= param_2) {
    bVar5 = *(byte *)((int)param_1 + 0xd);
    if (param_2 < bVar5) {
      bVar5 = (byte)param_2;
    }
    uVar6 = (uint)bVar5;
  }
LAB_08020fde:
  *(char *)((int)param_1 + 0xf) = (char)uVar6;
  iVar7 = *(int *)*param_1;
  iVar8 = *(int *)(iVar7 + 0x2c);
  local_1c = FUN_08010160(uVar6 * iVar8,100);
  if (*(char *)((int)param_1 + 0xe) == '\x01') {
    local_1c = iVar8 - local_1c;
  }
  piVar1 = (int *)FUN_0801e822(iVar7,param_1[1]);
  if (piVar1 != (int *)0x0) {
    *piVar1 = local_1c;
  }
  if (uVar6 == 0) {
    if (*(char *)((int)param_1 + 0x11) != '\0') {
      if ((code *)param_1[6] != (code *)0x0) {
        (*(code *)param_1[6])(param_1);
      }
      iVar7 = *(int *)*param_1;
      uVar3 = 1;
      *(undefined1 *)((int)param_1 + 0x11) = 0;
      if ((((iVar7 != 0x40012c00) && (uVar3 = 3, iVar7 != 0x40000400)) &&
          (uVar3 = 4, iVar7 != 0x40000800)) && (uVar3 = 0, iVar7 == 0x40014000)) {
        uVar3 = 0xf;
      }
      FUN_08017634("[pwm_pumps] stop TIM%d ch=%lu duty=0%%",uVar3,param_1[1]);
    }
  }
  else if (*(char *)((int)param_1 + 0x11) == '\0') {
    if ((code *)param_1[5] != (code *)0x0) {
      (*(code *)param_1[5])(param_1);
    }
    cVar2 = '\x01';
    *(undefined1 *)((int)param_1 + 0x11) = 1;
    puVar4 = *(undefined4 **)*param_1;
    uVar3 = _DAT_40012c44;
    if (puVar4 != (undefined4 *)0x40012c00) {
      if (puVar4 == (undefined4 *)0x40014000) {
        cVar2 = '\x0f';
        uVar3 = _DAT_40014044;
      }
      else if (puVar4 == (undefined4 *)0x40000400) {
        cVar2 = '\x03';
        uVar3 = 0;
      }
      else {
        cVar2 = (puVar4 == (undefined4 *)0x40000800) * '\x04';
        uVar3 = 0;
      }
    }
    FUN_08017634("[pwm_pumps] start TIM%d@%p ch=%lu duty=%u%% (ARR=%lu CCR=%lu) CR1=0x%lx CCER=0x%lx BDTR=0x%lx"
                 ,cVar2,puVar4,param_1[1],uVar6,puVar4[0xb],local_1c,*puVar4,puVar4[8],uVar3);
  }
  return;
}


