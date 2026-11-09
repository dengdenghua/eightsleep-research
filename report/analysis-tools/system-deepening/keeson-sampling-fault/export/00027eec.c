/* Static Ghidra pseudocode; not original source. */

void FUN_00027eec(void)

{
  undefined2 uVar1;
  
  FUN_000264be(&DAT_20003d45,0x35);
  DAT_20003d45 = 0x56;
  DAT_20003d46 = 7;
  DAT_20003d47 = 0x11;
  if (DAT_20003f57 == '\0') {
    if (DAT_20003f56 == '\0') {
      DAT_20003d4b = 0;
    }
    else {
      DAT_20003d4b = 1;
    }
  }
  else {
    DAT_20003d4b = 2;
  }
  DAT_20003d4c = 0;
  DAT_20003d48 = DAT_20003d4b;
  DAT_20003d49 = DAT_20003d4b;
  DAT_20003d4a = DAT_20003d4b;
  uVar1 = FUN_0002684c(&DAT_20003d48);
  DAT_20003d59 = (undefined1)((ushort)uVar1 >> 8);
  DAT_20003d5a = (undefined1)uVar1;
  FUN_00027f48();
  return;
}


