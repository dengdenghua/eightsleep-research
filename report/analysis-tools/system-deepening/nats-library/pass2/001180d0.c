/* Ghidra static pseudocode; not original source. Read-only project; no target execution. */

undefined4 natsConnection_ConnectTo(undefined8 *param_1,char *param_2)

{
  ulong uVar1;
  undefined8 uVar2;
  int iVar3;
  undefined4 uVar4;
  char *pcVar5;
  undefined8 *__ptr;
  char *pcVar6;
  ulong uVar7;
  undefined8 local_18;
  undefined8 local_10;
  long local_8;
  
  local_8 = *(long *)PTR___stack_chk_guard_00187fa0;
  local_18 = 0;
  local_10 = 0;
  iVar3 = natsOptions_Create(&local_10,0);
  uVar2 = local_10;
  if (iVar3 == 0) {
    iVar3 = 0;
    pcVar5 = param_2;
    if (param_2 == (char *)0x0) {
LAB_00118188:
      iVar3 = natsOptions_SetURL(uVar2,param_2);
joined_r0x0011825c:
      if (iVar3 == 0) {
        iVar3 = natsConn_create(&local_18);
        if (iVar3 == 0) {
          iVar3 = FUN_00116444(local_18);
          if (iVar3 == 0) {
            *param_1 = local_18;
            uVar4 = 0;
            goto LAB_00118130;
          }
        }
        goto LAB_00118110;
      }
    }
    else {
      while (pcVar5 = strchr(pcVar5,0x2c), pcVar5 != (char *)0x0) {
        pcVar5 = pcVar5 + 1;
        iVar3 = iVar3 + 1;
      }
      if (iVar3 == 0) goto LAB_00118188;
      __ptr = calloc((long)(iVar3 + 1),8);
      if (__ptr != (undefined8 *)0x0) {
        pcVar5 = strdup(param_2);
        if (pcVar5 == (char *)0x0) {
          free(__ptr);
          iVar3 = 0x18;
          goto LAB_00118260;
        }
        *__ptr = pcVar5;
        pcVar6 = strchr(pcVar5,0x2c);
        uVar7 = 1;
        uVar1 = 2;
        while (pcVar6 != (char *)0x0) {
          *pcVar6 = '\0';
          __ptr[uVar1 - 1] = pcVar6 + 1;
          pcVar6 = strchr(pcVar6 + 1,0x2c);
          uVar7 = uVar1 & 0xffffffff;
          uVar1 = uVar1 + 1;
        }
        iVar3 = natsOptions_SetServers(uVar2,__ptr,uVar7);
        free(pcVar5);
        free(__ptr);
        goto joined_r0x0011825c;
      }
      iVar3 = 0x18;
    }
LAB_00118260:
    natsOptions_Destroy(local_10);
  }
LAB_00118110:
  natsConn_release(local_18);
  uVar4 = nats_updateErrStack(iVar3,"natsConnection_ConnectTo");
LAB_00118130:
  if (local_8 - *(long *)PTR___stack_chk_guard_00187fa0 == 0) {
    return uVar4;
  }
                    /* WARNING: Subroutine does not return */
  __stack_chk_fail(PTR___stack_chk_guard_00187fa0,local_8 - *(long *)PTR___stack_chk_guard_00187fa0,
                   0);
}


