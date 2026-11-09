/* Static Ghidra pseudocode; not original source. */

undefined4 FUN_00033884(uint param_1,byte *param_2,undefined4 param_3,undefined4 param_4)

{
  byte bVar1;
  int iVar2;
  undefined4 uVar3;
  
  uVar3 = 0;
  if ((char)(&DAT_20005340)[param_1] < '\0') {
    iVar2 = FUN_0002ec50(param_1,param_3,(param_2[2] & 3) >> 1,param_3,param_3,param_4);
    if (iVar2 == -1) {
      uVar3 = 4;
    }
    else {
      if (-1 < (int)((uint)param_2[2] << 0x1d)) {
        if ((param_2[2] & 1) == 0) {
          FUN_0003273c(param_1,0,0,param_2[1],0,0);
        }
        else {
          *(uint *)(param_1 * 4 + 0x50000700) = *(uint *)(param_1 * 4 + 0x50000700) & 0xfffffffd;
        }
        FUN_00030e04(param_1,&DAT_20005366);
      }
      if ((int)((uint)param_2[2] << 0x1e) < 0) {
        bVar1 = *param_2;
        iVar2 = iVar2 * 4;
        *(uint *)(iVar2 + 0x40006510) = *(uint *)(iVar2 + 0x40006510) & 0xfffce0ff;
        *(uint *)(iVar2 + 0x40006510) =
             (param_1 & 0x1f) << 8 | (bVar1 & 3) << 0x10 | *(uint *)(iVar2 + 0x40006510);
      }
      else {
        (&DAT_20005358)[iVar2] = (&DAT_20005358)[iVar2] | *param_2 << 6;
      }
    }
  }
  else {
    uVar3 = 8;
  }
  return uVar3;
}


