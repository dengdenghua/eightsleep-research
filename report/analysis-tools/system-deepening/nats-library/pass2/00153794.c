/* Ghidra static pseudocode; not original source. Read-only project; no target execution. */

ulong nats_JSONGetStr(undefined8 param_1,undefined8 param_2,undefined8 *param_3)

{
  ulong uVar1;
  char *pcVar2;
  undefined8 uVar3;
  long local_10;
  long local_8;
  
  local_8 = *(long *)PTR___stack_chk_guard_00187fa0;
  local_10 = 0;
  uVar1 = nats_JSONGetField(param_1,param_2,1,&local_10,PTR___stack_chk_guard_00187fa0,0);
  if ((int)uVar1 == 0) {
    uVar1 = uVar1 & 0xffffffff;
    if ((local_10 == 0) || (*(char **)(local_10 + 0x10) == (char *)0x0)) {
      *param_3 = 0;
    }
    else {
      pcVar2 = strdup(*(char **)(local_10 + 0x10));
      if (pcVar2 == (char *)0x0) {
        uVar3 = natsStatus_GetText(0x18);
        uVar1 = nats_setErrorReal("/home/ubuntu/src/frankenfirmware/build/_deps/nats.c-src/src/util.c"
                                  ,"nats_JSONGetStr",0x4a4,0x18,"%s",uVar3);
        uVar1 = uVar1 & 0xffffffff;
      }
      else {
        *param_3 = pcVar2;
      }
    }
  }
  else {
    uVar1 = nats_updateErrStack(uVar1,"nats_JSONGetStr");
    uVar1 = uVar1 & 0xffffffff;
  }
  if (local_8 - *(long *)PTR___stack_chk_guard_00187fa0 == 0) {
    return uVar1;
  }
                    /* WARNING: Subroutine does not return */
  __stack_chk_fail(PTR___stack_chk_guard_00187fa0,local_8 - *(long *)PTR___stack_chk_guard_00187fa0,
                   0);
}


