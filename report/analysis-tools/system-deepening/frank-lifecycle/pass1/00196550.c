/* Ghidra static pseudocode; not original source. Read-only project; no target execution. */

void FUN_00196550(long *param_1)

{
  int iVar1;
  void *pvVar2;
  
  if (param_1[1] != 0) {
    if (*param_1 != 0) {
      FUN_00181820();
    }
    std::thread::join();
    if (param_1[1] != 0) {
                    /* WARNING: Subroutine does not return */
      std::terminate();
    }
  }
  if (*param_1 != 0) {
    FUN_00460260(0xfffffffc,*param_1 + 4);
    pvVar2 = (void *)*param_1;
    if ((pvVar2 != (void *)0x0) && (iVar1 = FUN_00460320(0xffffffff,pvVar2), iVar1 == 1)) {
      operator_delete(pvVar2,0x18);
      return;
    }
  }
  return;
}


