/* Ghidra static pseudocode; not original source. Read-only project; no target execution. */

void FUN_00256d00(long param_1,undefined8 *param_2,char param_3,string *param_4,string *param_5,
                 long param_6,char param_7,undefined8 param_8,long param_9,char param_10)

{
  byte *pbVar1;
  long lVar2;
  long *plVar3;
  char *pcVar4;
  byte bVar5;
  ulong uVar6;
  bool bVar7;
  string *psVar8;
  string *psVar9;
  char cVar10;
  int iVar11;
  long lVar12;
  string *psVar13;
  undefined8 *puVar14;
  void *pvVar15;
  long lVar16;
  long lVar17;
  int *piVar18;
  long *plVar19;
  undefined8 uVar20;
  size_t sVar21;
  size_t sVar22;
  double dVar23;
  undefined4 local_1248;
  undefined4 local_1240;
  char *local_1238;
  long *local_1220;
  long *plStack_1218;
  long local_1210;
  string *local_1208;
  string *local_1200;
  string *local_11f8;
  undefined8 *local_11f0;
  long lStack_11e8;
  undefined8 local_11e0;
  undefined8 uStack_11d8;
  undefined4 local_11d0;
  undefined8 local_11c8;
  undefined8 uStack_11c0;
  string *local_11b8;
  string *local_11b0;
  undefined8 local_11a8 [2];
  string *local_1198;
  string asStack_1188 [8];
  undefined1 auStack_1180 [40];
  undefined1 local_1158;
  string asStack_1150 [40];
  undefined1 local_1128;
  ulong *local_1120;
  undefined8 local_1118;
  ulong local_1110;
  undefined8 uStack_1108;
  undefined1 local_10f8;
  char local_10f0;
  ulong *local_10e8;
  undefined8 local_10e0;
  ulong local_10d8;
  undefined8 uStack_10d0;
  void *local_10c8;
  void *local_10c0;
  ulong local_10b8;
  undefined4 local_10b0;
  undefined4 local_10ac;
  undefined1 auStack_10a8 [32];
  undefined1 auStack_1088 [32];
  undefined1 auStack_1068 [32];
  undefined4 local_1048;
  undefined1 auStack_1040 [56];
  undefined8 local_1008;
  undefined8 uStack_1000;
  undefined1 auStack_ff8 [4080];
  long local_8;
  
  local_8 = *(long *)PTR___stack_chk_guard_005df758;
  if (DAT_005e3b98 == 0) goto LAB_00257518;
  lVar12 = std::chrono::_V2::system_clock::now();
  if (param_7 == '\0') {
    param_6 = lVar12;
  }
  piVar18 = (int *)*param_2;
  if ((ulong)param_2[1] < 5) {
LAB_00256e40:
    local_1238 = "solo";
  }
  else if ((*piVar18 == 0x7466656c) && ((char)piVar18[1] == '-')) {
    local_1238 = "left";
  }
  else {
    if ((param_2[1] == 5) || ((*piVar18 != 0x68676972 || ((short)piVar18[1] != 0x2d74))))
    goto LAB_00256e40;
    local_1238 = "right";
  }
  local_11f0 = &uStack_11c0;
  lStack_11e8 = 1;
  local_11e0 = 0;
  uStack_11d8 = 0;
  local_11d0 = 0x3f800000;
  local_11c8 = 0;
  uStack_11c0 = 0;
  FUN_002546c0(&local_10b0,&DAT_0046f6a8);
  psVar13 = (string *)FUN_001aa830(&local_11f0,&local_10b0);
  if (psVar13[0x30] == (string)0x0) {
    if (psVar13[0x28] == (string)0x0) {
      std::__cxx11::string::_M_assign(psVar13,param_4);
    }
    else {
      FUN_00198030(auStack_1180,param_4);
      local_1158 = 0;
      local_11b8 = psVar13;
      FUN_0020d130(&local_11b8,auStack_1180);
      FUN_0019b270(auStack_1180);
    }
  }
  else {
    FUN_00198030(&local_1120,param_4);
    local_10f8 = 0;
    local_10f0 = '\0';
    local_11b8 = psVar13;
    FUN_0020ce50(&local_11b8,&local_1120);
    if (local_10f0 != -1) {
      (*(code *)(&PTR_FUN_0058e268)[local_10f0])(&local_11b8,&local_1120);
    }
  }
  FUN_001998f0(&local_10b0);
  FUN_002546c0(&local_10b0,"busdev");
  psVar13 = (string *)FUN_001aa830(&local_11f0,&local_10b0);
  if (psVar13[0x30] == (string)0x0) {
    if (psVar13[0x28] == (string)0x0) {
      std::__cxx11::string::_M_assign(psVar13,param_5);
      goto LAB_00256f24;
    }
    FUN_00198030(asStack_1150,param_5);
    local_1128 = 0;
    local_11b8 = psVar13;
    FUN_0020d130(&local_11b8,asStack_1150);
    FUN_0019b270(asStack_1150);
    FUN_001998f0(&local_10b0);
  }
  else {
    FUN_00198030(&local_10e8,param_5);
    local_10c0 = (void *)((ulong)local_10c0 & 0xffffffffffffff00);
    local_10b8 = local_10b8 & 0xffffffffffffff00;
    local_11b8 = psVar13;
    FUN_0020ce50(&local_11b8,&local_10e8);
    if ((char)local_10b8 != -1) {
      (*(code *)(&PTR_FUN_0058e268)[(char)local_10b8])(&local_11b8,&local_10e8);
    }
LAB_00256f24:
    FUN_001998f0(&local_10b0);
  }
  if (param_10 == '\0') {
    param_9 = FUN_00252c50();
  }
  FUN_00288620(&local_1220,param_1 + 0x2a8);
  if (plStack_1218 != local_1220) {
    local_1208 = (string *)0x0;
    local_1200 = (string *)0x0;
    local_11f8 = (string *)0x0;
    FUN_0025fa30(&local_1208,((long)plStack_1218 - (long)local_1220 >> 3) * -0x3333333333333333);
    plVar3 = plStack_1218;
    if (local_1220 != plStack_1218) {
      plVar19 = local_1220;
      do {
        dVar23 = (double)(*plVar19 - param_9) / 1000.0;
        if (50.0 < dVar23) {
          FUN_001965f0(dVar23,PTR_DAT_005df590,0x4d5,"publishChargeEvent",
                       "/usr/src/debug/frank/0.1-r0/git/firmware/src/PortWorker.cpp",
                       "[portworker] kmsg clock skew %.1fms: %s",plVar19[1]);
        }
        if (0.0 < dVar23) {
          dVar23 = 0.0;
        }
        local_1008 = 0;
        uStack_1000 = 0;
        memset(auStack_ff8,0,0xff0);
        iVar11 = __snprintf_chk(dVar23,&local_1008,0x1000,1,0x1000,"[T%.1fms] %s",plVar19[1]);
        if (-1 < iVar11) {
          if (0xfff < iVar11) {
            iVar11 = 0xfff;
          }
          for (pbVar1 = (byte *)&local_1008; (byte *)((long)&local_1008 + (long)iVar11) != pbVar1;
              pbVar1 = pbVar1 + 1) {
            bVar5 = *pbVar1;
            if ((bVar5 == 0x7f || bVar5 < 0x1f) || bVar5 == 0x1f) {
              *pbVar1 = 0x20;
            }
          }
          FUN_002546c0(&local_10b0,&local_1008);
          FUN_00256124(&local_1208,&local_10b0);
          FUN_001998f0(&local_10b0);
        }
        plVar19 = plVar19 + 5;
      } while (plVar3 != plVar19);
    }
    FUN_002546c0(&local_10b0,"logs");
    puVar14 = (undefined8 *)FUN_001aa830(&local_11f0,&local_10b0);
    cVar10 = *(char *)(puVar14 + 6);
    if (cVar10 == '\x01') {
      local_11b8 = (string *)*puVar14;
      *puVar14 = local_1208;
      local_11b0 = (string *)puVar14[1];
      puVar14[1] = local_1200;
      local_11a8[0] = puVar14[2];
      puVar14[2] = local_11f8;
      local_1208 = (string *)0x0;
      local_1200 = (string *)0x0;
      local_11f8 = (string *)0x0;
      FUN_0025f5c0(&local_11b8);
    }
    else {
      if (cVar10 != -1) {
        (*(code *)(&PTR_FUN_0058e268)[cVar10])(&local_11b8,puVar14);
      }
      *(undefined1 *)(puVar14 + 6) = 1;
      *puVar14 = local_1208;
      puVar14[1] = local_1200;
      puVar14[2] = local_11f8;
      local_1208 = (string *)0x0;
      local_1200 = (string *)0x0;
      local_11f8 = (string *)0x0;
    }
    FUN_001998f0(&local_10b0);
    psVar9 = local_1200;
    psVar8 = local_1200;
    for (psVar13 = local_1208; psVar13 != psVar9; psVar13 = psVar13 + 0x30) {
      if (psVar13[0x28] != (string)0xff) {
        (*(code *)(&PTR_FUN_0058e278)[(char)psVar13[0x28]])(&local_11b8,psVar13);
      }
      psVar8 = local_1208;
    }
    if (psVar8 != (string *)0x0) {
      operator_delete(psVar8,(long)local_11f8 - (long)psVar8);
    }
  }
  pcVar4 = "device-connect";
  if (param_3 == '\0') {
    pcVar4 = "device-disconnect";
  }
  uVar20 = *param_2;
  FUN_0020dec0(&local_11b8,&local_11f0);
  local_1248 = (undefined4)(param_6 / 1000000000);
  local_10b0 = local_1248;
  local_1240 = (undefined4)((param_6 / 1000000) % 1000);
  local_10ac = local_1240;
  FUN_002546c0(auStack_10a8,uVar20);
  FUN_002546c0(auStack_1088,pcVar4);
  FUN_002546c0(auStack_1068,local_1238);
  local_1048 = 1;
  FUN_0020dec0(auStack_1040,&local_11b8);
  FUN_0019b8a0(&local_11b8);
  if (local_11b8 != asStack_1188) {
    operator_delete(local_11b8,(long)local_11b0 << 3);
  }
  local_1208 = (string *)0x0;
  local_1200 = (string *)0x0;
  local_11f8 = (string *)0x0;
  psVar13 = operator_new(0x4000);
  local_1208 = psVar13;
  local_11f8 = psVar13 + 0x4000;
  memset(psVar13,0,0x4000);
  local_11b8 = (string *)0x4000;
  local_1200 = psVar13 + 0x4000;
  local_11b0 = psVar13;
  FUN_001d70a0(local_11a8,psVar13,0x4000);
  cVar10 = FUN_001d9250(&local_10b0,&local_11b8);
  if (cVar10 == '\0') {
    FUN_001965f0(PTR_DAT_005df810,0x4f1,"publishChargeEvent",
                 "/usr/src/debug/frank/0.1-r0/git/firmware/src/PortWorker.cpp",
                 "[portworker] failed to encode charge event for %s",*param_2);
    if (local_1208 != (string *)0x0) {
      operator_delete(local_1208,(long)local_11f8 - (long)local_1208);
    }
    FUN_0019b990(&local_10b0);
    plVar19 = plStack_1218;
    for (plVar3 = local_1220; plVar3 != plStack_1218; plVar3 = plVar3 + 5) {
      if ((long *)plVar3[1] != plVar3 + 3) {
        operator_delete((long *)plVar3[1],plVar3[3] + 1);
      }
      plVar19 = local_1220;
    }
    if (plVar19 != (long *)0x0) {
      operator_delete(plVar19,local_1210 - (long)plVar19);
    }
    FUN_0019b8a0(&local_11f0);
    FUN_0019ba40(&local_11f0);
  }
  else {
    if (local_1198 == (string *)0xffffffffffffffff) {
      local_1198 = local_11b8;
      if ((long)local_11b8 < 0) goto LAB_00257834;
    }
    else if (((long)local_1198 < 0) || ((long)local_11b8 < (long)local_1198)) goto LAB_00257834;
    bVar7 = local_11b0 != (string *)0x0 || local_1198 == (string *)0x0;
    if (local_11b0 == (string *)0x0 && local_1198 != (string *)0x0) {
LAB_00257834:
                    /* WARNING: Subroutine does not return */
      std::terminate();
    }
    psVar13 = local_1200 + -(long)local_1208;
    if (psVar13 < local_1198) {
      FUN_001d96c0(&local_1208,(long)local_1198 - (long)psVar13);
    }
    else if ((local_1198 < psVar13) && (local_1200 != local_1208 + (long)local_1198)) {
      local_1200 = local_1208 + (long)local_1198;
    }
    lVar12 = DAT_005e3b98;
    FUN_002546c0(asStack_1150,"raw.events.");
    puVar14 = (undefined8 *)
              std::__cxx11::string::_M_append(asStack_1150,(char *)*param_2,param_2[1]);
    local_1120 = &local_1110;
    if ((ulong *)*puVar14 == puVar14 + 2) {
      local_1110 = puVar14[2];
      uStack_1108 = puVar14[3];
    }
    else {
      local_1110 = puVar14[2];
      local_1120 = (ulong *)*puVar14;
    }
    local_10e0 = puVar14[1];
    *puVar14 = puVar14 + 2;
    puVar14[1] = 0;
    local_10e8 = &local_10d8;
    *(undefined1 *)(puVar14 + 2) = 0;
    if (local_1120 == &local_1110) {
      uStack_10d0 = uStack_1108;
    }
    else {
      local_10e8 = local_1120;
    }
    local_10d8 = local_1110;
    local_1120 = &local_1110;
    local_1118 = 0;
    local_1110 = local_1110 & 0xffffffffffffff00;
    uVar6 = (long)local_1200 - (long)local_1208;
    local_10c8 = (void *)0x0;
    local_10c0 = (void *)0x0;
    local_10b8 = 0;
    if (uVar6 == 0) {
      pvVar15 = (void *)0x0;
      local_10c8 = (void *)0x0;
      local_10b8 = 0;
      sVar21 = 0;
    }
    else {
      if ((long)uVar6 < 0) {
                    /* WARNING: Subroutine does not return */
        std::__throw_bad_alloc();
      }
      pvVar15 = operator_new(uVar6);
      local_10b8 = (long)pvVar15 + uVar6;
      sVar22 = (long)local_1200 - (long)local_1208;
      sVar21 = 0;
      local_10c8 = pvVar15;
      if (sVar22 != 0) {
        local_10c0 = pvVar15;
        memmove(pvVar15,local_1208,sVar22);
        sVar21 = sVar22;
      }
    }
    local_10c0 = (void *)((long)pvVar15 + sVar21);
    lVar17 = *(long *)(lVar12 + 0x380);
    lVar2 = lVar17 + 1;
    lVar16 = *(long *)(lVar12 + 0x3c0);
    if (lVar2 == *(long *)(lVar12 + 0x340)) {
      lVar2 = 0;
    }
    if ((lVar16 == lVar2) &&
       (*(long *)(lVar12 + 0x3c0) = *(long *)(lVar12 + 0x400), lVar16 == *(long *)(lVar12 + 0x400)))
    {
      bVar7 = false;
    }
    else {
      lVar16 = *(long *)(lVar12 + 0x348) + lVar17 * 0x38 + 0x70;
      FUN_00198030(lVar16,&local_10e8);
      *(undefined8 *)(lVar16 + 0x20) = 0;
      *(undefined8 *)(lVar16 + 0x28) = 0;
      *(undefined8 *)(lVar16 + 0x30) = 0;
      uVar6 = (long)local_10c0 - (long)local_10c8;
      if (uVar6 == 0) {
        pvVar15 = (void *)0x0;
        *(undefined8 *)(lVar16 + 0x20) = 0;
        *(undefined8 *)(lVar16 + 0x28) = 0;
        *(undefined8 *)(lVar16 + 0x30) = 0;
        sVar21 = (long)local_10c0 - (long)local_10c8;
      }
      else {
        if ((long)uVar6 < 0) {
                    /* WARNING: Subroutine does not return */
          std::__throw_bad_alloc();
        }
        pvVar15 = operator_new(uVar6);
        *(void **)(lVar16 + 0x20) = pvVar15;
        *(void **)(lVar16 + 0x28) = pvVar15;
        *(ulong *)(lVar16 + 0x30) = (long)pvVar15 + uVar6;
        sVar21 = (long)local_10c0 - (long)local_10c8;
      }
      sVar22 = 0;
      if (sVar21 != 0) {
        pvVar15 = memmove(pvVar15,local_10c8,sVar21);
        sVar22 = sVar21;
      }
      *(size_t *)(lVar16 + 0x28) = (long)pvVar15 + sVar22;
      *(long *)(lVar12 + 0x380) = lVar2;
    }
    if (local_10c8 != (void *)0x0) {
      operator_delete(local_10c8,local_10b8 - (long)local_10c8);
    }
    FUN_001998f0(&local_10e8);
    FUN_001998f0(&local_1120);
    FUN_001998f0(asStack_1150);
    if (!bVar7) {
      FUN_001965f0(PTR_DAT_005df810,0x4fa,"publishChargeEvent",
                   "/usr/src/debug/frank/0.1-r0/git/firmware/src/PortWorker.cpp",
                   "[portworker] event queue full, dropping event for %s",*param_2);
    }
    if (local_1208 != (string *)0x0) {
      operator_delete(local_1208,(long)local_11f8 - (long)local_1208);
    }
    FUN_0019b990(&local_10b0);
    plVar19 = plStack_1218;
    for (plVar3 = local_1220; plVar3 != plStack_1218; plVar3 = plVar3 + 5) {
      FUN_001998f0(plVar3 + 1);
      plVar19 = local_1220;
    }
    if (plVar19 != (long *)0x0) {
      operator_delete(plVar19,local_1210 - (long)plVar19);
    }
    FUN_0019b8a0(&local_11f0);
    if (local_11f0 != &uStack_11c0) {
      operator_delete(local_11f0,lStack_11e8 << 3);
    }
  }
LAB_00257518:
  if (local_8 - *(long *)PTR___stack_chk_guard_005df758 == 0) {
    return;
  }
                    /* WARNING: Subroutine does not return */
  __stack_chk_fail(PTR___stack_chk_guard_005df758,local_8 - *(long *)PTR___stack_chk_guard_005df758,
                   0);
}


