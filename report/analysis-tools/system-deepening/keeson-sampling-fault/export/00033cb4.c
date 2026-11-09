/* Static Ghidra pseudocode; not original source. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined4 FUN_00033cb4(int param_1,byte *param_2)

{
  int iVar1;
  
  if (DAT_200053cc != '\0') {
    return 0x11;
  }
  if ((param_2[4] == 0) || (param_2[4] == 1)) {
    _DAT_40007500 = 0;
  }
  iVar1 = param_1 * 2;
  if ((&DAT_200053d8)[iVar1] == '\0') {
    DAT_200053e9 = DAT_200053e9 + '\x01';
  }
  (&DAT_200053d8)[iVar1] = param_2[7];
  (&DAT_200053d9)[iVar1] = param_2[8];
  *(uint *)(param_1 * 0x10 + 0x40007518) =
       *param_2 & 3 | (param_2[1] & 3) << 4 | (param_2[2] & 7) << 8 | (param_2[3] & 1) << 0xc |
       (param_2[4] & 7) << 0x10 | (param_2[5] & 1) << 0x14 | (param_2[6] & 1) << 0x18;
  FUN_00033188(param_1,param_2[7],param_2[8]);
  if ((param_2[4] == 0) || (param_2[4] == 1)) {
    _DAT_40007500 = 1;
  }
  return 0;
}


