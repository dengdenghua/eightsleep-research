/* Ghidra static pseudocode; not original source. Read-only project; no target execution. */

ulong natsConnection_Request
                (undefined8 param_1,undefined8 param_2,undefined8 param_3,undefined8 param_4,
                undefined4 param_5,undefined8 param_6)

{
  ulong uVar1;
  undefined1 auStack_70 [104];
  long local_8;
  
  local_8 = *(long *)PTR___stack_chk_guard_00187fa0;
  natsMsg_init(auStack_70,param_3,param_4,param_5);
  uVar1 = natsConnection_RequestMsg(param_1,param_2,auStack_70,param_6);
  if ((int)uVar1 != 0) {
    uVar1 = nats_updateErrStack(uVar1,"natsConnection_Request");
  }
  if (local_8 - *(long *)PTR___stack_chk_guard_00187fa0 == 0) {
    return uVar1 & 0xffffffff;
  }
                    /* WARNING: Subroutine does not return */
  __stack_chk_fail(PTR___stack_chk_guard_00187fa0,uVar1 & 0xffffffff,
                   local_8 - *(long *)PTR___stack_chk_guard_00187fa0,0);
}


