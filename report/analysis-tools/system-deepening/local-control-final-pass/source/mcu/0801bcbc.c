/* Ghidra static pseudocode; not original source. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */
/* WARNING: Restarted to delay deadcode elimination for space: ram */

void FUN_0801bcbc(void)

{
  undefined1 *puVar1;
  undefined1 *puVar2;
  undefined1 *puVar3;
  undefined1 *puVar4;
  undefined1 *puVar5;
  undefined1 uVar6;
  ushort uVar7;
  code *pcVar8;
  int iVar9;
  undefined4 uVar10;
  int iVar11;
  char *pcVar12;
  uint uVar13;
  uint uVar14;
  undefined4 uVar15;
  byte *pbVar16;
  char cVar17;
  byte bVar18;
  char **ppcVar19;
  undefined4 extraout_r1;
  int iVar20;
  uint uVar21;
  uint uVar22;
  int *piVar23;
  undefined4 *puVar24;
  undefined4 uVar25;
  undefined *puVar26;
  char *pcVar27;
  uint uVar28;
  byte *pbVar29;
  undefined1 *puVar30;
  undefined4 *puVar31;
  char *pcVar32;
  undefined1 *local_130;
  code *local_128;
  char **local_124;
  undefined1 *local_120;
  undefined1 *local_118;
  int local_114;
  uint local_110;
  uint local_108;
  undefined *local_104;
  undefined *local_100;
  undefined1 *local_fc;
  undefined1 auStack_f4 [26];
  byte bStack_da;
  byte bStack_d8;
  byte bStack_d4;
  undefined1 uStack_d3;
  undefined4 local_cc;
  undefined1 auStack_c8 [36];
  undefined4 local_a4;
  undefined4 local_a0;
  undefined4 local_9c;
  ushort local_98;
  ushort local_96;
  ushort local_94;
  undefined4 uStack_7c;
  code *local_78;
  code *local_74;
  code *local_70;
  code *local_6c;
  code *local_68;
  code *local_64;
  code *local_60;
  code *pcStack_58;
  int local_54;
  undefined4 local_50;
  undefined4 local_4c;
  undefined4 local_48;
  undefined4 local_44;
  undefined4 local_40;
  undefined4 local_3c;
  undefined4 local_38;
  undefined4 local_34;
  undefined4 local_30;
  int local_2c;
  int local_28;
  int local_24;
  code *local_20 [3];
  
  enableIRQinterrupts();
  FUN_0801066c(&uStack_7c,0,100);
  DAT_200020d4 = _DAT_40021060;
  _DAT_40021060 = _DAT_40021060 | 0x800000;
  DAT_200020bc = DAT_2000d2fc == 0x48465254;
  if ((bool)DAT_200020bc) {
    DAT_200020c0 = DAT_2000d2fc;
    DAT_200020c4 = DAT_2000d300;
    DAT_200020c8 = DAT_2000d304;
    DAT_200020cc = DAT_2000d308;
    DAT_200020d0 = DAT_2000d30c;
    DAT_2000d2fc = 0x48465443;
  }
  local_a4 = 0x807f804;
  local_a0 = 0x200;
  local_9c = 0;
  local_cc = 0;
  iVar9 = FUN_08016c36(&local_a4,0,&local_cc);
  DAT_200015a4 = '\0';
  if ((iVar9 != 0) && (local_cc != 0)) {
    FUN_08023d60(&local_a4,"devicesn",&DAT_200015a8);
    FUN_08023d60(&local_a4,&DAT_0802e1b8,&DAT_200015ac);
    FUN_08023d60(&local_a4,&DAT_0802e1bb,&DAT_200015b0);
    FUN_08023d80(&local_a4,&DAT_0802e1bf,&DAT_200015b4);
    FUN_08023d80(&local_a4,"factoryline",&DAT_200015b6);
    FUN_08023d60(&local_a4,"datecode",&DAT_200015b8);
    DAT_200015a4 = '\x01';
  }
  uVar7 = DAT_200015b4;
  puVar26 = &UNK_0802fb64;
  local_114 = 0;
  do {
    if (*(ushort *)(puVar26 + 4) <= uVar7) {
      (**(code **)(puVar26 + 8))(&uStack_7c);
    }
    puVar26 = puVar26 + 0xc;
    local_114 = local_114 + 1;
  } while (local_114 != 10);
  (*local_78)();
  FUN_0801066c(&DAT_200018bc,0,0x800);
  FUN_0801066c(&DAT_200015bc,0,0x300);
  DAT_20002510 = local_48;
  DAT_20002504 = local_54;
  DAT_20002514 = '\x01' - (local_54 == 0);
  DAT_200024e0 = 0x800;
  DAT_200024dc = &DAT_200018bc;
  DAT_200024f4 = 0x40;
  DAT_200024e8 = 0;
  DAT_2000250c = local_4c;
  DAT_200024ec = 0;
  DAT_200024f8 = 0xc;
  DAT_200024fc = 0;
  DAT_20002508 = local_50;
  DAT_20002518 = 0;
  DAT_2000251c = 0;
  DAT_20002520 = 0;
  DAT_200024e4 = 1;
  DAT_200024f0 = &DAT_200015bc;
  DAT_20002500 = 0;
  (*local_74)();
  DAT_200015a0 = &DAT_200024dc;
  DAT_2000a5c8 = &DAT_200023d8;
  DAT_2000a5cc = 0x100;
  DAT_2000a5d4 = &DAT_200023d4;
  DAT_20002534 = 0;
  DAT_2000a5dc = 2;
  DAT_20002538 = 0x8016f1d;
  DAT_20002584 = 0;
  DAT_2000257c = 0;
  DAT_20002580 = 0;
  FUN_0801066c(&DAT_20002588,0,0x8040);
  DAT_20002588 = 0x801aefd;
  DAT_2000a5b4 = 0;
  DAT_2000a5b8 = 0;
  DAT_2000a5bc = 0;
  DAT_2000a5c4 = 60000;
  DAT_2000a5c0 = FUN_08011424();
  iVar9 = 0;
  do {
    iVar11 = iVar9 * 0x401;
    iVar9 = iVar9 + 1;
    (&DAT_20002594)[iVar11] = 1;
  } while (iVar9 != 0x20);
  DAT_2000258c = &DAT_20002595;
  DAT_20002590 = &DAT_20002594;
  DAT_2000a5d0 = 0;
  *DAT_2000a5d4 = 0;
  DAT_2000a5d8 = 0;
  DAT_2000a5e0 = 0;
  DAT_2000a5e4 = 0;
  if (DAT_200015a4 != '\0') {
    FUN_08017634("HWINFO sn %08x pn %u sku %x hw %04x f %x d %x",DAT_200015a8,DAT_200015ac,
                 DAT_200015b0,DAT_200015b4,DAT_200015b6,DAT_200015b8);
  }
  DAT_2000cf78 = local_70;
  DAT_2000cf84 = 1;
  FUN_08016fce(&DAT_2000cf7c,1000);
  (*local_70)(1);
  FUN_08017634("[sys] status initialized");
  DAT_2000cf98 = local_68;
  FUN_08027fb8(&DAT_2000cf9c,local_20,8);
  (*local_20[0])(0,1);
  FUN_08017634("[sys] balloon g0 v%s running","0.2.71.0");
  FUN_080242a0(&DAT_2000a5e8,local_44,local_40,1);
  FUN_080242a0(&DAT_2000a754,local_3c,local_38,2);
  FUN_080242a0(&DAT_2000a8c0,local_34,local_30,3);
  FUN_08011458(10);
  FUN_08017484(&DAT_2000cf88);
  FUN_08017006(&DAT_2000cf88);
  DAT_2000cf94 = local_6c;
  FUN_0801066c(&DAT_2000aa30,0,0x2548);
  (*local_64)(&DAT_2000aa30);
  (*local_60)(&DAT_2000aa30);
  local_128 = local_68;
  if (local_68 != (code *)0x0) {
    local_128 = (code *)(*local_68)();
  }
  pcVar8 = local_128;
  if (local_2c == 0) {
    FUN_0801cdb8();
  }
  if (local_28 == 0) {
    FUN_0801cdb8();
  }
  if (local_24 == 0) {
    FUN_0801cdb8();
  }
  uVar7 = DAT_200015b4;
  uVar10 = FUN_08015f10();
  DAT_2000cea3 = (byte)uVar10;
  FUN_08017634("[balloon] active_bag_count=%u (hwrev=0x%04x)",uVar10,uVar7);
  cVar17 = '\0';
  DAT_2000b09c = local_2c;
  DAT_2000b0a0 = local_28;
  DAT_2000b0a4 = local_24;
  puVar24 = &DAT_2000ab1c;
  do {
    cVar17 = cVar17 + '\x01';
    *(undefined1 *)(puVar24 + 5) = 0;
    *(undefined1 *)((int)puVar24 + 0x15) = 0;
    *(undefined1 *)((int)puVar24 + 0x16) = 0;
    *puVar24 = 0xbf800000;
    puVar24[1] = 0xbf800000;
    puVar24 = puVar24 + 0x41;
  } while (cVar17 != '\x06');
  DAT_2000b098 = 0;
  DAT_2000b09a = 0;
  DAT_2000b048 = 0xbf800000;
  DAT_2000b07c = 0xbf800000;
  DAT_2000b080 = 0xbf800000;
  DAT_2000b084 = 0;
  FUN_08016fce(&DAT_2000b088,0x32);
  FUN_0801066c(&DAT_2000b050,0,0x28);
  DAT_2000b050 = 0x382ec161;
  DAT_2000b064 = 0x4b0;
  DAT_2000b06c = 0x4b0;
  FUN_08016fce(&DAT_2000b090,30000);
  if (DAT_2000b0b3 == '\0') {
    FUN_08017634("[pressure] ERROR: mapping not configured, using A00 default");
    _DAT_2000b0ac = 0x2030405;
    _DAT_2000b0b0 = 0x1050001;
    DAT_2000b0b4 = '\x01';
  }
  DAT_2000b078 = DAT_2000b0b2;
  FUN_08017634(
              "[pressure] initializing pressure sensors (reduced retries, runtime recovery enabled)"
              );
  FUN_08017634("[pressure] mapping: I2C1=%d,%d I2C2=%d,%d I2C3=%d,%d atmo=%d",_DAT_2000b0ac & 0xff,
               DAT_2000b0ad,(undefined1)DAT_2000b0ae,_DAT_2000b0ac >> 0x18,_DAT_2000b0b0 & 0xff,
               _DAT_2000b0b0 >> 8 & 0xff,_DAT_2000b0b0 >> 0x10 & 0xff);
  FUN_08022f48(&DAT_2000aa30 + (_DAT_2000b0ac & 0xff) * 0x104,
               &DAT_2000aa30 + (_DAT_2000b0ac >> 8 & 0xff) * 0x104,local_2c,"_sens0","_sens1",1,
               &local_cc,&local_a4);
  (&DAT_2000ab30)[(_DAT_2000b0ac & 0xff) * 0x104] = (undefined1)local_cc;
  (&DAT_2000ab30)[(_DAT_2000b0ac >> 8 & 0xff) * 0x104] = (undefined1)local_a4;
  uVar10 = 2;
  pcVar32 = "_sens3";
  FUN_08022f48(&DAT_2000aa30 + (_DAT_2000b0ac >> 0x10 & 0xff) * 0x104,
               &DAT_2000aa30 + (_DAT_2000b0ac >> 0x18) * 0x104,local_28,"_sens2","_sens3",2,
               &local_cc,&local_a4);
  (&DAT_2000ab30)[(_DAT_2000b0ac >> 0x10 & 0xff) * 0x104] = (undefined1)local_cc;
  (&DAT_2000ab30)[(_DAT_2000b0ac >> 0x18) * 0x104] = (undefined1)local_a4;
  if (DAT_2000b0b4 == '\0') {
    FUN_08017634("[pressure] I2C3 low sensor (sensor %d) not present, skipping");
    (&DAT_2000ab30)[(_DAT_2000b0b0 & 0xff) * 0x104] = 1;
    iVar9 = FUN_08022d40(&DAT_2000aa30 + (_DAT_2000b0b0 >> 8 & 0xff) * 0x104,local_24,0x5d,"_sens5")
    ;
    (&DAT_2000ab30)[(_DAT_2000b0b0 >> 8 & 0xff) * 0x104] = (byte)iVar9 ^ 1;
    if (iVar9 == 0) {
      pcVar12 = "[pressure] I2C3 high sensor (atmospheric) FAILED";
    }
    else {
      pcVar12 = "[pressure] I2C3 high sensor (atmospheric) initialized successfully";
    }
    FUN_08017634(pcVar12);
  }
  else {
    uVar10 = 3;
    pcVar32 = "_sens5";
    FUN_08022f48(&DAT_2000aa30 + (_DAT_2000b0b0 & 0xff) * 0x104,
                 &DAT_2000aa30 + (_DAT_2000b0b0 >> 8 & 0xff) * 0x104,local_24,"_sens4","_sens5",3,
                 &local_cc,&local_a4);
    (&DAT_2000ab30)[(_DAT_2000b0b0 & 0xff) * 0x104] = (undefined1)local_cc;
    (&DAT_2000ab30)[(_DAT_2000b0b0 >> 8 & 0xff) * 0x104] = (undefined1)local_a4;
  }
  iVar9 = 0;
  uVar28 = 0;
  do {
    if ((&DAT_2000ab30)[iVar9 * 0x104] != '\0') {
      uVar28 = uVar28 + 1 & 0xff;
      FUN_08017634("[pressure] sensor %d marked as FAILED (will attempt runtime recovery)",iVar9);
    }
    iVar9 = iVar9 + 1;
  } while (iVar9 != 6);
  iVar9 = 0;
  FUN_08017634("[pressure] initialization complete: %d/%d sensors operational",6 - uVar28,6);
  _DAT_2000cf60 = 0;
  if (uVar7 < 4) {
    FUN_0801066c(&DAT_2000b514,0,0x164);
    DAT_2000b545 = 0;
    DAT_2000b524 = 4;
    DAT_2000b668 = local_2c;
    DAT_2000b530 = 0x466a6000;
    DAT_2000b534 = 0x461c4000;
    DAT_2000b538 = 0x461c4000;
    DAT_2000b53c = 0x466a6000;
    cVar17 = '\0';
    FUN_08016fce(&DAT_2000b528,100);
    puVar26 = &DAT_2000b548;
    puVar30 = &DAT_2000b541;
    do {
      uVar6 = (&DAT_0802fb60)[iVar9];
      uVar25 = (&DAT_0802fb50)[iVar9];
      iVar11 = FUN_0801ad2c(puVar26,local_2c,uVar6);
      if (iVar11 == 0) {
        *puVar30 = 1;
        puVar30[299] = 10;
        FUN_08017634("[current_sensing] failed to init sensor %s (0x%02x)",uVar25,uVar6);
      }
      else {
        cVar17 = cVar17 + '\x01';
        *puVar30 = 0;
        puVar30[299] = 0;
      }
      iVar9 = iVar9 + 1;
      puVar26 = puVar26 + 0x48;
      puVar30 = puVar30 + 1;
    } while (iVar9 != 4);
    DAT_2000b546 = '\x01' - (cVar17 == '\0');
    if (cVar17 == '\0') {
      FUN_08017634("[current_sensing] FAILED: no INA230 sensors initialized");
    }
    else {
      FUN_08017634("[current_sensing] INA230 mode: %d/%d sensors ok",cVar17,4);
    }
    if (DAT_2000b546 == '\0') {
      FUN_08017634("[balloon] WARNING: I2C current sensing failed to initialize");
    }
    goto LAB_0801c898;
  }
  FUN_0801066c(&DAT_2000cec8,0,0x98);
  DAT_2000cec8 = 0;
  DAT_2000cf3c = &DAT_0802e53d;
  DAT_2000cecc = local_2c;
  DAT_2000cf50 = 0;
  FUN_08017484(&DAT_2000cf54);
  DAT_2000cf02 = 0x76;
  DAT_2000cf0c = &DAT_2000cf30;
  DAT_2000cf04 = 1;
  DAT_2000cf00 = 0;
  DAT_2000cf14 = 0;
  DAT_2000cf10 = 0;
  DAT_2000cf1a = 0x76;
  DAT_2000cf24 = &DAT_2000cf34;
  DAT_2000cf1c = 1;
  DAT_2000cf18 = 1;
  DAT_2000cf2c = 0x8017019;
  DAT_2000cf28 = &DAT_2000cec8;
  iVar9 = FUN_08023098(0xd);
  if (iVar9 == 0) {
    FUN_08017634("[dps%s] failed product id read (0x%02x)",&DAT_0802e53d,0x76);
  }
  else {
    uVar28 = DAT_2000cf34 & 0xf;
    if ((DAT_2000cf34 & 0xf) == 0) {
      iVar9 = FUN_0802304c(0xc,9);
      if (iVar9 == 0) {
        pcVar32 = "[dps%s] failed reset";
      }
      else {
        FUN_08011458(0x32);
        do {
          iVar9 = FUN_08023098(8);
          if (iVar9 == 0) {
            pcVar32 = "[dps%s] failed meas_cfg read";
            goto LAB_0801c6f4;
          }
          if ((DAT_2000cf34 & 0xc0) == 0xc0) {
            iVar9 = 0;
            goto LAB_0801c5de;
          }
          uVar28 = uVar28 + 1;
          FUN_08011458(10);
        } while (uVar28 != 10);
        pcVar32 = "[dps%s] sensor not ready after reset";
      }
      goto LAB_0801c6f4;
    }
    FUN_08017634("[dps%s] bad product id 0x%02x (0x%02x)",&DAT_0802e53d,(uint)DAT_2000cf34,0x76);
  }
  goto LAB_0801c46c;
  while( true ) {
    *(byte *)((int)&local_a4 + iVar9) = DAT_2000cf34;
    iVar9 = iVar9 + 1;
    if (iVar9 == 0x12) break;
LAB_0801c5de:
    iVar11 = FUN_08023098(iVar9 + 0x10U & 0xff);
    if (iVar11 == 0) goto LAB_0801c6f0;
  }
  uVar28 = (local_a4 & 0xff) << 4;
  DAT_2000ced0 = uVar28 | local_a4._1_1_ >> 4;
  if ((uVar28 & 0x800) != 0) {
    DAT_2000ced0 = DAT_2000ced0 - 0x1000;
  }
  uVar28 = (local_a4._1_1_ & 0xf) << 8;
  DAT_2000ced4 = uVar28 | local_a4 >> 0x10 & 0xff;
  if ((uVar28 & 0x800) != 0) {
    DAT_2000ced4 = DAT_2000ced4 - 0x1000;
  }
  uVar28 = (local_a4 >> 0x18) << 0xc;
  DAT_2000ced8 = (local_a0 & 0xff) << 4 | uVar28 | (uint)(local_a0._1_1_ >> 4);
  if ((uVar28 & 0x80000) != 0) {
    DAT_2000ced8 = DAT_2000ced8 - 0x100000;
  }
  uVar28 = (local_a0._1_1_ & 0xf) << 0x10;
  DAT_2000cedc = uVar28 | (local_a0._2_2_ & 0xff) << 8 | (uint)(local_a0._2_2_ >> 8);
  if ((uVar28 & 0x80000) != 0) {
    DAT_2000cedc = DAT_2000cedc - 0x100000;
  }
  DAT_2000cee0 = (local_9c & 0xff) << 8 | (uint)((ushort)local_9c >> 8);
  if ((short)((ushort)((local_9c & 0xff) << 8) | (ushort)local_9c >> 8) < 0) {
    DAT_2000cee0 = DAT_2000cee0 - 0x10000;
  }
  DAT_2000cee4 = (local_9c._2_2_ & 0xff) << 8 | (uint)(local_9c._2_2_ >> 8);
  if ((short)((ushort)((local_9c._2_2_ & 0xff) << 8) | local_9c._2_2_ >> 8) < 0) {
    DAT_2000cee4 = DAT_2000cee4 - 0x10000;
  }
  DAT_2000cee8 = (local_98 & 0xff) << 8 | (uint)(local_98 >> 8);
  if ((short)((ushort)((local_98 & 0xff) << 8) | local_98 >> 8) < 0) {
    DAT_2000cee8 = DAT_2000cee8 - 0x10000;
  }
  DAT_2000ceec = (local_96 & 0xff) << 8 | (uint)(local_96 >> 8);
  if ((short)((ushort)((local_96 & 0xff) << 8) | local_96 >> 8) < 0) {
    DAT_2000ceec = DAT_2000ceec - 0x10000;
  }
  DAT_2000cef0 = (local_94 & 0xff) << 8 | (uint)(local_94 >> 8);
  if ((short)((ushort)((local_94 & 0xff) << 8) | local_94 >> 8) < 0) {
    DAT_2000cef0 = DAT_2000cef0 - 0x10000;
  }
  iVar9 = FUN_08023098(0x28);
  if (iVar9 == 0) {
LAB_0801c6f0:
    pcVar32 = "[dps%s] failed to read calibration coefficients";
  }
  else {
    DAT_2000cef4 = DAT_2000cf34 >> 7;
    DAT_2000cef8 = 0x7e000;
    DAT_2000cefc = 0x80000;
    iVar9 = FUN_0802304c(6,0x45);
    if (iVar9 == 0) {
      pcVar32 = "[dps%s] failed prs_cfg write";
    }
    else {
      iVar9 = FUN_0802304c(7,(DAT_2000cef4 & 1) << 7 | 0x20);
      if (iVar9 == 0) {
        pcVar32 = "[dps%s] failed tmp_cfg write";
      }
      else {
        iVar9 = FUN_0802304c(9,4);
        if (iVar9 == 0) {
          pcVar32 = "[dps%s] failed cfg_reg write";
        }
        else {
          iVar9 = FUN_0802304c(8,7);
          iVar11 = 0;
          if (iVar9 == 0) {
            pcVar32 = "[dps%s] failed to start continuous mode";
          }
          else {
            do {
              iVar9 = FUN_08023098(8);
              if (iVar9 == 0) {
                pcVar32 = "[dps%s] failed meas_cfg poll";
                goto LAB_0801c6f4;
              }
              if ((DAT_2000cf34 & 0x10) != 0) {
                DAT_2000cec8 = 1;
                pcVar32 = "int";
                if (DAT_2000cef4 != 0) {
                  pcVar32 = "ext";
                }
                FUN_08017634("[dps%s] init ok (0x%02x) coef_src=%s c0=%d c1=%d",&DAT_0802e53d,0x76,
                             pcVar32,DAT_2000ced0,DAT_2000ced4);
                _DAT_2000cf60 = 1;
                goto LAB_0801c81e;
              }
              iVar11 = iVar11 + 1;
              FUN_08011458(10);
            } while (iVar11 != 0x14);
            pcVar32 = "[dps%s] no first conversion";
          }
        }
      }
    }
  }
LAB_0801c6f4:
  FUN_08017634(pcVar32,&DAT_0802e53d);
LAB_0801c46c:
  _DAT_2000cf60 = _DAT_2000cf60 & 0xff00;
  FUN_08017634("[balloon] WARNING: DPS368 ambient sensor failed to initialize");
LAB_0801c81e:
  _DAT_2000cf60 = CONCAT11(4 < uVar7,DAT_2000cf60);
  FUN_0801066c(&DAT_2000b514,0,0x164);
  DAT_2000b545 = 1;
  DAT_2000b524 = 4;
  DAT_2000b530 = 0x459c4000;
  DAT_2000b534 = 0;
  DAT_2000b538 = 0x459c4000;
  DAT_2000b53c = 0x459c4000;
  FUN_08016fce(&DAT_2000b528,100);
  DAT_2000b546 = '\x01';
  uVar25 = FUN_08016f60(0x42480000,1);
  pcVar32 = (char *)FUN_08016f60(0x3c23d70a,1000);
  uVar10 = FUN_08016f6e(0x3c23d70a,1000);
  FUN_08017634("[current_sensing] ADC mode initialized (INA181): 2 sensors, gain=%s%u, shunt=%s%u.%03u ohms"
               ,"",uVar25,"",pcVar32,uVar10);
LAB_0801c898:
  FUN_0801066c(&DAT_2000b678,0,0x2e8);
  DAT_2000b678 = &DAT_2000b514;
  DAT_2000b67c = &DAT_2000cd6c;
  FUN_08016fce(&DAT_2000b680,100);
  puVar26 = &DAT_2000b6d8;
  uVar21 = (uint)DAT_2000b524;
  puVar24 = &DAT_2000b688;
  for (uVar28 = 0; uVar28 < uVar21; uVar28 = uVar28 + 1) {
    puVar24[1] = 10;
    puVar24[2] = 0x10;
    *puVar24 = puVar26;
    (&DAT_2000b694)[uVar28 * 5] = 0;
    (&DAT_2000b698)[uVar28 * 5] = 0;
    puVar26 = puVar26 + 0xa0;
    puVar24 = puVar24 + 5;
  }
  DAT_2000b95c = 1;
  FUN_08017634("[current_sampling] initialized (rate=%dHz, sensors=%d)",10,uVar21,0xf2c,pcVar32,
               uVar10);
  puVar24 = &DAT_2000c73c;
  FUN_0801066c(&DAT_2000c73c,0,0x60);
  DAT_2000c78c = 0;
  DAT_2000c790 = 0x41400000;
  DAT_2000c794 = 0x3f99999a;
  cVar17 = '\n';
  do {
    *puVar24 = 0x3e99999a;
    puVar24[1] = 0x3e99999a;
    puVar24 = puVar24 + 2;
    cVar17 = cVar17 + -1;
  } while (cVar17 != '\0');
  DAT_2000c798 = 1;
  uVar10 = FUN_08016f60(0,10);
  uVar25 = FUN_08016f6e(0,10);
  uVar21 = FUN_08016f60(0x41400000,10);
  uVar13 = FUN_08016f6e(0x41400000,10);
  uVar14 = FUN_08016f60(0x3f99999a,100);
  uVar15 = FUN_08016f6e(0x3f99999a,100);
  pcVar32 = "";
  pcVar12 = "";
  FUN_08017634("[tolerance_bins] initialized: range=%s%u.%01u-%s%u.%01u kPa, bin_width=%s%u.%02u kPa"
               ,"",uVar10,uVar25,"",uVar21,uVar13,"",uVar14,uVar15);
  FUN_08021c28(&DAT_2000c73c,0,0x41200000);
  FUN_08021d58(&DAT_2000c73c,0,0x3dcccccd);
  FUN_08021d58(&DAT_2000c73c,1,0x3e19999a);
  FUN_08021d58(&DAT_2000c73c,2,0x3e800000);
  FUN_08021d58(&DAT_2000c73c,3,0x3e99999a);
  FUN_08021d58(&DAT_2000c73c,4,0x3ecccccd);
  FUN_08021d58(&DAT_2000c73c,5,0x3ecccccd);
  FUN_08021d58(&DAT_2000c73c,6,0x3ecccccd);
  FUN_08021d58(&DAT_2000c73c,7,0x3f000000);
  FUN_08021d58(&DAT_2000c73c,8,0x3f000000);
  FUN_08021d58(&DAT_2000c73c,9,0x3f000000);
  for (uVar28 = 0; uVar28 < DAT_2000cea3; uVar28 = uVar28 + 1 & 0xff) {
    FUN_08020fa8(&DAT_2000c79c + uVar28 * 0x18);
  }
  FUN_0801066c(&DAT_2000cd6c,0,0x28);
  FUN_08016fce(&DAT_2000cd78,1000);
  FUN_08016fce(&DAT_2000cd80,1000);
  FUN_08016fce(&DAT_2000cd88,1000);
  DAT_2000cd90 = 0;
  FUN_0801066c(&DAT_2000c538,0,0x204);
  puVar31 = (undefined4 *)0x2000bfa8;
  DAT_2000c538 = 0x320001;
  DAT_2000c53c = 3000;
  DAT_2000c540 = 60000;
  DAT_2000c724 = 0;
  pbVar29 = &DAT_2000bf88;
  DAT_2000c728 = 0x7fc00000;
  puVar24 = (undefined4 *)0x2000c048;
  local_120 = &DAT_2000c028;
  local_118 = &DAT_2000aa30;
  local_110 = 0;
  local_124 = (char **)0x0;
  do {
    uVar28 = local_110;
    pcVar27 = &DAT_2000aa30;
    if ((local_110 & 0xff) < (uint)DAT_2000cea3) {
      local_108 = local_110;
      local_104 = &DAT_2000bb94 + local_110 * 0xa8;
      local_100 = &DAT_2000c79c + local_110 * 0x18;
      local_110 = local_110 + 1;
      local_fc = local_118 + 0xe0;
      if (local_110 == 6) {
        pcVar27 = "[balloon] failed to initialize bag task %u";
        ppcVar19 = (char **)0x5;
LAB_0801cdb4:
        FUN_08017634(pcVar27,ppcVar19);
        pcVar27 = "not ";
        goto LAB_0801cdba;
      }
    }
    else {
      FUN_0801066c(&DAT_2000c3e8,0,0x150);
      DAT_2000c404 = &DAT_2000b960;
      DAT_2000c408 = &DAT_2000aa30;
      DAT_2000c40c = &DAT_2000cd6c;
      DAT_2000c3e8 = 4;
      DAT_2000c415 = 0;
      DAT_2000c416 = 0;
      DAT_2000c430 = 0;
      DAT_2000c434 = &LAB_0801eb38_1;
      DAT_2000c4d8 = 0;
      DAT_2000c400 = 0;
      DAT_2000c4dc = 120000;
      DAT_2000c4e0 = 90000;
      DAT_2000c4e4 = 240000;
      _DAT_2000c4e8 = 0;
      FUN_0801066c(&DAT_2000c4f8,0,8);
      DAT_2000c4f8 = 0x42c80000;
      DAT_2000c4fc = 0x6414;
      DAT_2000c4fe = 1;
      DAT_2000c514 = 0x32;
      FUN_08016fce(&DAT_2000c50c);
      DAT_2000c528 = 5;
      DAT_2000c52c = 0x3c;
      DAT_2000c530 = 0;
      DAT_2000c3ec = 0;
      DAT_2000c3f0 = 0;
      DAT_2000c3f4 = 0;
      DAT_2000c3f8 = 0;
      DAT_2000c3fc = 0;
      DAT_2000c534 = '\x01';
      FUN_08017634("[scheduler] initialized");
      for (; local_124 < (char **)(uint)DAT_2000cea3;
          local_124 = (char **)((int)local_124 + 1U & 0xff)) {
        if (DAT_2000c534 == '\0') {
LAB_0801cf88:
          pcVar27 = "[balloon] failed to register bag task %u";
          ppcVar19 = local_124;
          goto LAB_0801cdb4;
        }
        uVar22 = (uint)DAT_2000c400;
        uVar6 = (&DAT_2000bf88)[(int)local_124 * 0xe0];
        if (4 < uVar22) {
          FUN_08017634("[scheduler] cannot register bag %u: max bags reached",uVar6);
          goto LAB_0801cf88;
        }
        DAT_2000c400 = DAT_2000c400 + 1;
        (&DAT_2000c3ec)[uVar22] = &DAT_2000bf88 + (int)local_124 * 0xe0;
        FUN_08017634("[scheduler] registered bag %u (total: %u)",uVar6);
      }
      FUN_08017634("[balloon] initialized task-scheduler architecture (%u bags)");
      FUN_0801066c(&DAT_2000c814,0,0x18);
      DAT_2000c814 = &DAT_2000b960;
      DAT_2000c818 = &DAT_2000c3e8;
      DAT_2000c81c = &DAT_2000bb94;
      DAT_2000c824 = &DAT_0802fae8;
      DAT_2000c820 = 0;
      DAT_2000c828 = 1;
      iVar9 = FUN_08021ab0(&DAT_2000c814,0);
      if (iVar9 == 0) {
        pcVar32 = "[balloon] failed to apply default mode";
LAB_0801cb88:
        FUN_08017634(pcVar32);
        FUN_0801cdb8();
        return;
      }
      FUN_0801066c(&DAT_2000c82c,0,0x540);
      DAT_2000c82c = &DAT_2000aa30;
      DAT_2000c830 = &DAT_2000cd6c;
      FUN_08016fce(&DAT_2000c834,0x32);
      iVar11 = 0x2000c8b4;
      piVar23 = (int *)&DAT_2000c83c;
      iVar9 = 0;
      do {
        piVar23[1] = 10;
        *piVar23 = iVar11;
        piVar23[2] = 0x14;
        (&DAT_2000c848)[iVar9 * 5] = 0;
        iVar20 = iVar9 + 1;
        (&DAT_2000c84c)[iVar9 * 5] = 0;
        iVar11 = iVar11 + 200;
        piVar23 = piVar23 + 5;
        iVar9 = iVar20;
      } while (iVar20 != 6);
      DAT_2000cd64 = 0;
      DAT_2000cd68 = 1;
      FUN_08017634("[lps_sampling] initialized with %d sensors at %dHz (FIFO buffering)",6,0x14);
      DAT_2000cdb6 = uVar7 != 0;
      if (uVar7 == 0) {
        FUN_08017634("[balloon] mux controller not available (hwrev=0x%04x < A01)",0);
        _DAT_2000cea0 = uVar7;
      }
      else {
        FUN_0801066c(&DAT_2000b0b8,0,0x90);
        DAT_2000b0bc = &DAT_2000aa30;
        FUN_0801066c(&DAT_20001592,0,0xe);
        FUN_0801066c(&DAT_20001584,0,0xe);
        DAT_20001580 = 0;
        FUN_08011c20(&DAT_20000638);
        iVar9 = FUN_08011cac(&DAT_20000638);
        if (iVar9 != 0) {
          FUN_08017634("[sensors_adc] calibration failed: status=%u error=0x%02lx",iVar9,
                       uRam20000694);
          FUN_08017634("[mux] failed to initialize sensors_adc");
          pcVar32 = "[balloon] failed to initialize mux controller";
          goto LAB_0801cb88;
        }
        FUN_08017634("[sensors_adc] initialized with %u channels",DAT_20000464);
        FUN_08016fce(0x2000b0c8,1000);
        FUN_08017484(0x2000b0d0);
        FUN_08017484(0x2000b0dc);
        uRam2000b144 = 60000;
        iRam2000b140 = FUN_08011424();
        iRam2000b140 = iRam2000b140 + -55000;
        FUN_080202f4(0);
        DAT_2000b0c0 = &UNK_08020355;
        uRam2000b0c4 = 0;
        DAT_2000b0b8 = 1;
        FUN_08017634("[mux] initialized: %u bags @ %uHz",DAT_2000b0bc[0x2473],1);
        FUN_08017634("[balloon] mux controller initialized (hwrev=0x%04x)",uVar7);
        FUN_08017634("[sht40] attempting init with i2c%u",*(undefined1 *)(local_2c + 0x130));
        DAT_2000b1d0 = 0;
        DAT_2000b194 = 0;
        DAT_2000b190 = 0xc2c80000;
        DAT_2000b18c = 0xc2c80000;
        FUN_08017484(&DAT_2000b198);
        DAT_2000b1c0 = 0;
        FUN_08017484(&DAT_2000b1c4);
        DAT_2000b1e8 = &PTR_LAB_08015f00_1_0802fac8;
        DAT_2000b1ec = &DAT_2000b148;
        _DAT_2000b1f0 = 0;
        DAT_2000b208 = 0;
        DAT_2000b224 = 0;
        DAT_2000b22c = 5;
        DAT_2000b1e0 = iVar9;
        DAT_2000b1f4 = iVar9;
        DAT_2000b1f8 = iVar9;
        DAT_2000b228 = iVar9;
        FUN_08017484(&DAT_2000b1fc);
        FUN_08017484(&DAT_2000b20c);
        FUN_08017484(&DAT_2000b218);
        DAT_2000b148 = local_2c;
        uRam2000b14e = 0x44;
        uRam2000b16e = 0x44;
        DAT_2000b150 = 1;
        DAT_2000b170 = 1;
        DAT_2000b158 = &uRam2000b164;
        DAT_2000b178 = 0x2000b184;
        DAT_2000b14c = 0;
        DAT_2000b16c = 1;
        DAT_2000b154 = 1;
        uRam2000b164 = 0x94;
        DAT_2000b15c = iVar9;
        DAT_2000b160 = iVar9;
        DAT_2000b17c = iVar9;
        DAT_2000b180 = iVar9;
        iVar9 = FUN_08018390(local_2c,&DAT_2000b14c);
        if ((iVar9 == 0) || (iVar9 = FUN_0801acdc(DAT_2000b148,&DAT_2000b150), iVar9 != 1)) {
          FUN_08017634("[sht40] init failed");
          DAT_2000cdb8 = 0;
          FUN_08017634("[balloon] WARNING: SHT40 ambient sensor failed to initialize");
        }
        else {
          DAT_2000b1d0 = 1;
          uRam2000b1d4 = 0;
          DAT_2000b22c = 0;
          uVar10 = FUN_08016f60(0,100);
          uVar25 = FUN_08016f6e(0,100);
          FUN_08017634("[sht40] init ok offset=%s%u.%02u","",uVar10,uVar25);
          FUN_08016fce(&DAT_2000b1a4,10000);
          uRam2000b1b0 = 60000;
          _DAT_2000b1ac = FUN_08011424();
          _DAT_2000b1ac = _DAT_2000b1ac + -50000;
          FUN_08017484(&DAT_2000b1b4);
          DAT_2000cdb8 = 1;
        }
        DAT_2000cdb7 = 0;
        if (4 < uVar7) break;
        local_124 = &DAT_2000b230;
        FUN_0801066c(&DAT_2000b230,0,0x2e4);
        FUN_0801066c(&DAT_2000b230,0,0x2d8);
        DAT_2000b230 = "ACCEL";
        DAT_2000b234 = '\0';
        DAT_2000b348 = 0;
        DAT_2000b34c = 0;
        DAT_2000b2fc = &UNK_08015931;
        DAT_2000b238 = local_2c;
        DAT_2000b24c = 0x2000b258;
        DAT_2000b240 = 0;
        uRam2000b242 = 0x18;
        DAT_2000b244 = 1;
        uRam2000b254 = 0;
        uRam2000b250 = 0;
        uRam2000b268 = 0x2000b274;
        DAT_2000b260 = 1;
        uRam2000b25e = 0x18;
        uRam2000b25c = 1;
        uRam2000b270 = 0x801b025;
        puRam2000b26c = &DAT_2000b230;
        _DAT_2000b368 = 0x2000b37c;
        uRam2000b36c = 0x60;
        uRam2000b370 = 4;
        uRam2000b374 = 0;
        uRam2000b378 = 0;
        iVar9 = FUN_080230d8(0xf);
        if (iVar9 == 0) {
          FUN_08017634("[lis%s] failed whoami read","ACCEL");
LAB_0801d3b2:
          FUN_08017634("[balloon] LIS2DW12 accelerometer init failed");
          DAT_2000cdb7 = 0;
          FUN_08017634("[balloon] WARNING: LIS2DW12 accelerometer failed to initialize");
        }
        else {
          if (cRam2000b2b2 != 'D') {
            FUN_08017634("[lis%s] bad whoami val: 0x%02x","ACCEL");
            goto LAB_0801d3b2;
          }
          iVar9 = FUN_080231a4(1);
          if ((((iVar9 == 0) || (iVar9 = FUN_080231a4(0), iVar9 == 0)) ||
              (iVar9 = FUN_08023154(), iVar9 == 0)) || (iVar9 = FUN_080230d8(0x3b), iVar9 == 0))
          goto LAB_0801d3b2;
          FUN_08017634("[lis%s] init ok!","ACCEL");
          _DAT_2000b308 = 0x2000b31c;
          uRam2000b30c = 5;
          uRam2000b310 = 8;
          DAT_2000b314 = 0;
          DAT_2000b234 = '\x01';
          DAT_2000b318 = 0;
          FUN_08016fce(&DAT_2000b300,0x1e848);
          FUN_08017484(&DAT_2000b350);
          FUN_08017006(&DAT_2000b350);
          FUN_08017484(&DAT_2000b35c);
          if (DAT_2000b234 == '\0') goto LAB_0801d3b2;
          pcVar27 = "[balloon] LIS2DW12 self-test PASSED";
          if ((DAT_2000b23d != '\x01') &&
             (pcVar27 = "[balloon] LIS2DW12 self-test FAILED", DAT_2000b23d != '\x02')) {
            pcVar27 = "[balloon] LIS2DW12 self-test not run";
          }
          FUN_08017634(pcVar27);
          uRam2000b50c = 30000;
          _DAT_2000b508 = FUN_08011424();
          _DAT_2000b508 = _DAT_2000b508 + -25000;
          DAT_2000b510 = 1;
          FUN_08017634("[balloon] LIS2DW12 accelerometer initialized on I2C1 @ 0x18");
          DAT_2000cdb7 = 1;
        }
        _DAT_2000cea0 = 0;
        if (uVar7 != 1) break;
      }
      DAT_2000cea2 = 0;
      FUN_08017484(&DAT_2000cd94);
      FUN_08017006(&DAT_2000cd94);
      DAT_2000cda0 = 0;
      DAT_2000cda4 = 0;
      DAT_2000cda8 = 0;
      DAT_2000cdb0 = 30000;
      DAT_2000cdac = FUN_08011424();
      pcVar27 = "";
      DAT_2000cdb4 = '\x01';
LAB_0801cdba:
      FUN_08017634("[sys] balloon %sinitialized",pcVar27);
      if (pcStack_58 != (code *)0x0) {
        (*pcStack_58)(&DAT_2000b0b8);
      }
      if (DAT_2000157c == '\0') {
        FUN_08018684();
      }
      pbVar29 = (byte *)FUN_08018c18();
      pbVar16 = pbVar29;
      if (pbVar29[200] == 0) {
        pbVar16 = (byte *)FUN_0801de62();
      }
      bVar18 = *pbVar16;
      if (5 < bVar18) {
        bVar18 = 5;
      }
      uVar10 = 0;
      if (bVar18 != 0) {
        FUN_0801de3a(0,bVar18,&DAT_200014b0,&DAT_2000c79c);
        uVar10 = extraout_r1;
      }
      FUN_08017634("[sys] applied calibration for %u bags (ts=%u)",uVar10,
                   *(undefined4 *)(pbVar29 + 4));
      FUN_08017634("[sys] platform_init complete");
      FUN_08017634("[sys] using platform %s",uStack_7c);
      puVar31 = (undefined4 *)&DAT_2000aa30;
      (*DAT_2000cf94)();
      FUN_080173c4(&DAT_2000a5e8);
      FUN_080173c4(&DAT_2000a754);
      FUN_080173c4(&DAT_2000a8c0);
      if (DAT_2000cdb4 != '\0') {
        FUN_08024530();
      }
      pcVar27 = &DAT_20002530;
      if ((DAT_20002530 != '\0') && (iVar9 = FUN_08011424(), 0x32 < (uint)(iVar9 - DAT_2000252c))) {
        DAT_20002530 = '\0';
        DAT_20002528 = DAT_20002528 + 1;
        FUN_08022d10();
      }
      iVar9 = FUN_08015e14();
      if (iVar9 != 0) {
        FUN_08011e48(8);
        FUN_0801066c(&uStack_7c,0,0xc);
        iVar11 = FUN_08016e6a(&DAT_200024f0,&uStack_7c);
        iVar9 = 0;
        if (iVar11 != 0) {
          iVar9 = FUN_0801dea2();
        }
        FUN_08011e30(iVar9 + 8);
      }
      puVar24 = (undefined4 *)0x1;
      switchD_0801e0dc::default();
    }
    FUN_0801066c(pbVar29,0,0xe0);
    *(char **)(pbVar29 + 0x14) = pcVar27;
    *pbVar29 = (byte)uVar28;
    *(undefined **)(pbVar29 + 0x10) = local_104;
    *(undefined4 **)(pbVar29 + 0x18) = &DAT_2000c73c;
    *(undefined **)(pbVar29 + 0x1c) = &DAT_2000b960;
    *puVar31 = local_100;
    pbVar29[1] = 0;
    pbVar29[4] = 0;
    pbVar29[5] = 0;
    pbVar29[6] = 0x80;
    pbVar29[7] = 0xbf;
    pbVar29[2] = 0;
    pbVar29[8] = 0x9a;
    pbVar29[9] = 0x99;
    pbVar29[10] = 0x99;
    pbVar29[0xb] = 0x3e;
    pbVar29[0xc] = 0x9a;
    pbVar29[0xd] = 0x99;
    pbVar29[0xe] = 0x99;
    pbVar29[0xf] = 0x3e;
    pbVar29 = pbVar29 + 0xe0;
    FUN_08017484(local_118 + 0x1588);
    FUN_08017484(local_118 + 0x1594);
    FUN_08017484(local_118 + 0x15ac);
    FUN_08017484(local_118 + 0x15c0);
    FUN_08017484(local_118 + 0x15d0);
    FUN_08016fce(local_118 + 0x15dc,1000);
    puVar31[0x1b] = 0;
    puVar31[0x1c] = 0;
    puVar31[0x1d] = 0;
    *(undefined1 *)(puVar31 + 0x1e) = 0;
    puVar31[0x1f] = 0;
    *(undefined4 *)(local_120 + 0x1c) = 60000;
    *local_120 = 0;
    local_120[1] = 0;
    local_120[2] = 0;
    *(undefined4 *)(local_120 + 4) = 0;
    *(undefined4 *)(local_120 + 8) = 0;
    local_120[0xc] = 0;
    *puVar24 = 0;
    puVar24[2] = 0;
    puVar24[3] = 0;
    puVar24[4] = 200;
    puVar24[5] = 0xf0;
    *(undefined1 *)(puVar24 + 7) = 1;
    puVar24[1] = 0;
    puVar24[6] = 0;
    FUN_08017634("[bag_task] bag %u initialized",local_108);
    puVar24 = puVar24 + 0x38;
    puVar31[2] = &DAT_2000c538;
    puVar31 = puVar31 + 0x38;
    local_120 = local_120 + 0xe0;
    local_118 = local_fc;
  } while( true );
  DAT_2000cea2 = 0;
  _DAT_2000cea0 = 0;
  FUN_0801066c(&DAT_2000cdbc,0,0x60);
  DAT_2000cdbc = 0;
  puRam2000ce18 = &UNK_0802ecf8;
  DAT_2000cdc0 = local_2c;
  DAT_2000ce08 = 0;
  FUN_08017484(&DAT_2000ce0c);
  DAT_2000ce00 = 0;
  DAT_2000ce04 = 0;
  uRam2000cdc6 = 0x46;
  DAT_2000cdd0 = 0x2000cdf4;
  DAT_2000cdc8 = 1;
  DAT_2000cdc4 = 0;
  uRam2000cdd8 = 0;
  uRam2000cdd4 = 0;
  uRam2000cdde = 0x46;
  uRam2000cde8 = &cRam2000cdf8;
  DAT_2000cde0 = 1;
  DAT_2000cddc = 1;
  puRam2000cdf0 = &UNK_080171a1;
  puRam2000cdec = &DAT_2000cdbc;
  iVar9 = FUN_080237a0();
  if (iVar9 == 0) {
    FUN_08017634("[bmp580:%s] failed chip ID read (0x%02x)",puRam2000ce18,0x46);
    _DAT_2000cea0 = _DAT_2000cea0 & 0xff00;
  }
  else if (cRam2000cdf8 == 'P') {
    FUN_080237e0(0x7e,0xb6);
    local_114 = 10;
    do {
      FUN_08011458(2);
      iVar9 = FUN_080237a0();
      if ((iVar9 != 0) && (cRam2000cdf8 == 'P')) {
        FUN_0801e5b2();
      }
      local_114 = local_114 + -1;
    } while (local_114 != 0);
    FUN_08017634("[bmp580:%s] device not responding after reset",puRam2000ce18);
    _DAT_2000cea0 = _DAT_2000cea0 & 0xff00;
  }
  else {
    pcVar12 = (char *)0x46;
    FUN_08017634("[bmp580:%s] bad chip ID 0x%02x, expected 0x%02x (0x%02x)",puRam2000ce18,
                 cRam2000cdf8,0x50,0x46);
    _DAT_2000cea0 = _DAT_2000cea0 & 0xff00;
  }
  FUN_08017634("[balloon] WARNING: BMP580 atmospheric sensor failed to initialize");
  if (local_128 != (code *)0x0) {
    pcVar32 = "[balloon] skipping USB-PD init (right side)";
    goto LAB_0801d89c;
  }
  FUN_0801066c(&DAT_2000ce1c,0,0x84);
  cVar17 = '\0';
  DAT_2000ce9c = "usb-pd";
  DAT_2000ce20 = local_2c;
  local_128._0_2_ = 0;
  DAT_2000ce1c = cVar17;
  DAT_2000ce66 = local_128._0_2_;
  DAT_2000ce68 = local_128._0_2_;
  DAT_2000ce6a = cVar17;
  DAT_2000ce6b = cVar17;
  DAT_2000ce6e = cVar17;
  FUN_08017484(&DAT_2000ce70);
  DAT_2000ce26 = 0x28;
  DAT_2000ce30 = &DAT_2000ce54;
  DAT_2000ce28 = 1;
  DAT_2000ce38 = pcVar8;
  DAT_2000ce34 = pcVar8;
  DAT_2000ce3e = 0x28;
  DAT_2000ce48 = &DAT_2000ce5d;
  DAT_2000ce40 = 1;
  DAT_2000ce3c = 1;
  DAT_2000ce50 = &LAB_08017238_1;
  DAT_2000ce4c = &DAT_2000ce1c;
  DAT_2000ce24 = cVar17;
  iVar9 = FUN_0801b4cc(&DAT_2000ce1c,10,1);
  if (iVar9 == 0) {
    FUN_08017634("[stusb4500:%s] failed to read device capability (0x%02x)",DAT_2000ce9c,0x28);
  }
  else {
    iVar9 = FUN_0801b4cc(&DAT_2000ce1c,6,2);
    if (iVar9 != 0) {
      FUN_08017634("[stusb4500:%s] Type-C revision: 0x%04x",DAT_2000ce9c,
                   CONCAT11(DAT_2000ce5e,DAT_2000ce5d));
      FUN_08017634("[stusb4500:%s] --- pre-init fault dump ---",DAT_2000ce9c);
      iVar9 = FUN_0801b4cc(&DAT_2000ce1c,0xb,1);
      if (iVar9 != 0) {
        uVar14 = (uint)(DAT_2000ce5d >> 7);
        pcVar32 = (char *)(DAT_2000ce5d >> 5 & 1);
        uVar13 = DAT_2000ce5d >> 6 & 1;
        uVar21 = DAT_2000ce5d >> 4 & 1;
        pcVar12 = (char *)(DAT_2000ce5d >> 2 & 1);
        FUN_08017634("[stusb4500:%s] ALERT_STATUS_1=0x%02x (phy=%u prt=%u typec=%u hw_fault=%u mon=%u cc=%u)"
                     ,DAT_2000ce9c,DAT_2000ce5d,DAT_2000ce5d >> 1 & 1,pcVar12,uVar21,uVar13,pcVar32,
                     uVar14);
      }
      iVar9 = FUN_0801b4cc(&DAT_2000ce1c,0xc,1);
      if (iVar9 != 0) {
        FUN_08017634("[stusb4500:%s] ALERT_MASK=0x%02x",DAT_2000ce9c,DAT_2000ce5d,0x242d,pcVar12,
                     uVar21,uVar13,pcVar32,uVar14);
      }
      FUN_08023978();
      iVar9 = FUN_0801b4cc(&DAT_2000ce1c,0x20,1);
      if (iVar9 != 0) {
        FUN_08017634("[stusb4500:%s] MONITORING_CTRL_0=0x%02x (bypass=%u)",DAT_2000ce9c,
                     (uint)DAT_2000ce5d,(DAT_2000ce5d & 7) >> 2);
      }
      iVar9 = FUN_0801b4cc(&DAT_2000ce1c,0x23,1);
      if (iVar9 != 0) {
        FUN_08017634("[stusb4500:%s] RESET_CTRL=0x%02x",DAT_2000ce9c,DAT_2000ce5d);
      }
      FUN_08017634("[stusb4500:%s] --- end pre-init dump ---",DAT_2000ce9c);
      puVar26 = &UNK_0802faa8;
      uVar28 = 0xf;
      do {
        if (*(ushort *)(puVar26 + 0x1e) < 0x7d1) break;
        uVar28 = uVar28 - 1 & 0xff;
        puVar26 = puVar26 + -2;
      } while (uVar28 != 0);
      FUN_08017634("[stusb4500:%s] nvm: target PDOs=%u, PDO2=%umV (flex1_v=%u), I_LUT=0x%x (%umA)",
                   DAT_2000ce9c,2,12000,0xf0,uVar28,*(undefined2 *)(&UNK_0802faa8 + uVar28 * 2));
      FUN_08027fb8(auStack_f4,&DAT_0802fbdc,0x28);
      bStack_da = bStack_da & 0xf9 | 4;
      bStack_d8 = (byte)uVar28 | bStack_d8 & 0xf0;
      uVar28 = 0;
      bStack_d4 = bStack_d4 & 0x3f;
      uStack_d3 = 0x3c;
      iVar9 = FUN_0801b5bc(&DAT_2000ce1c,0);
      if (iVar9 == 0) {
        pcVar32 = "[stusb4500:%s] nvm: failed to enter read mode";
        goto LAB_0801d9f0;
      }
      do {
        iVar9 = FUN_0801b614(&DAT_2000ce1c,uVar28 & 0xff,auStack_c8 + uVar28 * 8 + -4);
        if (iVar9 == 0) {
          FUN_08017634("[stusb4500:%s] nvm: failed to read bank %u",DAT_2000ce9c,uVar28);
          FUN_08024138(&DAT_2000ce1c);
          pcVar32 = "[stusb4500:%s] nvm: failed to read banks";
          goto LAB_0801d9f0;
        }
        uVar28 = uVar28 + 1;
      } while (uVar28 != 5);
      FUN_08024138(&DAT_2000ce1c);
      puVar24 = &local_cc;
      iVar11 = 0;
      do {
        puVar30 = (undefined1 *)((int)puVar24 + 7);
        uVar6 = *(undefined1 *)puVar24;
        puVar1 = (undefined1 *)((int)puVar24 + 6);
        puVar2 = (undefined1 *)((int)puVar24 + 5);
        puVar31 = puVar24 + 1;
        puVar3 = (undefined1 *)((int)puVar24 + 3);
        puVar4 = (undefined1 *)((int)puVar24 + 2);
        puVar5 = (undefined1 *)((int)puVar24 + 1);
        puVar24 = puVar24 + 2;
        iVar20 = iVar11 + 1;
        FUN_08017634("[stusb4500:%s] nvm: bank%u: %02x %02x %02x %02x %02x %02x %02x %02x",
                     DAT_2000ce9c,iVar11,uVar6,*puVar5,*puVar4,*puVar3,*(undefined1 *)puVar31,
                     *puVar2,*puVar1,*puVar30);
        iVar11 = iVar20;
      } while (iVar20 != 5);
      local_130 = auStack_f4;
      iVar11 = 0;
      puVar30 = local_130;
      do {
        iVar20 = FUN_08028054(auStack_c8 + iVar11 * 8 + -4,puVar30,8);
        if (iVar20 != 0) {
          iVar9 = 0;
          FUN_08017634("[stusb4500:%s] nvm: MISMATCH bank%u expect: %02x %02x %02x %02x %02x %02x %02x %02x"
                       ,DAT_2000ce9c,iVar11,*puVar30,puVar30[1],puVar30[2],puVar30[3],puVar30[4],
                       puVar30[5],puVar30[6],puVar30[7]);
        }
        iVar11 = iVar11 + 1;
        puVar30 = puVar30 + 8;
      } while (iVar11 != 5);
      pcVar32 = "[stusb4500:%s] nvm: all 5 banks match, no write needed";
      if (iVar9 != 0) goto LAB_0801dd2e;
      FUN_08017634("[stusb4500:%s] nvm: mismatch detected, reprogramming all banks...",DAT_2000ce9c)
      ;
      iVar9 = FUN_0801b5bc(&DAT_2000ce1c,1);
      if (iVar9 == 0) {
        pcVar32 = "[stusb4500:%s] nvm: failed to enter write mode";
LAB_0801d9f0:
        FUN_08017634(pcVar32,DAT_2000ce9c);
      }
      else {
        iVar9 = FUN_0801b678(&DAT_2000ce1c);
        uVar28 = 0;
        if (iVar9 != 0) {
          do {
            iVar9 = FUN_0801b718(&DAT_2000ce1c,uVar28 & 0xff,local_130 + uVar28 * 8);
            if (iVar9 == 0) {
              pcVar32 = "[stusb4500:%s] nvm: failed to write bank %u";
              goto LAB_0801dc50;
            }
            uVar28 = uVar28 + 1;
          } while (uVar28 != 5);
          FUN_08024138(&DAT_2000ce1c);
          iVar9 = FUN_0801b5bc(&DAT_2000ce1c,0);
          uVar28 = 0;
          if (iVar9 != 0) {
LAB_0801dc7a:
            puVar24 = &local_a4;
            local_128 = (code *)FUN_0801b614(&DAT_2000ce1c,uVar28 & 0xff,puVar24 + uVar28 * 2);
            if (local_128 != (code *)0x0) goto LAB_0801dc92;
            pcVar32 = "[stusb4500:%s] nvm: verify read failed at bank %u";
LAB_0801dc50:
            FUN_08017634(pcVar32,DAT_2000ce9c,uVar28);
            goto LAB_0801dc34;
          }
          pcVar32 = "[stusb4500:%s] nvm: failed to enter verify mode";
          goto LAB_0801d9f0;
        }
        FUN_08017634("[stusb4500:%s] nvm: erase failed",DAT_2000ce9c);
LAB_0801dc34:
        FUN_08024138(&DAT_2000ce1c);
      }
      pcVar32 = "[stusb4500:%s] WARNING: NVM config failed";
      goto LAB_0801dd2e;
    }
    FUN_08017634("[stusb4500:%s] failed to read BCD revision",DAT_2000ce9c);
  }
  _DAT_2000cea0 = _DAT_2000cea0 & 0xff;
  goto LAB_0801d89a;
LAB_0801dc92:
  uVar28 = uVar28 + 1;
  if (uVar28 == 5) goto code_r0x0801dc98;
  goto LAB_0801dc7a;
code_r0x0801dc98:
  FUN_08024138(&DAT_2000ce1c);
  iVar9 = 0;
  do {
    iVar11 = FUN_08028054(puVar24,local_130,8);
    if (iVar11 != 0) {
      FUN_08017634("[stusb4500:%s] nvm: MISMATCH bank%u wrote: %02x %02x %02x %02x %02x %02x %02x %02x"
                   ,DAT_2000ce9c,iVar9,*local_130,local_130[1],local_130[2],local_130[3],
                   local_130[4],local_130[5],local_130[6],local_130[7]);
      FUN_08017634("[stusb4500:%s] nvm:               read:  %02x %02x %02x %02x %02x %02x %02x %02x"
                   ,DAT_2000ce9c,*(undefined1 *)puVar24,*(undefined1 *)((int)puVar24 + 1),
                   *(undefined1 *)((int)puVar24 + 2),*(undefined1 *)((int)puVar24 + 3),
                   *(undefined1 *)(puVar24 + 1),*(undefined1 *)((int)puVar24 + 5),
                   *(undefined1 *)((int)puVar24 + 6),*(undefined1 *)((int)puVar24 + 7));
      local_128 = (code *)0x0;
    }
    iVar9 = iVar9 + 1;
    local_130 = local_130 + 8;
    puVar24 = puVar24 + 2;
  } while (iVar9 != 5);
  pcVar32 = "[stusb4500:%s] nvm: VERIFY FAILED";
  if (local_128 == (code *)0x0) goto LAB_0801d9f0;
  pcVar32 = "[stusb4500:%s] nvm: programming complete, all 5 banks verified OK";
LAB_0801dd2e:
  FUN_08017634(pcVar32,DAT_2000ce9c);
  DAT_2000ce6c = 12000;
  iVar9 = FUN_0801b4cc(&DAT_2000ce1c,0x91,4);
  if (iVar9 == 0) {
LAB_0801dde4:
    local_cc = CONCAT22(local_cc._2_2_,0x123);
    local_a4 = CONCAT22(local_a4._2_2_,0x23);
    iVar9 = FUN_0801b57c(&DAT_2000ce1c,&local_cc,2);
    if (iVar9 == 0) {
      pcVar32 = "[stusb4500:%s] WARNING: hardware reset failed";
    }
    else {
      FUN_08011458(0x1e);
      FUN_0801b57c(&DAT_2000ce1c,&local_a4,2);
      FUN_08011458(0x32);
      pcVar32 = "[stusb4500:%s] hardware reset complete (NVM reloaded into RAM)";
    }
    FUN_08017634(pcVar32,DAT_2000ce9c);
    iVar9 = FUN_0802382c(12000);
    if (iVar9 == 0) {
      FUN_08017634("[stusb4500:%s] WARNING: RAM PDO configure failed",DAT_2000ce9c);
    }
  }
  else {
    bVar18 = DAT_2000ce60 >> 4;
    if (bVar18 == 0) goto LAB_0801dde4;
    iVar9 = (((DAT_2000ce5f & 0xf) << 0x10 | (uint)DAT_2000ce5e << 8) >> 10) * 10;
    FUN_08017634("[stusb4500:%s] active contract detected (obj_pos=%u I=%umA), skipping reset",
                 DAT_2000ce9c,bVar18,iVar9);
    DAT_2000ce68 = (undefined2)iVar9;
    DAT_2000ce66 = DAT_2000ce6c;
    if (bVar18 == 1) {
      DAT_2000ce66 = 5000;
    }
    DAT_2000ce6b = '\x01';
    DAT_2000ce6e = '\x01';
    FUN_08017006(&DAT_2000ce70);
  }
  FUN_08023978();
  FUN_08017484(&DAT_2000ce7c);
  FUN_08017006(&DAT_2000ce7c);
  FUN_08017484(&DAT_2000ce88);
  FUN_08017006(&DAT_2000ce88);
  DAT_2000ce94 = 0;
  DAT_2000ce1c = '\x01';
  FUN_08017634("[stusb4500:%s] init ok (0x%02x)",DAT_2000ce9c,0x28);
  _DAT_2000cea0 = CONCAT11(DAT_2000ce1c,DAT_2000cea0);
  if (DAT_2000ce1c != '\0') {
    FUN_0801d4bc();
  }
LAB_0801d89a:
  pcVar32 = "[balloon] WARNING: STUSB4500 USB-PD controller failed to initialize";
LAB_0801d89c:
  FUN_08017634(pcVar32);
  FUN_0801d4bc();
  return;
}


