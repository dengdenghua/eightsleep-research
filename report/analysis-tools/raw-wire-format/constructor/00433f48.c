/* Reconstructed Ghidra pseudocode, not vendor source. */

uint FUN_00433f48(undefined8 *param_1)

{
  uint uVar1;
  int local_28;
  uint uStack_24;
  long local_20;
  long lStack_18;
  
  FUN_00438384(&local_28,*param_1);
  uVar1 = 3;
  if (uStack_24 == 0xfffffffb) {
    uVar1 = 1;
  }
  param_1[2] = param_1[2] + lStack_18;
  param_1[1] = param_1[1] + local_20;
  if (local_28 == 0) {
    uVar1 = 0x30200 >> (ulong)((uStack_24 & 3) << 3);
  }
  return uVar1;
}


