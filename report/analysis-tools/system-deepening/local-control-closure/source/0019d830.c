/* Ghidra static pseudocode; not original source. */

void FUN_0019d830(undefined8 *param_1,undefined4 *param_2)

{
  undefined8 *puVar1;
  undefined4 uVar2;
  undefined8 *__dest;
  undefined8 *puVar3;
  undefined8 *__src;
  undefined8 uVar4;
  undefined8 uVar5;
  size_t __n;
  long lVar6;
  undefined8 uVar7;
  long *plVar8;
  code *pcVar9;
  undefined8 local_b8;
  undefined8 uStack_b0;
  code *local_a8;
  undefined8 uStack_a0;
  undefined8 local_98;
  undefined1 local_90;
  undefined4 local_8c;
  long *local_88 [2];
  long local_78 [2];
  undefined1 auStack_68 [16];
  code *local_58;
  undefined8 local_40;
  undefined1 local_38;
  undefined4 local_34;
  long *local_30 [2];
  long local_20 [3];
  long local_8;
  
  puVar3 = (undefined8 *)(param_2 + 8);
  puVar1 = param_1 + 2;
  uVar2 = param_2[1];
  local_8 = *(long *)PTR___stack_chk_guard_005df758;
  *(undefined4 *)param_1 = *param_2;
  *(undefined4 *)((long)param_1 + 4) = uVar2;
  __dest = (undefined8 *)param_1[2];
  *(undefined1 *)(param_1 + 1) = *(undefined1 *)(param_2 + 2);
  __src = *(undefined8 **)(param_2 + 4);
  *(undefined4 *)((long)param_1 + 0xc) = param_2[3];
  if (__src == puVar3) {
    __n = *(size_t *)(param_2 + 6);
    lVar6 = 0;
    if (__n != 0) {
      if (__n == 1) {
        *(undefined1 *)__dest = *(undefined1 *)(param_2 + 8);
        lVar6 = *(long *)(param_2 + 6);
        __dest = (undefined8 *)param_1[2];
      }
      else {
        memcpy(__dest,__src,__n);
        lVar6 = *(long *)(param_2 + 6);
        __dest = (undefined8 *)param_1[2];
      }
    }
    param_1[3] = lVar6;
    *(undefined1 *)((long)__dest + lVar6) = 0;
    puVar3 = *(undefined8 **)(param_2 + 4);
  }
  else {
    uVar7 = *(undefined8 *)(param_2 + 6);
    if (__dest == param_1 + 4) {
      param_1[2] = __src;
      param_1[3] = uVar7;
      param_1[4] = *(undefined8 *)(param_2 + 8);
    }
    else {
      uVar5 = param_1[4];
      param_1[2] = __src;
      param_1[3] = uVar7;
      param_1[4] = *(undefined8 *)(param_2 + 8);
      if (__dest != (undefined8 *)0x0) {
        *(undefined8 **)(param_2 + 4) = __dest;
        *(undefined8 *)(param_2 + 8) = uVar5;
        puVar3 = __dest;
        goto LAB_0019d8d4;
      }
    }
    *(undefined8 **)(param_2 + 4) = puVar3;
  }
LAB_0019d8d4:
  *(undefined8 *)(param_2 + 6) = 0;
  *(undefined1 *)puVar3 = 0;
  plVar8 = (long *)param_1[0xc];
  local_90 = *(undefined1 *)(param_1 + 1);
  local_8c = *(undefined4 *)((long)param_1 + 0xc);
  local_98 = *param_1;
  pcVar9 = *(code **)(*plVar8 + 0x10);
  FUN_00198030(local_88,puVar1);
  (*pcVar9)(auStack_68,plVar8,&local_98);
  FUN_00198200(&local_b8,auStack_68);
  pcVar9 = (code *)param_1[0x11];
  param_1[0x11] = local_a8;
  uVar7 = param_1[0xf];
  uVar5 = param_1[0x10];
  uVar4 = param_1[0x12];
  param_1[0xf] = local_b8;
  param_1[0x10] = uStack_b0;
  param_1[0x12] = uStack_a0;
  local_b8 = uVar7;
  uStack_b0 = uVar5;
  local_a8 = pcVar9;
  uStack_a0 = uVar4;
  if (pcVar9 != (code *)0x0) {
    (*pcVar9)(&local_b8,&local_b8,3);
  }
  param_1[0x14] = local_40;
  *(undefined1 *)(param_1 + 0x15) = local_38;
  *(undefined4 *)((long)param_1 + 0xac) = local_34;
  std::__cxx11::string::_M_assign((string *)(param_1 + 0x16),(string *)local_30);
  *(undefined1 *)(param_1 + 0x1a) = 0;
  *(undefined4 *)((long)param_1 + 0xd4) = 0;
  if (local_30[0] != local_20) {
    operator_delete(local_30[0],local_20[0] + 1);
  }
  if (local_58 != (code *)0x0) {
    (*local_58)(auStack_68,auStack_68,3);
  }
  if (local_88[0] != local_78) {
    operator_delete(local_88[0],local_78[0] + 1);
  }
  plVar8 = (long *)param_1[0xd];
  local_90 = *(undefined1 *)(param_1 + 1);
  local_8c = *(undefined4 *)((long)param_1 + 0xc);
  local_98 = *param_1;
  pcVar9 = *(code **)(*plVar8 + 0x10);
  FUN_00198030(local_88,puVar1);
  (*pcVar9)(auStack_68,plVar8,&local_98);
  FUN_00198200(&local_b8,auStack_68);
  pcVar9 = (code *)param_1[0x1d];
  param_1[0x1d] = local_a8;
  uVar7 = param_1[0x1b];
  uVar5 = param_1[0x1c];
  uVar4 = param_1[0x1e];
  param_1[0x1b] = local_b8;
  param_1[0x1c] = uStack_b0;
  param_1[0x1e] = uStack_a0;
  local_b8 = uVar7;
  uStack_b0 = uVar5;
  local_a8 = pcVar9;
  uStack_a0 = uVar4;
  if (pcVar9 != (code *)0x0) {
    (*pcVar9)(&local_b8,&local_b8,3);
  }
  param_1[0x20] = local_40;
  *(undefined1 *)(param_1 + 0x21) = local_38;
  *(undefined4 *)((long)param_1 + 0x10c) = local_34;
  std::__cxx11::string::_M_assign((string *)(param_1 + 0x22),(string *)local_30);
  *(undefined1 *)(param_1 + 0x26) = 0;
  *(undefined4 *)((long)param_1 + 0x134) = 0;
  if (local_30[0] != local_20) {
    operator_delete(local_30[0],local_20[0] + 1);
  }
  if (local_58 != (code *)0x0) {
    (*local_58)(auStack_68,auStack_68,3);
  }
  if (local_88[0] != local_78) {
    operator_delete(local_88[0],local_78[0] + 1);
  }
  plVar8 = (long *)param_1[0xe];
  local_90 = *(undefined1 *)(param_1 + 1);
  local_8c = *(undefined4 *)((long)param_1 + 0xc);
  local_98 = *param_1;
  pcVar9 = *(code **)(*plVar8 + 0x10);
  FUN_00198030(local_88,puVar1);
  (*pcVar9)(auStack_68,plVar8,&local_98);
  FUN_00198200(&local_b8,auStack_68);
  uVar7 = param_1[0x27];
  uVar5 = param_1[0x28];
  param_1[0x27] = local_b8;
  param_1[0x28] = uStack_b0;
  pcVar9 = (code *)param_1[0x29];
  param_1[0x29] = local_a8;
  uVar4 = param_1[0x2a];
  param_1[0x2a] = uStack_a0;
  local_b8 = uVar7;
  uStack_b0 = uVar5;
  local_a8 = pcVar9;
  uStack_a0 = uVar4;
  if (pcVar9 != (code *)0x0) {
    (*pcVar9)(&local_b8,&local_b8,3);
  }
  param_1[0x2c] = local_40;
  *(undefined1 *)(param_1 + 0x2d) = local_38;
  *(undefined4 *)((long)param_1 + 0x16c) = local_34;
  std::__cxx11::string::_M_assign((string *)(param_1 + 0x2e),(string *)local_30);
  *(undefined1 *)(param_1 + 0x32) = 0;
  *(undefined4 *)((long)param_1 + 0x194) = 0;
  if (local_30[0] != local_20) {
    operator_delete(local_30[0],local_20[0] + 1);
  }
  if (local_58 != (code *)0x0) {
    (*local_58)(auStack_68,auStack_68,3);
  }
  if (local_88[0] != local_78) {
    operator_delete(local_88[0],local_78[0] + 1);
  }
  if (local_8 - *(long *)PTR___stack_chk_guard_005df758 == 0) {
    return;
  }
                    /* WARNING: Subroutine does not return */
  __stack_chk_fail(PTR___stack_chk_guard_005df758,local_8 - *(long *)PTR___stack_chk_guard_005df758,
                   0);
}


