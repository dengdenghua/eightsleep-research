/* Static Ghidra pseudocode; not original source. */

void FUN_0002b70c(void)

{
  int iVar1;
  uint uVar2;
  
  if (DAT_20003da8 == 0) {
    DAT_20003d90 = 0;
    DAT_20003dbc = 0;
  }
  else {
    DAT_20003da8 = DAT_20003da8 + -1;
  }
  if (DAT_20003dac == 0) {
    FUN_000278c4();
  }
  else {
    DAT_20003dac = DAT_20003dac + -1;
  }
  if (DAT_20003db0 == 0) {
    DAT_20003d98 = 0;
  }
  else {
    DAT_20003db0 = DAT_20003db0 + -1;
  }
  if (DAT_20003db8 == 0) {
    DAT_20003da0 = 0;
  }
  else {
    DAT_20003db8 = DAT_20003db8 + -1;
  }
  if (DAT_20003db4 == 0) {
    DAT_20003d9c = 0;
    DAT_20003dbd = 0;
  }
  else {
    DAT_20003db4 = DAT_20003db4 + -1;
  }
  if ((DAT_20003d90 == 0) && (DAT_20003d9c == 0)) {
    if (DAT_20002af0 != 0) {
      DAT_20002af0 = DAT_20002af0 + -1;
      uVar2 = 0;
      do {
        iVar1 = uVar2 * 0x28;
        (&DAT_20003be2)[iVar1] = 2;
        uVar2 = uVar2 + 1 & 0xff;
        (&DAT_20003be1)[iVar1] = 2;
      } while (uVar2 < 4);
      DAT_2000352d = 0;
      DAT_2000352f = 0;
      DAT_2000352e = 0;
      DAT_20003530 = 0;
      return;
    }
    DAT_20003f56 = 0;
  }
  return;
}


