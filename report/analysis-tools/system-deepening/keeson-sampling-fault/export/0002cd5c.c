/* Static Ghidra pseudocode; not original source. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_0002cd5c(undefined1 *param_1)

{
  bool bVar1;
  int iVar2;
  
  iVar2 = 0;
  bVar1 = (bool)isCurrentModePrivileged();
  if (bVar1) {
    iVar2 = isIRQinterruptsEnabled();
  }
  disableIRQinterrupts();
  if (DAT_200055cc == 0) {
    DAT_200055cc = 1;
    DAT_200055c4 = _DAT_e000e180 & 0xbdff06fc;
    _DAT_e000e180 = 0xbdff06fc;
    DAT_200055c8 = _DAT_e000e184;
    _DAT_e000e184 = 0xffffffff;
    *param_1 = 0;
  }
  else {
    *param_1 = 1;
  }
  if (iVar2 == 0) {
    enableIRQinterrupts();
  }
  return;
}


