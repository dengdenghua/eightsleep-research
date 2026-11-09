/* Ghidra static pseudocode; not original source. Read-only project; no target execution. */

void FUN_0014c7a0(undefined8 *param_1,long param_2,undefined8 param_3)

{
  char cVar1;
  int iVar2;
  char *__s;
  size_t sVar3;
  long lVar4;
  undefined8 *puVar5;
  char *__s_00;
  undefined8 *local_10;
  long local_8;
  
  local_8 = *(long *)PTR___stack_chk_guard_00187fa0;
  natsMutex_Lock(*param_1,0);
  cVar1 = natsConn_isClosed(param_1);
  if (cVar1 == '\0') {
    __s = (char *)natsMsg_GetSubject(param_3);
    sVar3 = strlen(__s);
    if (*(int *)((long)param_1 + 0x37c) < (int)sVar3) {
      __s_00 = *(char **)(param_2 + 0xb0);
      sVar3 = strlen(__s_00);
      iVar2 = memcmp(__s_00,__s,sVar3 - 1);
      if (iVar2 != 0) goto LAB_0014c824;
      lVar4 = natsMsg_GetSubject(param_3);
      puVar5 = (undefined8 *)
               natsStrHash_Remove(param_1[0x6b],lVar4 + *(int *)((long)param_1 + 0x37c));
    }
    else {
LAB_0014c824:
      if (*(int *)(param_1[0x6b] + 0x10) != 1) goto LAB_0014c834;
      local_10 = (undefined8 *)0x0;
      natsStrHash_RemoveSingle(param_1[0x6b],0,&local_10);
      puVar5 = local_10;
    }
    if (puVar5 != (undefined8 *)0x0) {
      natsMutex_Lock(*puVar5);
      if (*(char *)(puVar5 + 4) == '\0') {
        puVar5[2] = param_3;
        *(undefined1 *)(puVar5 + 4) = 1;
        natsCondition_Signal(puVar5[1]);
        natsMutex_Unlock(*puVar5);
        lVar4 = local_8 - *(long *)PTR___stack_chk_guard_00187fa0;
        if (lVar4 == 0) {
          natsMutex_Unlock(*param_1,0,0);
          return;
        }
        goto LAB_0014c90c;
      }
      natsMutex_Unlock(*puVar5);
    }
  }
LAB_0014c834:
  natsMutex_Unlock(*param_1);
  lVar4 = local_8 - *(long *)PTR___stack_chk_guard_00187fa0;
  if (lVar4 == 0) {
    natsMsg_Destroy(param_3);
    return;
  }
LAB_0014c90c:
                    /* WARNING: Subroutine does not return */
  __stack_chk_fail(PTR___stack_chk_guard_00187fa0,lVar4,0);
}


