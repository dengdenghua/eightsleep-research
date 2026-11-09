/* Ghidra static pseudocode; not original source. Read-only project; no target execution. */

void FUN_00243e70(long param_1,undefined8 param_2,undefined8 *param_3)

{
  undefined4 *puVar1;
  undefined8 uVar2;
  undefined8 uVar3;
  undefined2 uVar4;
  undefined4 uVar5;
  undefined1 uVar6;
  undefined4 uVar7;
  undefined *puVar8;
  undefined8 uVar9;
  code *pcVar10;
  int iVar11;
  void *pvVar12;
  long *plVar13;
  long lVar14;
  code *pcVar15;
  locale alStack_238 [8];
  undefined *local_230;
  undefined *puStack_228;
  undefined8 local_220;
  long *local_218;
  undefined8 uStack_210;
  long local_208;
  char local_200 [4];
  undefined1 local_1fc;
  long *local_1f8;
  undefined8 uStack_1f0;
  long local_1e8;
  long *local_1e0;
  undefined4 local_1d8;
  undefined4 local_1d0;
  undefined8 local_1c8;
  undefined8 uStack_1c0;
  code *local_1b8;
  code *local_1b0;
  undefined8 local_1a8;
  undefined1 local_1a0;
  code **local_198;
  undefined8 local_190;
  code *local_188;
  code *local_180;
  long *local_c8;
  long local_b8 [4];
  long local_98;
  long *local_90;
  long *local_88;
  long local_78 [2];
  undefined1 auStack_68 [96];
  long local_8;
  
  local_8 = *(long *)PTR___stack_chk_guard_005df758;
  FUN_00237470(2,0x9600,param_2,1);
  local_220 = DAT_005e0a90;
  local_230 = PTR_FUN_005e0a80;
  puStack_228 = PTR_FUN_005e0a88;
  FUN_001d9a50(param_1 + 0x10,&local_230,param_1 + 0x1080,0x800,param_1 + 0x1880,0);
  uVar4 = s_false_00462350._4_2_;
  *(undefined4 *)(param_1 + 0x2220) = s_false_00462350._0_4_;
  uVar5 = DAT_00462348;
  *(undefined2 *)(param_1 + 0x2224) = uVar4;
  uVar6 = DAT_0046234c;
  *(undefined4 *)(param_1 + 0x2248) = uVar5;
  *(undefined1 *)(param_1 + 0x224c) = uVar6;
  uVar4 = DAT_004622c0;
  *(undefined2 *)(param_1 + 0x2298) = 0x30;
  *(undefined2 *)(param_1 + 0x22c0) = uVar4;
  uVar2 = s_device_state_0046fcf8._0_8_;
  *(undefined8 *)(param_1 + 0x2270) = 0x6e776f6e6b6e75;
  uVar5 = s_device_state_0046fcf8._8_4_;
  *(undefined1 *)(param_1 + 0x22c2) = DAT_004622c2;
  uVar9 = DAT_005e3b98;
  uVar7 = s_device_state_0046fcf8._8_4_;
  uVar3 = s_device_state_0046fcf8._0_8_;
  uStack_210 = 0xc;
  s_device_state_0046fcf8[0] = (char)uVar2;
  s_device_state_0046fcf8[1] = SUB81(uVar2,1);
  s_device_state_0046fcf8[2] = SUB81(uVar2,2);
  s_device_state_0046fcf8[3] = SUB81(uVar2,3);
  s_device_state_0046fcf8[4] = SUB81(uVar2,4);
  s_device_state_0046fcf8[5] = SUB81(uVar2,5);
  s_device_state_0046fcf8[6] = SUB81(uVar2,6);
  s_device_state_0046fcf8[7] = SUB81(uVar2,7);
  local_208._0_1_ = s_device_state_0046fcf8[0];
  local_208._1_1_ = s_device_state_0046fcf8[1];
  local_208._2_1_ = s_device_state_0046fcf8[2];
  local_208._3_1_ = s_device_state_0046fcf8[3];
  local_208._4_1_ = s_device_state_0046fcf8[4];
  local_208._5_1_ = s_device_state_0046fcf8[5];
  local_208._6_1_ = s_device_state_0046fcf8[6];
  local_208._7_1_ = s_device_state_0046fcf8[7];
  local_1fc = 0;
  s_device_state_0046fcf8[8] = (char)uVar5;
  s_device_state_0046fcf8[9] = SUB41(uVar5,1);
  s_device_state_0046fcf8[10] = SUB41(uVar5,2);
  s_device_state_0046fcf8[0xb] = SUB41(uVar5,3);
  local_200[0] = s_device_state_0046fcf8[8];
  local_200[1] = s_device_state_0046fcf8[9];
  local_200[2] = s_device_state_0046fcf8[10];
  local_200[3] = s_device_state_0046fcf8[0xb];
  s_device_state_0046fcf8._0_8_ = uVar3;
  s_device_state_0046fcf8._8_4_ = uVar7;
  local_218 = &local_208;
  local_1f8 = &local_1e8;
  local_1f8 = operator_new(0x11);
  uVar2 = s_frank_frozen_cap_004700a0._8_8_;
  *local_1f8 = s_frank_frozen_cap_004700a0._0_8_;
  local_1f8[1] = uVar2;
  *(char *)(local_1f8 + 2) = '\0';
  uStack_1f0 = 0x10;
  local_1e8 = 0x10;
  local_198 = &local_188;
  local_198 = operator_new(0x15);
  uVar2 = s___hasCap___unknown___00470110._8_8_;
  *local_198 = (code *)s___hasCap___unknown___00470110._0_8_;
  local_198[1] = (code *)uVar2;
  *(undefined4 *)(local_198 + 2) = s___hasCap___unknown___00470110._16_4_;
  *(char *)((long)local_198 + 0x14) = '\0';
  local_190 = 0x14;
  local_188 = (code *)0x14;
  FUN_002463a0(uVar9,&local_218,&local_1f8,&local_198);
  if (local_198 != &local_188) {
    operator_delete(local_198,(ulong)(local_188 + 1));
  }
  if (local_1f8 != &local_1e8) {
    operator_delete(local_1f8,local_1e8 + 1);
  }
  if (local_218 != &local_208) {
    operator_delete(local_218,local_208 + 1);
  }
  puVar8 = PTR_DAT_005df958;
  (**(code **)**(undefined8 **)PTR_DAT_005df958)
            (*(undefined8 **)PTR_DAT_005df958,"priming",param_1 + 0x2220);
  (**(code **)**(undefined8 **)puVar8)(*(undefined8 **)puVar8,"waterLevel",param_1 + 0x2248);
  (**(code **)**(undefined8 **)puVar8)(*(undefined8 **)puVar8,"hasCap",param_1 + 0x2270);
  (**(code **)**(undefined8 **)puVar8)(*(undefined8 **)puVar8,"needsPrime",param_1 + 0x2298);
  (**(code **)**(undefined8 **)puVar8)(*(undefined8 **)puVar8,"primingState",param_1 + 0x22c0);
  local_198 = (code **)FUN_0023eda4;
  local_188 = FUN_00244d40;
  local_180 = FUN_00245330;
  pvVar12 = operator_new(0x20);
  *(undefined8 *)((long)pvVar12 + 0x10) = 0;
  if (local_188 != (code *)0x0) {
    (*local_188)(pvVar12,&local_198,2);
    *(code **)((long)pvVar12 + 0x10) = local_188;
    *(code **)((long)pvVar12 + 0x18) = local_180;
  }
  FUN_00253590(*(undefined8 *)PTR_DAT_005df958,0xd,pvVar12);
  if (local_188 != (code *)0x0) {
    (*local_188)(&local_198,&local_198,3);
  }
  local_198 = (code **)FUN_0023f1e0;
  local_188 = FUN_00244d40;
  local_180 = FUN_00245330;
  pvVar12 = operator_new(0x20);
  *(undefined8 *)((long)pvVar12 + 0x10) = 0;
  if (local_188 != (code *)0x0) {
    (*local_188)(pvVar12,&local_198,2);
    *(code **)((long)pvVar12 + 0x10) = local_188;
    *(code **)((long)pvVar12 + 0x18) = local_180;
  }
  FUN_00253590(*(undefined8 *)PTR_DAT_005df958,0x12,pvVar12);
  if (local_188 != (code *)0x0) {
    (*local_188)(&local_198,&local_198,3);
  }
  FUN_00283540(param_1 + 0x2148);
  local_218 = &local_208;
  plVar13 = operator_new(0x13);
  uVar2 = s_frozen_temps_event_0046fe10._8_8_;
  uStack_210 = 0x12;
  *plVar13 = s_frozen_temps_event_0046fe10._0_8_;
  plVar13[1] = uVar2;
  *(undefined2 *)(plVar13 + 2) = s_frozen_temps_event_0046fe10._16_2_;
  *(char *)((long)plVar13 + 0x12) = '\0';
  local_208 = 0x12;
  local_218 = plVar13;
  std::locale::locale(alStack_238);
  local_1f8 = (long *)CONCAT44(local_1f8._4_4_,0x10);
  std::locale::locale((locale *)&uStack_1f0,alStack_238);
  FUN_00230d10(&local_198,plVar13,(char *)((long)plVar13 + 0x12),(locale *)&uStack_1f0,
               (ulong)local_1f8 & 0xffffffff);
  local_1e8 = local_98;
  local_1e0 = local_90;
  local_98 = 0;
  local_90 = (long *)0x0;
  FUN_00224b30(auStack_68);
  if (local_88 != local_78) {
    operator_delete(local_88,local_78[0] + 1);
  }
  plVar13 = local_90;
  if (local_90 != (long *)0x0) {
    if (PTR___pthread_key_create_005dfdb8 == (undefined *)0x0) {
      iVar11 = (int)local_90[1];
      *(int *)(local_90 + 1) = iVar11 + -1;
    }
    else {
      iVar11 = FUN_00460320(0xffffffff,local_90 + 1);
    }
    if (iVar11 == 1) {
      (**(code **)(*plVar13 + 0x10))(plVar13);
      if (PTR___pthread_key_create_005dfdb8 == (undefined *)0x0) {
        iVar11 = *(int *)((long)plVar13 + 0xc);
        *(int *)((long)plVar13 + 0xc) = iVar11 + -1;
      }
      else {
        iVar11 = FUN_00460320(0xffffffff,(long)plVar13 + 0xc);
      }
      if (iVar11 == 1) {
        (**(code **)(*plVar13 + 0x18))(plVar13);
      }
    }
  }
  if (local_c8 != local_b8) {
    operator_delete(local_c8,local_b8[0] + 1);
  }
  std::locale::~locale(alStack_238);
  local_188 = (code *)0x0;
  local_1d8 = 300000;
  if (*(code **)(param_1 + 0x2158) == (code *)0x0) {
    local_1d0 = 0;
    local_1b8 = (code *)0x0;
  }
  else {
    (**(code **)(param_1 + 0x2158))(&local_198,param_1 + 0x2148,2);
    local_188 = *(code **)(param_1 + 0x2158);
    local_180 = *(code **)(param_1 + 0x2160);
    local_1d0 = 0;
    local_1b8 = (code *)0x0;
    if (local_188 != (code *)0x0) {
      (*local_188)(&local_1c8,&local_198,2);
      local_1b8 = local_188;
      local_1b0 = local_180;
    }
  }
  local_1a8 = 0;
  local_1a0 = 0;
  puVar1 = *(undefined4 **)(param_1 + 0x2170);
  if (puVar1 == *(undefined4 **)(param_1 + 0x2178)) {
    FUN_00224180(param_1 + 0x2168,puVar1,&local_1f8);
  }
  else {
    *puVar1 = local_1f8._0_4_;
    std::locale::locale((locale *)(puVar1 + 2),(locale *)&uStack_1f0);
    pcVar10 = local_1b8;
    plVar13 = local_1e0;
    *(long *)(puVar1 + 4) = local_1e8;
    *(undefined8 *)(puVar1 + 6) = 0;
    local_1e0 = (long *)0x0;
    *(long **)(puVar1 + 6) = plVar13;
    local_1e8 = 0;
    puVar1[8] = local_1d8;
    uVar2 = *(undefined8 *)(puVar1 + 0xc);
    uVar3 = *(undefined8 *)(puVar1 + 0xe);
    puVar1[10] = local_1d0;
    *(undefined8 *)(puVar1 + 0x10) = 0;
    *(undefined8 *)(puVar1 + 0xc) = local_1c8;
    *(undefined8 *)(puVar1 + 0xe) = uStack_1c0;
    pcVar15 = *(code **)(puVar1 + 0x12);
    local_1b8 = (code *)0x0;
    *(code **)(puVar1 + 0x10) = pcVar10;
    *(code **)(puVar1 + 0x12) = local_1b0;
    lVar14 = *(long *)(param_1 + 0x2170);
    puVar1[0x14] = (undefined4)local_1a8;
    puVar1[0x15] = local_1a8._4_4_;
    *(undefined1 *)(puVar1 + 0x16) = local_1a0;
    *(long *)(param_1 + 0x2170) = lVar14 + 0x60;
    local_1c8 = uVar2;
    uStack_1c0 = uVar3;
    local_1b0 = pcVar15;
  }
  if (local_1b8 != (code *)0x0) {
    (*local_1b8)(&local_1c8,&local_1c8,3);
  }
  plVar13 = local_1e0;
  if (local_1e0 != (long *)0x0) {
    if (PTR___pthread_key_create_005dfdb8 == (undefined *)0x0) {
      iVar11 = (int)local_1e0[1];
      *(int *)(local_1e0 + 1) = iVar11 + -1;
    }
    else {
      iVar11 = FUN_00460320(0xffffffff,local_1e0 + 1);
    }
    if (iVar11 == 1) {
      (**(code **)(*plVar13 + 0x10))(plVar13);
      if (PTR___pthread_key_create_005dfdb8 == (undefined *)0x0) {
        iVar11 = *(int *)((long)plVar13 + 0xc);
        *(int *)((long)plVar13 + 0xc) = iVar11 + -1;
      }
      else {
        iVar11 = FUN_00460320(0xffffffff,(long)plVar13 + 0xc);
      }
      if (iVar11 == 1) {
        (**(code **)(*plVar13 + 0x18))(plVar13);
      }
    }
  }
  std::locale::~locale((locale *)&uStack_1f0);
  if (local_188 != (code *)0x0) {
    (*local_188)(&local_198,&local_198,3);
  }
  if (local_218 != &local_208) {
    operator_delete(local_218,local_208 + 1);
  }
  uVar2 = *param_3;
  iVar11 = FUN_0023df44(uVar2,param_3[1],"pillow");
  puVar8 = PTR_DAT_005df810;
  *(uint *)(param_1 + 0x2518) = (uint)(iVar11 == 0);
  FUN_001965f0(puVar8,0x6c,"init",
               "/usr/src/debug/frank/0.1-r0/git/firmware/src/subsystem/frozen.cpp",
               "init with specialization=%s",uVar2);
  FUN_0023fbf0(param_1);
  if (local_8 - *(long *)PTR___stack_chk_guard_005df758 == 0) {
    return;
  }
                    /* WARNING: Subroutine does not return */
  __stack_chk_fail(PTR___stack_chk_guard_005df758,local_8 - *(long *)PTR___stack_chk_guard_005df758,
                   0);
}


