/* Ghidra static pseudocode; not original source. Read-only project; no target execution. */

undefined8 natsConnection_JetStream(undefined8 *param_1,long param_2,undefined8 *param_3)

{
  undefined1 uVar1;
  bool bVar2;
  int iVar3;
  int iVar4;
  undefined4 uVar5;
  void *pvVar6;
  char *pcVar7;
  long lVar8;
  undefined8 uVar9;
  undefined8 uVar10;
  long lVar11;
  
  if (param_1 == (undefined8 *)0x0 || param_2 == 0) {
    uVar9 = natsStatus_GetText(0x10);
    uVar9 = nats_setErrorReal("/home/ubuntu/src/frankenfirmware/build/_deps/nats.c-src/src/js.c",
                              "natsConnection_JetStream",0x117,0x10,"%s",uVar9);
    return uVar9;
  }
  if (param_3 != (undefined8 *)0x0) {
    lVar11 = param_3[2];
    if (lVar11 < 0) {
      pcVar7 = "option \'Wait\' (%ld) cannot be negative";
      uVar10 = 0x10;
      uVar9 = 0x11c;
      goto LAB_00122138;
    }
    lVar11 = param_3[8];
    if (lVar11 < 0) {
      pcVar7 = "option \'PublishAsyncStallWait\' (%ld) cannot be negative";
      uVar10 = 0x10;
      uVar9 = 0x11e;
      goto LAB_00122138;
    }
  }
  pvVar6 = calloc(1,0x150);
  if (pvVar6 == (void *)0x0) {
    lVar11 = natsStatus_GetText(0x18);
    pcVar7 = "%s";
    uVar10 = 0x18;
    uVar9 = 0x123;
LAB_00122138:
    uVar9 = nats_setErrorReal("/home/ubuntu/src/frankenfirmware/build/_deps/nats.c-src/src/js.c",
                              "natsConnection_JetStream",uVar9,uVar10,pcVar7,lVar11);
    return uVar9;
  }
  *(undefined4 *)((long)pvVar6 + 0xe8) = 1;
  natsConn_retain(param_2);
  iVar4 = *(int *)(param_2 + 0x378);
  *(long *)((long)pvVar6 + 8) = param_2;
  *(int *)((long)pvVar6 + 0x128) = iVar4 + 9;
  iVar3 = natsMutex_Create(pvVar6);
  iVar4 = iVar3;
  if (iVar3 == 0) {
    if (param_3 == (undefined8 *)0x0) {
      pcVar7 = strdup(*(char **)PTR_jsDefaultAPIPrefix_00187fb0);
      *(char **)((long)pvVar6 + 0x10) = pcVar7;
      if (pcVar7 == (char *)0x0) {
LAB_00122284:
        uVar9 = natsStatus_GetText(0x18);
        iVar4 = nats_setErrorReal("/home/ubuntu/src/frankenfirmware/build/_deps/nats.c-src/src/js.c"
                                  ,"natsConnection_JetStream",0x13f,0x18,"%s",uVar9);
LAB_00122070:
        if (iVar4 == 0 && param_3 != (undefined8 *)0x0) goto LAB_00121fb0;
      }
      goto LAB_00122090;
    }
    if (((char *)param_3[1] == (char *)0x0) || (*(char *)param_3[1] == '\0')) {
      if (((char *)*param_3 == (char *)0x0) || (*(char *)*param_3 == '\0')) {
        pcVar7 = strdup(*(char **)PTR_jsDefaultAPIPrefix_00187fb0);
        *(char **)((long)pvVar6 + 0x10) = pcVar7;
        if (pcVar7 == (char *)0x0) goto LAB_00122284;
      }
      else {
        uVar5 = js_lenWithoutTrailingDot();
        iVar4 = __asprintf_chk((long)pvVar6 + 0x10,1,&DAT_0015faa0,uVar5,*param_3);
        if (iVar4 < 0) {
          uVar9 = natsStatus_GetText(0x18);
          iVar4 = nats_setErrorReal("/home/ubuntu/src/frankenfirmware/build/_deps/nats.c-src/src/js.c"
                                    ,"natsConnection_JetStream",0x144,0x18,"%s",uVar9);
          goto LAB_00122070;
        }
      }
    }
    else {
      uVar5 = js_lenWithoutTrailingDot();
      iVar4 = __asprintf_chk((long)pvVar6 + 0x10,1,"$JS.%.*s.API",uVar5,param_3[1]);
      if (iVar4 < 0) {
        uVar9 = natsStatus_GetText(0x18);
        iVar4 = nats_setErrorReal("/home/ubuntu/src/frankenfirmware/build/_deps/nats.c-src/src/js.c"
                                  ,"natsConnection_JetStream",0x138,0x18,"%s",uVar9);
        goto LAB_00122070;
      }
    }
LAB_00121fb0:
    lVar11 = param_3[4];
    *(undefined8 *)((long)pvVar6 + 0x28) = param_3[3];
    if (lVar11 == 0) {
      *(undefined8 *)((long)pvVar6 + 0x40) = param_3[6];
      *(undefined8 *)((long)pvVar6 + 0x48) = param_3[7];
    }
    else {
      uVar9 = param_3[5];
      *(long *)((long)pvVar6 + 0x30) = lVar11;
      *(undefined8 *)((long)pvVar6 + 0x38) = uVar9;
    }
    bVar2 = true;
    lVar11 = param_3[8];
    *(long *)((long)pvVar6 + 0x50) = lVar11;
    lVar8 = param_3[2];
    *(long *)((long)pvVar6 + 0x20) = lVar8;
    iVar4 = iVar3;
  }
  else {
LAB_00122090:
    bVar2 = false;
    lVar8 = *(long *)((long)pvVar6 + 0x20);
    lVar11 = *(long *)((long)pvVar6 + 0x50);
  }
  if (lVar8 == 0) {
    *(undefined8 *)((long)pvVar6 + 0x20) = 5000;
  }
  if (lVar11 == 0) {
    *(undefined8 *)((long)pvVar6 + 0x50) = 200;
  }
  if (!bVar2) {
    if (iVar4 == 0) {
      *param_1 = pvVar6;
      return 0;
    }
LAB_00122150:
    jsCtx_Destroy(pvVar6);
    uVar9 = nats_updateErrStack(iVar4,"natsConnection_JetStream");
    return uVar9;
  }
  uVar9 = param_3[0x17];
  pcVar7 = (char *)param_3[0x16];
  *(undefined8 *)((long)pvVar6 + 0xd0) = param_3[0x18];
  *(undefined8 *)((long)pvVar6 + 200) = uVar9;
  if ((pcVar7 != (char *)0x0) && (*pcVar7 != '\0')) {
    pcVar7 = strdup(pcVar7);
    *(char **)((long)pvVar6 + 0xc0) = pcVar7;
    if (pcVar7 == (char *)0x0) {
      uVar9 = natsStatus_GetText(0x18);
      uVar9 = nats_setErrorReal("/home/ubuntu/src/frankenfirmware/build/_deps/nats.c-src/src/js.c",
                                "_copyPurgeOptions",0x103,0x18,"%s",uVar9);
      if (((int)uVar9 != 0) && (iVar4 = nats_updateErrStack(uVar9,"_copyPurgeOptions"), iVar4 != 0))
      goto LAB_00122150;
    }
  }
  uVar1 = *(undefined1 *)(param_3 + 0x19);
  *param_1 = pvVar6;
  *(undefined1 *)((long)pvVar6 + 0xd8) = uVar1;
  return 0;
}


