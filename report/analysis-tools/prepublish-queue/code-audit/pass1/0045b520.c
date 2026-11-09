/* Ghidra static pseudocode; not original source. Read-only project; no target execution. */

/* WARNING: Removing unreachable block (ram,0x0045b870) */

bool FUN_0045b520(undefined8 param_1)

{
  long *plVar1;
  long lVar2;
  long lVar3;
  long *plVar4;
  size_t sVar5;
  ulong *puVar6;
  uint uVar7;
  long *__src;
  char cVar8;
  void *pvVar9;
  ulong uVar10;
  undefined1 *__dest;
  long lVar11;
  long lVar12;
  bool bVar13;
  size_t sVar14;
  void *local_a0;
  long local_98;
  long local_90;
  ulong local_88;
  void *local_80;
  undefined1 auStack_78 [16];
  ulong local_68;
  ulong *local_60;
  undefined8 uStack_58;
  ulong local_50;
  char local_48 [4];
  uint local_44;
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
  pvVar9 = operator_new(0x200);
  local_a0 = pvVar9;
  local_90 = (long)pvVar9 + 0x200;
  memset(pvVar9,0,0x200);
  local_88 = 0x200;
  local_98 = (long)pvVar9 + 0x200;
  local_80 = pvVar9;
  FUN_001d70a0(auStack_78,pvVar9,0x200);
  cVar8 = FUN_0045b9f0(param_1,&local_88);
  bVar13 = false;
  if (cVar8 == '\0') goto joined_r0x0045b7ec;
  if (local_68 == 0xffffffffffffffff) {
    local_68 = local_88;
    if ((long)local_88 < 0) goto LAB_0045b91c;
  }
  else if (((long)local_68 < 0) || ((long)local_88 < (long)local_68)) goto LAB_0045b91c;
  bVar13 = local_68 == 0 || local_80 != (void *)0x0;
  if (local_68 != 0 && local_80 == (void *)0x0) {
LAB_0045b91c:
                    /* WARNING: Subroutine does not return */
    std::terminate();
  }
  uVar10 = local_98 - (long)local_a0;
  if (uVar10 < local_68) {
    FUN_001d96c0(&local_a0,local_68 - uVar10);
    uVar10 = local_98 - (long)local_a0;
  }
  else if ((local_68 < uVar10) && (local_98 != (long)local_a0 + local_68)) {
    uVar10 = local_68;
    local_98 = (long)local_a0 + local_68;
  }
  uVar7 = local_44;
  local_44 = local_44 & 0xffffff00;
  local_48[0] = s_raw_frz_hall_004c94b8[8];
  local_48[1] = s_raw_frz_hall_004c94b8[9];
  local_48[2] = s_raw_frz_hall_004c94b8[10];
  local_48[3] = s_raw_frz_hall_004c94b8[0xb];
  uStack_58 = 0;
  uStack_28 = CONCAT44(uVar7,s_raw_frz_hall_004c94b8._8_4_) & 0xffffff00ffffffff;
  local_50 = s_raw_frz_hall_004c94b8._0_8_ & 0xffffffffffffff00;
  local_38 = 0xc;
  local_30._0_1_ = s_raw_frz_hall_004c94b8[0];
  local_30._1_1_ = s_raw_frz_hall_004c94b8[1];
  local_30._2_1_ = s_raw_frz_hall_004c94b8[2];
  local_30._3_1_ = s_raw_frz_hall_004c94b8[3];
  local_30._4_1_ = s_raw_frz_hall_004c94b8[4];
  local_30._5_1_ = s_raw_frz_hall_004c94b8[5];
  local_30._6_1_ = s_raw_frz_hall_004c94b8[6];
  local_30._7_1_ = s_raw_frz_hall_004c94b8[7];
  local_20 = (void *)0x0;
  local_18 = (void *)0x0;
  local_10 = 0;
  local_60 = &local_50;
  local_40 = &local_30;
  if (uVar10 == 0) {
    local_20 = (void *)0x0;
    local_10 = 0;
    local_18 = (void *)0x0;
  }
  else {
    if ((long)uVar10 < 0) {
                    /* WARNING: Subroutine does not return */
      std::__throw_bad_alloc();
    }
    local_20 = operator_new(uVar10);
    puVar6 = local_60;
    local_10 = (long)local_20 + uVar10;
    sVar5 = local_98 - (long)local_a0;
    local_18 = local_20;
    if (sVar5 != 0) {
      local_18 = memmove(local_20,local_a0,sVar5);
      local_18 = (void *)((long)local_18 + sVar5);
    }
    if (puVar6 != &local_50) {
      operator_delete(puVar6,local_50 + 1);
    }
  }
  uVar10 = local_38;
  __src = local_40;
  lVar3 = DAT_005e3b98;
  plVar1 = (long *)(DAT_005e3b98 + 0x100);
  lVar11 = *plVar1;
  lVar2 = lVar11 + 1;
  lVar12 = *(long *)(DAT_005e3b98 + 0x140);
  if (lVar2 == *(long *)(DAT_005e3b98 + 0xc0)) {
    lVar2 = 0;
  }
  if ((lVar12 == lVar2) &&
     (plVar4 = (long *)(DAT_005e3b98 + 0x180), *(long *)(DAT_005e3b98 + 0x140) = *plVar4,
     lVar12 == *plVar4)) {
    bVar13 = false;
  }
  else {
    lVar12 = *(long *)(lVar3 + 200);
    lVar3 = lVar11 * 0x38 + 0x70;
    lVar11 = lVar12 + lVar3;
    __dest = (undefined1 *)(lVar11 + 0x10);
    *(undefined1 **)(lVar12 + lVar3) = __dest;
    if ((undefined1 *)((long)local_40 + local_38) != (undefined1 *)0x0 && local_40 == (long *)0x0) {
                    /* WARNING: Subroutine does not return */
      std::__throw_logic_error("basic_string::_M_construct null not valid");
    }
    if (local_38 < 0x10) {
      if (local_38 == 1) {
        *(char *)(lVar11 + 0x10) = (char)*local_40;
        goto LAB_0045b758;
      }
      if (local_38 != 0) goto LAB_0045b908;
      *(undefined8 *)(lVar11 + 8) = 0;
      *__dest = 0;
      *(undefined8 *)(lVar11 + 0x20) = 0;
      *(undefined8 *)(lVar11 + 0x28) = 0;
      *(undefined8 *)(lVar11 + 0x30) = 0;
      uVar10 = (long)local_18 - (long)local_20;
      if (uVar10 == 0) goto LAB_0045b834;
LAB_0045b778:
      if ((long)uVar10 < 0) {
                    /* WARNING: Subroutine does not return */
        std::__throw_bad_alloc();
      }
      pvVar9 = operator_new(uVar10);
      *(void **)(lVar11 + 0x20) = pvVar9;
      *(void **)(lVar11 + 0x28) = pvVar9;
      *(ulong *)(lVar11 + 0x30) = (long)pvVar9 + uVar10;
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
      __dest = operator_new(local_38 + 1);
      *(undefined1 **)(lVar12 + lVar3) = __dest;
      *(ulong *)(lVar11 + 0x10) = uVar10;
LAB_0045b908:
      memcpy(__dest,__src,uVar10);
      __dest = *(undefined1 **)(lVar12 + lVar3);
LAB_0045b758:
      *(ulong *)(lVar11 + 8) = uVar10;
      __dest[uVar10] = 0;
      *(undefined8 *)(lVar11 + 0x20) = 0;
      *(undefined8 *)(lVar11 + 0x28) = 0;
      *(undefined8 *)(lVar11 + 0x30) = 0;
      uVar10 = (long)local_18 - (long)local_20;
      if (uVar10 != 0) goto LAB_0045b778;
LAB_0045b834:
      pvVar9 = (void *)0x0;
      *(undefined8 *)(lVar11 + 0x20) = 0;
      *(undefined8 *)(lVar11 + 0x28) = 0;
      *(undefined8 *)(lVar11 + 0x30) = 0;
      sVar5 = (long)local_18 - (long)local_20;
    }
    sVar14 = 0;
    if (sVar5 != 0) {
      pvVar9 = memmove(pvVar9,local_20,sVar5);
      sVar14 = sVar5;
    }
    *(size_t *)(lVar11 + 0x28) = (long)pvVar9 + sVar14;
    *plVar1 = lVar2;
  }
  if (local_20 != (void *)0x0) {
    operator_delete(local_20,local_10 - (long)local_20);
  }
  if (local_40 != &local_30) {
    operator_delete(local_40,local_30 + 1);
  }
joined_r0x0045b7ec:
  if (local_a0 != (void *)0x0) {
    operator_delete(local_a0,local_90 - (long)local_a0);
  }
  if (local_8 - *(long *)PTR___stack_chk_guard_005df758 == 0) {
    return bVar13;
  }
                    /* WARNING: Subroutine does not return */
  __stack_chk_fail(PTR___stack_chk_guard_005df758,local_8 - *(long *)PTR___stack_chk_guard_005df758,
                   0);
}


