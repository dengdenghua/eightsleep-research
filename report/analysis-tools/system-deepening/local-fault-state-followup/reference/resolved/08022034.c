/* Ghidra static pseudocode; not original source. */

/* WARNING: Function: __gnu_thumb1_case_uhi replaced with injection: switch16_uhi_r0 */
/* WARNING (jumptable): Removing unreachable block (ram,0x080226de) */
/* WARNING (jumptable): Removing unreachable block (ram,0x0802237a) */
/* WARNING: Removing unreachable block (ram,0x080226de) */
/* WARNING: Removing unreachable block (ram,0x0802237a) */

void FUN_08022034(undefined1 *param_1,int param_2)

{
  code *pcVar1;
  byte bVar2;
  char cVar3;
  char cVar4;
  undefined4 uVar5;
  int iVar6;
  undefined4 uVar7;
  undefined4 uVar8;
  uint uVar9;
  undefined4 uVar10;
  byte *pbVar11;
  undefined1 uVar12;
  undefined4 uVar13;
  undefined4 uVar14;
  int iVar15;
  uint uVar16;
  undefined4 *puVar17;
  undefined1 *puVar18;
  char *pcVar19;
  uint uVar20;
  char *pcStack_34;
  char *pcStack_30;
  
  if (param_1 == (undefined1 *)0x0) {
    return;
  }
  if (param_1[0xdc] == '\0') {
    return;
  }
  uVar5 = FUN_08020a1c(*(undefined4 *)(param_1 + 0x14),*param_1);
  if (param_1[1] == '\x03') {
    iVar6 = FUN_08011424();
    if (*(uint *)(param_1 + 0xd4) <= (uint)(iVar6 - *(int *)(param_1 + 0xd8))) {
      puVar17 = (undefined4 *)(param_1 + 200);
      uVar13 = *puVar17;
      if ((*(int *)(param_1 + 0xc4) != 0) &&
         (iVar15 = iVar6 - *(int *)(param_1 + 0xc4), iVar15 - 1U < 999)) {
        uVar7 = FUN_0802b814(*(undefined4 *)(param_1 + 0xc0),uVar5);
        uVar8 = FUN_08026fb0(iVar15);
        uVar8 = FUN_0802b1cc(uVar8,0x447a0000);
        uVar7 = FUN_0802b1cc(uVar7,uVar8);
        uVar7 = FUN_0802b598(uVar7,0x3e99999a);
        uVar13 = FUN_0802b598(uVar13,0x3f333333);
        uVar13 = FUN_0802aeb8(uVar7,uVar13);
        iVar15 = FUN_0801053c(uVar13,0);
        uVar7 = 0;
        if (iVar15 == 0) {
          iVar15 = FUN_08010564(uVar13,0x3fc00000);
          if (iVar15 == 0) {
            *puVar17 = uVar13;
            goto LAB_080220f0;
          }
          uVar7 = 0x3fc00000;
        }
        *puVar17 = uVar7;
      }
    }
LAB_080220f0:
    *(undefined4 *)(param_1 + 0xc0) = uVar5;
    *(int *)(param_1 + 0xc4) = iVar6;
    uVar13 = FUN_08026fb0(*(undefined4 *)(param_1 + 0xd0));
    uVar13 = FUN_0802b1cc(uVar13,0x447a0000);
    uVar13 = FUN_0802b598(uVar13,*(undefined4 *)(param_1 + 200));
    uVar13 = FUN_0802b814(uVar5,uVar13);
    *(undefined4 *)(param_1 + 0xcc) = uVar13;
  }
  if (param_1[1] == '\x01') {
    uVar9 = FUN_080173ac(param_1 + 0x3c);
    if (499 < uVar9) {
      uVar13 = FUN_0802b814(uVar5,*(undefined4 *)(param_1 + 0x48));
      uVar7 = FUN_08026fb0(uVar9);
      uVar7 = FUN_0802b1cc(uVar7,0x447a0000);
      iVar6 = FUN_0802b1cc(uVar13,uVar7);
      *(int *)(param_1 + 0x4c) = iVar6;
      iVar15 = FUN_0801053c(iVar6,0);
      if (iVar15 != 0) {
        iVar6 = iVar6 + -0x80000000;
      }
      iVar6 = FUN_0801053c(iVar6,0x3d75c28f);
      pbVar11 = param_1 + 0x50;
      if (iVar6 == 0) {
        *pbVar11 = 0;
      }
      else if (*pbVar11 < 3) {
        *pbVar11 = *pbVar11 + 1;
      }
      *(undefined4 *)(param_1 + 0x48) = uVar5;
      FUN_08017006(param_1 + 0x3c);
    }
  }
  bVar2 = param_1[1];
  uVar9 = (uint)bVar2;
  uVar12 = *param_1;
  uVar13 = *(undefined4 *)(param_1 + 4);
  iVar15 = *(int *)(param_1 + 0xc);
  iVar6 = FUN_0801e808(*(undefined4 *)(param_1 + 0x14),uVar12);
  puVar18 = param_1 + 0x2e;
  if ((iVar6 == 0) && (iVar6 = FUN_08010530(uVar5,0xbf800000), iVar6 == 0)) {
    iVar6 = FUN_08010578(uVar5,0x41500000);
    if (iVar6 != 0) {
      *puVar18 = 0;
      goto LAB_0802286c;
    }
    if ((param_1[0xa0] != '\0') && ((byte)param_1[0xa1] - 3 < 2)) {
      *puVar18 = 0;
      goto LAB_0802286c;
    }
    if (uVar9 == 5) {
      iVar6 = FUN_0801053c(uVar5,0x41400000);
      if (iVar6 == 0) goto LAB_080221f6;
      if ((*(uint *)(param_1 + 0x8c) < 3) && (*(uint *)(param_1 + 0x90) < 3)) {
        iVar6 = FUN_08010530(uVar13,0xbf800000);
        if (iVar6 == 0) {
          iVar6 = FUN_0801053c(uVar13,0);
          if (iVar6 != 0) {
            param_1[0x2e] = 0;
LAB_08022820:
            if (uVar9 < 8) goto LAB_08022272;
            uVar20 = 0;
            pcVar19 = "UNKNOWN";
            goto LAB_08022456;
          }
          cVar3 = param_1[0x2c];
LAB_0802234a:
          iVar6 = FUN_08010578(uVar13,0);
          if ((iVar6 == 0) || (iVar6 = FUN_08010550(uVar13,0x3dcccccd), iVar6 == 0)) {
            uVar7 = FUN_0802b814(uVar5,uVar13);
            puVar18 = param_1 + 0x2e;
            switch(uVar9) {
            case 0:
              iVar6 = FUN_0801053c(iVar15,uVar7);
              if (iVar6 == 0) {
                iVar6 = FUN_0801053c(uVar7,iVar15 + -0x80000000);
LAB_0802243e:
                if (iVar6 == 0) {
                  param_1[0x2e] = 0;
                  pcVar19 = (char *)(&DAT_0802f9c8)[uVar9];
                  goto LAB_08022454;
                }
                iVar6 = FUN_0801b95a(param_1);
                if (iVar6 != 0) goto LAB_080225ac;
                uVar20 = 2;
                param_1[0x2e] = 0;
              }
              else {
LAB_080225a0:
                iVar6 = FUN_0801b95a(param_1);
                if (iVar6 != 0) {
LAB_080225ac:
                  param_1[0x2e] = 1;
                  if (uVar9 == 0) goto LAB_080226aa;
                  goto LAB_08022820;
                }
                uVar20 = 3;
                param_1[0x2e] = 0;
              }
              if (uVar9 == uVar20) goto LAB_080226aa;
              pcVar19 = "UNKNOWN";
              if (7 < uVar9) goto LAB_08022456;
              goto LAB_08022414;
            case 1:
              iVar6 = FUN_0801b880(param_1);
              if (iVar6 != 0) {
                iVar6 = FUN_0801053c(iVar15,uVar7);
                if (iVar6 == 0) {
                  iVar6 = FUN_0801053c(uVar7,iVar15 + -0x80000000);
                  uVar20 = 2;
                  if (iVar6 == 0) break;
                }
                else {
                  uVar20 = 3;
                }
                iVar6 = FUN_0801b95a(param_1);
                if (iVar6 == 0) {
                  *puVar18 = 0;
                  uVar16 = FUN_080173ac(param_1 + 0x30);
                  if (2999 < uVar16) {
                    uVar12 = *param_1;
                    goto LAB_08022834;
                  }
                  iVar15 = *(int *)(param_1 + 0x94) + 1;
                  *(int *)(param_1 + 0x94) = iVar15;
                  uVar12 = *param_1;
                  uVar13 = *(undefined4 *)(param_1 + 0x9c);
                  iVar6 = FUN_0801053c(uVar13,0);
                  pcStack_30 = "-";
                  if (iVar6 == 0) {
                    pcStack_30 = "";
                  }
                  uVar7 = FUN_08016f60(uVar13,100);
                  uVar13 = FUN_08016f6e(uVar13,100);
                  iVar6 = FUN_0801053c(uVar5,0);
                  pcVar19 = "-";
                  if (iVar6 == 0) {
                    pcVar19 = "";
                  }
                  uVar8 = FUN_08016f60(uVar5,100);
                  uVar14 = FUN_08016f6e(uVar5,100);
                  FUN_08017634("[bag_task] bag %u: oscillation %u (P_entry=%s%u.%02u P_exit=%s%u.%02u dwell_ms=%u)"
                               ,uVar12,iVar15,pcStack_30,uVar7,uVar13,pcVar19,uVar8,uVar14,uVar16);
                  uVar12 = *param_1;
                  pcVar19 = "STEADY";
                  if (4 < *(uint *)(param_1 + 0x94)) {
                    uVar20 = 7;
                  }
                  goto LAB_08022456;
                }
                uVar12 = 1;
                goto LAB_080226a8;
              }
              break;
            case 2:
              uVar13 = FUN_0801b824(param_1);
              iVar6 = FUN_08010578(uVar5,uVar13);
              if (iVar6 != 0) {
                *puVar18 = 0;
                uVar12 = *param_1;
                pcVar19 = "INFLATE";
                goto LAB_08022454;
              }
              break;
            case 3:
              iVar6 = FUN_08011424();
              if (*(uint *)(param_1 + 0xd4) <= (uint)(iVar6 - *(int *)(param_1 + 0xd8))) {
                uVar13 = FUN_0801b7b8(param_1);
                iVar6 = FUN_0801053c(uVar5,0x3dcccccd);
                if ((iVar6 != 0) || (iVar6 = FUN_08010550(uVar5,uVar13), iVar6 != 0)) {
                  *puVar18 = 0;
                  uVar12 = *param_1;
                  pcVar19 = "DEFLATE";
                  goto LAB_08022454;
                }
              }
              break;
            case 4:
              iVar6 = FUN_08010564(uVar13,0x3dcccccd);
              if (iVar6 != 0) {
                iVar6 = FUN_0801053c(iVar15,uVar7);
                if (iVar6 != 0) {
LAB_08022772:
                  uVar20 = 3;
                  param_1[0x2e] = 0;
                  goto LAB_08022414;
                }
                iVar6 = FUN_0801053c(uVar7,iVar15 + -0x80000000);
                if (iVar6 != 0) {
LAB_0802280c:
                  uVar20 = 2;
                  param_1[0x2e] = 0;
                  goto LAB_08022414;
                }
                param_1[0x2e] = 0;
                pcVar19 = "VENTING";
                goto LAB_08022454;
              }
              break;
            case 5:
              if ((cVar3 == '\x02') && (param_1[0xa1] != '\x01')) goto LAB_0802283a;
              iVar6 = FUN_0801053c(iVar15,uVar7);
              if (iVar6 != 0) goto LAB_08022772;
              iVar6 = FUN_0801053c(uVar7,iVar15 + -0x80000000);
              if (iVar6 != 0) goto LAB_0802280c;
              *puVar18 = 0;
              pcVar19 = "SAFETY";
LAB_08022454:
              uVar20 = 1;
              goto LAB_08022456;
            default:
              uVar12 = 0;
LAB_080226a8:
              *puVar18 = uVar12;
              goto LAB_080226aa;
            }
            goto LAB_080221f6;
          }
          cVar3 = param_1[0x65];
          cVar4 = param_1[0x75];
          if (uVar9 == 4) {
            if (param_1[100] == '\0') goto LAB_080221f6;
            uVar20 = 0;
            param_1[0x2e] = 0;
          }
          else {
LAB_080222e0:
            if (((cVar4 != '\0') || (cVar3 != '\0')) ||
               ((iVar6 = FUN_08010564(uVar5,0x3e99999a), iVar6 == 0 &&
                (iVar6 = FUN_0801053c(uVar5,0xbe99999a), iVar6 == 0)))) goto LAB_0802283e;
            param_1[0x2e] = 0;
            pcVar19 = "STEADY";
            if ((uVar9 == 1) || (pcVar19 = "UNKNOWN", 7 < uVar9)) {
              uVar20 = 4;
              goto LAB_08022456;
            }
            uVar20 = 4;
          }
        }
        else {
LAB_0802283a:
          uVar20 = 0;
          param_1[0x2e] = 0;
        }
      }
      else {
        param_1[0x2e] = 0;
LAB_0802222a:
        uVar20 = 6;
      }
LAB_08022414:
      pcVar19 = (char *)(&DAT_0802f9c8)[uVar9];
      goto LAB_08022456;
    }
    if ((2 < *(uint *)(param_1 + 0x8c)) || (2 < *(uint *)(param_1 + 0x90))) {
      *puVar18 = 0;
      if (uVar9 == 1) {
        pcVar19 = "STEADY";
      }
      else {
        if (uVar9 == 6) goto LAB_080226aa;
        if (uVar9 < 8) goto LAB_0802222a;
        pcVar19 = "UNKNOWN";
      }
      uVar20 = 6;
      goto LAB_08022456;
    }
    if (uVar9 != 6) {
      puVar18 = param_1 + 0x2e;
      if (uVar9 == 7) {
        if (*(int *)(param_1 + 0x94) == 0) {
          iVar6 = FUN_08010530(uVar13,0xbf800000);
          if (iVar6 == 0) {
            iVar6 = FUN_0801053c(uVar13,0);
            if (iVar6 != 0) goto LAB_0802283a;
            if (param_1[0x2c] != '\x02') {
              iVar6 = FUN_08010578(uVar13,0);
              if ((iVar6 == 0) || (iVar6 = FUN_08010550(uVar13,0x3dcccccd), iVar6 == 0)) {
                uVar13 = FUN_0802b814(uVar5,uVar13);
                iVar6 = FUN_0801053c(iVar15,uVar13);
                if (iVar6 == 0) {
                  iVar6 = FUN_08010564(iVar15 + -0x80000000,uVar13);
                  goto LAB_0802243e;
                }
                goto LAB_080225a0;
              }
              cVar3 = param_1[0x65];
              cVar4 = param_1[0x75];
              goto LAB_080222e0;
            }
            *puVar18 = 0;
          }
          else {
            *puVar18 = 0;
          }
LAB_08022272:
          uVar20 = 0;
          goto LAB_08022414;
        }
        goto LAB_080221f6;
      }
      iVar6 = FUN_08010530(uVar13,0xbf800000);
      if (iVar6 == 0) {
        iVar6 = FUN_0801053c(uVar13,0);
        if (iVar6 == 0) {
          cVar3 = param_1[0x2c];
          if ((cVar3 != '\x02') || (1 < uVar9)) goto LAB_0802234a;
          *puVar18 = 0;
        }
        else {
          *puVar18 = 0;
          uVar20 = 0;
          if (uVar9 == 1) goto LAB_08022834;
          if (uVar9 != 0) goto LAB_08022820;
        }
      }
      else {
LAB_0802283e:
        uVar20 = 0;
        param_1[0x2e] = 0;
        if (uVar9 == 1) {
LAB_08022834:
          pcVar19 = "STEADY";
          goto LAB_08022456;
        }
        if (uVar9 != 0) {
          pcVar19 = "UNKNOWN";
          if (uVar9 < 8) goto LAB_08022414;
          goto LAB_08022456;
        }
      }
      goto LAB_080226aa;
    }
LAB_080221f6:
    puVar18 = param_1 + 0x2e;
LAB_080221fc:
    *puVar18 = 0;
  }
  else {
    *puVar18 = 0;
LAB_0802286c:
    if (uVar9 == 1) {
      pcVar19 = "STEADY";
LAB_08022874:
      uVar20 = 5;
LAB_08022456:
      uVar13 = (&DAT_0802f9c8)[uVar20];
      iVar6 = FUN_0801053c(uVar5,0);
      pcStack_30 = "-";
      if (iVar6 == 0) {
        pcStack_30 = "";
      }
      uVar7 = FUN_08016f60(uVar5,100);
      uVar8 = FUN_08016f6e(uVar5,100);
      uVar14 = *(undefined4 *)(param_1 + 4);
      iVar6 = FUN_0801053c(uVar14,0);
      pcStack_34 = "-";
      if (iVar6 == 0) {
        pcStack_34 = "";
      }
      uVar10 = FUN_08016f60(uVar14,100);
      uVar14 = FUN_08016f6e(uVar14,100);
      FUN_08017634("[bag_task] bag %u: %s -> %s (P=%s%u.%02u SP=%s%u.%02u)",uVar12,pcVar19,uVar13,
                   pcStack_30,uVar7,uVar8,pcStack_34,uVar10,uVar14);
      param_1[2] = bVar2;
      param_1[1] = (char)uVar20;
      param_1[0xac] = 0;
      pcVar19 = param_1 + 0xa0;
      uVar16 = uVar9 - 2 & 0xff;
      if (uVar20 == 1) {
        FUN_08017006(param_1 + 0x30);
        *(undefined4 *)(param_1 + 0x48) = uVar5;
        *(undefined4 *)(param_1 + 0x4c) = 0;
        param_1[0x50] = 0;
        FUN_08017006(param_1 + 0x3c);
        param_1[0x98] = 1;
        *(undefined4 *)(param_1 + 0x9c) = uVar5;
        *(undefined4 *)(param_1 + 0x8c) = 0;
        *(undefined4 *)(param_1 + 0x90) = 0;
        if (1 < uVar16) goto LAB_0802292a;
        if (2 < (byte)param_1[0x2d]) {
          FUN_0801b8b4(param_1,"last move");
        }
LAB_0802253a:
        uVar13 = FUN_08011424();
        *(undefined4 *)(param_1 + 0x58) = uVar13;
        *(undefined4 *)(param_1 + 0x54) = uVar13;
        if (uVar20 != 5) goto LAB_08022932;
        *pcVar19 = '\x01';
        iVar6 = FUN_08010530(uVar5,0xbf800000);
        pbVar11 = param_1 + 0xa1;
        if (iVar6 == 0) {
          iVar6 = FUN_08010578(uVar5,0x41500000);
          if (iVar6 != 0) {
            *pbVar11 = 1;
          }
        }
        else {
          *pbVar11 = 2;
        }
        pcVar19 = "UNKNOWN";
        if (*pbVar11 < 5) {
          pcVar19 = *(char **)(&DAT_08032454 + (uint)*pbVar11 * 4);
        }
        FUN_08017634("[bag_task] bag %u: SAFETY reason: %s",*param_1,pcVar19);
      }
      else {
        uVar13 = FUN_08011424();
        *(undefined4 *)(param_1 + 0x34) = uVar13;
        *(undefined4 *)(param_1 + 0x30) = uVar13;
        if (uVar20 - 2 < 2) {
          param_1[0x98] = 0;
          if (param_1[0x2c] == '\x01') {
            param_1[0x2d] = param_1[0x2d] + '\x01';
          }
          if ((uVar16 < 2) && (2 < (byte)param_1[0x2d])) {
            FUN_0801b8b4(param_1,"last move");
            if (uVar20 != 3) goto LAB_0802253a;
          }
          else if (uVar20 != 3) goto LAB_0802292a;
          uVar13 = FUN_08011424();
          *(undefined4 *)(param_1 + 0xd8) = uVar13;
          *(undefined4 *)(param_1 + 0xc0) = uVar5;
          *(undefined4 *)(param_1 + 0xc4) = uVar13;
          uVar13 = FUN_0802b1cc(uVar5,0x40a00000);
          uVar13 = FUN_0802b598(uVar13,0x3fc00000);
          *(undefined4 *)(param_1 + 200) = uVar13;
          *(undefined4 *)(param_1 + 0xcc) = uVar5;
LAB_0802292a:
          uVar13 = FUN_08011424();
          *(undefined4 *)(param_1 + 0x58) = uVar13;
          *(undefined4 *)(param_1 + 0x54) = uVar13;
LAB_08022932:
          if (*pcVar19 != '\0') {
            pcVar19[0] = '\0';
            pcVar19[1] = '\0';
          }
          if (uVar20 == 6) {
            pbVar11 = param_1 + 0xa2;
            if (*(uint *)(param_1 + 0x8c) < 3) {
              if (2 < *(uint *)(param_1 + 0x90)) {
                *pbVar11 = 6;
              }
            }
            else {
              *pbVar11 = 5;
            }
            pcVar19 = "UNKNOWN";
            if (*pbVar11 < 7) {
              pcVar19 = (&PTR_DAT_080323c0)[*pbVar11];
            }
            FUN_08017634("[bag_task] bag %u: FAULT reason: %s (inflate_fail=%u deflate_fail=%u)",
                         *param_1,pcVar19,*(uint *)(param_1 + 0x8c),*(uint *)(param_1 + 0x90));
            FUN_08017006(param_1 + 0xb0);
            goto LAB_080226aa;
          }
        }
        else {
          if ((uVar16 < 2) && (2 < (byte)param_1[0x2d])) {
            FUN_0801b8b4(param_1,"last move");
          }
          if (uVar20 != 4) goto LAB_0802253a;
          *(undefined2 *)(param_1 + 100) = 0;
          if (param_1[0xdc] != '\0') {
            uVar7 = *(undefined4 *)(param_1 + 0x14);
            uVar12 = *param_1;
            uVar13 = FUN_08020a1c(uVar7,uVar12);
            iVar6 = FUN_0801e808(uVar7,uVar12);
            if ((iVar6 == 0) && (iVar6 = FUN_08010530(uVar13,0xbf800000), iVar6 == 0)) {
              uVar7 = FUN_0802959c(uVar13);
              iVar6 = FUN_08010550(uVar7,0x41500000);
              if (iVar6 == 0) goto LAB_08022a0a;
              iVar6 = FUN_0801053c(uVar13,0);
              if (iVar6 == 0) {
                iVar6 = FUN_08026f80(uVar13);
                iVar6 = iVar6 * 2000 + 8000;
              }
              else {
                iVar6 = 30000;
              }
            }
            else {
LAB_08022a0a:
              iVar6 = 28000;
            }
            *(int *)(param_1 + 0x60) = iVar6;
          }
          FUN_08017006(param_1 + 0x54);
          FUN_08017634("[bag_task] bag %u: starting %u ms vent",*param_1,
                       *(undefined4 *)(param_1 + 0x60));
          if (*pcVar19 != '\0') {
            pcVar19[0] = '\0';
            pcVar19[1] = '\0';
          }
        }
      }
      if (uVar9 == 6) {
        puVar18 = param_1 + 0xa2;
        goto LAB_080221fc;
      }
    }
    else if (uVar9 != 5) {
      if (uVar9 < 8) {
        uVar20 = 5;
        goto LAB_08022414;
      }
      pcVar19 = "UNKNOWN";
      goto LAB_08022874;
    }
  }
LAB_080226aa:
  if ((param_1[0xac] != '\0') ||
     ((uVar12 = param_1[1], param_2 == 0 && (iVar6 = FUN_0801b934(param_1,uVar12), iVar6 == 0))))
  goto LAB_08022ac8;
  iVar6 = *(int *)(param_1 + 0x10);
  if (iVar6 == 0) goto switchD_080226de_default;
  switch(uVar12) {
  case 0:
  case 6:
  case 7:
LAB_08022c40:
    FUN_08021864(iVar6 + 4);
    break;
  case 1:
    if (param_1[2] != '\x02') goto LAB_08022c40;
    FUN_08021804(iVar6 + 4,100);
    break;
  case 2:
    FUN_08021864(iVar6 + 0x54);
    iVar6 = *(int *)(param_1 + 0x10) + 4;
    goto LAB_08022ac0;
  case 3:
  case 4:
    FUN_08021864(iVar6 + 4);
    iVar6 = *(int *)(param_1 + 0x10) + 0x54;
LAB_08022ac0:
    FUN_08021fe4(iVar6);
    goto switchD_080226de_default;
  case 5:
    FUN_08021864(iVar6 + 4);
    iVar6 = *(int *)(param_1 + 0x10) + 0x54;
    if (param_1[0xa1] == '\x01') goto LAB_08022ac0;
    goto LAB_08022c38;
  default:
    goto switchD_080226de_default;
  }
  iVar6 = *(int *)(param_1 + 0x10) + 0x54;
LAB_08022c38:
  FUN_08021864(iVar6);
switchD_080226de_default:
  param_1[0xac] = '\x01';
LAB_08022ac8:
  if ((param_1[1] == '\x04') &&
     (uVar9 = FUN_080173ac(param_1 + 0x54), *(uint *)(param_1 + 0x60) <= uVar9)) {
    FUN_08017634("[bag_task] bag %u: vent complete after %u ms, transitioning to OFF",*param_1,uVar9
                );
    *(undefined2 *)(param_1 + 100) = 0x101;
    uVar13 = FUN_08011424();
    *(undefined4 *)(param_1 + 0x58) = uVar13;
    *(undefined4 *)(param_1 + 0x54) = uVar13;
    FUN_08017006(param_1 + 0x68);
    pbVar11 = param_1 + 0x74;
    FUN_08017634("[bag_task] bag %u: vent done, resting %u ms",*param_1,30000);
    bVar2 = *pbVar11;
    *pbVar11 = bVar2 + 1;
    if (2 < (byte)(bVar2 + 1)) {
      param_1[0x75] = '\x01';
      FUN_08017006(param_1 + 0x78);
      FUN_08017634("[bag_task] bag %u: %u consecutive vents, dormant for %u s",*param_1,*pbVar11,
                   0xe10);
    }
  }
  if ((param_1[0x65] != '\0') && (uVar9 = FUN_080173ac(param_1 + 0x68), 29999 < uVar9)) {
    param_1[0x65] = '\0';
    iVar6 = FUN_08010530(uVar5,0xbf800000);
    if ((iVar6 != 0) ||
       ((iVar6 = FUN_08010564(uVar5,0x3e99999a), iVar6 == 0 &&
        (iVar6 = FUN_0801053c(uVar5,0xbe99999a), iVar6 == 0)))) {
      if (param_1[0x74] != '\0') {
        FUN_08017634("[bag_task] bag %u: pressure in band after rest, resetting vent count",*param_1
                    );
      }
      param_1[0x74] = '\0';
    }
    FUN_08017634("[bag_task] bag %u: vent rest complete",*param_1);
  }
  if ((param_1[0x75] != '\0') && (uVar9 = FUN_080173ac(param_1 + 0x78), 3599999 < uVar9)) {
    *(undefined2 *)(param_1 + 0x74) = 0;
    FUN_08017634("[bag_task] bag %u: vent dormancy expired, resuming",*param_1);
  }
  if (((param_1[1] == '\x01') && (*(int *)(param_1 + 0x94) != 0)) &&
     (uVar9 = FUN_080173ac(param_1 + 0x30), 9999 < uVar9)) {
    FUN_08017634("[bag_task] bag %u: oscillation count reset (steady held >= %u ms)",*param_1,10000)
    ;
    *(int *)(param_1 + 0x94) = 0;
  }
  if (param_1[0x2c] == '\x01') {
    if (param_1[1] == '\x01') {
      iVar6 = FUN_0801b880(param_1);
      if ((iVar6 != 0) && (iVar6 = FUN_08010530(uVar5,0xbf800000), iVar6 == 0)) {
        FUN_0802b814(uVar5,*(undefined4 *)(param_1 + 4));
        uVar5 = FUN_0802959c();
        iVar6 = FUN_08010550(uVar5,*(undefined4 *)(param_1 + 0xc));
        if (iVar6 != 0) {
          FUN_0801b8b4(param_1,"arrived");
        }
      }
      if (param_1[0x2c] != '\x01') goto LAB_08022bfc;
    }
    if (param_1[1] == '\0') {
      uVar5 = *(undefined4 *)(param_1 + 4);
      iVar6 = FUN_0801053c(uVar5,0);
      pcVar19 = "disabled";
      if (iVar6 == 0) {
        iVar6 = FUN_08010578(uVar5,0);
        if ((iVar6 == 0) || (iVar6 = FUN_08010550(uVar5,0x3dcccccd), iVar6 == 0)) goto LAB_08022bfc;
        pcVar19 = "vented";
      }
      FUN_0801b8b4(param_1,pcVar19);
    }
  }
LAB_08022bfc:
  if (4 < (byte)param_1[1]) {
    if (2 < (byte)param_1[1] - 5) {
                    /* WARNING: Does not return */
      pcVar1 = (code *)software_udf(0xff,0x8022cb4);
      (*pcVar1)();
    }
    iVar6 = FUN_0801b934(param_1);
    if (iVar6 != 0) {
      FUN_0801b8b4(param_1,"stopped");
    }
  }
  return;
}


