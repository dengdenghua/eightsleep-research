/* Ghidra static pseudocode; not original source. Read-only project; no target execution. */

undefined4
js_Publish(undefined8 param_1,undefined8 param_2,undefined8 param_3,undefined8 param_4,
          undefined4 param_5,undefined8 param_6,undefined8 param_7)

{
  int iVar1;
  undefined4 uVar2;
  undefined1 auStack_70 [104];
  long local_8;
  
  local_8 = *(long *)PTR___stack_chk_guard_00187fa0;
  natsMsg_init(auStack_70,param_3,param_4,param_5);
  iVar1 = js_PublishMsg(param_1,param_2,auStack_70,param_6,param_7);
  natsMsg_freeHeaders(auStack_70);
  uVar2 = 0;
  if (iVar1 != 0) {
    uVar2 = nats_updateErrStack(iVar1,"js_Publish");
  }
  if (local_8 - *(long *)PTR___stack_chk_guard_00187fa0 == 0) {
    return uVar2;
  }
                    /* WARNING: Subroutine does not return */
  __stack_chk_fail(PTR___stack_chk_guard_00187fa0,local_8 - *(long *)PTR___stack_chk_guard_00187fa0,
                   0);
}


