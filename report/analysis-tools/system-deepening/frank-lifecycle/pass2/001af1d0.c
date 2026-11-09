/* Ghidra static pseudocode; not original source. Read-only project; no target execution. */

void * FUN_001af1d0(undefined8 *param_1,long param_2)

{
  long lVar1;
  long lVar2;
  void *pvVar3;
  
  pvVar3 = (void *)param_1[1];
  if (pvVar3 != (void *)0x0) {
    lVar1 = *(long *)((long)pvVar3 + 8);
    param_1[1] = lVar1;
    if (lVar1 == 0) {
      *param_1 = 0;
    }
    else if (pvVar3 == *(void **)(lVar1 + 0x18)) {
      lVar2 = *(long *)(lVar1 + 0x10);
      *(undefined8 *)(lVar1 + 0x18) = 0;
      if (lVar2 != 0) {
        lVar1 = *(long *)(lVar2 + 0x18);
        param_1[1] = lVar2;
        if (lVar1 != 0) {
          do {
            lVar2 = lVar1;
            lVar1 = *(long *)(lVar2 + 0x18);
          } while (*(long *)(lVar2 + 0x18) != 0);
          param_1[1] = lVar2;
        }
        if (*(long *)(lVar2 + 0x10) != 0) {
          param_1[1] = *(long *)(lVar2 + 0x10);
        }
      }
    }
    else {
      *(undefined8 *)(lVar1 + 0x10) = 0;
    }
    if (*(void **)((long)pvVar3 + 0x80) != (void *)((long)pvVar3 + 0x90)) {
      operator_delete(*(void **)((long)pvVar3 + 0x80),*(long *)((long)pvVar3 + 0x90) + 1);
    }
    if (*(void **)((long)pvVar3 + 0x60) != (void *)((long)pvVar3 + 0x70)) {
      operator_delete(*(void **)((long)pvVar3 + 0x60),*(long *)((long)pvVar3 + 0x70) + 1);
    }
    if (*(void **)((long)pvVar3 + 0x40) != (void *)((long)pvVar3 + 0x50)) {
      operator_delete(*(void **)((long)pvVar3 + 0x40),*(long *)((long)pvVar3 + 0x50) + 1);
    }
    if (*(void **)((long)pvVar3 + 0x20) != (void *)((long)pvVar3 + 0x30)) {
      operator_delete(*(void **)((long)pvVar3 + 0x20),*(long *)((long)pvVar3 + 0x30) + 1);
    }
    FUN_00198030((long)pvVar3 + 0x20,param_2);
    FUN_00198030((long)pvVar3 + 0x40,param_2 + 0x20);
    FUN_00198030((long)pvVar3 + 0x60,param_2 + 0x40);
    FUN_00198030((long)pvVar3 + 0x80,param_2 + 0x60);
    return pvVar3;
  }
  pvVar3 = operator_new(0xa0);
  FUN_00198030((long)pvVar3 + 0x20,param_2);
  FUN_00198030((long)pvVar3 + 0x40,param_2 + 0x20);
  FUN_00198030((long)pvVar3 + 0x60,param_2 + 0x40);
  FUN_00198030((long)pvVar3 + 0x80,param_2 + 0x60);
  return pvVar3;
}


