/* Ghidra static pseudocode; not original source. */

void FUN_0019a6d0(long param_1)

{
  uint uVar1;
  undefined1 uVar2;
  int iVar3;
  uint uVar4;
  long *plVar5;
  code *pcVar6;
  long *local_28 [2];
  long local_18 [2];
  long local_8;
  
  local_8 = *(long *)PTR___stack_chk_guard_005df758;
  if (*(long *)(param_1 + 0x10) == 0) {
                    /* WARNING: Subroutine does not return */
    std::__throw_bad_function_call();
  }
  uVar4 = (**(code **)(param_1 + 0x18))();
  uVar1 = *(uint *)(param_1 + 0x28);
  if (((uVar4 < uVar1) || (uVar4 < *(uint *)(param_1 + 0x34))) ||
     (iVar3 = (uVar1 + *(int *)(param_1 + 0x2c)) - uVar4, iVar3 < 1)) {
    if (*(char *)(param_1 + 0x58) == '\0') {
      plVar5 = *(long **)(param_1 + 0x20);
      uVar2 = *(undefined1 *)(param_1 + 0x30);
      pcVar6 = *(code **)(*plVar5 + 0x10);
      FUN_00198030(local_28,param_1 + 0x38);
      (*pcVar6)(plVar5,uVar2,local_28,0);
      FUN_001998f0(local_28);
      *(undefined1 *)(param_1 + 0x58) = 1;
    }
  }
  else if (*(uint *)(param_1 + 0x5c) != uVar1) {
    plVar5 = *(long **)(param_1 + 0x20);
    uVar2 = *(undefined1 *)(param_1 + 0x30);
    pcVar6 = *(code **)(*plVar5 + 0x10);
    FUN_00198030(local_28,param_1 + 0x38);
    (*pcVar6)(plVar5,uVar2,local_28,iVar3);
    if (local_28[0] != local_18) {
      operator_delete(local_28[0],local_18[0] + 1);
    }
    *(undefined4 *)(param_1 + 0x5c) = *(undefined4 *)(param_1 + 0x28);
  }
  if (local_8 - *(long *)PTR___stack_chk_guard_005df758 == 0) {
    return;
  }
                    /* WARNING: Subroutine does not return */
  __stack_chk_fail(PTR___stack_chk_guard_005df758,local_8 - *(long *)PTR___stack_chk_guard_005df758,
                   0);
}


