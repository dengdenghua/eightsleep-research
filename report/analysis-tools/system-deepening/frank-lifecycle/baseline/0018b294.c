/* Ghidra static pseudocode; not original source. Read-only project; no target execution. */

void FUN_0018b294(undefined8 *param_1)

{
  undefined8 *puVar1;
  long lVar2;
  long lVar3;
  ushort uVar4;
  undefined1 uVar5;
  code *pcVar6;
  ulong uVar7;
  long lVar8;
  void *pvVar9;
  ulong **ppuVar10;
  ulong **ppuVar11;
  ulong **ppuVar12;
  ulong **ppuVar13;
  long lVar14;
  undefined8 *puVar15;
  undefined8 uVar16;
  long lVar17;
  long *plVar18;
  ulong **unaff_x21;
  ulong **unaff_x22;
  ulong **unaff_x25;
  long unaff_x26;
  undefined1 auVar19 [16];
  long local_178;
  ulong *local_170 [2];
  undefined8 local_160;
  ulong *local_158 [2];
  undefined8 local_148;
  undefined1 local_140 [8];
  void *local_138;
  undefined8 uStack_130;
  undefined1 local_128;
  undefined8 local_120;
  undefined8 uStack_118;
  undefined1 local_110 [8];
  void *local_108;
  undefined8 uStack_100;
  undefined1 local_f8;
  undefined8 local_f0;
  undefined8 uStack_e8;
  ulong *local_e0;
  void *local_d8;
  ulong local_d0;
  undefined1 local_c8;
  undefined7 uStack_c7;
  ulong local_c0;
  undefined8 uStack_b8;
  undefined1 local_b0 [8];
  void *local_a8;
  undefined8 uStack_a0;
  undefined1 local_98 [16];
  undefined8 local_88;
  ulong *local_80;
  void *local_78;
  ulong local_70;
  undefined8 local_68 [2];
  undefined8 local_58;
  ulong *local_50;
  void *local_48;
  ulong local_40;
  undefined8 uStack_38;
  ulong *local_30;
  void *local_28;
  ulong local_20;
  undefined8 uStack_18;
  undefined8 local_10;
  ulong *local_8;
  
  uVar4 = *(ushort *)((long)param_1 + 0x3a);
  local_8 = *(ulong **)PTR___stack_chk_guard_005df758;
  if ((uVar4 & 1) == 0) {
    if (uVar4 == 4) {
      puVar15 = (undefined8 *)param_1[0x21];
LAB_0018b37c:
      puVar1 = param_1 + 0x1a;
      lVar14 = *(long *)puVar15[1];
      lVar8 = *(long *)(lVar14 + 0x40);
      param_1[0x1d] = lVar8;
      param_1[0x1f] = *(undefined8 *)(lVar14 + 0x50);
      (**(code **)(lVar8 + 8))(puVar1,lVar14 + 0x28);
      param_1[0x20] = *(undefined8 *)(lVar14 + 0x58);
      FUN_001aefe0(param_1 + 0xb,0,puVar1);
      (**(code **)param_1[0x1d])(puVar1);
    }
    else {
      if (uVar4 < 5) {
        if (uVar4 == 0) {
          *(undefined2 *)((long)param_1 + 0x3a) = 2;
          *(undefined1 *)(param_1 + 10) = 0;
          param_1[8] = param_1;
          goto LAB_0018b330;
        }
        if (uVar4 != 2) goto LAB_0018b2ec;
        puVar15 = param_1 + 2;
        *(undefined1 *)(param_1 + 10) = 1;
        param_1[0x21] = puVar15;
        goto LAB_0018b37c;
      }
      if (uVar4 != 6) {
        if (uVar4 != 8) goto LAB_0018b2ec;
        goto LAB_0018b320;
      }
      FUN_00198440(param_1 + 0x2f,param_1 + 0x31,PTR___stack_chk_guard_005df758,0);
      FUN_00198400(param_1 + 0x31);
      FUN_00198400(param_1 + 0x32);
    }
    puVar15 = param_1 + 0xb;
    lVar8 = FUN_0023f2c0();
    *(bool *)(param_1 + 0x22) = *(int *)(lVar8 + 0x2088) == 2;
    lVar8 = std::chrono::_V2::system_clock::now();
    local_140[0] = 0;
    local_138 = (void *)0x0;
    param_1[0x23] = lVar8 / 1000000;
    FUN_001a92b0(&local_138,0);
    local_140[0] = 3;
    pvVar9 = operator_new(0x20);
    FUN_001872c0(pvVar9,"v");
    uStack_130 = 0;
    local_128 = 5;
    local_120 = 1;
    uStack_118 = 0;
    local_138 = pvVar9;
    FUN_001b26c0(&local_50,local_140,2,1,2);
    local_110[0] = 0;
    local_108 = (void *)0x0;
    local_40 = 0;
    FUN_001a92b0(&local_108,0);
    local_110[0] = 3;
    pvVar9 = operator_new(0x20);
    FUN_001872c0(pvVar9,"ts");
    local_f0 = param_1[0x23];
    uStack_100 = 0;
    local_f8 = 5;
    uStack_e8 = 0;
    local_108 = pvVar9;
    FUN_001b26c0(&uStack_38,local_110,2,1,2);
    local_80 = (ulong *)((ulong)local_80 & 0xffffffffffffff00);
    local_78 = (void *)0x0;
    local_28 = (void *)0x0;
    FUN_001a92b0(&local_78,0);
    local_80 = (ulong *)CONCAT71(local_80._1_7_,3);
    pvVar9 = operator_new(0x20);
    FUN_001872c0(pvVar9,"subsystems");
    local_b0[0] = 0;
    local_a8 = (void *)0x0;
    local_70 = 0;
    local_78 = pvVar9;
    FUN_001a92b0(&local_a8,0);
    local_b0[0] = 3;
    pvVar9 = operator_new(0x20);
    FUN_001872c0(pvVar9,"frozen");
    local_e0 = (ulong *)((ulong)local_e0 & 0xffffffffffffff00);
    local_d8 = (void *)0x0;
    uStack_a0 = 0;
    local_a8 = pvVar9;
    FUN_001a92b0(&local_d8,0);
    local_e0 = (ulong *)CONCAT71(local_e0._1_7_,3);
    pvVar9 = operator_new(0x20);
    FUN_001872c0(pvVar9,"up");
    uStack_b8 = 0;
    local_d0 = 0;
    local_c8 = 4;
    local_c0 = (ulong)*(byte *)(param_1 + 0x22);
    local_d8 = pvVar9;
    FUN_001b26c0(local_170,&local_e0,2,1,2);
    local_160 = 0;
    FUN_001b26c0(local_98,local_170,1,1,2);
    ppuVar13 = (ulong **)local_b0;
    ppuVar12 = local_158;
    local_88 = 0;
    FUN_001b26c0(ppuVar12,ppuVar13,2,1,2);
    local_148 = 0;
    FUN_001b26c0(local_68,ppuVar12,1,1,2);
    local_58 = 0;
    FUN_001b26c0(&local_20,&local_80,2,1,2);
    local_10 = 0;
    FUN_001b26c0(param_1 + 0x24,&local_50,3,1,2);
    ppuVar10 = &local_8;
    do {
      uVar5 = *(undefined1 *)(ppuVar10 + -3);
      param_1[0x2d] = ppuVar10 + -3;
      FUN_001a92b0(ppuVar10 + -2,uVar5);
      ppuVar10 = (ulong **)param_1[0x2d];
      ppuVar11 = &local_50;
    } while (ppuVar10 != &local_50);
    do {
      uVar5 = *(undefined1 *)(ppuVar11 + -3);
      param_1[0x2c] = ppuVar11 + -3;
      FUN_001a92b0(ppuVar11 + -2,uVar5);
      ppuVar10 = (ulong **)local_140;
      ppuVar11 = (ulong **)param_1[0x2c];
    } while ((ulong **)param_1[0x2c] != &local_80);
    do {
      uVar5 = *(undefined1 *)(ppuVar10 + -3);
      param_1[0x2b] = ppuVar10 + -3;
      FUN_001a92b0(ppuVar10 + -2,uVar5);
      ppuVar11 = &local_80;
      ppuVar10 = (ulong **)param_1[0x2b];
    } while ((ulong **)param_1[0x2b] != ppuVar12);
    do {
      uVar5 = *(undefined1 *)(ppuVar11 + -3);
      param_1[0x2a] = ppuVar11 + -3;
      FUN_001a92b0(ppuVar11 + -2,uVar5);
      ppuVar11 = (ulong **)param_1[0x2a];
    } while ((ulong **)param_1[0x2a] != ppuVar13);
    do {
      uVar5 = *(undefined1 *)(ppuVar12 + -3);
      param_1[0x29] = ppuVar12 + -3;
      FUN_001a92b0(ppuVar12 + -2,uVar5);
      ppuVar12 = (ulong **)param_1[0x29];
    } while (ppuVar12 != local_170);
    do {
      uVar5 = *(undefined1 *)(ppuVar13 + -3);
      param_1[0x28] = ppuVar13 + -3;
      FUN_001a92b0(ppuVar13 + -2,uVar5);
      ppuVar13 = (ulong **)param_1[0x28];
      ppuVar12 = &local_e0;
    } while (ppuVar13 != &local_e0);
    do {
      uVar5 = *(undefined1 *)(ppuVar12 + -3);
      param_1[0x27] = ppuVar12 + -3;
      FUN_001a92b0(ppuVar12 + -2,uVar5);
      ppuVar12 = (ulong **)param_1[0x27];
    } while (ppuVar12 != (ulong **)local_110);
    do {
      uVar5 = *(undefined1 *)(ppuVar12 + -3);
      param_1[0x26] = ppuVar12 + -3;
      FUN_001a92b0(ppuVar12 + -2,uVar5);
      lVar8 = DAT_005e3b98;
      ppuVar12 = (ulong **)param_1[0x26];
    } while (ppuVar12 != (ulong **)local_140);
    FUN_001872c0(&local_80,"device.heartbeat.frank");
    FUN_001b3c20(&local_e0,param_1 + 0x24,0xffffffff,0x20,0,0);
    local_40 = local_70;
    local_48 = local_78;
    local_20 = local_d0;
    local_28 = local_d8;
    if (local_80 == &local_70) {
      uStack_38 = local_68[0];
      local_50 = &local_40;
    }
    else {
      local_50 = local_80;
    }
    local_78 = (void *)0x0;
    local_70 = local_70 & 0xffffffffffffff00;
    if (local_e0 == &local_d0) {
      uStack_18 = CONCAT71(uStack_c7,local_c8);
      local_30 = &local_20;
    }
    else {
      local_30 = local_e0;
    }
    local_d8 = (void *)0x0;
    local_d0 = local_d0 & 0xffffffffffffff00;
    lVar14 = *(long *)(lVar8 + 0x500) + 1;
    lVar3 = lVar14;
    if (lVar14 == *(long *)(lVar8 + 0x4c0)) {
      lVar3 = 0;
    }
    if ((*(long *)(lVar8 + 0x540) != lVar3) ||
       (*(long *)(lVar8 + 0x540) = *(long *)(lVar8 + 0x580), lVar3 != *(long *)(lVar8 + 0x580))) {
      lVar17 = *(long *)(lVar8 + 0x4c8);
      lVar14 = lVar14 * 0x40;
      lVar2 = lVar17 + lVar14;
      *(long *)(lVar17 + lVar14) = lVar2 + 0x10;
      if (local_50 == &local_40) {
        *(ulong *)(lVar2 + 0x10) = local_40;
        *(undefined8 *)(lVar2 + 0x18) = uStack_38;
      }
      else {
        *(ulong **)(lVar17 + lVar14) = local_50;
        *(ulong *)(lVar2 + 0x10) = local_40;
      }
      *(void **)(lVar2 + 8) = local_48;
      local_48 = (void *)0x0;
      local_40 = local_40 & 0xffffffffffffff00;
      *(long *)(lVar2 + 0x20) = lVar2 + 0x30;
      if (local_30 == &local_20) {
        *(ulong *)(lVar2 + 0x30) = local_20;
        *(undefined8 *)(lVar2 + 0x38) = uStack_18;
      }
      else {
        *(ulong **)(lVar2 + 0x20) = local_30;
        *(ulong *)(lVar2 + 0x30) = local_20;
      }
      *(void **)(lVar2 + 0x28) = local_28;
      local_28 = (void *)0x0;
      local_20 = local_20 & 0xffffffffffffff00;
      *(long *)(lVar8 + 0x500) = lVar3;
      local_50 = &local_40;
      local_30 = &local_20;
    }
    local_e0 = &local_d0;
    local_80 = &local_70;
    FUN_001998f0(&local_30);
    FUN_001998f0(&local_50);
    FUN_001998f0(&local_e0);
    FUN_001998f0(&local_80);
    FUN_001a92b0(param_1 + 0x25,*(undefined1 *)(param_1 + 0x24));
    while( true ) {
      local_178 = *(long *)param_1[9] * 1000000;
      FUN_00189e90(puVar15,&local_178);
      FUN_00182270(param_1 + 0x32,puVar15);
      if (((*(char *)(*(long *)param_1[3] + 0x7a) == '\0') ||
          (lVar8 = *(long *)(*(long *)param_1[3] + 0x70), lVar8 == 0)) || (*(int *)(lVar8 + 8) == 0)
         ) break;
      lVar8 = FUN_00185444();
      do {
        FUN_001b4160(puVar15);
        __cxa_begin_catch(lVar8);
        if (*(char *)(param_1 + 10) != '\0') {
          puVar15 = param_1 + 2;
          *param_1 = 0;
          *(undefined2 *)((long)param_1 + 0x3a) = 0;
          FUN_00198530(puVar15);
          __cxa_end_catch();
          *param_1 = 0;
          *(undefined2 *)((long)param_1 + 0x3a) = 8;
          param_1[0x33] = puVar15;
          FUN_00181454(puVar15);
          goto LAB_0018b330;
        }
        auVar19 = __cxa_rethrow();
        ppuVar13 = &local_80;
        do {
          uVar5 = *(undefined1 *)(ppuVar13 + -3);
          param_1[0x2a] = ppuVar13 + -3;
          FUN_001a92b0(ppuVar13 + -2,uVar5);
          ppuVar13 = (ulong **)param_1[0x2a];
        } while (ppuVar13 != unaff_x21);
        do {
          uVar5 = *(undefined1 *)(lVar8 + -0x18);
          param_1[0x29] = lVar8 + -0x18;
          FUN_001a92b0(lVar8 + -0x10,uVar5);
          lVar8 = param_1[0x29];
          ppuVar13 = unaff_x21;
        } while (lVar8 != unaff_x26);
        do {
          uVar5 = *(undefined1 *)(ppuVar13 + -3);
          param_1[0x28] = ppuVar13 + -3;
          FUN_001a92b0(ppuVar13 + -2,uVar5);
          ppuVar12 = unaff_x22;
          ppuVar13 = (ulong **)param_1[0x28];
        } while ((ulong **)param_1[0x28] != unaff_x22);
        do {
          uVar5 = *(undefined1 *)(ppuVar12 + -3);
          param_1[0x27] = ppuVar12 + -3;
          FUN_001a92b0(ppuVar12 + -2,uVar5);
          ppuVar13 = (ulong **)local_110;
          ppuVar12 = (ulong **)param_1[0x27];
        } while ((ulong **)param_1[0x27] != (ulong **)local_110);
        do {
          uVar5 = *(undefined1 *)(ppuVar13 + -3);
          param_1[0x26] = ppuVar13 + -3;
          FUN_001a92b0(ppuVar13 + -2,uVar5);
          ppuVar13 = (ulong **)param_1[0x26];
        } while ((ulong **)param_1[0x26] != unaff_x25);
        lVar8 = auVar19._0_8_;
      } while (auVar19._8_8_ != 2);
      plVar18 = (long *)__cxa_begin_catch();
      param_1[0x2e] = plVar18;
      uVar16 = (**(code **)(*plVar18 + 0x10))();
      FUN_001965f0(PTR_DAT_005df7b0,0x2f1,"heartbeat_loop",
                   "/usr/src/debug/frank/0.1-r0/git/main.cpp","[heartbeat] publish failed: %s",
                   uVar16);
      __cxa_end_catch();
    }
    lVar8 = param_1[8];
    *(undefined2 *)((long)param_1 + 0x3a) = 6;
    lVar14 = param_1[0x32];
    plVar18 = *(long **)(lVar8 + 0x18);
    param_1[0x31] = lVar14;
    param_1[0x32] = 0;
    *(long **)(lVar14 + 8) = plVar18;
    *(long *)(lVar14 + 0x10) = lVar8 + 0x10;
    *(long *)(*plVar18 + 0x60) = lVar14;
    *(undefined8 *)(lVar8 + 0x18) = 0;
  }
  else {
    if (9 < uVar4) {
LAB_0018b2ec:
                    /* WARNING: Does not return */
      pcVar6 = (code *)SoftwareBreakpoint(1000,0x18b2fc);
      (*pcVar6)();
    }
    uVar7 = 1L << ((ulong)uVar4 & 0x3f);
    if ((uVar7 & 0x22a) == 0) {
      if (((uint)uVar7 >> 7 & 1) == 0) goto LAB_0018b2ec;
      FUN_00198400(param_1 + 0x31);
      FUN_00198400(param_1 + 0x32);
      FUN_001b4160(param_1 + 0xb);
    }
LAB_0018b320:
    std::__exception_ptr::exception_ptr::~exception_ptr((exception_ptr *)(param_1 + 5));
    if (*(char *)(param_1 + 7) != '\0') {
      lVar8 = (long)local_8 - *(long *)PTR___stack_chk_guard_005df758;
      if (lVar8 == 0) {
        FUN_00198720(param_1,0x1a0,0);
        return;
      }
      goto LAB_0018baa4;
    }
  }
LAB_0018b330:
  lVar8 = (long)local_8 - *(long *)PTR___stack_chk_guard_005df758;
  if (lVar8 == 0) {
    return;
  }
LAB_0018baa4:
                    /* WARNING: Subroutine does not return */
  __stack_chk_fail(PTR___stack_chk_guard_005df758,lVar8,0);
}


