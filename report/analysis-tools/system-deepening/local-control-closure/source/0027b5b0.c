/* Ghidra static pseudocode; not original source. */

void FUN_0027b5b0(long param_1,undefined1 *param_2,undefined4 param_3)

{
  string *psVar1;
  char *pcVar2;
  undefined1 *__src;
  undefined4 uVar3;
  undefined1 uVar4;
  int iVar5;
  undefined *puVar6;
  undefined *puVar7;
  bool bVar8;
  bool bVar9;
  char cVar10;
  uint uVar11;
  uint uVar12;
  int iVar13;
  undefined8 uVar14;
  long lVar15;
  byte bVar16;
  char *pcVar17;
  code *pcVar18;
  long *plVar19;
  long *plVar20;
  undefined8 local_b8;
  undefined2 *puStack_b0;
  undefined8 local_a8;
  long **local_a0;
  undefined1 local_98;
  undefined4 local_94;
  undefined1 *local_90 [2];
  undefined1 auStack_80 [16];
  long **local_70;
  undefined8 local_68;
  long *local_60;
  long lStack_58;
  long local_50 [2];
  long **local_40;
  undefined8 local_38;
  undefined1 *local_30;
  long lStack_28;
  undefined1 auStack_20 [16];
  undefined2 local_10;
  undefined1 local_e;
  undefined1 local_d;
  long local_8;
  
  puVar6 = PTR_DAT_005df708;
                    /* catch() { ... } // from try @ 0027a9d4 with catch @ 0027b5bc */
                    /* catch() { ... } // from try @ 0027a99c with catch @ 0027b5d8 */
  local_8 = *(long *)PTR___stack_chk_guard_005df758;
  if (*(long *)(PTR_DAT_005df708 + 0x88) == 0) goto LAB_0027c1b4;
                    /* catch() { ... } // from try @ 0027a9e0 with catch @ 0027b5fc */
  uVar11 = (**(code **)(PTR_DAT_005df708 + 0x90))(PTR_DAT_005df708 + 0x78);
  puVar7 = PTR_DAT_005df708;
                    /* catch() { ... } // from try @ 0027a8e0 with catch @ 0027b614 */
                    /* catch() { ... } // from try @ 0027ab40 with catch @ 0027b630 */
  if (((uVar11 < *(uint *)(puVar6 + 0xa0)) || (uVar11 < *(uint *)(puVar6 + 0xac))) ||
     ((int)((*(uint *)(puVar6 + 0xa0) + *(int *)(puVar6 + 0xa4)) - uVar11) < 1)) {
    if (*(long *)(PTR_DAT_005df708 + 0xe8) == 0) goto LAB_0027c1b4;
    uVar11 = (**(code **)(PTR_DAT_005df708 + 0xf0))(PTR_DAT_005df708 + 0xd8);
    if (((*(uint *)(puVar7 + 0x100) <= uVar11) && (*(uint *)(puVar7 + 0x10c) <= uVar11)) &&
       (0 < (int)((*(uint *)(puVar7 + 0x100) + *(int *)(puVar7 + 0x104)) - uVar11)))
    goto LAB_0027b634;
    iVar13 = FUN_0020dc60(PTR_DAT_005df708 + 0x138);
                    /* catch() { ... } // from try @ 0027b918 with catch @ 0027b9f8 */
    bVar8 = iVar13 != 0;
  }
  else {
LAB_0027b634:
    bVar8 = true;
  }
  puVar6 = PTR_DAT_005df708;
  if (*(long *)(PTR_DAT_005df708 + 0x1c0) == 0) goto LAB_0027c1b4;
  uVar11 = (**(code **)(PTR_DAT_005df708 + 0x1c8))(PTR_DAT_005df708 + 0x1b0);
  puVar7 = PTR_DAT_005df708;
                    /* catch() { ... } // from try @ 0027aac0 with catch @ 0027b660 */
  if (((uVar11 < *(uint *)(puVar6 + 0x1d8)) || (uVar11 < *(uint *)(puVar6 + 0x1e4))) ||
     ((int)((*(uint *)(puVar6 + 0x1d8) + *(int *)(puVar6 + 0x1dc)) - uVar11) < 1)) {
    if (*(long *)(PTR_DAT_005df708 + 0x220) == 0) goto LAB_0027c1b4;
    uVar11 = (**(code **)(PTR_DAT_005df708 + 0x228))(PTR_DAT_005df708 + 0x210);
    if (((*(uint *)(puVar7 + 0x238) <= uVar11) && (*(uint *)(puVar7 + 0x244) <= uVar11)) &&
       (0 < (int)((*(uint *)(puVar7 + 0x238) + *(int *)(puVar7 + 0x23c)) - uVar11)))
    goto LAB_0027b67c;
    iVar13 = FUN_0020dc60(PTR_DAT_005df708 + 0x270);
    bVar9 = iVar13 != 0;
    bVar16 = bVar8 | bVar9;
  }
  else {
LAB_0027b67c:
    bVar16 = 1;
    bVar9 = true;
  }
  puVar6 = PTR_DAT_005df708;
                    /* catch() { ... } // from try @ 0027aab8 with catch @ 0027b688 */
  uVar3 = *(undefined4 *)(param_1 + 0x3bfc);
                    /* catch() { ... } // from try @ 0027aa68 with catch @ 0027b694 */
  uVar4 = PTR_DAT_005df708[0x2d3];
  PTR_DAT_005df708[0x2d0] = bVar8;
  puVar6[0x2d1] = bVar9;
  puVar6[0x2d2] = bVar16;
  uVar14 = FUN_0023c730(uVar4,bVar8,bVar9,uVar3);
  iVar13 = (int)uVar14;
  cVar10 = FUN_0023c7b0(uVar14,puVar6);
  if (cVar10 != '\0') {
    if (local_8 - *(long *)PTR___stack_chk_guard_005df758 == 0) {
      FUN_001965f0(PTR_DAT_005df810,0x26d,"handleVibrationAlarm",
                   "/usr/src/debug/frank/0.1-r0/git/firmware/src/subsystem/UsbSensor.cpp",
                   "[TTC] dismiss blocked for posture pattern");
      return;
    }
                    /* WARNING: Subroutine does not return */
    __stack_chk_fail(PTR___stack_chk_guard_005df758,
                     local_8 - *(long *)PTR___stack_chk_guard_005df758,0);
  }
  if (iVar13 == 1) {
    local_60 = local_50;
    local_70 = (long **)0x0;
    local_68 = (long *)0x0;
    *(undefined4 *)(PTR_DAT_005dff30 + 4) = param_3;
    std::__cxx11::string::_M_construct((string *)&local_60,0x40,'\0');
    FUN_0019dd00(puVar6,&local_70);
LAB_0027bd70:
    FUN_001998f0(&local_60);
  }
  else {
                    /* catch() { ... } // from try @ 0027aa58 with catch @ 0027b6cc */
    if (iVar13 == 2) {
                    /* catch() { ... } // from try @ 0027be14 with catch @ 0027bdd0
                       catch() { ... } // from try @ 0027c548 with catch @ 0027bdd0
                       catch() { ... } // from try @ 0027c870 with catch @ 0027bdd0 */
      local_70 = (long **)0x0;
      local_68 = (long *)0x0;
      *(undefined4 *)(PTR_DAT_005dff30 + 8) = param_3;
      local_60 = local_50;
      std::__cxx11::string::_M_construct((string *)&local_60,0x40,'\0');
      local_30 = auStack_20;
      local_40 = (long **)0x0;
      local_38 = 0;
      std::__cxx11::string::_M_construct((string *)&local_30,0x40,'\0');
      puVar6 = PTR_DAT_005df708;
                    /* try { // try from 0027be14 to 0037bebf has its CatchHandler @ 0027bdd0 */
      psVar1 = (string *)(PTR_DAT_005df708 + 0x10);
      *(long ***)PTR_DAT_005df708 = local_70;
      puVar6[8] = (undefined1)local_68;
      *(undefined4 *)(puVar6 + 0xc) = local_68._4_4_;
      std::__cxx11::string::_M_assign(psVar1,(string *)&local_60);
      puVar6 = PTR_DAT_005df708;
      psVar1 = (string *)(PTR_DAT_005df708 + 0x40);
      *(long ***)(PTR_DAT_005df708 + 0x30) = local_40;
      puVar6[0x38] = (undefined1)local_38;
      *(undefined4 *)(puVar6 + 0x3c) = local_38._4_4_;
      std::__cxx11::string::_M_assign(psVar1,(string *)&local_30);
      local_a0 = local_70;
      local_98 = (undefined1)local_68;
      local_94 = local_68._4_4_;
      local_90[0] = auStack_80;
      std::__cxx11::string::_M_construct<char*>(local_90,local_60,(long)local_60 + lStack_58,0);
      FUN_0019d830(PTR_DAT_005df708,&local_a0);
      FUN_001998f0(local_90);
      local_a0 = local_40;
      local_98 = (undefined1)local_38;
      local_94 = local_38._4_4_;
      local_90[0] = auStack_80;
                    /* try { // try from 0027bed4 to 0037bed7 has its CatchHandler @ 0027c89c */
      std::__cxx11::string::_M_construct<char*>(local_90,local_30,local_30 + lStack_28,0);
      FUN_0019dd00(PTR_DAT_005df708,&local_a0);
      FUN_001998f0(local_90);
      FUN_001998f0((string *)&local_30);
      if (local_60 != local_50) {
        operator_delete(local_60,local_50[0] + 1);
      }
    }
    else if (iVar13 == 0) {
      local_60 = local_50;
      local_70 = (long **)0x0;
      local_68 = (long *)0x0;
      *(undefined4 *)PTR_DAT_005dff30 = param_3;
      std::__cxx11::string::_M_construct((string *)&local_60,0x40,'\0');
      FUN_0019d830(puVar6,&local_70);
      goto LAB_0027bd70;
    }
  }
  puVar6 = PTR_DAT_005df708;
  if (*(long *)(PTR_DAT_005df708 + 0x88) == 0) goto LAB_0027c1b4;
                    /* catch() { ... } // from try @ 0027aa48 with catch @ 0027b6e4 */
  uVar12 = (**(code **)(PTR_DAT_005df708 + 0x90))(PTR_DAT_005df708 + 0x78);
  uVar11 = *(uint *)(puVar6 + 0xa0);
                    /* catch() { ... } // from try @ 0027aa38 with catch @ 0027b6f0 */
                    /* catch() { ... } // from try @ 0027ace4 with catch @ 0027b704 */
                    /* catch() { ... } // from try @ 0027af08 with catch @ 0027b70c */
  if (((uVar12 < uVar11) || (uVar12 < *(uint *)(puVar6 + 0xac))) ||
     (iVar5 = (uVar11 + *(int *)(puVar6 + 0xa4)) - uVar12, iVar5 < 1)) {
    if (PTR_DAT_005df708[0xd0] == '\0') {
      plVar19 = *(long **)(PTR_DAT_005df708 + 0x98);
                    /* try { // try from 0027ba18 to 0037ba1b has its CatchHandler @ 0027b830 */
      uVar4 = PTR_DAT_005df708[0xa8];
                    /* catch() { ... } // from try @ 0027b940 with catch @ 0027ba1c */
      pcVar18 = *(code **)(*plVar19 + 0x10);
      FUN_00198030(&local_70,PTR_DAT_005df708 + 0xb0);
                    /* catch() { ... } // from try @ 0027b968 with catch @ 0027ba30 */
      (*pcVar18)(plVar19,uVar4,&local_70,0);
                    /* catch() { ... } // from try @ 0027b998 with catch @ 0027ba48 */
      FUN_001998f0(&local_70);
      PTR_DAT_005df708[0xd0] = 1;
    }
  }
  else {
                    /* catch() { ... } // from try @ 0027aedc with catch @ 0027b718 */
    if (*(uint *)(puVar6 + 0xd4) != uVar11) {
      plVar19 = *(long **)(puVar6 + 0x98);
      local_70 = &local_60;
      uVar4 = puVar6[0xa8];
      pcVar18 = *(code **)(*plVar19 + 0x10);
      std::__cxx11::string::_M_construct<char*>
                (&local_70,*(long *)(puVar6 + 0xb0),
                 *(long *)(puVar6 + 0xb0) + *(long *)(puVar6 + 0xb8),0);
      (*pcVar18)(plVar19,uVar4,&local_70,iVar5);
      FUN_001998f0(&local_70);
      *(undefined4 *)(PTR_DAT_005df708 + 0xd4) = *(undefined4 *)(PTR_DAT_005df708 + 0xa0);
    }
  }
  puVar6 = PTR_DAT_005df708;
  if (*(long *)(PTR_DAT_005df708 + 0x1c0) == 0) goto LAB_0027c1b4;
                    /* catch() { ... } // from try @ 0027aeb8 with catch @ 0027b730 */
  uVar12 = (**(code **)(PTR_DAT_005df708 + 0x1c8))(PTR_DAT_005df708 + 0x1b0);
                    /* catch() { ... } // from try @ 0027ae90 with catch @ 0027b73c */
  uVar11 = *(uint *)(puVar6 + 0x1d8);
                    /* catch() { ... } // from try @ 0027ae80 with catch @ 0027b754 */
                    /* catch() { ... } // from try @ 0027adb8 with catch @ 0027b760 */
  if (((uVar12 < uVar11) || (uVar12 < *(uint *)(puVar6 + 0x1e4))) ||
     (iVar5 = (uVar11 + *(int *)(puVar6 + 0x1dc)) - uVar12, iVar5 < 1)) {
    if (PTR_DAT_005df708[0x208] == '\0') {
      plVar19 = *(long **)(PTR_DAT_005df708 + 0x1d0);
      uVar4 = PTR_DAT_005df708[0x1e0];
      pcVar18 = *(code **)(*plVar19 + 0x10);
      FUN_00198030(&local_70,PTR_DAT_005df708 + 0x1e8);
      (*pcVar18)(plVar19,uVar4,&local_70,0);
      FUN_001998f0(&local_70);
      PTR_DAT_005df708[0x208] = 1;
    }
  }
  else if (*(uint *)(puVar6 + 0x20c) != uVar11) {
    plVar20 = *(long **)(puVar6 + 0x1d0);
    local_70 = &local_60;
    __src = *(undefined1 **)(puVar6 + 0x1e8);
    plVar19 = *(long **)(puVar6 + 0x1f0);
    uVar4 = puVar6[0x1e0];
    pcVar18 = *(code **)(*plVar20 + 0x10);
    if (__src + (long)plVar19 != (undefined1 *)0x0 && __src == (undefined1 *)0x0) {
                    /* WARNING: Subroutine does not return */
      std::__throw_logic_error("basic_string::_M_construct null not valid");
    }
    if (plVar19 < (long *)0x10) {
      if (plVar19 == (long *)0x1) {
        local_60 = (long *)CONCAT71(local_60._1_7_,*__src);
      }
      else if (plVar19 != (long *)0x0) goto LAB_0027c18c;
    }
    else {
      if ((long)plVar19 < 0) {
                    /* WARNING: Subroutine does not return */
        std::__throw_length_error("basic_string::_M_create");
      }
      if ((long)((long)plVar19 + 1U) < 0) {
                    /* WARNING: Subroutine does not return */
        std::__throw_bad_alloc();
      }
      local_70 = operator_new((long)plVar19 + 1U);
      local_60 = plVar19;
LAB_0027c18c:
      memcpy(local_70,__src,(size_t)plVar19);
    }
    *(undefined1 *)((long)local_70 + (long)plVar19) = 0;
    local_68 = plVar19;
    (*pcVar18)(plVar20,uVar4,&local_70,iVar5);
    FUN_001998f0(&local_70);
    *(undefined4 *)(PTR_DAT_005df708 + 0x20c) = *(undefined4 *)(PTR_DAT_005df708 + 0x1d8);
  }
  puVar6 = PTR_DAT_005df708;
                    /* catch() { ... } // from try @ 0027ad94 with catch @ 0027b778 */
  if (*(long *)(PTR_DAT_005df708 + 0xe8) != 0) {
                    /* catch() { ... } // from try @ 0027ab48 with catch @ 0027b784 */
    uVar12 = (**(code **)(PTR_DAT_005df708 + 0xf0))(PTR_DAT_005df708 + 0xd8);
    uVar11 = *(uint *)(puVar6 + 0x100);
                    /* catch() { ... } // from try @ 0027ad5c with catch @ 0027b7a0 */
                    /* catch() { ... } // from try @ 0027ad30 with catch @ 0027b7ac */
    if (((uVar12 < uVar11) || (uVar12 < *(uint *)(puVar6 + 0x10c))) ||
       (iVar5 = (uVar11 + *(int *)(puVar6 + 0x104)) - uVar12, iVar5 < 1)) {
      if (PTR_DAT_005df708[0x130] == '\0') {
        plVar19 = *(long **)(PTR_DAT_005df708 + 0xf8);
        uVar4 = PTR_DAT_005df708[0x108];
        pcVar18 = *(code **)(*plVar19 + 0x10);
        FUN_00198030(&local_70,PTR_DAT_005df708 + 0x110);
        (*pcVar18)(plVar19,uVar4,&local_70,0);
        FUN_001998f0(&local_70);
        PTR_DAT_005df708[0x130] = 1;
      }
    }
    else if (*(uint *)(puVar6 + 0x134) != uVar11) {
      plVar19 = *(long **)(puVar6 + 0xf8);
      local_70 = &local_60;
      uVar4 = puVar6[0x108];
      pcVar18 = *(code **)(*plVar19 + 0x10);
      std::__cxx11::string::_M_construct<char*>
                (&local_70,*(long *)(puVar6 + 0x110),
                 *(long *)(puVar6 + 0x110) + *(long *)(puVar6 + 0x118),0);
      (*pcVar18)(plVar19,uVar4,&local_70,iVar5);
      FUN_001998f0(&local_70);
      *(undefined4 *)(PTR_DAT_005df708 + 0x134) = *(undefined4 *)(PTR_DAT_005df708 + 0x100);
    }
                    /* catch() { ... } // from try @ 0027ad0c with catch @ 0027b7c4 */
    puVar6 = PTR_DAT_005df708;
    if (*(long *)(PTR_DAT_005df708 + 0x220) != 0) {
                    /* catch() { ... } // from try @ 0027b138 with catch @ 0027b7d0 */
      uVar12 = (**(code **)(PTR_DAT_005df708 + 0x228))(PTR_DAT_005df708 + 0x210);
      uVar11 = *(uint *)(puVar6 + 0x238);
                    /* catch() { ... } // from try @ 0027ab68 with catch @ 0027b7ec */
                    /* catch() { ... } // from try @ 0027acd4 with catch @ 0027b804 */
      if (((uVar12 < uVar11) || (uVar12 < *(uint *)(puVar6 + 0x244))) ||
         (iVar5 = (uVar11 + *(int *)(puVar6 + 0x23c)) - uVar12, iVar5 < 1)) {
        if (PTR_DAT_005df708[0x268] == '\0') {
          plVar19 = *(long **)(PTR_DAT_005df708 + 0x230);
          uVar4 = PTR_DAT_005df708[0x240];
          pcVar18 = *(code **)(*plVar19 + 0x10);
          FUN_00198030(&local_70,PTR_DAT_005df708 + 0x248);
          (*pcVar18)(plVar19,uVar4,&local_70,0);
          FUN_001998f0(&local_70);
          PTR_DAT_005df708[0x268] = 1;
        }
      }
      else {
                    /* catch() { ... } // from try @ 0027aa30 with catch @ 0027b810 */
        if (*(uint *)(puVar6 + 0x26c) != uVar11) {
          plVar19 = *(long **)(puVar6 + 0x230);
          uVar4 = puVar6[0x240];
          pcVar18 = *(code **)(*plVar19 + 0x10);
          FUN_00198030(&local_70,puVar6 + 0x248);
          (*pcVar18)(plVar19,uVar4,&local_70,iVar5);
          FUN_001998f0(&local_70);
          *(undefined4 *)(PTR_DAT_005df708 + 0x26c) = *(undefined4 *)(PTR_DAT_005df708 + 0x238);
        }
      }
      puVar6 = PTR_DAT_005df708;
      if (*(long *)(PTR_DAT_005df708 + 0x148) != 0) {
        uVar12 = (**(code **)(PTR_DAT_005df708 + 0x150))(PTR_DAT_005df708 + 0x138);
        uVar11 = *(uint *)(puVar6 + 0x160);
                    /* catch() { ... } // from try @ 0027b84c with catch @ 0027b830
                       catch() { ... } // from try @ 0027ba18 with catch @ 0027b830 */
                    /* try { // try from 0027b84c to 0037b8e7 has its CatchHandler @ 0027b830 */
        if (((uVar12 < uVar11) || (uVar12 < *(uint *)(puVar6 + 0x16c))) ||
           (iVar5 = (uVar11 + *(int *)(puVar6 + 0x164)) - uVar12, iVar5 < 1)) {
          if (PTR_DAT_005df708[400] == '\0') {
            plVar19 = *(long **)(PTR_DAT_005df708 + 0x158);
            uVar4 = PTR_DAT_005df708[0x168];
            pcVar18 = *(code **)(*plVar19 + 0x10);
            FUN_00198030(&local_70,PTR_DAT_005df708 + 0x170);
            (*pcVar18)(plVar19,uVar4,&local_70,0);
            FUN_001998f0(&local_70);
            PTR_DAT_005df708[400] = 1;
          }
        }
        else if (*(uint *)(puVar6 + 0x194) != uVar11) {
          plVar19 = *(long **)(puVar6 + 0x158);
          local_70 = &local_60;
          uVar4 = puVar6[0x168];
          pcVar18 = *(code **)(*plVar19 + 0x10);
          std::__cxx11::string::_M_construct<char*>
                    (&local_70,*(long *)(puVar6 + 0x170),
                     *(long *)(puVar6 + 0x170) + *(long *)(puVar6 + 0x178),0);
          (*pcVar18)(plVar19,uVar4,&local_70,iVar5);
          FUN_001998f0(&local_70);
          *(undefined4 *)(PTR_DAT_005df708 + 0x194) = *(undefined4 *)(PTR_DAT_005df708 + 0x160);
        }
        puVar6 = PTR_DAT_005df708;
        if (*(long *)(PTR_DAT_005df708 + 0x280) != 0) {
          uVar12 = (**(code **)(PTR_DAT_005df708 + 0x288))(PTR_DAT_005df708 + 0x270);
          uVar11 = *(uint *)(puVar6 + 0x298);
          if (((uVar12 < uVar11) || (uVar12 < *(uint *)(puVar6 + 0x2a4))) ||
             (iVar5 = (uVar11 + *(int *)(puVar6 + 0x29c)) - uVar12, iVar5 < 1)) {
            if (PTR_DAT_005df708[0x2c8] == '\0') {
              plVar19 = *(long **)(PTR_DAT_005df708 + 0x290);
              uVar4 = PTR_DAT_005df708[0x2a0];
              pcVar18 = *(code **)(*plVar19 + 0x10);
              FUN_00198030(&local_70,PTR_DAT_005df708 + 0x2a8);
              (*pcVar18)(plVar19,uVar4,&local_70,0);
              FUN_001998f0(&local_70);
              PTR_DAT_005df708[0x2c8] = 1;
            }
          }
          else if (*(uint *)(puVar6 + 0x2cc) != uVar11) {
            plVar19 = *(long **)(puVar6 + 0x290);
            local_70 = &local_60;
            uVar4 = puVar6[0x2a0];
            pcVar18 = *(code **)(*plVar19 + 0x10);
            std::__cxx11::string::_M_construct<char*>
                      (&local_70,*(long *)(puVar6 + 0x2a8),
                       *(long *)(puVar6 + 0x2a8) + *(long *)(puVar6 + 0x2b0),0);
            (*pcVar18)(plVar19,uVar4,&local_70,iVar5);
            FUN_001998f0(&local_70);
            *(undefined4 *)(PTR_DAT_005df708 + 0x2cc) = *(undefined4 *)(PTR_DAT_005df708 + 0x298);
          }
          if (iVar13 == 0xff) {
            lVar15 = local_8 - *(long *)PTR___stack_chk_guard_005df758;
            if (lVar15 == 0) {
              FUN_001965f0(PTR_DAT_005df7b0,0x28e,"handleVibrationAlarm",
                           "/usr/src/debug/frank/0.1-r0/git/firmware/src/subsystem/UsbSensor.cpp",
                           "[TTC] unknown or inactive alarm for gesture side %d",*param_2);
              return;
            }
          }
          else {
            local_d = param_2[3];
            puStack_b0 = &local_10;
            local_b8 = 0x40;
            local_a8 = 4;
            local_10 = 0x1900;
            local_e = 7;
            FUN_002336a0(param_1,&local_b8);
            FUN_00204b50(PTR_DAT_005dff30,PTR_s___l__0__r__0__s__0__005dfdd0,0x32);
            if (iVar13 == 2) {
              pcVar17 = "solo";
            }
            else {
                    /* try { // try from 0027b918 to 0037b91b has its CatchHandler @ 0027b9f8 */
              pcVar17 = "left";
              if (iVar13 != 0) {
                pcVar17 = "right";
              }
            }
                    /* try { // try from 0027b940 to 0037b943 has its CatchHandler @ 0027ba1c */
            pcVar2 = "left";
            if (*(int *)(param_1 + 0x3bfc) != 0) {
              pcVar2 = "right";
            }
            lVar15 = local_8 - *(long *)PTR___stack_chk_guard_005df758;
            if (lVar15 == 0) {
                    /* try { // try from 0027b968 to 0037b96b has its CatchHandler @ 0027ba30 */
                    /* try { // try from 0027b998 to 0037b99b has its CatchHandler @ 0027ba48 */
              FUN_001965f0(PTR_DAT_005df810,0x28a,"handleVibrationAlarm",
                           "/usr/src/debug/frank/0.1-r0/git/firmware/src/subsystem/UsbSensor.cpp",
                           "[TTC] %s alarm dismissed from %s side",pcVar17,pcVar2);
              return;
            }
          }
                    /* WARNING: Subroutine does not return */
          __stack_chk_fail(PTR___stack_chk_guard_005df758,lVar15,0);
        }
      }
    }
  }
LAB_0027c1b4:
                    /* WARNING: Subroutine does not return */
  std::__throw_bad_function_call();
}


