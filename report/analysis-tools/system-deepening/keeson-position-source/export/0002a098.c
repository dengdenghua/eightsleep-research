/* Static Ghidra pseudocode; not original source. */

void FUN_0002a098(undefined4 param_1,undefined4 param_2,undefined4 *param_3,undefined4 *param_4)

{
  byte bVar1;
  uint uVar2;
  int iVar3;
  undefined1 *puVar4;
  undefined1 *extraout_r1;
  undefined4 unaff_r4;
  uint uVar5;
  undefined4 unaff_lr;
  bool bVar6;
  bool bVar7;
  bool bVar8;
  undefined8 uVar9;
  undefined4 *local_30;
  undefined4 *local_2c;
  
  puVar4 = (undefined1 *)0x14;
  uVar5 = 0;
  bVar7 = DAT_200034c5 == 0;
  do {
    local_30 = param_3;
    local_2c = param_4;
    if (!bVar7) goto LAB_0002a46a;
    uVar2 = (uint)DAT_200034c4;
    bVar8 = SBORROW4(uVar2,0x11);
    bVar6 = (int)(uVar2 - 0x11) < 0;
    bVar7 = uVar2 == 0x11;
    do {
      do {
        if (bVar7) goto LAB_0002a2c0;
        if (bVar6 != bVar8) {
          if ((uVar2 == 5) || (uVar2 == 10)) goto LAB_0002a0ee;
          bVar7 = uVar2 == 0xf;
          goto LAB_0002a0dc;
        }
        bVar8 = SBORROW4(uVar2,0x12);
        bVar6 = (int)(uVar2 - 0x12) < 0;
        bVar7 = true;
      } while (uVar2 == 0x12);
      bVar8 = SBORROW4(uVar2,0x14);
      bVar6 = (int)(uVar2 - 0x14) < 0;
      bVar7 = true;
    } while (uVar2 == 0x14);
    bVar7 = false;
    if (uVar2 == 0x18) {
LAB_0002a2c0:
      iVar3 = FUN_000275a0();
      if (iVar3 != 0) goto LAB_0002a46a;
      goto LAB_0002a2c8;
    }
LAB_0002a0dc:
    if (!bVar7) goto LAB_00029c5c;
LAB_0002a0ee:
    uVar9 = FUN_000275a0();
    puVar4 = (undefined1 *)((ulonglong)uVar9 >> 0x20);
    bVar7 = (int)uVar9 == 0;
  } while (!bVar7);
  do {
    if ((&DAT_200034d8)[uVar5] == '\x01') {
      if (DAT_200034cc == 0) {
        DAT_200034cc = FUN_0002b8f0(1);
        if ((&DAT_200034f8)[uVar5] + 5 < (uint)(&DAT_20003bc8)[uVar5 * 10]) {
          if ((&DAT_20003be1)[uVar5 * 0x28] != '\x01') {
            (&DAT_200034ec)[uVar5] = 1;
            DAT_200034b9 = DAT_200034b9 + 1;
          }
        }
        else if ((uint)(&DAT_20003bc8)[uVar5 * 10] < (&DAT_200034f8)[uVar5] - 5) {
          if ((&DAT_20003be1)[uVar5 * 0x28] != '\0') {
            (&DAT_200034ec)[uVar5] = 0;
            DAT_200034b9 = DAT_200034b9 + 1;
          }
          FUN_00032c4a(0x140003,"setdirection[%d] = %d",uVar5,(&DAT_200034ec)[uVar5]);
        }
        else if ((&DAT_20003be1)[uVar5 * 0x28] != '\x02') {
          (&DAT_200034ec)[uVar5] = 2;
        }
        FUN_0002afdc(uVar5,(&DAT_200034ec)[uVar5]);
        (&DAT_20003f5e)[uVar5] = 100;
        (&DAT_200034d8)[uVar5] = 2;
        FUN_000275b0();
        thunk_FUN_000312fc(100);
        DAT_200034cc = 0;
        goto LAB_0002a19a;
      }
    }
    else {
LAB_0002a19a:
      if ((&DAT_200034d8)[uVar5] == '\x02') {
        DAT_200034cc = 0;
        if ((&DAT_200034ec)[uVar5] == '\0') {
          local_30 = (undefined4 *)(uVar5 * 5);
          if ((uint)(&DAT_200034f8)[uVar5] <= (uint)(&DAT_20003bc8)[uVar5 * 10]) {
            local_2c = &DAT_20003bc8 + uVar5 * 10;
            if ((&DAT_20003be1)[uVar5 * 0x28] != '\x02') {
              FUN_0002afdc(uVar5,2);
              (&DAT_20003be6)[uVar5 * 0x28] = 1;
              FUN_00032c4a(0x140003,"g_moto_parameter[%d].arrive_OK = %d",uVar5);
              FUN_00032c4a(0x140003,"g_moto_parameter[%d].pulse = %d",uVar5,
                           (&DAT_20003bc8)[uVar5 * 10]);
              FUN_000275b0();
              FUN_00027c38();
              goto LAB_0002a20a;
            }
          }
        }
        else {
LAB_0002a20a:
          if (((&DAT_200034ec)[uVar5] == '\x01') &&
             ((uint)(&DAT_20003bc8)[uVar5 * 10] <= (uint)(&DAT_200034f8)[uVar5])) {
            local_30 = &DAT_20003bc8 + uVar5 * 10;
            if ((&DAT_20003be1)[uVar5 * 0x28] != '\x02') {
              FUN_0002afdc(uVar5,2);
              (&DAT_20003be6)[uVar5 * 0x28] = 1;
              FUN_00032c4a(0x140003,"g_moto_parameter[%d].arrive_OK = %d",uVar5);
              FUN_000275b0();
              FUN_00027c38();
            }
          }
        }
        if (((&DAT_20003be2)[uVar5 * 0x28] == '\x01') && ((&DAT_20003be1)[uVar5 * 0x28] == '\0')) {
          FUN_00032c3c(0x140003,"[%d] = MOTOR_TOP",uVar5);
          FUN_0002afdc(uVar5,2);
          FUN_000275b0();
        }
      }
    }
    uVar5 = uVar5 + 1 & 0xff;
  } while (uVar5 < 4);
  uVar5 = 0;
  do {
    if (((&DAT_20003be1)[uVar5 * 0x28] == '\x02') && ((&DAT_200034d8)[uVar5] == '\x02')) {
      (&DAT_200034d8)[uVar5] = 0;
      DAT_200034ba = DAT_200034ba + 1;
      if (DAT_200034b9 <= DAT_200034ba) {
        FUN_0002af68();
      }
    }
    uVar5 = uVar5 + 1 & 0xff;
  } while (uVar5 < 4);
LAB_0002a46a:
  puVar4 = (undefined1 *)(uint)DAT_200034c5;
  bVar7 = puVar4 == (undefined1 *)0x1;
LAB_0002a470:
  do {
    do {
      if (!bVar7) goto LAB_00029c5c;
      if (DAT_200034c4 == 0x11) {
LAB_0002a646:
        uVar9 = FUN_000275a0();
        puVar4 = (undefined1 *)((ulonglong)uVar9 >> 0x20);
        if ((int)uVar9 != 0) goto LAB_00029c5c;
        uVar5 = 0;
        goto LAB_0002a64e;
      }
      if (0x11 < DAT_200034c4) {
        if (((DAT_200034c4 == 0x12) || (DAT_200034c4 == 0x14)) ||
           (bVar7 = false, DAT_200034c4 == 0x18)) goto LAB_0002a646;
        goto LAB_0002a470;
      }
    } while (((DAT_200034c4 != 5) && (DAT_200034c4 != 10)) && (bVar7 = DAT_200034c4 == 0xf, !bVar7))
    ;
    uVar9 = FUN_000275a0();
    puVar4 = (undefined1 *)((ulonglong)uVar9 >> 0x20);
    bVar7 = false;
  } while ((int)uVar9 != 0);
  uVar5 = 0;
  do {
    if ((&DAT_200034d8)[uVar5] == '\x01') {
      if (DAT_200034cc == 0) {
        DAT_200034cc = FUN_0002b8f0(1);
        if ((&DAT_20003be1)[uVar5 * 0x28] != '\x01') {
          FUN_0002afdc(uVar5,1);
          DAT_200034bb = DAT_200034bb + 1;
        }
        (&DAT_20003f5e)[uVar5] = 100;
        (&DAT_200034d8)[uVar5] = 2;
        FUN_000275b0();
        thunk_FUN_000312fc(100);
        DAT_200034cc = 0;
        puVar4 = extraout_r1;
        goto LAB_0002a594;
      }
    }
    else {
LAB_0002a594:
      if (((&DAT_200034d8)[uVar5] == '\x02') && (DAT_200034cc = 0, (&DAT_20003f5e)[uVar5] == 0)) {
        FUN_0002afdc(uVar5,2);
        FUN_000275b0();
        local_30 = (undefined4 *)(uVar5 * 5);
        (&DAT_20003be6)[uVar5 * 0x28] = 2;
        FUN_00027c38();
        (&DAT_20003bc8)[uVar5 * 10] = 0;
        (&DAT_20003bcc)[uVar5 * 10] = 0;
        (&DAT_20003bd0)[uVar5 * 10] = 0;
        DAT_20003f7e = 0;
        puVar4 = (undefined1 *)(uint)DAT_20003f57;
        if (puVar4 == (undefined1 *)0x2) {
          puVar4 = (undefined1 *)0x3;
          DAT_20003f57 = 3;
        }
      }
    }
    uVar5 = uVar5 + 1 & 0xff;
  } while (uVar5 < 4);
  uVar5 = 0;
  do {
    if (((&DAT_20003be1)[uVar5 * 0x28] == '\x02') && ((&DAT_200034d8)[uVar5] == '\x02')) {
      (&DAT_200034d8)[uVar5] = 0;
      FUN_00032c3c(0x140003,"[%d] = MOTOR_STOP",uVar5);
      FUN_00032c4a(0x140003,"t_motor_tobottom_stopNum = [%d], motorAutoCommand = %d",DAT_200034bc,
                   DAT_200034c5);
      DAT_200034bc = DAT_200034bc + 1;
      puVar4 = (undefined1 *)(uint)DAT_200034bb;
      if (puVar4 <= (undefined1 *)(uint)DAT_200034bc) {
        DAT_200034c5 = 0;
      }
    }
    uVar5 = uVar5 + 1 & 0xff;
  } while (uVar5 < 4);
LAB_00029c5c:
  if (DAT_200034bf != '\x01') {
    return;
  }
  if (DAT_20003f7d == '\0') {
    FUN_0002af68(0,puVar4,local_30,local_2c,unaff_r4,unaff_lr);
    FUN_00029d00();
  }
  else {
    FUN_0002afdc(0);
  }
  FUN_000275b0();
  return;
LAB_0002a2c8:
  do {
    if ((&DAT_200034d8)[uVar5] == '\x01') {
      if (DAT_200034cc == 0) {
        DAT_200034cc = FUN_0002b8f0(1);
        if ((&DAT_200034f8)[uVar5] + 5 < (uint)(&DAT_20003bc8)[uVar5 * 10]) {
          if ((&DAT_20003be1)[uVar5 * 0x28] != '\x01') {
            (&DAT_200034ec)[uVar5] = 1;
            DAT_200034b9 = DAT_200034b9 + 1;
          }
        }
        else if ((uint)(&DAT_20003bc8)[uVar5 * 10] < (&DAT_200034f8)[uVar5] - 5) {
          if ((&DAT_20003be1)[uVar5 * 0x28] != '\0') {
            (&DAT_200034ec)[uVar5] = 0;
            DAT_200034b9 = DAT_200034b9 + 1;
          }
          FUN_00032c3c(0x140003,"setdirection[0] = %d",(&DAT_200034ec)[uVar5]);
        }
        else if ((&DAT_20003be1)[uVar5 * 0x28] != '\x02') {
          (&DAT_200034ec)[uVar5] = 2;
        }
        FUN_0002afdc(uVar5,(&DAT_200034ec)[uVar5]);
        (&DAT_20003f5e)[uVar5] = 100;
        (&DAT_200034d8)[uVar5] = 2;
        FUN_000275b0();
        goto LAB_0002a362;
      }
    }
    else {
LAB_0002a362:
      if ((&DAT_200034d8)[uVar5] == '\x02') {
        DAT_200034cc = 0;
        if ((&DAT_200034ec)[uVar5] == '\0') {
          if ((uint)(&DAT_200034f8)[uVar5] <= (uint)(&DAT_20003bc8)[uVar5 * 10]) {
            local_30 = &DAT_20003bc8 + uVar5 * 10;
            if ((&DAT_20003be1)[uVar5 * 0x28] != '\x02') {
              FUN_0002afdc(uVar5,2);
              (&DAT_20003be6)[uVar5 * 0x28] = 1;
              FUN_00032c4a(0x140003,"g_moto_parameter[%d].arrive_OK = %d",uVar5);
              FUN_000275b0();
              FUN_00027c38();
              goto LAB_0002a3b2;
            }
          }
        }
        else {
LAB_0002a3b2:
          if (((&DAT_200034ec)[uVar5] == '\x01') &&
             ((uint)(&DAT_20003bc8)[uVar5 * 10] <= (uint)(&DAT_200034f8)[uVar5])) {
            local_30 = &DAT_20003bc8 + uVar5 * 10;
            if ((&DAT_20003be1)[uVar5 * 0x28] != '\x02') {
              FUN_0002afdc(uVar5,2);
              (&DAT_20003be6)[uVar5 * 0x28] = 1;
              FUN_00032c4a(0x140003,"g_moto_parameter[%d].arrive_OK = %d",uVar5);
              FUN_000275b0();
              FUN_00027c38();
            }
          }
        }
        if (((&DAT_20003be2)[uVar5 * 0x28] == '\x01') && ((&DAT_20003be1)[uVar5 * 0x28] == '\0')) {
          FUN_00032c3c(0x140003,"[%d] = MOTOR_TOP",uVar5);
          FUN_0002afdc(uVar5,2);
          FUN_000275b0();
        }
      }
    }
    uVar5 = uVar5 + 1 & 0xff;
  } while (uVar5 < 4);
  uVar5 = 0;
  do {
    if (((&DAT_20003be1)[uVar5 * 0x28] == '\x02') && ((&DAT_200034d8)[uVar5] == '\x02')) {
      (&DAT_200034d8)[uVar5] = 0;
      DAT_200034ba = DAT_200034ba + 1;
      if (DAT_200034b9 <= DAT_200034ba) {
        FUN_0002af68();
      }
    }
    uVar5 = uVar5 + 1 & 0xff;
  } while (uVar5 < 4);
  goto LAB_0002a46a;
LAB_0002a64e:
  do {
    if ((&DAT_200034d8)[uVar5] == '\x01') {
      if (DAT_200034cc == 0) {
        DAT_200034cc = FUN_0002b8f0(1);
        if ((&DAT_20003be1)[uVar5 * 0x28] != '\x01') {
          FUN_0002afdc(uVar5,1);
          DAT_200034bb = DAT_200034bb + 1;
        }
        (&DAT_20003f5e)[uVar5] = 100;
        (&DAT_200034d8)[uVar5] = 2;
        FUN_000275b0();
        goto LAB_0002a694;
      }
    }
    else {
LAB_0002a694:
      if (((&DAT_200034d8)[uVar5] == '\x02') && (DAT_200034cc = 0, (&DAT_20003f5e)[uVar5] == 0)) {
        FUN_0002afdc(uVar5,2);
        FUN_000275b0();
        (&DAT_20003be6)[uVar5 * 0x28] = 2;
        FUN_00027c38();
        (&DAT_20003bc8)[uVar5 * 10] = 0;
        (&DAT_20003bcc)[uVar5 * 10] = 0;
        (&DAT_20003bd0)[uVar5 * 10] = 0;
        DAT_20003f7e = 0;
        if (DAT_20003f57 == 2) {
          DAT_20003f57 = 3;
        }
      }
    }
    bVar1 = DAT_200034bb;
    uVar5 = uVar5 + 1 & 0xff;
  } while (uVar5 < 4);
  uVar5 = 0;
  puVar4 = &DAT_200034b8;
  do {
    if (((&DAT_20003be1)[uVar5 * 0x28] == '\x02') && ((&DAT_200034d8)[uVar5] == '\x02')) {
      (&DAT_200034d8)[uVar5] = 0;
      DAT_200034bc = DAT_200034bc + 1;
      if (bVar1 <= DAT_200034bc) {
        DAT_200034c5 = 0;
      }
    }
    uVar5 = uVar5 + 1 & 0xff;
  } while (uVar5 < 4);
  goto LAB_00029c5c;
}


