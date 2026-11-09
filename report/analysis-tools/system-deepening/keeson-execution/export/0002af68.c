/* Static Ghidra pseudocode; not original source. */

void FUN_0002af68(void)

{
  int iVar1;
  uint uVar2;
  
  uVar2 = 0;
  DAT_20003f54 = 0;
  DAT_200034c1 = 0;
  DAT_200034c0 = 0;
  DAT_200034b8 = 0;
  DAT_200034bf = 0;
  DAT_200034cc = 0;
  DAT_200034be = 0;
  DAT_200034b9 = 0;
  DAT_200034ba = 0;
  DAT_200034bb = 0;
  DAT_200034bc = 0;
  DAT_200034c8 = 0;
  iVar1 = FUN_000275a0();
  if (iVar1 == 0) {
    do {
      (&DAT_200034d8)[uVar2] = 0;
      if ((&DAT_20003be1)[uVar2 * 0x28] != '\x02') {
        FUN_0002afdc(uVar2,2);
        FUN_000275b0();
      }
      uVar2 = uVar2 + 1 & 0xff;
    } while (uVar2 < 4);
  }
  DAT_20003d00 = 0;
  DAT_20003d04 = 0;
  DAT_20003d08 = 0;
  DAT_20003d0c = 0;
  return;
}


