/* Ghidra static pseudocode; not original source. Read-only project; no target execution. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

ulong natsOptions_Create(undefined8 *param_1)

{
  undefined8 uVar1;
  undefined8 uVar2;
  undefined8 uVar3;
  undefined *puVar4;
  uint uVar5;
  int iVar6;
  void *__ptr;
  ulong uVar7;
  undefined8 uVar8;
  
  uVar5 = nats_Open(0xffffffffffffffff);
  if (uVar5 != 0) {
    return (ulong)uVar5;
  }
  __ptr = calloc(1,0x1d8);
  if (__ptr != (void *)0x0) {
    iVar6 = natsMutex_Create();
    puVar4 = PTR_natsConn_defaultErrHandler_00187f80;
    uVar3 = DAT_00165c68;
    uVar2 = DAT_00165c60;
    uVar1 = _UNK_00165c58;
    uVar8 = _DAT_00165c50;
    if (iVar6 == 0) {
      *(undefined8 *)((long)__ptr + 0x20) = 2000;
      *(undefined2 *)((long)__ptr + 0x32) = 1;
      *(undefined8 *)((long)__ptr + 0x40) = 2000;
      *(undefined4 *)((long)__ptr + 0x48) = 0x800000;
      *(undefined **)((long)__ptr + 0xe8) = puVar4;
      *(undefined8 *)((long)__ptr + 0x118) = 120000;
      *(undefined8 *)((long)__ptr + 0x128) = 0xffffffffffffffff;
      *(undefined8 *)((long)__ptr + 0x38) = uVar2;
      *(undefined8 *)((long)__ptr + 0x120) = uVar3;
      *(undefined8 *)((long)__ptr + 0x1a8) = uVar1;
      *(undefined8 *)((long)__ptr + 0x1a0) = uVar8;
      nats_overrideDefaultOptionsWithConfig(__ptr);
      *param_1 = __ptr;
      return 0;
    }
    free(__ptr);
    uVar7 = nats_updateErrStack(0x18,"natsOptions_Create");
    return uVar7;
  }
  uVar8 = natsStatus_GetText(0x18);
  uVar7 = nats_setErrorReal("/home/ubuntu/src/frankenfirmware/build/_deps/nats.c-src/src/opts.c",
                            "natsOptions_Create",0x697,0x18,"%s",uVar8);
  return uVar7;
}


