/* Ghidra static pseudocode; not original source. Read-only project; no target execution. */

void FUN_001946b0(long *param_1)

{
  long *plVar1;
  long *plVar2;
  void *pvVar3;
  
  pvVar3 = (void *)*param_1;
  plVar1 = *(long **)((long)pvVar3 + 0x40);
  if (plVar1 != (long *)0x0) {
    do {
      (**(code **)(*plVar1 + 0x10))(plVar1);
      plVar1 = (long *)plVar1[4];
    } while (plVar1 != (long *)0x0);
    pvVar3 = (void *)*param_1;
    plVar1 = *(long **)((long)pvVar3 + 0x40);
    if (*(long **)((long)pvVar3 + 0x40) != (long *)0x0) {
      do {
        plVar2 = (long *)plVar1[4];
        (**(code **)(*plVar1 + 8))(plVar1);
        *(long **)((long)pvVar3 + 0x40) = plVar2;
        plVar1 = plVar2;
      } while (plVar2 != (long *)0x0);
      pvVar3 = (void *)*param_1;
      if (pvVar3 == (void *)0x0) {
        return;
      }
    }
  }
  pthread_mutex_destroy((pthread_mutex_t *)((long)pvVar3 + 8));
  operator_delete(pvVar3,0x48);
  return;
}


