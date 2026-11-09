/* Static Ghidra pseudocode; not original source. */

void FUN_0002969c(void)

{
  FUN_00032300(&DAT_20003748,DAT_20003754,&DAT_20003dc0,0xa4);
  if (DAT_20003dc0 == 0x55667788) {
    FUN_0002648c(&DAT_200046c8,&DAT_20003dc4,0x14);
    FUN_0002648c(&DAT_20003c88,&DAT_20003dd8,0x3c);
    FUN_0002648c(&DAT_20003cc4,&DAT_20003e14,0x3c);
    if ((DAT_20003e50 == 0xd2f1) && (DAT_20003e54 == 0x27e3)) {
      FUN_0002648c(&DAT_20003c88,&DAT_20003dd8,0x3c);
      FUN_0002648c(&DAT_20003cc4,&DAT_20003e14,0x3c);
    }
    else {
      FUN_0002a85c();
      DAT_20003f6a = 1;
    }
    DAT_20003fbc = 0;
    DAT_20003f7e = DAT_20003e58;
    DAT_20003f8d = DAT_20003e59;
    DAT_20003f8e = DAT_20003e5a;
    DAT_20003f8f = DAT_20003e5b;
    DAT_20003f90 = DAT_20003e5c;
    DAT_20003fca = DAT_20003e5d;
    DAT_20003fb7 = DAT_20003e60;
    if (DAT_20003e60 == -1) {
      DAT_20003fb7 = '\0';
    }
    if (0xf9 < DAT_20003e59) {
      DAT_20003f8d = 0;
    }
    if (0xf9 < DAT_20003e5c) {
      DAT_20003f90 = 0;
    }
    if (0xf9 < DAT_20003e5a) {
      DAT_20003f8e = 0;
    }
    if (0xf9 < DAT_20003e5b) {
      DAT_20003f8f = 0;
    }
    DAT_20003f9c = 1;
    DAT_200034d0 = (uint)DAT_20003e58;
    return;
  }
  FUN_0002a85c();
  DAT_200034d0 = (uint)DAT_20003f7e;
  DAT_20003f6a = 1;
  DAT_20003f9c = 1;
  return;
}


