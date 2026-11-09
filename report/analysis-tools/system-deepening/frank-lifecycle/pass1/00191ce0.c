/* Ghidra static pseudocode; not original source. Read-only project; no target execution. */

void FUN_00191ce0(void *param_1)

{
  void *pvVar1;
  
  if (param_1 == (void *)0x0) {
    return;
  }
  do {
    FUN_00191ce0(*(undefined8 *)((long)param_1 + 0x18));
    pvVar1 = *(void **)((long)param_1 + 0x10);
    if (*(void **)((long)param_1 + 0x80) != (void *)((long)param_1 + 0x90)) {
      operator_delete(*(void **)((long)param_1 + 0x80),*(long *)((long)param_1 + 0x90) + 1);
    }
    if (*(void **)((long)param_1 + 0x60) != (void *)((long)param_1 + 0x70)) {
      operator_delete(*(void **)((long)param_1 + 0x60),*(long *)((long)param_1 + 0x70) + 1);
    }
    if (*(void **)((long)param_1 + 0x40) != (void *)((long)param_1 + 0x50)) {
      operator_delete(*(void **)((long)param_1 + 0x40),*(long *)((long)param_1 + 0x50) + 1);
    }
    if (*(void **)((long)param_1 + 0x20) != (void *)((long)param_1 + 0x30)) {
      operator_delete(*(void **)((long)param_1 + 0x20),*(long *)((long)param_1 + 0x30) + 1);
    }
    operator_delete(param_1,0xa0);
    param_1 = pvVar1;
  } while (pvVar1 != (void *)0x0);
  return;
}


