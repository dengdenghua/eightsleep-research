/* Ghidra static pseudocode; not original source. Read-only project; no target execution. */

long * FUN_0019faa0(long *param_1,undefined8 *param_2)

{
  bool bVar1;
  ulong uVar2;
  long lVar3;
  undefined8 *puVar4;
  long *plVar5;
  ulong uVar6;
  int iVar7;
  int iVar8;
  long *local_88 [2];
  long local_78 [2];
  long *local_68;
  long local_60;
  long local_58;
  undefined8 uStack_50;
  long *local_48;
  undefined8 local_40;
  long local_38;
  undefined8 uStack_30;
  long *local_28;
  long local_20;
  long local_18;
  undefined8 uStack_10;
  long local_8;
  
  local_8 = *(long *)PTR___stack_chk_guard_005df758;
  lVar3 = std::chrono::_V2::system_clock::now();
  uVar2 = -(lVar3 / 1000000);
  if (-1000000 < lVar3) {
    uVar2 = lVar3 / 1000000;
  }
  if (uVar2 < 10) {
    iVar8 = 1;
  }
  else if (uVar2 < 100) {
    iVar8 = 2;
  }
  else if (uVar2 < 1000) {
    iVar8 = 3;
  }
  else if (uVar2 < 10000) {
    iVar8 = 4;
  }
  else {
    uVar6 = uVar2;
    iVar8 = 1;
    do {
      iVar7 = iVar8;
      iVar8 = iVar7 + 4;
      if (uVar6 < 100000) goto LAB_0019fba4;
      if (uVar6 < 1000000) {
        iVar8 = iVar7 + 5;
        goto LAB_0019fba4;
      }
      if (uVar6 < 10000000) {
        iVar8 = iVar7 + 6;
        goto LAB_0019fba4;
      }
      bVar1 = 99999999 < uVar6;
      uVar6 = uVar6 / 10000;
    } while (bVar1);
    iVar8 = iVar7 + 7;
  }
LAB_0019fba4:
  local_88[0] = local_78;
  std::__cxx11::string::_M_construct
            ((string *)local_88,(ulong)((uint)(lVar3 < -999999) + iVar8),'-');
  FUN_001973f0((long)local_88[0] + (ulong)(lVar3 < -999999),iVar8,uVar2);
  puVar4 = (undefined8 *)
           std::__cxx11::string::_M_replace((string *)local_88,0,0,"{\"v\":1,\"ts\":",0xc);
  if ((long *)*puVar4 == puVar4 + 2) {
    local_58 = puVar4[2];
    uStack_50 = puVar4[3];
    local_68 = &local_58;
  }
  else {
    local_58 = puVar4[2];
    local_68 = (long *)*puVar4;
  }
  local_60 = puVar4[1];
  *puVar4 = puVar4 + 2;
  puVar4[1] = 0;
  *(undefined1 *)(puVar4 + 2) = 0;
  if (0x7fffffffffffffffU - local_60 < 0xb) {
                    /* WARNING: Subroutine does not return */
    std::__throw_length_error("basic_string::append");
  }
  puVar4 = (undefined8 *)std::__cxx11::string::_M_append((string *)&local_68,",\"payload\":",0xb);
  if ((long *)*puVar4 == puVar4 + 2) {
    local_38 = puVar4[2];
    uStack_30 = puVar4[3];
    local_48 = &local_38;
  }
  else {
    local_38 = puVar4[2];
    local_48 = (long *)*puVar4;
  }
  local_40 = puVar4[1];
  *puVar4 = puVar4 + 2;
  puVar4[1] = 0;
  *(undefined1 *)(puVar4 + 2) = 0;
  puVar4 = (undefined8 *)
           std::__cxx11::string::_M_append((string *)&local_48,(char *)*param_2,param_2[1]);
  if ((long *)*puVar4 == puVar4 + 2) {
    local_18 = puVar4[2];
    uStack_10 = puVar4[3];
    local_28 = &local_18;
  }
  else {
    local_18 = puVar4[2];
    local_28 = (long *)*puVar4;
  }
  local_20 = puVar4[1];
  *puVar4 = puVar4 + 2;
  puVar4[1] = 0;
  *(undefined1 *)(puVar4 + 2) = 0;
  if (local_20 != 0x7fffffffffffffff) {
    plVar5 = (long *)std::__cxx11::string::_M_append((string *)&local_28,"}",1);
    *param_1 = (long)(param_1 + 2);
    if ((long *)*plVar5 == plVar5 + 2) {
      lVar3 = plVar5[3];
      param_1[2] = plVar5[2];
      param_1[3] = lVar3;
    }
    else {
      lVar3 = plVar5[2];
      *param_1 = *plVar5;
      param_1[2] = lVar3;
    }
    *plVar5 = (long)(plVar5 + 2);
    param_1[1] = plVar5[1];
    plVar5[1] = 0;
    *(undefined1 *)(plVar5 + 2) = 0;
    if (local_28 != &local_18) {
      operator_delete(local_28,local_18 + 1);
    }
    if (local_48 != &local_38) {
      operator_delete(local_48,local_38 + 1);
    }
    if (local_68 != &local_58) {
      operator_delete(local_68,local_58 + 1);
    }
    if (local_88[0] != local_78) {
      operator_delete(local_88[0],local_78[0] + 1);
    }
    if (local_8 - *(long *)PTR___stack_chk_guard_005df758 == 0) {
      return param_1;
    }
                    /* WARNING: Subroutine does not return */
    __stack_chk_fail(PTR___stack_chk_guard_005df758,
                     local_8 - *(long *)PTR___stack_chk_guard_005df758,0);
  }
                    /* WARNING: Subroutine does not return */
  std::__throw_length_error("basic_string::append");
}


