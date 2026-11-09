/* Ghidra static pseudocode; not original source. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */
/* WARNING: Restarted to delay deadcode elimination for space: ram */

void FUN_0801ce7e(void)

{
  undefined1 uVar1;
  char cVar2;
  char *pcVar3;
  byte *pbVar4;
  int iVar5;
  int iVar6;
  undefined4 uVar7;
  undefined4 uVar8;
  int iVar9;
  byte bVar10;
  char **ppcVar11;
  undefined4 extraout_r1;
  int iVar12;
  uint uVar13;
  int *piVar14;
  undefined *puVar15;
  char *unaff_r4;
  undefined1 *puVar16;
  undefined2 *puVar17;
  byte *unaff_r5;
  undefined4 *puVar18;
  int *unaff_r7;
  undefined1 *in_stack_00000020;
  uint in_stack_00000024;
  undefined2 uStack00000028;
  char **in_stack_0000002c;
  undefined1 *in_stack_00000030;
  int in_stack_00000034;
  int in_stack_00000038;
  int in_stack_0000003c;
  uint in_stack_00000040;
  uint in_stack_00000044;
  uint in_stack_00000048;
  int in_stack_0000004c;
  int in_stack_00000050;
  int in_stack_00000054;
  undefined4 in_stack_00000074;
  byte in_stack_00000078;
  byte bStack0000007c;
  undefined1 uStack0000007d;
  undefined2 in_stack_00000084;
  undefined2 in_stack_000000ac;
  undefined4 in_stack_000000d4;
  code *in_stack_000000f8;
  
  iVar9 = _uStack00000028;
code_r0x0801ce7e:
  iVar5 = FUN_08016e6a(&DAT_200024f0,&stack0x000000d4);
  iVar6 = 0;
  if (iVar5 != 0) {
    iVar6 = FUN_0801dea2();
  }
  FUN_08011e30(iVar6 + 8);
LAB_0801ce94:
  puVar18 = (undefined4 *)0x1;
  switchD_0801e0dc::default();
  do {
    FUN_0801066c(unaff_r5,0,0xe0);
    *(char **)(unaff_r5 + 0x14) = unaff_r4;
    *unaff_r5 = (byte)in_stack_00000044;
    *(int *)(unaff_r5 + 0x10) = in_stack_0000004c;
    *(undefined4 **)(unaff_r5 + 0x18) = &DAT_2000c73c;
    *(undefined **)(unaff_r5 + 0x1c) = &DAT_2000b960;
    *unaff_r7 = in_stack_00000050;
    unaff_r5[1] = 0;
    unaff_r5[4] = 0;
    unaff_r5[5] = 0;
    unaff_r5[6] = 0x80;
    unaff_r5[7] = 0xbf;
    unaff_r5[2] = 0;
    unaff_r5[8] = 0x9a;
    unaff_r5[9] = 0x99;
    unaff_r5[10] = 0x99;
    unaff_r5[0xb] = 0x3e;
    unaff_r5[0xc] = 0x9a;
    unaff_r5[0xd] = 0x99;
    unaff_r5[0xe] = 0x99;
    unaff_r5[0xf] = 0x3e;
    unaff_r5 = unaff_r5 + 0xe0;
    FUN_08017484(in_stack_00000038 + 0x1588);
    FUN_08017484(in_stack_00000038 + 0x1594);
    FUN_08017484(in_stack_00000038 + 0x15ac);
    FUN_08017484(in_stack_00000038 + 0x15c0);
    FUN_08017484(in_stack_00000038 + 0x15d0);
    FUN_08016fce(in_stack_00000038 + 0x15dc,1000);
    unaff_r7[0x1b] = 0;
    unaff_r7[0x1c] = 0;
    unaff_r7[0x1d] = 0;
    *(undefined1 *)(unaff_r7 + 0x1e) = 0;
    unaff_r7[0x1f] = 0;
    *(undefined4 *)(in_stack_00000030 + 0x1c) = 60000;
    *in_stack_00000030 = 0;
    in_stack_00000030[1] = 0;
    in_stack_00000030[2] = 0;
    *(undefined4 *)(in_stack_00000030 + 4) = 0;
    *(undefined4 *)(in_stack_00000030 + 8) = 0;
    in_stack_00000030[0xc] = 0;
    *puVar18 = 0;
    puVar18[2] = 0;
    puVar18[3] = 0;
    puVar18[4] = 200;
    puVar18[5] = 0xf0;
    *(undefined1 *)(puVar18 + 7) = 1;
    puVar18[1] = 0;
    puVar18[6] = 0;
    FUN_08017634("[bag_task] bag %u initialized",in_stack_00000048);
    puVar18 = puVar18 + 0x38;
    unaff_r7[2] = (int)&DAT_2000c538;
    unaff_r7 = unaff_r7 + 0x38;
    in_stack_00000030 = in_stack_00000030 + 0xe0;
    in_stack_00000038 = in_stack_00000054;
    in_stack_00000044 = in_stack_00000040 & 0xff;
    unaff_r4 = &DAT_2000aa30;
    if (DAT_2000cea3 <= in_stack_00000044) {
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
      goto LAB_0801cb34;
    }
    in_stack_00000048 = in_stack_00000040;
    in_stack_0000004c = in_stack_00000040 * 0xa8 + in_stack_00000034 + 0x1164;
    in_stack_00000050 = in_stack_00000040 * 0x18 + in_stack_00000034 + 0x1d6c;
    in_stack_00000040 = in_stack_00000040 + 1;
    in_stack_00000054 = in_stack_00000054 + 0xe0;
  } while (in_stack_00000040 != 6);
  pcVar3 = "[balloon] failed to initialize bag task %u";
  ppcVar11 = (char **)0x5;
LAB_0801cdb4:
  FUN_08017634(pcVar3,ppcVar11);
  pcVar3 = "not ";
  goto LAB_0801cdba;
LAB_0801cb34:
  if ((char **)(uint)DAT_2000cea3 <= in_stack_0000002c) goto LAB_0801cb42;
  if (DAT_2000c534 == '\0') {
LAB_0801cf88:
    pcVar3 = "[balloon] failed to register bag task %u";
    ppcVar11 = in_stack_0000002c;
    goto LAB_0801cdb4;
  }
  uVar13 = (uint)DAT_2000c400;
  uVar1 = (&DAT_2000bf88)[(int)in_stack_0000002c * 0xe0];
  if (4 < uVar13) {
    FUN_08017634("[scheduler] cannot register bag %u: max bags reached",uVar1);
    goto LAB_0801cf88;
  }
  DAT_2000c400 = DAT_2000c400 + 1;
  (&DAT_2000c3ec)[uVar13] = &DAT_2000bf88 + (int)in_stack_0000002c * 0xe0;
  FUN_08017634("[scheduler] registered bag %u (total: %u)",uVar1);
  in_stack_0000002c = (char **)((int)in_stack_0000002c + 1U & 0xff);
  goto LAB_0801cb34;
LAB_0801cb42:
  FUN_08017634("[balloon] initialized task-scheduler architecture (%u bags)");
  FUN_0801066c(&DAT_2000c814,0,0x18);
  DAT_2000c814 = &DAT_2000b960;
  DAT_2000c818 = &DAT_2000c3e8;
  DAT_2000c81c = &DAT_2000bb94;
  DAT_2000c824 = &DAT_0802fae8;
  DAT_2000c820 = 0;
  DAT_2000c828 = 1;
  iVar6 = FUN_08021ab0(&DAT_2000c814,0);
  if (iVar6 == 0) {
    pcVar3 = "[balloon] failed to apply default mode";
LAB_0801cb88:
    FUN_08017634(pcVar3);
    FUN_0801cdb8();
    return;
  }
  FUN_0801066c(&DAT_2000c82c,0,0x540);
  DAT_2000c82c = &DAT_2000aa30;
  DAT_2000c830 = &DAT_2000cd6c;
  FUN_08016fce(&DAT_2000c834,0x32);
  iVar5 = 0x2000c8b4;
  piVar14 = (int *)&DAT_2000c83c;
  iVar6 = 0;
  do {
    piVar14[1] = 10;
    *piVar14 = iVar5;
    piVar14[2] = 0x14;
    (&DAT_2000c848)[iVar6 * 5] = 0;
    iVar12 = iVar6 + 1;
    (&DAT_2000c84c)[iVar6 * 5] = 0;
    iVar5 = iVar5 + 200;
    piVar14 = piVar14 + 5;
    iVar6 = iVar12;
  } while (iVar12 != 6);
  DAT_2000cd64 = 0;
  DAT_2000cd68 = 1;
  FUN_08017634("[lps_sampling] initialized with %d sensors at %dHz (FIFO buffering)",6,0x14);
  DAT_2000cdb6 = in_stack_00000024 != 0;
  if (in_stack_00000024 == 0) {
    FUN_08017634("[balloon] mux controller not available (hwrev=0x%04x < A01)",0);
    goto code_r0x0801d4bc;
  }
  FUN_0801066c(&DAT_2000b0b8,0,0x90);
  DAT_2000b0bc = &DAT_2000aa30;
  FUN_0801066c(&DAT_20001592,0,0xe);
  FUN_0801066c(&DAT_20001584,0,0xe);
  DAT_20001580 = 0;
  FUN_08011c20(&DAT_20000638);
  iVar6 = FUN_08011cac(&DAT_20000638);
  if (iVar6 != 0) {
    FUN_08017634("[sensors_adc] calibration failed: status=%u error=0x%02lx",iVar6,uRam20000694);
    FUN_08017634("[mux] failed to initialize sensors_adc");
    pcVar3 = "[balloon] failed to initialize mux controller";
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
  FUN_08017634("[balloon] mux controller initialized (hwrev=0x%04x)",in_stack_00000024);
  FUN_08017634("[sht40] attempting init with i2c%u",*(undefined1 *)((int)in_stack_00000020 + 0x130))
  ;
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
  DAT_2000b1e0 = iVar6;
  DAT_2000b1f4 = iVar6;
  DAT_2000b1f8 = iVar6;
  DAT_2000b228 = iVar6;
  FUN_08017484(&DAT_2000b1fc);
  FUN_08017484(&DAT_2000b20c);
  FUN_08017484(&DAT_2000b218);
  DAT_2000b148 = (int)in_stack_00000020;
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
  DAT_2000b15c = iVar6;
  DAT_2000b160 = iVar6;
  DAT_2000b17c = iVar6;
  DAT_2000b180 = iVar6;
  iVar6 = FUN_08018390(in_stack_00000020,&DAT_2000b14c);
  if ((iVar6 == 0) || (iVar6 = FUN_0801acdc(DAT_2000b148,&DAT_2000b150), iVar6 != 1)) {
    FUN_08017634("[sht40] init failed");
    DAT_2000cdb8 = 0;
    FUN_08017634("[balloon] WARNING: SHT40 ambient sensor failed to initialize");
  }
  else {
    DAT_2000b1d0 = 1;
    uRam2000b1d4 = 0;
    DAT_2000b22c = 0;
    uVar7 = FUN_08016f60(0,100);
    uVar8 = FUN_08016f6e(0,100);
    FUN_08017634("[sht40] init ok offset=%s%u.%02u","",uVar7,uVar8);
    FUN_08016fce(&DAT_2000b1a4,10000);
    uRam2000b1b0 = 60000;
    _DAT_2000b1ac = FUN_08011424();
    _DAT_2000b1ac = _DAT_2000b1ac + -50000;
    FUN_08017484(&DAT_2000b1b4);
    DAT_2000cdb8 = 1;
  }
  DAT_2000cdb7 = 0;
  if (4 < in_stack_00000024) goto LAB_0801d6b4;
  in_stack_0000002c = &DAT_2000b230;
  FUN_0801066c(&DAT_2000b230,0,0x2e4);
  FUN_0801066c(&DAT_2000b230,0,0x2d8);
  DAT_2000b230 = "ACCEL";
  DAT_2000b234 = '\0';
  DAT_2000b348 = 0;
  DAT_2000b34c = 0;
  DAT_2000b2fc = &UNK_08015931;
  DAT_2000b238 = (int)in_stack_00000020;
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
  iVar6 = FUN_080230d8(0xf);
  if (iVar6 == 0) {
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
    iVar6 = FUN_080231a4(1);
    if ((((iVar6 == 0) || (iVar6 = FUN_080231a4(0), iVar6 == 0)) ||
        (iVar6 = FUN_08023154(), iVar6 == 0)) || (iVar6 = FUN_080230d8(0x3b), iVar6 == 0))
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
    pcVar3 = "[balloon] LIS2DW12 self-test PASSED";
    if ((DAT_2000b23d != '\x01') &&
       (pcVar3 = "[balloon] LIS2DW12 self-test FAILED", DAT_2000b23d != '\x02')) {
      pcVar3 = "[balloon] LIS2DW12 self-test not run";
    }
    FUN_08017634(pcVar3);
    uRam2000b50c = 30000;
    _DAT_2000b508 = FUN_08011424();
    _DAT_2000b508 = _DAT_2000b508 + -25000;
    DAT_2000b510 = 1;
    FUN_08017634("[balloon] LIS2DW12 accelerometer initialized on I2C1 @ 0x18");
    DAT_2000cdb7 = 1;
  }
  if (in_stack_00000024 != 1) goto LAB_0801d6b4;
code_r0x0801d4bc:
  DAT_2000cea2 = 0;
  _DAT_2000cea0 = 0;
  FUN_08017484(&DAT_2000cd94);
  FUN_08017006(&DAT_2000cd94);
  DAT_2000cda0 = 0;
  DAT_2000cda4 = 0;
  DAT_2000cda8 = 0;
  DAT_2000cdb0 = 30000;
  DAT_2000cdac = FUN_08011424();
  pcVar3 = "";
  DAT_2000cdb4 = '\x01';
LAB_0801cdba:
  FUN_08017634("[sys] balloon %sinitialized",pcVar3);
  if (in_stack_000000f8 != (code *)0x0) {
    (*in_stack_000000f8)(&DAT_2000b0b8);
  }
  if (DAT_2000157c == '\0') {
    FUN_08018684();
  }
  unaff_r5 = (byte *)FUN_08018c18();
  pbVar4 = unaff_r5;
  if (unaff_r5[200] == 0) {
    pbVar4 = (byte *)FUN_0801de62();
  }
  bVar10 = *pbVar4;
  if (5 < bVar10) {
    bVar10 = 5;
  }
  uVar7 = 0;
  if (bVar10 != 0) {
    FUN_0801de3a(0,bVar10,&DAT_200014b0,&DAT_2000c79c);
    uVar7 = extraout_r1;
  }
  FUN_08017634("[sys] applied calibration for %u bags (ts=%u)",uVar7,*(undefined4 *)(unaff_r5 + 4));
  FUN_08017634("[sys] platform_init complete");
  FUN_08017634("[sys] using platform %s",in_stack_000000d4);
  unaff_r7 = (int *)&DAT_2000aa30;
  (*DAT_2000cf94)();
  FUN_080173c4(&DAT_2000a5e8);
  FUN_080173c4(&DAT_2000a754);
  FUN_080173c4(&DAT_2000a8c0);
  if (DAT_2000cdb4 != '\0') {
    FUN_08024530();
  }
  unaff_r4 = &DAT_20002530;
  if ((DAT_20002530 != '\0') && (iVar6 = FUN_08011424(), 0x32 < (uint)(iVar6 - DAT_2000252c))) {
    DAT_20002530 = '\0';
    DAT_20002528 = DAT_20002528 + 1;
    FUN_08022d10();
  }
  iVar6 = FUN_08015e14();
  if (iVar6 != 0) goto code_r0x0801ce6e;
  goto LAB_0801ce94;
LAB_0801dc92:
  uVar13 = uVar13 + 1;
  if (uVar13 == 5) goto code_r0x0801dc98;
  goto LAB_0801dc7a;
code_r0x0801dc98:
  FUN_08024138(&DAT_2000ce1c);
  iVar9 = 0;
  do {
    iVar6 = FUN_08028054(puVar17,in_stack_00000020,8);
    if (iVar6 != 0) {
      FUN_08017634("[stusb4500:%s] nvm: MISMATCH bank%u wrote: %02x %02x %02x %02x %02x %02x %02x %02x"
                   ,DAT_2000ce9c,iVar9,*in_stack_00000020);
      FUN_08017634("[stusb4500:%s] nvm:               read:  %02x %02x %02x %02x %02x %02x %02x %02x"
                   ,DAT_2000ce9c,*(undefined1 *)puVar17,*(undefined1 *)((int)puVar17 + 1));
      _uStack00000028 = 0;
    }
    iVar9 = iVar9 + 1;
    in_stack_00000020 = in_stack_00000020 + 8;
    puVar17 = puVar17 + 4;
  } while (iVar9 != 5);
  pcVar3 = "[stusb4500:%s] nvm: VERIFY FAILED";
  if (_uStack00000028 == 0) goto LAB_0801d9f0;
  pcVar3 = "[stusb4500:%s] nvm: programming complete, all 5 banks verified OK";
LAB_0801dd2e:
  FUN_08017634(pcVar3,DAT_2000ce9c);
  DAT_2000ce6c = 12000;
  iVar9 = FUN_0801b4cc(&DAT_2000ce1c,0x91,4);
  if (iVar9 == 0) {
LAB_0801dde4:
    in_stack_00000084 = 0x123;
    in_stack_000000ac = 0x23;
    iVar9 = FUN_0801b57c(&DAT_2000ce1c,&stack0x00000084,2);
    if (iVar9 == 0) {
      pcVar3 = "[stusb4500:%s] WARNING: hardware reset failed";
    }
    else {
      FUN_08011458(0x1e);
      FUN_0801b57c(&DAT_2000ce1c,&stack0x000000ac,2);
      FUN_08011458(0x32);
      pcVar3 = "[stusb4500:%s] hardware reset complete (NVM reloaded into RAM)";
    }
    FUN_08017634(pcVar3,DAT_2000ce9c);
    iVar9 = FUN_0802382c(12000);
    if (iVar9 == 0) {
      FUN_08017634("[stusb4500:%s] WARNING: RAM PDO configure failed",DAT_2000ce9c);
    }
  }
  else {
    bVar10 = DAT_2000ce60 >> 4;
    if (bVar10 == 0) goto LAB_0801dde4;
    iVar9 = (((DAT_2000ce5f & 0xf) << 0x10 | (uint)DAT_2000ce5e << 8) >> 10) * 10;
    FUN_08017634("[stusb4500:%s] active contract detected (obj_pos=%u I=%umA), skipping reset",
                 DAT_2000ce9c,bVar10,iVar9);
    DAT_2000ce68 = (undefined2)iVar9;
    DAT_2000ce66 = DAT_2000ce6c;
    if (bVar10 == 1) {
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
  goto LAB_0801d89a;
code_r0x0801ce6e:
  FUN_08011e48(8);
  FUN_0801066c(&stack0x000000d4,0,0xc);
  goto code_r0x0801ce7e;
LAB_0801d6b4:
  DAT_2000cea2 = 0;
  _DAT_2000cea0 = 0;
  FUN_0801066c(&DAT_2000cdbc,0,0x60);
  DAT_2000cdbc = 0;
  puRam2000ce18 = &UNK_0802ecf8;
  DAT_2000cdc0 = (int)in_stack_00000020;
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
  iVar6 = FUN_080237a0();
  if (iVar6 == 0) {
    FUN_08017634("[bmp580:%s] failed chip ID read (0x%02x)",puRam2000ce18,0x46);
    _DAT_2000cea0 = _DAT_2000cea0 & 0xff00;
  }
  else if (cRam2000cdf8 == 'P') {
    FUN_080237e0(0x7e,0xb6);
    do {
      FUN_08011458(2);
      iVar6 = FUN_080237a0();
      if ((iVar6 != 0) && (cRam2000cdf8 == 'P')) {
        FUN_0801e5b2();
      }
      in_stack_0000003c = in_stack_0000003c + -1;
    } while (in_stack_0000003c != 0);
    FUN_08017634("[bmp580:%s] device not responding after reset",puRam2000ce18);
    _DAT_2000cea0 = _DAT_2000cea0 & 0xff00;
  }
  else {
    FUN_08017634("[bmp580:%s] bad chip ID 0x%02x, expected 0x%02x (0x%02x)",puRam2000ce18,
                 cRam2000cdf8,0x50);
    _DAT_2000cea0 = _DAT_2000cea0 & 0xff00;
  }
  FUN_08017634("[balloon] WARNING: BMP580 atmospheric sensor failed to initialize");
  if (_uStack00000028 != 0) {
    pcVar3 = "[balloon] skipping USB-PD init (right side)";
    goto LAB_0801d89c;
  }
  FUN_0801066c(&DAT_2000ce1c,0,0x84);
  cVar2 = '\0';
  DAT_2000ce9c = "usb-pd";
  DAT_2000ce20 = (int)in_stack_00000020;
  uStack00000028 = 0;
  DAT_2000ce1c = cVar2;
  DAT_2000ce66 = uStack00000028;
  DAT_2000ce68 = uStack00000028;
  DAT_2000ce6a = cVar2;
  DAT_2000ce6b = cVar2;
  DAT_2000ce6e = cVar2;
  FUN_08017484(&DAT_2000ce70);
  DAT_2000ce26 = 0x28;
  DAT_2000ce30 = &DAT_2000ce54;
  DAT_2000ce28 = 1;
  DAT_2000ce38 = iVar9;
  DAT_2000ce34 = iVar9;
  DAT_2000ce3e = 0x28;
  DAT_2000ce48 = &DAT_2000ce5d;
  DAT_2000ce40 = 1;
  DAT_2000ce3c = 1;
  DAT_2000ce50 = &LAB_08017238_1;
  DAT_2000ce4c = &DAT_2000ce1c;
  DAT_2000ce24 = cVar2;
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
        FUN_08017634("[stusb4500:%s] ALERT_STATUS_1=0x%02x (phy=%u prt=%u typec=%u hw_fault=%u mon=%u cc=%u)"
                     ,DAT_2000ce9c,DAT_2000ce5d,DAT_2000ce5d >> 1 & 1);
      }
      iVar9 = FUN_0801b4cc(&DAT_2000ce1c,0xc,1);
      if (iVar9 != 0) {
        FUN_08017634("[stusb4500:%s] ALERT_MASK=0x%02x",DAT_2000ce9c,DAT_2000ce5d);
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
      puVar15 = &UNK_0802faa8;
      bVar10 = 0xf;
      do {
        if (*(ushort *)(puVar15 + 0x1e) < 0x7d1) break;
        bVar10 = bVar10 - 1;
        puVar15 = puVar15 + -2;
      } while (bVar10 != 0);
      FUN_08017634("[stusb4500:%s] nvm: target PDOs=%u, PDO2=%umV (flex1_v=%u), I_LUT=0x%x (%umA)",
                   DAT_2000ce9c,2,12000);
      FUN_08027fb8(&stack0x0000005c,&DAT_0802fbdc,0x28);
      in_stack_00000074._2_1_ = in_stack_00000074._2_1_ & 0xf9 | 4;
      in_stack_00000078 = bVar10 | in_stack_00000078 & 0xf0;
      uVar13 = 0;
      bStack0000007c = bStack0000007c & 0x3f;
      uStack0000007d = 0x3c;
      iVar9 = FUN_0801b5bc(&DAT_2000ce1c,0);
      if (iVar9 == 0) {
        pcVar3 = "[stusb4500:%s] nvm: failed to enter read mode";
        goto LAB_0801d9f0;
      }
      do {
        iVar9 = FUN_0801b614(&DAT_2000ce1c,uVar13 & 0xff,&stack0x00000084 + uVar13 * 4);
        if (iVar9 == 0) {
          FUN_08017634("[stusb4500:%s] nvm: failed to read bank %u",DAT_2000ce9c,uVar13);
          FUN_08024138(&DAT_2000ce1c);
          pcVar3 = "[stusb4500:%s] nvm: failed to read banks";
          goto LAB_0801d9f0;
        }
        uVar13 = uVar13 + 1;
      } while (uVar13 != 5);
      FUN_08024138(&DAT_2000ce1c);
      puVar17 = &stack0x00000084;
      iVar6 = 0;
      do {
        uVar1 = *(undefined1 *)puVar17;
        puVar17 = puVar17 + 4;
        iVar5 = iVar6 + 1;
        FUN_08017634("[stusb4500:%s] nvm: bank%u: %02x %02x %02x %02x %02x %02x %02x %02x",
                     DAT_2000ce9c,iVar6,uVar1);
        iVar6 = iVar5;
      } while (iVar5 != 5);
      in_stack_00000020 = &stack0x0000005c;
      iVar6 = 0;
      puVar16 = in_stack_00000020;
      do {
        iVar5 = FUN_08028054(&stack0x00000084 + iVar6 * 4,puVar16,8);
        if (iVar5 != 0) {
          iVar9 = 0;
          FUN_08017634("[stusb4500:%s] nvm: MISMATCH bank%u expect: %02x %02x %02x %02x %02x %02x %02x %02x"
                       ,DAT_2000ce9c,iVar6,*puVar16);
        }
        iVar6 = iVar6 + 1;
        puVar16 = puVar16 + 8;
      } while (iVar6 != 5);
      pcVar3 = "[stusb4500:%s] nvm: all 5 banks match, no write needed";
      if (iVar9 != 0) goto LAB_0801dd2e;
      FUN_08017634("[stusb4500:%s] nvm: mismatch detected, reprogramming all banks...",DAT_2000ce9c)
      ;
      iVar9 = FUN_0801b5bc(&DAT_2000ce1c,1);
      if (iVar9 == 0) {
        pcVar3 = "[stusb4500:%s] nvm: failed to enter write mode";
LAB_0801d9f0:
        FUN_08017634(pcVar3,DAT_2000ce9c);
      }
      else {
        iVar9 = FUN_0801b678(&DAT_2000ce1c);
        uVar13 = 0;
        if (iVar9 != 0) {
          do {
            iVar9 = FUN_0801b718(&DAT_2000ce1c,uVar13 & 0xff,in_stack_00000020 + uVar13 * 8);
            if (iVar9 == 0) {
              pcVar3 = "[stusb4500:%s] nvm: failed to write bank %u";
              goto LAB_0801dc50;
            }
            uVar13 = uVar13 + 1;
          } while (uVar13 != 5);
          FUN_08024138(&DAT_2000ce1c);
          iVar9 = FUN_0801b5bc(&DAT_2000ce1c,0);
          uVar13 = 0;
          if (iVar9 != 0) {
LAB_0801dc7a:
            puVar17 = &stack0x000000ac;
            _uStack00000028 = FUN_0801b614(&DAT_2000ce1c,uVar13 & 0xff,puVar17 + uVar13 * 4);
            if (_uStack00000028 != 0) goto LAB_0801dc92;
            pcVar3 = "[stusb4500:%s] nvm: verify read failed at bank %u";
LAB_0801dc50:
            FUN_08017634(pcVar3,DAT_2000ce9c,uVar13);
            goto LAB_0801dc34;
          }
          pcVar3 = "[stusb4500:%s] nvm: failed to enter verify mode";
          goto LAB_0801d9f0;
        }
        FUN_08017634("[stusb4500:%s] nvm: erase failed",DAT_2000ce9c);
LAB_0801dc34:
        FUN_08024138(&DAT_2000ce1c);
      }
      pcVar3 = "[stusb4500:%s] WARNING: NVM config failed";
      goto LAB_0801dd2e;
    }
    FUN_08017634("[stusb4500:%s] failed to read BCD revision",DAT_2000ce9c);
  }
  _DAT_2000cea0 = _DAT_2000cea0 & 0xff;
LAB_0801d89a:
  pcVar3 = "[balloon] WARNING: STUSB4500 USB-PD controller failed to initialize";
LAB_0801d89c:
  FUN_08017634(pcVar3);
  FUN_0801d4bc();
  return;
}


