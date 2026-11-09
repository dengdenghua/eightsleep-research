/* Ghidra static pseudocode; not original source. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_0801ec3c(int param_1,uint param_2)

{
  int *piVar1;
  char cVar2;
  char *pcVar3;
  int *piVar4;
  undefined4 uVar5;
  undefined4 *puVar6;
  int iVar7;
  int iVar8;
  byte bVar9;
  uint uVar10;
  int local_24;
  
  piVar4 = *(int **)(param_1 + 4);
  iVar7 = *piVar4;
  if (param_2 < 0x65) {
    if (param_2 == 0) {
      iVar8 = *(int *)(iVar7 + 0x2c);
      uVar10 = 0;
    }
    else {
      uVar10 = (uint)*(byte *)(param_1 + 0x10);
      if (uVar10 <= param_2) goto LAB_0801ec72;
LAB_0801ec7e:
      iVar8 = *(int *)(iVar7 + 0x2c);
      if (uVar10 == 100) {
        local_24 = iVar8 + 1;
        goto LAB_0801ec88;
      }
    }
  }
  else {
    uVar10 = (uint)*(byte *)(param_1 + 0x10);
    if (uVar10 < 0x65) {
      param_2 = 100;
LAB_0801ec72:
      bVar9 = *(byte *)(param_1 + 0x11);
      if (param_2 < bVar9) {
        bVar9 = (byte)param_2;
      }
      uVar10 = (uint)bVar9;
      goto LAB_0801ec7e;
    }
    iVar8 = *(int *)(iVar7 + 0x2c);
  }
  local_24 = FUN_08010160(uVar10 * iVar8,100);
LAB_0801ec88:
  if (*(char *)(param_1 + 0x12) == '\x01') {
    local_24 = iVar8 - local_24;
  }
  uVar5 = *(undefined4 *)(param_1 + 8);
  piVar1 = (int *)FUN_0801e822(iVar7,uVar5);
  if (piVar1 == (int *)0x0) {
    FUN_08017634("[solenoid:%u] ERROR: failed to get CCR register for ch=%lu",
                 *(undefined1 *)(param_1 + 0x4d),uVar5);
  }
  else {
    *piVar1 = local_24;
    cVar2 = *(char *)(param_1 + 0x4c);
    *(char *)(param_1 + 0x4c) = (char)uVar10;
    if (uVar10 == 0) {
      if (cVar2 != '\0') {
        FUN_080149d8(piVar4,*(undefined4 *)(param_1 + 8));
        iVar7 = **(int **)(param_1 + 4);
        uVar5 = 1;
        if ((((iVar7 != 0x40012c00) && (uVar5 = 3, iVar7 != 0x40000400)) &&
            (uVar5 = 4, iVar7 != 0x40000800)) && (uVar5 = 0, iVar7 == 0x40014000)) {
          uVar5 = 0xf;
        }
        FUN_08017634("[solenoid:%u] stop TIM%d ch=%lu duty=0%% PWM stopped",
                     *(undefined1 *)(param_1 + 0x4d),uVar5,*(undefined4 *)(param_1 + 8));
      }
    }
    else if (cVar2 == '\0') {
      iVar7 = FUN_08014928(piVar4,*(undefined4 *)(param_1 + 8));
      if (iVar7 == 0) {
        puVar6 = (undefined4 *)**(undefined4 **)(param_1 + 4);
        if (puVar6 == (undefined4 *)0x40012c00) {
          cVar2 = '\x01';
          uVar5 = _DAT_40012c44;
        }
        else if (puVar6 == (undefined4 *)0x40014000) {
          cVar2 = '\x0f';
          uVar5 = _DAT_40014044;
        }
        else {
          cVar2 = '\x03';
          uVar5 = 0;
          if (puVar6 != (undefined4 *)0x40000400) {
            cVar2 = (puVar6 == (undefined4 *)0x40000800) * '\x04';
          }
        }
        pcVar3 = "(DC)";
        if (uVar10 != 100) {
          pcVar3 = "(PWM)";
        }
        FUN_08017634("[solenoid:%u] start TIM%d@%p ch=%lu duty=%u%% on %s (ARR=%lu CCR=%lu) CR1=0x%lx CCER=0x%lx BDTR=0x%lx"
                     ,*(undefined1 *)(param_1 + 0x4d),cVar2,puVar6,*(undefined4 *)(param_1 + 8),
                     uVar10,pcVar3,iVar8,local_24,*puVar6,puVar6[8],uVar5);
      }
      else {
        FUN_08017634("[solenoid:%u] ERROR: HAL_TIM_PWM_Start failed with status %d for tim=%p ch=%lu"
                     ,*(undefined1 *)(param_1 + 0x4d),iVar7,**(undefined4 **)(param_1 + 4),
                     *(undefined4 *)(param_1 + 8));
      }
    }
  }
  return;
}


