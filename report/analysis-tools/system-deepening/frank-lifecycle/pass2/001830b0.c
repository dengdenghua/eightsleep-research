/* Ghidra static pseudocode; not original source. Read-only project; no target execution. */

undefined * FUN_001830b0(ulong param_1,undefined4 *param_2)

{
  char cVar1;
  undefined8 *puVar2;
  uint uVar3;
  undefined8 *puVar4;
  long lVar5;
  undefined8 *puVar6;
  long local_a8;
  char local_a0;
  ulong local_98;
  undefined8 *local_90;
  void *local_88;
  undefined8 local_80 [10];
  undefined4 local_30 [2];
  exception_ptr aeStack_28 [8];
  undefined8 *local_20;
  undefined8 local_18;
  undefined8 local_10;
  long local_8;
  
  local_8 = *(long *)PTR___stack_chk_guard_005df758;
  puVar4 = (undefined8 *)std::_V2::system_category();
  *param_2 = 0;
  *(undefined8 **)(param_2 + 2) = puVar4;
  if (*(long *)(param_1 + 0xe0) == 0) {
    cVar1 = *(char *)(param_1 + 0x68);
    if (cVar1 != '\0') {
      pthread_mutex_lock((pthread_mutex_t *)(param_1 + 0x38));
      *(undefined1 *)(param_1 + 0xf8) = 1;
      if (*(char *)(param_1 + 0x68) != '\0') {
        *(ulong *)(param_1 + 0xa8) = *(ulong *)(param_1 + 0xa8) | 1;
        pthread_cond_broadcast((pthread_cond_t *)(param_1 + 0x78));
      }
      if (*(char *)(param_1 + 0xd8) == '\0') goto LAB_001832a4;
LAB_001832c4:
      lVar5 = local_8 - *(long *)PTR___stack_chk_guard_005df758;
      if (lVar5 == 0) {
        uVar3 = pthread_mutex_unlock((pthread_mutex_t *)(param_1 + 0x38));
        return (undefined *)(ulong)uVar3;
      }
      goto LAB_00183340;
    }
    *(undefined1 *)(param_1 + 0xf8) = 1;
    cVar1 = '\0';
    if (*(char *)(param_1 + 0xd8) == '\0') {
LAB_001832a4:
      if (*(long **)(param_1 + 0xb0) != (long *)0x0) {
        lVar5 = **(long **)(param_1 + 0xb0);
        *(undefined1 *)(param_1 + 0xd8) = 1;
        (**(code **)(lVar5 + 8))();
      }
      if (cVar1 != '\0') goto LAB_001832c4;
    }
  }
  else {
    puVar6 = local_80;
    local_30[0] = 0;
    std::__exception_ptr::exception_ptr::exception_ptr(aeStack_28);
    local_80[0] = 0;
    local_80[1] = 0;
    local_20 = (undefined8 *)0x0;
    local_18 = 0;
    local_10 = 0;
    local_80[2] = 0;
    local_80[3] = 0;
    local_80[4] = 0;
    local_80[5] = 0;
    local_80[6] = 0;
    local_80[7] = 0;
    local_80[8] = 0;
    local_80[9] = 0;
    local_98 = param_1;
    local_90 = puVar6;
    local_88 = pthread_getspecific(DAT_005e3b90);
    pthread_setspecific(DAT_005e3b90,&local_98);
    local_a8 = param_1 + 0x30;
    local_a0 = *(char *)(param_1 + 0x68) != '\0';
    if ((bool)local_a0) {
      pthread_mutex_lock((pthread_mutex_t *)(param_1 + 0x38));
    }
    while (lVar5 = FUN_00195930(param_1,&local_a8,puVar6,param_2), lVar5 != 0) {
      if ((*(char *)(local_a8 + 0x38) != '\0') && (local_a0 == '\0')) {
        pthread_mutex_lock((pthread_mutex_t *)(local_a8 + 8));
        local_a0 = '\x01';
      }
    }
    if (local_a0 != '\0') {
      pthread_mutex_unlock((pthread_mutex_t *)(local_a8 + 8));
    }
    pthread_setspecific(DAT_005e3b90,local_88);
    puVar2 = local_20;
    while (puVar2 != (undefined8 *)0x0) {
      local_20 = (undefined8 *)*puVar2;
      if (local_20 == (undefined8 *)0x0) {
        local_18 = 0;
      }
      *puVar2 = 0;
      local_98 = local_98 & 0xffffffff00000000;
      local_90 = puVar4;
      (*(code *)puVar2[1])(0,puVar2,&local_98,0);
      puVar2 = local_20;
    }
    local_20 = (undefined8 *)0x0;
    do {
      if ((void *)*puVar6 != (void *)0x0) {
        free((void *)*puVar6);
      }
      puVar6 = puVar6 + 1;
    } while ((undefined8 *)local_30 != puVar6);
    std::__exception_ptr::exception_ptr::~exception_ptr(aeStack_28);
  }
  lVar5 = local_8 - *(long *)PTR___stack_chk_guard_005df758;
  if (lVar5 == 0) {
    return PTR___stack_chk_guard_005df758;
  }
LAB_00183340:
                    /* WARNING: Subroutine does not return */
  __stack_chk_fail(PTR___stack_chk_guard_005df758,lVar5,0);
}


