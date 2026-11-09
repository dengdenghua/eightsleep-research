/* Ghidra static pseudocode; not original source. */

/* WARNING: Function: __gnu_thumb1_case_shi replaced with injection: switch16_shi_r0 */
/* WARNING (jumptable): Removing unreachable block (ram,0x0801e0dc) */
/* WARNING: Function: __gnu_thumb1_case_uqi replaced with injection: switch8_r0 */
/* WARNING: Function: __gnu_thumb1_case_uhi replaced with injection: switch16_uhi_r0 */
/* WARNING (jumptable): Removing unreachable block (ram,0x0801e1c4) */
/* WARNING (jumptable): Removing unreachable block (ram,0x0801e258) */
/* WARNING: Removing unreachable block (ram,0x0801e1c4) */
/* WARNING: Removing unreachable block (ram,0x0801e0dc) */
/* WARNING: Removing unreachable block (ram,0x0801e258) */

void switchD_0801e0dc::default(void)

{
  bool bVar1;
  byte bVar2;
  short sVar3;
  int iVar4;
  undefined4 uVar5;
  undefined4 uVar6;
  undefined4 *puVar7;
  char *pcVar8;
  undefined1 *puVar9;
  undefined1 *extraout_r1;
  uint uVar10;
  undefined4 *puVar11;
  undefined4 *extraout_r2;
  uint uVar12;
  uint extraout_r3;
  char *pcVar13;
  undefined4 *unaff_r6;
  undefined1 *unaff_r7;
  ushort in_stack_00000084;
  ushort in_stack_000000ac;
  byte bStack000000d4;
  undefined1 uStack000000d5;
  undefined1 uStack000000d6;
  undefined1 uStack000000d7;
  undefined1 in_stack_000000d8;
  
  do {
    do {
      pcVar13 = &DAT_20002534;
      if (DAT_2000257c <= DAT_20002580) {
        DAT_2000257c = (*DAT_20002538)(&DAT_2000253c,0x40);
        DAT_20002580 = 0;
        if (DAT_2000257c == 0) {
          if (DAT_2000a5bc == 0) goto LAB_0801e066;
          iVar4 = FUN_08016fe0(&DAT_2000a5c0);
          bVar1 = false;
          if (iVar4 == 0) goto LAB_0801e066;
          goto LAB_0801e112;
        }
      }
      puVar9 = &DAT_20002584;
      uVar10 = DAT_20002580 + 1;
      uVar12 = (uint)(byte)(&DAT_2000253c)[DAT_20002580];
      DAT_20002580 = uVar10;
      if (DAT_20002584 == '\0') {
        puVar11 = (undefined4 *)0x0;
        goto LAB_0801e0c4;
      }
    } while (DAT_20002584 != '\x01');
    puVar11 = (undefined4 *)0x0;
    DAT_20002584 = '\0';
    uVar12 = uVar12 ^ 0x20;
LAB_0801e0d4:
    switch(*pcVar13) {
    case '\0':
      if (puVar11 == (undefined4 *)0x1) {
        *pcVar13 = '\x01';
        pcVar13[0x809c] = '\0';
        pcVar13[0x809d] = '\0';
        pcVar13[0x809e] = '\0';
        pcVar13[0x809f] = '\0';
        **(undefined4 **)(pcVar13 + 0x80a0) = 0;
        pcVar13[0x80a4] = '\0';
        pcVar13[0x80a5] = '\0';
        pcVar13[0x80ac] = '\0';
        pcVar13[0x80ad] = '\0';
        pcVar13[0x80ae] = '\0';
        pcVar13[0x80af] = '\0';
        pcVar13[0x80b0] = '\0';
        pcVar13[0x80b1] = '\0';
        pcVar13[0x80b2] = '\0';
        pcVar13[0x80b3] = '\0';
      }
      break;
    case '\x01':
      iVar4 = *(int *)(pcVar13 + 0x80ac);
      uVar10 = iVar4 + 1;
      *(uint *)(pcVar13 + 0x80ac) = uVar10;
      uVar12 = uVar12 << (((*(uint *)(pcVar13 + 0x80a8) - 1) - iVar4) * 8 & 0xff) |
               *(uint *)(pcVar13 + 0x80b0);
      *(uint *)(pcVar13 + 0x80b0) = uVar12;
      if (*(uint *)(pcVar13 + 0x80a8) <= uVar10) {
        *pcVar13 = '\x02';
        **(uint **)(pcVar13 + 0x80a0) = uVar12;
      }
      break;
    case '\x02':
      uVar10 = *(uint *)(pcVar13 + 0x809c);
      if (uVar10 < *(uint *)(pcVar13 + 0x8098)) {
        *(uint *)(pcVar13 + 0x809c) = uVar10 + 1;
        *(char *)(*(int *)(pcVar13 + 0x8094) + uVar10) = (char)uVar12;
      }
      else {
        *(uint *)(pcVar13 + 0x809c) = uVar10 + 1;
      }
      if (*(int *)(pcVar13 + 0x809c) == **(int **)(pcVar13 + 0x80a0)) {
        *pcVar13 = '\x03';
      }
      break;
    case '\x03':
      *pcVar13 = '\x04';
      *(short *)(pcVar13 + 0x80a4) = (short)(uVar12 << 8);
      break;
    case '\x04':
      *pcVar13 = '\0';
      *(ushort *)(pcVar13 + 0x80a4) = (ushort)uVar12 | *(ushort *)(pcVar13 + 0x80a4);
      sVar3 = FUN_08011fb0(&DAT_200006c0,*(undefined4 *)(pcVar13 + 0x8094),
                           *(undefined4 *)(pcVar13 + 0x809c));
      if (*(short *)(pcVar13 + 0x80a4) != sVar3) break;
      if (DAT_200024d9 != '\0') {
        DAT_200024d8 = 1;
        FUN_0801aec8(&DAT_200024dc);
      }
      unaff_r6 = (undefined4 *)(DAT_200023d8 & 0x7f);
      if ((char)DAT_200023d8 < '\0') {
        if ((undefined1 *)0x3 < (undefined1 *)((int)unaff_r6 + -2)) {
          FUN_08017634("Received response to 0x%02x",unaff_r6);
        }
        goto LAB_0801e056;
      }
      puVar11 = (undefined4 *)&stack0x000000d4;
      DAT_200023d0 = 0;
      bStack000000d4 = (byte)unaff_r6 | 0x80;
      FUN_08015fbc(puVar11,1);
      switch(unaff_r6) {
      case (undefined4 *)0x1:
        bStack000000d4 = 0x46;
        FUN_08015fec(0);
        uVar5 = 1;
        puVar7 = puVar11;
        goto LAB_0801e1dc;
      case (undefined4 *)0x2:
        FUN_08015fec(0);
        uVar5 = 0x80;
        puVar7 = (undefined4 *)0x807f804;
LAB_0801e1dc:
        FUN_08015fbc(puVar7,uVar5);
        break;
      case (undefined4 *)0x3:
      case (undefined4 *)0x4:
        uVar5 = 4;
LAB_0801e1f4:
        FUN_08015fec(uVar5);
        break;
      case (undefined4 *)0x5:
        FUN_08015fec(0);
        FUN_0801aca4();
        FUN_08017634("Rebooting...");
        FUN_08011458(100);
        if (DAT_200024d9 != '\0') {
          FUN_0801590e(&DAT_200020f4);
          FUN_080158d4(&DAT_200020f4);
          DAT_200024d9 = '\0';
        }
        do {
          FUN_08011e68();
        } while( true );
      default:
        iVar4 = DAT_200023d4 + -1;
        FUN_08017634("[cmd] received command 0x%02x, payload_len=%u",unaff_r6,iVar4);
        bVar2 = DAT_200023d9;
        if (unaff_r6 == (undefined4 *)0x6) {
          bStack000000d4 = 0x4c;
          if ((*(code **)(unaff_r7 + 0x2568) != (code *)0x0) &&
             (iVar4 = (**(code **)(unaff_r7 + 0x2568))(), iVar4 == 1)) {
            bStack000000d4 = 0x52;
          }
          FUN_08017634("[cmd] side=%c",bStack000000d4);
          FUN_08015fec(0);
          uVar5 = 1;
          puVar7 = (undefined4 *)&stack0x000000d4;
          goto LAB_0801e1dc;
        }
        if (0x11 < ((uint)(unaff_r6 + -0x14) & 0xff)) {
switchD_0801e258_caseD_6:
          pcVar8 = "[cmd] unsupported: 0x%02x";
LAB_0801e446:
          FUN_08017634(pcVar8,unaff_r6);
          uVar5 = 2;
          goto LAB_0801e1f4;
        }
        switch(unaff_r6 + -0x14) {
        case (undefined4 *)0x0:
          FUN_08018c34(unaff_r7,&DAT_200023d9,iVar4);
          break;
        case (undefined4 *)0x1:
          FUN_08018dfc(unaff_r7,&DAT_200023d9,iVar4);
          break;
        case (undefined4 *)0x2:
          FUN_080191c8(unaff_r7,&DAT_200023d9,iVar4);
          break;
        case (undefined4 *)0x3:
          FUN_0801972c(unaff_r7,&DAT_200023d9,iVar4);
          break;
        case (undefined4 *)0x4:
          if ((unaff_r7[0x2384] == '\0') || (unaff_r7[0x1b04] == '\0')) {
            pcVar8 = "[cmd] balloon controller not initialized";
            goto LAB_0801e382;
          }
          if (iVar4 == 0) {
            FUN_08017634("[cmd] set_mode: need 1 byte payload");
            goto LAB_0801e392;
          }
          pcVar8 = "[cmd] invalid mode %u";
          if (DAT_200023d9 < 2) {
            iVar4 = FUN_08021ab0(&DAT_2000c814,DAT_200023d9);
            if (iVar4 != 0) {
              FUN_08015fec(0);
              bStack000000d4 = 0;
              if (unaff_r7[0x1df8] != '\0') {
                bStack000000d4 = unaff_r7[0x1df0];
              }
              FUN_08015fbc(puVar11,1);
              FUN_08017634("[cmd] mode set to %u",bStack000000d4);
              break;
            }
            pcVar8 = "[cmd] failed to apply mode %u";
          }
          FUN_08017634(pcVar8,bVar2);
LAB_0801e3b4:
          uVar5 = 1;
          goto LAB_0801e1f4;
        case (undefined4 *)0x5:
          FUN_0801bbb4(unaff_r7,&DAT_200023d9,iVar4);
          break;
        default:
          goto switchD_0801e258_caseD_6;
        case (undefined4 *)0x10:
          FUN_0801a5dc(unaff_r7,&DAT_200023d9,iVar4);
          break;
        case (undefined4 *)0x11:
          if (iVar4 == 0) {
LAB_0801e392:
            uVar5 = 6;
            goto LAB_0801e1f4;
          }
          if (unaff_r7[0x2471] == '\0') {
            pcVar8 = "[cmd] usb_pd: no STUSB4500 present";
LAB_0801e382:
            FUN_08017634(pcVar8);
            goto LAB_0801e3b4;
          }
          unaff_r6 = (undefined4 *)(uint)DAT_200023d9;
          if (unaff_r6 == (undefined4 *)0x0) {
            in_stack_00000084 = (ushort)DAT_200023d9;
            in_stack_000000ac = in_stack_00000084;
            FUN_0801b470(&DAT_2000ce1c,&stack0x00000084,&stack0x000000ac);
            bStack000000d4 = 0;
            if ((unaff_r7[0x23ec] != '\0') && (bStack000000d4 = 0, unaff_r7[0x243e] != '\0')) {
              bStack000000d4 = unaff_r7[0x243b];
            }
            uStack000000d5 = (undefined1)in_stack_00000084;
            uStack000000d6 = (undefined1)(in_stack_00000084 >> 8);
            uStack000000d7 = (undefined1)in_stack_000000ac;
            in_stack_000000d8 = (undefined1)(in_stack_000000ac >> 8);
            FUN_08015fbc(&stack0x000000d4,5);
LAB_0801e4c4:
            uVar5 = 0;
            goto LAB_0801e1f4;
          }
          if (unaff_r6 == (undefined4 *)0x1) {
            FUN_08017634("[cmd] usb_pd: restoring NVM factory defaults");
            if (*(int *)(unaff_r7 + 0x23f0) != 0) {
              FUN_08017634("[stusb4500:%s] nvm: restoring ST factory defaults...",
                           *(undefined4 *)(unaff_r7 + 0x246c));
              puVar11 = (undefined4 *)&DAT_2000ce1c;
              iVar4 = FUN_0801b5bc(&DAT_2000ce1c,1);
              if (iVar4 == 0) {
                FUN_08017634("[stusb4500:%s] nvm: failed to enter write mode",
                             *(undefined4 *)(unaff_r7 + 0x246c));
              }
              else {
                iVar4 = FUN_0801b678(&DAT_2000ce1c);
                uVar12 = 0;
                if (iVar4 == 0) {
                  FUN_08017634("[stusb4500:%s] nvm: erase failed",*(undefined4 *)(unaff_r7 + 0x246c)
                              );
LAB_0801e514:
                  puVar11 = (undefined4 *)&DAT_2000ce1c;
                  FUN_08024138(&DAT_2000ce1c);
                }
                else {
                  do {
                    puVar11 = (undefined4 *)&DAT_2000ce1c;
                    iVar4 = FUN_0801b718(&DAT_2000ce1c,uVar12 & 0xff,&DAT_0802fbdc + uVar12 * 8);
                    if (iVar4 == 0) {
                      FUN_08017634("[stusb4500:%s] nvm: failed to write bank %u",
                                   *(undefined4 *)(unaff_r7 + 0x246c),uVar12);
                      goto LAB_0801e514;
                    }
                    uVar12 = uVar12 + 1;
                  } while (uVar12 != 5);
                  FUN_08024138(&DAT_2000ce1c);
                  iVar4 = FUN_0801b5bc(&DAT_2000ce1c,0);
                  uVar12 = 0;
                  if (iVar4 != 0) {
                    do {
                      unaff_r7 = &DAT_2000ce1c;
                      iVar4 = FUN_0801b614(&DAT_2000ce1c,uVar12 & 0xff,&stack0x000000d4);
                      if ((iVar4 == 0) ||
                         (iVar4 = FUN_08028054(&stack0x000000d4,&DAT_0802fbdc + uVar12 * 8,8),
                         iVar4 != 0)) {
                        FUN_08017634("[stusb4500:%s] nvm: verify failed at bank %u",DAT_2000ce9c,
                                     uVar12);
                        goto LAB_0801e514;
                      }
                      uVar12 = uVar12 + 1;
                    } while (uVar12 != 5);
                    FUN_08024138(&DAT_2000ce1c);
                    FUN_08017634("[stusb4500:%s] nvm: factory defaults restored and verified",
                                 DAT_2000ce9c);
                    FUN_08017634("[cmd] usb_pd: NVM factory reset OK - power cycle to take effect");
                    goto LAB_0801e4c4;
                  }
                }
              }
            }
            pcVar8 = "[cmd] usb_pd: NVM factory reset FAILED";
            goto LAB_0801e382;
          }
          pcVar8 = "[cmd] usb_pd: unsupported subcommand 0x%02x";
          goto LAB_0801e446;
        }
      }
      FUN_0801aca4();
      unaff_r6 = puVar11;
LAB_0801e056:
      if ((*(int *)(pcVar13 + 0x8088) == 0) || (iVar4 = FUN_08016fe0(&DAT_2000a5c0), iVar4 == 0)) {
LAB_0801e060:
        FUN_08017006(&DAT_2000cf88);
      }
      else {
        bVar1 = true;
LAB_0801e112:
        uVar5 = FUN_08026fb0(*(undefined4 *)(pcVar13 + 0x8084));
        uVar6 = FUN_08026fb0(*(undefined4 *)(pcVar13 + 0x8088));
        uVar5 = FUN_0802b1cc(uVar5,uVar6);
        unaff_r6 = (undefined4 *)FUN_08016f60(uVar5,10000);
        uVar5 = FUN_08016f6e(uVar5,10000);
        FUN_08017634("[lsp] avg selection time=%s%u.%04u","",unaff_r6,uVar5);
        puVar9 = DAT_200020f0;
        pcVar8 = DAT_200020e0;
        puVar11 = DAT_200020d8;
        pcVar13 = "[lsp] avg selection time=%s%u.%04u";
        if (DAT_20002515 != '\0') {
          FUN_08017634("[usb] rxo=%u,txb=%u,txto=%u,txnr=%u,txe=%u,drop=%u",DAT_200020ec,
                       DAT_200020e4,DAT_20002528);
          pcVar13 = pcVar8;
          unaff_r6 = puVar11;
          unaff_r7 = puVar9;
        }
        if (bVar1) goto LAB_0801e060;
      }
LAB_0801e066:
      iVar4 = FUN_08016fe0(&DAT_2000cf7c);
      if (iVar4 != 0) {
        DAT_2000cf84 = DAT_2000cf84 ^ 1;
        (*DAT_2000cf78)();
      }
      FUN_080173c4(&DAT_2000a5e8);
      FUN_080173c4(&DAT_2000a754);
      FUN_080173c4(&DAT_2000a8c0);
      uVar12 = FUN_080173ac(&DAT_2000cf88);
      if (60000 < uVar12) {
        pcVar13 = &DAT_200024d9;
        if (DAT_200024d9 != '\0') {
          FUN_0801590e(&DAT_200020f4);
          FUN_080158d4(&DAT_200020f4);
          DAT_200024d9 = '\0';
        }
        FUN_08011e68();
      }
      WaitForEvent();
      FUN_0801ce1a();
      puVar9 = extraout_r1;
      puVar11 = extraout_r2;
      uVar12 = extraout_r3;
LAB_0801e0c4:
      if (uVar12 == 0x7d) {
        *puVar9 = (char)unaff_r6;
        break;
      }
      if (uVar12 == 0x7e) {
        *pcVar13 = (char)puVar11;
        puVar11 = unaff_r6;
      }
      goto LAB_0801e0d4;
    default:
      break;
    }
  } while( true );
}


