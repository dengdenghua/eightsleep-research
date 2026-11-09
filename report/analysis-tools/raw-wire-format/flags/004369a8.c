/* Reconstructed Ghidra pseudocode, not vendor source. */

void FUN_004369a8(undefined8 *param_1,long param_2,long param_3,char param_4,undefined8 param_5,
                 undefined8 param_6,ulong param_7,undefined8 param_8,ulong param_9)

{
  long *plVar1;
  ulong *puVar2;
  ulong __n;
  undefined8 uVar3;
  char cVar4;
  byte bVar5;
  byte bVar6;
  ushort uVar7;
  short sVar8;
  bool bVar9;
  int iVar10;
  int iVar11;
  ulong uVar12;
  int extraout_w1;
  int extraout_w1_00;
  int extraout_w1_01;
  int extraout_w1_02;
  ulong uVar13;
  undefined **ppuVar14;
  ulong extraout_x1;
  ulong extraout_x1_00;
  ulong extraout_x1_01;
  ulong extraout_x1_02;
  ulong extraout_x1_03;
  ulong extraout_x1_04;
  ulong extraout_x1_05;
  undefined **extraout_x1_06;
  int iVar15;
  undefined **ppuVar16;
  long lVar17;
  uint uVar18;
  ulong uVar19;
  uint uVar20;
  undefined4 uVar21;
  ulong uVar22;
  ulong uVar23;
  byte *pbVar24;
  uint uVar25;
  long lVar26;
  long lVar27;
  long lVar28;
  short sVar29;
  ulong uVar30;
  ulong uVar31;
  ulong *puVar32;
  uint uVar33;
  ulong uVar34;
  ulong uVar35;
  uint uVar36;
  ulong uVar37;
  ulong uVar38;
  undefined8 uVar39;
  undefined1 auVar40 [16];
  uint local_b0;
  ulong local_a8;
  long local_a0;
  undefined8 local_98;
  undefined4 uStack_90;
  undefined4 uStack_8c;
  undefined8 local_88;
  undefined8 local_80;
  undefined4 uStack_78;
  undefined4 uStack_74;
  undefined8 local_70;
  undefined4 local_64;
  
  puVar2 = (ulong *)(param_2 + 0x10000);
  cVar4 = *(char *)(param_2 + 0x100a9);
  *(undefined8 *)(param_2 + 0x10070) = 0;
  puVar32 = (ulong *)(param_2 + 0x10068);
  *puVar32 = 0;
  *(char *)(param_2 + 0x100a9) = param_4;
  if (((cVar4 == '\x04') && (param_4 != '\x04')) || (*(int *)(param_2 + 0x100a4) != 0)) {
    *param_1 = 0;
    *(undefined4 *)(param_2 + 0x100a4) = 0xfffffffe;
    *(undefined4 *)(param_1 + 1) = 0xfffffffe;
    param_1[2] = 0;
    return;
  }
  if ((*(int *)(param_2 + 0x10094) != 0) || ((*(byte *)(param_2 + 0x100ab) & 1) != 0)) {
    FUN_0043688c(&local_98,param_3,puVar32);
    uVar39 = CONCAT44(uStack_8c,uStack_90);
    goto LAB_00436a30;
  }
  if ((*(uint *)(param_2 + 0x10080) >> 0x13 & 1) == 0) {
    if ((*(uint *)(param_2 + 0x10080) & 0x24fff) == 0x4001) {
      local_a0 = *(long *)(param_3 + 0x18);
      if (local_a0 != 0) {
        uVar23 = *(ulong *)(param_2 + 0x10040);
        uVar38 = *(ulong *)(param_2 + 0x10048);
        uVar35 = 0;
        uVar22 = *(ulong *)(param_3 + 0x20);
        uVar34 = uVar38 & 0x7fff;
        while ((uVar37 = uVar22 - uVar35, uVar35 <= uVar22 && uVar37 != 0 ||
               ((uVar23 != 0 && (*(char *)(param_2 + 0x100a9) != '\0'))))) {
          uVar30 = 0x1000 - uVar23;
          if (uVar37 <= 0x1000 - uVar23) {
            uVar30 = uVar37;
          }
          if (uVar30 != 0) {
            uVar37 = uVar23 + uVar38;
            uVar12 = uVar30;
            uVar13 = uVar35;
            do {
              uVar37 = uVar37 & 0x7fff;
              uVar31 = uVar12;
              if (0x8000 - uVar37 <= uVar12) {
                uVar31 = 0x8000 - uVar37;
              }
              uVar35 = uVar31 + uVar13;
              if (CARRY8(uVar31,uVar13)) {
                FUN_00191920(uVar13,uVar35,&PTR_DAT_009d9ba8);
LAB_00437e84:
                FUN_00191914(uVar35,uVar22,&PTR_DAT_009d9ba8);
                uVar19 = extraout_x1;
LAB_00437e98:
                FUN_00191920(uVar13,uVar19,&PTR_DAT_009d9bc0);
                uVar19 = extraout_x1_00;
LAB_00437ea8:
                FUN_00191914(uVar19,uVar22,&PTR_DAT_009d9bc0);
                goto LAB_00437ebc;
              }
              if (uVar22 < uVar35) goto LAB_00437e84;
              memcpy((void *)(*(long *)(param_2 + 0x10018) + uVar37),(void *)(local_a0 + uVar13),
                     uVar31);
              if (uVar37 < 0x101) {
                __n = 0x101 - uVar37;
                if (uVar31 <= 0x101 - uVar37) {
                  __n = uVar31;
                }
                uVar19 = __n + uVar13;
                if (CARRY8(__n,uVar13)) goto LAB_00437e98;
                if (uVar19 <= uVar22) {
                  memcpy((void *)(*(long *)(param_2 + 0x10018) + uVar37 + 0x8000),
                         (void *)(local_a0 + uVar13),__n);
                  goto LAB_00436b0c;
                }
                goto LAB_00437ea8;
              }
LAB_00436b0c:
              uVar12 = uVar12 - uVar31;
              uVar37 = uVar31 + uVar37;
              uVar13 = uVar35;
            } while (uVar12 != 0);
          }
          uVar23 = uVar30 + uVar23;
          uVar37 = *(ulong *)(param_2 + 0x10050);
          if (0x8000 - uVar23 <= *(ulong *)(param_2 + 0x10050)) {
            uVar37 = 0x8000 - uVar23;
          }
          *(ulong *)(param_2 + 0x10050) = uVar37;
          uVar37 = uVar23;
          if ((uVar23 < 0x1000) && (*(char *)(param_2 + 0x100a9) == '\0')) break;
          while (3 < uVar37) {
            uVar20 = *(uint *)(*(long *)(param_2 + 0x10018) + uVar34);
            uVar33 = uVar20 & 0xfff ^ (uVar20 & 0xffffff) >> 0x11;
            uVar7 = *(ushort *)(*(long *)(param_2 + 0x10028) + (ulong)uVar33 * 2);
            *(short *)(*(long *)(param_2 + 0x10028) + (ulong)uVar33 * 2) = (short)uVar38;
            uVar33 = (uint)uVar38 - (uint)uVar7;
            if ((ulong)(ushort)uVar33 <= *(ulong *)(param_2 + 0x10050)) {
              lVar26 = *(long *)(param_2 + 0x10018);
              if ((uVar20 & 0xffffff) == (*(uint *)(lVar26 + ((ulong)uVar7 & 0x7fff)) & 0xffffff)) {
                iVar10 = (int)(uVar34 + 3);
                iVar11 = (int)((ulong)uVar7 & 0x7fff);
                uVar23 = *(ulong *)(lVar26 + (uVar34 + 3 & 0x7fff));
                uVar30 = *(ulong *)(lVar26 + ((ulong)(iVar11 + 3) & 0x7fff));
                if (uVar23 == uVar30) {
                  iVar10 = (int)(uVar34 + 0xb);
                  uVar23 = *(ulong *)(lVar26 + (uVar34 + 0xb & 0x7fff));
                  uVar30 = *(ulong *)(lVar26 + ((ulong)(iVar11 + 0xb) & 0x7fff));
                  if (uVar23 != uVar30) goto LAB_00437140;
                  iVar10 = (int)(uVar34 + 0x13);
                  uVar23 = *(ulong *)(lVar26 + (uVar34 + 0x13 & 0x7fff));
                  uVar30 = *(ulong *)(lVar26 + ((ulong)(iVar11 + 0x13) & 0x7fff));
                  if (uVar23 != uVar30) goto LAB_00437140;
                  iVar10 = (int)(uVar34 + 0x1b);
                  uVar23 = *(ulong *)(lVar26 + (uVar34 + 0x1b & 0x7fff));
                  uVar30 = *(ulong *)(lVar26 + ((ulong)(iVar11 + 0x1b) & 0x7fff));
                  if (uVar23 != uVar30) goto LAB_00437140;
                  iVar10 = (int)(uVar34 + 0x23);
                  uVar23 = *(ulong *)(lVar26 + (uVar34 + 0x23 & 0x7fff));
                  uVar30 = *(ulong *)(lVar26 + ((ulong)(iVar11 + 0x23) & 0x7fff));
                  if (uVar23 != uVar30) goto LAB_00437140;
                  iVar10 = (int)(uVar34 + 0x2b);
                  uVar23 = *(ulong *)(lVar26 + (uVar34 + 0x2b & 0x7fff));
                  uVar30 = *(ulong *)(lVar26 + ((ulong)(iVar11 + 0x2b) & 0x7fff));
                  if (uVar23 != uVar30) goto LAB_00437140;
                  iVar10 = (int)(uVar34 + 0x33);
                  uVar23 = *(ulong *)(lVar26 + (uVar34 + 0x33 & 0x7fff));
                  uVar30 = *(ulong *)(lVar26 + ((ulong)(iVar11 + 0x33) & 0x7fff));
                  if (uVar23 != uVar30) goto LAB_00437140;
                  iVar10 = (int)(uVar34 + 0x3b);
                  uVar23 = *(ulong *)(lVar26 + (uVar34 + 0x3b & 0x7fff));
                  uVar30 = *(ulong *)(lVar26 + ((ulong)(iVar11 + 0x3b) & 0x7fff));
                  if (uVar23 != uVar30) goto LAB_00437140;
                  iVar10 = (int)(uVar34 + 0x43);
                  uVar23 = *(ulong *)(lVar26 + (uVar34 + 0x43 & 0x7fff));
                  uVar30 = *(ulong *)(lVar26 + ((ulong)(iVar11 + 0x43) & 0x7fff));
                  if (uVar23 != uVar30) goto LAB_00437140;
                  iVar10 = (int)(uVar34 + 0x4b);
                  uVar23 = *(ulong *)(lVar26 + (uVar34 + 0x4b & 0x7fff));
                  uVar30 = *(ulong *)(lVar26 + ((ulong)(iVar11 + 0x4b) & 0x7fff));
                  if (uVar23 != uVar30) goto LAB_00437140;
                  iVar10 = (int)(uVar34 + 0x53);
                  uVar23 = *(ulong *)(lVar26 + (uVar34 + 0x53 & 0x7fff));
                  uVar30 = *(ulong *)(lVar26 + ((ulong)(iVar11 + 0x53) & 0x7fff));
                  if (uVar23 != uVar30) goto LAB_00437140;
                  iVar10 = (int)(uVar34 + 0x5b);
                  uVar23 = *(ulong *)(lVar26 + (uVar34 + 0x5b & 0x7fff));
                  uVar30 = *(ulong *)(lVar26 + ((ulong)(iVar11 + 0x5b) & 0x7fff));
                  if (uVar23 != uVar30) goto LAB_00437140;
                  iVar10 = (int)(uVar34 + 99);
                  uVar23 = *(ulong *)(lVar26 + (uVar34 + 99 & 0x7fff));
                  uVar30 = *(ulong *)(lVar26 + ((ulong)(iVar11 + 99) & 0x7fff));
                  if (uVar23 != uVar30) goto LAB_00437140;
                  iVar10 = (int)(uVar34 + 0x6b);
                  uVar23 = *(ulong *)(lVar26 + (uVar34 + 0x6b & 0x7fff));
                  uVar30 = *(ulong *)(lVar26 + ((ulong)(iVar11 + 0x6b) & 0x7fff));
                  if (uVar23 != uVar30) goto LAB_00437140;
                  iVar10 = (int)(uVar34 + 0x73);
                  uVar23 = *(ulong *)(lVar26 + (uVar34 + 0x73 & 0x7fff));
                  uVar30 = *(ulong *)(lVar26 + ((ulong)(iVar11 + 0x73) & 0x7fff));
                  if (uVar23 != uVar30) goto LAB_00437140;
                  iVar10 = (int)(uVar34 + 0x7b);
                  uVar23 = *(ulong *)(lVar26 + (uVar34 + 0x7b & 0x7fff));
                  uVar30 = *(ulong *)(lVar26 + ((ulong)(iVar11 + 0x7b) & 0x7fff));
                  if (uVar23 != uVar30) goto LAB_00437140;
                  iVar10 = (int)(uVar34 + 0x83);
                  uVar23 = *(ulong *)(lVar26 + (uVar34 + 0x83 & 0x7fff));
                  uVar30 = *(ulong *)(lVar26 + ((ulong)(iVar11 + 0x83) & 0x7fff));
                  if (uVar23 != uVar30) goto LAB_00437140;
                  iVar10 = (int)(uVar34 + 0x8b);
                  uVar23 = *(ulong *)(lVar26 + (uVar34 + 0x8b & 0x7fff));
                  uVar30 = *(ulong *)(lVar26 + ((ulong)(iVar11 + 0x8b) & 0x7fff));
                  if (uVar23 != uVar30) goto LAB_00437140;
                  iVar10 = (int)(uVar34 + 0x93);
                  uVar23 = *(ulong *)(lVar26 + (uVar34 + 0x93 & 0x7fff));
                  uVar30 = *(ulong *)(lVar26 + ((ulong)(iVar11 + 0x93) & 0x7fff));
                  if (uVar23 != uVar30) goto LAB_00437140;
                  iVar10 = (int)(uVar34 + 0x9b);
                  uVar23 = *(ulong *)(lVar26 + (uVar34 + 0x9b & 0x7fff));
                  uVar30 = *(ulong *)(lVar26 + ((ulong)(iVar11 + 0x9b) & 0x7fff));
                  if (uVar23 != uVar30) goto LAB_00437140;
                  iVar10 = (int)(uVar34 + 0xa3);
                  uVar23 = *(ulong *)(lVar26 + (uVar34 + 0xa3 & 0x7fff));
                  uVar30 = *(ulong *)(lVar26 + ((ulong)(iVar11 + 0xa3) & 0x7fff));
                  if (uVar23 != uVar30) goto LAB_00437140;
                  iVar10 = (int)(uVar34 + 0xab);
                  uVar23 = *(ulong *)(lVar26 + (uVar34 + 0xab & 0x7fff));
                  uVar30 = *(ulong *)(lVar26 + ((ulong)(iVar11 + 0xab) & 0x7fff));
                  if (uVar23 != uVar30) goto LAB_00437140;
                  iVar10 = (int)(uVar34 + 0xb3);
                  uVar23 = *(ulong *)(lVar26 + (uVar34 + 0xb3 & 0x7fff));
                  uVar30 = *(ulong *)(lVar26 + ((ulong)(iVar11 + 0xb3) & 0x7fff));
                  if (uVar23 != uVar30) goto LAB_00437140;
                  iVar10 = (int)(uVar34 + 0xbb);
                  uVar23 = *(ulong *)(lVar26 + (uVar34 + 0xbb & 0x7fff));
                  uVar30 = *(ulong *)(lVar26 + ((ulong)(iVar11 + 0xbb) & 0x7fff));
                  if (uVar23 != uVar30) goto LAB_00437140;
                  iVar10 = (int)(uVar34 + 0xc3);
                  uVar23 = *(ulong *)(lVar26 + (uVar34 + 0xc3 & 0x7fff));
                  uVar30 = *(ulong *)(lVar26 + ((ulong)(iVar11 + 0xc3) & 0x7fff));
                  if (uVar23 != uVar30) goto LAB_00437140;
                  iVar10 = (int)(uVar34 + 0xcb);
                  uVar23 = *(ulong *)(lVar26 + (uVar34 + 0xcb & 0x7fff));
                  uVar30 = *(ulong *)(lVar26 + ((ulong)(iVar11 + 0xcb) & 0x7fff));
                  if (uVar23 != uVar30) goto LAB_00437140;
                  iVar10 = (int)(uVar34 + 0xd3);
                  uVar23 = *(ulong *)(lVar26 + (uVar34 + 0xd3 & 0x7fff));
                  uVar30 = *(ulong *)(lVar26 + ((ulong)(iVar11 + 0xd3) & 0x7fff));
                  if (uVar23 != uVar30) goto LAB_00437140;
                  iVar10 = (int)(uVar34 + 0xdb);
                  uVar23 = *(ulong *)(lVar26 + (uVar34 + 0xdb & 0x7fff));
                  uVar30 = *(ulong *)(lVar26 + ((ulong)(iVar11 + 0xdb) & 0x7fff));
                  if (uVar23 != uVar30) goto LAB_00437140;
                  iVar10 = (int)(uVar34 + 0xe3);
                  uVar23 = *(ulong *)(lVar26 + (uVar34 + 0xe3 & 0x7fff));
                  uVar30 = *(ulong *)(lVar26 + ((ulong)(iVar11 + 0xe3) & 0x7fff));
                  if (uVar23 != uVar30) goto LAB_00437140;
                  iVar10 = (int)(uVar34 + 0xeb);
                  uVar23 = *(ulong *)(lVar26 + (uVar34 + 0xeb & 0x7fff));
                  uVar30 = *(ulong *)(lVar26 + ((ulong)(iVar11 + 0xeb) & 0x7fff));
                  if (uVar23 != uVar30) goto LAB_00437140;
                  iVar10 = (int)(uVar34 + 0xf3);
                  uVar23 = *(ulong *)(lVar26 + (uVar34 + 0xf3 & 0x7fff));
                  uVar30 = *(ulong *)(lVar26 + ((ulong)(iVar11 + 0xf3) & 0x7fff));
                  if (uVar23 != uVar30) goto LAB_00437140;
                  iVar10 = (int)(uVar34 + 0xfb);
                  uVar23 = *(ulong *)(lVar26 + (uVar34 + 0xfb & 0x7fff));
                  uVar30 = *(ulong *)(lVar26 + ((ulong)(iVar11 + 0xfb) & 0x7fff));
                  if (uVar23 != uVar30) goto LAB_00437140;
                  if ((uint)uVar7 == ((uint)uVar38 & 0xffff)) goto LAB_00437170;
                  uVar25 = 0x102;
                }
                else {
LAB_00437140:
                  uVar23 = ((uVar30 ^ uVar23) & 0xaaaaaaaaaaaaaaaa) >> 1 |
                           ((uVar30 ^ uVar23) & 0x5555555555555555) << 1;
                  uVar23 = (uVar23 & 0xcccccccccccccccc) >> 2 | (uVar23 & 0x3333333333333333) << 2;
                  uVar23 = (uVar23 & 0xf0f0f0f0f0f0f0f0) >> 4 | (uVar23 & 0xf0f0f0f0f0f0f0f) << 4;
                  uVar23 = (uVar23 & 0xff00ff00ff00ff00) >> 8 | (uVar23 & 0xff00ff00ff00ff) << 8;
                  uVar23 = (uVar23 & 0xffff0000ffff0000) >> 0x10 | (uVar23 & 0xffff0000ffff) << 0x10
                  ;
                  uVar25 = (iVar10 - (int)uVar34) +
                           ((uint)LZCOUNT(uVar23 >> 0x20 | uVar23 << 0x20) >> 3);
                  if ((uVar25 < 3) || ((0x1fff < (uVar33 & 0xffff) && (uVar25 == 3)))) {
LAB_00437170:
                    uVar23 = *puVar2;
                    uVar7 = *(ushort *)(param_2 + 0x10008);
                    *(char *)(param_2 + (uVar23 & 0xffff)) = (char)uVar20;
                    bVar5 = *(byte *)(param_2 + (ulong)uVar7);
                    *puVar2 = uVar23 + 1;
                    *(byte *)(param_2 + (ulong)uVar7) = bVar5 >> 1;
                    uVar23 = (ulong)(uVar20 & 0xff);
                    goto LAB_00437198;
                  }
                }
                uVar23 = *puVar2;
                uVar33 = uVar33 - 1;
                uVar20 = (uint)uVar37;
                if (uVar25 <= (uint)uVar37) {
                  uVar20 = uVar25;
                }
                uVar30 = (ulong)uVar20;
                uVar7 = *(ushort *)(param_2 + 0x10008);
                uVar12 = (ulong)(uVar33 >> 8 & 0xff);
                *(char *)(param_2 + (uVar23 & 0xffff)) = (char)(uVar20 - 3);
                *(char *)(param_2 + ((ulong)((int)uVar23 + 1) & 0xffff)) = (char)uVar33;
                *(char *)(param_2 + ((ulong)((int)uVar23 + 2) & 0xffff)) = (char)(uVar33 >> 8);
                bVar5 = *(byte *)(param_2 + (ulong)uVar7);
                *puVar2 = uVar23 + 3;
                *(byte *)(param_2 + (ulong)uVar7) = bVar5 >> 1 | 0x80;
                if ((uVar33 & 0xffff) < 0x200) {
                  pbVar24 = &DAT_00796c14 + (ushort)uVar33;
                }
                else {
                  if ((uVar33 >> 0xf & 1) != 0) goto LAB_00437f50;
                  pbVar24 = &DAT_00796b14 + uVar12;
                }
                lVar26 = *(long *)(param_2 + 0x10060) + (ulong)*pbVar24 * 2;
                *(short *)(lVar26 + 0x240) = *(short *)(lVar26 + 0x240) + 1;
                uVar23 = (ulong)(byte)(&DAT_00796914)[(ulong)(uVar20 - 3) & 0xff] & 0x1f | 0x100;
              }
              else {
                uVar23 = *puVar2;
                uVar7 = *(ushort *)(param_2 + 0x10008);
                *(char *)(param_2 + (uVar23 & 0xffff)) = (char)uVar20;
                bVar5 = *(byte *)(param_2 + (ulong)uVar7);
                *puVar2 = uVar23 + 1;
                *(byte *)(param_2 + (ulong)uVar7) = bVar5 >> 1;
                uVar23 = (ulong)uVar20 & 0xff;
LAB_00437198:
                uVar30 = 1;
              }
              *(short *)(*(long *)(param_2 + 0x10060) + uVar23 * 2) =
                   *(short *)(*(long *)(param_2 + 0x10060) + uVar23 * 2) + 1;
              iVar10 = *(int *)(param_2 + 0x10014) + -1;
              uVar23 = *puVar2;
              *(int *)(param_2 + 0x10014) = iVar10;
              if (iVar10 == 0) {
                *(ulong *)(param_2 + 0x10008) = uVar23;
                uVar23 = uVar23 + 1;
                *(undefined4 *)(param_2 + 0x10014) = 8;
                *puVar2 = uVar23;
              }
              uVar38 = uVar38 + uVar30;
              uVar37 = uVar37 - uVar30;
              uVar12 = *(long *)(param_2 + 0x10050) + uVar30;
              *(int *)(param_2 + 0x10010) = *(int *)(param_2 + 0x10010) + (int)uVar30;
              if (0x7fff < uVar12) {
                uVar12 = 0x8000;
              }
              uVar34 = (ulong)(uint)((int)uVar34 + (int)uVar30) & 0x7fff;
              *(ulong *)(param_2 + 0x10050) = uVar12;
              if (0xfff8 < uVar23) {
                *(ulong *)(param_2 + 0x10040) = uVar37;
                *(ulong *)(param_2 + 0x10048) = uVar38;
                iVar10 = FUN_00435ff8(param_2,param_3,0);
                if (iVar10 != 0) goto LAB_00437d20;
                iVar10 = extraout_w1_00;
                if (extraout_w1_00 != 0) goto LAB_00437d30;
                uVar37 = *(ulong *)(param_2 + 0x10040);
                uVar38 = *(ulong *)(param_2 + 0x10048);
              }
            }
          }
          uVar23 = 0;
          if (uVar37 != 0) {
            do {
              uVar23 = *puVar2;
              uVar7 = *(ushort *)(param_2 + 0x10008);
              bVar5 = *(byte *)(*(long *)(param_2 + 0x10018) + uVar34);
              *(byte *)(param_2 + (uVar23 & 0xffff)) = bVar5;
              *(byte *)(param_2 + (ulong)uVar7) = *(byte *)(param_2 + (ulong)uVar7) >> 1;
              *puVar2 = uVar23 + 1;
              iVar10 = *(int *)(param_2 + 0x10014) + -1;
              *(int *)(param_2 + 0x10010) = *(int *)(param_2 + 0x10010) + 1;
              *(int *)(param_2 + 0x10014) = iVar10;
              if (iVar10 == 0) {
                *(undefined4 *)(param_2 + 0x10014) = 8;
                *puVar2 = uVar23 + 2;
                *(ulong *)(param_2 + 0x10008) = uVar23 + 1;
              }
              uVar38 = uVar38 + 1;
              uVar37 = uVar37 - 1;
              *(short *)(*(long *)(param_2 + 0x10060) + (ulong)bVar5 * 2) =
                   *(short *)(*(long *)(param_2 + 0x10060) + (ulong)bVar5 * 2) + 1;
              lVar26 = 0x8000;
              if (*(long *)(param_2 + 0x10050) + 1U < 0x8000) {
                lVar26 = *(long *)(param_2 + 0x10050) + 1;
              }
              *(long *)(param_2 + 0x10050) = lVar26;
              if (0xfff8 < *puVar2) {
                *(ulong *)(param_2 + 0x10040) = uVar37;
                *(ulong *)(param_2 + 0x10048) = uVar38;
                iVar10 = FUN_00435ff8(param_2,param_3,0);
                if (iVar10 != 0) goto LAB_00437d20;
                iVar10 = extraout_w1;
                if (extraout_w1 != 0) goto LAB_00437d30;
                uVar37 = *(ulong *)(param_2 + 0x10040);
                uVar38 = *(ulong *)(param_2 + 0x10048);
              }
              uVar34 = (ulong)((int)uVar34 + 1) & 0x7fff;
            } while (uVar37 != 0);
            uVar23 = 0;
          }
        }
        *puVar32 = uVar35;
        *(ulong *)(param_2 + 0x10040) = uVar23;
        *(ulong *)(param_2 + 0x10048) = uVar38;
joined_r0x00437d14:
        if (local_a0 != 0) goto LAB_00437d5c;
      }
    }
    else {
      local_a0 = *(long *)(param_3 + 0x18);
      if (local_a0 != 0) {
        local_a8 = (ulong)*(byte *)(param_2 + 0x100a8);
        param_9 = *(ulong *)(param_3 + 0x20);
        uVar38 = *(ulong *)(param_2 + 0x10040);
        uVar35 = *(ulong *)(param_2 + 0x10048);
        param_7 = 0;
        plVar1 = (long *)(param_2 + 0x10018);
        local_b0 = *(uint *)(param_2 + 0x10088);
        uVar33 = *(uint *)(param_2 + 0x1008c);
        do {
          do {
            uVar23 = param_9 - param_7;
            if ((param_9 < param_7 || uVar23 == 0) &&
               ((uVar38 == 0 || (*(char *)(param_2 + 0x100a9) == '\0')))) {
LAB_00437cfc:
              *(ulong *)(param_2 + 0x10068) = param_7;
              *(ulong *)(param_2 + 0x10040) = uVar38;
              *(ulong *)(param_2 + 0x10048) = uVar35;
              *(char *)(param_2 + 0x100a8) = (char)local_a8;
              *(uint *)(param_2 + 0x10088) = local_b0;
              *(uint *)(param_2 + 0x1008c) = uVar33;
              goto joined_r0x00437d14;
            }
            uVar34 = 0x102 - uVar38;
            if (uVar23 <= 0x102 - uVar38) {
              uVar34 = uVar23;
            }
            if ((uVar34 == 0) || (*(long *)(param_2 + 0x10050) + uVar38 < 2)) {
              uVar23 = uVar34 + param_7;
              if (CARRY8(uVar34,param_7)) goto LAB_00437ed4;
              if (param_9 < uVar23) goto LAB_00437ef4;
              if (uVar34 != 0) {
                uVar23 = 0;
                iVar10 = (int)(uVar38 + uVar35);
                do {
                  uVar22 = (ulong)(uint)(iVar10 + (int)uVar23) & 0x7fff;
                  bVar5 = *(byte *)(local_a0 + param_7 + uVar23);
                  *(byte *)(*plVar1 + uVar22) = bVar5;
                  if (uVar22 < 0x101) {
                    *(byte *)(*plVar1 + uVar22 + 0x8000) = bVar5;
                    lVar26 = uVar38 + uVar23 + *(long *)(param_2 + 0x10050);
                  }
                  else {
                    lVar26 = uVar38 + uVar23 + *(long *)(param_2 + 0x10050);
                  }
                  if (2 < lVar26 + 1U) {
                    uVar37 = (uVar38 + uVar35 + uVar23) - 2;
                    uVar30 = uVar37 & 0x7fff;
                    uVar22 = (ulong)bVar5 ^
                             (ulong)*(byte *)(*(long *)(param_2 + 0x10018) +
                                             ((ulong)(uint)(iVar10 + 0x7fff + (int)uVar23) & 0x7fff)
                                             ) << 5 ^
                             ((ulong)*(byte *)(*(long *)(param_2 + 0x10018) + uVar30) & 0x1f) << 10;
                    *(undefined2 *)(*(long *)(param_2 + 0x10020) + uVar30 * 2) =
                         *(undefined2 *)(*(long *)(param_2 + 0x10028) + uVar22 * 2);
                    *(short *)(*(long *)(param_2 + 0x10028) + uVar22 * 2) = (short)uVar37;
                  }
                  uVar23 = uVar23 + 1;
                } while (uVar34 != uVar23);
                uVar38 = uVar38 + uVar23;
              }
            }
            else {
              uVar23 = uVar34 + param_7;
              if (CARRY8(uVar34,param_7)) goto LAB_00437ee4;
              if (param_9 < uVar23) goto LAB_00437f08;
              uVar23 = uVar38 + uVar35;
              uVar38 = uVar34 + uVar38;
              uVar22 = uVar23 - 2;
              uVar20 = (uint)*(byte *)(*plVar1 + ((ulong)((int)uVar23 - 1) & 0x7fff)) ^
                       (uint)*(byte *)(*plVar1 + (uVar22 & 0x7fff)) << 5;
              uVar37 = uVar34;
              pbVar24 = (byte *)(local_a0 + param_7);
              do {
                uVar23 = uVar23 & 0x7fff;
                bVar5 = *pbVar24;
                *(byte *)(*plVar1 + uVar23) = bVar5;
                if (uVar23 < 0x101) {
                  *(byte *)(*plVar1 + uVar23 + 0x8000) = bVar5;
                }
                uVar37 = uVar37 - 1;
                uVar23 = uVar23 + 1;
                uVar20 = (uVar20 & 0x3ff) << 5 ^ (uint)bVar5;
                *(undefined2 *)(*(long *)(param_2 + 0x10020) + (uVar22 & 0x7fff) * 2) =
                     *(undefined2 *)(*(long *)(param_2 + 0x10028) + (ulong)uVar20 * 2);
                *(short *)(*(long *)(param_2 + 0x10028) + (ulong)uVar20 * 2) = (short)uVar22;
                uVar22 = uVar22 + 1;
                pbVar24 = pbVar24 + 1;
              } while (uVar37 != 0);
            }
            param_7 = uVar34 + param_7;
            uVar23 = *(ulong *)(param_2 + 0x10050);
            if (0x8000 - uVar38 <= *(ulong *)(param_2 + 0x10050)) {
              uVar23 = 0x8000 - uVar38;
            }
            *(ulong *)(param_2 + 0x10050) = uVar23;
            if ((uVar38 < 0x102) && (*(char *)(param_2 + 0x100a9) == '\0')) goto LAB_00437cfc;
            uVar25 = *(uint *)(param_2 + 0x10080);
            uVar34 = uVar35 & 0x7fff;
            uVar20 = 2;
            if (uVar33 != 0) {
              uVar20 = uVar33;
            }
            iVar10 = (int)uVar35;
            if ((uVar25 >> 0x10 & 1) == 0) {
              uVar36 = (uint)uVar38;
              if (0x101 < uVar36) {
                uVar36 = 0x102;
              }
              uVar18 = uVar20;
              if (uVar20 < 2) {
                uVar18 = 1;
              }
              uVar22 = (ulong)uVar18;
              if (uVar18 < uVar36) {
                lVar26 = 0x18;
                if (0x1f < uVar20) {
                  lVar26 = 0x1c;
                }
                iVar11 = *(int *)((long)plVar1 + lVar26) + -1;
                if (iVar11 != 0) {
                  lVar26 = *plVar1;
                  lVar28 = lVar26 + -1;
                  sVar8 = *(short *)(lVar26 + uVar34);
                  sVar29 = *(short *)((long)(lVar26 + uVar34) + (uVar22 - 1));
                  lVar27 = *(long *)(param_2 + 0x10020);
                  uVar37 = uVar34;
                  if (*(byte *)(param_2 + 0x10058) != 0) {
                    uVar30 = 0;
LAB_004375f0:
                    uVar20 = (uint)uVar22;
                    uVar12 = uVar30;
                    if (uVar20 != 0) {
                      iVar15 = 1 - iVar11;
                      do {
                        uVar7 = *(ushort *)(lVar27 + uVar37 * 2);
                        if ((uVar7 == 0) ||
                           (uVar13 = (ulong)(iVar10 - (uint)uVar7) & 0xffff, uVar23 < uVar13))
                        break;
                        uVar37 = (ulong)uVar7 & 0x7fff;
                        if (CONCAT11(*(undefined1 *)(lVar26 + uVar37 + uVar22),
                                     *(undefined1 *)(lVar28 + uVar37 + uVar22)) == sVar29) {
LAB_004376a0:
                          if (uVar13 == 0) break;
                          if (*(short *)(lVar26 + uVar37) == sVar8) goto LAB_004376c0;
                        }
                        else {
                          uVar7 = *(ushort *)(lVar27 + uVar37 * 2);
                          if ((uVar7 == 0) ||
                             (uVar13 = (ulong)(iVar10 - (uint)uVar7) & 0xffff, uVar23 < uVar13))
                          break;
                          uVar37 = (ulong)uVar7 & 0x7fff;
                          if (CONCAT11(*(undefined1 *)(lVar26 + uVar37 + uVar22),
                                       *(undefined1 *)(lVar28 + uVar37 + uVar22)) == sVar29)
                          goto LAB_004376a0;
                          uVar7 = *(ushort *)(lVar27 + uVar37 * 2);
                          if ((uVar7 == 0) ||
                             (uVar13 = (ulong)(iVar10 - (uint)uVar7) & 0xffff, uVar23 < uVar13))
                          break;
                          uVar37 = (ulong)uVar7 & 0x7fff;
                          if (CONCAT11(*(undefined1 *)(lVar26 + uVar37 + uVar22),
                                       *(undefined1 *)(lVar28 + uVar37 + uVar22)) == sVar29)
                          goto LAB_004376a0;
                        }
                        iVar15 = iVar15 + 1;
                        if (iVar15 == 1) break;
                      } while( true );
                    }
                    goto LAB_00437890;
                  }
                  do {
                    uVar7 = *(ushort *)(lVar27 + uVar37 * 2);
                    uVar12 = (ulong)uVar7;
                    uVar20 = uVar18;
                    if (uVar7 == 0) goto LAB_00437890;
                    uVar12 = (ulong)(iVar10 - (uint)uVar7) & 0xffff;
                    if (uVar23 < uVar12) break;
                    uVar37 = (ulong)uVar7 & 0x7fff;
                    if (CONCAT11(*(undefined1 *)(lVar26 + uVar37 + uVar22),
                                 *(undefined1 *)(lVar28 + uVar37 + uVar22)) == sVar29) {
LAB_00437874:
                      if (uVar12 == 0) break;
                      uVar20 = uVar36;
                      if (*(short *)(lVar26 + uVar37) == sVar8) goto LAB_00437890;
                    }
                    else {
                      uVar7 = *(ushort *)(lVar27 + uVar37 * 2);
                      uVar12 = (ulong)uVar7;
                      if (uVar7 == 0) goto LAB_00437890;
                      uVar12 = (ulong)(iVar10 - (uint)uVar7) & 0xffff;
                      if (uVar23 < uVar12) break;
                      uVar37 = (ulong)uVar7 & 0x7fff;
                      if (CONCAT11(*(undefined1 *)(lVar26 + uVar37 + uVar22),
                                   *(undefined1 *)(lVar28 + uVar37 + uVar22)) == sVar29)
                      goto LAB_00437874;
                      uVar7 = *(ushort *)(lVar27 + uVar37 * 2);
                      uVar12 = (ulong)uVar7;
                      if (uVar7 == 0) goto LAB_00437890;
                      uVar12 = (ulong)(iVar10 - (uint)uVar7) & 0xffff;
                      if (uVar23 < uVar12) break;
                      uVar37 = (ulong)uVar7 & 0x7fff;
                      if (CONCAT11(*(undefined1 *)(lVar26 + uVar37 + uVar22),
                                   *(undefined1 *)(lVar28 + uVar37 + uVar22)) == sVar29)
                      goto LAB_00437874;
                    }
                    iVar11 = iVar11 + -1;
                  } while (iVar11 != 0);
                }
              }
              uVar12 = 0;
              uVar20 = uVar18;
            }
            else if (uVar23 == 0) {
              uVar12 = 0;
            }
            else {
              uVar23 = uVar38 + uVar34;
              auVar40._8_8_ = uVar23;
              auVar40._0_8_ = uVar34;
              if (CARRY8(uVar38,uVar34)) goto LAB_00437f1c;
              if (0x8102 < uVar23) goto LAB_00437f28;
              uVar23 = 0;
              uVar22 = uVar23;
              if (uVar38 != 0) {
                do {
                  uVar22 = uVar23;
                  if (*(char *)(*plVar1 + uVar34 + uVar23) !=
                      *(char *)(*plVar1 + ((ulong)(iVar10 - 1) & 0x7fff))) break;
                  uVar23 = uVar23 + 1;
                  uVar22 = uVar38;
                } while (uVar38 != uVar23);
              }
              uVar20 = (uint)uVar22;
              uVar12 = (ulong)(2 < uVar20);
              if (uVar20 < 3) {
                uVar20 = 0;
              }
            }
LAB_00437890:
            bVar9 = (uVar12 & 0xffffe000) != 0 && uVar20 == 3;
            if ((uVar25 & 0x20000) != 0) {
              bVar9 = uVar20 < 6;
            }
            if (uVar34 == uVar12) {
              bVar9 = true;
            }
            uVar36 = 0;
            if (!bVar9) {
              uVar36 = uVar20;
            }
            uVar18 = 0;
            if (!bVar9) {
              uVar18 = (uint)uVar12;
            }
            if (uVar33 == 0) {
              if (uVar18 == 0) {
                uVar23 = *puVar2;
                uVar7 = *(ushort *)(param_2 + 0x10008);
                iVar10 = *(int *)(param_2 + 0x10010);
                iVar11 = *(int *)(param_2 + 0x10014);
                bVar5 = *(byte *)(*plVar1 + uVar34);
                *(byte *)(param_2 + (uVar23 & 0xffff)) = bVar5;
                bVar6 = *(byte *)(param_2 + (ulong)uVar7);
                iVar11 = iVar11 + -1;
                *(int *)(param_2 + 0x10010) = iVar10 + 1;
                *(int *)(param_2 + 0x10014) = iVar11;
                *(byte *)(param_2 + (ulong)uVar7) = bVar6 >> 1;
                *puVar2 = uVar23 + 1;
                if (iVar11 == 0) {
                  *(undefined4 *)(param_2 + 0x10014) = 8;
                  *puVar2 = uVar23 + 2;
                  *(ulong *)(param_2 + 0x10008) = uVar23 + 1;
                }
                uVar33 = 0;
                *(short *)(*(long *)(param_2 + 0x10060) + (ulong)bVar5 * 2) =
                     *(short *)(*(long *)(param_2 + 0x10060) + (ulong)bVar5 * 2) + 1;
                uVar23 = 1;
              }
              else if ((((*(byte *)(param_2 + 0x100aa) & 1) == 0) && ((uVar25 >> 0x10 & 1) == 0)) &&
                      (uVar36 < 0x80)) {
                uVar23 = 1;
                local_a8 = (ulong)*(byte *)(*plVar1 + uVar34);
                uVar33 = uVar36;
                local_b0 = (uint)uVar12;
              }
              else {
                uVar23 = *puVar2;
                uVar33 = uVar18 - 1;
                uVar7 = *(ushort *)(param_2 + 0x10008);
                *(char *)(param_2 + (uVar23 & 0xffff)) = (char)(uVar36 - 3);
                *(char *)(param_2 + ((ulong)((int)uVar23 + 1) & 0xffff)) = (char)uVar33;
                *(char *)(param_2 + ((ulong)((int)uVar23 + 2) & 0xffff)) = (char)(uVar33 >> 8);
                iVar10 = *(int *)(param_2 + 0x10010);
                iVar11 = *(int *)(param_2 + 0x10014);
                *(byte *)(param_2 + (ulong)uVar7) = *(byte *)(param_2 + (ulong)uVar7) >> 1 | 0x80;
                iVar11 = iVar11 + -1;
                *puVar2 = uVar23 + 3;
                *(uint *)(param_2 + 0x10010) = iVar10 + uVar36;
                *(int *)(param_2 + 0x10014) = iVar11;
                if (iVar11 == 0) {
                  *(undefined4 *)(param_2 + 0x10014) = 8;
                  *puVar2 = uVar23 + 4;
                  *(ulong *)(param_2 + 0x10008) = uVar23 + 3;
                }
                pbVar24 = &DAT_00796c14 + uVar33;
                if (0x200 < uVar18) {
                  pbVar24 = &DAT_00796b14 + (uVar33 >> 8 & 0x7f);
                }
                lVar26 = *(long *)(param_2 + 0x10060) + (ulong)*pbVar24 * 2;
                lVar27 = *(long *)(param_2 + 0x10060) +
                         ((ulong)(byte)(&DAT_00796914)[(ulong)(uVar36 - 3) & 0xff] & 0x1f) * 2;
                sVar8 = *(short *)(lVar27 + 0x200);
                *(short *)(lVar26 + 0x240) = *(short *)(lVar26 + 0x240) + 1;
                uVar23 = (ulong)uVar36;
                *(short *)(lVar27 + 0x200) = sVar8 + 1;
                uVar33 = 0;
              }
            }
            else {
              lVar26 = *(long *)(param_2 + 0x10060);
              if (uVar33 < uVar36) {
                uVar23 = *puVar2;
                uVar7 = *(ushort *)(param_2 + 0x10008);
                iVar10 = *(int *)(param_2 + 0x10010);
                iVar11 = *(int *)(param_2 + 0x10014);
                *(char *)(param_2 + (uVar23 & 0xffff)) = (char)local_a8;
                bVar5 = *(byte *)(param_2 + (ulong)uVar7);
                *puVar2 = uVar23 + 1;
                *(byte *)(param_2 + (ulong)uVar7) = bVar5 >> 1;
                iVar11 = iVar11 + -1;
                *(int *)(param_2 + 0x10010) = iVar10 + 1;
                *(int *)(param_2 + 0x10014) = iVar11;
                if (iVar11 == 0) {
                  *(undefined4 *)(param_2 + 0x10014) = 8;
                  *puVar2 = uVar23 + 2;
                  *(ulong *)(param_2 + 0x10008) = uVar23 + 1;
                }
                *(short *)(lVar26 + local_a8 * 2) = *(short *)(lVar26 + local_a8 * 2) + 1;
                if (uVar36 < 0x80) {
                  local_a8 = (ulong)*(byte *)(*plVar1 + uVar34);
                  uVar23 = 1;
                  uVar33 = uVar20;
                  local_b0 = uVar18;
                }
                else {
                  uVar23 = *puVar2;
                  uVar18 = uVar18 - 1;
                  uVar7 = *(ushort *)(param_2 + 0x10008);
                  *(char *)(param_2 + (uVar23 & 0xffff)) = (char)(uVar36 - 3);
                  *(char *)(param_2 + ((ulong)((int)uVar23 + 1) & 0xffff)) = (char)uVar18;
                  *(char *)(param_2 + ((ulong)((int)uVar23 + 2) & 0xffff)) = (char)(uVar18 >> 8);
                  *(byte *)(param_2 + (ulong)uVar7) = *(byte *)(param_2 + (ulong)uVar7) >> 1 | 0x80;
                  *puVar2 = uVar23 + 3;
                  iVar10 = *(int *)(param_2 + 0x10014) + -1;
                  *(uint *)(param_2 + 0x10010) = *(int *)(param_2 + 0x10010) + uVar36;
                  *(int *)(param_2 + 0x10014) = iVar10;
                  if (iVar10 == 0) {
                    *(undefined4 *)(param_2 + 0x10014) = 8;
                    *puVar2 = uVar23 + 4;
                    *(ulong *)(param_2 + 0x10008) = uVar23 + 3;
                  }
                  pbVar24 = &DAT_00796c14 + uVar18;
                  if (0x1ff < uVar18) {
                    pbVar24 = &DAT_00796b14 + (uVar18 >> 8 & 0x7f);
                  }
                  lVar26 = *(long *)(param_2 + 0x10060) + (ulong)*pbVar24 * 2;
                  lVar27 = *(long *)(param_2 + 0x10060) +
                           ((ulong)(byte)(&DAT_00796914)[(ulong)(uVar36 - 3) & 0xff] & 0x1f) * 2;
                  sVar8 = *(short *)(lVar27 + 0x200);
                  *(short *)(lVar26 + 0x240) = *(short *)(lVar26 + 0x240) + 1;
                  *(short *)(lVar27 + 0x200) = sVar8 + 1;
                  uVar23 = (ulong)uVar20;
                  uVar33 = 0;
                }
              }
              else {
                uVar23 = *puVar2;
                uVar7 = *(ushort *)(param_2 + 0x10008);
                uVar20 = local_b0 - 1;
                *(char *)(param_2 + (uVar23 & 0xffff)) = (char)(uVar33 - 3);
                *(char *)(param_2 + ((ulong)((int)uVar23 + 1) & 0xffff)) = (char)uVar20;
                *(char *)(param_2 + ((ulong)((int)uVar23 + 2) & 0xffff)) = (char)(uVar20 >> 8);
                *(byte *)(param_2 + (ulong)uVar7) = *(byte *)(param_2 + (ulong)uVar7) >> 1 | 0x80;
                *puVar2 = uVar23 + 3;
                iVar10 = *(int *)(param_2 + 0x10014) + -1;
                *(uint *)(param_2 + 0x10010) = *(int *)(param_2 + 0x10010) + uVar33;
                *(int *)(param_2 + 0x10014) = iVar10;
                if (iVar10 == 0) {
                  *(undefined4 *)(param_2 + 0x10014) = 8;
                  *puVar2 = uVar23 + 4;
                  *(ulong *)(param_2 + 0x10008) = uVar23 + 3;
                }
                pbVar24 = &DAT_00796c14 + uVar20;
                if (0x1ff < uVar20) {
                  pbVar24 = &DAT_00796b14 + (uVar20 >> 8 & 0x7f);
                }
                lVar27 = lVar26 + (ulong)*pbVar24 * 2;
                lVar26 = lVar26 + ((ulong)(byte)(&DAT_00796914)[(ulong)(uVar33 - 3) & 0xff] & 0x1f)
                                  * 2;
                sVar8 = *(short *)(lVar26 + 0x200);
                *(short *)(lVar27 + 0x240) = *(short *)(lVar27 + 0x240) + 1;
                uVar23 = (ulong)(uVar33 - 1);
                *(short *)(lVar26 + 0x200) = sVar8 + 1;
                uVar33 = 0;
              }
            }
            bVar9 = uVar38 < uVar23;
            uVar38 = uVar38 - uVar23;
            if (bVar9) goto LAB_00437ebc;
            uVar35 = uVar35 + uVar23;
            uVar23 = *(long *)(param_2 + 0x10050) + uVar23;
            if (0x7fff < uVar23) {
              uVar23 = 0x8000;
            }
            *(ulong *)(param_2 + 0x10050) = uVar23;
          } while ((*puVar2 < 0xfff9) &&
                  ((ulong)*(uint *)(param_2 + 0x10010) < 0x7c01 ||
                   *puVar2 * 0x73 >> 7 < (ulong)*(uint *)(param_2 + 0x10010)));
          *(ulong *)(param_2 + 0x10068) = param_7;
          *(ulong *)(param_2 + 0x10040) = uVar38;
          *(ulong *)(param_2 + 0x10048) = uVar35;
          iVar11 = FUN_00435ff8(param_2,param_3,0);
          iVar10 = extraout_w1_01;
          if (iVar11 != 0) {
            iVar10 = -1;
          }
        } while (iVar10 == 0);
        *(char *)(param_2 + 0x100a8) = (char)local_a8;
        *(uint *)(param_2 + 0x10088) = local_b0;
        *(uint *)(param_2 + 0x1008c) = uVar33;
LAB_00437d50:
        if (iVar10 < 1) goto LAB_00437e40;
        goto joined_r0x00437d14;
      }
    }
LAB_00437d18:
    ppuVar14 = (undefined **)0x0;
LAB_00437da0:
    if ((((*(char *)(param_2 + 0x100a9) != '\0') &&
         (ppuVar14 == *(undefined ***)(param_2 + 0x10068))) && (*(int *)(param_2 + 0x10094) == 0))
       && (*(long *)(param_2 + 0x10040) == 0)) {
      iVar10 = FUN_00435ff8(param_2,param_3);
      if (iVar10 != 0) {
        uVar21 = 0xffffffff;
        *(undefined4 *)(param_2 + 0x100a4) = 0xffffffff;
        goto LAB_00437e44;
      }
      if (extraout_w1_02 < 0) goto LAB_00437e40;
      *(bool *)(param_2 + 0x100ab) = *(char *)(param_2 + 0x100a9) == '\x04';
      if (*(char *)(param_2 + 0x100a9) == '\x03') {
        memset(*(void **)(param_2 + 0x10028),0,0x10000);
        memset(*(void **)(param_2 + 0x10020),0,0x10000);
        *(undefined8 *)(param_2 + 0x10050) = 0;
      }
    }
    FUN_0043688c(&local_80,param_3,puVar32);
    uVar39 = CONCAT44(uStack_74,uStack_78);
    local_88 = local_70;
    local_98 = local_80;
    uStack_90 = uStack_78;
LAB_00436a30:
    *(undefined4 *)(param_2 + 0x100a4) = uStack_90;
    param_1[1] = uVar39;
    *param_1 = local_98;
    param_1[2] = local_88;
    return;
  }
  iVar10 = FUN_00438060(param_2,param_3);
  if (iVar10 != 0) {
    local_a0 = *(long *)(param_3 + 0x18);
    if (local_a0 == 0) goto LAB_00437d18;
LAB_00437d5c:
    ppuVar14 = *(undefined ***)(param_3 + 0x20);
    if ((*(byte *)(param_2 + 0x10081) & 0x30) != 0) {
      ppuVar16 = (undefined **)*puVar32;
      if (ppuVar14 < ppuVar16) {
LAB_00437f3c:
        uVar12 = FUN_00191914(ppuVar16,ppuVar14,&PTR_DAT_009d9c08);
LAB_00437f50:
                    /* WARNING: Subroutine does not return */
        FUN_001916b4(uVar12,0x80,&PTR_DAT_009d9b90);
      }
      local_64 = *(undefined4 *)(param_2 + 0x10098);
      FUN_004385d8(&local_64,local_a0);
      lVar26 = *(long *)(param_3 + 0x18);
      ppuVar16 = *(undefined ***)(param_3 + 0x20);
      *(undefined4 *)(param_2 + 0x10098) = local_64;
      ppuVar14 = (undefined **)0x0;
      if (lVar26 != 0) {
        ppuVar14 = ppuVar16;
      }
    }
    goto LAB_00437da0;
  }
LAB_00437e40:
  uVar21 = *(undefined4 *)(param_2 + 0x100a4);
LAB_00437e44:
  uVar39 = *(undefined8 *)(param_2 + 0x10068);
  uVar3 = *(undefined8 *)(param_2 + 0x10070);
  *(undefined4 *)(param_1 + 1) = uVar21;
  *param_1 = uVar39;
  param_1[2] = uVar3;
  return;
LAB_004376c0:
  lVar17 = 2;
  uVar18 = (uint)*(byte *)(param_2 + 0x10058);
  while( true ) {
    iVar11 = (int)lVar17;
    uVar19 = *(ulong *)(lVar26 + ((ulong)(uint)((int)uVar34 + iVar11) & 0x7fff));
    uVar31 = *(ulong *)(lVar26 + ((ulong)(uint)((int)uVar37 + iVar11) & 0x7fff));
    uVar12 = uVar13;
    if (uVar19 != uVar31) break;
    uVar18 = uVar18 - 1;
    lVar17 = lVar17 + 8;
    uVar20 = uVar36;
    if (uVar18 == 0) goto LAB_00437890;
  }
  uVar31 = uVar31 ^ uVar19;
  uVar31 = (uVar31 & 0xaaaaaaaaaaaaaaaa) >> 1 | (uVar31 & 0x5555555555555555) << 1;
  uVar31 = (uVar31 & 0xcccccccccccccccc) >> 2 | (uVar31 & 0x3333333333333333) << 2;
  uVar31 = (uVar31 & 0xf0f0f0f0f0f0f0f0) >> 4 | (uVar31 & 0xf0f0f0f0f0f0f0f) << 4;
  uVar31 = (uVar31 & 0xff00ff00ff00ff00) >> 8 | (uVar31 & 0xff00ff00ff00ff) << 8;
  uVar31 = (uVar31 & 0xffff0000ffff0000) >> 0x10 | (uVar31 & 0xffff0000ffff) << 0x10;
  uVar31 = (ulong)LZCOUNT(uVar31 >> 0x20 | uVar31 << 0x20) >> 3;
  if (uVar22 < uVar31 + lVar17) {
    uVar18 = (int)uVar31 + iVar11;
    uVar20 = uVar18;
    if (uVar36 <= uVar18) {
      uVar20 = uVar36;
    }
    uVar22 = (ulong)uVar20;
    if (uVar36 <= uVar18) goto LAB_00437890;
    lVar17 = 0;
    if (uVar34 + uVar22 != 0) {
      lVar17 = uVar34 + uVar22 + -1;
    }
    sVar29 = *(short *)(lVar26 + lVar17);
    uVar30 = uVar13;
  }
  iVar11 = -iVar15;
  uVar12 = uVar30;
  uVar20 = (uint)uVar22;
  if (iVar15 == 0) goto LAB_00437890;
  goto LAB_004375f0;
LAB_00437ebc:
  FUN_001915c0("assertion failed: lookahead_size >= len_to_move",0x2f,&PTR_DAT_009d9b78);
  uVar23 = extraout_x1_01;
LAB_00437ed4:
  FUN_00191920(param_7,uVar23,&PTR_DAT_009d9b30);
  uVar23 = extraout_x1_02;
LAB_00437ee4:
  FUN_00191920(param_7,uVar23,&PTR_DAT_009d9b48);
  uVar23 = extraout_x1_03;
LAB_00437ef4:
  FUN_00191914(uVar23,param_9,&PTR_DAT_009d9b30);
  uVar23 = extraout_x1_04;
LAB_00437f08:
  auVar40 = FUN_00191914(uVar23,param_9,&PTR_DAT_009d9b48);
LAB_00437f1c:
  FUN_00191920(auVar40._0_8_,auVar40._8_8_,&PTR_DAT_009d9b60);
  uVar23 = extraout_x1_05;
LAB_00437f28:
  ppuVar16 = &PTR_DAT_009d9b60;
  FUN_00191914(uVar23,0x8102,&PTR_DAT_009d9b60);
  ppuVar14 = extraout_x1_06;
  goto LAB_00437f3c;
LAB_00437d20:
  *(ulong *)(param_2 + 0x10068) = uVar35;
  *(undefined4 *)(param_2 + 0x100a4) = 0xffffffff;
  goto LAB_00437e40;
LAB_00437d30:
  *puVar32 = uVar35;
  goto LAB_00437d50;
}


