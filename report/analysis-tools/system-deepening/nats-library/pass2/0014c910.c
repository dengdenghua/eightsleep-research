/* Ghidra static pseudocode; not original source. Read-only project; no target execution. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

ulong natsConn_publish(undefined8 *param_1,long param_2,char *param_3,char param_4)

{
  bool bVar1;
  undefined4 uVar2;
  bool bVar3;
  char cVar4;
  byte bVar5;
  int iVar6;
  uint uVar7;
  uint uVar8;
  int iVar9;
  size_t sVar10;
  size_t sVar11;
  long lVar12;
  undefined8 uVar13;
  ulong uVar14;
  undefined *puVar15;
  undefined *puVar16;
  undefined8 uVar17;
  undefined8 uVar18;
  int iVar19;
  int iVar20;
  int iVar21;
  int local_44;
  int local_40;
  int local_38;
  int local_34;
  char acStack_28 [4];
  char local_24;
  char local_23;
  char local_22;
  char local_21;
  char local_20;
  char local_1f;
  char local_1e;
  char local_1d;
  char acStack_18 [4];
  char local_14;
  char local_13;
  char local_12;
  char local_11;
  char local_10;
  char local_f;
  char local_e;
  char local_d;
  long local_8;
  
  local_8 = *(long *)PTR___stack_chk_guard_00187fa0;
  if (param_1 == (undefined8 *)0x0) {
    natsStatus_GetText(0x10);
    if (local_8 - *(long *)PTR___stack_chk_guard_00187fa0 != 0) {
                    /* WARNING: Subroutine does not return */
      __stack_chk_fail(local_8 - *(long *)PTR___stack_chk_guard_00187fa0,
                       PTR___stack_chk_guard_00187fa0,0);
    }
    uVar14 = nats_setErrorReal("/home/ubuntu/src/frankenfirmware/build/_deps/nats.c-src/src/pub.c",
                               "natsConn_publish",0x47,0x10,"%s");
    return uVar14;
  }
  if (*(char **)(param_2 + 0x10) == (char *)0x0) {
LAB_0014cb18:
    natsStatus_GetText(0xf);
    if (local_8 - *(long *)PTR___stack_chk_guard_00187fa0 != 0) {
                    /* WARNING: Subroutine does not return */
      __stack_chk_fail(local_8 - *(long *)PTR___stack_chk_guard_00187fa0,
                       PTR___stack_chk_guard_00187fa0,0);
    }
    uVar14 = nats_setErrorReal("/home/ubuntu/src/frankenfirmware/build/_deps/nats.c-src/src/pub.c",
                               "natsConn_publish",0x4c,0xf,"%s");
    return uVar14;
  }
  sVar10 = strlen(*(char **)(param_2 + 0x10));
  if ((int)sVar10 == 0) goto LAB_0014cb18;
  if (param_3 == (char *)0x0) {
    param_3 = *(char **)(param_2 + 0x18);
    iVar20 = 0;
    if (param_3 != (char *)0x0) goto LAB_0014c96c;
    natsMutex_Lock(*param_1);
    cVar4 = natsConn_isClosed(param_1);
  }
  else {
LAB_0014c96c:
    sVar11 = strlen(param_3);
    iVar20 = (int)sVar11;
    natsMutex_Lock(*param_1);
    cVar4 = natsConn_isClosed(param_1);
  }
  if (cVar4 != '\0') {
    natsMutex_Unlock(*param_1);
    uVar13 = natsStatus_GetText(5);
    puVar15 = (undefined *)(local_8 - *(long *)PTR___stack_chk_guard_00187fa0);
    uVar14 = 0;
    puVar16 = PTR___stack_chk_guard_00187fa0;
    if (puVar15 == (undefined *)0x0) {
      uVar18 = 5;
      uVar17 = 0x5c;
LAB_0014cbe4:
      uVar14 = nats_setErrorReal("/home/ubuntu/src/frankenfirmware/build/_deps/nats.c-src/src/pub.c"
                                 ,"natsConn_publish",uVar17,uVar18,"%s",uVar13);
      return uVar14;
    }
    goto LAB_0014d348;
  }
  cVar4 = natsConn_isDrainingPubs(param_1);
  if (cVar4 != '\0') {
    natsMutex_Unlock(*param_1);
    uVar13 = natsStatus_GetText(0x20);
    puVar15 = (undefined *)(local_8 - *(long *)PTR___stack_chk_guard_00187fa0);
    uVar14 = 0;
    puVar16 = PTR___stack_chk_guard_00187fa0;
    if (puVar15 == (undefined *)0x0) {
      uVar18 = 0x20;
      uVar17 = 99;
      goto LAB_0014cbe4;
    }
    goto LAB_0014d348;
  }
  if ((*(long *)(param_2 + 0x28) == 0) &&
     (uVar7 = *(uint *)(param_2 + 0x44) & 1, (*(uint *)(param_2 + 0x44) & 1) == 0)) {
    iVar21 = 0;
    iVar6 = 0;
    iVar19 = 4;
    local_34 = 1;
    local_40 = 0xc;
  }
  else {
    if ((*(char *)((long)param_1 + 0x13c) == '\0') && (*(char *)((long)param_1 + 0x101) == '\0')) {
      natsMutex_Unlock(*param_1);
      uVar13 = natsStatus_GetText(0x1e);
      puVar15 = (undefined *)(local_8 - *(long *)PTR___stack_chk_guard_00187fa0);
      uVar14 = 0;
      puVar16 = PTR___stack_chk_guard_00187fa0;
      if (puVar15 == (undefined *)0x0) {
        uVar18 = 0x1e;
        uVar17 = 0x73;
        goto LAB_0014cbe4;
      }
      goto LAB_0014d348;
    }
    iVar6 = natsMsgHeader_encodedLen(param_2);
    if (iVar6 < 1) {
      iVar19 = 4;
      iVar21 = 0;
      uVar7 = 0;
      local_34 = 1;
      local_40 = 0xc;
    }
    else {
      uVar7 = iVar6 / 10;
      local_d = "0123456789"[iVar6 % 10];
      if (uVar7 == 0) {
        local_40 = 0xb;
      }
      else {
        local_e = "0123456789"[(int)(uVar7 % 10)];
        uVar7 = uVar7 / 10;
        if (uVar7 == 0) {
          local_40 = 10;
        }
        else {
          local_f = "0123456789"[(int)(uVar7 % 10)];
          uVar7 = uVar7 / 10;
          if (uVar7 == 0) {
            local_40 = 9;
          }
          else {
            local_10 = "0123456789"[(int)(uVar7 % 10)];
            uVar7 = uVar7 / 10;
            if (uVar7 == 0) {
              local_40 = 8;
            }
            else {
              local_11 = "0123456789"[(int)(uVar7 % 10)];
              uVar7 = uVar7 / 10;
              if (uVar7 == 0) {
                local_40 = 7;
              }
              else {
                local_12 = "0123456789"[(int)(uVar7 % 10)];
                uVar7 = uVar7 / 10;
                if (uVar7 == 0) {
                  local_40 = 6;
                }
                else {
                  local_13 = "0123456789"[(int)(uVar7 % 10)];
                  uVar7 = uVar7 / 10;
                  if (uVar7 == 0) {
                    local_40 = 5;
                  }
                  else {
                    local_14 = "0123456789"[(int)(uVar7 % 10)];
                    uVar7 = uVar7 / 10;
                    if (uVar7 == 0) {
                      local_40 = 4;
                    }
                    else {
                      acStack_18[3] = "0123456789"[(int)(uVar7 % 10)];
                      if (uVar7 / 10 == 0) {
                        local_40 = 3;
                      }
                      else {
                        local_40 = 2;
                        acStack_18[2] = "0123456789"[(int)(uVar7 / 10)];
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
      iVar19 = 5;
      uVar7 = 0xc - local_40;
      local_34 = 0;
      iVar21 = iVar6;
    }
  }
  iVar21 = iVar21 + *(int *)(param_2 + 0x38);
  if ((*(char *)((long)param_1 + 0x13c) == '\0') && ((long)param_1[0x1a] < (long)iVar21)) {
    natsMutex_Unlock(*param_1);
    uVar14 = nats_setErrorReal("/home/ubuntu/src/frankenfirmware/build/_deps/nats.c-src/src/pub.c",
                               "natsConn_publish",0x86,0x15,
                               "Payload %d greater than maximum allowed: %ld",iVar21,param_1[0x1a]);
    uVar14 = uVar14 & 0xffffffff;
  }
  else {
    bVar5 = natsConn_isReconnecting(param_1);
    if ((bVar5 == 0) || (*(int *)(param_1[0x11] + 0x10) < *(int *)(param_1[1] + 0x48))) {
      if (iVar21 < 1) {
        local_44 = 1;
        local_38 = 0xb;
        local_1d = '0';
      }
      else {
        uVar8 = iVar21 / 10;
        local_1d = "0123456789"[iVar21 % 10];
        if (uVar8 == 0) {
          local_38 = 0xb;
        }
        else {
          local_1e = "0123456789"[(int)(uVar8 % 10)];
          uVar8 = uVar8 / 10;
          if (uVar8 == 0) {
            local_38 = 10;
          }
          else {
            local_1f = "0123456789"[(int)(uVar8 % 10)];
            uVar8 = uVar8 / 10;
            if (uVar8 == 0) {
              local_38 = 9;
            }
            else {
              local_20 = "0123456789"[(int)(uVar8 % 10)];
              uVar8 = uVar8 / 10;
              if (uVar8 == 0) {
                local_38 = 8;
              }
              else {
                local_21 = "0123456789"[(int)(uVar8 % 10)];
                uVar8 = uVar8 / 10;
                if (uVar8 == 0) {
                  local_38 = 7;
                }
                else {
                  local_22 = "0123456789"[(int)(uVar8 % 10)];
                  uVar8 = uVar8 / 10;
                  if (uVar8 == 0) {
                    local_38 = 6;
                  }
                  else {
                    local_23 = "0123456789"[(int)(uVar8 % 10)];
                    uVar8 = uVar8 / 10;
                    if (uVar8 == 0) {
                      local_38 = 5;
                    }
                    else {
                      local_24 = "0123456789"[(int)(uVar8 % 10)];
                      uVar8 = uVar8 / 10;
                      if (uVar8 == 0) {
                        local_38 = 4;
                      }
                      else {
                        acStack_28[3] = "0123456789"[(int)(uVar8 % 10)];
                        if (uVar8 / 10 == 0) {
                          local_38 = 3;
                        }
                        else {
                          local_38 = 2;
                          acStack_28[2] = "0123456789"[(int)(uVar8 / 10)];
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
        local_44 = 0xc - local_38;
      }
      iVar19 = iVar19 + (int)sVar10 + 1;
      iVar9 = iVar19 + iVar20 + 1;
      if (iVar20 < 1) {
        iVar9 = iVar19;
      }
      iVar19 = iVar9 + uVar7 + 1 + iVar6;
      if (iVar6 < 1) {
        iVar19 = iVar9;
      }
      iVar19 = iVar19 + local_44 + 2;
      natsBuf_MoveTo(param_1[0x14],5);
      lVar12 = param_1[0x14];
      if (*(int *)(lVar12 + 0x14) < iVar19) {
        iVar9 = natsBuf_Expand(lVar12,(int)((double)iVar19 * _DAT_001665f8));
        if (iVar9 == 0) {
          lVar12 = param_1[0x14];
          goto LAB_0014cf1c;
        }
LAB_0014ceb8:
        uVar13 = *param_1;
      }
      else {
LAB_0014cf1c:
        iVar9 = natsBuf_Append(lVar12,*(undefined8 *)(param_2 + 0x10),sVar10 & 0xffffffff);
        if (iVar9 != 0) goto LAB_0014ceb8;
        iVar9 = natsBuf_Append(param_1[0x14]," ",1);
        if (iVar9 == 0 && param_3 != (char *)0x0) {
          iVar9 = natsBuf_Append(param_1[0x14],param_3,iVar20);
          if (iVar9 != 0) goto LAB_0014ceb8;
          iVar9 = natsBuf_Append(param_1[0x14]," ",1);
        }
        bVar1 = 0 < iVar6;
        bVar3 = iVar9 == 0;
        if (bVar1 && bVar3) {
          iVar9 = natsBuf_Append(param_1[0x14],acStack_18 + local_40,uVar7);
          if (iVar9 != 0) goto LAB_0014ceb8;
          iVar9 = natsBuf_Append(param_1[0x14]," ",1);
          bVar1 = bVar1 && bVar3;
        }
        if ((iVar9 != 0) ||
           (iVar9 = natsBuf_Append(param_1[0x14],acStack_28 + local_38,local_44), iVar9 != 0))
        goto LAB_0014ceb8;
        iVar9 = natsBuf_Append(param_1[0x14],"\r\n",2);
        if (iVar9 == 0 && bVar1) {
          iVar9 = natsMsgHeader_encode(param_1[0x14],param_2);
        }
        if (iVar9 != 0) goto LAB_0014ceb8;
        if (bVar5 == 0) {
          if (0 < *(long *)(param_1[1] + 0x50)) {
            natsDeadline_Init(param_1 + 8);
          }
          iVar9 = natsConn_bufferWrite(param_1,*(long *)param_1[0x14] + (long)local_34,iVar19);
          if ((iVar9 == 0) &&
             (iVar9 = natsConn_bufferWrite
                                (param_1,*(undefined8 *)(param_2 + 0x30),
                                 *(undefined4 *)(param_2 + 0x38)), iVar9 == 0)) {
            iVar9 = natsConn_bufferWrite(param_1,"\r\n",2);
            goto LAB_0014d1a8;
          }
          goto LAB_0014ceb8;
        }
        uVar2 = *(undefined4 *)(param_1[0x11] + 0x10);
        iVar9 = natsConn_bufferWrite(param_1,*(long *)param_1[0x14] + (long)local_34,iVar19);
        if (((iVar9 == 0) &&
            (iVar9 = natsConn_bufferWrite
                               (param_1,*(undefined8 *)(param_2 + 0x30),
                                *(undefined4 *)(param_2 + 0x38)), iVar9 == 0)) &&
           (iVar9 = natsConn_bufferWrite(param_1,"\r\n",2), iVar9 == 0 || bVar5 == 0)) {
LAB_0014d1a8:
          if ((iVar9 == 0 & (bVar5 ^ 1)) != 0) {
            if (param_4 == '\0') {
              iVar9 = natsConn_flushOrKickFlusher(param_1);
            }
            else {
              iVar9 = natsConn_bufferFlush();
            }
          }
          uVar13 = *param_1;
          if (iVar9 == 0) {
            param_1[0x5e] = param_1[0x5e] + (long)iVar21;
            param_1[0x5c] = param_1[0x5c] + 1;
            natsMutex_Unlock(uVar13);
            uVar14 = 0;
            goto LAB_0014cedc;
          }
        }
        else {
          natsBuf_MoveTo(param_1[0x11],uVar2);
          uVar13 = *param_1;
        }
      }
      natsMutex_Unlock(uVar13);
      uVar14 = nats_updateErrStack(iVar9,"natsConn_publish");
      uVar14 = uVar14 & 0xffffffff;
    }
    else {
      natsMutex_Unlock(*param_1);
      uVar13 = natsStatus_GetText(0x17);
      uVar14 = nats_setErrorReal("/home/ubuntu/src/frankenfirmware/build/_deps/nats.c-src/src/pub.c"
                                 ,"natsConn_publish",0x93,0x17,"%s",uVar13);
      uVar14 = uVar14 & 0xffffffff;
    }
  }
LAB_0014cedc:
  puVar15 = PTR___stack_chk_guard_00187fa0;
  puVar16 = (undefined *)(local_8 - *(long *)PTR___stack_chk_guard_00187fa0);
  if ((undefined *)(local_8 - *(long *)PTR___stack_chk_guard_00187fa0) == (undefined *)0x0) {
    return uVar14;
  }
LAB_0014d348:
                    /* WARNING: Subroutine does not return */
  __stack_chk_fail(puVar15,puVar16,uVar14);
}


