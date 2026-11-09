/* Static Ghidra pseudocode; not original source. */

void FUN_0002b680(void)

{
  uint uVar1;
  uint uVar2;
  
  uVar1 = 0;
  do {
    uVar2 = uVar1 + 1 & 0xff;
    (&DAT_20003bc8)[uVar1 * 10] = (&DAT_20003c68)[uVar1];
    uVar1 = uVar2;
  } while (uVar2 < 4);
  return;
}


