/* Ghidra static pseudocode; not original source. Read-only project; no target execution. */

bool FUN_001d84d4(long param_1)

{
  long *plVar1;
  long lVar2;
  long lVar3;
  long *plVar4;
  ulong *__src;
  char cVar5;
  void *pvVar6;
  long lVar7;
  ulong uVar8;
  long lVar9;
  bool bVar10;
  size_t sVar11;
  size_t sVar12;
  void *local_a0;
  long local_98;
  long local_90;
  ulong local_88;
  void *local_80;
  undefined1 auStack_78 [16];
  ulong local_68;
  long *local_60;
  ulong uStack_58;
  long local_50 [2];
  ulong *local_40;
  ulong local_38;
  ulong local_30 [2];
  void *local_20;
  void *local_18;
  long local_10;
  long local_8;
  
  local_8 = *(long *)PTR___stack_chk_guard_005df758;
  local_a0 = (void *)0x0;
  local_98 = 0;
  local_90 = 0;
  pvVar6 = operator_new(0x200);
  local_a0 = pvVar6;
  local_90 = (long)pvVar6 + 0x200;
  memset(pvVar6,0,0x200);
  local_88 = 0x200;
  local_98 = (long)pvVar6 + 0x200;
  local_80 = pvVar6;
  FUN_001d70a0(auStack_78,pvVar6,0x200);
  cVar5 = FUN_001d9250(param_1,&local_88);
  if (cVar5 == '\0') {
    bVar10 = false;
    goto joined_r0x001d87d4;
  }
  if (local_68 == 0xffffffffffffffff) {
    local_68 = local_88;
    if ((long)local_88 < 0) goto LAB_001d8904;
  }
  else if (((long)local_68 < 0) || ((long)local_88 < (long)local_68)) goto LAB_001d8904;
  bVar10 = local_68 == 0 || local_80 != (void *)0x0;
  if (local_68 != 0 && local_80 == (void *)0x0) {
LAB_001d8904:
                    /* WARNING: Subroutine does not return */
    std::terminate();
  }
  uVar8 = local_98 - (long)local_a0;
  if (uVar8 < local_68) {
    FUN_001d96c0(&local_a0,local_68 - uVar8);
  }
  else if ((local_68 < uVar8) && (local_98 != (long)local_a0 + local_68)) {
    local_98 = (long)local_a0 + local_68;
  }
  std::operator+("raw.events.",(string *)(param_1 + 8));
  plVar1 = local_60;
  local_40 = local_30;
  if ((undefined1 *)((long)local_60 + uStack_58) != (undefined1 *)0x0 && local_60 == (long *)0x0) {
                    /* WARNING: Subroutine does not return */
    std::__throw_logic_error("basic_string::_M_construct null not valid");
  }
  if (uStack_58 < 0x10) {
    if (uStack_58 == 1) {
      local_30[0] = CONCAT71(local_30[0]._1_7_,(char)*local_60);
      goto LAB_001d864c;
    }
    if (uStack_58 != 0) goto LAB_001d88a8;
                    /* WARNING: Ignoring partial resolution of indirect */
    local_30[0]._0_1_ = 0;
    uVar8 = local_98 - (long)local_a0;
    if (uVar8 == 0) goto LAB_001d8814;
LAB_001d8668:
    local_38 = uStack_58;
    local_10 = 0;
    local_18 = (void *)0x0;
    local_20 = (void *)0x0;
    if ((long)uVar8 < 0) {
                    /* WARNING: Subroutine does not return */
      std::__throw_bad_alloc();
    }
    pvVar6 = operator_new(uVar8);
    local_10 = (long)pvVar6 + uVar8;
    sVar12 = local_98 - (long)local_a0;
    sVar11 = 0;
    local_20 = pvVar6;
    if (sVar12 != 0) {
      local_18 = pvVar6;
      memmove(pvVar6,local_a0,sVar12);
      sVar11 = sVar12;
    }
  }
  else {
    if ((long)uStack_58 < 0) {
                    /* WARNING: Subroutine does not return */
      std::__throw_length_error("basic_string::_M_create");
    }
    if ((long)(uStack_58 + 1) < 0) {
                    /* WARNING: Subroutine does not return */
      std::__throw_bad_alloc();
    }
    local_40 = operator_new(uStack_58 + 1);
    local_30[0] = uStack_58;
LAB_001d88a8:
    memcpy(local_40,plVar1,uStack_58);
LAB_001d864c:
    *(undefined1 *)((long)local_40 + uStack_58) = 0;
    uVar8 = local_98 - (long)local_a0;
    if (uVar8 != 0) goto LAB_001d8668;
LAB_001d8814:
    local_38 = uStack_58;
    sVar11 = 0;
    pvVar6 = (void *)0x0;
    local_20 = (void *)0x0;
    local_10 = 0;
  }
  __src = local_40;
  lVar3 = DAT_005e3b98;
  local_18 = (void *)((long)pvVar6 + sVar11);
  plVar1 = (long *)(DAT_005e3b98 + 0x100);
  lVar7 = *plVar1;
  lVar2 = lVar7 + 1;
  lVar9 = *(long *)(DAT_005e3b98 + 0x140);
  if (lVar2 == *(long *)(DAT_005e3b98 + 0xc0)) {
    lVar2 = 0;
  }
  if ((lVar9 == lVar2) &&
     (plVar4 = (long *)(DAT_005e3b98 + 0x180), *(long *)(DAT_005e3b98 + 0x140) = *plVar4,
     lVar9 == *plVar4)) {
    bVar10 = false;
  }
  else {
    lVar9 = *(long *)(lVar3 + 200);
    lVar3 = lVar7 * 0x38 + 0x70;
    lVar7 = lVar9 + lVar3;
    pvVar6 = (void *)(lVar7 + 0x10);
    *(void **)(lVar9 + lVar3) = pvVar6;
    if ((undefined1 *)((long)local_40 + local_38) != (undefined1 *)0x0 && local_40 == (ulong *)0x0)
    {
                    /* WARNING: Subroutine does not return */
      std::__throw_logic_error("basic_string::_M_construct null not valid");
    }
    if (local_38 < 0x10) {
      if (local_38 == 1) {
        *(char *)(lVar7 + 0x10) = (char)*local_40;
      }
      else if (local_38 != 0) goto LAB_001d88f0;
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
      pvVar6 = operator_new(local_38 + 1);
      *(void **)(lVar9 + lVar3) = pvVar6;
      *(ulong *)(lVar7 + 0x10) = local_38;
LAB_001d88f0:
      memcpy(pvVar6,__src,local_38);
      pvVar6 = *(void **)(lVar9 + lVar3);
    }
    *(ulong *)(lVar7 + 8) = local_38;
    *(undefined1 *)((long)pvVar6 + local_38) = 0;
    *(undefined8 *)(lVar7 + 0x20) = 0;
    *(undefined8 *)(lVar7 + 0x28) = 0;
    *(undefined8 *)(lVar7 + 0x30) = 0;
    uVar8 = (long)local_18 - (long)local_20;
    if (uVar8 == 0) {
      pvVar6 = (void *)0x0;
      *(undefined8 *)(lVar7 + 0x20) = 0;
      *(undefined8 *)(lVar7 + 0x28) = 0;
      *(undefined8 *)(lVar7 + 0x30) = 0;
      sVar11 = (long)local_18 - (long)local_20;
    }
    else {
      if ((long)uVar8 < 0) {
                    /* WARNING: Subroutine does not return */
        std::__throw_bad_alloc();
      }
      pvVar6 = operator_new(uVar8);
      *(void **)(lVar7 + 0x20) = pvVar6;
      *(void **)(lVar7 + 0x28) = pvVar6;
      *(ulong *)(lVar7 + 0x30) = (long)pvVar6 + uVar8;
      sVar11 = (long)local_18 - (long)local_20;
    }
    sVar12 = 0;
    if (sVar11 != 0) {
      pvVar6 = memmove(pvVar6,local_20,sVar11);
      sVar12 = sVar11;
    }
    *(size_t *)(lVar7 + 0x28) = (long)pvVar6 + sVar12;
    *plVar1 = lVar2;
  }
  if (local_20 != (void *)0x0) {
    operator_delete(local_20,local_10 - (long)local_20);
  }
  if (local_40 != local_30) {
    operator_delete(local_40,local_30[0] + 1);
  }
  if (local_60 != local_50) {
    operator_delete(local_60,local_50[0] + 1);
  }
joined_r0x001d87d4:
  if (local_a0 != (void *)0x0) {
    operator_delete(local_a0,local_90 - (long)local_a0);
  }
  if (local_8 - *(long *)PTR___stack_chk_guard_005df758 != 0) {
                    /* WARNING: Subroutine does not return */
    __stack_chk_fail(PTR___stack_chk_guard_005df758,
                     local_8 - *(long *)PTR___stack_chk_guard_005df758,0);
  }
  return bVar10;
}


