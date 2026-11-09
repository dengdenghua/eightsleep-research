/* Static Ghidra pseudocode; not original source. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined4 FUN_0003613c(int *param_1)

{
  int *piVar1;
  int *piVar2;
  int iVar3;
  int *piVar4;
  int *piVar5;
  
  piVar1 = DAT_20003674;
  piVar2 = DAT_20003674;
  piVar5 = DAT_20003674;
  while( true ) {
    piVar4 = piVar2;
    if (piVar4 == (int *)0x0) {
      return 0;
    }
    if (piVar4 == param_1) break;
    piVar2 = (int *)piVar4[7];
    piVar5 = piVar4;
  }
  if (piVar4 == (int *)0x0) {
    return 0;
  }
  if ((piVar5 == piVar4) && (DAT_20003674 = (int *)DAT_20003674[7], DAT_20003674 == (int *)0x0)) {
    _DAT_40011008 = 1;
    DAT_20003678 = 0;
    DAT_20003673 = 1;
    FUN_000337d0(0x2f);
  }
  iVar3 = *piVar4;
  piVar2 = (int *)piVar4[7];
  piVar5[7] = (int)piVar2;
  if (piVar2 != (int *)0x0) {
    *piVar2 = iVar3 + *piVar2;
  }
  if (piVar1 == DAT_20003674) {
    return 0;
  }
  return 1;
}


