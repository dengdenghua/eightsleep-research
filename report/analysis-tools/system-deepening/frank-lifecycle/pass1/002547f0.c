/* Ghidra static pseudocode; not original source. Read-only project; no target execution. */

void FUN_002547f0(long param_1)

{
  undefined8 local_10;
  long local_8;
  
  local_8 = *(long *)PTR___stack_chk_guard_005df758;
  *(undefined1 *)(param_1 + 0x310) = 0;
  local_10 = 1;
  write(*(int *)(param_1 + 8),&local_10,8);
  if (local_8 - *(long *)PTR___stack_chk_guard_005df758 == 0) {
    return;
  }
                    /* WARNING: Subroutine does not return */
  __stack_chk_fail(PTR___stack_chk_guard_005df758,local_8 - *(long *)PTR___stack_chk_guard_005df758,
                   0);
}


