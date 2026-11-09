/* Ghidra static pseudocode; not original source. Read-only project; no target execution. */

void FUN_001e9390(long param_1,int param_2)

{
  size_t __n;
  long *plVar1;
  char cVar2;
  void *pvVar3;
  undefined1 *puVar4;
  ulong uVar5;
  void *local_a0;
  long local_98;
  long local_90;
  ulong local_88;
  void *local_80;
  undefined1 auStack_78 [16];
  ulong local_68;
  long *local_60;
  undefined8 local_58;
  undefined1 local_50;
  undefined7 uStack_4f;
  long *local_40;
  undefined8 local_38;
  long local_30 [2];
  void *local_20;
  void *local_18;
  long local_10;
  long local_8;
  
  local_8 = *(long *)PTR___stack_chk_guard_005df758;
  **(undefined1 **)(param_1 + 0x1bb8) = 1;
  if (param_2 == 0x4000000) {
    uVar5 = 0x80000;
  }
  else {
    uVar5 = 0x1000;
    if ((param_2 - 0x200U & 0xfffffdff) == 0 || param_2 == 0x10) {
      uVar5 = 0x4000;
    }
  }
  local_a0 = (void *)0x0;
  local_98 = 0;
  local_90 = 0;
  pvVar3 = operator_new(uVar5);
  local_a0 = pvVar3;
  local_90 = (long)pvVar3 + uVar5;
  memset(pvVar3,0,uVar5);
  local_98 = (long)pvVar3 + uVar5;
  local_88 = uVar5;
  local_80 = pvVar3;
  FUN_001d70a0(auStack_78,pvVar3,uVar5);
  cVar2 = FUN_00200960(param_1,&local_88,param_2);
  if (cVar2 == '\0') {
    FUN_001965f0(PTR_DAT_005df7b0,0xb6,"flushChunkToJetStream",
                 "/usr/src/debug/frank/0.1-r0/git/submodules/native-utils/inc/raw_logger.h",
                 "[logger] Failed encode chunk body for seq %u and mask %u",
                 *(undefined8 *)(*(long *)(param_1 + 0x1b70) + 0x80),param_2);
    goto LAB_001e9610;
  }
  if (local_68 == 0xffffffffffffffff) {
    local_68 = local_88;
    if ((long)local_88 < 0) goto LAB_001e96d8;
  }
  else if (((long)local_68 < 0) || ((long)local_88 < (long)local_68)) goto LAB_001e96d8;
  if (local_80 == (void *)0x0 && local_68 != 0) {
LAB_001e96d8:
                    /* WARNING: Subroutine does not return */
    std::terminate();
  }
  if (local_68 == 0) goto LAB_001e9610;
  uVar5 = local_98 - (long)local_a0;
  if (uVar5 < local_68) {
    FUN_001d96c0(&local_a0,local_68 - uVar5);
  }
  else if ((local_68 < uVar5) && (local_98 != (long)local_a0 + local_68)) {
    local_98 = (long)local_a0 + local_68;
  }
  if (param_2 == 0x2000) {
    FUN_001e2bd0(&local_60,"raw.sens.tempextended");
  }
  else if (param_2 < 0x2001) {
    if (param_2 == 0x40) {
      FUN_001e2bd0(&local_60,"raw.sens.capsense");
    }
    else if (param_2 < 0x41) {
      if (param_2 == 8) {
        FUN_001e2bd0(&local_60,"raw.sens.bedtemp");
      }
      else if (param_2 < 9) {
        if (param_2 == 2) {
          FUN_001e2bd0(&local_60,"raw.sens.sens");
        }
        else if (param_2 == 4) {
          FUN_001e2bd0(&local_60,"raw.frz.heat");
        }
        else {
          if (param_2 != 1) goto LAB_001e9954;
          FUN_001e2bd0(&local_60,"raw.log");
        }
      }
      else if (param_2 == 0x10) {
        FUN_001e2bd0(&local_60,"raw.sens.piezo");
      }
      else {
        if (param_2 != 0x20) goto LAB_001e9954;
        FUN_001e2bd0(&local_60,"raw.frz.temp");
      }
    }
    else if (param_2 == 0x400) {
      FUN_001e2bd0(&local_60,"raw.pillow.raccel");
    }
    else if (param_2 < 0x401) {
      if (param_2 == 0x100) {
        FUN_001e2bd0(&local_60,"raw.sens.gesture");
      }
      else if (param_2 == 0x200) {
        FUN_001e2bd0(&local_60,"raw.pillow.laccel");
      }
      else {
        if (param_2 != 0x80) goto LAB_001e9954;
        FUN_001e2bd0(&local_60,"raw.sens.lps");
      }
    }
    else if (param_2 == 0x800) {
      FUN_001e2bd0(&local_60,"raw.frz.therm");
    }
    else if (param_2 == 0x1000) {
      FUN_001e2bd0(&local_60,"raw.sens.capextended");
    }
    else {
LAB_001e9954:
      FUN_001965f0(PTR_DAT_005df590,0x6a,"packetMaskToSubject",
                   "/usr/src/debug/frank/0.1-r0/git/submodules/native-utils/inc/raw_logger.h",
                   "[logger] sending unknown packet type to jetstream");
      FUN_001e2bd0(&local_60,"raw.unknown");
    }
  }
  else if (param_2 == 0x200000) {
    FUN_001e2bd0(&local_60,"raw.pillow.capsense");
  }
  else if (param_2 < 0x200001) {
    if (param_2 == 0x40000) {
      FUN_001e2bd0(&local_60,"raw.pillow.rbutton");
    }
    else if (param_2 < 0x40001) {
      if (param_2 == 0x8000) {
        FUN_001e2bd0(&local_60,"raw.pillow.rtemp");
      }
      else if (param_2 == 0x20000) {
        FUN_001e2bd0(&local_60,"raw.pillow.lbutton");
      }
      else {
        if (param_2 != 0x4000) goto LAB_001e9954;
        FUN_001e2bd0(&local_60,"raw.pillow.ltemp");
      }
    }
    else if (param_2 == 0x80000) {
      FUN_001e2bd0(&local_60,"raw.frz.cavia");
    }
    else {
      if (param_2 != 0x100000) goto LAB_001e9954;
      FUN_001e2bd0(&local_60,"raw.sens.blanket");
    }
  }
  else if (param_2 == 0x2000000) {
    FUN_001e2bd0(&local_60,"raw.speaker.state");
  }
  else if (param_2 < 0x2000001) {
    if (param_2 == 0x800000) {
      FUN_001e2bd0(&local_60,"raw.frz.cond");
    }
    else if (param_2 == 0x1000000) {
      FUN_001e2bd0(&local_60,"raw.sens.alarminfo");
    }
    else {
      if (param_2 != 0x400000) goto LAB_001e9954;
      FUN_001e2bd0(&local_60,"raw.pillow.orientation");
    }
  }
  else if (param_2 == 0x4000000) {
    FUN_001e2bd0(&local_60,"raw.x.sens.stealth");
  }
  else {
    if (param_2 != 0x8000000) goto LAB_001e9954;
    FUN_001e2bd0(&local_60,"raw.x.sens.bedtemp");
  }
  local_38 = local_58;
  local_40 = local_30;
  if (local_60 != (long *)&local_50) {
    local_40 = local_60;
  }
  local_30[0] = CONCAT71(uStack_4f,local_50);
  local_50 = 0;
  local_58 = 0;
  local_20 = (void *)0x0;
  local_18 = (void *)0x0;
  uVar5 = local_98 - (long)local_a0;
  local_10 = 0;
  local_60 = (long *)&local_50;
  if (uVar5 == 0) {
    local_20 = (void *)0x0;
    local_18 = (void *)0x0;
    local_10 = 0;
  }
  else {
    if ((long)uVar5 < 0) {
                    /* WARNING: Subroutine does not return */
      std::__throw_bad_alloc();
    }
    pvVar3 = operator_new(uVar5);
    plVar1 = local_60;
    local_10 = (long)pvVar3 + uVar5;
    __n = local_98 - (long)local_a0;
    local_20 = pvVar3;
    if (__n != 0) {
      local_18 = pvVar3;
      memmove(pvVar3,local_a0,__n);
    }
    local_18 = (void *)((long)pvVar3 + __n);
    if (plVar1 != (long *)&local_50) {
      operator_delete(plVar1,CONCAT71(uStack_4f,local_50) + 1);
    }
  }
  if (param_2 == 1) {
    cVar2 = FUN_001f49b0(DAT_005e3b98 + 0x200,&local_40);
  }
  else {
    cVar2 = FUN_001f49b0(DAT_005e3b98 + 0xc0,&local_40);
  }
  if (cVar2 == '\0') {
    FUN_001965f0(PTR_DAT_005df7b0,0xc9,"flushChunkToJetStream",
                 "/usr/src/debug/frank/0.1-r0/git/submodules/native-utils/inc/raw_logger.h",
                 "[logger] Failed enqueue jsMsg for seq %u and mask %u",
                 *(undefined8 *)(*(long *)(param_1 + 0x1b70) + 0x80),param_2);
  }
  if (local_20 != (void *)0x0) {
    operator_delete(local_20,local_10 - (long)local_20);
  }
  if (local_40 != local_30) {
    operator_delete(local_40,local_30[0] + 1);
  }
LAB_001e9610:
  puVar4 = *(undefined1 **)(param_1 + 0x1bb8);
  *(long *)(*(long *)(param_1 + 0x1b70) + 0x80) = *(long *)(*(long *)(param_1 + 0x1b70) + 0x80) + 1;
  *puVar4 = 0;
  if (local_a0 != (void *)0x0) {
    operator_delete(local_a0,local_90 - (long)local_a0);
  }
  if (local_8 - *(long *)PTR___stack_chk_guard_005df758 == 0) {
    return;
  }
                    /* WARNING: Subroutine does not return */
  __stack_chk_fail(PTR___stack_chk_guard_005df758,local_8 - *(long *)PTR___stack_chk_guard_005df758,
                   0);
}


