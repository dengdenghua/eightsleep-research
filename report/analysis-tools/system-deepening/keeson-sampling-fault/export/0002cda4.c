/* Static Ghidra pseudocode; not original source. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_0002cda4(int param_1)

{
  bool bVar1;
  int iVar2;
  
  if ((DAT_200055cc != 0) && (param_1 == 0)) {
    iVar2 = 0;
    bVar1 = (bool)isCurrentModePrivileged();
    if (bVar1) {
      iVar2 = isIRQinterruptsEnabled();
    }
    disableIRQinterrupts();
    _DAT_e000e100 = DAT_200055c4;
    _DAT_e000e104 = DAT_200055c8;
    DAT_200055cc = 0;
    if (iVar2 == 0) {
      enableIRQinterrupts();
    }
  }
  return;
}


