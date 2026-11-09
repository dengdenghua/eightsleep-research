/* Static Ghidra pseudocode; not original source. */

undefined4 FUN_0002f63c(int *param_1)

{
  int iVar1;
  bool bVar2;
  
  if (DAT_20003670 != DAT_20003671) {
    bVar2 = DAT_20003670 == '\x01';
    DAT_20003670 = DAT_20003670 + 1;
    if (bVar2) {
      DAT_20003670 = 0;
    }
    iVar1 = (&DAT_2000367c)[DAT_20003670];
    *param_1 = iVar1;
    DAT_20003678 = DAT_20003678 + iVar1 & 0xffffff;
    return 1;
  }
  *param_1 = 0;
  return 0;
}


