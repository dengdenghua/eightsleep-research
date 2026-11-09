/* Static Ghidra pseudocode; not original source. */

void FUN_0002b044(void)

{
  uint uVar1;
  
  switch(DAT_20003496) {
  case 0:
    if (DAT_20003f54 == 0) {
      uVar1 = 0;
      do {
        (&DAT_200046ec)[uVar1] = (&DAT_20003bc8)[uVar1 * 10];
        uVar1 = uVar1 + 1 & 0xff;
      } while (uVar1 < 4);
      DAT_200034a8 = 200;
      DAT_20003496 = 1;
    }
    break;
  case 1:
    if (DAT_200034a8 == 0) {
      FUN_0002afdc(0);
      FUN_0002afdc(2,0);
      FUN_0002afdc(1,0);
      FUN_0002afdc(3,0);
      FUN_000275b0();
      DAT_200034a8 = 0x32;
      DAT_20003496 = 2;
    }
    break;
  case 2:
    if (DAT_200034a8 == 0) {
      FUN_0002afdc(0,2);
      FUN_0002afdc(1,2);
      FUN_0002afdc(2);
      FUN_0002afdc(3,2);
      FUN_000275b0();
      DAT_200034a8 = 100;
      DAT_20003496 = 3;
    }
    else {
      uVar1 = 0;
      do {
        if ((short)(&DAT_200034b0)[uVar1] < 0x1fff) {
          (&DAT_200034b0)[uVar1] = (&DAT_200034b0)[uVar1] + (&DAT_20003be4)[uVar1 * 0x14];
        }
        uVar1 = uVar1 + 1 & 0xff;
      } while (uVar1 < 4);
    }
    break;
  case 3:
    if (DAT_200034a8 == 0) {
      uVar1 = 0;
      do {
        if (5 < (int)((&DAT_20003bc8)[uVar1 * 10] - (&DAT_200046ec)[uVar1])) {
          DAT_20003e77 = DAT_20003e77 + '\x01';
        }
        FUN_00032c3c(0x140003," g_moto_parameter[0].pulse - t_hall[0] = %d");
        uVar1 = uVar1 + 1 & 0xff;
      } while (uVar1 < 4);
      uVar1 = 0;
      do {
        if (5 < (short)(&DAT_200034b0)[uVar1]) {
          DAT_20003e78 = DAT_20003e78 + '\x01';
        }
        (&DAT_200034b0)[uVar1] = 0;
        uVar1 = uVar1 + 1 & 0xff;
      } while (uVar1 < 4);
      uVar1 = 0;
      do {
        (&DAT_200046ec)[uVar1] = (&DAT_20003bc8)[uVar1 * 10];
        uVar1 = uVar1 + 1 & 0xff;
      } while (uVar1 < 4);
      FUN_0002afdc(0,1);
      FUN_0002afdc(2,1);
      FUN_0002afdc(1);
      FUN_0002afdc(3,1);
      FUN_000275b0();
      DAT_200034a8 = 100;
      DAT_20003496 = 4;
    }
    break;
  case 4:
    if (DAT_200034a8 == 0) {
      FUN_0002afdc(0,2);
      FUN_0002afdc(1,2);
      FUN_0002afdc(2);
      FUN_0002afdc(3,2);
      FUN_000275b0();
      uVar1 = 0;
      do {
        if (5 < (int)((&DAT_200046ec)[uVar1] - (&DAT_20003bc8)[uVar1 * 10])) {
          DAT_20003e77 = DAT_20003e77 + '\x01';
        }
        uVar1 = uVar1 + 1 & 0xff;
      } while (uVar1 < 4);
      uVar1 = 0;
      do {
        if (5 < (short)(&DAT_200034b0)[uVar1]) {
          DAT_20003e78 = DAT_20003e78 + '\x01';
        }
        (&DAT_200034b0)[uVar1] = 0;
        uVar1 = uVar1 + 1 & 0xff;
      } while (uVar1 < 4);
      FUN_00032c3c(0x140003," g_SelfCheck_t.motor_HallNum = %d",DAT_20003e77);
      FUN_00032c3c(0x140003," g_SelfCheck_t.motor_CurrentNum = %d",DAT_20003e78);
      DAT_200034a8 = 100;
      DAT_20003496 = 5;
    }
    else {
      uVar1 = 0;
      do {
        if ((short)(&DAT_200034b0)[uVar1] < 0x1fff) {
          (&DAT_200034b0)[uVar1] = (&DAT_200034b0)[uVar1] + (&DAT_20003be4)[uVar1 * 0x14];
        }
        uVar1 = uVar1 + 1 & 0xff;
      } while (uVar1 < 4);
    }
    break;
  case 5:
    if (DAT_200034a8 == 0) {
      if (DAT_20003e77 == '\b') {
        if (DAT_20003f57 == '\x02') {
          DAT_20003f57 = '\x03';
        }
        DAT_20003fb7 = 0;
      }
      else {
        if (DAT_20003f57 == '\0') {
          DAT_20003f57 = '\x01';
        }
        if (DAT_20003e78 == '\b') {
          DAT_20003fb7 = 1;
        }
        else {
          DAT_20003fb7 = 2;
        }
        DAT_20003fb8 = 5000;
      }
      DAT_20003496 = 6;
      DAT_200034a8 = 100;
    }
    break;
  case 6:
    if (DAT_200034a8 == 0) {
      FUN_00027eec();
      FUN_00027cac();
      DAT_20003496 = 0x11;
      DAT_200034a8 = 0;
      DAT_20003e77 = 0;
      DAT_20003e78 = 0;
      return;
    }
  }
  return;
}


