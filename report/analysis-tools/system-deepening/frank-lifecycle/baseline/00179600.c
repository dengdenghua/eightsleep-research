/* Ghidra static pseudocode; not original source. Read-only project; no target execution. */

undefined8 FUN_00179600(void)

{
  bool bVar1;
  undefined *puVar2;
  char cVar3;
  uint uVar4;
  undefined4 uVar5;
  undefined4 uVar6;
  uint *puVar7;
  undefined8 *puVar8;
  long *plVar9;
  long *plVar10;
  char *pcVar11;
  void *pvVar12;
  undefined8 uVar13;
  int iVar14;
  long lVar15;
  byte *pbVar16;
  byte *pbVar17;
  ulong uVar18;
  code *pcVar19;
  ulong uVar20;
  long *plVar21;
  undefined4 *puVar22;
  undefined1 auVar23 [16];
  long local_388;
  long local_380;
  byte *local_378;
  undefined8 uStack_370;
  byte *local_368;
  byte *local_360;
  byte *local_358;
  undefined1 auStack_350 [8];
  undefined4 *local_348;
  long *local_340;
  ulong local_338;
  long *local_330;
  undefined8 local_328;
  undefined8 local_320;
  undefined8 local_318;
  long local_310;
  undefined8 uStack_308;
  undefined8 local_300;
  undefined8 *local_2f8;
  ulong local_2f0;
  long local_2e8;
  undefined8 local_2e0;
  undefined4 local_2d8;
  undefined4 uStack_2d4;
  undefined8 local_2d0;
  undefined8 local_2c8;
  undefined8 local_2c0;
  long *local_2b8;
  byte *local_2b0;
  long *local_2a8;
  undefined8 local_2a0;
  undefined8 local_298;
  undefined8 local_290;
  long local_288;
  undefined8 uStack_280;
  undefined8 local_278;
  undefined8 *local_270;
  ulong local_268;
  long local_260;
  undefined8 local_258;
  undefined8 local_250;
  undefined8 uStack_248;
  undefined8 local_240;
  undefined8 local_238;
  undefined1 auStack_230 [32];
  undefined1 auStack_210 [32];
  undefined1 auStack_1f0 [32];
  char local_1d0;
  undefined8 local_1c8;
  undefined8 local_1c0;
  undefined8 local_1b8;
  undefined4 local_1b0;
  undefined8 local_1a8;
  undefined1 auStack_1a0 [32];
  char local_180;
  undefined8 local_178;
  undefined8 local_170;
  undefined8 local_168;
  undefined4 local_160;
  undefined8 local_158;
  undefined1 *local_150 [3];
  undefined **local_138;
  undefined1 **local_130;
  undefined **local_128;
  undefined **local_120;
  undefined8 local_118;
  undefined4 local_110;
  undefined8 local_108;
  undefined1 *local_100 [3];
  undefined **local_e8;
  undefined1 **local_e0;
  undefined **local_d8;
  undefined **local_d0;
  undefined8 local_c8;
  undefined4 local_c0;
  undefined8 local_b8;
  undefined4 local_b0;
  undefined4 local_ac;
  undefined1 auStack_a8 [16];
  undefined **local_98;
  undefined8 local_90;
  undefined **local_88;
  undefined **local_80;
  undefined1 auStack_68 [32];
  undefined4 local_48;
  long *local_40;
  ulong local_38;
  long *local_30;
  undefined8 local_28;
  undefined8 local_20;
  undefined8 uStack_18;
  long local_10;
  long local_8;
  
  puVar2 = PTR_DAT_005df9d0;
  local_8 = *(long *)PTR___stack_chk_guard_005df758;
  FUN_001965f0(PTR_DAT_005df9d0,0x30b,&DAT_00460cd8,"/usr/src/debug/frank/0.1-r0/git/main.cpp",
               "__cplusplus value is: %ld",0x313ed);
  FUN_001965f0(puVar2,0x30d,&DAT_00460cd8,"/usr/src/debug/frank/0.1-r0/git/main.cpp",
               "sensor path: %s frozen path: %s",DAT_005e36f8,DAT_005e3718);
  FUN_001965f0(puVar2,0x30e,&DAT_00460cd8,"/usr/src/debug/frank/0.1-r0/git/main.cpp",
               "Device ID: %s | Device Label: %s",DAT_005e3798,DAT_005e37b8);
  FUN_001965f0(puVar2,0x30f,&DAT_00460cd8,"/usr/src/debug/frank/0.1-r0/git/main.cpp",
               "Hub specialization: %s",DAT_005e37d8);
  local_1d0 = '\0';
  local_1c8 = 0;
  local_1c0 = 0;
  local_1b8 = 0;
  local_1b0 = 0;
  local_1a8 = 1000;
  FUN_00184520(&local_1c8,&DAT_005e3738);
  if (local_1d0 != '\0') {
    local_1d0 = '\0';
    FUN_001998f0(auStack_1f0);
  }
  local_1b0 = 1;
  FUN_001872c0(local_100,"left-pillow");
  puVar22 = &local_b0;
  FUN_00197360(puVar22,auStack_1f0);
  FUN_0025bb70(&DAT_005e2fc0,local_100,puVar22);
  FUN_001972a0(puVar22);
  FUN_001998f0(local_100);
  local_180 = '\0';
  local_178 = 0;
  local_170 = 0;
  local_168 = 0;
  local_160 = 0;
  local_158 = 1000;
  FUN_00184520(&local_178,&DAT_005e3750);
  if (local_180 != '\0') {
    local_180 = '\0';
    FUN_001998f0(auStack_1a0);
  }
  local_160 = 1;
  FUN_001872c0(local_100,"right-pillow");
  FUN_00197360(puVar22,auStack_1a0);
  FUN_0025bb70(&DAT_005e2fc0,local_100,puVar22);
  FUN_001972a0(puVar22);
  FUN_001998f0(local_100);
  if ((((DAT_005e3880 == '\0') && (DAT_005e37f8 == DAT_005e3800)) && (DAT_005e3810 == DAT_005e3818))
     && (DAT_005e3828 == DAT_005e3830)) {
    local_130 = (undefined1 **)((ulong)local_130._1_7_ << 8);
    local_128 = (undefined **)0x0;
    local_120 = (undefined **)0x0;
    local_118 = 0;
    local_110 = 0;
    local_108 = 1000;
    FUN_00184520(&local_128,&DAT_005e3768);
    bVar1 = false;
    if ((char)local_130 == '\0') goto LAB_00179820;
    FUN_00185400(local_150,"/dev/ttyLeftSensor");
    bVar1 = false;
  }
  else {
    bVar1 = true;
    local_130 = (undefined1 **)((ulong)local_130._1_7_ << 8);
    local_128 = (undefined **)0x0;
    local_120 = (undefined **)0x0;
    local_118 = 0;
    local_110 = 0;
    local_108 = 1000;
LAB_00179820:
    FUN_001872c0(local_150,"/dev/ttyLeftSensor");
    local_130 = (undefined1 **)CONCAT71(local_130._1_7_,1);
  }
  local_110 = 0;
  FUN_001872c0(local_100,"left-sensor");
  FUN_00197360(puVar22,local_150);
  FUN_0025bb70(&DAT_005e2fc0,local_100,puVar22);
  FUN_001972a0(puVar22);
  FUN_001998f0(local_100);
  local_e0 = (undefined1 **)((ulong)local_e0 & 0xffffffffffffff00);
  local_d8 = (undefined **)0x0;
  local_d0 = (undefined **)0x0;
  local_c8 = 0;
  local_c0 = 0;
  local_b8 = 1000;
  if (bVar1) {
LAB_00179bc8:
    FUN_001872c0(local_100,"/dev/ttyRightSensor");
    local_e0 = (undefined1 **)CONCAT71(local_e0._1_7_,1);
  }
  else {
    FUN_00184520(&local_d8,&DAT_005e3780);
    if ((char)local_e0 == '\0') goto LAB_00179bc8;
    FUN_00185400(local_100,"/dev/ttyRightSensor");
  }
  local_c0 = 0;
  FUN_001872c0(auStack_210,"right-sensor");
  FUN_00197360(puVar22,local_100);
  FUN_0025bb70(&DAT_005e2fc0,auStack_210,puVar22);
  FUN_001972a0(puVar22);
  FUN_001998f0(auStack_210);
  if (bVar1) {
    local_340 = (long *)0x0;
    local_338 = 0;
    local_330 = (long *)0x0;
    local_328 = 0;
    local_320 = 0;
    local_318 = 0;
    local_310 = 0;
    uStack_308 = 0;
    local_300 = 0;
    local_2f0 = 1;
    local_2e8 = 0;
    local_2e0 = 0;
    local_2d8 = 0x3f800000;
    local_2d0 = 0;
    local_2c8 = 0;
    local_2c0 = 0x2ee;
    local_2f8 = &local_2c8;
    FUN_00184520(&local_340,&DAT_005e37f8);
    FUN_00184520(&local_328,&DAT_005e3810);
    FUN_00184520(&local_310,&DAT_005e3828);
    FUN_001a5790(&local_2f8,&DAT_005e3840);
    local_2c0 = DAT_005e3878;
    FUN_001872c0(auStack_230,"cover-sensor");
    FUN_001872c0(auStack_210,"left-sensor");
    FUN_001872c0(puVar22,"right-sensor");
    local_278 = local_300;
    uStack_280 = uStack_308;
    local_288 = local_310;
    local_290 = local_318;
    local_298 = local_320;
    local_2b8 = local_340;
    local_2b0 = (byte *)local_338;
    local_2a8 = local_330;
    local_2a0 = local_328;
    local_340 = (long *)0x0;
    local_338 = 0;
    local_330 = (long *)0x0;
    local_328 = 0;
    local_320 = 0;
    local_318 = 0;
    local_310 = 0;
    uStack_308 = 0;
    local_300 = 0;
    local_268 = local_2f0;
    local_260 = local_2e8;
    local_258 = local_2e0;
    local_240 = 0;
    local_250 = CONCAT44(uStack_2d4,local_2d8);
    uStack_248 = local_2d0;
    local_270 = local_2f8;
    if (local_2f8 == &local_2c8) {
      local_240 = local_2c8;
      local_270 = &local_240;
    }
    if (local_2e8 != 0) {
      uVar20 = 0;
      if (local_2f0 != 0) {
        uVar20 = *(ulong *)(local_2e8 + 0x48) / local_2f0;
      }
      local_270[*(ulong *)(local_2e8 + 0x48) - uVar20 * local_2f0] = &local_260;
    }
    local_2f0 = 1;
    local_2e8 = 0;
    local_2e0 = 0;
    local_2d0 = 0;
    local_2c8 = 0;
    local_238 = local_2c0;
    local_2f8 = &local_2c8;
    FUN_0025c510(&DAT_005e2fc0,auStack_230,auStack_210,puVar22,&local_2b8);
    FUN_0019bd30(&local_2b8);
    FUN_001998f0(puVar22);
    FUN_001998f0(auStack_210);
    FUN_001998f0(auStack_230);
    FUN_0019bd30(&local_340);
  }
  FUN_001972a0(local_100);
  FUN_001972a0(local_150);
  FUN_001972a0(auStack_1a0);
  FUN_001972a0(auStack_1f0);
  local_388 = 0;
  local_2b8 = operator_new(0x10);
  puVar2 = PTR_pthread_create_005dfec0;
  *local_2b8 = (long)&PTR_FUN_0058e3c8;
  std::thread::_M_start_thread(&local_388,&local_2b8,puVar2);
  FUN_0019d6e0(&local_2b8);
  local_380 = 0;
  local_2b8 = operator_new(0x10);
  puVar2 = PTR_pthread_create_005dfec0;
  *local_2b8 = (long)&PTR_FUN_0058e3f0;
  std::thread::_M_start_thread(&local_380,&local_2b8,puVar2);
  FUN_0019d6e0(&local_2b8);
  uVar4 = FUN_00252ce0();
  local_340 = &local_310;
  local_338 = 1;
  local_330 = (long *)0x0;
  local_328 = 0;
  local_320 = CONCAT44(local_320._4_4_,0x3f800000);
  local_318 = 0;
  local_310 = 0;
  FUN_001872c0(puVar22,"linux_uptime_s");
  puVar7 = (uint *)FUN_001aa830(&local_340,puVar22);
  if ((char)puVar7[0xc] == '\0') {
    if ((char)puVar7[10] == '\a') {
      *puVar7 = uVar4;
    }
    else {
      FUN_0019b270();
      *puVar7 = uVar4;
      *(undefined1 *)(puVar7 + 10) = 7;
    }
  }
  else {
    FUN_0019e380();
    *(undefined1 *)(puVar7 + 0xc) = 0;
    *puVar7 = uVar4;
    *(undefined1 *)(puVar7 + 10) = 7;
  }
  FUN_001998f0(puVar22);
  pcVar11 = "hub_reboot";
  if (0x77 < uVar4) {
    pcVar11 = "app_restart";
  }
  FUN_001872c0(puVar22,"reason");
  puVar8 = (undefined8 *)FUN_001aa830(&local_340,puVar22);
  if (*(char *)(puVar8 + 6) == '\0') {
    if (*(char *)(puVar8 + 5) == '\x05') {
      *puVar8 = pcVar11;
    }
    else {
      FUN_0019b270();
      *puVar8 = pcVar11;
      *(undefined1 *)(puVar8 + 5) = 5;
    }
  }
  else {
    FUN_0019e380();
    *(undefined1 *)(puVar8 + 6) = 0;
    *puVar8 = pcVar11;
    *(undefined1 *)(puVar8 + 5) = 5;
  }
  FUN_001998f0(puVar22);
  uVar5 = FUN_00252b10();
  uVar6 = FUN_00252b50();
  local_2a8 = (long *)0x0;
  local_2a0 = local_328;
  local_2b8 = (long *)0x0;
  local_2b0 = (byte *)local_338;
  local_298 = local_320;
  local_290 = local_318;
  local_288 = 0;
  if (local_338 == 1) {
    plVar9 = &local_288;
  }
  else {
    if (0xfffffffffffffff < local_338) {
                    /* WARNING: Subroutine does not return */
      std::__throw_bad_alloc();
    }
    uVar20 = local_338 << 3;
    plVar9 = operator_new(uVar20);
    memset(plVar9,0,uVar20);
  }
  plVar21 = local_330;
  local_2b8 = plVar9;
  if (local_330 != (long *)0x0) {
    plVar9 = (long *)FUN_00185300(local_330 + 1);
    uVar18 = plVar21[0xc];
    plVar9[0xc] = uVar18;
    uVar20 = 0;
    if (local_2b0 != (byte *)0x0) {
      uVar20 = uVar18 / (ulong)local_2b0;
    }
    local_2b8[uVar18 - uVar20 * (long)local_2b0] = (long)&local_2a8;
    local_2a8 = plVar9;
    while (plVar21 = (long *)*plVar21, plVar10 = plVar9, plVar21 != (long *)0x0) {
      while( true ) {
        plVar9 = (long *)FUN_00185300(plVar21 + 1);
        uVar18 = plVar21[0xc];
        *plVar10 = (long)plVar9;
        plVar9[0xc] = uVar18;
        uVar20 = 0;
        if (local_2b0 != (byte *)0x0) {
          uVar20 = uVar18 / (ulong)local_2b0;
        }
        lVar15 = uVar18 - uVar20 * (long)local_2b0;
        if (local_2b8[lVar15] != 0) break;
        local_2b8[lVar15] = (long)plVar10;
        plVar21 = (long *)*plVar21;
        plVar10 = plVar9;
        if (plVar21 == (long *)0x0) goto LAB_00179d60;
      }
    }
  }
LAB_00179d60:
  local_b0 = uVar5;
  local_ac = uVar6;
  FUN_001872c0(auStack_a8,"frank");
  FUN_001872c0(&local_88,"app_boot");
  FUN_001872c0(auStack_68,&DAT_00460df0);
  local_48 = 1;
  local_28 = local_2a0;
  local_40 = local_2b8;
  local_38 = (ulong)local_2b0;
  local_30 = local_2a8;
  local_20 = local_298;
  uStack_18 = local_290;
  local_10 = 0;
  if (local_2b8 == &local_288) {
    local_10 = local_288;
    local_40 = &local_10;
  }
  if (local_2a8 != (long *)0x0) {
    uVar20 = 0;
    if (local_2b0 != (byte *)0x0) {
      uVar20 = (ulong)local_2a8[0xc] / (ulong)local_2b0;
    }
    local_40[local_2a8[0xc] - uVar20 * (long)local_2b0] = (long)&local_30;
  }
  local_2b0 = (byte *)0x1;
  local_2a8 = (long *)0x0;
  local_2a0 = 0;
  local_290 = 0;
  local_288 = 0;
  local_2b8 = &local_288;
  FUN_0019b8a0(&local_2b8);
  FUN_0019ba40(&local_2b8);
  cVar3 = FUN_001d84d4(puVar22);
  if (cVar3 == '\0') {
    FUN_001965f0(PTR_DAT_005df590,0x357,&DAT_00460cd8,"/usr/src/debug/frank/0.1-r0/git/main.cpp",
                 "[frank] failed to enqueue app_boot sys event");
  }
  else {
    FUN_001965f0(PTR_DAT_005df9d0,0x359,&DAT_00460cd8,"/usr/src/debug/frank/0.1-r0/git/main.cpp",
                 "[frank] app_boot: linux_uptime=%us reason=%s",uVar4,pcVar11);
  }
  FUN_0019b990(puVar22);
  FUN_0019b8a0(&local_340);
  FUN_0019ba40(&local_340);
  pcVar11 = getenv("DAC_SOCKET");
  FUN_001872c0(auStack_1a0,pcVar11);
  FUN_001a2e50(auStack_350);
  FUN_00184870(&local_340,&DAT_005e36d0,auStack_350);
  FUN_00183e70(auStack_1a0,&DAT_005e36d0);
  local_368 = local_378;
  local_138 = &PTR_FUN_0058e168;
  local_e8 = &PTR_FUN_0058e168;
  local_128 = &PTR_FUN_0058e1a0;
  local_120 = &PTR_FUN_0058e1c0;
  local_d8 = &PTR_FUN_0058e1a0;
  local_d0 = &PTR_FUN_0058e1c0;
  local_378 = (byte *)0x0;
  uStack_370 = 0;
  local_98 = &PTR_FUN_0058e168;
  local_88 = &PTR_FUN_0058e1a0;
  local_150[0] = auStack_350;
  local_130 = local_150;
  local_100[0] = auStack_350;
  local_e0 = local_100;
  FUN_0018ee50(puVar22,local_150);
  local_358 = local_368;
  local_368 = (byte *)0x0;
  local_80 = local_120;
  pvVar12 = pthread_getspecific(DAT_005e3b90);
  if ((pvVar12 != (void *)0x0) && (lVar15 = *(long *)((long)pvVar12 + 8), lVar15 != 0)) {
    pbVar17 = *(byte **)(lVar15 + 0x10);
    if (pbVar17 == (byte *)0x0) {
      pbVar16 = *(byte **)(lVar15 + 0x18);
      if (pbVar16 == (byte *)0x0) goto LAB_00179fa0;
      if ((0x6b < *pbVar16) && (((ulong)pbVar16 & 0xf) == 0)) goto LAB_0017a418;
      iVar14 = 3;
    }
    else {
      if ((0x6b < *pbVar17) && (iVar14 = 2, pbVar16 = pbVar17, ((ulong)pbVar17 & 0xf) == 0))
      goto LAB_0017a370;
      pbVar16 = *(byte **)(lVar15 + 0x18);
      if ((pbVar16 != (byte *)0x0) && ((0x6b < *pbVar16 && (((ulong)pbVar16 & 0xf) == 0)))) {
        iVar14 = 3;
        goto LAB_0017a370;
      }
      iVar14 = 2;
      pbVar16 = pbVar17;
    }
    *(undefined8 *)(lVar15 + (long)iVar14 * 8) = 0;
    free(pbVar16);
  }
LAB_00179fa0:
  pbVar16 = (byte *)aligned_alloc(0x10,0x1c0);
  if (pbVar16 == (byte *)0x0) {
    local_2b8 = (long *)(PTR_vtable_005dfa00 + 0x10);
    auVar23 = FUN_00175154();
    FUN_001946b0(auStack_350);
    FUN_001998f0(auStack_1a0);
    if (local_380 != 0) goto LAB_0017a408;
    if (local_388 != 0) {
                    /* WARNING: Subroutine does not return */
      std::terminate();
    }
    if (auVar23._8_8_ != 1) {
                    /* WARNING: Subroutine does not return */
      _Unwind_Resume(auVar23._0_8_);
    }
    plVar9 = (long *)__cxa_begin_catch();
    uVar13 = (**(code **)(*plVar9 + 0x10))();
    FUN_001965f0(PTR_DAT_005df7b0,0x374,&DAT_00460cd8,"/usr/src/debug/frank/0.1-r0/git/main.cpp",
                 "Exception: %s",uVar13);
    __cxa_end_catch();
  }
  else {
    pbVar16[0x1b0] = 0x6c;
    while( true ) {
      *(code **)pbVar16 = FUN_0018cbe0;
      *(code **)(pbVar16 + 8) = FUN_0018d644;
      pbVar16[0x90] = 1;
      pbVar16[0xa0] = 0;
      pbVar16[0xa1] = 0;
      pbVar16[0xa2] = 0;
      pbVar16[0xa3] = 0;
      pbVar16[0xa4] = 0;
      pbVar16[0xa5] = 0;
      pbVar16[0xa6] = 0;
      pbVar16[0xa7] = 0;
      *(undefined ***)(pbVar16 + 0xc0) = local_98;
      pcVar19 = (code *)local_98[2];
      *(undefined ***)(pbVar16 + 0xd0) = local_88;
      local_98 = &PTR_FUN_0058e398;
      local_88 = &PTR_FUN_0058e378;
      (*pcVar19)(pbVar16 + 0xa8,puVar22);
      local_90 = 0;
      *(undefined ***)(pbVar16 + 0xd8) = local_80;
      local_360 = pbVar16 + 0x10;
      pcVar19 = (code *)*local_98;
      local_80 = &PTR_FUN_0058e2d0;
      *(byte **)(pbVar16 + 0x10) = pbVar16;
      pbVar16[0x18] = 0;
      pbVar16[0x19] = 0;
      pbVar16[0x1a] = 0;
      pbVar16[0x1b] = 0;
      pbVar16[0x1c] = 0;
      pbVar16[0x1d] = 0;
      pbVar16[0x1e] = 0;
      pbVar16[0x1f] = 0;
      pbVar16[0x20] = 0;
      pbVar16[0x21] = 0;
      pbVar16[0x22] = 0;
      pbVar16[0x23] = 0;
      pbVar16[0x24] = 0;
      pbVar16[0x25] = 0;
      pbVar16[0x26] = 0;
      pbVar16[0x27] = 0;
      pbVar16[0x28] = 0;
      pbVar16[0x29] = 0;
      pbVar16[0x2a] = 0;
      pbVar16[0x2b] = 0;
      pbVar16[0x2c] = 0;
      pbVar16[0x2d] = 0;
      pbVar16[0x2e] = 0;
      pbVar16[0x2f] = 0;
      pbVar16[0x30] = 0;
      pbVar16[0x31] = 0;
      pbVar16[0x32] = 0;
      pbVar16[0x33] = 0;
      pbVar16[0x34] = 0;
      pbVar16[0x35] = 0;
      pbVar16[0x36] = 0;
      pbVar16[0x37] = 0;
      pbVar16[0x70] = 0;
      pbVar16[0x71] = 0;
      pbVar16[0x72] = 0;
      pbVar16[0x73] = 0;
      pbVar16[0x74] = 0;
      pbVar16[0x75] = 0;
      pbVar16[0x76] = 0;
      pbVar16[0x77] = 0;
      pbVar16[0x78] = 0;
      pbVar16[0x79] = 0;
      pbVar16[0x7a] = 0;
      pbVar16[0x7b] = 0;
      pbVar16[0x7c] = 0;
      pbVar16[0x7d] = 0;
      pbVar16[0x7e] = 0;
      pbVar16[0x7f] = 0;
      pbVar16[0x80] = 0;
      pbVar16[0x81] = 0;
      pbVar16[0x82] = 0;
      pbVar16[0x83] = 0;
      pbVar16[0x84] = 0;
      pbVar16[0x85] = 0;
      pbVar16[0x86] = 0;
      pbVar16[0x87] = 0;
      pbVar16[0x88] = 0;
      pbVar16[0x89] = 0;
      pbVar16[0x8a] = 1;
      pbVar16[0x92] = 2;
      pbVar16[0x93] = 0;
      *(byte **)(pbVar16 + 0x98) = pbVar16;
      *(byte **)(pbVar16 + 0xe0) = local_358;
      pbVar16[0xe9] = 0;
      (*pcVar19)(puVar22);
      pbVar16 = local_360;
      pbVar17 = local_360 + 0x28;
      pcVar19 = (code *)local_138[1];
      local_360 = (byte *)0x0;
      local_358 = pbVar16;
      local_2b8 = (long *)0x0;
      *(byte **)(pbVar16 + 0x60) = pbVar16;
      *(undefined ***)(pbVar16 + 0x40) = local_138;
      *(undefined ***)(pbVar16 + 0x50) = local_128;
      (*pcVar19)(pbVar17,local_150);
      *(undefined ***)(pbVar16 + 0x58) = local_120;
      lVar15 = *(long *)(local_358 + 0x60);
      local_358[0x68] = 0;
      local_358[0x69] = 0;
      local_358[0x6a] = 0;
      local_358[0x6b] = 0;
      local_358[0x6c] = 0;
      local_358[0x6d] = 0;
      local_358[0x6e] = 0;
      local_358[0x6f] = 0;
      local_358[0x70] = 0;
      local_358[0x71] = 0;
      local_358[0x72] = 0;
      local_358[0x73] = 0;
      local_358[0x74] = 0;
      local_358[0x75] = 0;
      local_358[0x76] = 0;
      local_358[0x77] = 0;
      local_358[0x78] = 1;
      *(byte ***)(lVar15 + 8) = &local_358;
      FUN_001b0560(&local_358);
      FUN_001ac190(&local_358);
      if (local_2b8 != (long *)0x0) {
        (**(code **)(*local_2b8 + 8))();
      }
      if (local_360 != (byte *)0x0) {
        (**(code **)(*(long *)local_360 + 8))();
      }
      FUN_001988f0(&local_368);
      (*(code *)*local_138)(local_150);
      (*(code *)*local_e8)(local_100);
      FUN_001988f0(&uStack_370);
      FUN_001988f0(&local_378);
      local_2b8 = (long *)((ulong)local_2b8 & 0xffffffff00000000);
      pbVar16 = (byte *)std::_V2::system_category();
      puVar22 = local_348;
      local_2b0 = pbVar16;
      FUN_001830b0(local_348,&local_2b8);
      if ((int)local_2b8 == 0) break;
      lVar15 = FUN_00199920(&local_2b8);
LAB_0017a418:
      iVar14 = 3;
LAB_0017a370:
      *(undefined8 *)(lVar15 + (long)iVar14 * 8) = 0;
      pbVar16[0x1b0] = *pbVar16;
    }
    FUN_002547f0(&DAT_005e2fc0);
    std::thread::join();
    *(undefined1 *)(DAT_005e3b98 + 0x80) = 0;
    std::thread::join();
    if (local_340 != (long *)0x0) {
      FUN_00181820();
    }
    if (local_338 != 0) {
      std::thread::join();
    }
    FUN_00196550(&local_340);
    FUN_001946b0(auStack_350);
    FUN_001998f0(auStack_1a0);
    if ((local_380 != 0) || (local_388 != 0)) {
LAB_0017a408:
                    /* WARNING: Subroutine does not return */
      std::terminate();
    }
  }
  if (local_8 - *(long *)PTR___stack_chk_guard_005df758 != 0) {
                    /* WARNING: Subroutine does not return */
    __stack_chk_fail(PTR___stack_chk_guard_005df758,
                     local_8 - *(long *)PTR___stack_chk_guard_005df758,0);
  }
  return 1;
}


