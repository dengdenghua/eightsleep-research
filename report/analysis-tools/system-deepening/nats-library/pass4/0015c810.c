/* Ghidra static pseudocode; not original source. Read-only project; no target execution. */

void natsCondition_TimedWait(pthread_cond_t *param_1,pthread_mutex_t *param_2,long param_3)

{
  int iVar1;
  long lVar2;
  undefined8 uVar3;
  int *piVar4;
  timespec local_18;
  long local_8;
  
  local_8 = *(long *)PTR___stack_chk_guard_00187fa0;
  if (0 < param_3) {
    lVar2 = nats_setTargetTime(param_3);
    local_18.tv_sec = lVar2 / 1000;
    local_18.tv_nsec = (lVar2 % 1000) * 1000000;
    iVar1 = pthread_cond_timedwait(param_1,param_2,&local_18);
    uVar3 = 0;
    if (iVar1 == 0) goto LAB_0015c8e0;
    if (iVar1 != 0x6e) {
      piVar4 = __errno_location();
      uVar3 = nats_setErrorReal("/home/ubuntu/src/frankenfirmware/build/_deps/nats.c-src/src/unix/cond.c"
                                ,"_timedWait",0x4d,0x19,"pthread_cond_timedwait error: %d",*piVar4);
      goto LAB_0015c8e0;
    }
  }
  uVar3 = 0x1a;
LAB_0015c8e0:
  if (local_8 - *(long *)PTR___stack_chk_guard_00187fa0 == 0) {
    return;
  }
                    /* WARNING: Subroutine does not return */
  __stack_chk_fail(uVar3,PTR___stack_chk_guard_00187fa0,
                   local_8 - *(long *)PTR___stack_chk_guard_00187fa0,0);
}


