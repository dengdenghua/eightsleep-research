/* Ghidra static pseudocode; not original source. Read-only project; no target execution. */

ulong nats_JSONGetULong(undefined8 param_1,undefined8 param_2,undefined8 *param_3)

{
  ulong uVar1;
  undefined8 uVar2;
  long local_10;
  long local_8;
  
  local_8 = *(long *)PTR___stack_chk_guard_00187fa0;
  local_10 = 0;
  uVar1 = nats_JSONGetField(param_1,param_2,5,&local_10,PTR___stack_chk_guard_00187fa0,0);
  if ((int)uVar1 == 0) {
    uVar1 = uVar1 & 0xffffffff;
    if (local_10 == 0) {
      *param_3 = 0;
    }
    else if ((*(int *)(local_10 + 0x20) == 4) || (*(int *)(local_10 + 0x20) == 5)) {
      *param_3 = *(undefined8 *)(local_10 + 0x10);
    }
    else {
      uVar2 = FUN_0015f5f0(*(undefined8 *)(local_10 + 0x10));
      *param_3 = uVar2;
    }
  }
  else {
    uVar1 = nats_updateErrStack(uVar1,"nats_JSONGetULong");
    uVar1 = uVar1 & 0xffffffff;
  }
  if (local_8 - *(long *)PTR___stack_chk_guard_00187fa0 == 0) {
    return uVar1;
  }
                    /* WARNING: Subroutine does not return */
  __stack_chk_fail(PTR___stack_chk_guard_00187fa0,local_8 - *(long *)PTR___stack_chk_guard_00187fa0,
                   0);
}


