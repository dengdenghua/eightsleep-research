/* Ghidra static pseudocode; not original source. Read-only project; no target execution. */

void FUN_00181820(long param_1)

{
  uint *puVar1;
  bool bVar2;
  uint uVar3;
  pthread_t pVar4;
  long lVar5;
  uint uVar6;
  undefined8 *puVar7;
  char local_9;
  long local_8;
  
  puVar1 = (uint *)(param_1 + 4);
  local_8 = *(long *)PTR___stack_chk_guard_005df758;
  uVar6 = *puVar1;
  do {
    while( true ) {
      if ((uVar6 & 1) != 0) goto LAB_00181880;
      if ((uVar6 >> 1 & 1) == 0) break;
      sched_yield();
      uVar6 = *puVar1;
    }
    uVar3 = FUN_004601c0(uVar6,uVar6 | 3,puVar1);
    bVar2 = uVar3 != uVar6;
    uVar6 = uVar3;
  } while (bVar2);
  pVar4 = pthread_self();
  *(pthread_t *)(param_1 + 0x10) = pVar4;
  puVar7 = *(undefined8 **)(param_1 + 8);
  if (puVar7 != (undefined8 *)0x0) {
    do {
      lVar5 = puVar7[2];
      *(long *)(param_1 + 8) = lVar5;
      if (lVar5 == 0) {
        FUN_00460260(0xfffffffe,puVar1);
        puVar7[3] = &local_9;
        local_9 = '\0';
        (*(code *)*puVar7)(puVar7);
        if (local_9 == '\0') {
          puVar7[3] = 0;
          FUN_00460260(1,puVar7 + 4);
        }
        goto LAB_00181880;
      }
      *(undefined8 *)(lVar5 + 8) = 0;
      FUN_00460260(0xfffffffe,puVar1);
      puVar7[3] = &local_9;
      local_9 = '\0';
      (*(code *)*puVar7)(puVar7);
      if (local_9 == '\0') {
        puVar7[3] = 0;
        FUN_00460260(1,puVar7 + 4);
        uVar6 = *puVar1;
      }
      else {
        uVar6 = *puVar1;
      }
      do {
        while ((uVar6 >> 1 & 1) != 0) {
          sched_yield();
          uVar6 = *puVar1;
        }
        uVar3 = FUN_004600c0(uVar6,uVar6 | 2,puVar1);
        bVar2 = uVar3 != uVar6;
        uVar6 = uVar3;
      } while (bVar2);
      puVar7 = *(undefined8 **)(param_1 + 8);
    } while (puVar7 != (undefined8 *)0x0);
  }
  FUN_00460260(0xfffffffe,puVar1);
LAB_00181880:
  if (local_8 - *(long *)PTR___stack_chk_guard_005df758 != 0) {
                    /* WARNING: Subroutine does not return */
    __stack_chk_fail(PTR___stack_chk_guard_005df758,
                     local_8 - *(long *)PTR___stack_chk_guard_005df758,0);
  }
  return;
}


