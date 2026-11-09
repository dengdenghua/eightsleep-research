/* Ghidra static pseudocode; not original source. Read-only project; no target execution. */

void FUN_00120264(undefined8 param_1,long param_2)

{
  int iVar1;
  undefined8 uVar2;
  char *pcVar3;
  long lVar4;
  undefined8 local_48;
  undefined8 uStack_40;
  undefined8 local_38;
  undefined8 uStack_30;
  undefined8 local_28;
  undefined8 uStack_20;
  undefined8 local_18;
  undefined8 uStack_10;
  long local_8;
  
  pcVar3 = *(char **)(param_2 + 8);
  local_8 = *(long *)PTR___stack_chk_guard_00187fa0;
  local_48 = 0;
  uStack_40 = 0;
  local_38 = 0;
  uStack_30 = 0;
  local_28 = 0;
  uStack_20 = 0;
  local_18 = 0;
  uStack_10 = 0;
  if ((((pcVar3 == (char *)0x0) || (*pcVar3 == '\0')) ||
      (uVar2 = natsMsgHeader_Set(param_1,"Nats-Msg-Id",pcVar3,0), (int)uVar2 == 0)) &&
     (((*(char **)(param_2 + 0x18) == (char *)0x0 || (**(char **)(param_2 + 0x18) == '\0')) ||
      (uVar2 = natsMsgHeader_Set(param_1,"Nats-Expected-Last-Msg-Id"), (int)uVar2 == 0)))) {
    if ((*(char **)(param_2 + 0x10) == (char *)0x0) || (**(char **)(param_2 + 0x10) == '\0')) {
      lVar4 = *(long *)(param_2 + 0x20);
    }
    else {
      uVar2 = natsMsgHeader_Set(param_1,"Nats-Expected-Stream");
      if ((int)uVar2 != 0) goto LAB_00120390;
      lVar4 = *(long *)(param_2 + 0x20);
    }
    if (lVar4 != 0) {
      __snprintf_chk(&local_48,0x40,1,0x40,&DAT_00161158);
      uVar2 = natsMsgHeader_Set(param_1,"Nats-Expected-Last-Sequence",&local_48);
      if ((int)uVar2 != 0) goto LAB_00120390;
    }
    if (*(char *)(param_2 + 0x30) == '\0') {
      if (*(long *)(param_2 + 0x28) != 0) {
        __snprintf_chk(&local_48,0x40,1,0x40,&DAT_00161158);
        uVar2 = natsMsgHeader_Set(param_1,"Nats-Expected-Last-Subject-Sequence",&local_48);
        iVar1 = (int)uVar2;
        goto joined_r0x001203fc;
      }
    }
    else {
      uVar2 = natsMsgHeader_Set(param_1,"Nats-Expected-Last-Subject-Sequence",&DAT_00161180);
      iVar1 = (int)uVar2;
joined_r0x001203fc:
      if (iVar1 != 0) goto LAB_00120390;
    }
    lVar4 = *(long *)(param_2 + 0x38);
    if (lVar4 != 0) {
      if (lVar4 < 0) {
        uVar2 = nats_setErrorReal("/home/ubuntu/src/frankenfirmware/build/_deps/nats.c-src/src/js.c"
                                  ,"_setHeadersFromOptions",0x1e9,0x10,
                                  "option \'MsgTTL\' (%ld) cannot be negative");
        iVar1 = (int)uVar2;
      }
      else {
        uVar2 = nats_formatDuration(&local_48,lVar4 * 1000000);
        uVar2 = natsMsgHeader_Set(param_1,"Nats-TTL",uVar2);
        iVar1 = (int)uVar2;
      }
      if (iVar1 != 0) goto LAB_00120390;
    }
    uVar2 = 0;
  }
  else {
LAB_00120390:
    uVar2 = nats_updateErrStack(uVar2,"_setHeadersFromOptions");
  }
  if (local_8 - *(long *)PTR___stack_chk_guard_00187fa0 != 0) {
                    /* WARNING: Subroutine does not return */
    __stack_chk_fail(uVar2,PTR___stack_chk_guard_00187fa0,
                     local_8 - *(long *)PTR___stack_chk_guard_00187fa0,0);
  }
  return;
}


