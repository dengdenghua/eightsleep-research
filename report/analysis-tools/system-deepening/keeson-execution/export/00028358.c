/* Static Ghidra pseudocode; not original source. */

void FUN_00028358(void)

{
  uint in_fpscr;
  float fVar1;
  
  if ((((DAT_20003f74 < 0x1e) && (DAT_20003f75 < 0x1e)) && (DAT_20003f76 < 0x1e)) &&
     (DAT_20003f77 < 0x1e)) {
    fVar1 = (float)VectorSignedToFloat((int)DAT_20003be4,(byte)(in_fpscr >> 0x16) & 3);
    if ((((int)(short)(int)((fVar1 * 3.515625 * 1.5) / 0.235) + 0x231U < 0x463) &&
        (fVar1 = (float)VectorSignedToFloat((int)DAT_20003c0c,(byte)(in_fpscr >> 0x16) & 3),
        (int)(short)(int)((fVar1 * 3.515625 * 1.5) / 0.235) + 0x1d7U < 0x3af)) &&
       ((fVar1 = (float)VectorSignedToFloat((int)DAT_20003c34,(byte)(in_fpscr >> 0x16) & 3),
        (int)(short)(int)((fVar1 * 3.515625 * 1.5) / 0.235) + 0x21aU < 0x435 &&
        (fVar1 = (float)VectorSignedToFloat((int)DAT_20003c5c,(byte)(in_fpscr >> 0x16) & 3),
        (int)(short)(int)((fVar1 * 3.515625 * 1.5) / 0.235) + 0x1d7U < 0x3af)))) {
      DAT_20002add = 0;
      return;
    }
    DAT_20002add = DAT_20002add + 1;
  }
  if (0x32 < DAT_20002add) {
    DAT_20003f56 = 1;
    FUN_0002af68();
    FUN_00027eec();
    if (((DAT_20003be4 == 0) && (DAT_20003c0c == 0)) && ((DAT_20003c34 == 0 && (DAT_20003c5c == 0)))
       ) {
      DAT_20002af0 = 500;
      DAT_20002add = 0;
      DAT_2000352d = 0;
      DAT_2000352f = 0;
      DAT_2000352e = 0;
      DAT_20003530 = 0;
      return;
    }
  }
  return;
}


