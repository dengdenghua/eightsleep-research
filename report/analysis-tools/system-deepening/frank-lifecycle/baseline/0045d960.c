/* Ghidra static pseudocode; not original source. Read-only project; no target execution. */

/* WARNING: Removing unreachable block (ram,0x0045dcb0) */

bool FUN_0045d960(undefined8 param_1)

{
  long *plVar1;
  long lVar2;
  long lVar3;
  long *plVar4;
  size_t sVar5;
  long *__src;
  char cVar6;
  void *pvVar7;
  ulong uVar8;
  undefined1 *puVar9;
  long lVar10;
  long lVar11;
  bool bVar12;
  size_t sVar13;
  void *local_a0;
  long local_98;
  long local_90;
  ulong local_88;
  void *local_80;
  undefined1 auStack_78 [16];
  ulong local_68;
  undefined1 *local_60;
  undefined8 uStack_58;
  undefined1 local_50;
  undefined6 uStack_4f;
  char cStack_49;
  char acStack_48 [7];
  undefined1 local_41;
  long *local_40;
  ulong local_38;
  long local_30;
  ulong uStack_28;
  void *local_20;
  void *local_18;
  long local_10;
  long local_8;
  
  local_8 = *(long *)PTR___stack_chk_guard_005df758;
  local_a0 = (void *)0x0;
  local_98 = 0;
  local_90 = 0;
  pvVar7 = operator_new(0x200);
  local_a0 = pvVar7;
  local_90 = (long)pvVar7 + 0x200;
  memset(pvVar7,0,0x200);
  local_88 = 0x200;
  local_98 = (long)pvVar7 + 0x200;
  local_80 = pvVar7;
  FUN_001d70a0(auStack_78,pvVar7,0x200);
  cVar6 = FUN_0045de90(param_1,&local_88);
  bVar12 = false;
  if (cVar6 == '\0') goto joined_r0x0045dc2c;
  if (local_68 == 0xffffffffffffffff) {
    local_68 = local_88;
    if ((long)local_88 < 0) goto LAB_0045dd5c;
  }
  else if (((long)local_68 < 0) || ((long)local_88 < (long)local_68)) goto LAB_0045dd5c;
  bVar12 = local_68 == 0 || local_80 != (void *)0x0;
  if (local_68 != 0 && local_80 == (void *)0x0) {
LAB_0045dd5c:
                    /* WARNING: Subroutine does not return */
    std::terminate();
  }
  uVar8 = local_98 - (long)local_a0;
  if (uVar8 < local_68) {
    FUN_001d96c0(&local_a0,local_68 - uVar8);
    uVar8 = local_98 - (long)local_a0;
  }
  else if ((local_68 < uVar8) && (local_98 != (long)local_a0 + local_68)) {
    uVar8 = local_68;
    local_98 = (long)local_a0 + local_68;
  }
  local_41 = 0;
  uStack_4f = SUB76(s_raw_frz_optical_004c9588._0_7_,1);
  cStack_49 = s_raw_frz_optical_004c9588[7];
  acStack_48[0] = s_raw_frz_optical_004c9588[8];
  acStack_48[1] = s_raw_frz_optical_004c9588[9];
  acStack_48[2] = s_raw_frz_optical_004c9588[10];
  acStack_48[3] = s_raw_frz_optical_004c9588[0xb];
  acStack_48[4] = s_raw_frz_optical_004c9588[0xc];
  acStack_48[5] = s_raw_frz_optical_004c9588[0xd];
  acStack_48[6] = s_raw_frz_optical_004c9588[0xe];
  uStack_58 = 0;
  local_30 = CONCAT17(s_raw_frz_optical_004c9588[7],s_raw_frz_optical_004c9588._0_7_);
  uStack_28 = (ulong)(uint7)s_raw_frz_optical_004c9588._8_7_;
  local_50 = 0;
  local_38 = 0xf;
  local_20 = (void *)0x0;
  local_18 = (void *)0x0;
  local_10 = 0;
  local_60 = &local_50;
  local_40 = &local_30;
  if (uVar8 == 0) {
    local_20 = (void *)0x0;
    local_10 = 0;
    local_18 = (void *)0x0;
  }
  else {
    if ((long)uVar8 < 0) {
                    /* WARNING: Subroutine does not return */
      std::__throw_bad_alloc();
    }
    local_20 = operator_new(uVar8);
    puVar9 = local_60;
    local_10 = (long)local_20 + uVar8;
    sVar5 = local_98 - (long)local_a0;
    local_18 = local_20;
    if (sVar5 != 0) {
      local_18 = memmove(local_20,local_a0,sVar5);
      local_18 = (void *)((long)local_18 + sVar5);
    }
    if (puVar9 != &local_50) {
      operator_delete(puVar9,CONCAT17(cStack_49,CONCAT61(uStack_4f,local_50)) + 1);
    }
  }
  uVar8 = local_38;
  __src = local_40;
  lVar3 = DAT_005e3b98;
  plVar1 = (long *)(DAT_005e3b98 + 0x100);
  lVar10 = *plVar1;
  lVar2 = lVar10 + 1;
  lVar11 = *(long *)(DAT_005e3b98 + 0x140);
  if (lVar2 == *(long *)(DAT_005e3b98 + 0xc0)) {
    lVar2 = 0;
  }
  if ((lVar11 == lVar2) &&
     (plVar4 = (long *)(DAT_005e3b98 + 0x180), *(long *)(DAT_005e3b98 + 0x140) = *plVar4,
     lVar11 == *plVar4)) {
    bVar12 = false;
  }
  else {
    lVar11 = *(long *)(lVar3 + 200);
    lVar3 = lVar10 * 0x38 + 0x70;
    lVar10 = lVar11 + lVar3;
    puVar9 = (undefined1 *)(lVar10 + 0x10);
    *(undefined1 **)(lVar11 + lVar3) = puVar9;
    if ((undefined1 *)((long)local_40 + local_38) != (undefined1 *)0x0 && local_40 == (long *)0x0) {
                    /* WARNING: Subroutine does not return */
      std::__throw_logic_error("basic_string::_M_construct null not valid");
    }
    if (local_38 < 0x10) {
      if (local_38 == 1) {
        *(char *)(lVar10 + 0x10) = (char)*local_40;
        goto LAB_0045db98;
      }
      if (local_38 != 0) goto LAB_0045dd48;
      *(undefined8 *)(lVar10 + 8) = 0;
      *puVar9 = 0;
      *(undefined8 *)(lVar10 + 0x20) = 0;
      *(undefined8 *)(lVar10 + 0x28) = 0;
      *(undefined8 *)(lVar10 + 0x30) = 0;
      uVar8 = (long)local_18 - (long)local_20;
      if (uVar8 == 0) goto LAB_0045dc74;
LAB_0045dbb8:
      if ((long)uVar8 < 0) {
                    /* WARNING: Subroutine does not return */
        std::__throw_bad_alloc();
      }
      pvVar7 = operator_new(uVar8);
      *(void **)(lVar10 + 0x20) = pvVar7;
      *(void **)(lVar10 + 0x28) = pvVar7;
      *(ulong *)(lVar10 + 0x30) = (long)pvVar7 + uVar8;
      sVar5 = (long)local_18 - (long)local_20;
    }
    else {
      if ((long)local_38 < 0) {
                    /* WARNING: Subroutine does not return */
        std::__throw_length_error("basic_string::_M_create");
      }
      if ((long)(local_38 + 1) < 0) {
                    /* WARNING: Subroutine does not return */
        std::__throw_bad_alloc();
      }
      puVar9 = operator_new(local_38 + 1);
      *(undefined1 **)(lVar11 + lVar3) = puVar9;
      *(ulong *)(lVar10 + 0x10) = uVar8;
LAB_0045dd48:
      memcpy(puVar9,__src,uVar8);
      puVar9 = *(undefined1 **)(lVar11 + lVar3);
LAB_0045db98:
      *(ulong *)(lVar10 + 8) = uVar8;
      puVar9[uVar8] = 0;
      *(undefined8 *)(lVar10 + 0x20) = 0;
      *(undefined8 *)(lVar10 + 0x28) = 0;
      *(undefined8 *)(lVar10 + 0x30) = 0;
      uVar8 = (long)local_18 - (long)local_20;
      if (uVar8 != 0) goto LAB_0045dbb8;
LAB_0045dc74:
      pvVar7 = (void *)0x0;
      *(undefined8 *)(lVar10 + 0x20) = 0;
      *(undefined8 *)(lVar10 + 0x28) = 0;
      *(undefined8 *)(lVar10 + 0x30) = 0;
      sVar5 = (long)local_18 - (long)local_20;
    }
    sVar13 = 0;
    if (sVar5 != 0) {
      pvVar7 = memmove(pvVar7,local_20,sVar5);
      sVar13 = sVar5;
    }
    *(size_t *)(lVar10 + 0x28) = (long)pvVar7 + sVar13;
    *plVar1 = lVar2;
  }
  if (local_20 != (void *)0x0) {
    operator_delete(local_20,local_10 - (long)local_20);
  }
  if (local_40 != &local_30) {
    operator_delete(local_40,local_30 + 1);
  }
joined_r0x0045dc2c:
  if (local_a0 != (void *)0x0) {
    operator_delete(local_a0,local_90 - (long)local_a0);
  }
  if (local_8 - *(long *)PTR___stack_chk_guard_005df758 == 0) {
    return bVar12;
  }
                    /* WARNING: Subroutine does not return */
  __stack_chk_fail(PTR___stack_chk_guard_005df758,local_8 - *(long *)PTR___stack_chk_guard_005df758,
                   0);
}


