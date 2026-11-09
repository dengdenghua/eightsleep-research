/* Static Ghidra pseudocode; not original source. */

void FUN_00028cb0(void)

{
  uint uVar1;
  ushort uVar2;
  
  FUN_0002b70c();
  if (DAT_20002aec != 0) {
    DAT_20002aec = DAT_20002aec + -1;
  }
  if (DAT_20003fb8 != 0) {
    DAT_20003fb8 = DAT_20003fb8 + -1;
  }
  DAT_20002ad6 = DAT_20002ad6 + 1;
  uVar2 = DAT_20002ae0 + 1;
  DAT_20002ae2 = DAT_20002ae2 + 1;
  DAT_20002ae0 = uVar2;
  if (DAT_20002ad6 < 10) goto LAB_00028da6;
  if ((((DAT_20003f74 < 100) && (DAT_20003f80 == '\0')) && (DAT_20003f75 < 100)) &&
     (((DAT_20003f81 == '\0' && (DAT_20003f76 < 100)) &&
      ((DAT_20003f82 == '\0' && ((DAT_20003f77 < 100 && (DAT_20003f83 == '\0')))))))) {
    if (((DAT_20003be1 == '\x02') && (DAT_20003c09 == '\x02')) &&
       ((DAT_20003c31 == '\x02' && (DAT_20003c59 == '\x02')))) {
LAB_00028d7e:
      uVar1 = 0;
      do {
        (&DAT_20003e8c)[uVar1] = (&DAT_20003bc8)[uVar1 * 10];
        uVar1 = uVar1 + 1 & 0xff;
      } while (uVar1 < 4);
      DAT_20002ade = 0;
    }
    else {
      uVar1 = 0;
      do {
        (&DAT_20003f10)[uVar1] = (&DAT_20003bc8)[uVar1 * 10];
        uVar1 = uVar1 + 1 & 0xff;
      } while (uVar1 < 4);
    }
  }
  else if ((DAT_20003be1 == '\x02') &&
          (((DAT_20003c09 == '\x02' && (DAT_20003c31 == '\x02')) && (DAT_20003c59 == '\x02'))))
  goto LAB_00028d7e;
  if (DAT_20002ad5 != '\0') {
    DAT_20002ad5 = DAT_20002ad5 + -1;
  }
  DAT_20002ad6 = 0;
LAB_00028da6:
  if (0x27 < uVar2) {
    FUN_00032c4a(0x140003,"g_PID_Motor_t.PwmOutAdd_Motor[%x] = %x",0,DAT_20003f74);
    DAT_20002ae0 = 0;
  }
  return;
}


