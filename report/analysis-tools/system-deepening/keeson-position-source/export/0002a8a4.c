/* Static Ghidra pseudocode; not original source. */

void FUN_0002a8a4(void)

{
  byte bVar1;
  int iVar2;
  uint uVar3;
  uint uVar4;
  byte bVar5;
  bool bVar6;
  
  uVar4 = 0;
  bVar1 = 0;
  bVar5 = 0;
  bVar6 = DAT_200034b8 == '\x01';
  do {
    if (!bVar6) goto LAB_0002aace;
    iVar2 = FUN_000275a0();
    bVar6 = iVar2 == 0;
  } while (!bVar6);
  if (DAT_200034c1 == '\0') {
    if (DAT_200034cc == 0) {
      DAT_200034cc = FUN_0002b8f0(1);
      uVar3 = (uint)DAT_200034be;
      if ((&DAT_200034f8)[uVar3] + 5 < (uint)(&DAT_20003bc8)[uVar3 * 10]) {
        (&DAT_200034e8)[uVar3] = 1;
      }
      else if ((uint)(&DAT_20003bc8)[uVar3 * 10] < (&DAT_200034f8)[uVar3] - 5) {
        (&DAT_200034e8)[uVar3] = 0;
        FUN_00032c4a(0x140003,"setdirection[%d] = %d",uVar3,0);
      }
      else {
        (&DAT_200034e8)[uVar3] = 2;
      }
      FUN_0002afdc((uint)DAT_200034be,(&DAT_200034e8)[DAT_200034be]);
      uVar3 = (uint)DAT_200034bd + (uint)DAT_200034be;
      if ((&DAT_200034f8)[uVar3] + 5 < (uint)(&DAT_20003bc8)[uVar3 * 10]) {
        (&DAT_200034e8)[uVar3] = 1;
      }
      else if ((uint)(&DAT_20003bc8)[uVar3 * 10] < (&DAT_200034f8)[uVar3] - 5) {
        (&DAT_200034e8)[uVar3] = 0;
      }
      else {
        (&DAT_200034e8)[uVar3] = 2;
      }
      FUN_0002afdc(uVar3 & 0xff,(&DAT_200034e8)[uVar3]);
    }
    else {
      iVar2 = FUN_0002b8f0(1);
      if (10 < (uint)(iVar2 - DAT_200034cc)) {
        DAT_200034cc = 0;
        DAT_200034be = DAT_200034be + 1;
        if (1 < DAT_200034be) {
          DAT_200034be = 0;
          DAT_200034c1 = '\x01';
          FUN_000275b0();
        }
      }
    }
  }
  if ((DAT_200034c1 == '\x01') || (DAT_200034c1 == '\0')) {
    do {
      if ((&DAT_200034e8)[uVar4] == '\0') {
        if (((uint)(&DAT_200034f8)[uVar4] <= (uint)(&DAT_20003bc8)[uVar4 * 10]) &&
           ((&DAT_20003be1)[uVar4 * 0x28] != '\x02')) {
          FUN_0002afdc(uVar4,2);
          (&DAT_20003be6)[uVar4 * 0x28] = 1;
          FUN_00027c38();
          FUN_00032c3c(0x140003,"g_moto_parameter[0].arrive_OK = %d",DAT_20003be6);
          FUN_000275b0();
          goto LAB_0002aa06;
        }
      }
      else {
LAB_0002aa06:
        if ((((&DAT_200034e8)[uVar4] == '\x01') &&
            ((uint)(&DAT_20003bc8)[uVar4 * 10] <= (uint)(&DAT_200034f8)[uVar4])) &&
           ((&DAT_20003be1)[uVar4 * 0x28] != '\x02')) {
          FUN_0002afdc(uVar4,2);
          (&DAT_20003be6)[uVar4 * 0x28] = 1;
          FUN_00027c38();
          FUN_00032c3c(0x140003,"g_moto_parameter[0].arrive_OK = %d",DAT_20003be6);
          FUN_000275b0();
        }
      }
      if (((&DAT_20003be2)[uVar4 * 0x28] == '\x01') && ((&DAT_20003be1)[uVar4 * 0x28] == '\0')) {
        FUN_00032c3c(0x140003,"directionSet[%x] = MOTOR_STOP",uVar4);
        FUN_0002afdc(uVar4,2);
        FUN_000275b0();
        bVar1 = bVar1 + 1;
        if (3 < bVar1) {
          FUN_0002af68();
          DAT_200034c1 = '\0';
        }
      }
      uVar4 = uVar4 + 1 & 0xff;
    } while (uVar4 < 4);
    if (DAT_200034c1 == '\x01') {
      uVar4 = 0;
      do {
        if (((&DAT_20003be1)[uVar4 * 0x28] == '\x02') && (bVar5 = bVar5 + 1, 3 < bVar5)) {
          FUN_0002af68();
          DAT_200034c1 = '\0';
        }
        uVar4 = uVar4 + 1 & 0xff;
      } while (uVar4 < 4);
    }
  }
LAB_0002aace:
  if (DAT_200034c0 != '\0') {
    if ((DAT_200034c0 == '\x01') && (iVar2 = FUN_000275a0(), iVar2 == 0)) {
      if (DAT_200034cc == 0) {
        DAT_200034cc = FUN_0002b8f0(1);
        if ((&DAT_20003be1)[(uint)DAT_200034be * 0x28] != '\x01') {
          FUN_0002afdc((uint)DAT_200034be,1);
        }
      }
      else {
        iVar2 = FUN_0002b8f0(1);
        if (10 < (uint)(iVar2 - DAT_200034cc)) {
          DAT_200034cc = 0;
          DAT_200034be = DAT_200034be + 1;
          if (DAT_200034bd + 2 <= (uint)DAT_200034be) {
            FUN_00032c3c(0x140003,"motor34memoryflag = %x");
            DAT_200034c0 = DAT_200034c0 + '\x01';
            FUN_000275b0();
            DAT_200034be = 0;
          }
        }
      }
    }
    if ((((DAT_20003f5e == 0) && (DAT_20003f60 == 0)) && (DAT_20003f62 == 0)) && (DAT_20003f64 == 0)
       ) {
      FUN_0002af68();
      for (uVar4 = 0; uVar4 < DAT_200034bd + 2; uVar4 = uVar4 + 1 & 0xff) {
        (&DAT_20003be6)[uVar4 * 0x28] = 2;
        FUN_00027c38();
        (&DAT_20003bc8)[uVar4 * 10] = 0;
        (&DAT_20003bcc)[uVar4 * 10] = 0;
        (&DAT_20003bd0)[uVar4 * 10] = 0;
      }
      FUN_00029d00();
      DAT_20003f7e = 0;
      if (DAT_20003f57 == '\x02') {
        DAT_20003f57 = '\x03';
      }
    }
  }
  if (DAT_200034bf != '\x01') {
    return;
  }
  if (DAT_20003f7d == '\0') {
    FUN_0002af68();
    FUN_00029d00();
  }
  else {
    FUN_0002afdc(0);
  }
  FUN_000275b0();
  return;
}


