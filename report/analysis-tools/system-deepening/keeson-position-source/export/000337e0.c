/* Static Ghidra pseudocode; not original source. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_000337e0(uint param_1,int param_2)

{
  int iVar1;
  uint uVar2;
  undefined4 uVar3;
  
  iVar1 = FUN_00034dcc();
  if (iVar1 == 0) {
    iVar1 = FUN_00034de4(param_1);
    if (iVar1 != 0) {
      uVar2 = FUN_0002ec98(param_1);
      *(uint *)(uVar2 * 4 + 0x40006510) = *(uint *)(uVar2 * 4 + 0x40006510) | 1;
      FUN_00032854(uVar2 * 4 + 0x100 & 0xffff);
      if ((param_2 != 0) && (iVar1 = FUN_0002ec98(param_1), (&DAT_20005308)[iVar1] != 0)) {
        _DAT_40006304 = 1 << (uVar2 & 0xff);
      }
    }
    return;
  }
  iVar1 = FUN_0002ec98();
  if ((byte)(&DAT_20005358)[iVar1] >> 6 == 3) {
    if ((_DAT_50000510 >> (param_1 & 0xff) & 1) == 0) goto LAB_00033826;
  }
  else if ((byte)(&DAT_20005358)[iVar1] >> 6 == 1) {
LAB_00033826:
    uVar3 = 2;
    goto LAB_0003381c;
  }
  uVar3 = 3;
LAB_0003381c:
  FUN_000327f4(param_1,uVar3);
  return;
}


