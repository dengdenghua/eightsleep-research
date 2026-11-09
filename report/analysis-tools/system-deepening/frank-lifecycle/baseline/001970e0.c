/* Ghidra static pseudocode; not original source. Read-only project; no target execution. */

undefined8 FUN_001970e0(long *param_1)

{
  int iVar1;
  long lVar2;
  undefined8 uVar3;
  undefined8 uVar4;
  undefined1 auStack_e0 [216];
  long local_8;
  
  local_8 = *(long *)PTR___stack_chk_guard_005df758;
  if (*param_1 == 0) {
    iVar1 = natsConnection_ConnectTo(param_1,"nats://localhost:4222",0,0);
    if (iVar1 != 0) {
      uVar3 = natsStatus_GetText();
      uVar4 = 0;
      FUN_001965f0(PTR_DAT_005df810,0x59,"tryInitJs",
                   "/usr/src/debug/frank/0.1-r0/git/submodules/native-utils/inc/raw_nats_worker.h",
                   "[nats_worker] failed to connect: %s",uVar3);
      nats_PrintLastErrorStack(*(undefined8 *)PTR_stderr_005dff60);
      *param_1 = 0;
      param_1[1] = 0;
      goto LAB_00197120;
    }
    FUN_001965f0(PTR_DAT_005df810,0x62,"tryInitJs",
                 "/usr/src/debug/frank/0.1-r0/git/submodules/native-utils/inc/raw_nats_worker.h",
                 "[nats_worker] successfully connected!");
    lVar2 = param_1[1];
  }
  else {
    lVar2 = param_1[1];
  }
  uVar4 = 1;
  if (lVar2 == 0) {
    uVar4 = 1;
    jsOptions_Init(auStack_e0);
    iVar1 = natsConnection_JetStream(param_1 + 1,*param_1,auStack_e0);
    if (iVar1 == 0) {
      FUN_001965f0(PTR_DAT_005df810,0x76,"tryInitJs",
                   "/usr/src/debug/frank/0.1-r0/git/submodules/native-utils/inc/raw_nats_worker.h",
                   "[nats_worker] successfully connected to jetstream!");
    }
    else {
      uVar3 = natsStatus_GetText();
      uVar4 = 0;
      FUN_001965f0(PTR_DAT_005df810,0x6a,"tryInitJs",
                   "/usr/src/debug/frank/0.1-r0/git/submodules/native-utils/inc/raw_nats_worker.h",
                   "[nats_worker] failed to connect: %s",uVar3);
      nats_PrintLastErrorStack(*(undefined8 *)PTR_stderr_005dff60);
      natsConnection_Flush(*param_1);
      natsConnection_Destroy(*param_1);
      *param_1 = 0;
      param_1[1] = 0;
    }
  }
LAB_00197120:
  if (local_8 - *(long *)PTR___stack_chk_guard_005df758 != 0) {
                    /* WARNING: Subroutine does not return */
    __stack_chk_fail(PTR___stack_chk_guard_005df758,
                     local_8 - *(long *)PTR___stack_chk_guard_005df758,0);
  }
  return uVar4;
}


