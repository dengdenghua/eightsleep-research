/* Static Ghidra pseudocode; not original source. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00027194(void)

{
  char cVar1;
  sbyte sVar2;
  undefined1 uVar3;
  byte bVar4;
  char *pcVar5;
  uint uVar6;
  
  if (DAT_20003530 == '\0') {
    return;
  }
  if (DAT_20002af0 != 0) {
    return;
  }
  if (DAT_2000352f == '\0') {
    if (DAT_2000352d == '\0') {
      uVar6 = 0;
      do {
        cVar1 = (&DAT_20003be1)[uVar6 * 0x28];
        if (cVar1 == '\0') {
          sVar2 = (&DAT_20003531)[uVar6 * 2];
          pcVar5 = "g_moto_parameter[%x].MOTOR_UP = OK ";
LAB_00027226:
          _DAT_50000508 = 1 << sVar2;
          FUN_00032c3c(0x140003,pcVar5,uVar6);
          DAT_2000352d = DAT_2000352d + '\x01';
        }
        else {
          if (cVar1 == '\x01') {
            sVar2 = (&DAT_20003532)[uVar6 * 2];
            pcVar5 = "g_moto_parameter[%x].MOTOR_DOWN = OK ";
            goto LAB_00027226;
          }
          if (cVar1 == '\x02') {
            _DAT_5000050c = 1 << (uint)(byte)(&DAT_20003532)[uVar6 * 2];
            DAT_2000352e = DAT_2000352e + 1;
          }
        }
        uVar6 = uVar6 + 1 & 0xff;
      } while (uVar6 < 4);
      if ((DAT_2000352d == '\0') && (DAT_2000352e < 4)) goto LAB_0002727a;
    }
    DAT_2000352d = '\0';
    DAT_2000352e = 0;
LAB_0002728c:
    bVar4 = 0;
    do {
      bVar4 = bVar4 + 1;
    } while (bVar4 < 4);
    DAT_2000352f = '\x02';
LAB_0002729a:
    thunk_FUN_000312fc(0x32);
    DAT_2000352f = '\x03';
LAB_000272a4:
    if (DAT_2000352d == '\0') {
      uVar6 = 0;
      do {
        cVar1 = (&DAT_20003be1)[uVar6 * 0x28];
        if (cVar1 == '\0') {
          if (((DAT_2000352c == '\0') && (DAT_20003f7d == '\0')) && ((&DAT_20003f74)[uVar6] == '\0')
             ) {
            if ((&DAT_2000496c)[uVar6] == '\0') {
              (&DAT_20003f80)[uVar6] = 5;
            }
            else {
LAB_000272dc:
              (&DAT_20003f74)[uVar6] = (&DAT_2000496c)[uVar6];
              FUN_0002bac4(uVar6);
            }
          }
          else if ((&DAT_2000496c)[uVar6] != '\0') goto LAB_000272dc;
          pcVar5 = "g_sytem_parameter_t.SlowSpeed.pwm[%x].MOTOR_UP = %x";
          uVar3 = (&DAT_20003f74)[uVar6];
LAB_00027356:
          DAT_2000352d = DAT_2000352d + '\x01';
          FUN_00032c4a(0x140003,pcVar5,uVar6,uVar3);
        }
        else {
          if (cVar1 == '\x01') {
            if (((DAT_2000352c == '\0') && (DAT_20003f7d == '\0')) &&
               ((&DAT_20003f74)[uVar6] == '\0')) {
              if ((&DAT_2000496c)[uVar6] == '\0') {
                (&DAT_20003f80)[uVar6] = 5;
              }
              else {
LAB_00027330:
                (&DAT_20003f74)[uVar6] = (&DAT_2000496c)[uVar6];
                FUN_0002bac4(uVar6);
              }
            }
            else if ((&DAT_2000496c)[uVar6] != '\0') goto LAB_00027330;
            pcVar5 = "g_sytem_parameter_t.SlowSpeed.pwm[%x].MOTOR_DOWN = %x";
            uVar3 = (&DAT_20003f74)[uVar6];
            goto LAB_00027356;
          }
          if (cVar1 == '\x02') {
            (&DAT_20003f74)[uVar6] = 100;
            FUN_000293d8(100,uVar6,0);
            FUN_000293d8((&DAT_20003f74)[uVar6],uVar6,1);
            thunk_FUN_000312fc(0x14);
            DAT_2000352e = DAT_2000352e + 1;
            (&DAT_20003f74)[uVar6] = 0;
            (&DAT_20003f80)[uVar6] = 0;
            FUN_000293d8(0,uVar6,0);
            FUN_000293d8((&DAT_20003f74)[uVar6],uVar6,1);
          }
        }
        uVar6 = uVar6 + 1 & 0xff;
      } while (uVar6 < 4);
      if ((DAT_2000352d == '\0') && (DAT_2000352e < 4)) goto LAB_000273d8;
    }
    DAT_2000352f = '\x04';
    DAT_2000352d = '\0';
    DAT_2000352e = 0;
  }
  else {
LAB_0002727a:
    if (DAT_2000352f == '\x01') goto LAB_0002728c;
    if (DAT_2000352f == '\x02') goto LAB_0002729a;
    if (DAT_2000352f == '\x03') goto LAB_000272a4;
LAB_000273d8:
    if (DAT_2000352f != '\x04') goto LAB_000273de;
  }
  uVar6 = 0;
  do {
    cVar1 = (&DAT_20003be1)[uVar6 * 0x28];
    if (cVar1 == '\x02') {
      DAT_2000352e = DAT_2000352e + 1;
    }
    else if (((cVar1 == '\0') || (cVar1 == '\x01')) &&
            (((byte)(&DAT_20003f78)[uVar6] <= (byte)(&DAT_20003f74)[uVar6] ||
             ((&DAT_20003f74)[uVar6] == (&DAT_2000496c)[uVar6])))) {
      DAT_2000352f = '\x05';
    }
    bVar4 = DAT_2000352e;
    uVar6 = uVar6 + 1 & 0xff;
  } while (uVar6 < 4);
  DAT_2000352e = 0;
  if (3 < bVar4) {
    DAT_2000352e = 0;
    DAT_2000352f = 5;
    DAT_20003be8 = 0x32;
    return;
  }
LAB_000273de:
  if ((DAT_2000352f == '\x05') && (DAT_20003be8 == 0)) {
    uVar6 = 0;
    do {
      if ((&DAT_20003be1)[uVar6 * 0x28] == '\x02') {
        (&DAT_20003f74)[uVar6] = 0;
        (&DAT_20003f80)[uVar6] = 0;
        FUN_000293d8(0,uVar6,0);
        FUN_000293d8((&DAT_20003f74)[uVar6],uVar6,1);
        (&DAT_2000496c)[uVar6] = 0;
      }
      uVar6 = uVar6 + 1 & 0xff;
    } while (uVar6 < 4);
    FUN_00032c3c(0x140003,"step = %d",DAT_2000352f);
    FUN_00032c3c(0x140003,"directionSet = %x",DAT_20003530);
    DAT_2000352d = '\0';
    DAT_2000352f = '\0';
    DAT_2000352e = 0;
    DAT_20003530 = '\0';
  }
  return;
}


