/* Ghidra static pseudocode; not original source. Read-only project; no target execution. */

undefined4 js_PublishMsg(undefined8 *param_1,long param_2,long param_3,long *param_4,uint *param_5)

{
  int iVar1;
  undefined4 uVar2;
  undefined8 uVar3;
  void *pvVar4;
  long lVar5;
  undefined8 local_30;
  undefined8 local_28;
  undefined8 local_20;
  undefined4 local_18;
  ushort uStack_14;
  undefined8 local_10;
  long local_8;
  
  local_8 = *(long *)PTR___stack_chk_guard_00187fa0;
  local_30 = 0;
  local_28 = 0;
  local_20 = 0;
  local_18 = 0;
  uStack_14 = 0;
  local_10 = 0;
  if (param_5 != (uint *)0x0) {
    *param_5 = 0;
  }
  if (((param_2 == 0 || param_3 == 0) || (*(char **)(param_3 + 0x10) == (char *)0x0)) ||
     (**(char **)(param_3 + 0x10) == '\0')) {
    uVar3 = natsStatus_GetText(0x10);
    uVar2 = nats_setErrorReal("/home/ubuntu/src/frankenfirmware/build/_deps/nats.c-src/src/js.c",
                              "js_PublishMsg",0x20b,0x10,"%s",uVar3);
    goto LAB_001226e0;
  }
  if (param_4 == (long *)0x0) {
LAB_00122758:
    lVar5 = *(long *)(param_2 + 0x20);
  }
  else {
    lVar5 = *param_4;
    if (lVar5 < 0) {
      uVar3 = nats_setErrorReal("/home/ubuntu/src/frankenfirmware/build/_deps/nats.c-src/src/js.c",
                                "_checkMaxWaitOpt",0x1f7,0x10,
                                "option \'MaxWait\' (%ld) cannot be negative",lVar5);
      if (((int)uVar3 != 0) || (uVar3 = FUN_00120264(param_3,param_4), (int)uVar3 != 0))
      goto LAB_001228e0;
      goto LAB_00122758;
    }
    uVar3 = FUN_00120264(param_3,param_4);
    if ((int)uVar3 != 0) {
LAB_001228e0:
      uVar2 = nats_updateErrStack(uVar3,"js_PublishMsg");
      goto LAB_001226e0;
    }
    if (lVar5 == 0) goto LAB_00122758;
  }
  iVar1 = natsConnection_RequestMsg(&local_28,*(undefined8 *)(param_2 + 8),param_3,lVar5);
  if (iVar1 == 0x22 && param_5 != (uint *)0x0) {
    *param_5 = 0x275c;
    iVar1 = 0x22;
    natsMsg_Destroy(local_28);
  }
  else {
    if (iVar1 == 0) {
      iVar1 = js_unmarshalResponse(&local_20,&local_30,local_28);
      if (iVar1 == 0) {
        if (CONCAT24(uStack_14,local_18) == 0) {
          if (param_1 != (undefined8 *)0x0) {
            pvVar4 = calloc(1,0x20);
            if (pvVar4 == (void *)0x0) {
              uVar3 = natsStatus_GetText(0x18);
              iVar1 = nats_setErrorReal("/home/ubuntu/src/frankenfirmware/build/_deps/nats.c-src/src/js.c"
                                        ,"js_PublishMsg",0x231,0x18,"%s",uVar3);
              goto LAB_001227e0;
            }
            iVar1 = nats_JSONGetStr(local_30,"stream",pvVar4);
            if (((iVar1 != 0) ||
                (iVar1 = nats_JSONGetULong(local_30,&DAT_001615d0,(long)pvVar4 + 8), iVar1 != 0)) ||
               ((iVar1 = nats_JSONGetBool(local_30,"duplicate",(long)pvVar4 + 0x18), iVar1 != 0 ||
                (iVar1 = nats_JSONGetStr(local_30,"domain",(long)pvVar4 + 0x10), iVar1 != 0)))) {
              jsPubAck_Destroy(pvVar4);
              js_freeApiRespContent(&local_20);
              nats_JSONDestroy(local_30);
              natsMsg_Destroy(local_28);
              goto LAB_0012268c;
            }
            *param_1 = pvVar4;
          }
          js_freeApiRespContent(&local_20);
          nats_JSONDestroy(local_30);
          natsMsg_Destroy(local_28);
          uVar2 = 0;
          goto LAB_001226e0;
        }
        if (param_5 != (uint *)0x0) {
          *param_5 = (uint)uStack_14;
        }
        iVar1 = nats_setErrorReal("/home/ubuntu/src/frankenfirmware/build/_deps/nats.c-src/src/js.c"
                                  ,"js_PublishMsg",0x228,1,"%s",local_10);
LAB_001227e0:
        js_freeApiRespContent(&local_20);
        nats_JSONDestroy(local_30);
        natsMsg_Destroy(local_28);
        uVar2 = 0;
        if (iVar1 == 0) goto LAB_001226e0;
        goto LAB_0012268c;
      }
    }
    natsMsg_Destroy(local_28);
  }
LAB_0012268c:
  uVar2 = nats_updateErrStack(iVar1,"js_PublishMsg");
LAB_001226e0:
  if (local_8 - *(long *)PTR___stack_chk_guard_00187fa0 == 0) {
    return uVar2;
  }
                    /* WARNING: Subroutine does not return */
  __stack_chk_fail(PTR___stack_chk_guard_00187fa0,local_8 - *(long *)PTR___stack_chk_guard_00187fa0,
                   0);
}


