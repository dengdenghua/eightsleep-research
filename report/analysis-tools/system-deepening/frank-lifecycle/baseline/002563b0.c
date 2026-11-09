/* Ghidra static pseudocode; not original source. Read-only project; no target execution. */

void FUN_002563b0(undefined8 param_1,undefined8 *param_2,undefined8 param_3,long *param_4)

{
  undefined8 *puVar1;
  ulong uVar2;
  bool bVar3;
  char cVar4;
  long lVar5;
  size_t sVar6;
  undefined8 *puVar7;
  void *pvVar8;
  long lVar9;
  undefined1 *puVar10;
  long lVar11;
  char *pcVar12;
  long lVar13;
  void *pvVar14;
  void *pvVar15;
  size_t sVar16;
  char *__s;
  undefined8 uVar17;
  undefined4 local_1f0;
  void *local_1c8;
  void *local_1c0;
  long local_1b8;
  void *local_1b0;
  undefined1 *local_1a8;
  undefined1 *local_1a0;
  undefined8 *local_198;
  long lStack_190;
  undefined8 local_188;
  undefined8 uStack_180;
  undefined4 local_178;
  undefined8 local_170;
  undefined8 uStack_168;
  undefined1 *local_160;
  void *local_158;
  undefined1 auStack_150 [16];
  undefined1 *local_140;
  undefined1 auStack_130 [8];
  string asStack_128 [32];
  ulong *local_108;
  undefined8 local_100;
  ulong local_f8;
  undefined8 uStack_f0;
  ulong *local_e8;
  undefined8 local_e0;
  ulong local_d8;
  undefined8 uStack_d0;
  void *local_c8;
  void *local_c0;
  long local_b8;
  long *local_b0;
  undefined1 auStack_a8 [8];
  long local_a0 [3];
  undefined1 auStack_88 [32];
  undefined1 auStack_68 [32];
  undefined4 local_48;
  undefined1 auStack_40 [56];
  long local_8;
  
  local_8 = *(long *)PTR___stack_chk_guard_005df758;
  if (DAT_005e3b98 != 0) {
    lVar5 = std::chrono::_V2::system_clock::now();
    local_1c8 = (void *)0x0;
    local_1c0 = (void *)0x0;
    local_1b8 = 0;
    lStack_190 = 1;
    local_188 = 0;
    uStack_180 = 0;
    local_178 = 0x3f800000;
    local_170 = 0;
    uStack_168 = 0;
    local_198 = &uStack_168;
    FUN_0025fa30(&local_1c8,param_4[1] - *param_4 >> 5);
    puVar1 = (undefined8 *)param_4[1];
    for (puVar7 = (undefined8 *)*param_4; puVar7 != puVar1; puVar7 = puVar7 + 4) {
      __s = (char *)*puVar7;
      pcVar12 = (char *)0xffffffffffffffff;
      local_b0 = local_a0;
      if (__s != (char *)0x0) {
        sVar6 = strlen(__s);
        pcVar12 = __s + sVar6;
      }
      FUN_002545d4(&local_b0,__s,pcVar12);
      FUN_00256124(&local_1c8,&local_b0);
      if (local_b0 != local_a0) {
        operator_delete(local_b0,local_a0[0] + 1);
      }
    }
    FUN_002546c0(&local_b0,&DAT_00470f90);
    puVar7 = (undefined8 *)FUN_001aa830(&local_198,&local_b0);
    cVar4 = *(char *)(puVar7 + 6);
    if (cVar4 == '\x01') {
      pvVar15 = (void *)*puVar7;
      pvVar14 = (void *)puVar7[1];
      *puVar7 = local_1c8;
      puVar7[1] = local_1c0;
      lVar13 = puVar7[2];
      puVar7[2] = local_1b8;
      local_1c8 = (void *)0x0;
      local_1c0 = (void *)0x0;
      local_1b8 = 0;
      for (pvVar8 = pvVar15; pvVar8 != pvVar14; pvVar8 = (void *)((long)pvVar8 + 0x30)) {
        if (*(char *)((long)pvVar8 + 0x28) != -1) {
          (*(code *)(&PTR_FUN_0058e278)[*(char *)((long)pvVar8 + 0x28)])(&local_160,pvVar8);
        }
      }
      if (pvVar15 != (void *)0x0) {
        operator_delete(pvVar15,lVar13 - (long)pvVar15);
      }
    }
    else {
      if (cVar4 != -1) {
        (*(code *)(&PTR_FUN_0058e268)[cVar4])(&local_160);
      }
      *puVar7 = local_1c8;
      puVar7[1] = local_1c0;
      puVar7[2] = local_1b8;
      *(undefined1 *)(puVar7 + 6) = 1;
      local_1c8 = (void *)0x0;
      local_1c0 = (void *)0x0;
      local_1b8 = 0;
    }
    FUN_001998f0(&local_b0);
    uVar17 = *param_2;
    FUN_0020dec0(&local_160,&local_198);
    local_1f0 = (undefined4)((lVar5 / 1000000) % 1000);
    local_b0 = (long *)CONCAT44(local_1f0,(int)(lVar5 / 1000000000));
    FUN_002546c0(auStack_a8,uVar17);
    FUN_002546c0(auStack_88,param_3);
    FUN_002546c0(auStack_68,&DAT_00460df0);
    local_48 = 1;
    FUN_0020dec0(auStack_40,&local_160);
    FUN_0019b8a0(&local_160);
    if (local_160 != auStack_130) {
      operator_delete(local_160,(long)local_158 << 3);
    }
    local_1b0 = (void *)0x0;
    local_1a8 = (undefined1 *)0x0;
    local_1a0 = (undefined1 *)0x0;
    pvVar8 = operator_new(0x4000);
    local_1b0 = pvVar8;
    local_1a0 = (undefined1 *)((long)pvVar8 + 0x4000);
    memset(pvVar8,0,0x4000);
    local_160 = (undefined1 *)0x4000;
    local_1a8 = (undefined1 *)((long)pvVar8 + 0x4000);
    local_158 = pvVar8;
    FUN_001d70a0(auStack_150,pvVar8,0x4000);
    cVar4 = FUN_001d9250(&local_b0,&local_160);
    if (cVar4 == '\0') {
      FUN_001965f0(PTR_DAT_005df810,0x2f3,"publishTopologyEvent",
                   "/usr/src/debug/frank/0.1-r0/git/firmware/src/PortWorker.cpp",
                   "[portworker] failed to encode topology event for %s",*param_2);
      if (local_1b0 != (void *)0x0) {
        operator_delete(local_1b0,(long)local_1a0 - (long)local_1b0);
      }
      FUN_0019b990(&local_b0);
      pvVar8 = local_1c0;
      pvVar15 = local_1c0;
      if (local_1c8 != local_1c0) {
        pvVar14 = local_1c8;
        do {
          if (*(char *)((long)pvVar14 + 0x28) != -1) {
            (*(code *)(&PTR_FUN_0058e278)[*(char *)((long)pvVar14 + 0x28)])(&local_1b0,pvVar14);
          }
          pvVar14 = (void *)((long)pvVar14 + 0x30);
          pvVar15 = local_1c8;
        } while (pvVar8 != pvVar14);
      }
    }
    else {
      if (local_140 == (undefined1 *)0xffffffffffffffff) {
        local_140 = local_160;
        if ((long)local_160 < 0) goto LAB_00256b78;
      }
      else if (((long)local_140 < 0) || ((long)local_160 < (long)local_140)) goto LAB_00256b78;
      bVar3 = local_140 == (undefined1 *)0x0 || local_158 != (void *)0x0;
      if (local_140 != (undefined1 *)0x0 && local_158 == (void *)0x0) {
LAB_00256b78:
                    /* WARNING: Subroutine does not return */
        std::terminate();
      }
      puVar10 = local_1a8 + -(long)local_1b0;
      if (puVar10 < local_140) {
        FUN_001d96c0(&local_1b0,(long)local_140 - (long)puVar10);
      }
      else if ((local_140 < puVar10) &&
              (local_1a8 != (undefined1 *)((long)local_1b0 + (long)local_140))) {
        local_1a8 = (undefined1 *)((long)local_1b0 + (long)local_140);
      }
      lVar5 = DAT_005e3b98;
      FUN_002546c0(asStack_128,"raw.events.");
      puVar7 = (undefined8 *)
               std::__cxx11::string::_M_append(asStack_128,(char *)*param_2,param_2[1]);
      if ((ulong *)*puVar7 == puVar7 + 2) {
        local_f8 = puVar7[2];
        uStack_f0 = puVar7[3];
        local_108 = &local_f8;
      }
      else {
        local_f8 = puVar7[2];
        local_108 = (ulong *)*puVar7;
      }
      local_e0 = puVar7[1];
      *puVar7 = puVar7 + 2;
      puVar7[1] = 0;
      local_e8 = &local_d8;
      *(undefined1 *)(puVar7 + 2) = 0;
      if (local_108 == &local_f8) {
        uStack_d0 = uStack_f0;
      }
      else {
        local_e8 = local_108;
      }
      local_d8 = local_f8;
      local_f8 = local_f8 & 0xffffffffffffff00;
      local_100 = 0;
      local_c8 = (void *)0x0;
      local_c0 = (void *)0x0;
      uVar2 = (long)local_1a8 - (long)local_1b0;
      local_b8 = 0;
      if (uVar2 == 0) {
        pvVar8 = (void *)0x0;
        local_c8 = (void *)0x0;
        local_b8 = 0;
        sVar6 = 0;
        local_108 = &local_f8;
      }
      else {
        if ((long)uVar2 < 0) {
          local_108 = &local_f8;
                    /* WARNING: Subroutine does not return */
          std::__throw_bad_alloc();
        }
        local_108 = &local_f8;
        pvVar8 = operator_new(uVar2);
        local_b8 = (long)pvVar8 + uVar2;
        sVar16 = (long)local_1a8 - (long)local_1b0;
        sVar6 = 0;
        local_c8 = pvVar8;
        if (sVar16 != 0) {
          local_c0 = pvVar8;
          memmove(pvVar8,local_1b0,sVar16);
          sVar6 = sVar16;
        }
      }
      local_c0 = (void *)((long)pvVar8 + sVar6);
      lVar11 = *(long *)(lVar5 + 0x380);
      lVar13 = lVar11 + 1;
      lVar9 = *(long *)(lVar5 + 0x3c0);
      if (lVar13 == *(long *)(lVar5 + 0x340)) {
        lVar13 = 0;
      }
      if ((lVar9 == lVar13) &&
         (*(long *)(lVar5 + 0x3c0) = *(long *)(lVar5 + 0x400), lVar9 == *(long *)(lVar5 + 0x400))) {
        bVar3 = false;
      }
      else {
        lVar9 = *(long *)(lVar5 + 0x348) + lVar11 * 0x38 + 0x70;
        FUN_00198030(lVar9,&local_e8);
        *(undefined8 *)(lVar9 + 0x20) = 0;
        *(undefined8 *)(lVar9 + 0x28) = 0;
        *(undefined8 *)(lVar9 + 0x30) = 0;
        uVar2 = (long)local_c0 - (long)local_c8;
        if (uVar2 == 0) {
          pvVar8 = (void *)0x0;
          *(undefined8 *)(lVar9 + 0x20) = 0;
          *(undefined8 *)(lVar9 + 0x28) = 0;
          *(undefined8 *)(lVar9 + 0x30) = 0;
          sVar6 = (long)local_c0 - (long)local_c8;
        }
        else {
          if ((long)uVar2 < 0) {
                    /* WARNING: Subroutine does not return */
            std::__throw_bad_alloc();
          }
          pvVar8 = operator_new(uVar2);
          *(void **)(lVar9 + 0x20) = pvVar8;
          *(void **)(lVar9 + 0x28) = pvVar8;
          *(ulong *)(lVar9 + 0x30) = (long)pvVar8 + uVar2;
          sVar6 = (long)local_c0 - (long)local_c8;
        }
        sVar16 = 0;
        if (sVar6 != 0) {
          pvVar8 = memmove(pvVar8,local_c8,sVar6);
          sVar16 = sVar6;
        }
        *(size_t *)(lVar9 + 0x28) = (long)pvVar8 + sVar16;
        *(long *)(lVar5 + 0x380) = lVar13;
      }
      if (local_c8 != (void *)0x0) {
        operator_delete(local_c8,local_b8 - (long)local_c8);
      }
      FUN_001998f0(&local_e8);
      FUN_001998f0(&local_108);
      FUN_001998f0(asStack_128);
      if (!bVar3) {
        FUN_001965f0(PTR_DAT_005df810,0x2fc,"publishTopologyEvent",
                     "/usr/src/debug/frank/0.1-r0/git/firmware/src/PortWorker.cpp",
                     "[portworker] event queue full, dropping topology event for %s",*param_2);
      }
      if (local_1b0 != (void *)0x0) {
        operator_delete(local_1b0,(long)local_1a0 - (long)local_1b0);
      }
      FUN_0019b990(&local_b0);
      pvVar8 = local_1c0;
      pvVar15 = local_1c0;
      if (local_1c8 != local_1c0) {
        pvVar14 = local_1c8;
        do {
          if (*(char *)((long)pvVar14 + 0x28) != -1) {
            (*(code *)(&PTR_FUN_0058e278)[*(char *)((long)pvVar14 + 0x28)])(&local_1b0,pvVar14);
          }
          pvVar14 = (void *)((long)pvVar14 + 0x30);
          pvVar15 = local_1c8;
        } while (pvVar8 != pvVar14);
      }
    }
    if (pvVar15 != (void *)0x0) {
      operator_delete(pvVar15,local_1b8 - (long)pvVar15);
    }
    FUN_0019b8a0(&local_198);
    if (local_198 != &uStack_168) {
      operator_delete(local_198,lStack_190 << 3);
    }
  }
  if (local_8 - *(long *)PTR___stack_chk_guard_005df758 == 0) {
    return;
  }
                    /* WARNING: Subroutine does not return */
  __stack_chk_fail(PTR___stack_chk_guard_005df758,local_8 - *(long *)PTR___stack_chk_guard_005df758,
                   0);
}


