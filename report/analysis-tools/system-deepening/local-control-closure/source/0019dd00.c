/* Ghidra static pseudocode; not original source. */

void FUN_0019dd00(long param_1,undefined4 *param_2)

{
  long lVar1;
  undefined4 *__dest;
  undefined4 *puVar2;
  undefined4 *__src;
  undefined8 uVar3;
  undefined8 uVar4;
  size_t __n;
  long lVar5;
  undefined8 uVar6;
  long *plVar7;
  code *pcVar8;
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
  
  lVar1 = param_1 + 0x40;
  puVar2 = param_2 + 8;
  local_8 = *(long *)PTR___stack_chk_guard_005df758;
  *(undefined4 *)(param_1 + 0x30) = *param_2;
  *(undefined4 *)(param_1 + 0x34) = param_2[1];
  *(undefined1 *)(param_1 + 0x38) = *(undefined1 *)(param_2 + 2);
  __src = *(undefined4 **)(param_2 + 4);
  *(undefined4 *)(param_1 + 0x3c) = param_2[3];
  __dest = *(undefined4 **)(param_1 + 0x40);
  if (__src == puVar2) {
    __n = *(size_t *)(param_2 + 6);
    lVar5 = 0;
    if (__n != 0) {
      if (__n == 1) {
        *(undefined1 *)__dest = *(undefined1 *)(param_2 + 8);
        lVar5 = *(long *)(param_2 + 6);
        __dest = *(undefined4 **)(param_1 + 0x40);
      }
      else {
        memcpy(__dest,__src,__n);
        lVar5 = *(long *)(param_2 + 6);
        __dest = *(undefined4 **)(param_1 + 0x40);
      }
    }
    *(long *)(param_1 + 0x48) = lVar5;
    *(undefined1 *)((long)__dest + lVar5) = 0;
    puVar2 = *(undefined4 **)(param_2 + 4);
  }
  else {
    uVar6 = *(undefined8 *)(param_2 + 6);
    if (__dest == (undefined4 *)(param_1 + 0x50)) {
      *(undefined4 **)(param_1 + 0x40) = __src;
      *(undefined8 *)(param_1 + 0x48) = uVar6;
      *(undefined8 *)(param_1 + 0x50) = *(undefined8 *)(param_2 + 8);
    }
    else {
      uVar4 = *(undefined8 *)(param_1 + 0x50);
      *(undefined4 **)(param_1 + 0x40) = __src;
      *(undefined8 *)(param_1 + 0x48) = uVar6;
      *(undefined8 *)(param_1 + 0x50) = *(undefined8 *)(param_2 + 8);
      if (__dest != (undefined4 *)0x0) {
        *(undefined4 **)(param_2 + 4) = __dest;
        *(undefined8 *)(param_2 + 8) = uVar4;
        puVar2 = __dest;
        goto LAB_0019ddac;
      }
    }
    *(undefined4 **)(param_2 + 4) = puVar2;
  }
LAB_0019ddac:
  *(undefined8 *)(param_2 + 6) = 0;
  *(undefined1 *)puVar2 = 0;
  plVar7 = *(long **)(param_1 + 0x198);
  local_90 = *(undefined1 *)(param_1 + 0x38);
  local_8c = *(undefined4 *)(param_1 + 0x3c);
  local_98 = *(undefined8 *)(param_1 + 0x30);
  pcVar8 = *(code **)(*plVar7 + 0x10);
  FUN_00198030(local_88,lVar1);
  (*pcVar8)(auStack_68,plVar7,&local_98);
  FUN_00198200(&local_b8,auStack_68);
  pcVar8 = *(code **)(param_1 + 0x1c0);
  *(code **)(param_1 + 0x1c0) = local_a8;
  uVar6 = *(undefined8 *)(param_1 + 0x1b0);
  uVar4 = *(undefined8 *)(param_1 + 0x1b8);
  uVar3 = *(undefined8 *)(param_1 + 0x1c8);
  *(undefined8 *)(param_1 + 0x1b0) = local_b8;
  *(undefined8 *)(param_1 + 0x1b8) = uStack_b0;
  *(undefined8 *)(param_1 + 0x1c8) = uStack_a0;
  local_b8 = uVar6;
  uStack_b0 = uVar4;
  local_a8 = pcVar8;
  uStack_a0 = uVar3;
  if (pcVar8 != (code *)0x0) {
    (*pcVar8)(&local_b8,&local_b8,3);
  }
  *(undefined8 *)(param_1 + 0x1d8) = local_40;
  *(undefined1 *)(param_1 + 0x1e0) = local_38;
  *(undefined4 *)(param_1 + 0x1e4) = local_34;
  std::__cxx11::string::_M_assign((string *)(param_1 + 0x1e8),(string *)local_30);
  *(undefined1 *)(param_1 + 0x208) = 0;
  *(undefined4 *)(param_1 + 0x20c) = 0;
  if (local_30[0] != local_20) {
    operator_delete(local_30[0],local_20[0] + 1);
  }
  if (local_58 != (code *)0x0) {
    (*local_58)(auStack_68,auStack_68,3);
  }
  if (local_88[0] != local_78) {
    operator_delete(local_88[0],local_78[0] + 1);
  }
  plVar7 = *(long **)(param_1 + 0x1a0);
  local_90 = *(undefined1 *)(param_1 + 0x38);
  local_8c = *(undefined4 *)(param_1 + 0x3c);
  local_98 = *(undefined8 *)(param_1 + 0x30);
  pcVar8 = *(code **)(*plVar7 + 0x10);
  FUN_00198030(local_88,lVar1);
  (*pcVar8)(auStack_68,plVar7,&local_98);
  FUN_00198200(&local_b8,auStack_68);
  uVar6 = *(undefined8 *)(param_1 + 0x210);
  uVar4 = *(undefined8 *)(param_1 + 0x218);
  *(undefined8 *)(param_1 + 0x210) = local_b8;
  *(undefined8 *)(param_1 + 0x218) = uStack_b0;
  pcVar8 = *(code **)(param_1 + 0x220);
  *(code **)(param_1 + 0x220) = local_a8;
  uVar3 = *(undefined8 *)(param_1 + 0x228);
  *(undefined8 *)(param_1 + 0x228) = uStack_a0;
  local_b8 = uVar6;
  uStack_b0 = uVar4;
  local_a8 = pcVar8;
  uStack_a0 = uVar3;
  if (pcVar8 != (code *)0x0) {
    (*pcVar8)(&local_b8,&local_b8,3);
  }
  *(undefined8 *)(param_1 + 0x238) = local_40;
  *(undefined1 *)(param_1 + 0x240) = local_38;
  *(undefined4 *)(param_1 + 0x244) = local_34;
  std::__cxx11::string::_M_assign((string *)(param_1 + 0x248),(string *)local_30);
  *(undefined1 *)(param_1 + 0x268) = 0;
  *(undefined4 *)(param_1 + 0x26c) = 0;
  if (local_30[0] != local_20) {
    operator_delete(local_30[0],local_20[0] + 1);
  }
  if (local_58 != (code *)0x0) {
    (*local_58)(auStack_68,auStack_68,3);
  }
  if (local_88[0] != local_78) {
    operator_delete(local_88[0],local_78[0] + 1);
  }
  plVar7 = *(long **)(param_1 + 0x1a8);
  local_90 = *(undefined1 *)(param_1 + 0x38);
  local_8c = *(undefined4 *)(param_1 + 0x3c);
  local_98 = *(undefined8 *)(param_1 + 0x30);
  pcVar8 = *(code **)(*plVar7 + 0x10);
  FUN_00198030(local_88,lVar1);
  (*pcVar8)(auStack_68,plVar7,&local_98);
  FUN_00198200(&local_b8,auStack_68);
  uVar6 = *(undefined8 *)(param_1 + 0x270);
  uVar4 = *(undefined8 *)(param_1 + 0x278);
  *(undefined8 *)(param_1 + 0x270) = local_b8;
  *(undefined8 *)(param_1 + 0x278) = uStack_b0;
  pcVar8 = *(code **)(param_1 + 0x280);
  *(code **)(param_1 + 0x280) = local_a8;
  uVar3 = *(undefined8 *)(param_1 + 0x288);
  *(undefined8 *)(param_1 + 0x288) = uStack_a0;
  local_b8 = uVar6;
  uStack_b0 = uVar4;
  local_a8 = pcVar8;
  uStack_a0 = uVar3;
  if (pcVar8 != (code *)0x0) {
    (*pcVar8)(&local_b8,&local_b8,3);
  }
  *(undefined8 *)(param_1 + 0x298) = local_40;
  *(undefined1 *)(param_1 + 0x2a0) = local_38;
  *(undefined4 *)(param_1 + 0x2a4) = local_34;
  std::__cxx11::string::_M_assign((string *)(param_1 + 0x2a8),(string *)local_30);
  *(undefined1 *)(param_1 + 0x2c8) = 0;
  *(undefined4 *)(param_1 + 0x2cc) = 0;
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


