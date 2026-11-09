/* Ghidra static pseudocode; not original source. Read-only project; no target execution. */

void FUN_00241980(undefined8 *param_1)

{
  char *pcVar1;
  undefined1 *puVar2;
  undefined8 uVar3;
  byte bVar4;
  ushort uVar5;
  uint uVar6;
  undefined *puVar7;
  code *pcVar8;
  char cVar9;
  undefined1 uVar10;
  int iVar11;
  int iVar12;
  undefined4 uVar13;
  undefined4 uVar14;
  undefined8 *puVar15;
  undefined8 uVar16;
  long lVar17;
  int *piVar18;
  long lVar19;
  undefined2 uVar20;
  long *plVar21;
  char *pcVar22;
  byte *pbVar23;
  undefined8 *puVar24;
  undefined8 *puVar25;
  uint uVar26;
  float fVar27;
  double dVar28;
  float fVar29;
  double dVar30;
  float fVar31;
  double dVar32;
  float fVar33;
  undefined8 local_130;
  undefined8 local_128;
  undefined8 uStack_120;
  undefined8 local_118;
  undefined1 auStack_108 [32];
  undefined1 auStack_e8 [32];
  undefined8 local_c8;
  undefined8 auStack_c0 [23];
  long local_8;
  
  uVar5 = *(ushort *)((long)param_1 + 0x3a);
  local_8 = *(long *)PTR___stack_chk_guard_005df758;
  if ((uVar5 & 1) == 0) {
    if (uVar5 == 0xc) {
      FUN_00198930(param_1 + 0x4d,PTR___stack_chk_guard_005df758,0);
      FUN_001988f0(param_1 + 0x4d);
      FUN_001988f0(param_1 + 0x4e);
      FUN_001f4b90(param_1 + 0x46);
      puVar15 = (undefined8 *)param_1[0x46];
      lVar19 = param_1[0x47];
      if (puVar15 == param_1 + 0x4c) goto LAB_00241bd8;
LAB_002421d8:
      operator_delete(puVar15,lVar19 << 3);
LAB_00241d58:
      param_1[0x86] = param_1 + 2;
      *param_1 = 0;
      lVar19 = param_1[4];
      *(undefined2 *)((long)param_1 + 0x3a) = 0x1a;
    }
    else {
      if (0xc < uVar5) {
        if (uVar5 == 0x14) {
          FUN_00198930(param_1 + 0x6a,PTR___stack_chk_guard_005df758,0);
          FUN_001988f0(param_1 + 0x6a);
          FUN_001988f0(param_1 + 0x6b);
        }
        else {
          if (uVar5 < 0x15) {
            if (uVar5 == 0x10) {
              FUN_00198930(param_1 + 0x5d,PTR___stack_chk_guard_005df758,0);
              FUN_001988f0(param_1 + 0x5d);
              FUN_001988f0(param_1 + 0x5e);
              FUN_001f4b90(param_1 + 0x56);
              puVar15 = (undefined8 *)param_1[0x56];
              lVar19 = param_1[0x57];
              if (puVar15 != param_1 + 0x5c) goto LAB_002421d8;
            }
            else {
              if (uVar5 == 0x12) {
                FUN_00198930(param_1 + 100,PTR___stack_chk_guard_005df758,0);
                FUN_001988f0(param_1 + 100);
                FUN_001988f0(param_1 + 0x65);
                goto LAB_00241d58;
              }
              if (uVar5 != 0xe) goto LAB_00241ae4;
              FUN_00198930(param_1 + 0x53,PTR___stack_chk_guard_005df758,0);
              FUN_001988f0(param_1 + 0x53);
              FUN_001988f0(param_1 + 0x54);
              if (*(char *)(param_1[9] + 0x24d8) != '\0') {
                uVar13 = FUN_00252b10();
                lVar19 = param_1[9];
                param_1[0x56] = 0;
                uVar16 = *(undefined8 *)(lVar19 + 0x24e8);
                *(undefined4 *)(param_1 + 0x55) = uVar13;
                param_1[0x57] = uVar16;
                uVar16 = *(undefined8 *)(lVar19 + 0x24f8);
                param_1[0x58] = 0;
                param_1[0x59] = uVar16;
                uVar16 = *(undefined8 *)(lVar19 + 0x2508);
                param_1[0x5a] = *(undefined8 *)(lVar19 + 0x2500);
                param_1[0x5b] = uVar16;
                param_1[0x5c] = 0;
                FUN_00240080(param_1 + 0x56,lVar19 + 0x24e0);
                FUN_001e1a50(param_1 + 0x5e,param_1 + 0x55);
                FUN_00240250(param_1 + 0x5d,param_1[3],param_1 + 0x5e);
                lVar19 = param_1[8];
                uVar20 = 0x10;
                lVar17 = param_1[0x5d];
                goto LAB_00241f04;
              }
            }
            goto LAB_00241bd8;
          }
          if (uVar5 == 0x18) {
            FUN_00198930(param_1 + 0x83,PTR___stack_chk_guard_005df758,0);
            FUN_001988f0(param_1 + 0x83);
            FUN_001988f0(param_1 + 0x84);
            lVar19 = param_1[9];
            puVar15 = param_1 + 0x71;
            cVar9 = FUN_002849f4(puVar15);
            pcVar22 = "true";
            if (cVar9 == '\0') {
              pcVar22 = "false";
            }
            snprintf((char *)(lVar19 + 0x2220),0x28,"%s",pcVar22);
            *(undefined4 *)(param_1 + 0x7e) = 0;
            cVar9 = FUN_00284a70(puVar15);
            if ((cVar9 == '\0') || (lVar19 = *(long *)(param_1[9] + 0x2218), lVar19 == 0)) {
              uVar13 = *(undefined4 *)(param_1 + 0x7e);
            }
            else {
              lVar17 = *(long *)(lVar19 + 0x10);
              *(undefined4 *)(param_1 + 0x85) = 60000;
              if (lVar17 == 0) {
                    /* WARNING: Subroutine does not return */
                std::__throw_bad_function_call();
              }
              iVar11 = (**(code **)(lVar19 + 0x18))(lVar19);
              puVar24 = &local_c8;
              uVar26 = 0;
              bVar4 = 0;
              local_130 = CONCAT44(local_130._4_4_,4);
              local_128 = 0;
              local_c8 = 0x200000004;
              piVar18 = (int *)FUN_002456c0(lVar19 + 0x60,&local_130);
              puVar25 = puVar24;
              while( true ) {
                if ((*piVar18 != 0) &&
                   (uVar6 = iVar11 - *piVar18, (bool)(uVar6 < uVar26 | bVar4 ^ 1))) {
                  bVar4 = 1;
                  uVar26 = uVar6;
                }
                puVar25 = (undefined8 *)((long)puVar25 + 4);
                if (puVar25 == auStack_c0) break;
                local_130 = CONCAT44(local_130._4_4_,*(undefined4 *)puVar25);
                piVar18 = (int *)FUN_002456c0(lVar19 + 0x60,&local_130);
              }
              local_128 = CONCAT44(CONCAT31(local_128._5_3_,bVar4),uVar26);
              uVar16 = local_128;
              uVar13 = FUN_00245750(*(undefined8 *)(param_1[9] + 0x2218),0);
              lVar19 = *(long *)(param_1[9] + 0x2218);
              if (*(long *)(lVar19 + 0x10) == 0) {
                    /* WARNING: Subroutine does not return */
                std::__throw_bad_function_call();
              }
              iVar11 = (**(code **)(lVar19 + 0x18))(lVar19);
              uVar26 = 0;
              bVar4 = 0;
              local_130 = 0;
              local_128 = CONCAT44(local_128._4_4_,5);
              local_c8 = 0x300000005;
              piVar18 = (int *)FUN_002456c0(lVar19 + 0x60,&local_128);
              while( true ) {
                if ((*piVar18 != 0) &&
                   (uVar6 = iVar11 - *piVar18, (bool)(uVar6 < uVar26 | bVar4 ^ 1))) {
                  bVar4 = 1;
                  uVar26 = uVar6;
                }
                puVar24 = (undefined8 *)((long)puVar24 + 4);
                if (auStack_c0 == puVar24) break;
                local_128 = CONCAT44(local_128._4_4_,*(undefined4 *)puVar24);
                piVar18 = (int *)FUN_002456c0(lVar19 + 0x60,&local_128);
              }
              local_130 = CONCAT44(CONCAT31(local_130._5_3_,bVar4),uVar26);
              local_128 = local_130;
              uVar14 = FUN_00245750(*(undefined8 *)(param_1[9] + 0x2218),1);
              uVar13 = FUN_00284af0(uVar16,uVar13,local_130,uVar14,*(undefined4 *)(param_1 + 0x72),
                                    *(undefined4 *)(param_1 + 0x85));
              *(undefined4 *)(param_1 + 0x7e) = uVar13;
            }
            puVar24 = param_1 + 0x7f;
            FUN_00285090(puVar24,puVar15,uVar13);
            snprintf((char *)(param_1[9] + 0x22c0),0x180,"%s",param_1[0x7f]);
            uVar16 = DAT_005e3b98;
            FUN_0023e8a0(auStack_108,"device_state");
            FUN_0023e8a0(auStack_e8,"frank.frozen.priming");
            FUN_00198030(&local_c8,puVar24);
            FUN_002463a0(uVar16,auStack_108,auStack_e8,&local_c8);
            FUN_001998f0(&local_c8);
            FUN_001998f0(auStack_e8);
            FUN_001998f0(auStack_108);
            FUN_001998f0(puVar24);
          }
          else {
            if (uVar5 == 0x1a) {
              std::__exception_ptr::exception_ptr::~exception_ptr((exception_ptr *)(param_1 + 5));
              cVar9 = *(char *)(param_1 + 7);
              goto joined_r0x00241b40;
            }
            if (uVar5 != 0x16) goto LAB_00241ae4;
            FUN_00198930(param_1 + 0x6f,PTR___stack_chk_guard_005df758,0);
            FUN_001988f0(param_1 + 0x6f);
            FUN_001988f0(param_1 + 0x70);
            lVar19 = param_1[9];
            uVar16 = FUN_00283fd0(param_1 + 0x6c);
            snprintf((char *)(lVar19 + 0x2270),0x28,"%s",uVar16);
            uVar16 = DAT_005e3b98;
            FUN_0023e8a0(auStack_e8,"device_state");
            FUN_0023e8a0(&local_c8,"frank.frozen.cap");
            FUN_00284010(auStack_108,param_1 + 0x6c);
            FUN_002463a0(uVar16,auStack_e8,&local_c8,auStack_108);
            FUN_001998f0(auStack_108);
            FUN_001998f0(&local_c8);
            FUN_001998f0(auStack_e8);
          }
        }
        goto LAB_00241d58;
      }
      if (uVar5 == 6) {
        FUN_00198930(param_1 + 0x2a,PTR___stack_chk_guard_005df758,0);
        FUN_001988f0(param_1 + 0x2a);
        FUN_001988f0(param_1 + 0x2b);
        if (*(byte *)(param_1 + 0x1a) < 2) {
          pcVar22 = "true";
          if (*(char *)((long)param_1 + 0xd1) == '\0') {
            pcVar22 = "false";
          }
          snprintf((char *)(param_1[9] + 0x2220),0x28,"%s",pcVar22);
          pcVar22 = "true";
          if (*(char *)((long)param_1 + 0xd2) == '\0') {
            pcVar22 = "false";
          }
          snprintf((char *)(param_1[9] + 0x2248),0x28,"%s",pcVar22);
          __snprintf_chk(param_1[9] + 0x2298,0x28,1,0x28,"%d",*(undefined4 *)(param_1 + 0x1b));
          pcVar22 = "full";
          if (*(char *)((long)param_1 + 0xd2) == '\0') {
            pcVar22 = "empty";
          }
          __snprintf_chk((long)param_1 + 0xec,0x60,1,0x60,"water %s, needs priming %u",pcVar22,
                         *(undefined4 *)(param_1 + 0x1b));
        }
        else {
          if ((*(char *)((long)param_1 + 0xe1) == '\0') || (*(char *)((long)param_1 + 0xe9) == '\0')
             ) {
            pcVar22 = "false";
            *(undefined1 *)(param_1 + 0x2c) = 0;
          }
          else {
            pcVar22 = "true";
            *(undefined1 *)(param_1 + 0x2c) = 1;
          }
          snprintf((char *)(param_1[9] + 0x2248),0x28,"%s",pcVar22);
          uVar10 = FUN_00287250((long)param_1 + 0xcc);
          *(undefined1 *)((long)param_1 + 0x161) = uVar10;
          __snprintf_chk(param_1[9] + 0x2298,0x28,1,0x28,"%d",uVar10);
          pcVar22 = "full";
          if (*(char *)((long)param_1 + 0xe1) == '\0') {
            pcVar22 = "empty";
          }
          pcVar1 = "full";
          if (*(char *)((long)param_1 + 0xe9) == '\0') {
            pcVar1 = "empty";
          }
          __snprintf_chk((long)param_1 + 0xec,0x60,1,0x60,"water L=%s R=%s, needs priming %u",
                         pcVar22,pcVar1,*(undefined1 *)((long)param_1 + 0x161));
        }
        pcVar22 = (char *)((long)param_1 + 0xec);
        lVar19 = param_1[9];
        iVar11 = FUN_0020de70(lVar19 + 0x2188);
        if (*(char *)(lVar19 + 0x220c) != '\0') {
          iVar12 = strncmp(pcVar22,(char *)(lVar19 + 0x21a8),0x5f);
          uVar26 = *(uint *)(lVar19 + 0x2180);
          if (iVar12 == 0) {
            uVar26 = *(uint *)(lVar19 + 0x2184);
          }
          if ((uint)(iVar11 - *(int *)(lVar19 + 0x2208)) < uVar26) goto LAB_00241bd8;
        }
        strncpy((char *)(lVar19 + 0x21a8),pcVar22,0x5f);
        *(int *)(lVar19 + 0x2208) = iVar11;
        puVar7 = PTR_DAT_005df810;
        *(undefined1 *)(lVar19 + 0x220c) = 1;
        FUN_001965f0(puVar7,0x1a7,"handleCommand",
                     "/usr/src/debug/frank/0.1-r0/git/firmware/src/subsystem/frozen.cpp",
                     "[frozen] -> FW: %s",pcVar22);
      }
      else {
        if (uVar5 < 7) {
          if (uVar5 == 2) {
            puVar15 = (undefined8 *)param_1[9];
            pcVar22 = (char *)param_1[10];
            *(undefined1 *)(param_1 + 0xb) = 1;
            cVar9 = *pcVar22;
            if (pcVar22[1] != '\0') {
              puVar2 = *(undefined1 **)(pcVar22 + 8);
              lVar19 = *(long *)(pcVar22 + 0x10);
              *(undefined1 *)((long)param_1 + 0x5a) = *puVar2;
              param_1[0xc] = puVar2 + 1;
              param_1[0xd] = lVar19 + -1;
              if (cVar9 == '\x01') {
                FUN_00240900(puVar15);
LAB_0024213c:
                puVar15 = (undefined8 *)param_1[9];
              }
              else if (cVar9 == '\x05') {
                if (*(int *)(puVar15 + 0x411) == 0) goto LAB_00241bd8;
                FUN_002407a4(puVar15,0);
                goto LAB_0024213c;
              }
              if (*(int *)(puVar15 + 0x411) == 1) {
                bVar4 = *(byte *)param_1[10];
                if (bVar4 == 0x12) {
                  uVar16 = puVar15[0x442];
                  if (*(char *)((long)param_1 + 0x5a) == '\0') {
                    FUN_00219f34(uVar16);
                  }
                  else {
LAB_00242b60:
                    FUN_0021a100(uVar16);
                  }
                }
                else if (bVar4 < 0x13) {
                  if (bVar4 == 2) {
                    (**(code **)*puVar15)(puVar15,PTR_DAT_005df610);
                  }
                  else if (bVar4 == 4) {
                    FUN_0023f640(puVar15);
                  }
                }
                else if (bVar4 == 0x13) {
                  if (*(char *)((long)param_1 + 0x5a) == '\0') {
                    uVar13 = FUN_0020de70(puVar15 + 0x413);
                    lVar19 = param_1[9];
                    *(undefined4 *)(puVar15 + 0x417) = uVar13;
                    uVar16 = *(undefined8 *)(lVar19 + 0x2210);
                    *(undefined4 *)(puVar15 + 0x412) = 40000;
                    *(undefined4 *)((long)puVar15 + 0x20bc) = 1;
                    FUN_00219f34(uVar16);
                  }
                  else {
                    if (*(char *)((long)param_1 + 0x5a) != '\x05') {
                      uVar16 = puVar15[0x442];
                      goto LAB_00242b60;
                    }
                    FUN_0045f6e0(param_1[0xc],param_1 + 0xe);
                    FUN_0021a050(*(undefined8 *)(param_1[9] + 0x2210),*(undefined4 *)(param_1 + 0xe)
                                );
                  }
                }
                else if (bVar4 == 0x14) {
                  if (*(char *)((long)param_1 + 0x5a) == '\0') {
                    FUN_0021a1d4(puVar15[0x442],1);
                  }
                  else {
                    FUN_0021a1d4(puVar15[0x442],0);
                  }
                }
              }
              else if (*(int *)(puVar15 + 0x411) == 2) {
                if (*(char *)param_1[10] == '@') {
                  *(uint *)((long)param_1 + 0x74) = (uint)(*(char *)param_1[0xc] != '\0');
                  *(uint *)(param_1 + 0xf) = (uint)(((char *)param_1[0xc])[1] != '\0');
                  uVar16 = FUN_001da8f0();
                  FUN_001dad00(uVar16,*(undefined4 *)((long)param_1 + 0x74),
                               *(undefined4 *)(param_1 + 0xf));
                }
                goto LAB_00241d58;
              }
              goto LAB_00241bd8;
            }
            if (cVar9 == '\a') {
              FUN_00281db0(&local_c8,pcVar22,"frozen",puVar15 + 0x429);
              puVar15 = (undefined8 *)param_1[9];
            }
            if (*(int *)(puVar15 + 0x411) == 2) {
              pbVar23 = (byte *)param_1[10];
              bVar4 = *pbVar23;
              if (bVar4 == 0x56) {
                *(undefined1 *)((long)param_1 + 0x27c) = 0;
                param_1[0x51] = 0;
                *(undefined4 *)(param_1 + 0x4f) = 0;
                uVar16 = *(undefined8 *)(pbVar23 + 8);
                uVar3 = *(undefined8 *)(pbVar23 + 0x10);
                param_1[0x50] = 0;
                *(undefined2 *)(param_1 + 0x52) = 0;
                cVar9 = FUN_00283c60(uVar16,uVar3,param_1 + 0x4f);
                if (cVar9 == '\0') {
                  FUN_001965f0(PTR_DAT_005df7b0,0x1c5,"handleCommand",
                               "/usr/src/debug/frank/0.1-r0/git/firmware/src/subsystem/frozen.cpp",
                               "[frozen] failed to decode cond packet (len %zu)",
                               *(undefined8 *)(param_1[10] + 0x10));
                  goto LAB_00241bd8;
                }
                FUN_001defe0(param_1 + 0x54,param_1 + 0x4f);
                FUN_00240250(param_1 + 0x53,param_1[3],param_1 + 0x54);
                uVar20 = 0xe;
                lVar19 = param_1[8];
                lVar17 = param_1[0x53];
LAB_00241f04:
                *(undefined2 *)((long)param_1 + 0x3a) = uVar20;
                plVar21 = *(long **)(lVar19 + 0x18);
                *(long **)(lVar17 + 8) = plVar21;
                *(long *)(lVar17 + 0x10) = lVar19 + 0x10;
                *(long *)(*plVar21 + 0x60) = lVar17;
                *(undefined8 *)(lVar19 + 0x18) = 0;
                goto LAB_00241a50;
              }
              if (bVar4 < 0x57) {
                if (bVar4 == 0x54) {
                  *(undefined1 *)(param_1 + 0x2d) = 0;
                  uVar16 = *(undefined8 *)(pbVar23 + 8);
                  uVar3 = *(undefined8 *)(pbVar23 + 0x10);
                  *(undefined4 *)((long)param_1 + 0x164) = 0;
                  *(undefined2 *)((long)param_1 + 0x16c) = 0;
                  param_1[0x2e] = 0;
                  *(undefined2 *)(param_1 + 0x2f) = 0;
                  *(undefined8 *)((long)param_1 + 0x17c) = 0;
                  FUN_00286ee0(uVar16,uVar3,(long)param_1 + 0x164);
                  FUN_001e0b80(param_1 + 0x32,(long)param_1 + 0x164);
                  FUN_00240250(param_1 + 0x31,param_1[3],param_1 + 0x32);
                  uVar20 = 8;
                  lVar19 = param_1[8];
                  lVar17 = param_1[0x31];
                  goto LAB_00241f04;
                }
                if (bVar4 == 0x55) {
                  puVar15 = param_1 + 0x33;
                  memset(puVar15,0,0x80);
                  cVar9 = FUN_00286440(*(undefined8 *)(pbVar23 + 8),*(undefined8 *)(pbVar23 + 0x10),
                                       puVar15);
                  if (cVar9 != '\0') {
                    FUN_001dee40(param_1 + 0x44,puVar15);
                    FUN_00240250(param_1 + 0x43,param_1[3],param_1 + 0x44);
                    uVar20 = 10;
                    lVar19 = param_1[8];
                    lVar17 = param_1[0x43];
                    goto LAB_00241f04;
                  }
                  FUN_001965f0(PTR_DAT_005df7b0,0x1b6,"handleCommand",
                               "/usr/src/debug/frank/0.1-r0/git/firmware/src/subsystem/frozen.cpp",
                               "[frozen] failed to decode health packet (len %zu)",
                               *(undefined8 *)(param_1[10] + 0x10));
                }
                else if (bVar4 == 0x41) {
                  uVar16 = *(undefined8 *)(pbVar23 + 8);
                  uVar3 = *(undefined8 *)(pbVar23 + 0x10);
                  *(undefined4 *)((long)param_1 + 0x7c) = 0;
                  param_1[0x10] = 0;
                  param_1[0x11] = 0;
                  *(undefined2 *)(param_1 + 0x12) = 0;
                  cVar9 = FUN_00286ca0(uVar16,uVar3,(long)param_1 + 0x7c);
                  if (cVar9 != '\0') {
                    FUN_001e09e4(param_1 + 0x15,(long)param_1 + 0x7c);
                    FUN_00240250(param_1 + 0x14,param_1[3],param_1 + 0x15);
                    uVar20 = 4;
                    lVar19 = param_1[8];
                    lVar17 = param_1[0x14];
                    goto LAB_00241f04;
                  }
                  FUN_001965f0(PTR_DAT_005df7b0,0x165,"handleCommand",
                               "/usr/src/debug/frank/0.1-r0/git/firmware/src/subsystem/frozen.cpp",
                               "[frozen] failed to decode temps packet (len %zu)",
                               *(undefined8 *)(param_1[10] + 0x10));
                }
                else {
                  if (bVar4 != 0x53) goto LAB_00241d58;
                  param_1[0x1a] = 1;
                  param_1[0x1b] = 0;
                  *(undefined2 *)(param_1 + 0x1c) = 0;
                  *(undefined8 *)((long)param_1 + 0xe4) = 0;
                  *(undefined4 *)((long)param_1 + 0xcc) = 0;
                  cVar9 = FUN_00286fb0(*(undefined8 *)(pbVar23 + 8),*(undefined8 *)(pbVar23 + 0x10),
                                       (long)param_1 + 0xcc);
                  if (cVar9 != '\0') {
                    FUN_001df800(param_1 + 0x2b,(long)param_1 + 0xcc);
                    FUN_00240250(param_1 + 0x2a,param_1[3],param_1 + 0x2b);
                    uVar20 = 6;
                    lVar19 = param_1[8];
                    lVar17 = param_1[0x2a];
                    goto LAB_00241f04;
                  }
                  FUN_001965f0(PTR_DAT_005df7b0,0x189,"handleCommand",
                               "/usr/src/debug/frank/0.1-r0/git/firmware/src/subsystem/frozen.cpp",
                               "[frozen] failed to decode water packet (len %zu)",
                               *(undefined8 *)(param_1[10] + 0x10));
                }
              }
              else if (bVar4 == 0x5b) {
                uVar16 = *(undefined8 *)(pbVar23 + 8);
                uVar3 = *(undefined8 *)(pbVar23 + 0x10);
                puVar15 = param_1 + 0x5f;
                param_1[99] = 0;
                *puVar15 = 0;
                param_1[0x60] = 0;
                param_1[0x61] = 0;
                param_1[0x62] = 0;
                cVar9 = FUN_002844a0(uVar16,uVar3,puVar15);
                if (cVar9 != '\0') {
                  FUN_001df180(param_1 + 0x65,puVar15);
                  FUN_00240250(param_1 + 100,param_1[3],param_1 + 0x65);
                  uVar20 = 0x12;
                  lVar19 = param_1[8];
                  lVar17 = param_1[100];
                  goto LAB_00241f04;
                }
                FUN_001965f0(PTR_DAT_005df7b0,0x1d3,"handleCommand",
                             "/usr/src/debug/frank/0.1-r0/git/firmware/src/subsystem/frozen.cpp",
                             "[frozen] failed to decode optical packet (len %zu)",
                             *(undefined8 *)(param_1[10] + 0x10));
              }
              else if (bVar4 < 0x5c) {
                if (bVar4 == 0x59) {
                  *(undefined2 *)((long)param_1 + 0x364) = 0;
                  uVar16 = *(undefined8 *)(pbVar23 + 8);
                  uVar3 = *(undefined8 *)(pbVar23 + 0x10);
                  *(undefined4 *)(param_1 + 0x6c) = 0;
                  *(undefined1 *)((long)param_1 + 0x366) = 0;
                  param_1[0x6d] = 0;
                  param_1[0x6e] = 0;
                  cVar9 = FUN_00283f14(uVar16,uVar3,param_1 + 0x6c);
                  if (cVar9 != '\0') {
                    FUN_001df4c0(param_1 + 0x70,param_1 + 0x6c);
                    FUN_00240250(param_1 + 0x6f,param_1[3],param_1 + 0x70);
                    uVar20 = 0x16;
                    lVar19 = param_1[8];
                    lVar17 = param_1[0x6f];
                    goto LAB_00241f04;
                  }
                  FUN_001965f0(PTR_DAT_005df7b0,0x1e7,"handleCommand",
                               "/usr/src/debug/frank/0.1-r0/git/firmware/src/subsystem/frozen.cpp",
                               "[frozen] failed to decode lid hall packet (len %zu)",
                               *(undefined8 *)(param_1[10] + 0x10));
                }
                else {
                  if (bVar4 != 0x5a) goto LAB_00241d58;
                  uVar16 = *(undefined8 *)(pbVar23 + 8);
                  uVar3 = *(undefined8 *)(pbVar23 + 0x10);
                  puVar15 = param_1 + 0x71;
                  param_1[0x7d] = 0;
                  *puVar15 = 0;
                  param_1[0x72] = 0;
                  param_1[0x73] = 0;
                  param_1[0x74] = 0;
                  param_1[0x75] = 0;
                  param_1[0x76] = 0;
                  param_1[0x77] = 0;
                  param_1[0x78] = 0;
                  param_1[0x79] = 0;
                  param_1[0x7a] = 0;
                  param_1[0x7b] = 0;
                  param_1[0x7c] = 0;
                  cVar9 = FUN_002846e0(uVar16,uVar3,puVar15);
                  if (cVar9 != '\0') {
                    FUN_001df660(param_1 + 0x84,puVar15);
                    FUN_00240250(param_1 + 0x83,param_1[3],param_1 + 0x84);
                    uVar20 = 0x18;
                    lVar19 = param_1[8];
                    lVar17 = param_1[0x83];
                    goto LAB_00241f04;
                  }
                  FUN_001965f0(PTR_DAT_005df7b0,0x1f9,"handleCommand",
                               "/usr/src/debug/frank/0.1-r0/git/firmware/src/subsystem/frozen.cpp",
                               "[frozen] failed to decode priming packet (len %zu)",
                               *(undefined8 *)(param_1[10] + 0x10));
                }
              }
              else {
                if (bVar4 != 0x5f) goto LAB_00241d58;
                *(undefined1 *)((long)param_1 + 0x334) = 0;
                uVar16 = *(undefined8 *)(pbVar23 + 8);
                uVar3 = *(undefined8 *)(pbVar23 + 0x10);
                *(undefined4 *)(param_1 + 0x66) = 0;
                *(undefined2 *)((long)param_1 + 0x336) = 0;
                param_1[0x67] = 0;
                param_1[0x68] = 0;
                *(undefined4 *)(param_1 + 0x69) = 0;
                cVar9 = FUN_00283db0(uVar16,uVar3,param_1 + 0x66);
                if (cVar9 != '\0') {
                  FUN_001df320(param_1 + 0x6b,param_1 + 0x66);
                  FUN_00240250(param_1 + 0x6a,param_1[3],param_1 + 0x6b);
                  uVar20 = 0x14;
                  lVar19 = param_1[8];
                  lVar17 = param_1[0x6a];
                  goto LAB_00241f04;
                }
                FUN_001965f0(PTR_DAT_005df7b0,0x1dd,"handleCommand",
                             "/usr/src/debug/frank/0.1-r0/git/firmware/src/subsystem/frozen.cpp",
                             "[frozen] failed to decode fault packet (len %zu)",
                             *(undefined8 *)(param_1[10] + 0x10));
              }
              goto LAB_00241bd8;
            }
          }
          else {
            if (uVar5 != 4) {
              if (uVar5 != 0) goto LAB_00241ae4;
              *(undefined2 *)((long)param_1 + 0x3a) = 2;
              *(undefined1 *)(param_1 + 0xb) = 0;
              param_1[8] = param_1;
              goto LAB_00241a50;
            }
            FUN_00198930(param_1 + 0x14,PTR___stack_chk_guard_005df758,0);
            FUN_001988f0(param_1 + 0x14);
            FUN_001988f0(param_1 + 0x15);
            fVar27 = (float)NEON_ucvtf((uint)*(ushort *)(param_1 + 0x10));
            fVar29 = (float)NEON_ucvtf((uint)*(ushort *)((long)param_1 + 0x82));
            fVar31 = (float)NEON_ucvtf((uint)*(ushort *)((long)param_1 + 0x84));
            fVar27 = fVar27 / 100.0;
            fVar29 = fVar29 / 100.0;
            lVar19 = *(long *)(param_1[9] + 0x2168);
            fVar31 = fVar31 / 100.0;
            lVar17 = *(long *)(param_1[9] + 0x2170);
            *(float *)((long)param_1 + 0x94) = fVar27;
            *(float *)(param_1 + 0x13) = fVar29;
            *(float *)((long)param_1 + 0x9c) = fVar31;
            if (lVar19 != lVar17) {
              do {
                local_128 = 0;
                uStack_120 = 0;
                local_118 = 0;
                cVar9 = FUN_002179d0("frozen-temps-event","",&local_128,lVar19,0);
                FUN_002152c0(&local_128);
                if (cVar9 != '\0') {
                  if (*(char *)(lVar19 + 0x58) != '\0') goto LAB_00241d00;
                  if (*(int *)(lVar19 + 0x54) != 0) {
                    iVar11 = FUN_0020de70(lVar19 + 0x30);
                    if ((uint)(iVar11 - *(int *)(lVar19 + 0x50)) < *(uint *)(lVar19 + 0x28))
                    goto LAB_00241d00;
                    *(undefined4 *)(lVar19 + 0x54) = 0;
                  }
                  uVar13 = *(undefined4 *)(lVar19 + 0x20);
                  uVar14 = FUN_0020de70(lVar19 + 0x30);
                  *(undefined4 *)(lVar19 + 0x50) = uVar14;
                  *(undefined4 *)(lVar19 + 0x28) = uVar13;
                  *(undefined4 *)(lVar19 + 0x54) = 1;
                  break;
                }
                lVar19 = lVar19 + 0x60;
              } while (lVar17 != lVar19);
              fVar27 = *(float *)((long)param_1 + 0x94);
              fVar29 = *(float *)(param_1 + 0x13);
              fVar31 = *(float *)((long)param_1 + 0x9c);
            }
            puVar7 = PTR_DAT_005df810;
            dVar28 = (double)fVar27;
            dVar30 = (double)fVar29;
            dVar32 = (double)fVar31;
            if (*(char *)((long)param_1 + 0x91) == '\0') {
              if (*(char *)(param_1 + 0x12) == '\0') {
                fVar27 = (float)NEON_ucvtf((uint)*(ushort *)((long)param_1 + 0x86));
                *(float *)(param_1 + 0x19) = fVar27 / 100.0;
                FUN_001965f0(dVar28,dVar30,dVar32,(double)(fVar27 / 100.0),puVar7,0x17c,
                             "handleCommand",
                             "/usr/src/debug/frank/0.1-r0/git/firmware/src/subsystem/frozen.cpp",
                             "[frozen] -> FW: temps L=%.2f R=%.2f amb=%.2f hs=%.2f");
              }
              else {
                fVar29 = (float)NEON_ucvtf((uint)*(ushort *)(param_1 + 0x11));
                fVar27 = (float)NEON_ucvtf((uint)*(ushort *)((long)param_1 + 0x8a));
                *(float *)(param_1 + 0x18) = fVar29 / 100.0;
                *(float *)((long)param_1 + 0xc4) = fVar27 / 100.0;
                FUN_001965f0(dVar28,dVar30,dVar32,(double)(fVar29 / 100.0),(double)(fVar27 / 100.0),
                             puVar7,0x179,"handleCommand",
                             "/usr/src/debug/frank/0.1-r0/git/firmware/src/subsystem/frozen.cpp",
                             "[frozen] -> FW: temps L=%.2f R=%.2f amb=%.2f lhs=%.2f rhs=%.2f");
              }
            }
            else {
              fVar27 = (float)NEON_ucvtf((uint)*(ushort *)(param_1 + 0x11));
              fVar33 = (float)NEON_ucvtf((uint)*(ushort *)((long)param_1 + 0x8a));
              fVar31 = (float)NEON_ucvtf((uint)*(ushort *)((long)param_1 + 0x8c));
              fVar29 = (float)NEON_ucvtf((uint)*(ushort *)((long)param_1 + 0x8e));
              *(float *)(param_1 + 0x16) = fVar27 / 100.0;
              *(float *)((long)param_1 + 0xb4) = fVar33 / 100.0;
              *(float *)(param_1 + 0x17) = fVar31 / 100.0;
              *(float *)((long)param_1 + 0xbc) = fVar29 / 100.0;
              FUN_001965f0(dVar28,dVar30,dVar32,(double)(fVar27 / 100.0),(double)(fVar33 / 100.0),
                           (double)(fVar31 / 100.0),(double)(fVar29 / 100.0),puVar7,0x175,
                           "handleCommand",
                           "/usr/src/debug/frank/0.1-r0/git/firmware/src/subsystem/frozen.cpp",
                           "[frozen] -> FW: temps L=%.2f R=%.2f amb=%.2f lhs=%.2f rhs=%.2f lwb=%.2f rwb=%.2f"
                          );
            }
LAB_00241d00:
            lVar19 = param_1[9];
            *(undefined4 *)(lVar19 + 8) = *(undefined4 *)((long)param_1 + 0x94);
            *(undefined4 *)(lVar19 + 0xc) = *(undefined4 *)(param_1 + 0x13);
            *(undefined1 *)(lVar19 + 0x20c9) = 1;
          }
          goto LAB_00241d58;
        }
        if (uVar5 == 8) {
          FUN_00198930(param_1 + 0x31,PTR___stack_chk_guard_005df758,0);
          FUN_001988f0(param_1 + 0x31);
          FUN_001988f0(param_1 + 0x32);
          goto LAB_00241d58;
        }
        if (uVar5 != 10) goto LAB_00241ae4;
        FUN_00198930(param_1 + 0x43,PTR___stack_chk_guard_005df758,0);
        FUN_001988f0(param_1 + 0x43);
        FUN_001988f0(param_1 + 0x44);
        if (*(char *)(param_1[9] + 0x24d8) != '\0') {
          uVar13 = FUN_00252b10();
          lVar19 = param_1[9];
          param_1[0x46] = 0;
          uVar16 = *(undefined8 *)(lVar19 + 0x24e8);
          *(undefined4 *)(param_1 + 0x45) = uVar13;
          param_1[0x47] = uVar16;
          uVar16 = *(undefined8 *)(lVar19 + 0x24f8);
          param_1[0x48] = 0;
          param_1[0x49] = uVar16;
          uVar16 = *(undefined8 *)(lVar19 + 0x2508);
          param_1[0x4a] = *(undefined8 *)(lVar19 + 0x2500);
          param_1[0x4b] = uVar16;
          param_1[0x4c] = 0;
          FUN_00240080(param_1 + 0x46,lVar19 + 0x24e0);
          FUN_001e1a50(param_1 + 0x4e,param_1 + 0x45);
          FUN_00240250(param_1 + 0x4d,param_1[3],param_1 + 0x4e);
          uVar20 = 0xc;
          lVar19 = param_1[8];
          lVar17 = param_1[0x4d];
          goto LAB_00241f04;
        }
      }
LAB_00241bd8:
      param_1[0x86] = param_1 + 2;
      *param_1 = 0;
      lVar19 = param_1[4];
      *(undefined2 *)((long)param_1 + 0x3a) = 0x1a;
    }
    if (lVar19 != 0) {
      *(undefined8 *)(lVar19 + 8) = param_1[3];
    }
    *(long *)(*(long *)param_1[3] + 0x60) = lVar19;
    param_1[3] = 0;
    param_1[4] = 0;
  }
  else {
    if (uVar5 == 0xf) {
      FUN_001988f0(param_1 + 0x53);
      FUN_001988f0(param_1 + 0x54);
    }
    else if (uVar5 < 0x10) {
      if (uVar5 == 9) {
        FUN_001988f0(param_1 + 0x31);
        FUN_001988f0(param_1 + 0x32);
      }
      else if (uVar5 < 10) {
        if (uVar5 == 5) {
          FUN_001988f0(param_1 + 0x14);
          FUN_001988f0(param_1 + 0x15);
        }
        else if (uVar5 < 6) {
          if ((uVar5 & 0xfffd) != 1) goto LAB_00241ae4;
        }
        else {
          if (uVar5 != 7) {
LAB_00241ae4:
                    /* WARNING: Does not return */
            pcVar8 = (code *)SoftwareBreakpoint(1000,0x241ae8);
            (*pcVar8)();
          }
          FUN_001988f0(param_1 + 0x2a);
          FUN_001988f0(param_1 + 0x2b);
        }
      }
      else if (uVar5 == 0xb) {
        FUN_001988f0(param_1 + 0x43);
        FUN_001988f0(param_1 + 0x44);
      }
      else {
        if (uVar5 != 0xd) goto LAB_00241ae4;
        FUN_001988f0(param_1 + 0x4d);
        FUN_001988f0(param_1 + 0x4e);
        FUN_001f4b90(param_1 + 0x46);
        puVar15 = (undefined8 *)param_1[0x46];
        lVar19 = param_1[0x47];
        if (puVar15 != param_1 + 0x4c) goto LAB_00241a18;
      }
    }
    else if (uVar5 == 0x15) {
      FUN_001988f0(param_1 + 0x6a);
      FUN_001988f0(param_1 + 0x6b);
    }
    else if (uVar5 < 0x16) {
      if (uVar5 == 0x11) {
        FUN_001988f0(param_1 + 0x5d);
        FUN_001988f0(param_1 + 0x5e);
        FUN_001f4b90(param_1 + 0x56);
        puVar15 = (undefined8 *)param_1[0x56];
        lVar19 = param_1[0x57];
        if (puVar15 != param_1 + 0x5c) {
LAB_00241a18:
          operator_delete(puVar15,lVar19 << 3);
        }
      }
      else {
        if (uVar5 != 0x13) goto LAB_00241ae4;
        FUN_001988f0(param_1 + 100);
        FUN_001988f0(param_1 + 0x65);
      }
    }
    else if (uVar5 == 0x19) {
      FUN_001988f0(param_1 + 0x83);
      FUN_001988f0(param_1 + 0x84);
    }
    else if (uVar5 != 0x1b) {
      if (uVar5 != 0x17) goto LAB_00241ae4;
      FUN_001988f0(param_1 + 0x6f);
      FUN_001988f0(param_1 + 0x70);
    }
    std::__exception_ptr::exception_ptr::~exception_ptr((exception_ptr *)(param_1 + 5));
    cVar9 = *(char *)(param_1 + 7);
joined_r0x00241b40:
    if (cVar9 != '\0') {
      pthread_getspecific(DAT_005e3b90);
      lVar19 = local_8 - *(long *)PTR___stack_chk_guard_005df758;
      if (lVar19 == 0) {
        free(param_1);
        return;
      }
      goto LAB_00242d78;
    }
  }
LAB_00241a50:
  lVar19 = local_8 - *(long *)PTR___stack_chk_guard_005df758;
  if (lVar19 == 0) {
    return;
  }
LAB_00242d78:
                    /* WARNING: Subroutine does not return */
  __stack_chk_fail(PTR___stack_chk_guard_005df758,lVar19,0);
}


