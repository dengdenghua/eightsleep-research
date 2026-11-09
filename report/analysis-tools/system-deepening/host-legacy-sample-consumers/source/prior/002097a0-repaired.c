/* Ghidra static pseudocode; not original source. */

void FUN_002097a0(undefined8 *param_1)

{
  undefined8 *puVar1;
  undefined1 *puVar2;
  undefined8 uVar3;
  undefined1 uVar4;
  undefined1 uVar5;
  undefined1 uVar6;
  undefined1 uVar7;
  ushort uVar8;
  short sVar9;
  short sVar10;
  short sVar11;
  short sVar12;
  short sVar13;
  undefined *puVar14;
  code *pcVar15;
  char cVar16;
  byte bVar17;
  undefined2 uVar18;
  int iVar19;
  uint uVar20;
  undefined4 uVar21;
  byte *pbVar22;
  long lVar23;
  undefined8 uVar24;
  ulong uVar25;
  long lVar26;
  uint uVar27;
  long *plVar28;
  ulong uVar29;
  char *pcVar30;
  undefined4 uVar31;
  ushort uStack_a;
  long local_8;
  
  uVar8 = *(ushort *)((long)param_1 + 0x3a);
  local_8 = *(long *)PTR___stack_chk_guard_005df758;
  if ((uVar8 & 1) != 0) {
    switch(uVar8) {
    case 1:
    case 3:
    case 0x27:
      break;
    default:
      goto code_r0x00209834;
    case 5:
      FUN_001988f0(param_1 + 0x14);
      FUN_001988f0(param_1 + 0x15);
      break;
    case 7:
      FUN_001988f0(param_1 + 0x1a);
      FUN_001988f0(param_1 + 0x1b);
      break;
    case 9:
      FUN_001988f0(param_1 + 0x20);
      FUN_001988f0(param_1 + 0x21);
      break;
    case 0xb:
      FUN_001988f0(param_1 + 0x22);
      FUN_001988f0(param_1 + 0x23);
      break;
    case 0xd:
      FUN_001988f0(param_1 + 0x32);
      FUN_001988f0(param_1 + 0x33);
      FUN_001f33b0(param_1 + 0x2f);
      FUN_001f33b0(param_1 + 0x29);
      break;
    case 0xf:
      FUN_001988f0(param_1 + 0x68);
      FUN_001988f0(param_1 + 0x69);
      break;
    case 0x11:
      FUN_001988f0(param_1 + 0x71);
      FUN_001988f0(param_1 + 0x72);
      break;
    case 0x13:
      FUN_001988f0(param_1 + 0x78);
      FUN_001988f0(param_1 + 0x79);
      break;
    case 0x15:
      FUN_001988f0(param_1 + 0x7d);
      FUN_001988f0(param_1 + 0x7e);
      break;
    case 0x17:
      FUN_001988f0(param_1 + 0x89);
      FUN_001988f0(param_1 + 0x8a);
      break;
    case 0x19:
      FUN_001988f0(param_1 + 0x8b);
      FUN_001988f0(param_1 + 0x8c);
      break;
    case 0x1b:
      FUN_001988f0(param_1 + 0x97);
      FUN_001988f0(param_1 + 0x98);
      break;
    case 0x1d:
      FUN_001988f0(param_1 + 0x99);
      FUN_001988f0(param_1 + 0x9a);
      break;
    case 0x1f:
      FUN_001988f0(param_1 + 0x9e);
      FUN_001988f0(param_1 + 0x9f);
      break;
    case 0x21:
      FUN_001988f0(param_1 + 0xa9);
      FUN_001988f0(param_1 + 0xaa);
      FUN_001f33b0(param_1 + 0xa5);
      FUN_001f33b0(param_1 + 0xa1);
      break;
    case 0x23:
      FUN_001988f0(param_1 + 0xb9);
      FUN_001988f0(param_1 + 0xba);
      if ((undefined8 *)param_1[0xb4] != param_1 + 0xb6) {
        operator_delete((undefined8 *)param_1[0xb4],param_1[0xb6] + 1);
      }
      if ((undefined8 *)param_1[0xb0] != param_1 + 0xb2) {
        operator_delete((undefined8 *)param_1[0xb0],param_1[0xb2] + 1);
      }
      if ((undefined8 *)param_1[0xac] != param_1 + 0xae) {
        operator_delete((undefined8 *)param_1[0xac],param_1[0xae] + 1);
      }
      break;
    case 0x25:
      FUN_001988f0(param_1 + 0xcb);
      FUN_001988f0(param_1 + 0xcc);
      if (*(char *)(param_1 + 0xca) != '\0') {
        *(undefined1 *)(param_1 + 0xca) = 0;
        FUN_001f4fe0(param_1 + 0xc3);
        if ((undefined8 *)param_1[0xc3] != param_1 + 0xc9) {
          operator_delete((undefined8 *)param_1[0xc3],param_1[0xc4] << 3);
        }
        FUN_001f4fe0(param_1 + 0xbc);
        if ((undefined8 *)param_1[0xbc] != param_1 + 0xc2) {
          operator_delete((undefined8 *)param_1[0xbc],param_1[0xbd] << 3);
        }
      }
    }
code_r0x002098e4:
    std::__exception_ptr::exception_ptr::~exception_ptr((exception_ptr *)(param_1 + 5));
    if (*(char *)(param_1 + 7) != '\0') {
      pthread_getspecific(DAT_005e3b90);
      lVar23 = local_8 - *(long *)PTR___stack_chk_guard_005df758;
      if (lVar23 == 0) {
        free(param_1);
        return;
      }
      goto LAB_0020abe8;
    }
    goto LAB_002098f4;
  }
  if (0x26 < uVar8) {
code_r0x00209834:
code_r0x00209884:
                    /* WARNING: Does not return */
    pcVar15 = (code *)SoftwareBreakpoint(1000,0x209888);
    (*pcVar15)();
  }
                    /* WARNING: Switch is manually overridden */
  switch(uVar8) {
  case 0:
    *(undefined2 *)((long)param_1 + 0x3a) = 2;
    *(undefined1 *)(param_1 + 0xb) = 0;
    param_1[8] = param_1;
    goto LAB_002098f4;
  default:
    goto code_r0x00209884;
  case 2:
    pbVar22 = (byte *)param_1[10];
    *(undefined1 *)(param_1 + 0xb) = 1;
    bVar17 = *pbVar22;
    if (pbVar22[1] == 0) {
      if (bVar17 == 7) {
        FUN_00281db0(param_1 + 0x34,pbVar22,"sensor",param_1[9] + 0x2130);
        pcVar30 = strstr((char *)(param_1 + 0x34),"samples queued");
        if (pcVar30 != (char *)0x0) {
          FUN_001965f0(PTR_DAT_005df810,0x28e,"handleCommand",
                       "/usr/src/debug/frank/0.1-r0/git/firmware/src/subsystem/Sensor.cpp",
                       "[sensor]samples collected: %u",*(undefined4 *)(param_1[9] + 0x2330));
        }
      }
      else if (bVar17 == 9) {
        uVar21 = FUN_00252b10();
        *(undefined4 *)(param_1 + 0x4c) = uVar21;
        uVar21 = FUN_00252b50();
        puVar1 = param_1 + 0x4d;
        uVar24 = *(undefined8 *)(param_1[10] + 8);
        uVar3 = *(undefined8 *)(param_1[10] + 0x10);
        *(undefined4 *)((long)param_1 + 0x264) = uVar21;
        FUN_00214e10(puVar1,"sensor",*(undefined4 *)(param_1 + 0x4c),uVar21,uVar24,uVar3);
        if (*(char *)(param_1 + 0x62) != '\0') {
          cVar16 = FUN_001d84d4(puVar1);
          if (cVar16 == '\0') {
            FUN_001965f0(PTR_DAT_005df810,0x29e,"handleCommand",
                         "/usr/src/debug/frank/0.1-r0/git/firmware/src/subsystem/Sensor.cpp",
                         "[%s] failed to publish fw sysevent","sensor");
          }
          if (*(char *)(param_1 + 0x62) != '\0') {
            bVar17 = FUN_00247830(*(undefined8 *)(param_1[10] + 8),
                                  *(undefined8 *)(param_1[10] + 0x10));
            *(byte *)(param_1 + 99) = bVar17;
            lVar23 = param_1[9];
            uVar24 = *(undefined8 *)(param_1[10] + 8);
            uVar3 = *(undefined8 *)(param_1[10] + 0x10);
            uVar21 = FUN_00252dc0();
            FUN_00247920("sensor",param_1 + 0x52,uVar24,uVar3,lVar23 + (ulong)bVar17 * 8 + 0x23e0,
                         lVar23 + 0x20c8,uVar21);
            if (*(char *)(param_1 + 0x62) != '\0') {
              *(undefined1 *)(param_1 + 0x62) = 0;
              FUN_0019b990(puVar1);
            }
          }
        }
      }
      lVar23 = param_1[9];
      if (*(int *)(lVar23 + 0x2088) == 2) {
        pbVar22 = (byte *)param_1[10];
        bVar17 = *pbVar22;
        if (bVar17 == 0x35) {
          uVar21 = FUN_0020de70(lVar23 + 0x2098);
          lVar26 = param_1[10];
          *(undefined4 *)(lVar23 + 0x2090) = 40000;
          *(undefined4 *)(lVar23 + 0x20b8) = uVar21;
          *(undefined4 *)(lVar23 + 0x20bc) = 1;
          uVar24 = *(undefined8 *)(lVar26 + 8);
          param_1[0x8d] = 0;
          lVar23 = FUN_0021c210(uVar24,*(undefined8 *)(lVar26 + 0x10),param_1 + 0x8e);
          *(undefined4 *)((long)param_1 + 0x484) = 0;
          uVar8 = *(ushort *)(param_1 + 0x8e);
          uVar25 = lVar23 + param_1[0x8d];
          param_1[0x8d] = uVar25;
          if (uVar8 == 0) {
            uVar20 = 5;
          }
          else {
            uVar20 = 0;
            if (uVar8 != 0) {
              uVar20 = 1000 / uVar8;
            }
            if (uVar20 == 0) {
              uVar20 = 5;
            }
          }
          lVar23 = param_1[10];
          uVar29 = *(ulong *)(lVar23 + 0x10);
          *(uint *)(param_1 + 0x91) = uVar20;
          goto LAB_0020a540;
        }
        if (bVar17 < 0x36) {
          if (bVar17 == 0x32) {
            uVar21 = FUN_0020de70(lVar23 + 0x2098);
            *(undefined4 *)(lVar23 + 0x20b8) = uVar21;
            *(undefined4 *)(lVar23 + 0x2090) = 40000;
            *(undefined4 *)(lVar23 + 0x20bc) = 1;
            FUN_002020f0(2);
            uVar24 = *(undefined8 *)(param_1[10] + 8);
            param_1[0x6a] = 0;
            lVar23 = FUN_0021a7e0(uVar24,*(undefined8 *)(param_1[10] + 0x10),param_1 + 0x6b);
            *(undefined4 *)(param_1 + 0x6d) = 0;
            uVar27 = *(uint *)(param_1 + 0x6b);
            uVar25 = lVar23 + param_1[0x6a];
            param_1[0x6a] = uVar25;
            uVar20 = 0;
            if ((uVar27 != 0) && (uVar20 = 0, uVar27 != 0)) {
              uVar20 = 1000 / uVar27;
            }
            lVar23 = param_1[10];
            if (uVar20 == 0) {
              uVar20 = 1;
            }
            *(uint *)((long)param_1 + 0x36c) = uVar20;
            uVar29 = *(ulong *)(lVar23 + 0x10);
            goto LAB_00209f58;
          }
          if (bVar17 < 0x33) {
            if (bVar17 == 0x30) {
              uVar21 = FUN_0020de70(lVar23 + 0x2098);
              *(undefined4 *)(lVar23 + 0x20b8) = uVar21;
              *(undefined4 *)(lVar23 + 0x2090) = 40000;
              *(undefined4 *)(lVar23 + 0x20bc) = 1;
              FUN_002020f0(2);
              lVar23 = param_1[10];
              param_1[100] = 0;
              uVar25 = 0;
              uVar29 = *(ulong *)(lVar23 + 0x10);
              goto LAB_00209ebc;
            }
            if (bVar17 != 0x31) break;
            puVar1 = param_1 + 0x73;
            FUN_0021b3b0(*(undefined8 *)(pbVar22 + 8),*(undefined8 *)(pbVar22 + 0x10),puVar1,0x31,
                         lVar23 + 0x2200);
            FUN_0021b580(puVar1);
            FUN_001e04f0(param_1 + 0x79,puVar1);
            FUN_00206e54(param_1 + 0x78,param_1[3],param_1 + 0x79);
            uVar18 = 0x12;
            lVar23 = param_1[8];
            lVar26 = param_1[0x78];
          }
          else {
            if (bVar17 != 0x33) {
              uVar21 = FUN_0020de70(lVar23 + 0x2098);
              *(undefined4 *)(lVar23 + 0x20b8) = uVar21;
              *(undefined4 *)(lVar23 + 0x2090) = 40000;
              *(undefined4 *)(lVar23 + 0x20bc) = 1;
              param_1[0x7f] = 0;
              FUN_002020f0(2);
              lVar23 = FUN_0021a960(*(long *)(param_1[10] + 8) + param_1[0x7f],
                                    *(long *)(param_1[10] + 0x10) - param_1[0x7f],param_1 + 0x80);
              *(undefined4 *)((long)param_1 + 0x414) = 0;
              uVar20 = *(uint *)(param_1 + 0x80);
              uVar25 = lVar23 + param_1[0x7f];
              param_1[0x7f] = uVar25;
              if (uVar20 == 0) {
                uVar27 = 2;
              }
              else {
                uVar27 = 0;
                if (uVar20 != 0) {
                  uVar27 = 1000 / uVar20;
                }
                if (1000 < uVar20) {
                  uVar27 = 2;
                }
              }
              lVar23 = param_1[10];
              uVar29 = *(ulong *)(lVar23 + 0x10);
              *(uint *)(param_1 + 0x83) = uVar27;
              goto LAB_0020a3d8;
            }
            param_1[0x7a] = 0;
            param_1[0x7b] = 0;
            uVar24 = *(undefined8 *)(pbVar22 + 8);
            uVar3 = *(undefined8 *)(pbVar22 + 0x10);
            *(undefined4 *)(param_1 + 0x7c) = 0;
            FUN_0021abe0(uVar24,uVar3,param_1 + 0x7a,lVar23 + 0x2200);
            FUN_001e0d20(param_1 + 0x7e,param_1 + 0x7a);
            FUN_00206e54(param_1 + 0x7d,param_1[3],param_1 + 0x7e);
            uVar18 = 0x14;
            lVar23 = param_1[8];
            lVar26 = param_1[0x7d];
          }
        }
        else if (bVar17 == 0x39) {
          uVar24 = FUN_00252b10();
          FUN_00212280(param_1 + 0xbb,uVar24,*(undefined8 *)(param_1[10] + 8),
                       *(undefined8 *)(param_1[10] + 0x10));
          if (*(char *)(param_1 + 0xca) == '\0') break;
          FUN_001e2280(param_1 + 0xcc,param_1 + 0xbb);
          FUN_00206e54(param_1 + 0xcb,param_1[3],param_1 + 0xcc);
          uVar18 = 0x24;
          lVar23 = param_1[8];
          lVar26 = param_1[0xcb];
        }
        else if (bVar17 < 0x3a) {
          if (bVar17 == 0x36) {
            FUN_0021c3b0(*(undefined8 *)(pbVar22 + 8),*(undefined8 *)(pbVar22 + 0x10),param_1 + 0x9b
                        );
            uVar24 = FUN_00252b10();
            *(undefined2 *)((long)param_1 + 0x4da) = 0;
            *(int *)((long)param_1 + 0x4dc) = (int)uVar24;
            FUN_001e0830(param_1 + 0x9f,uVar24,*(undefined1 *)(param_1 + 0x9b),
                         *(undefined1 *)((long)param_1 + 0x4d9));
            FUN_00206e54(param_1 + 0x9e,param_1[3],param_1 + 0x9f);
            uVar18 = 0x1e;
            lVar23 = param_1[8];
            lVar26 = param_1[0x9e];
          }
          else {
            if (bVar17 != 0x37) break;
            uVar24 = FUN_00252b10();
            puVar1 = param_1 + 0xab;
            FUN_0020d2b0(puVar1,uVar24,*(undefined8 *)(param_1[10] + 8),
                         *(undefined8 *)(param_1[10] + 0x10));
            FUN_00209300(param_1[9],puVar1);
            FUN_001e18b0(param_1 + 0xba,puVar1);
            FUN_00206e54(param_1 + 0xb9,param_1[3],param_1 + 0xba);
            uVar18 = 0x22;
            lVar23 = param_1[8];
            lVar26 = param_1[0xb9];
          }
        }
        else {
          if (bVar17 != 0x44) break;
          uVar24 = *(undefined8 *)(pbVar22 + 8);
          uVar3 = *(undefined8 *)(pbVar22 + 0x10);
          puVar1 = param_1 + 0xa0;
          param_1[0xa8] = 0;
          *puVar1 = 0;
          param_1[0xa1] = 0;
          param_1[0xa2] = 0;
          param_1[0xa3] = 0;
          param_1[0xa4] = 0;
          param_1[0xa5] = 0;
          param_1[0xa6] = 0;
          param_1[0xa7] = 0;
          FUN_0021ad74(uVar24,uVar3,puVar1,lVar23 + 0x2200);
          FUN_001e13d0(param_1 + 0xaa,puVar1);
          FUN_00206e54(param_1 + 0xa9,param_1[3],param_1 + 0xaa);
          uVar18 = 0x20;
          lVar23 = param_1[8];
          lVar26 = param_1[0xa9];
        }
        goto LAB_00209e64;
      }
    }
    else {
      puVar2 = *(undefined1 **)(pbVar22 + 8);
      lVar23 = *(long *)(pbVar22 + 0x10);
      *(undefined1 *)((long)param_1 + 0x5a) = *puVar2;
      param_1[0xc] = puVar2 + 1;
      param_1[0xd] = lVar23 + -1;
      if (bVar17 != 0x2c) {
        uStack_a = (ushort)bVar17;
        FUN_002032e0(param_1[9] + 0x23a8,&uStack_a);
        if (*(char *)param_1[10] == '\x01') {
          FUN_002082a4(param_1[9],*(undefined1 *)((long)param_1 + 0x5a),param_1[0xc],param_1[0xd]);
        }
        else if (*(char *)param_1[10] == '\x05') {
          if (*(int *)(param_1[9] + 0x2088) == 0) break;
          FUN_00207cf0(param_1[9],0);
        }
      }
      lVar23 = param_1[9];
      if (*(int *)(lVar23 + 0x2088) == 1) {
        bVar17 = *(byte *)param_1[10];
        if (bVar17 == 0x12) {
          uVar24 = *(undefined8 *)(lVar23 + 0x2310);
          if (*(char *)((long)param_1 + 0x5a) == '\0') {
            FUN_00219f34(uVar24);
          }
          else {
LAB_0020ab5c:
            FUN_0021a100(uVar24);
          }
        }
        else if (bVar17 < 0x13) {
          if (bVar17 == 4) {
            FUN_002041b0(lVar23);
          }
          else if (bVar17 == 0x10) {
            uVar21 = FUN_00280a70(lVar23 + 0x21e0);
            *(undefined4 *)(param_1 + 0xe) = uVar21;
            uVar18 = FUN_00280ab0(param_1[9] + 0x21e0);
            puVar14 = PTR_DAT_005df810;
            *(undefined2 *)((long)param_1 + 0x74) = uVar18;
            FUN_001965f0(puVar14,0x1e8,"handleCommand",
                         "/usr/src/debug/frank/0.1-r0/git/firmware/src/subsystem/Sensor.cpp",
                         "[sensor] info: rev=0x%04x pn=0x%04x",*(undefined4 *)(param_1 + 0xe),uVar18
                        );
            if (*(int *)(param_1 + 0xe) < 0x700) {
              FUN_0021a6d0(param_1[9] + 0x2200,1000);
              FUN_00237470(1,0x1c200,param_1[9] + 0x2340,1);
            }
            else {
              FUN_0021a6d0(param_1[9] + 0x2200,500);
              FUN_0021a6d0(param_1[9] + 0x2288,200);
              FUN_00237470(1,0xe1000,param_1[9] + 0x2340,1);
              FUN_001965f0(PTR_DAT_005df9d0,0x1f0,"handleCommand",
                           "/usr/src/debug/frank/0.1-r0/git/firmware/src/subsystem/Sensor.cpp",
                           "[sensor] hi-speed fw start");
            }
          }
          else if (bVar17 == 2) {
            FUN_00203f70(lVar23);
          }
        }
        else if (bVar17 == 0x13) {
          if (*(char *)((long)param_1 + 0x5a) == '\0') {
            uVar21 = FUN_0020de70(lVar23 + 0x2098);
            lVar26 = param_1[9];
            *(undefined4 *)(lVar23 + 0x20b8) = uVar21;
            uVar24 = *(undefined8 *)(lVar26 + 0x2310);
            *(undefined4 *)(lVar23 + 0x2090) = 40000;
            *(undefined4 *)(lVar23 + 0x20bc) = 1;
            FUN_00219f34(uVar24);
          }
          else {
            if (*(char *)((long)param_1 + 0x5a) != '\x05') {
              uVar24 = *(undefined8 *)(lVar23 + 0x2310);
              goto LAB_0020ab5c;
            }
            FUN_0045f6e0(param_1[0xc],param_1 + 0xf);
            FUN_0021a050(*(undefined8 *)(param_1[9] + 0x2310),*(undefined4 *)(param_1 + 0xf));
          }
        }
        else if (bVar17 == 0x14) {
          if (*(char *)((long)param_1 + 0x5a) == '\0') {
            FUN_0021a1d4(*(undefined8 *)(lVar23 + 0x2310),1);
          }
          else {
            FUN_0021a1d4(*(undefined8 *)(lVar23 + 0x2310),0);
          }
        }
      }
      else if (*(int *)(lVar23 + 0x2088) == 2) {
        bVar17 = *(byte *)param_1[10];
        if (bVar17 == 0x2c) {
          if (*(char *)((long)param_1 + 0x5a) == '\0') {
            FUN_00205364(param_1 + 0x23,lVar23,param_1[0xc],param_1[0xd]);
            FUN_00206e54(param_1 + 0x22,param_1[3],param_1 + 0x23);
            uVar18 = 10;
            lVar23 = param_1[8];
            lVar26 = param_1[0x22];
            goto LAB_00209e64;
          }
          FUN_001965f0(PTR_DAT_005df810,0x276,"handleCommand",
                       "/usr/src/debug/frank/0.1-r0/git/firmware/src/subsystem/Sensor.cpp",
                       "[sensor]got vibration resp code 0x%02x");
        }
        else if (bVar17 < 0x2d) {
          if (bVar17 == 0x2a) {
            if (*(char *)((long)param_1 + 0x5a) == '\0') {
              puVar1 = param_1 + 0x16;
              FUN_0021b6f0(param_1[0xc],param_1[0xd],puVar1);
              FUN_002052e0(param_1[9],puVar1);
              FUN_001e0690(param_1 + 0x1b,puVar1);
              FUN_00206e54(param_1 + 0x1a,param_1[3],param_1 + 0x1b);
              uVar18 = 6;
              lVar23 = param_1[8];
              lVar26 = param_1[0x1a];
              goto LAB_00209e64;
            }
          }
          else if (bVar17 == 0x2b) {
            if ((*(char *)((long)param_1 + 0x5a) == '\0') && (param_1[0xd] == 4)) {
              FUN_0045f6b4(param_1[0xc],lVar23 + 0x211a);
              FUN_0045f6b4(param_1[0xc] + 2,param_1[9] + 0x211c);
              FUN_001965f0(PTR_DAT_005df810,0x269,"handleCommand",
                           "/usr/src/debug/frank/0.1-r0/git/firmware/src/subsystem/Sensor.cpp",
                           "[sensor] gain response %d %d",*(undefined2 *)(param_1[9] + 0x211a),
                           *(undefined2 *)(param_1[9] + 0x211c));
              FUN_0024fd84(*(undefined2 *)(param_1[9] + 0x211a),*(undefined2 *)(param_1[9] + 0x211c)
                          );
            }
          }
          else if ((bVar17 == 0x25) && (*(char *)((long)param_1 + 0x5a) == '\0')) {
            lVar26 = (long)param_1 + 0x7c;
            FUN_0021b3b0(param_1[0xc],param_1[0xd],lVar26,0x25,lVar23 + 0x2200);
            FUN_0021b580(lVar26);
            FUN_00205200(param_1[9],lVar26);
            FUN_001e04f0(param_1 + 0x15,lVar26);
            FUN_00206e54(param_1 + 0x14,param_1[3],param_1 + 0x15);
            uVar18 = 4;
            lVar23 = param_1[8];
            lVar26 = param_1[0x14];
            goto LAB_00209e64;
          }
        }
        else if (bVar17 == 0x2f) {
          if (*(char *)((long)param_1 + 0x5a) == '\0') {
            puVar1 = param_1 + 0x1c;
            thunk_FUN_0021b5e0(param_1[0xc],param_1[0xd],puVar1);
            FUN_002052e0(param_1[9],puVar1);
            FUN_001e0690(param_1 + 0x21,puVar1);
            FUN_00206e54(param_1 + 0x20,param_1[3],param_1 + 0x21);
            uVar18 = 8;
            lVar23 = param_1[8];
            lVar26 = param_1[0x20];
            goto LAB_00209e64;
          }
        }
        else if (bVar17 == 0x45) {
          param_1[0x24] = 0;
          param_1[0x25] = 0;
          param_1[0x26] = 0;
          param_1[0x27] = 0;
          param_1[0x28] = 0;
          param_1[0x29] = 0;
          param_1[0x2a] = 0;
          param_1[0x2b] = 0;
          param_1[0x2c] = 0;
          param_1[0x2d] = 0;
          param_1[0x2e] = 0;
          param_1[0x2f] = 0;
          param_1[0x30] = 0;
          param_1[0x31] = 0;
          FUN_0021bcc0(param_1[0xc],param_1[0xd],param_1 + 0x24);
          FUN_001e1570(param_1 + 0x33,param_1 + 0x24);
          FUN_00206e54(param_1 + 0x32,param_1[3],param_1 + 0x33);
          uVar18 = 0xc;
          lVar23 = param_1[8];
          lVar26 = param_1[0x32];
          goto LAB_00209e64;
        }
      }
    }
    break;
  case 4:
    FUN_00198930(param_1 + 0x14,0x2098ac,0);
    FUN_001988f0(param_1 + 0x14);
    FUN_001988f0(param_1 + 0x15);
    if (5 < bRam00000000005e03aa) {
      uVar4 = *(undefined1 *)((long)param_1 + 0x8f);
      sVar9 = *(short *)((long)param_1 + 0x92);
      sVar10 = *(short *)((long)param_1 + 0x9a);
      sVar11 = *(short *)(param_1 + 0x13);
      pcVar30 = "[Heat] L%u setp%d %u%% R%u setp%d %u%% S%u %umA CMP%d th%d setp%d mcu%d";
      sVar12 = *(short *)((long)param_1 + 0x96);
      uVar5 = *(undefined1 *)((long)param_1 + 0x9f);
      uVar18 = *(undefined2 *)((long)param_1 + 0x8c);
      uVar24 = 0x22f;
      uVar6 = *(undefined1 *)((long)param_1 + 0x8e);
      uVar7 = *(undefined1 *)(param_1 + 0x12);
      sVar13 = *(short *)((long)param_1 + 0x94);
      uVar21 = *(undefined4 *)((long)param_1 + 0x84);
      uVar31 = *(undefined4 *)(param_1 + 0x11);
      goto LAB_00209d5c;
    }
    break;
  case 6:
    FUN_00198930(param_1 + 0x1a,0x2098ac,0);
    FUN_001988f0(param_1 + 0x1a);
    FUN_001988f0(param_1 + 0x1b);
    sVar9 = *(short *)((long)param_1 + 0xba);
    lVar23 = param_1[9];
    bVar17 = bRam00000000005e03aa + 1;
    bRam00000000005e03aa = bVar17;
    *(float *)(lVar23 + 8) = (float)(int)*(short *)(param_1 + 0x17) / 100.0;
    *(float *)(lVar23 + 0xc) = (float)(int)sVar9 / 100.0;
    if (5 < bVar17) {
      FUN_00208b00(lVar23,param_1 + 0x16);
LAB_00209df8:
      bRam00000000005e03aa = 0;
    }
    break;
  case 8:
    FUN_00198930(param_1 + 0x20,0x2098ac,0);
    FUN_001988f0(param_1 + 0x20);
    FUN_001988f0(param_1 + 0x21);
    sVar9 = *(short *)((long)param_1 + 0xea);
    lVar23 = param_1[9];
    bVar17 = bRam00000000005e03aa + 1;
    bRam00000000005e03aa = bVar17;
    *(float *)(lVar23 + 8) = (float)(int)*(short *)(param_1 + 0x1d) / 100.0;
    *(float *)(lVar23 + 0xc) = (float)(int)sVar9 / 100.0;
    if (5 < bVar17) {
      FUN_00208b00(lVar23,param_1 + 0x1c);
      goto LAB_00209df8;
    }
    break;
  case 10:
    FUN_00198930(param_1 + 0x22,0x2098ac,0);
    FUN_001988f0(param_1 + 0x22);
    FUN_001988f0(param_1 + 0x23);
    break;
  case 0xc:
    FUN_00198930(param_1 + 0x32,0x2098ac,0);
    FUN_001988f0(param_1 + 0x32);
    FUN_001988f0(param_1 + 0x33);
    FUN_001f33b0(param_1 + 0x2f);
    FUN_001f33b0(param_1 + 0x29);
    break;
  case 0xe:
    FUN_00198930(param_1 + 0x68,0x2098ac,0);
    FUN_001988f0(param_1 + 0x68);
    FUN_001988f0(param_1 + 0x69);
    lVar23 = param_1[10];
    uVar25 = param_1[100];
    uVar29 = *(ulong *)(lVar23 + 0x10);
    if (uVar25 < uVar29) {
LAB_00209ebc:
      lVar23 = FUN_0021a6f0(*(long *)(lVar23 + 8) + uVar25,uVar29,param_1 + 0x65,param_1[9] + 0x2200
                           );
      param_1[100] = param_1[100] + lVar23;
      FUN_001e0004(param_1 + 0x69,param_1 + 0x65,0);
      FUN_00206e54(param_1 + 0x68,param_1[3],param_1 + 0x69);
      uVar18 = 0xe;
      lVar23 = param_1[8];
      lVar26 = param_1[0x68];
      goto LAB_00209e64;
    }
    break;
  case 0x10:
    FUN_00198930(param_1 + 0x71,0x2098ac,0);
    FUN_001988f0(param_1 + 0x71);
    FUN_001988f0(param_1 + 0x72);
    lVar23 = param_1[10];
    uVar25 = param_1[0x6a];
    uVar29 = *(ulong *)(lVar23 + 0x10);
    if (uVar25 < uVar29) {
LAB_00209f58:
      lVar23 = FUN_0021a870(*(long *)(lVar23 + 8) + uVar25,uVar29 - uVar25,param_1 + 0x6b,
                            *(undefined4 *)(param_1 + 0x6d),param_1 + 0x6e,param_1[9] + 0x2200);
      *(int *)(param_1 + 0x6d) = *(int *)(param_1 + 0x6d) + *(int *)((long)param_1 + 0x36c);
      iVar19 = *(int *)(param_1[9] + 0x2330);
      param_1[0x6a] = param_1[0x6a] + lVar23;
      *(int *)(param_1[9] + 0x2330) = iVar19 + 1;
      FUN_001e0004(param_1 + 0x72,param_1 + 0x6e,1);
      FUN_00206e54(param_1 + 0x71,param_1[3],param_1 + 0x72);
      uVar18 = 0x10;
      lVar23 = param_1[8];
      lVar26 = param_1[0x71];
      goto LAB_00209e64;
    }
    break;
  case 0x12:
    FUN_00198930(param_1 + 0x78,0x2098ac,0);
    FUN_001988f0(param_1 + 0x78);
    FUN_001988f0(param_1 + 0x79);
    uVar4 = *(undefined1 *)((long)param_1 + 0x3ab);
    pcVar30 = "[HeatE] L%u setp%d %u%% R%u setp%d %u%% S%u %umA CMP%d th%d setp%d mcu%d";
    sVar9 = *(short *)((long)param_1 + 0x3ae);
    sVar10 = *(short *)((long)param_1 + 0x3b6);
    uVar24 = 0x2eb;
    sVar11 = *(short *)((long)param_1 + 0x3b4);
    sVar12 = *(short *)((long)param_1 + 0x3b2);
    uVar5 = *(undefined1 *)((long)param_1 + 0x3bb);
    uVar18 = *(undefined2 *)(param_1 + 0x75);
    uVar6 = *(undefined1 *)((long)param_1 + 0x3aa);
    uVar7 = *(undefined1 *)((long)param_1 + 0x3ac);
    sVar13 = *(short *)(param_1 + 0x76);
    uVar21 = *(undefined4 *)(param_1 + 0x74);
    uVar31 = *(undefined4 *)((long)param_1 + 0x3a4);
LAB_00209d5c:
    FUN_001965f0(PTR_DAT_005df810,uVar24,"handleCommand",
                 "/usr/src/debug/frank/0.1-r0/git/firmware/src/subsystem/Sensor.cpp",pcVar30,uVar21,
                 (long)sVar9,uVar4,uVar31,(int)sVar13,uVar7,uVar6,uVar18,uVar5,(int)sVar12,
                 (int)sVar11,(int)sVar10);
    break;
  case 0x14:
    FUN_00198930(param_1 + 0x7d,0x2098ac,0);
    FUN_001988f0(param_1 + 0x7d);
    FUN_001988f0(param_1 + 0x7e);
    break;
  case 0x16:
    FUN_00198930(param_1 + 0x89,0x2098ac,0);
    FUN_001988f0(param_1 + 0x89);
    FUN_001988f0(param_1 + 0x8a);
    *(int *)((long)param_1 + 0x424) = *(int *)((long)param_1 + 0x424) + *(int *)(param_1 + 0x83);
LAB_00209e38:
    FUN_001e01b0(param_1 + 0x8c,(long)param_1 + 0x41c);
    FUN_00206e54(param_1 + 0x8b,param_1[3],param_1 + 0x8c);
    lVar23 = param_1[8];
    uVar18 = 0x18;
    lVar26 = param_1[0x8b];
    goto LAB_00209e64;
  case 0x18:
    FUN_00198930(param_1 + 0x8b,0x2098ac,0);
    FUN_001988f0(param_1 + 0x8b);
    FUN_001988f0(param_1 + 0x8c);
    lVar23 = param_1[10];
    uVar25 = param_1[0x7f];
    uVar29 = *(ulong *)(lVar23 + 0x10);
    if (uVar25 < uVar29) {
LAB_0020a3d8:
      lVar23 = *(long *)(lVar23 + 8);
      *(undefined1 *)((long)param_1 + 0x444) = 0;
      lVar23 = FUN_0021aa70(lVar23 + uVar25,uVar29 - uVar25,param_1 + 0x80,
                            *(undefined4 *)((long)param_1 + 0x414),(long)param_1 + 0x41c,
                            param_1[9] + 0x2200,(long)param_1 + 0x444,0);
      *(int *)((long)param_1 + 0x414) = *(int *)((long)param_1 + 0x414) + *(int *)(param_1 + 0x83);
      cVar16 = *(char *)((long)param_1 + 0x444);
      iVar19 = *(int *)(param_1[9] + 0x2330);
      param_1[0x7f] = param_1[0x7f] + lVar23;
      *(int *)(param_1[9] + 0x2330) = iVar19 + 1;
      if (cVar16 != '\0') {
        *(int *)((long)param_1 + 0x424) = *(int *)((long)param_1 + 0x424) - *(int *)(param_1 + 0x83)
        ;
        FUN_001e01b0(param_1 + 0x8a,(long)param_1 + 0x41c);
        FUN_00206e54(param_1 + 0x89,param_1[3],param_1 + 0x8a);
        uVar18 = 0x16;
        lVar23 = param_1[8];
        lVar26 = param_1[0x89];
        goto LAB_00209e64;
      }
      goto LAB_00209e38;
    }
    break;
  case 0x1a:
    FUN_00198930(param_1 + 0x97,0x2098ac,0);
    FUN_001988f0(param_1 + 0x97);
    FUN_001988f0(param_1 + 0x98);
    *(int *)((long)param_1 + 0x494) = *(int *)((long)param_1 + 0x494) + *(int *)(param_1 + 0x91);
LAB_0020a1b4:
    FUN_001e0350(param_1 + 0x9a,(long)param_1 + 0x48c);
    FUN_00206e54(param_1 + 0x99,param_1[3],param_1 + 0x9a);
    uVar18 = 0x1c;
    lVar23 = param_1[8];
    lVar26 = param_1[0x99];
LAB_00209e64:
    *(undefined2 *)((long)param_1 + 0x3a) = uVar18;
    plVar28 = *(long **)(lVar23 + 0x18);
    *(long **)(lVar26 + 8) = plVar28;
    *(long *)(lVar26 + 0x10) = lVar23 + 0x10;
    *(long *)(*plVar28 + 0x60) = lVar26;
    *(undefined8 *)(lVar23 + 0x18) = 0;
    goto LAB_002098f4;
  case 0x1c:
    FUN_00198930(param_1 + 0x99,0x2098ac,0);
    FUN_001988f0(param_1 + 0x99);
    FUN_001988f0(param_1 + 0x9a);
    lVar23 = param_1[10];
    uVar25 = param_1[0x8d];
    uVar29 = *(ulong *)(lVar23 + 0x10);
    if (uVar25 < uVar29) {
LAB_0020a540:
      lVar23 = *(long *)(lVar23 + 8);
      *(undefined1 *)((long)param_1 + 0x4b4) = 0;
      lVar23 = FUN_0021c2c0(lVar23 + uVar25,uVar29 - uVar25,param_1 + 0x8e,
                            *(undefined4 *)((long)param_1 + 0x484),(long)param_1 + 0x48c,
                            param_1[9] + 0x2288,(long)param_1 + 0x4b4);
      param_1[0x8d] = param_1[0x8d] + lVar23;
      *(int *)((long)param_1 + 0x484) = *(int *)((long)param_1 + 0x484) + *(int *)(param_1 + 0x91);
      if (*(char *)((long)param_1 + 0x4b4) != '\0') {
        *(int *)((long)param_1 + 0x494) = *(int *)((long)param_1 + 0x494) - *(int *)(param_1 + 0x91)
        ;
        FUN_001e0350(param_1 + 0x98,(long)param_1 + 0x48c);
        FUN_00206e54(param_1 + 0x97,param_1[3],param_1 + 0x98);
        uVar18 = 0x1a;
        lVar23 = param_1[8];
        lVar26 = param_1[0x97];
        goto LAB_00209e64;
      }
      goto LAB_0020a1b4;
    }
    break;
  case 0x1e:
    FUN_00198930(param_1 + 0x9e,0x2098ac,0);
    FUN_001988f0(param_1 + 0x9e);
    FUN_001988f0(param_1 + 0x9f);
    iVar19 = FUN_00280a70(param_1[9] + 0x21e0);
    *(int *)(param_1 + 0x9c) = iVar19;
    bVar17 = 0;
    lVar23 = param_1[9];
    if (0x7ff < iVar19) {
      uVar20 = FUN_00202e50(*(undefined8 *)(lVar23 + 0x2380),*(undefined8 *)(lVar23 + 0x2388),
                            &UNK_0046cd90);
      bVar17 = (byte)(~uVar20 >> 7) & 1;
    }
    *(byte *)((long)param_1 + 0x4e4) = bVar17;
    if (iVar19 - 0x800U < 0x11) {
      uVar20 = FUN_00202e50(*(undefined8 *)(lVar23 + 0x2380),*(undefined8 *)(lVar23 + 0x2388),
                            &UNK_0046cd98);
      bVar17 = bVar17 | (byte)(~uVar20 >> 7) & 1;
    }
    *(byte *)((long)param_1 + 0x4e4) = bVar17;
    puVar14 = PTR_DAT_005df708;
    *(byte *)((long)param_1 + 0x4e4) = bVar17 | *(byte *)(lVar23 + 0x23a0);
    cVar16 = FUN_0020dcd0(puVar14);
    *(char *)((long)param_1 + 0x4e5) = cVar16;
    bVar17 = *(byte *)((long)param_1 + 0x4d9);
    if ((*(char *)((long)param_1 + 0x4e4) == '\0') || (bVar17 < 2)) {
      pcVar30 = "[disabled]";
      *(undefined1 *)((long)param_1 + 0x4e6) = 0;
      param_1[0x9d] = "[disabled]";
    }
    else {
      *(undefined1 *)((long)param_1 + 0x4e6) = 1;
      param_1[0x9d] = "";
      if (cVar16 == '\0') {
        FUN_00204c40(param_1[9],param_1 + 0x9b,*(undefined4 *)((long)param_1 + 0x4dc));
      }
      else {
        FUN_00205cc4();
      }
      bVar17 = *(byte *)((long)param_1 + 0x4d9);
      cVar16 = *(char *)((long)param_1 + 0x4e5);
      pcVar30 = (char *)param_1[0x9d];
    }
    FUN_001965f0(PTR_DAT_005df810,0x35b,"handleCommand",
                 "/usr/src/debug/frank/0.1-r0/git/firmware/src/subsystem/Sensor.cpp",
                 "[TTC]%s side %x, taps %u, time %u, alarm %u",pcVar30,
                 *(undefined1 *)(param_1 + 0x9b),bVar17,*(undefined4 *)((long)param_1 + 0x4dc),
                 cVar16);
    break;
  case 0x20:
    FUN_00198930(param_1 + 0xa9,0x2098ac,0);
    FUN_001988f0(param_1 + 0xa9);
    FUN_001988f0(param_1 + 0xaa);
    FUN_001f33b0(param_1 + 0xa5);
    FUN_001f33b0(param_1 + 0xa1);
    break;
  case 0x22:
    FUN_00198930(param_1 + 0xb9,0x2098ac,0);
    FUN_001988f0(param_1 + 0xb9);
    FUN_001988f0(param_1 + 0xba);
    if ((undefined8 *)param_1[0xb4] != param_1 + 0xb6) {
      operator_delete((undefined8 *)param_1[0xb4],param_1[0xb6] + 1);
    }
    if ((undefined8 *)param_1[0xb0] != param_1 + 0xb2) {
      operator_delete((undefined8 *)param_1[0xb0],param_1[0xb2] + 1);
    }
    if ((undefined8 *)param_1[0xac] != param_1 + 0xae) {
      operator_delete((undefined8 *)param_1[0xac],param_1[0xae] + 1);
    }
    break;
  case 0x24:
    FUN_00198930(param_1 + 0xcb,0x2098ac,0);
    FUN_001988f0(param_1 + 0xcb);
    FUN_001988f0(param_1 + 0xcc);
    if (*(char *)(param_1 + 0xca) != '\0') {
      *(undefined1 *)(param_1 + 0xca) = 0;
      FUN_001f4fe0(param_1 + 0xc3);
      if ((undefined8 *)param_1[0xc3] != param_1 + 0xc9) {
        operator_delete((undefined8 *)param_1[0xc3],param_1[0xc4] << 3);
      }
      FUN_001f4fe0(param_1 + 0xbc);
      if ((undefined8 *)param_1[0xbc] != param_1 + 0xc2) {
        operator_delete((undefined8 *)param_1[0xbc],param_1[0xbd] << 3);
      }
    }
    break;
  case 0x26:
    goto code_r0x002098e4;
  }
  *param_1 = 0;
  *(undefined2 *)((long)param_1 + 0x3a) = 0x26;
  param_1[0xcd] = param_1 + 2;
  lVar23 = param_1[4];
  if (lVar23 != 0) {
    *(undefined8 *)(lVar23 + 8) = param_1[3];
  }
  *(long *)(*(long *)param_1[3] + 0x60) = lVar23;
  param_1[3] = 0;
  param_1[4] = 0;
LAB_002098f4:
  lVar23 = local_8 - *(long *)PTR___stack_chk_guard_005df758;
  if (lVar23 == 0) {
    return;
  }
LAB_0020abe8:
                    /* WARNING: Subroutine does not return */
  __stack_chk_fail(PTR___stack_chk_guard_005df758,lVar23,0);
}


