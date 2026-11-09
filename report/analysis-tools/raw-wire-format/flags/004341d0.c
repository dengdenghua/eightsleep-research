/* Reconstructed Ghidra pseudocode, not vendor source. */

void FUN_004341d0(long param_1,byte param_2,byte param_3)

{
  uint uVar1;
  uint uVar2;
  uint uVar3;
  uint uVar4;
  uint uVar5;
  bool bVar6;
  
  uVar1 = (uint)param_3;
  bVar6 = uVar1 < 4;
  uVar4 = 0x81000;
  if (9 < uVar1) {
    uVar1 = 10;
  }
  uVar3 = (uint)bVar6 << 0xe;
  uVar5 = uVar3 | *(ushort *)("" + (ulong)uVar1 * 2);
  if (param_3 != 0) {
    uVar4 = 0x1000;
  }
  uVar2 = uVar5 | 0x80000;
  if (param_3 != 0) {
    uVar2 = uVar5;
  }
  if (param_2 < 2) {
    uVar2 = uVar4 | uVar3 | (uint)*(ushort *)("" + (ulong)uVar1 * 2);
  }
  *(uint *)(param_1 + 0x10080) = uVar2;
  *(byte *)(param_1 + 0x100aa) = (byte)(uVar2 >> 0xe) & 1;
  *(uint *)(param_1 + 0x10030) = ((uVar2 & 0xfff) * 0x5556 + 0xaaac >> 0x10) + 1;
  *(uint *)(param_1 + 0x10034) = ((uVar2 >> 2 & 0x3ff) * 0x5556 + 0xaaac >> 0x10) + 1;
  return;
}


