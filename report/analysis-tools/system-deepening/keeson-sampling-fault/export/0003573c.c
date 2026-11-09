/* Static Ghidra pseudocode; not original source. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_0003573c(void)

{
  _DAT_e000e180 = 0x20000;
  DataSynchronizationBarrier(0xf);
  InstructionSynchronizationBarrier(0xf);
  _DAT_40011348 = 0x10000;
  _DAT_40011308 = 0x10000;
  _DAT_40011004 = 1;
  FUN_000337d0(0x2f);
  _DAT_40011008 = 1;
  DAT_20003678 = 0;
  FUN_000337d0(0x2f);
  DAT_20003672 = 0;
  return;
}


