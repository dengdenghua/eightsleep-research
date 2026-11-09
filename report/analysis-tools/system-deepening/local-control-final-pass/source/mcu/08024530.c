/* Ghidra static pseudocode; not original source. */

/* WARNING: Function: __gnu_thumb1_case_uhi replaced with injection: switch16_uhi_r0 */
/* WARNING: Function: __gnu_thumb1_case_uqi replaced with injection: switch8_r0 */
/* WARNING (jumptable): Removing unreachable block (ram,0x08025ed4) */
/* WARNING (jumptable): Removing unreachable block (ram,0x080261a8) */
/* WARNING (jumptable): Removing unreachable block (ram,0x08025508) */
/* WARNING: Removing unreachable block (ram,0x08025ed4) */
/* WARNING: Removing unreachable block (ram,0x080261a8) */
/* WARNING: Removing unreachable block (ram,0x08025508) */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_08024530(void)

{
  char cVar1;
  undefined1 uVar2;
  undefined1 uVar3;
  undefined2 uVar4;
  undefined2 uVar5;
  int iVar6;
  int iVar7;
  undefined4 uVar8;
  undefined4 uVar9;
  undefined4 uVar10;
  undefined4 uVar11;
  undefined4 uVar12;
  undefined4 uVar13;
  int iVar14;
  char *pcVar15;
  uint uVar16;
  undefined *puVar17;
  undefined1 *puVar18;
  byte bVar19;
  byte bVar20;
  uint uVar21;
  uint uVar22;
  char *pcVar23;
  uint uVar24;
  undefined4 uVar25;
  char cVar26;
  char cVar27;
  byte bVar28;
  byte *pbVar29;
  char cVar30;
  undefined4 *puVar31;
  int iVar32;
  int iVar33;
  char *pcVar34;
  undefined4 *puVar35;
  undefined8 uVar36;
  undefined8 uVar37;
  byte *pbStack_ec;
  uint uStack_e8;
  char *pcStack_e0;
  char *pcStack_d8;
  int iStack_d4;
  int iStack_d0;
  undefined4 *puStack_cc;
  short sStack_ae;
  undefined4 uStack_ac;
  undefined4 uStack_a8;
  uint uStack_a4;
  int iStack_a0;
  undefined1 uStack_9c;
  undefined4 uStack_98;
  undefined4 uStack_94;
  undefined4 uStack_90;
  char *pcStack_8c;
  char *pcStack_88;
  undefined1 uStack_84;
  undefined2 uStack_80;
  undefined4 uStack_7c;
  undefined4 *puStack_78;
  char *pcStack_74;
  char *pcStack_70;
  undefined1 uStack_6c;
  undefined2 uStack_68;
  undefined4 uStack_64;
  undefined4 *puStack_60;
  char *pcStack_5c;
  char *pcStack_58;
  undefined1 uStack_54;
  byte abStack_50 [60];
  
  iVar6 = FUN_080173ac(&DAT_2000cd94);
  iVar7 = FUN_08016fe0(&DAT_2000b090);
  if (iVar7 != 0) {
    cVar30 = '\0';
    do {
      iVar7 = FUN_0801e908(cVar30);
      if (iVar7 != 0) {
        FUN_08017634("[pressure] attempting periodic recovery of failed sensors");
        pbVar29 = (byte *)&uStack_98;
        uStack_94 = DAT_2000b09c;
        uStack_90 = &DAT_20000a2c;
        uStack_98 = CONCAT22(uStack_98._2_2_,_DAT_2000b0ac);
        pcStack_8c = "_sens0";
        pcStack_88 = "_sens1";
        uStack_84 = 1;
        uStack_80 = DAT_2000b0ae;
        uStack_7c = DAT_2000b0a0;
        puStack_78 = &DAT_200009a8;
        pcStack_74 = "_sens2";
        pcStack_70 = "_sens3";
        uStack_6c = 2;
        uStack_64 = DAT_2000b0a4;
        uStack_68 = _DAT_2000b0b0;
        puStack_60 = &DAT_20000924;
        pcStack_5c = "_sens4";
        pcStack_58 = "_sens5";
        uStack_54 = 3;
        pbStack_ec = (byte *)&DAT_2000b098;
        goto LAB_080249c4;
      }
      cVar30 = cVar30 + '\x01';
    } while (cVar30 != '\x06');
  }
LAB_0802455e:
  iVar7 = FUN_08016fe0(&DAT_2000b088);
  if (iVar7 != 0) {
    pcVar15 = &DAT_2000aa30;
    iVar7 = 0;
    do {
      if (*pcVar15 != '\0') {
        iVar33 = FUN_08016f7c(pcVar15 + 0x98);
        if (iVar33 != 0) {
          iVar33 = FUN_08016f7c(pcVar15 + 0xb0);
          if (iVar33 != 0) {
            iVar33 = FUN_08016f7c(pcVar15 + 0x98);
            if ((iVar33 == 2) || (iVar33 = FUN_08016f7c(pcVar15 + 0xb0), iVar33 == 2)) {
              (&DAT_2000ab0a)[iVar7 * 0x104] = 0;
            }
            FUN_0801b3d4(pcVar15,0x27);
          }
        }
      }
      iVar7 = iVar7 + 1;
      pcVar15 = pcVar15 + 0x104;
    } while (iVar7 != 6);
    if (DAT_2000b084 == 0) {
      uVar21 = (uint)DAT_2000b078;
      if (((uVar21 < 6) &&
          (iVar7 = FUN_0801b370(&DAT_2000aa30 + uVar21 * 0x104,&uStack_98,&uStack_ac), iVar7 != 0))
         && (uStack_98 != 0x7fffffff)) {
        uVar25 = FUN_0802bbc8();
        uVar25 = FUN_0802b598(uVar25,0x3cc80000);
        uVar22 = FUN_0802b1cc(uVar25,0x447a0000);
        goto LAB_080245d0;
      }
LAB_0802461a:
      FUN_0801e95c();
      uVar36 = CONCAT44(DAT_2000b05c,DAT_2000b058);
    }
    else {
      uVar21 = 6;
      uVar22 = DAT_2000b07c;
LAB_080245d0:
      uVar24 = uVar22 & 0x7fffffff;
      if ((DAT_2000b071 != '\0') && (DAT_2000b070 == uVar21)) {
        iVar7 = FUN_0802bb5c(uVar24,0x7f7fffff);
        if (((iVar7 == 0) &&
            ((iVar7 = FUN_08010564(uVar24,0x7f7fffff), iVar7 == 0 &&
             (iVar7 = FUN_0801053c(uVar22,0x42480000), iVar7 == 0)))) &&
           (iVar7 = FUN_08010564(uVar22,0x42f00000), iVar7 == 0)) {
          uVar25 = FUN_08027e30(DAT_2000b058,DAT_2000b05c);
          FUN_0802b814(uVar22,uVar25);
          uVar25 = FUN_0802959c();
          iVar7 = FUN_08010564(uVar25,0x40000000);
          uVar24 = DAT_2000b064;
          uVar21 = DAT_2000b060;
          if (iVar7 == 0) {
            DAT_2000b068 = iVar7;
            if (DAT_2000b060 < DAT_2000b064) {
              uVar25 = FUN_08026fb0(DAT_2000b060 + 1);
              pcStack_d8 = (char *)FUN_0802b1cc(0x3f800000,uVar25);
            }
            else {
              pcStack_d8 = (char *)DAT_2000b050;
            }
            uVar11 = DAT_2000b05c;
            uVar25 = DAT_2000b058;
            uVar36 = FUN_08027da0(uVar22);
            uVar36 = FUN_08027668((int)uVar36,(int)((ulonglong)uVar36 >> 0x20),uVar25,uVar11);
            uVar37 = FUN_08027da0(pcStack_d8);
            uVar36 = FUN_08028db4((int)uVar36,(int)((ulonglong)uVar36 >> 0x20),(int)uVar37,
                                  (int)((ulonglong)uVar37 >> 0x20));
            uVar36 = FUN_080286ec((int)uVar36,(int)((ulonglong)uVar36 >> 0x20),uVar25,uVar11);
            if (uVar21 < uVar24) {
              DAT_2000b060 = uVar21 + 1;
            }
            goto LAB_0802461e;
          }
        }
        goto LAB_0802461a;
      }
      iVar7 = FUN_0802bb5c(uVar24,0x7f7fffff);
      if ((((iVar7 != 0) || (iVar7 = FUN_08010564(uVar24,0x7f7fffff), iVar7 != 0)) ||
          (iVar7 = FUN_0801053c(uVar22,0x42480000), iVar7 != 0)) ||
         (iVar7 = FUN_08010564(uVar22,0x42f00000), iVar7 != 0)) goto LAB_0802461a;
      uVar36 = FUN_08027da0(uVar22);
      DAT_2000b060 = 1;
      DAT_2000b070 = (byte)uVar21;
      DAT_2000b071 = '\x01';
      DAT_2000b068 = 0;
    }
LAB_0802461e:
    cVar30 = DAT_2000b071;
    DAT_2000b05c = (undefined4)((ulonglong)uVar36 >> 0x20);
    DAT_2000b058 = (undefined4)uVar36;
    if (DAT_2000b071 == '\0') {
      DAT_2000b048 = 0xbf800000;
    }
    else {
      DAT_2000b048 = FUN_08027e30(DAT_2000b058,DAT_2000b05c);
      uVar36 = CONCAT44(DAT_2000b05c,DAT_2000b058);
    }
    iVar7 = 0;
    pbVar29 = &DAT_2000ab31;
    do {
      DAT_2000b05c = (undefined4)((ulonglong)uVar36 >> 0x20);
      DAT_2000b058 = (undefined4)uVar36;
      iVar33 = FUN_0801b370(pbVar29 + -0x101,&uStack_ac,&sStack_ae);
      if ((iVar33 == 0) || (uStack_ac == 0x7fffffff)) {
        uStack_98 = 0xbf800000;
        uStack_94 = 0xbf800000;
        uStack_90 = (undefined4 *)0xbf800000;
        pcStack_8c = (char *)0x0;
        pcStack_88 = (char *)0x0;
        puVar35 = (undefined4 *)0xbf800000;
        pcStack_d8._0_1_ = 0;
        pcStack_e0 = (char *)0x0;
        pbStack_ec = (byte *)0xbf800000;
        if (*pbVar29 != 0xff) {
          *pbVar29 = *pbVar29 + 1;
        }
        if ((4 < *pbVar29) && (pbVar29[-1] == 0)) {
          pbVar29[-1] = 1;
          FUN_08017634("[pressure] sensor %u marked as FAILED after %u consecutive read failures",
                       iVar7);
        }
        uStack_94 = 0xbf800000;
      }
      else {
        uVar25 = FUN_0802bbc8();
        uVar25 = FUN_0802b598(uVar25,0x3cc80000);
        pbStack_ec = (byte *)FUN_0802b1cc(uVar25,0x447a0000);
        uVar25 = FUN_0802bbc8((int)sStack_ae);
        puVar35 = (undefined4 *)FUN_0802b598(uVar25,0x3c23d70a);
        pcStack_e0 = *(char **)(pbVar29 + -0x25);
        pcStack_d8._0_1_ = 1;
        if (cVar30 == '\0') {
          uStack_94 = 0xbf800000;
        }
        else {
          uStack_94 = FUN_0802b814(pbStack_ec,DAT_2000b048);
        }
        *pbVar29 = 0;
      }
      uStack_98 = (uint)pbStack_ec;
      pcStack_8c = pcStack_e0;
      pcStack_88 = (char *)CONCAT31(pcStack_88._1_3_,pcStack_d8._0_1_);
      *(byte **)(pbVar29 + -0x15) = pbStack_ec;
      *(uint *)(pbVar29 + -0x11) = uStack_94;
      *(undefined4 **)(pbVar29 + -0xd) = puVar35;
      iVar7 = iVar7 + 1;
      *(char **)(pbVar29 + -9) = pcStack_e0;
      *(char **)(pbVar29 + -5) = pcStack_88;
      bVar20 = DAT_2000cea3;
      uVar36 = CONCAT44(DAT_2000b05c,DAT_2000b058);
      pbVar29 = pbVar29 + 0x104;
      uStack_90 = puVar35;
    } while (iVar7 != 6);
    iVar7 = FUN_08011424();
    if (5 < bVar20) {
      bVar20 = 5;
    }
    FUN_0801066c(&uStack_98,0,0x14);
    FUN_0801066c(&uStack_ac,0,5);
    puVar17 = &DAT_2000bf88;
    for (uVar21 = 0; (uVar21 & 0xff) < (uint)bVar20; uVar21 = uVar21 + 1) {
      cVar30 = puVar17[0xdc];
      if (cVar30 == '\0') {
LAB_08024d46:
        uVar25 = 0;
      }
      else {
        iVar33 = *(int *)(puVar17 + 0x10);
        if ((((iVar33 == 0) || (1 < (byte)puVar17[1])) ||
            (iVar14 = FUN_0802186e(iVar33 + 4), iVar14 != 0)) ||
           (iVar33 = FUN_0802186e(iVar33 + 0x54), iVar33 != 0)) {
LAB_08024d44:
          cVar30 = '\0';
          goto LAB_08024d46;
        }
        uVar25 = *(undefined4 *)(puVar17 + 0x14);
        uVar3 = *puVar17;
        iVar33 = FUN_0801e808(uVar25,uVar3);
        if (iVar33 != 0) goto LAB_08024d44;
        uVar25 = FUN_08020a1c(uVar25,uVar3);
        iVar33 = FUN_08010530(uVar25,0xbf800000);
        if (iVar33 != 0) {
          cVar30 = '\0';
          goto LAB_08024d46;
        }
      }
      *(char *)((int)&uStack_ac + uVar21) = cVar30;
      (&uStack_98)[uVar21] = uVar25;
      puVar17 = puVar17 + 0xe0;
    }
    bVar19 = 4;
    if ((char)DAT_2000c538 != '\0') {
      bVar19 = DAT_2000c724;
    }
    iStack_d0 = FUN_080202d4(&DAT_2000c538);
    puVar35 = (undefined4 *)0x2000c594;
    pbStack_ec = (byte *)0x7fc00000;
    cVar30 = '\0';
    for (uVar21 = 0; (uVar21 & 0xff) < (uint)bVar20; uVar21 = uVar21 + 1) {
      cVar26 = *(char *)((int)&uStack_ac + uVar21);
      pbVar29 = pbStack_ec;
      cVar1 = cVar30;
      if (cVar26 == '\0') {
LAB_08024d7c:
        FUN_0801066c(puVar35 + -0x14,0,0x60);
      }
      else {
        uVar25 = (&uStack_98)[uVar21];
        iVar33 = FUN_0802bb5c(uVar25,uVar25);
        if (iVar33 != 0) goto LAB_08024d7c;
        cVar27 = *(char *)(puVar35 + 3);
        if (cVar27 == '\0') {
          *puVar35 = uVar25;
          iStack_d4 = FUN_0802b814(uVar25,uVar25);
LAB_08024da0:
          *(char *)(puVar35 + 3) = cVar27 + '\x01';
        }
        else {
          uVar11 = *puVar35;
          iStack_d4 = FUN_0802b814(uVar25,uVar11);
          if (cVar27 != '\x14') goto LAB_08024da0;
          uVar11 = FUN_0802b814((&DAT_2000c53c)
                                [uVar21 * 0x18 + (uint)*(byte *)((int)puVar35 + 0xd) + 2],uVar11);
          uVar12 = FUN_0802b814(puVar35[1],uVar11);
          puVar35[1] = uVar12;
          uVar11 = FUN_0802b598(uVar11,uVar11);
          uVar11 = FUN_0802b814(puVar35[2],uVar11);
          puVar35[2] = uVar11;
        }
        uVar11 = FUN_0802aeb8(puVar35[1],iStack_d4);
        puVar35[1] = uVar11;
        uVar11 = FUN_0802b598(iStack_d4);
        uVar11 = FUN_0802aeb8(puVar35[2],uVar11);
        uVar22 = *(byte *)((int)puVar35 + 0xd) + 1;
        puVar35[2] = uVar11;
        (&DAT_2000c53c)[uVar21 * 0x18 + (uint)*(byte *)((int)puVar35 + 0xd) + 2] = uVar25;
        if ((uVar22 & 0xff) == 0x14) {
          *(undefined1 *)((int)puVar35 + 0xd) = 0;
          if (*(byte *)(puVar35 + 3) != 0x14) goto LAB_08024e2c;
          puStack_cc = puVar35 + -0x14;
          uVar25 = 0;
          cVar27 = '\x14';
          puVar31 = puStack_cc;
          do {
            cVar27 = cVar27 + -1;
            uVar11 = *puVar31;
            puVar31 = puVar31 + 1;
            uVar25 = FUN_0802aeb8(uVar25,uVar11);
          } while (cVar27 != '\0');
          uVar25 = FUN_0802b1cc(uVar25,0x41a00000);
          uVar12 = 0;
          *puVar35 = uVar25;
          uVar11 = 0;
          cVar27 = '\x14';
          do {
            uVar13 = *puStack_cc;
            puStack_cc = puStack_cc + 1;
            uVar13 = FUN_0802b814(uVar13,uVar25);
            uVar11 = FUN_0802aeb8(uVar11,uVar13);
            uVar13 = FUN_0802b598(uVar13);
            uVar12 = FUN_0802aeb8(uVar12,uVar13);
            cVar27 = cVar27 + -1;
          } while (cVar27 != '\0');
          puVar35[1] = uVar11;
          puVar35[2] = uVar12;
LAB_08024e30:
          uVar25 = FUN_0802b1cc(puVar35[1],0x41a00000);
          uVar11 = FUN_0802b1cc(puVar35[2],0x41a00000);
          uVar25 = FUN_0802b598(uVar25,uVar25);
          uVar25 = FUN_0802b814(uVar11,uVar25);
          iVar33 = FUN_0801053c(uVar25,0);
          if (iVar33 != 0) {
            uVar25 = 0;
          }
          uVar25 = FUN_0802944c(uVar25);
          iVar33 = FUN_0802bb5c(uVar25,uVar25);
          if (((iVar33 == 0) && (pbVar29 = (byte *)uVar25, cVar1 = cVar26, cVar30 != '\0')) &&
             (iVar33 = FUN_0801053c(pbStack_ec,uVar25), pbVar29 = pbStack_ec, cVar1 = cVar30,
             iVar33 != 0)) {
            pbVar29 = (byte *)uVar25;
          }
        }
        else {
          *(char *)((int)puVar35 + 0xd) = (char)uVar22;
LAB_08024e2c:
          if (0x13 < *(byte *)(puVar35 + 3)) goto LAB_08024e30;
        }
      }
      pbStack_ec = pbVar29;
      puVar35 = puVar35 + 0x18;
      cVar30 = cVar1;
    }
    DAT_2000c728 = pbStack_ec;
    if ((char)DAT_2000c538 == '\0') {
      DAT_2000c724 = 4;
      cRam2000c734 = (char)DAT_2000c538;
      if (bVar19 != 4) {
        bVar20 = 4;
        iStack_d0 = 0;
        goto LAB_0802500e;
      }
    }
    else {
      if (DAT_2000c724 == 4) {
        DAT_2000c724 = 0;
      }
      uVar21 = (uint)DAT_2000c724;
      if (cVar30 == '\0') {
        if (uVar21 != 3) {
          DAT_2000c724 = 0;
        }
        cRam2000c734 = '\0';
LAB_08024f24:
        if (DAT_2000c724 - 1 < 2) {
LAB_08024f60:
          if (DAT_2000c540 <= (uint)(iVar7 - DAT_2000c72c)) {
            DAT_2000c724 = 3;
          }
        }
      }
      else {
        uVar25 = FUN_08026fb0(DAT_2000c538._2_2_);
        uVar25 = FUN_0802b1cc(uVar25,0x447a0000);
        iVar33 = FUN_08010564(pbStack_ec,uVar25);
        if (iVar33 != 0) {
          cRam2000c734 = '\0';
          if (uVar21 == 0) {
            DAT_2000c724 = 1;
            DAT_2000c738 = DAT_2000c738 + 1;
            DAT_2000c72c = iVar7;
          }
          else {
            if (uVar21 != 2) goto LAB_08024f24;
            DAT_2000c724 = 1;
          }
          goto LAB_08024f60;
        }
        if (cRam2000c734 == '\0') {
          cRam2000c734 = '\x01';
          iRam2000c730 = iVar7;
        }
        if (uVar21 == 1) {
          DAT_2000c724 = 2;
        }
        else if (1 < uVar21 - 2) goto LAB_08024f24;
        if ((uint)(iVar7 - iRam2000c730) < (uint)(ushort)DAT_2000c53c) goto LAB_08024f24;
        DAT_2000c724 = 0;
        cRam2000c734 = '\0';
      }
      bVar20 = DAT_2000c724;
      if ((iStack_d0 == 0) || (iVar7 = FUN_080202d4(&DAT_2000c538), iVar7 != 0)) {
        if (bVar20 == bVar19) goto LAB_0802505c;
        iStack_d0 = 0;
LAB_0802500e:
        iVar7 = FUN_0802bb5c(pbStack_ec);
        if (iVar7 == 0) {
          iVar7 = FUN_0801053c(pbStack_ec,0);
          pcVar15 = "-";
          if (iVar7 == 0) {
            pcVar15 = "";
          }
        }
        else {
          pcVar15 = "-";
          pbStack_ec = (byte *)0xbf800000;
        }
        uVar25 = FUN_08016f60(pbStack_ec,1000);
        uVar11 = FUN_08016f6e(pbStack_ec,1000);
        FUN_08017634("[motion] %u -> %u (score=%s%u.%03u kPa)",bVar19,bVar20,pcVar15,uVar25,uVar11);
        if (iStack_d0 == 0) goto LAB_0802505c;
      }
      else if (bVar20 != bVar19) goto LAB_0802500e;
      FUN_080217a0(&DAT_2000c3e8);
    }
  }
LAB_0802505c:
  if (DAT_2000cd68 != '\0') {
    iVar7 = FUN_08016fe0(&DAT_2000c834);
    if (iVar7 != 0) {
      uVar21 = FUN_08011424();
      uVar22 = 0;
      puVar17 = &DAT_2000c83c;
      do {
        iStack_a0 = 0;
        uStack_9c = 0;
        uStack_a4 = uVar21;
        if (DAT_2000c82c == 0) {
          uVar25 = 0;
          uStack_e8._0_1_ = 0;
          pcStack_e0 = (char *)DAT_2000c82c;
          pcStack_d8 = (char *)0xbf800000;
          pbStack_ec = (byte *)DAT_2000c82c;
        }
        else {
          iVar7 = DAT_2000c82c + uVar22 * 0x104;
          pcStack_d8 = *(char **)(iVar7 + 0xec);
          uStack_e8._0_1_ = *(undefined1 *)(iVar7 + 0xfc);
          pcStack_e0 = *(char **)(iVar7 + 0xf8);
          pbStack_ec = (byte *)FUN_0801b370(iVar7,&uStack_98,&sStack_ae);
          if (pbStack_ec == (byte *)0x0) {
            uVar25 = 0;
          }
          else {
            uVar25 = FUN_0802bbc8((int)sStack_ae);
            uVar25 = FUN_0802b598(uVar25,0x3c23d70a);
          }
        }
        if (DAT_2000c82c == 0) {
          if (uVar22 != 0) goto LAB_080251e8;
          uStack_ac = 0xbf800000;
LAB_080251de:
          uStack_a8 = uVar25;
          if (pbStack_ec == (byte *)0x0) {
LAB_080251e4:
            uStack_a8 = 0xbf800000;
          }
        }
        else if (*(byte *)(DAT_2000c82c + 0x648) == uVar22) {
          uStack_ac = *(uint *)(DAT_2000c82c + 0x618);
          if (*(char *)(DAT_2000c82c + 0x685) == '\0') goto LAB_080251de;
          if (*(char *)(DAT_2000c82c + 0x654) == '\0') goto LAB_080251e4;
          uStack_a8 = *(undefined4 *)(DAT_2000c82c + 0x650);
        }
        else {
LAB_080251e8:
          iVar7 = FUN_0801e808(DAT_2000c82c,uVar22 & 0xff);
          if (((iVar7 == 0) && (iVar7 = FUN_08010530(pcStack_d8,0xbf800000), iVar7 == 0)) &&
             (pbStack_ec != (byte *)0x0)) {
            uStack_ac = (uint)pcStack_d8;
            iStack_a0 = (int)pcStack_e0;
            uStack_9c = (undefined1)uStack_e8;
            uStack_a8 = uVar25;
          }
          else {
            uStack_ac = 0xbf800000;
            uStack_a8 = 0xbf800000;
          }
        }
        iVar7 = FUN_08016e36(puVar17,&uStack_ac);
        if (iVar7 == 0) {
          FUN_08016e6a(puVar17,&uStack_98);
          FUN_08016e36(puVar17,&uStack_ac);
          DAT_2000cd64 = DAT_2000cd64 + 1;
        }
        uVar22 = uVar22 + 1;
        puVar17 = puVar17 + 0x14;
      } while (uVar22 != 6);
    }
    iVar7 = 0;
    do {
      if ((uint)((&DAT_2000c848)[iVar7 * 5] - (&DAT_2000c84c)[iVar7 * 5]) < 10) goto LAB_0802509e;
      iVar7 = iVar7 + 1;
    } while (iVar7 != 6);
    FUN_0801fd38(DAT_2000c830);
  }
LAB_0802509e:
  if ((DAT_2000b546 != '\0') && (iVar7 = FUN_08016fe0(&DAT_2000b528), iVar7 != 0)) {
    if (DAT_2000b545 == '\0') {
      puVar35 = &DAT_2000b580;
      iVar7 = 0;
      do {
        if ((((&DAT_2000b541)[iVar7] == '\0') && (*(char *)((int)puVar35 + 5) != '\0')) &&
           ((iVar33 = FUN_08016f7c(puVar35 + -0xd), iVar33 != 0 &&
            (iVar33 = FUN_08016f7c(puVar35 + -7), iVar33 != 0)))) {
          iVar33 = iVar7 * 0x48;
          *(undefined4 *)(&DAT_2000b550 + iVar33) = 1;
          **(undefined1 **)(&DAT_2000b554 + iVar33) = 4;
          *(undefined4 *)(&DAT_2000b568 + iVar33) = 2;
          iVar33 = FUN_08018390(*puVar35,puVar35 + -0xe);
          if (iVar33 != 0) {
            FUN_08018390(*puVar35,puVar35 + -8);
          }
        }
        iVar33 = iVar7 + 1;
        (&DAT_2000b514)[iVar7] = puVar35[3];
        puVar35 = puVar35 + 0x12;
        iVar7 = iVar33;
      } while (iVar33 != 4);
      pcVar15 = &DAT_2000b585;
      pbVar29 = &DAT_2000b66c;
      pbStack_ec = (byte *)&DAT_0802fb50;
      do {
        if ((pbVar29[-299] == 0) &&
           ((*pcVar15 == '\0' ||
            ((iVar7 = FUN_08016f7c(pcVar15 + -0x39), iVar7 != 0 &&
             (iVar7 = FUN_08016f7c(pcVar15 + -0x21), iVar7 != 0)))))) {
          iVar7 = FUN_08016f7c(pcVar15 + -0x39);
          iVar33 = FUN_08016f7c(pcVar15 + -0x21);
          if ((iVar7 == 2) || (iVar33 == 2)) {
            bVar20 = *pbVar29;
            *pbVar29 = bVar20 + 1;
            if (9 < (byte)(bVar20 + 1)) {
              pbVar29[-299] = 1;
              FUN_08017634("[current_sensing] %s FAILED (I2C errors)",*(undefined4 *)pbStack_ec);
            }
          }
          else if ((iVar7 == 1) && (iVar33 == 1)) {
            *pbVar29 = 0;
          }
        }
        pcVar15 = pcVar15 + 0x48;
        pbStack_ec = (byte *)((int)pbStack_ec + 4);
        pbVar29 = pbVar29 + 1;
      } while (pcVar15 != &DAT_2000b6a5);
    }
    else {
      if (DAT_20000464 < 8) {
        FUN_08027fb8(&uStack_98,&DAT_20001584,(uint)DAT_20000464 << 1);
      }
      uVar25 = FUN_08026fb0(uStack_90._2_2_);
      uVar25 = FUN_0802b598(uVar25,0x3fce4ce5);
      uVar11 = FUN_08026fb0((uint)uStack_90 & 0xffff);
      DAT_2000b514 = FUN_0802b598(uVar11,0x3fce4ce5);
      DAT_2000b518 = 0;
      DAT_2000b51c = uVar25;
      DAT_2000b520 = uVar25;
    }
    DAT_2000b670 = FUN_08011424();
    DAT_2000b674 = 1;
    for (uVar21 = 0; uVar21 < DAT_2000b524; uVar21 = uVar21 + 1 & 0xff) {
      if ((&DAT_2000b541)[uVar21] == '\0') {
        iVar33 = (&DAT_2000b514)[uVar21];
        iVar7 = FUN_0801053c(iVar33,0);
        if (iVar7 != 0) {
          iVar33 = iVar33 + -0x80000000;
        }
        uVar25 = (&DAT_2000b518)[uVar21 + 6];
        iVar7 = FUN_0801053c(uVar25,iVar33);
        if (iVar7 != 0) {
          DAT_2000b540 = '\x01';
          iVar7 = FUN_0801053c(iVar33,0);
          pbStack_ec = (byte *)0x802f00a;
          if (iVar7 == 0) {
            pbStack_ec = (byte *)0x802bee3;
          }
          uVar11 = FUN_08016f60(iVar33,10);
          uVar12 = FUN_08016f6e(iVar33,10);
          iVar7 = FUN_0801053c(uVar25,0);
          pcVar15 = "-";
          if (iVar7 == 0) {
            pcVar15 = "";
          }
          uVar13 = FUN_08016f60(uVar25,10);
          uVar25 = FUN_08016f6e(uVar25,10);
          FUN_08017634("[current_sensing] OVERCURRENT: sensor %d = %s%u.%01u mA (limit %s%u.%01u mA)"
                       ,uVar21,pbStack_ec,uVar11,uVar12,pcVar15,uVar13,uVar25);
        }
      }
    }
  }
  if (DAT_2000b95c != '\0') {
    uVar21 = DAT_2000b678[4];
    iVar7 = FUN_08016fe0(&DAT_2000b680);
    if (iVar7 != 0) {
      uVar25 = FUN_08011424();
      bVar20 = *(byte *)((int)DAT_2000b678 + 0x32);
      uStack_e8 = (uint)bVar20;
      if (uStack_e8 != 0) {
        uStack_e8 = DAT_2000b678[0x57];
        bVar20 = (byte)DAT_2000b678[0x58];
      }
      puVar35 = &DAT_2000b688;
      for (uVar22 = 0; uVar22 < (byte)uVar21; uVar22 = uVar22 + 1) {
        uStack_a4 = uStack_e8;
        iStack_a0 = CONCAT31(iStack_a0._1_3_,bVar20);
        if (*(char *)((int)DAT_2000b678 + 0x32) == '\0') {
LAB_0802583c:
          uStack_ac = 0xbf800000;
        }
        else {
          uVar24 = 0;
          for (uVar16 = 0; (uVar16 & 0xff) < (uint)(byte)DAT_2000b678[4]; uVar16 = uVar16 + 1) {
            if (*(char *)((int)DAT_2000b678 + uVar16 + 0x2d) == '\0') {
              uVar24 = uVar24 | 1 << (uVar16 & 0xff) & 0xffU;
            }
          }
          if (((int)uVar24 >> (uVar22 & 0xff) & 1U) == 0) goto LAB_0802583c;
          switch(uVar22 & 0xff) {
          case 0:
            uStack_ac = *DAT_2000b678;
            break;
          case 1:
            uStack_ac = DAT_2000b678[1];
            break;
          case 2:
            uStack_ac = DAT_2000b678[2];
            break;
          case 3:
            uStack_ac = DAT_2000b678[3];
            break;
          default:
            uStack_ac = 0;
          }
        }
        uStack_a8 = uVar25;
        iVar7 = FUN_08016e36(puVar35,&uStack_ac);
        if (iVar7 == 0) {
          FUN_08016e6a(puVar35,&uStack_98);
          FUN_08016e36(puVar35,&uStack_ac);
          DAT_2000b958 = DAT_2000b958 + 1;
        }
        puVar35 = puVar35 + 5;
      }
    }
    for (uVar22 = 0; uVar22 < (byte)uVar21; uVar22 = uVar22 + 1) {
      if ((uint)((&DAT_2000b694)[uVar22 * 5] - (&DAT_2000b698)[uVar22 * 5]) < 10) goto LAB_080255a6;
    }
    FUN_0801fb64(DAT_2000b67c);
  }
LAB_080255a6:
  if (((DAT_2000cdb6 != '\0') && (DAT_2000b0b8 != '\0')) && (DAT_2000b0c0 != (code *)0x0)) {
    (*DAT_2000b0c0)(&DAT_2000b0b8);
  }
  if ((DAT_2000cdb8 != '\0') && (DAT_2000b1d0 != '\0')) {
    FUN_0801f44c();
  }
  if ((DAT_2000cdb7 != '\0') && (DAT_2000b510 != '\0')) {
    if (DAT_2000b234 != '\0') {
      DataSynchronizationBarrier(0xf);
      DataMemoryBarrier(0x1f);
      if (DAT_2000b244 != '\0') {
        DataSynchronizationBarrier(0xf);
        DataMemoryBarrier(0x1f);
        if (DAT_2000b260 != '\0') {
          if ((DAT_2000b344 != '\0') && (DAT_2000b344 = '\0', DAT_2000b346 == '\0')) {
            DAT_2000b346 = '\x01';
          }
          iVar7 = (*DAT_2000b2fc)();
          if (iVar7 == 0) {
            FUN_0801f388();
            iVar7 = FUN_08016fe0(&DAT_2000b300);
            uVar11 = DAT_2000b2e8;
            uVar25 = DAT_2000b230;
            if (iVar7 != 0) {
              iVar7 = FUN_0801053c(DAT_2000b2e8,0);
              pbStack_ec = (byte *)0x802f00a;
              if (iVar7 == 0) {
                pbStack_ec = (byte *)0x802bee3;
              }
              uVar12 = FUN_08016f60(uVar11,100);
              uVar13 = FUN_08016f6e(uVar11,100);
              uVar11 = DAT_2000b2ec;
              iVar7 = FUN_0801053c(DAT_2000b2ec,0);
              pcVar15 = "-";
              if (iVar7 == 0) {
                pcVar15 = "";
              }
              uVar9 = FUN_08016f60(uVar11,100);
              uVar10 = FUN_08016f6e(uVar11,100);
              uVar11 = DAT_2000b2f0;
              iVar7 = FUN_0801053c(DAT_2000b2f0,0);
              pcVar34 = "-";
              if (iVar7 == 0) {
                pcVar34 = "";
              }
              uVar8 = FUN_08016f60(uVar11,100);
              uVar11 = FUN_08016f6e(uVar11,100);
              FUN_08017634("[lis%s] read (%s%u.%02umg, %s%u.%02umg, %s%u.%02umg)",uVar25,pbStack_ec,
                           uVar12,uVar13,pcVar15,uVar9,uVar10,pcVar34,uVar8,uVar11);
            }
            uVar21 = FUN_080173ac(&DAT_2000b350);
            if (uVar21 < 0x493e1) {
              if (DAT_2000b23c != '\0') {
                FUN_08017634("[lis%s] locked->ok",DAT_2000b230);
              }
              DAT_2000b23c = '\0';
            }
            else {
              if (DAT_2000b23c != '\x01') {
                FUN_08017634("[lis%s] ok->locked",DAT_2000b230);
              }
              DAT_2000b23c = '\x01';
            }
          }
          else {
            FUN_0801afcc(&DAT_2000b230,0x27);
            if (DAT_2000b346 != '\0') {
              DAT_2000b346 = DAT_2000b346 + '\x01';
            }
            if ((DAT_2000b348 != 0) && (DAT_2000b346 == '\x14')) {
              DAT_2000b346 = '\0';
              DAT_2000b345 = DAT_2000b345 | 2;
              uVar25 = FUN_0801f920();
              iVar7 = FUN_08010564(uVar25,0x44fa0000);
              if (iVar7 == 0) {
                iVar7 = FUN_08010578(uVar25,0x44bb8000);
                iVar7 = (-(uint)(iVar7 != 0) & 2000000) + 2000000;
              }
              else {
                iVar7 = -1;
              }
              FUN_08017634("[lis%s] %u > %u == %s",DAT_2000b230,0,iVar7,"false");
              FUN_08017634("[lis%s] saw single tap",DAT_2000b230);
              uStack_98 = FUN_08011424();
              uStack_94 = uStack_94 & 0xffffff00;
              iVar7 = FUN_08016e36(&DAT_2000b308);
              if (iVar7 == 0) {
                pcVar15 = "did not add tap";
              }
              else {
                FUN_08017006(&DAT_2000b35c);
                pcVar15 = "added tap";
              }
              FUN_08017634("[lis%s] %s for %u",DAT_2000b230,pcVar15,uStack_98);
            }
            FUN_0801f388();
          }
        }
      }
    }
    iVar7 = FUN_08016fe0(&DAT_2000b508);
    uVar25 = DAT_2000b2e8;
    if (iVar7 != 0) {
      iVar7 = FUN_0801053c(DAT_2000b2e8,0);
      pbStack_ec = (byte *)0x802f00a;
      if (iVar7 == 0) {
        pbStack_ec = (byte *)0x802bee3;
      }
      uVar11 = FUN_08016f60(uVar25,100);
      uVar12 = FUN_08016f6e(uVar25,100);
      uVar25 = DAT_2000b2ec;
      iVar7 = FUN_0801053c(DAT_2000b2ec,0);
      pcVar15 = "-";
      if (iVar7 == 0) {
        pcVar15 = "";
      }
      uVar13 = FUN_08016f60(uVar25,100);
      uVar9 = FUN_08016f6e(uVar25,100);
      uVar25 = DAT_2000b2f0;
      iVar7 = FUN_0801053c(DAT_2000b2f0,0);
      pcVar34 = "-";
      if (iVar7 == 0) {
        pcVar34 = "";
      }
      uVar10 = FUN_08016f60(uVar25,100);
      uVar25 = FUN_08016f6e(uVar25,100);
      pcVar23 = "ok";
      if ((DAT_2000b23c != '\0') && (pcVar23 = "locked", DAT_2000b23c != '\x01')) {
        pcVar23 = "invalid";
      }
      FUN_08017634("[balloon] accel: x=%s%u.%02umg y=%s%u.%02umg z=%s%u.%02umg status=%s",pbStack_ec
                   ,uVar11,uVar12,pcVar15,uVar13,uVar9,pcVar34,uVar10,uVar25,pcVar23);
    }
  }
  if (DAT_2000cea0 != '\0') {
    if (DAT_2000cdbc != '\0') {
      DataSynchronizationBarrier(0xf);
      DataMemoryBarrier(0x1f);
      if (DAT_2000cdc8 != '\0') {
        DataSynchronizationBarrier(0xf);
        DataMemoryBarrier(0x1f);
        if (DAT_2000cde0 != '\0') {
          DataSynchronizationBarrier(0xf);
          DataMemoryBarrier(0x1f);
          if (DAT_2000cdc8 == '\x02') {
LAB_080257d0:
            DAT_2000ce08 = '\0';
          }
          else {
            DataSynchronizationBarrier(0xf);
            DataMemoryBarrier(0x1f);
            if (DAT_2000cde0 == '\x02') goto LAB_080257d0;
          }
          FUN_0801f8d0(0x1d,6);
        }
      }
    }
    if (DAT_2000cfc8 == 0) {
      FUN_08016fce(&DAT_2000cfc4,60000);
    }
    iVar7 = FUN_08016fe0(&DAT_2000cfc4);
    if (iVar7 != 0) {
      if (DAT_2000cdbc != '\0') {
        DataSynchronizationBarrier(0xf);
        DataMemoryBarrier(0x1f);
        if (DAT_2000ce08 != '\0') {
          uVar21 = FUN_080173ac(&DAT_2000ce0c);
          uVar11 = DAT_2000ce04;
          uVar25 = DAT_2000ce00;
          if (uVar21 < 0x1f5) {
            DataSynchronizationBarrier(0xf);
            DataMemoryBarrier(0x1f);
            iVar7 = FUN_0801053c(DAT_2000ce00,0);
            pbStack_ec = (byte *)0x802f00a;
            if (iVar7 == 0) {
              pbStack_ec = (byte *)0x802bee3;
            }
            uVar12 = FUN_08016f60(uVar25,100);
            uVar13 = FUN_08016f6e(uVar25,100);
            uVar25 = FUN_0802b1cc(uVar25,0x41200000);
            iVar7 = FUN_0801053c(uVar25,0);
            pcVar15 = "-";
            if (iVar7 == 0) {
              pcVar15 = "";
            }
            uVar9 = FUN_08016f60(uVar25,100);
            uVar25 = FUN_08016f6e(uVar25,100);
            iVar7 = FUN_0801053c(uVar11,0);
            pcVar34 = "-";
            if (iVar7 == 0) {
              pcVar34 = "";
            }
            uVar10 = FUN_08016f60(uVar11,10);
            uVar11 = FUN_08016f6e(uVar11,10);
            FUN_08017634("[bmp580] P=%s%u.%02u hPa (%s%u.%02u kPa), T=%s%u.%01u C",pbStack_ec,uVar12
                         ,uVar13,pcVar15,uVar9,uVar25,pcVar34,uVar10,uVar11);
            goto LAB_08025b20;
          }
          DAT_2000ce08 = '\0';
        }
      }
      FUN_08017634("[bmp580] no sample available");
    }
  }
LAB_08025b20:
  if (DAT_2000cf60 != '\0') {
    if (DAT_2000cec8 == '\0') {
LAB_08025b98:
      bVar20 = 0;
      uVar25 = 0;
    }
    else {
      DataSynchronizationBarrier(0xf);
      DataMemoryBarrier(0x1f);
      if (DAT_2000cf04 != '\0') {
        DataSynchronizationBarrier(0xf);
        DataMemoryBarrier(0x1f);
        if (DAT_2000cf1c != '\0') {
          DataSynchronizationBarrier(0xf);
          DataMemoryBarrier(0x1f);
          if (DAT_2000cf04 == '\x02') {
LAB_08025b64:
            DAT_2000cf50 = 0;
          }
          else {
            DataSynchronizationBarrier(0xf);
            DataMemoryBarrier(0x1f);
            if (DAT_2000cf1c == '\x02') goto LAB_08025b64;
          }
          FUN_0801f880(0,6);
        }
      }
      bVar20 = DAT_2000cf50;
      if ((DAT_2000cec8 == '\0') || (DAT_2000cf50 == 0)) goto LAB_08025b98;
      uVar21 = FUN_080173ac(&DAT_2000cf54);
      uVar25 = DAT_2000cf48;
      if (500 < uVar21) {
        DAT_2000cf50 = 0;
        goto LAB_08025b98;
      }
    }
    bVar19 = DAT_2000cf50;
    if (DAT_2000cec8 == '\0') {
      if (DAT_2000cf61 == 0) goto LAB_08025bb0;
LAB_08025f38:
      bVar19 = 0;
      DAT_2000b07c = FUN_0802b1cc(uVar25,0x447a0000);
LAB_08025f16:
      uVar11 = 0;
      bVar28 = bVar19;
LAB_08025f5a:
      DAT_2000b084 = bVar19 & 1;
      DAT_2000b080 = uVar11;
      bVar19 = bVar28;
    }
    else {
      if (DAT_2000cf50 == 0) {
        if (DAT_2000cf61 != 0) {
          DAT_2000b07c = FUN_0802b1cc(uVar25,0x447a0000);
          goto LAB_08025f16;
        }
      }
      else {
        uVar21 = FUN_080173ac(&DAT_2000cf54);
        bVar28 = DAT_2000cf61;
        uVar11 = DAT_2000cf4c;
        if (uVar21 < 0x1f5) {
          if (DAT_2000cf61 != 0) {
            DAT_2000b07c = FUN_0802b1cc(uVar25,0x447a0000);
            bVar19 = bVar20;
            goto LAB_08025f5a;
          }
          goto LAB_08025bb6;
        }
        DAT_2000cf50 = 0;
        if (DAT_2000cf61 != 0) goto LAB_08025f38;
      }
LAB_08025bb0:
      uVar11 = 0;
      bVar19 = 0;
    }
LAB_08025bb6:
    if (DAT_2000cfc0 == 0) {
      FUN_08016fce(&DAT_2000cfbc,10000);
    }
    iVar7 = FUN_08016fe0(&DAT_2000cfbc);
    if (iVar7 != 0) {
      if ((bVar20 == 0) || (bVar19 == 0)) {
        FUN_08017634("[dps368] no sample available");
      }
      else {
        iVar7 = FUN_0801053c(uVar25,0);
        pcVar15 = "-";
        if (iVar7 == 0) {
          pcVar15 = "";
        }
        uVar12 = FUN_08016f60(uVar25,10);
        uVar13 = FUN_08016f6e(uVar25,10);
        uVar25 = FUN_0802b1cc(uVar25,0x447a0000);
        iVar7 = FUN_0801053c(uVar25,0);
        pcVar34 = "-";
        if (iVar7 == 0) {
          pcVar34 = "";
        }
        uVar9 = FUN_08016f60(uVar25,100);
        uVar25 = FUN_08016f6e(uVar25,100);
        iVar7 = FUN_0801053c(uVar11,0);
        pbStack_ec = (byte *)0x802f00a;
        if (iVar7 == 0) {
          pbStack_ec = (byte *)0x802bee3;
        }
        uVar10 = FUN_08016f60(uVar11,10);
        uVar11 = FUN_08016f6e(uVar11,10);
        FUN_08017634("[dps368] P=%s%u.%01u Pa (%s%u.%02u kPa), T=%s%u.%01u C",pcVar15,uVar12,uVar13,
                     pcVar34,uVar9,uVar25,pbStack_ec,uVar10,uVar11);
      }
    }
  }
  if (DAT_2000cea1 != '\0') {
    if (DAT_2000ce1c != '\0') {
      DataSynchronizationBarrier(0xf);
      DataMemoryBarrier(0x1f);
      if (DAT_2000ce28 != '\0') {
        DataSynchronizationBarrier(0xf);
        DataMemoryBarrier(0x1f);
        if (DAT_2000ce40 != '\0') {
          DataSynchronizationBarrier(0xf);
          DataMemoryBarrier(0x1f);
          if (DAT_2000ce28 == '\x02') {
LAB_08025cba:
            DAT_2000ce6e = '\0';
          }
          else {
            DataSynchronizationBarrier(0xf);
            DataMemoryBarrier(0x1f);
            if (DAT_2000ce40 == '\x02') goto LAB_08025cba;
          }
          uVar21 = FUN_080173ac(&DAT_2000ce7c);
          if (999 < uVar21) {
            FUN_08017006(&DAT_2000ce7c);
            iVar7 = FUN_0801b4cc(&DAT_2000ce1c,0x70,1);
            if ((iVar7 != 0) && ((DAT_2000ce5d & 7) == 0)) {
              FUN_08017634("[stusb4500:%s] PDOs cleared, re-applying config",DAT_2000ce9c);
              FUN_0802382c(DAT_2000ce6c);
            }
            FUN_0801b4cc(&DAT_2000ce1c,0x91,4);
          }
          uVar21 = FUN_080173ac(&DAT_2000ce88);
          if (59999 < uVar21) {
            FUN_08017006(&DAT_2000ce88);
            puVar17 = &DAT_08031b16;
            if (DAT_2000ce6b != '\0') {
              puVar17 = &DAT_08031b12;
            }
            FUN_08017634("[stusb4500:%s] periodic: contract=%s V=%umV I=%umA",DAT_2000ce9c,puVar17,
                         DAT_2000ce66,DAT_2000ce68);
            FUN_08023978();
          }
        }
      }
    }
    if ((((DAT_2000cea2 == '\0') && (DAT_2000ce1c != '\0')) && (DAT_2000ce6e != '\0')) &&
       ((DAT_2000ce6b != '\0' &&
        (iVar7 = FUN_0801b470(&DAT_2000ce1c,&uStack_ac,&uStack_98), iVar7 != 0)))) {
      FUN_08017634("[usb-pd] contract negotiated: V=%dmV I=%dmA",uStack_ac & 0xffff,
                   uStack_98 & 0xffff);
      DAT_2000cea2 = '\x01';
    }
    if (DAT_2000cfb8 == 0) {
      FUN_08016fce(&DAT_2000cfb4,60000);
    }
    iVar7 = FUN_08016fe0(&DAT_2000cfb4);
    if (iVar7 != 0) {
      iVar7 = FUN_0801b470(&DAT_2000ce1c,&uStack_ac,&uStack_98);
      if (iVar7 == 0) {
        FUN_08017634("[usb-pd] no status available");
      }
      else {
        puVar17 = &DAT_08031b16;
        if (((DAT_2000ce1c != '\0') && (DAT_2000ce6e != '\0')) && (DAT_2000ce6b != '\0')) {
          puVar17 = &DAT_08031b12;
        }
        FUN_08017634("[usb-pd] contract=%s V=%dmV I=%dmA",puVar17,uStack_ac & 0xffff,
                     uStack_98 & 0xffff);
      }
    }
  }
  if ((((DAT_2000cec4 != '\0') && (DAT_2000ceac != '\0')) && (DAT_2000ceb1 != '\0')) &&
     (uVar21 = FUN_080173ac(&DAT_2000ceb4), DAT_2000cec0 <= uVar21)) {
    FUN_08023e84(&DAT_2000cea4);
    DAT_2000ceb1 = '\0';
  }
  cVar26 = DAT_2000cf69;
  cVar30 = DAT_2000cf68;
  if ((DAT_2000cf70 != '\0') && (DAT_2000cf64 != '\0')) {
    DAT_2000cf69 = DAT_2000cf68;
    switch(DAT_2000cf68) {
    case '\0':
      if (cVar26 != '\0') {
LAB_08025f94:
        FUN_0801066c(&DAT_2000cf65,0,3);
        goto LAB_08026010;
      }
      break;
    case '\x01':
    case '\x02':
      iVar7 = FUN_08011424();
      if (cVar30 == cVar26) {
        if ((uint)(iVar7 - DAT_2000cf6c) < 0x1e) break;
      }
      else {
        DAT_20001106 = 0;
      }
      DAT_2000cf6c = iVar7;
      if (DAT_2000cf68 == '\x01') {
        DAT_20001106 = DAT_20001106 + 0x28f;
        bVar20 = (&DAT_20001004)[DAT_20001106 >> 8];
        uVar3 = FUN_08010274((uint)bVar20 * 0xff + 0x7f,0xff);
        uVar2 = FUN_08010274((uint)bVar20 * 0x19 + 0x7f,0xff);
        DAT_2000cf66 = CONCAT11(uVar3,uVar2);
        DAT_2000cf65 = uVar3;
      }
      else {
        uVar25 = FUN_08011424();
        iVar7 = FUN_08010160(uVar25,0x177);
        if (iVar7 << 0x1f < 0) goto LAB_08025f94;
        DAT_2000cf65 = 5;
        DAT_2000cf66 = 0xff;
      }
LAB_08026010:
      FUN_080209f8(&DAT_2000cf64);
      break;
    case '\x03':
      if (cVar26 != '\x03') {
        DAT_2000cf65 = 0xff;
        DAT_2000cf66 = 0x32;
        goto LAB_08026010;
      }
      break;
    case '\x04':
      if (cVar26 != '\x04') goto LAB_08026010;
    }
  }
  for (uVar21 = 0; uVar21 < DAT_2000bb90; uVar21 = uVar21 + 1 & 0xff) {
    iVar7 = uVar21 * 0x44;
    if (((&DAT_2000b97c)[iVar7] != '\0') && (*(code **)(&DAT_2000b98c + iVar7) != (code *)0x0)) {
      (**(code **)(&DAT_2000b98c + iVar7))(&DAT_2000b960 + iVar7);
    }
    iVar33 = uVar21 * 0x48;
    iVar7 = FUN_08016fe0(iVar33 + 0x2000baa4);
    if (iVar7 != 0) {
      iVar7 = FUN_08011424();
      iVar14 = *(int *)(&DAT_2000ba74 + iVar33);
      iVar32 = *(int *)(&DAT_2000ba78 + iVar33);
      *(int *)(&DAT_2000ba74 + iVar33) = iVar7;
      *(int *)(&DAT_2000ba78 + iVar33) = *(int *)(&DAT_2000ba70 + iVar33);
      if (iVar7 == iVar14) {
        uStack_e8 = 0;
      }
      else {
        uVar25 = FUN_08026fb0((*(int *)(&DAT_2000ba70 + iVar33) - iVar32) *
                              *(int *)(&DAT_2000ba7c + iVar33));
        uVar11 = FUN_08026fb0(iVar7 - iVar14);
        uStack_e8 = FUN_0802b1cc(uVar25,uVar11);
      }
      iVar33 = uVar21 * 0x48;
      iVar7 = *(int *)(&DAT_2000ba88 + iVar33);
      puVar35 = (undefined4 *)(*(int *)(&DAT_2000ba80 + iVar33) + iVar7 * 4);
      uVar25 = FUN_0802b814(uStack_e8,*puVar35);
      uVar25 = FUN_0802aeb8(uVar25,(&DAT_2000ba8c)[uVar21 * 0x12]);
      (&DAT_2000ba8c)[uVar21 * 0x12] = uVar25;
      *puVar35 = uStack_e8;
      uVar22 = iVar7 + 1;
      *(uint *)(&DAT_2000ba88 + iVar33) =
           uVar22 & -(uint)(uVar22 < (uint)(&DAT_2000ba84)[uVar21 * 0x12]);
    }
  }
  if (DAT_2000cfb0 == '\0') {
    FUN_08016fce(&DAT_2000cfa8,30000);
    DAT_2000cfb0 = '\x01';
  }
  iVar7 = FUN_08016fe0(&DAT_2000cfa8);
  if (iVar7 != 0) {
    uVar25 = FUN_08026fb0(DAT_2000bacc);
    FUN_0802b1cc(DAT_2000bad4,uVar25);
    uVar4 = FUN_08026f80();
    uVar25 = FUN_08026fb0(DAT_2000ba84);
    FUN_0802b1cc(DAT_2000ba8c,uVar25);
    uVar5 = FUN_08026f80();
    FUN_08017634("[pwm_pumps] RPM: pump0=%u pump1=%u",uVar5,uVar4);
  }
  for (uVar21 = 0; uVar21 < DAT_2000bf84; uVar21 = uVar21 + 1 & 0xff) {
    iVar7 = uVar21 * 0xa8;
    if ((&DAT_2000bc38)[iVar7] != '\0') {
      FUN_0801e858(&DAT_2000bb98 + iVar7);
      FUN_0801e858(&DAT_2000bbe8 + iVar7);
    }
  }
  if (DAT_2000c534 != '\0') {
    uVar21 = (uint)DAT_2000c3e8;
    switch(uVar21) {
    case 0:
      uStack_e8 = FUN_08016fe0(&DAT_2000c50c);
      if (uStack_e8 != 0) {
        DAT_2000c4d8 = DAT_2000c4d8 + 1;
        iVar7 = FUN_08020dd8();
        for (uVar22 = uVar21; uVar24 = (uint)DAT_2000c400, uVar22 < uVar24;
            uVar22 = uVar22 + 1 & 0xff) {
          iVar33 = (&DAT_2000c3ec)[uVar22];
          if (iVar33 != 0) {
            FUN_08022034(iVar33,0);
            FUN_08020f20(iVar33,&DAT_2000c438 + uVar22 * 0x20);
          }
        }
        puVar17 = &DAT_2000c438;
        for (uVar22 = 0; (uVar22 & 0xff) < uVar24; uVar22 = uVar22 + 1) {
          uVar25 = FUN_0801e6a0(puVar17);
          iVar33 = uVar22 * 3;
          *(char *)((int)&uStack_98 + iVar33) = (char)uVar25;
          *(char *)((int)&uStack_98 + iVar33 + 1) = (char)((uint)uVar25 >> 8);
          *(char *)((int)&uStack_98 + iVar33 + 2) = (char)((uint)uVar25 >> 0x10);
          puVar17 = puVar17 + 0x20;
        }
        if (uVar24 != 0) {
          puVar35 = &uStack_98;
          uVar22 = uVar21;
          do {
            if (*(char *)((int)puVar35 + 2) != '\0') goto LAB_08026662;
            uVar22 = uVar22 + 1 & 0xff;
            puVar35 = (undefined4 *)((int)puVar35 + 3);
          } while (uVar24 != uVar22);
        }
        if (iVar7 == 0) {
          DAT_2000c530 = DAT_2000c530 + 1;
          if (DAT_2000c52c <= DAT_2000c530) {
            DAT_2000c3e8 = 4;
            FUN_08017006(&DAT_2000c51c);
            FUN_08017634("[scheduler] -> SLEEP (%us)",DAT_2000c528);
            for (uVar22 = uVar21; uVar22 < DAT_2000c400; uVar22 = uVar22 + 1 & 0xff) {
              puVar18 = (undefined1 *)(&DAT_2000c3ec)[uVar22];
              if (puVar18 != (undefined1 *)0x0) {
                uVar3 = *puVar18;
                uVar25 = FUN_08020a1c(DAT_2000c408,uVar3);
                uVar24 = uVar21;
                if (puVar18[0xdc] == '\0') {
LAB_080265e8:
                  pcStack_e0 = (char *)(&DAT_0802f9c8)[uVar24];
                }
                else {
                  pcStack_e0 = "UNKNOWN";
                  uVar24 = (uint)(byte)puVar18[1];
                  if ((byte)puVar18[1] < 8) goto LAB_080265e8;
                }
                iVar7 = FUN_0801053c(uVar25,0);
                pcStack_d8 = "-";
                if (iVar7 == 0) {
                  pcStack_d8 = "";
                }
                uVar11 = FUN_08016f60(uVar25,100);
                uVar25 = FUN_08016f6e(uVar25,100);
                uVar12 = *(undefined4 *)(puVar18 + 4);
                iVar7 = FUN_0801053c(uVar12,0);
                pcVar15 = "-";
                if (iVar7 == 0) {
                  pcVar15 = "";
                }
                uVar13 = FUN_08016f60(uVar12,100);
                uVar12 = FUN_08016f6e(uVar12,100);
                FUN_08017634("[scheduler] bag %u: %s P=%s%u.%02u SP=%s%u.%02u",uVar3,pcStack_e0,
                             pcStack_d8,uVar11,uVar25,pcVar15,uVar13,uVar12);
              }
            }
            break;
          }
        }
        else {
LAB_08026662:
          DAT_2000c530 = 0;
        }
        (*DAT_2000c434)(&uStack_98,uVar24,&DAT_2000c410);
        DAT_2000c41c = DAT_2000c430 + 1;
        DAT_2000c416 = 0;
        cVar30 = *(char *)((uint)DAT_2000c410 * 3 + (int)&uStack_98);
        DAT_2000c418 = DAT_2000c4e0;
        if (((cVar30 - 3U & 0xfd) != 0) && (DAT_2000c418 = DAT_2000c4dc, cVar30 != '\x02')) {
          DAT_2000c418 = DAT_2000c4e4;
        }
        uVar21 = 0;
        do {
          if ((uint)DAT_2000c415 <= (uVar21 & 0xff)) {
            uStack_e8 = 0;
            break;
          }
          pbVar29 = &DAT_2000c410 + uVar21;
          uVar21 = uVar21 + 1;
        } while (*(char *)((int)&uStack_98 + (uint)*pbVar29 * 3) != '\x02');
        DAT_2000c420 = (undefined1)uStack_e8;
        DAT_2000c3e8 = 1;
        DAT_2000c4e9 = 0;
        DAT_2000c430 = DAT_2000c41c;
      }
      break;
    case 1:
      FUN_08017006(&DAT_2000c424);
      DAT_2000c518 = '\x01';
      DAT_2000c3e8 = 2;
      FUN_0801066c(&DAT_2000c500,0,8);
      if (DAT_2000c415 != 0) {
        FUN_08017634("[scheduler] -> RUNNING (%u bags, first=%u)",DAT_2000c415,DAT_2000c410);
      }
      break;
    case 2:
      if (DAT_2000c518 == '\0') {
        iVar7 = FUN_08016fe0(&DAT_2000c50c);
        if (iVar7 == 0) break;
      }
      else {
        DAT_2000c518 = '\0';
      }
      FUN_08020dd8();
      if (DAT_2000c415 != 0) {
        uVar22 = 0;
        uVar21 = FUN_080173ac(&DAT_2000c424);
        if (uVar21 < DAT_2000c418) {
          for (; uVar22 < DAT_2000c415; uVar22 = uVar22 + 1 & 0xff) {
            if ((&DAT_2000c3ec)[(&DAT_2000c410)[uVar22]] != 0) {
              FUN_08022034((&DAT_2000c3ec)[(&DAT_2000c410)[uVar22]],1);
            }
          }
          for (uVar21 = 0; uVar21 < DAT_2000c400; uVar21 = uVar21 + 1 & 0xff) {
            pcVar15 = (char *)(&DAT_2000c3ec)[uVar21];
            if (pcVar15 != (char *)0x0) {
              uVar22 = 0;
              do {
                if ((uint)DAT_2000c415 <= (uVar22 & 0xff)) {
                  FUN_08022034(pcVar15,0);
                  break;
                }
                pcVar34 = (char *)(&DAT_2000c410 + uVar22);
                uVar22 = uVar22 + 1;
              } while (*pcVar34 != *pcVar15);
            }
          }
          pbStack_ec = (byte *)0x0;
          if (DAT_2000c415 < 5) {
            for (; bVar20 = DAT_2000c415, pbStack_ec < (uint)DAT_2000c400;
                pbStack_ec = (byte *)((int)pbStack_ec + 1U & 0xff)) {
              pcVar15 = (char *)(&DAT_2000c3ec)[(int)pbStack_ec];
              if (pcVar15 != (char *)0x0) {
                cVar30 = *pcVar15;
                uVar22 = (uint)DAT_2000c415;
                uVar21 = 0;
                do {
                  if (uVar22 <= (uVar21 & 0xff)) {
                    FUN_08020f20(pcVar15,&uStack_98);
                    uVar21 = FUN_0801e6a0(&uStack_98);
                    cVar26 = (char)(uVar21 >> 0x10);
                    uStack_ac = CONCAT22(CONCAT11(uStack_ac._3_1_,cVar26),(short)uVar21);
                    if (cVar26 != '\0') {
                      DAT_2000c415 = bVar20 + 1;
                      (&DAT_2000c410)[uVar22] = cVar30;
                      uVar22 = DAT_2000c4e0;
                      if ((((uVar21 & 0xff) - 3 & 0xfd) != 0) &&
                         (uVar22 = DAT_2000c4dc, (uVar21 & 0xff) != 2)) {
                        uVar22 = DAT_2000c4e4;
                      }
                      FUN_08017006(&DAT_2000c424);
                      DAT_2000c418 = uVar22;
                      FUN_08017634("[scheduler] bag %u joined running set (%u bags)",*pcVar15,
                                   DAT_2000c415);
                      if (4 < DAT_2000c415) goto LAB_080267f6;
                    }
                    break;
                  }
                  pcVar34 = (char *)(&DAT_2000c410 + uVar21);
                  uVar21 = uVar21 + 1;
                } while (*pcVar34 != cVar30);
              }
            }
          }
LAB_080267f6:
          FUN_08021304();
          for (uVar21 = 0; uVar21 < DAT_2000c415; uVar21 = uVar21 + 1 & 0xff) {
            iVar7 = (&DAT_2000c3ec)[(&DAT_2000c410)[uVar21]];
            if ((iVar7 != 0) && (*(char *)(iVar7 + 0xdc) != '\0')) {
              if (*(char *)(iVar7 + 1) == '\x01') {
                iVar7 = FUN_0801b880();
              }
              else {
                iVar7 = FUN_0801b934();
              }
              if (iVar7 == 0) goto switchD_080261a8_default;
            }
          }
        }
        else {
          FUN_08017634("[scheduler] grant timeout");
          for (; uVar22 < DAT_2000c415; uVar22 = uVar22 + 1 & 0xff) {
            iVar7 = (&DAT_2000c3ec)[(&DAT_2000c410)[uVar22]];
            if (((iVar7 != 0) && (*(char *)(iVar7 + 0xdc) != '\0')) &&
               (FUN_0801b8b4(iVar7,"grant timeout"), *(char *)(iVar7 + 0x98) == '\0')) {
              FUN_0801b988(iVar7);
            }
          }
        }
      }
      DAT_2000c3e8 = 3;
      break;
    case 3:
      for (uVar21 = 0; uVar22 = (uint)DAT_2000c415, uVar21 < uVar22; uVar21 = uVar21 + 1 & 0xff) {
        if (((((&DAT_2000c410)[uVar21] < 5) &&
             (puVar18 = (undefined1 *)(&DAT_2000c3ec)[(&DAT_2000c410)[uVar21]],
             puVar18 != (undefined1 *)0x0)) && (puVar18[0xdc] != '\0')) &&
           (*(int *)(puVar18 + 0x10) != 0)) {
          puVar18[0xac] = 0;
          FUN_08017634("[bag_task] bag %u: cleanup complete",*puVar18);
        }
      }
      for (uVar21 = 0; (uVar21 & 0xff) < uVar22; uVar21 = uVar21 + 1) {
        if (((&DAT_2000c410)[uVar21] < 5) &&
           (iVar7 = (&DAT_2000c3ec)[(&DAT_2000c410)[uVar21]], iVar7 != 0)) {
          *(undefined4 *)(iVar7 + 0xa4) = 0;
          *(undefined4 *)(iVar7 + 0xa8) = 0;
        }
      }
      if (DAT_2000c4e8 != '\0') {
        FUN_080212dc(DAT_2000c404);
        DAT_2000c4e8 = '\0';
        DAT_2000c508 = 0;
        FUN_08017634("[scheduler] pump disabled");
      }
      DAT_2000c415 = 0;
      DAT_2000c416 = 0;
LAB_08026a1c:
      DAT_2000c3e8 = 0;
      break;
    case 4:
      uVar21 = FUN_080173ac(&DAT_2000c51c);
      if ((uint)(DAT_2000c528 * 1000) <= uVar21) {
        FUN_08017634("[scheduler] sleep expired, resuming");
        DAT_2000c530 = 0;
        for (uVar21 = 0; uVar21 < DAT_2000c400; uVar21 = uVar21 + 1 & 0xff) {
          puVar18 = (undefined1 *)(&DAT_2000c3ec)[uVar21];
          if (((puVar18 != (undefined1 *)0x0) && (puVar18[0xdc] != '\0')) &&
             (*(int *)(puVar18 + 0x94) != 0)) {
            FUN_08017634("[bag_task] bag %u: wake - clearing oscillation_count=%u",*puVar18);
            *(int *)(puVar18 + 0x94) = 0;
          }
        }
        goto LAB_08026a1c;
      }
    }
switchD_080261a8_default:
    iVar7 = DAT_2000c40c;
    if (((DAT_2000c40c != 0) && (*(char *)(DAT_2000c40c + 0x24) != '\x02')) &&
       ((DAT_2000c534 != '\0' && (iVar33 = FUN_08016fe0(DAT_2000c40c + 0xc), iVar33 != 0)))) {
      uStack_98 = CONCAT31(uStack_98._1_3_,0x5a);
      uVar25 = FUN_08011424();
      uVar21 = uStack_94;
      uStack_98 = CONCAT13((char)((uint)uVar25 >> 8),
                           CONCAT12((char)((uint)uVar25 >> 0x10),
                                    CONCAT11((char)((uint)uVar25 >> 0x18),(byte)uStack_98)));
      uVar22 = 0;
      for (uVar24 = 0; (uVar24 & 0xff) < (uint)DAT_2000c415; uVar24 = uVar24 + 1) {
        if ((&DAT_2000c410)[uVar24] < 8) {
          uVar22 = uVar22 | 1 << (uint)(&DAT_2000c410)[uVar24] & 0xffU;
        }
      }
      uStack_94._3_1_ = SUB41(uVar21,3);
      uStack_94._0_3_ = CONCAT12((char)uVar22,CONCAT11(DAT_2000c3e8,(char)uVar25));
      uVar3 = FUN_0801f338();
      uStack_94 = CONCAT13(uVar3,(undefined3)uStack_94);
      uStack_90 = (undefined4 *)CONCAT31(uStack_90._1_3_,DAT_2000c3e8 == 4);
      iVar33 = 9;
      for (pbStack_ec = (byte *)0x0; pbStack_ec < (uint)DAT_2000c400;
          pbStack_ec = (byte *)((int)pbStack_ec + 1U & 0xff)) {
        iVar32 = (&DAT_2000c3ec)[(int)pbStack_ec];
        uVar25 = FUN_08020a1c(DAT_2000c408,pbStack_ec);
        iVar14 = FUN_08016e18((int)&uStack_98 + iVar33,0x80 - iVar33,*(undefined4 *)(iVar32 + 4));
        iVar33 = iVar33 + iVar14;
        iVar14 = FUN_08016e18((int)&uStack_98 + iVar33,0x80 - iVar33,uVar25);
        bVar20 = *(byte *)(iVar32 + 1);
        iVar33 = iVar33 + iVar14;
        if (7 < bVar20) {
          bVar20 = 0xff;
        }
        *(byte *)((int)&uStack_98 + iVar33) = bVar20;
        *(undefined1 *)((int)&uStack_98 + iVar33 + 1) = *(undefined1 *)(iVar32 + 0xa1);
        *(undefined1 *)((int)&uStack_98 + iVar33 + 2) = *(undefined1 *)(iVar32 + 0xa2);
        iVar33 = iVar33 + 3;
      }
      FUN_08017604(&uStack_98,iVar33);
      uVar25 = FUN_08011424();
      *(undefined4 *)(iVar7 + 4) = uVar25;
    }
  }
  if (DAT_2000cd90 != '\0') {
    FUN_08020a3c();
    FUN_08021880();
  }
  uVar25 = DAT_2000b114;
  if (DAT_2000cdb5 == '\0') {
    if ((DAT_2000b546 == '\0') || (iVar7 = 3, DAT_2000b540 == '\0')) {
      if (DAT_2000cdb6 == '\0') goto LAB_08026426;
      bVar20 = *(byte *)(DAT_2000b0bc + 0x2473);
      iVar7 = FUN_08010530(DAT_2000b114,0xc2c80000);
      if ((iVar7 == 0) && (iVar7 = FUN_08010578(uVar25,0x42700000), iVar7 != 0)) {
        uVar21 = 0;
      }
      else {
        uVar25 = DAT_2000b118;
        iVar7 = FUN_08010530(DAT_2000b118,0xc2c80000);
        if ((iVar7 != 0) || (iVar7 = FUN_08010578(uVar25,0x42700000), iVar7 == 0)) {
          puVar35 = &DAT_2000b0ec;
          for (uVar21 = 0; (uVar21 & 0xff) < (uint)bVar20; uVar21 = uVar21 + 1) {
            uVar25 = *puVar35;
            iVar7 = FUN_08010530(uVar25,0xc2c80000);
            if ((iVar7 == 0) && (iVar7 = FUN_08010578(uVar25,0x42aa0000), iVar7 != 0)) {
              iVar7 = FUN_0801053c(uVar25,0);
              pbStack_ec = (byte *)0x802f00a;
              if (iVar7 == 0) {
                pbStack_ec = (byte *)0x802bee3;
              }
              uStack_e8 = FUN_08016f60(uVar25,10);
              uVar25 = FUN_08016f6e(uVar25,10);
              uVar11 = FUN_08016f60(0x42aa0000,1);
              pcVar15 = "[mux] OVERTEMP: bag %u inflate = %s%u.%01u C (threshold %s%u C)";
              goto LAB_08026b5a;
            }
            uVar25 = puVar35[5];
            iVar7 = FUN_08010530(uVar25,0xc2c80000);
            if ((iVar7 == 0) && (iVar7 = FUN_08010578(uVar25,0x42aa0000), iVar7 != 0)) {
              iVar7 = FUN_0801053c(uVar25,0);
              pbStack_ec = (byte *)0x802f00a;
              if (iVar7 == 0) {
                pbStack_ec = (byte *)0x802bee3;
              }
              uStack_e8 = FUN_08016f60(uVar25,10);
              uVar25 = FUN_08016f6e(uVar25,10);
              uVar11 = FUN_08016f60(0x42aa0000,1);
              pcVar15 = "[mux] OVERTEMP: bag %u deflate = %s%u.%01u C (threshold %s%u C)";
              goto LAB_08026b5a;
            }
            puVar35 = puVar35 + 1;
          }
          goto LAB_08026426;
        }
        uVar21 = 1;
      }
      iVar7 = FUN_0801053c(uVar25,0);
      pbStack_ec = (byte *)0x802f00a;
      if (iVar7 == 0) {
        pbStack_ec = (byte *)0x802bee3;
      }
      uVar25 = (&DAT_2000b0bc)[uVar21 + 0x16];
      uStack_e8 = FUN_08016f60(uVar25,10);
      uVar25 = FUN_08016f6e(uVar25,10);
      uVar11 = FUN_08016f60(0x42700000,1);
      pcVar15 = "[mux] OVERTEMP: pump %u = %s%u.%01u C (threshold %s%u C)";
LAB_08026b5a:
      FUN_08017634(pcVar15,uVar21,pbStack_ec,uStack_e8,uVar25,"",uVar11);
      iVar7 = 4;
    }
    DAT_2000cdb5 = '\x01';
    if (DAT_2000cdb4 != '\0') {
      if (DAT_2000c534 != '\0') {
        FUN_080212dc(DAT_2000c404);
        DAT_2000c4e8 = '\0';
        for (uVar21 = 0; uVar21 < DAT_2000c400; uVar21 = uVar21 + 1 & 0xff) {
          if (((&DAT_2000c3ec)[uVar21] != 0) &&
             (iVar33 = *(int *)((&DAT_2000c3ec)[uVar21] + 0x10), iVar33 != 0)) {
            FUN_08021864(iVar33 + 4);
            FUN_08021864(iVar33 + 0x54);
          }
        }
        FUN_08017634("[scheduler] stopped all");
      }
      bVar20 = DAT_2000cea3;
      puVar18 = &DAT_2000c028;
      for (bVar19 = 0; bVar19 != bVar20; bVar19 = bVar19 + 1) {
        *puVar18 = 1;
        puVar18[1] = (char)iVar7;
        puVar18 = puVar18 + 0xe0;
      }
      FUN_08017634("[balloon] EMERGENCY STOP: %s",*(undefined4 *)(&DAT_08032454 + iVar7 * 4));
    }
  }
LAB_08026426:
  iVar7 = FUN_080173ac(&DAT_2000cd94);
  uVar21 = iVar7 - iVar6;
  DAT_2000cda0 = DAT_2000cda0 + 1;
  DAT_2000cda4 = DAT_2000cda4 + uVar21;
  if (100 < uVar21) {
    DAT_2000cda8 = DAT_2000cda8 + 1;
    FUN_08017634("[balloon] slow control loop: %ums (threshold %ums)",uVar21,100);
  }
  iVar6 = FUN_08016fe0(&DAT_2000cdac);
  if (iVar6 != 0) {
    uVar25 = FUN_08026fb0(DAT_2000cda0);
    uVar11 = FUN_08026fb0(DAT_2000cda4);
    uVar11 = FUN_0802b1cc(uVar11,uVar25);
    iVar6 = DAT_2000cda8;
    uVar12 = FUN_08026fb0(DAT_2000cda8);
    uVar25 = FUN_0802b1cc(uVar12,uVar25);
    uVar25 = FUN_0802b598(uVar25,0x42c80000);
    uVar12 = FUN_08016f60(uVar11,100);
    uVar11 = FUN_08016f6e(uVar11,100);
    uVar13 = FUN_08016f60(uVar25,100);
    uVar25 = FUN_08016f6e(uVar25,100);
    FUN_08017634("[balloon] avg control loop time: %s%u.%02ums, slow loops: %u (%s%u.%02u%%)","",
                 uVar12,uVar11,iVar6,"",uVar13,uVar25);
    DAT_2000cda0 = 0;
    DAT_2000cda4 = 0;
    DAT_2000cda8 = 0;
  }
  return;
LAB_080249c4:
  uVar21 = (uint)*pbVar29;
  iVar7 = FUN_0801e908(uVar21);
  uVar22 = (uint)pbVar29[1];
  iStack_d4 = FUN_0801e908(uVar22);
  if ((iVar7 == 0) && (iStack_d4 == 0)) goto LAB_080249b4;
  bVar20 = pbVar29[0x14];
  FUN_08017634("[pressure] attempting I2C%d recovery (attempt %d/%d)",bVar20,*pbStack_ec + 1,10);
  bVar19 = *pbStack_ec + 1;
  *pbStack_ec = bVar19;
  if (bVar19 < 10) {
    if ((bVar19 < 3) || (DAT_2000b0a8 == (code *)0x0)) {
      uVar25 = *(undefined4 *)(pbVar29 + 4);
      FUN_08024330(*(undefined4 *)(pbVar29 + 8),uVar25);
      FUN_08011458(100);
      if (iVar7 == 0) {
LAB_0802499c:
        if (iStack_d4 == 0) goto LAB_080249b4;
        iStack_d4 = 0;
LAB_0802495a:
        iVar33 = uVar22 * 0x104;
        iVar7 = FUN_08022d40(&DAT_2000aa30 + iVar33,uVar25,0x5d,*(undefined4 *)(pbVar29 + 0x10));
        if (iVar7 == 0) {
          (&DAT_2000ab32)[iVar33] = (&DAT_2000ab32)[iVar33] + '\x01';
          if (iStack_d4 == 0) goto LAB_080249b4;
        }
        else {
          *(undefined2 *)(&DAT_2000ab30 + iVar33) = 0;
          FUN_08017634("[pressure] sensor %d recovered successfully",uVar22);
        }
      }
      else {
        iVar33 = uVar21 * 0x104;
        iVar7 = FUN_08022d40(&DAT_2000aa30 + iVar33,uVar25,0x5c,*(undefined4 *)(pbVar29 + 0xc));
        if (iVar7 == 0) {
          (&DAT_2000ab32)[iVar33] = (&DAT_2000ab32)[iVar33] + '\x01';
          goto LAB_0802499c;
        }
        *(undefined2 *)(&DAT_2000ab30 + iVar33) = 0;
        FUN_08017634("[pressure] sensor %d recovered successfully",uVar21);
        if (iStack_d4 != 0) goto LAB_0802495a;
      }
      FUN_08017634("[pressure] I2C%d recovery successful, resetting bus counter",bVar20);
      *pbStack_ec = 0;
      goto LAB_080249b4;
    }
    FUN_08017634("[pressure] escalating to extender power cycle recovery");
    (*DAT_2000b0a8)();
    FUN_08024330(&DAT_20000a2c,DAT_2000b09c);
    FUN_08024330(&DAT_200009a8,DAT_2000b0a0);
    FUN_08024330(&DAT_20000924,DAT_2000b0a4);
    iVar7 = FUN_08022d40(&DAT_2000aa30 + (uint)DAT_2000b0ac * 0x104,DAT_2000b09c,0x5c,"_sens0");
    uVar21 = (uint)DAT_2000b0ac;
    (&DAT_2000ab30)[uVar21 * 0x104] = (byte)iVar7 ^ 1;
    if (iVar7 != 0) {
      (&DAT_2000ab31)[uVar21 * 0x104] = 0;
    }
    iVar7 = FUN_08022d40(&DAT_2000aa30 + (uint)DAT_2000b0ad * 0x104,DAT_2000b09c,0x5d,"_sens1");
    uVar21 = (uint)DAT_2000b0ad;
    (&DAT_2000ab30)[uVar21 * 0x104] = (byte)iVar7 ^ 1;
    if (iVar7 != 0) {
      (&DAT_2000ab31)[uVar21 * 0x104] = 0;
    }
    iVar7 = FUN_08022d40(&DAT_2000aa30 + (uint)(byte)DAT_2000b0ae * 0x104,DAT_2000b0a0,0x5c,"_sens2"
                        );
    uVar21 = (uint)(byte)DAT_2000b0ae;
    (&DAT_2000ab30)[uVar21 * 0x104] = (byte)iVar7 ^ 1;
    if (iVar7 != 0) {
      (&DAT_2000ab31)[uVar21 * 0x104] = 0;
    }
    iVar7 = FUN_08022d40(&DAT_2000aa30 + (uint)DAT_2000b0ae._1_1_ * 0x104,DAT_2000b0a0,0x5d,"_sens3"
                        );
    uVar21 = (uint)DAT_2000b0ae._1_1_;
    (&DAT_2000ab30)[uVar21 * 0x104] = (byte)iVar7 ^ 1;
    if (iVar7 != 0) {
      (&DAT_2000ab31)[uVar21 * 0x104] = 0;
    }
    if (DAT_2000b0b4 != '\0') {
      iVar7 = FUN_08022d40(&DAT_2000aa30 + (uint)DAT_2000b0b0 * 0x104,DAT_2000b0a4,0x5c,"_sens4");
      uVar21 = (uint)DAT_2000b0b0;
      (&DAT_2000ab30)[uVar21 * 0x104] = (byte)iVar7 ^ 1;
      if (iVar7 != 0) {
        (&DAT_2000ab31)[uVar21 * 0x104] = 0;
      }
    }
    iVar7 = FUN_08022d40(&DAT_2000aa30 + (uint)DAT_2000b0b1 * 0x104,DAT_2000b0a4,0x5d,"_sens5");
    uVar21 = (uint)DAT_2000b0b1;
    (&DAT_2000ab30)[uVar21 * 0x104] = (byte)iVar7 ^ 1;
    if (iVar7 != 0) {
      (&DAT_2000ab31)[uVar21 * 0x104] = 0;
    }
    if (((&DAT_2000ab30)[(uint)DAT_2000b0ac * 0x104] == '\0') &&
       ((&DAT_2000ab30)[(uint)DAT_2000b0ad * 0x104] == '\0')) {
      DAT_2000b098._0_1_ = 0;
    }
    if (((&DAT_2000ab30)[(uint)(byte)DAT_2000b0ae * 0x104] == '\0') &&
       ((&DAT_2000ab30)[(uint)DAT_2000b0ae._1_1_ * 0x104] == '\0')) {
      DAT_2000b098._1_1_ = 0;
    }
    iVar7 = FUN_0801e908();
    if (iVar7 == 0) {
      iVar7 = FUN_0801e908(DAT_2000b0b0);
      if (iVar7 == 0) {
        DAT_2000b09a = 0;
      }
    }
    cVar30 = '\0';
    cVar26 = '\0';
    do {
      iVar7 = FUN_0801e908(cVar26);
      if (iVar7 != 0) {
        cVar30 = cVar30 + '\x01';
      }
      cVar26 = cVar26 + '\x01';
    } while (cVar26 != '\x06');
    FUN_08017634("[pressure] power cycle recovery complete: %d sensors still failed",cVar30);
  }
  else {
    FUN_08017634("[pressure] CRITICAL: I2C%d failed %d recovery attempts, rebooting MCU",bVar20,10);
    FUN_08011458(100);
    FUN_08011e68();
  }
  goto LAB_0802455e;
LAB_080249b4:
  pbVar29 = pbVar29 + 0x18;
  pbStack_ec = pbStack_ec + 1;
  if (abStack_50 == pbVar29) goto LAB_0802455e;
  goto LAB_080249c4;
}


