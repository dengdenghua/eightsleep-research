/* Ghidra static pseudocode; not original source. Read-only project; no target execution. */

undefined8 * FUN_00184870(undefined8 *param_1,long param_2,long param_3)

{
  undefined *puVar1;
  char cVar2;
  undefined8 *puVar3;
  undefined8 *puVar4;
  undefined8 *puVar5;
  long lVar6;
  undefined8 uVar7;
  undefined8 *puVar8;
  undefined8 uVar9;
  undefined8 uVar10;
  ulong uVar11;
  undefined8 *puVar12;
  undefined8 *puVar13;
  ulong uVar14;
  undefined8 *puVar15;
  undefined1 *puVar16;
  undefined8 *local_60;
  ulong local_58;
  long *local_48;
  undefined8 *local_40;
  undefined8 *local_38;
  undefined8 *local_30;
  undefined8 *local_28;
  undefined8 *local_20;
  undefined8 *local_18;
  long local_10;
  long local_8;
  
  puVar13 = *(undefined8 **)(param_2 + 0x140);
  local_8 = *(long *)PTR___stack_chk_guard_005df758;
  puVar15 = *(undefined8 **)(param_2 + 0x148);
  local_40 = (undefined8 *)0x0;
  local_38 = (undefined8 *)0x0;
  local_30 = (undefined8 *)0x0;
  uVar14 = (long)puVar15 - (long)puVar13;
  if (uVar14 == 0) {
    local_40 = (undefined8 *)0x0;
    local_38 = (undefined8 *)0x0;
    local_30 = (undefined8 *)0x0;
    puVar5 = (undefined8 *)0x0;
    puVar8 = (undefined8 *)0x0;
    if (puVar13 == puVar15) goto LAB_00184dec;
LAB_00184920:
    do {
      while( true ) {
        puVar8 = puVar5;
        puVar5 = puVar8 + 2;
        uVar14 = puVar13[1];
        *puVar8 = puVar5;
        puVar16 = (undefined1 *)*puVar13;
        if (puVar16 + uVar14 != (undefined1 *)0x0 && puVar16 == (undefined1 *)0x0) {
                    /* WARNING: Subroutine does not return */
          std::__throw_logic_error("basic_string::_M_construct null not valid");
        }
        if (uVar14 < 0x10) break;
        if ((long)uVar14 < 0) {
                    /* WARNING: Subroutine does not return */
          std::__throw_length_error("basic_string::_M_create");
        }
        if ((long)(uVar14 + 1) < 0) {
                    /* WARNING: Subroutine does not return */
          std::__throw_bad_alloc();
        }
        puVar5 = operator_new(uVar14 + 1);
        *puVar8 = puVar5;
        puVar8[2] = uVar14;
LAB_00184ac8:
        memcpy(puVar5,puVar16,uVar14);
        puVar5 = (undefined8 *)*puVar8;
LAB_00184908:
        puVar8[1] = uVar14;
        puVar13 = puVar13 + 4;
        *(undefined1 *)((long)puVar5 + uVar14) = 0;
        puVar5 = puVar8 + 4;
        if (puVar15 == puVar13) goto LAB_00184968;
      }
      if (uVar14 == 1) {
        *(undefined1 *)(puVar8 + 2) = *puVar16;
        goto LAB_00184908;
      }
      if (uVar14 != 0) goto LAB_00184ac8;
      puVar8[1] = 0;
      puVar13 = puVar13 + 4;
      *(undefined1 *)puVar5 = 0;
      puVar5 = puVar8 + 4;
    } while (puVar15 != puVar13);
LAB_00184968:
    puVar8 = puVar8 + 4;
    lVar6 = (long)puVar8 - (long)local_40;
  }
  else {
    if (0x7fffffffffffffe0 < uVar14) {
                    /* WARNING: Subroutine does not return */
      std::__throw_bad_alloc();
    }
    local_40 = operator_new(uVar14);
    puVar13 = *(undefined8 **)(param_2 + 0x140);
    puVar15 = *(undefined8 **)(param_2 + 0x148);
    local_30 = (undefined8 *)((long)local_40 + uVar14);
    puVar5 = local_40;
    local_38 = local_40;
    puVar8 = local_30;
    if (puVar13 != puVar15) goto LAB_00184920;
LAB_00184dec:
    local_30 = puVar8;
    lVar6 = 0;
    puVar8 = local_40;
  }
  puVar13 = *(undefined8 **)(param_2 + 0x158);
  puVar15 = *(undefined8 **)(param_2 + 0x160);
  local_38 = puVar8;
  if (puVar13 == puVar15) goto LAB_00184a10;
  uVar14 = (long)puVar15 - (long)puVar13;
  if (uVar14 <= (ulong)((long)local_30 - (long)puVar8)) {
    do {
      while( true ) {
        puVar5 = puVar8 + 2;
        uVar11 = puVar13[1];
        *puVar8 = puVar5;
        puVar16 = (undefined1 *)*puVar13;
        if (puVar16 + uVar11 != (undefined1 *)0x0 && puVar16 == (undefined1 *)0x0) {
                    /* WARNING: Subroutine does not return */
          std::__throw_logic_error("basic_string::_M_construct null not valid");
        }
        if (uVar11 < 0x10) break;
        if ((long)uVar11 < 0) {
                    /* WARNING: Subroutine does not return */
          std::__throw_length_error("basic_string::_M_create");
        }
        if ((long)(uVar11 + 1) < 0) {
                    /* WARNING: Subroutine does not return */
          std::__throw_bad_alloc();
        }
        puVar5 = operator_new(uVar11 + 1);
        *puVar8 = puVar5;
        puVar8[2] = uVar11;
LAB_00184dbc:
        memcpy(puVar5,puVar16,uVar11);
        puVar5 = (undefined8 *)*puVar8;
LAB_001849a4:
        puVar8[1] = uVar11;
        puVar13 = puVar13 + 4;
        *(undefined1 *)((long)puVar5 + uVar11) = 0;
        puVar8 = puVar8 + 4;
        if (puVar15 == puVar13) goto LAB_00184a04;
      }
      if (uVar11 == 1) {
        *(undefined1 *)(puVar8 + 2) = *puVar16;
        goto LAB_001849a4;
      }
      if (uVar11 != 0) goto LAB_00184dbc;
      puVar8[1] = 0;
      puVar13 = puVar13 + 4;
      *(undefined1 *)puVar5 = 0;
      puVar8 = puVar8 + 4;
    } while (puVar15 != puVar13);
LAB_00184a04:
    local_38 = (undefined8 *)((long)local_38 + uVar14);
    goto LAB_00184a10;
  }
  uVar11 = lVar6 >> 5;
  uVar14 = (long)uVar14 >> 5;
  if (0x3ffffffffffffff - uVar11 < uVar14) {
                    /* WARNING: Subroutine does not return */
    std::__throw_length_error("vector::_M_range_insert");
  }
  if (uVar14 < uVar11) {
    uVar14 = uVar11;
  }
  local_58 = uVar11 + uVar14;
  if (CARRY8(uVar11,uVar14)) {
    uVar14 = 0x7fffffffffffffe0;
    local_58 = 0x3ffffffffffffff;
LAB_00184dfc:
    local_60 = operator_new(uVar14);
  }
  else {
    local_60 = (undefined8 *)0x0;
    if (local_58 != 0) {
      if (0x3ffffffffffffff < local_58) {
        local_58 = 0x3ffffffffffffff;
      }
      uVar14 = local_58 << 5;
      goto LAB_00184dfc;
    }
  }
  puVar5 = local_60;
  if (puVar8 != local_40) {
    puVar5 = (undefined8 *)((long)local_60 + ((long)puVar8 - (long)local_40));
    puVar3 = local_60;
    puVar4 = local_40 + 2;
    do {
      while( true ) {
        *puVar3 = puVar3 + 2;
        if ((undefined8 *)puVar4[-2] != puVar4) break;
        uVar7 = puVar4[1];
        puVar3[2] = *puVar4;
        puVar3[3] = uVar7;
        puVar12 = puVar3 + 4;
        puVar3[1] = puVar4[-1];
        puVar4[-2] = puVar4;
        puVar4[-1] = 0;
        *(undefined1 *)puVar4 = 0;
        puVar3 = puVar12;
        puVar4 = puVar4 + 4;
        if (puVar12 == puVar5) goto LAB_00184c80;
      }
      *puVar3 = (undefined8 *)puVar4[-2];
      puVar12 = puVar3 + 4;
      puVar3[2] = *puVar4;
      puVar3[1] = puVar4[-1];
      puVar4[-2] = puVar4;
      puVar4[-1] = 0;
      *(undefined1 *)puVar4 = 0;
      puVar3 = puVar12;
      puVar4 = puVar4 + 4;
    } while (puVar12 != puVar5);
  }
LAB_00184c80:
  do {
    puVar3 = puVar5;
    puVar5 = puVar3 + 2;
    uVar14 = puVar13[1];
    *puVar3 = puVar5;
    puVar16 = (undefined1 *)*puVar13;
    if (puVar16 + uVar14 != (undefined1 *)0x0 && puVar16 == (undefined1 *)0x0) {
                    /* WARNING: Subroutine does not return */
      std::__throw_logic_error("basic_string::_M_construct null not valid");
    }
    if (0xf < uVar14) {
      if ((long)uVar14 < 0) {
                    /* WARNING: Subroutine does not return */
        std::__throw_length_error("basic_string::_M_create");
      }
      if ((long)(uVar14 + 1) < 0) {
                    /* WARNING: Subroutine does not return */
        std::__throw_bad_alloc();
      }
      puVar5 = operator_new(uVar14 + 1);
      *puVar3 = puVar5;
      puVar3[2] = uVar14;
LAB_00184e24:
      memcpy(puVar5,puVar16,uVar14);
      puVar5 = (undefined8 *)*puVar3;
LAB_00184c68:
      puVar3[1] = uVar14;
      puVar13 = puVar13 + 4;
      *(undefined1 *)((long)puVar5 + uVar14) = 0;
      puVar5 = puVar3 + 4;
      if (puVar15 == puVar13) break;
      goto LAB_00184c80;
    }
    if (uVar14 == 1) {
      *(undefined1 *)(puVar3 + 2) = *puVar16;
      goto LAB_00184c68;
    }
    if (uVar14 != 0) goto LAB_00184e24;
    puVar3[1] = 0;
    puVar13 = puVar13 + 4;
    *(undefined1 *)puVar5 = 0;
    puVar5 = puVar3 + 4;
  } while (puVar15 != puVar13);
  puVar5 = local_38;
  puVar3 = puVar3 + 4;
  puVar13 = (undefined8 *)((long)puVar3 + ((long)local_38 - (long)puVar8));
  puVar4 = puVar8 + 2;
  puVar12 = puVar3;
  puVar15 = local_40;
  if (puVar8 != local_38) {
    do {
      while( true ) {
        puVar8 = (undefined8 *)puVar4[-2];
        *puVar12 = puVar12 + 2;
        puVar3 = puVar13;
        if (puVar8 != puVar4) break;
        uVar9 = puVar4[-1];
        puVar4[-2] = puVar4;
        puVar4[-1] = 0;
        puVar8 = puVar12 + 4;
        uVar7 = *puVar4;
        uVar10 = puVar4[1];
        puVar12[1] = uVar9;
        puVar12[2] = uVar7;
        puVar12[3] = uVar10;
        *(undefined1 *)puVar4 = 0;
        puVar4 = puVar4 + 4;
        puVar12 = puVar8;
        if (puVar8 == puVar13) goto joined_r0x00184d4c;
      }
      *puVar12 = puVar8;
      puVar8 = puVar12 + 4;
      uVar7 = puVar4[-1];
      puVar4[-2] = puVar4;
      puVar4[-1] = 0;
      uVar10 = *puVar4;
      puVar12[1] = uVar7;
      puVar12[2] = uVar10;
      *(undefined1 *)puVar4 = 0;
      puVar4 = puVar4 + 4;
      puVar12 = puVar8;
    } while (puVar8 != puVar13);
  }
joined_r0x00184d4c:
  for (; puVar5 != puVar15; puVar15 = puVar15 + 4) {
    if ((undefined8 *)*puVar15 != puVar15 + 2) {
      operator_delete((undefined8 *)*puVar15,puVar15[2] + 1);
    }
  }
  if (local_40 != (undefined8 *)0x0) {
    operator_delete(local_40,(long)local_30 - (long)local_40);
  }
  local_40 = local_60;
  local_30 = local_60 + local_58 * 4;
  local_38 = puVar3;
LAB_00184a10:
  cVar2 = FUN_002493b4(param_2);
  puVar5 = local_30;
  puVar15 = local_38;
  puVar13 = local_40;
  if ((cVar2 == '\0') || (local_40 == local_38)) {
    *param_1 = 0;
    param_1[1] = 0;
    puVar5 = local_38;
  }
  else {
    local_40 = (undefined8 *)0x0;
    local_38 = (undefined8 *)0x0;
    local_30 = (undefined8 *)0x0;
    local_28 = puVar13;
    local_20 = puVar15;
    local_18 = puVar5;
    local_10 = param_3;
    puVar13 = operator_new(0x18);
    *param_1 = puVar13;
    *puVar13 = 0x400000001;
    puVar13[1] = 0;
    FUN_00460200(1,puVar13);
    param_1[1] = 0;
    local_48 = operator_new(0x30);
    *local_48 = (long)&PTR_FUN_0058e418;
    local_48[1] = (long)puVar13;
    puVar1 = PTR_pthread_create_005dfec0;
    local_48[2] = (long)local_28;
    local_48[3] = (long)local_20;
    local_48[4] = (long)local_18;
    local_48[5] = local_10;
    local_28 = (undefined8 *)0x0;
    local_20 = (undefined8 *)0x0;
    local_18 = (undefined8 *)0x0;
    std::thread::_M_start_thread(param_1 + 1,&local_48,puVar1);
    if (local_48 != (long *)0x0) {
      (**(code **)(*local_48 + 8))();
    }
    FUN_00198170(&local_28);
    puVar13 = local_40;
    puVar15 = local_38;
    puVar5 = local_38;
  }
  for (; puVar8 = local_38, puVar13 != local_38; puVar13 = puVar13 + 4) {
    local_38 = puVar5;
    if ((undefined8 *)*puVar13 != puVar13 + 2) {
      operator_delete((undefined8 *)*puVar13,puVar13[2] + 1);
    }
    puVar15 = local_40;
    puVar5 = local_38;
    local_38 = puVar8;
  }
  local_38 = puVar5;
  if (puVar15 != (undefined8 *)0x0) {
    operator_delete(puVar15,(long)local_30 - (long)puVar15);
  }
  if (local_8 - *(long *)PTR___stack_chk_guard_005df758 != 0) {
                    /* WARNING: Subroutine does not return */
    __stack_chk_fail(PTR___stack_chk_guard_005df758,
                     local_8 - *(long *)PTR___stack_chk_guard_005df758,0);
  }
  return param_1;
}


