/* Static Ghidra pseudocode; not original source. */

uint FUN_00029c40(uint param_1)

{
  uint uVar1;
  
  uVar1 = 0;
  do {
    if ((byte)(&DAT_20003539)[uVar1] == param_1) {
      return uVar1;
    }
    uVar1 = uVar1 + 1 & 0xff;
  } while (uVar1 < 4);
  return 0;
}


