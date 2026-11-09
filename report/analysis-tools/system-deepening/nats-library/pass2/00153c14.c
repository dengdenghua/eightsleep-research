/* Ghidra static pseudocode; not original source. Read-only project; no target execution. */

ulong nats_JSONGetBool(undefined8 param_1,undefined8 param_2,undefined1 *param_3)

{
  undefined1 uVar1;
  ulong uVar2;
  long local_10;
  long local_8;
  
  local_8 = *(long *)PTR___stack_chk_guard_00187fa0;
  local_10 = 0;
  uVar2 = nats_JSONGetField(param_1,param_2,2,&local_10,PTR___stack_chk_guard_00187fa0,0);
  if ((int)uVar2 == 0) {
    uVar1 = 0;
    if (local_10 != 0) {
      uVar1 = *(undefined1 *)(local_10 + 0x10);
    }
    *param_3 = uVar1;
  }
  else {
    uVar2 = nats_updateErrStack(uVar2,"nats_JSONGetBool");
  }
  if (local_8 - *(long *)PTR___stack_chk_guard_00187fa0 == 0) {
    return uVar2 & 0xffffffff;
  }
                    /* WARNING: Subroutine does not return */
  __stack_chk_fail(PTR___stack_chk_guard_00187fa0,uVar2 & 0xffffffff,
                   local_8 - *(long *)PTR___stack_chk_guard_00187fa0,0);
}


