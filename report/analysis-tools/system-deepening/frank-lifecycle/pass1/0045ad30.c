/* Ghidra static pseudocode; not original source. Read-only project; no target execution. */

bool FUN_0045ad30(undefined8 param_1)

{
  long *plVar1;
  long lVar2;
  long lVar3;
  long *plVar4;
  size_t sVar5;
  undefined8 uVar6;
  long *__src;
  char cVar7;
  void *pvVar8;
  undefined1 *__dest;
  long lVar9;
  ulong uVar10;
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
  long *local_60;
  undefined8 uStack_58;
  long local_50 [2];
  long *local_40;
  ulong uStack_38;
  long local_30 [2];
  void *local_20;
  void *local_18;
  long local_10;
  long local_8;
  
  local_8 = *(long *)PTR___stack_chk_guard_005df758;
  local_a0 = (void *)0x0;
  local_98 = 0;
  local_90 = 0;
  pvVar8 = operator_new(0x200);
  local_a0 = pvVar8;
  local_90 = (long)pvVar8 + 0x200;
  memset(pvVar8,0,0x200);
  local_88 = 0x200;
  local_98 = (long)pvVar8 + 0x200;
  local_80 = pvVar8;
  FUN_001d70a0(auStack_78,pvVar8,0x200);
  cVar7 = FUN_0045b3c0(param_1,&local_88);
  bVar12 = false;
  if (cVar7 == '\0') goto joined_r0x0045b010;
  if (local_68 == 0xffffffffffffffff) {
    local_68 = local_88;
    if ((long)local_88 < 0) goto LAB_0045b0f4;
  }
  else if (((long)local_68 < 0) || ((long)local_88 < (long)local_68)) goto LAB_0045b0f4;
  bVar12 = local_68 == 0 || local_80 != (void *)0x0;
  if (local_68 != 0 && local_80 == (void *)0x0) {
LAB_0045b0f4:
                    /* WARNING: Subroutine does not return */
    std::terminate();
  }
  uVar10 = local_98 - (long)local_a0;
  if (uVar10 < local_68) {
    FUN_001d96c0(&local_a0,local_68 - uVar10);
  }
  else if ((local_68 < uVar10) && (local_98 != (long)local_a0 + local_68)) {
    local_98 = (long)local_a0 + local_68;
  }
  local_60 = local_50;
  local_40 = operator_new(0x1a);
  uVar6 = s_raw_frz_therm_fault_state_004c9488._8_8_;
  *local_40 = s_raw_frz_therm_fault_state_004c9488._0_8_;
  local_40[1] = uVar6;
  local_40[2] = s_raw_frz_therm_fault_state_004c9488._16_8_;
  uVar10 = local_98 - (long)local_a0;
  *(char *)(local_40 + 3) = s_raw_frz_therm_fault_state_004c9488[0x18];
  *(char *)((long)local_40 + 0x19) = '\0';
  uStack_58 = 0;
  local_50[0] = 0;
  uStack_38 = 0x19;
  local_30[0] = 0x19;
  local_20 = (void *)0x0;
  local_18 = (void *)0x0;
  local_10 = 0;
  if (uVar10 == 0) {
    local_20 = (void *)0x0;
    local_18 = (void *)0x0;
    local_10 = 0;
    local_60 = local_50;
  }
  else {
    if ((long)uVar10 < 0) {
      local_60 = local_50;
                    /* WARNING: Subroutine does not return */
      std::__throw_bad_alloc();
    }
    local_60 = local_50;
    pvVar8 = operator_new(uVar10);
    plVar1 = local_60;
    local_10 = (long)pvVar8 + uVar10;
    sVar5 = local_98 - (long)local_a0;
    local_20 = pvVar8;
    if (sVar5 != 0) {
      local_18 = pvVar8;
      memmove(pvVar8,local_a0,sVar5);
    }
    local_18 = (void *)((long)pvVar8 + sVar5);
    if (plVar1 != local_50) {
      operator_delete(plVar1,local_50[0] + 1);
    }
  }
  uVar10 = uStack_38;
  __src = local_40;
  lVar3 = DAT_005e3b98;
  plVar1 = (long *)(DAT_005e3b98 + 0x100);
  lVar9 = *plVar1;
  lVar2 = lVar9 + 1;
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
    lVar3 = lVar9 * 0x38 + 0x70;
    lVar9 = lVar11 + lVar3;
    __dest = (undefined1 *)(lVar9 + 0x10);
    *(undefined1 **)(lVar11 + lVar3) = __dest;
    if ((char *)((long)local_40 + uStack_38) != (char *)0x0 && local_40 == (long *)0x0) {
                    /* WARNING: Subroutine does not return */
      std::__throw_logic_error("basic_string::_M_construct null not valid");
    }
    if (uStack_38 < 0x10) {
      if (uStack_38 == 1) {
        *(char *)(lVar9 + 0x10) = (char)*local_40;
        goto LAB_0045af7c;
      }
      if (uStack_38 != 0) goto LAB_0045b0e0;
      *(undefined8 *)(lVar9 + 8) = 0;
      *__dest = 0;
      *(undefined8 *)(lVar9 + 0x20) = 0;
      *(undefined8 *)(lVar9 + 0x28) = 0;
      *(undefined8 *)(lVar9 + 0x30) = 0;
      uVar10 = (long)local_18 - (long)local_20;
      if (uVar10 == 0) goto LAB_0045b050;
LAB_0045af9c:
      if ((long)uVar10 < 0) {
                    /* WARNING: Subroutine does not return */
        std::__throw_bad_alloc();
      }
      pvVar8 = operator_new(uVar10);
      *(void **)(lVar9 + 0x20) = pvVar8;
      *(void **)(lVar9 + 0x28) = pvVar8;
      *(ulong *)(lVar9 + 0x30) = (long)pvVar8 + uVar10;
      sVar5 = (long)local_18 - (long)local_20;
    }
    else {
      if ((long)uStack_38 < 0) {
                    /* WARNING: Subroutine does not return */
        std::__throw_length_error("basic_string::_M_create");
      }
      if ((long)(uStack_38 + 1) < 0) {
                    /* WARNING: Subroutine does not return */
        std::__throw_bad_alloc();
      }
      __dest = operator_new(uStack_38 + 1);
      *(undefined1 **)(lVar11 + lVar3) = __dest;
      *(ulong *)(lVar9 + 0x10) = uVar10;
LAB_0045b0e0:
      memcpy(__dest,__src,uVar10);
      __dest = *(undefined1 **)(lVar11 + lVar3);
LAB_0045af7c:
      *(ulong *)(lVar9 + 8) = uVar10;
      __dest[uVar10] = 0;
      *(undefined8 *)(lVar9 + 0x20) = 0;
      *(undefined8 *)(lVar9 + 0x28) = 0;
      *(undefined8 *)(lVar9 + 0x30) = 0;
      uVar10 = (long)local_18 - (long)local_20;
      if (uVar10 != 0) goto LAB_0045af9c;
LAB_0045b050:
      pvVar8 = (void *)0x0;
      *(undefined8 *)(lVar9 + 0x20) = 0;
      *(undefined8 *)(lVar9 + 0x28) = 0;
      *(undefined8 *)(lVar9 + 0x30) = 0;
      sVar5 = (long)local_18 - (long)local_20;
    }
    sVar13 = 0;
    if (sVar5 != 0) {
      pvVar8 = memmove(pvVar8,local_20,sVar5);
      sVar13 = sVar5;
    }
    *(size_t *)(lVar9 + 0x28) = (long)pvVar8 + sVar13;
    *plVar1 = lVar2;
  }
  if (local_20 != (void *)0x0) {
    operator_delete(local_20,local_10 - (long)local_20);
  }
  if (local_40 != local_30) {
    operator_delete(local_40,local_30[0] + 1);
  }
joined_r0x0045b010:
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


