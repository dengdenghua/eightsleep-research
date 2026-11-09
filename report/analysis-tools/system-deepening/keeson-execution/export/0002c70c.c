/* Static Ghidra pseudocode; not original source. */

void FUN_0002c70c(void)

{
  uint uVar1;
  int iVar2;
  
  if (DAT_20003fb7 == '\x01') {
    FUN_00029d9c();
  }
  FUN_0002f6c8();
  FUN_0002b970();
  FUN_00028cb0();
  FUN_000284a4();
  FUN_000279cc();
  FUN_00026e2c();
  FUN_000267bc();
  FUN_00027880();
  FUN_00029100();
  FUN_00029e00();
  iVar2 = DAT_20002ad0 + 1;
  DAT_20002ae8 = 1;
  uVar1 = 0;
  DAT_20002ad0 = iVar2;
  do {
    if ((&DAT_20003f5e)[uVar1] != 0) {
      (&DAT_20003f5e)[uVar1] = (&DAT_20003f5e)[uVar1] + -1;
    }
    uVar1 = uVar1 + 1 & 0xff;
  } while (uVar1 < 4);
  if (9 < iVar2) {
    FUN_00030b6c();
    DAT_20002ad0 = 0;
  }
  return;
}


