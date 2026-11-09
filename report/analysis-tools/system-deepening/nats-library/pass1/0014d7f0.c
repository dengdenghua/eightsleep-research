/* Ghidra static pseudocode; not original source. Read-only project; no target execution. */

undefined4
natsConnection_RequestMsg(undefined8 *param_1,undefined8 *param_2,long param_3,undefined8 param_4)

{
  char cVar1;
  int iVar2;
  undefined4 uVar3;
  int iVar4;
  undefined8 uVar5;
  undefined1 *__ptr;
  long lVar6;
  char local_71;
  undefined8 *local_70;
  undefined8 local_68;
  void *local_60;
  undefined1 auStack_58 [80];
  long local_8;
  
  local_8 = *(long *)PTR___stack_chk_guard_00187fa0;
  local_70 = (undefined8 *)0x0;
  if ((param_2 == (undefined8 *)0x0 || param_3 == 0) || param_1 == (undefined8 *)0x0) {
    uVar5 = natsStatus_GetText(0x10,0);
    uVar3 = nats_setErrorReal("/home/ubuntu/src/frankenfirmware/build/_deps/nats.c-src/src/pub.c",
                              "natsConnection_RequestMsg",0x1b8,0x10,"%s",uVar5);
    goto LAB_0014d964;
  }
  uVar5 = *param_2;
  *param_1 = 0;
  natsMutex_Lock(uVar5);
  cVar1 = natsConn_isClosed(param_2);
  if (cVar1 != '\0') {
    natsMutex_Unlock(*param_2);
    uVar5 = natsStatus_GetText(5);
    uVar3 = nats_setErrorReal("/home/ubuntu/src/frankenfirmware/build/_deps/nats.c-src/src/pub.c",
                              "natsConnection_RequestMsg",0x1c0,5,"%s",uVar5);
    goto LAB_0014d964;
  }
  if (*(char *)(param_2[1] + 0x168) != '\0') {
    natsMutex_Unlock(*param_2);
    local_71 = '\0';
    local_68 = 0;
    local_60 = (void *)0x0;
    iVar2 = natsConn_initInbox(param_2,auStack_58,0x37,&local_60,&local_71);
    if ((((iVar2 == 0) &&
         (iVar2 = natsConn_subscribeImpl(&local_68,param_2,1,local_60,0,0,0,0,1,0), iVar2 == 0)) &&
        (iVar2 = natsSubscription_AutoUnsubscribe(local_68,1), iVar2 == 0)) &&
       (iVar2 = natsConn_publish(param_2,param_3,local_60,1), iVar2 == 0)) {
      iVar2 = natsSubscription_NextMsg(param_1,local_68,param_4);
      if (local_71 != '\0') goto LAB_0014dacc;
LAB_0014dad4:
      natsSubscription_Destroy(local_68);
      uVar3 = 0;
      if (iVar2 == 0) goto LAB_0014d964;
    }
    else {
      if (local_71 != '\0') {
LAB_0014dacc:
        free(local_60);
        goto LAB_0014dad4;
      }
      natsSubscription_Destroy(local_68);
    }
    uVar3 = nats_updateErrStack(iVar2,"_oldRequestMsg");
    goto LAB_0014d964;
  }
  if (*(int *)(param_2 + 0x6f) < 0x21) {
    __ptr = auStack_58;
  }
  else {
    __ptr = malloc((long)(*(int *)(param_2 + 0x6f) + 0x2a));
    if (__ptr == (undefined1 *)0x0) {
      natsMutex_Unlock(*param_2);
      uVar5 = natsStatus_GetText(0x18);
      uVar3 = nats_setErrorReal("/home/ubuntu/src/frankenfirmware/build/_deps/nats.c-src/src/pub.c",
                                "natsConnection_RequestMsg",0x1d0,0x18,"%s",uVar5);
      goto LAB_0014d964;
    }
  }
  natsConn_retain(param_2);
  if ((param_2[0x6a] == 0) && (iVar2 = natsConn_initResp(param_2,FUN_0014c7a0), iVar2 != 0)) {
    natsMutex_Unlock(*param_2);
LAB_0014d8cc:
    natsMutex_Lock(*param_2);
    if (param_2[0x6b] != 0) {
      natsStrHash_Remove(param_2[0x6b],__ptr + *(int *)((long)param_2 + 0x37c));
    }
    natsMutex_Unlock(*param_2);
  }
  else {
    iVar2 = natsConn_addRespInfo(&local_70,param_2,__ptr);
    natsMutex_Unlock(*param_2);
    if ((iVar2 != 0) || (iVar2 = natsConn_publish(param_2,param_3,__ptr,1), iVar2 != 0))
    goto LAB_0014d8cc;
    natsMutex_Lock(*local_70);
    do {
      lVar6 = local_70[2];
      if (lVar6 != 0) goto LAB_0014db30;
      if (*(char *)(local_70 + 3) != '\0') goto LAB_0014dc30;
      iVar4 = natsCondition_TimedWait(local_70[1],*local_70,param_4);
    } while (iVar4 != 0x1a);
    lVar6 = local_70[2];
    if (lVar6 == 0) {
      iVar2 = 0x1a;
      if (*(char *)(local_70 + 3) != '\0') {
LAB_0014dc30:
        iVar2 = *(int *)((long)local_70 + 0x1c);
      }
    }
    else {
LAB_0014db30:
      cVar1 = natsMsg_IsNoResponders(lVar6);
      if (cVar1 == '\0') {
        *param_1 = local_70[2];
      }
      else {
        iVar2 = 0x22;
        natsMsg_Destroy(local_70[2]);
      }
    }
    cVar1 = *(char *)(local_70 + 4);
    local_70[2] = 0;
    *(undefined1 *)(local_70 + 4) = 1;
    natsMutex_Unlock(*local_70);
    if (cVar1 == '\0') goto LAB_0014d8cc;
  }
  natsConn_disposeRespInfo(param_2,local_70,1);
  natsConn_release(param_2);
  if (__ptr != auStack_58) {
    free(__ptr);
  }
  uVar3 = 0;
  if (iVar2 != 0) {
    uVar3 = nats_updateErrStack(iVar2,"natsConnection_RequestMsg");
  }
LAB_0014d964:
  if (local_8 - *(long *)PTR___stack_chk_guard_00187fa0 == 0) {
    return uVar3;
  }
                    /* WARNING: Subroutine does not return */
  __stack_chk_fail(local_8 - *(long *)PTR___stack_chk_guard_00187fa0,PTR___stack_chk_guard_00187fa0,
                   0);
}


