/* Static Ghidra pseudocode; not original source. */

void FUN_00027cac(void)

{
  undefined2 uVar1;
  
  FUN_000264be(&DAT_20003d45,0x35);
  DAT_20003d45 = 0x56;
  DAT_20003d46 = 4;
  DAT_20003d47 = 0x11;
  DAT_20003d48 = (undefined1)((ushort)(undefined2)DAT_20003bc8 >> 8);
  DAT_20003d49 = (undefined1)(undefined2)DAT_20003bc8;
  DAT_20003d4a = (undefined1)((ushort)(undefined2)DAT_20003bf0 >> 8);
  DAT_20003d4b = (undefined1)(undefined2)DAT_20003bf0;
  DAT_20003d4c = (undefined1)((ushort)(undefined2)DAT_20003c18 >> 8);
  DAT_20003d4d = (undefined1)(undefined2)DAT_20003c18;
  DAT_20003d4e = (undefined1)((ushort)(undefined2)DAT_20003c40 >> 8);
  DAT_20003d4f = (undefined1)(undefined2)DAT_20003c40;
  DAT_20003d50 = DAT_20003c59 | DAT_20003be1 << 6 | DAT_20003c09 << 4 | DAT_20003c31 << 2;
  DAT_20003d51 = 0;
  uVar1 = FUN_0002684c(&DAT_20003d48);
  DAT_20003d59 = (undefined1)((ushort)uVar1 >> 8);
  DAT_20003d5a = (undefined1)uVar1;
  FUN_00027f48();
  return;
}


