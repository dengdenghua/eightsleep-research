/* Static Ghidra pseudocode; not original source. */

void FUN_00029100(void)

{
  if (DAT_200034a0 != 0) {
    DAT_200034a0 = DAT_200034a0 + -1;
  }
  if (DAT_200034a4 != 0) {
    DAT_200034a4 = DAT_200034a4 + -1;
  }
  if (DAT_200034a8 != 0) {
    DAT_200034a8 = DAT_200034a8 + -1;
  }
  if (DAT_200034ac != 0) {
    DAT_200034ac = DAT_200034ac + -1;
  }
  DAT_2000349a = DAT_2000349a + 1;
  if ((4 < DAT_2000349a) && (DAT_2000349a = 0, DAT_20003499 == '\x01')) {
    if (DAT_20003f8d == -1) {
      DAT_20003499 = 0;
      return;
    }
    DAT_20003f8d = DAT_20003f8d + '\x01';
  }
  return;
}


