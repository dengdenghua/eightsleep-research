/* Ghidra static pseudocode; not original source. */

void FUN_001afe00(long *param_1)

{
  long *plVar1;
  ulong uVar2;
  undefined1 auVar3 [16];
  undefined1 auVar4 [16];
  undefined4 uVar5;
  code *pcVar6;
  char cVar7;
  int iVar8;
  long lVar9;
  undefined8 uVar10;
  int *piVar11;
  void *pvVar12;
  long lVar13;
  long lVar14;
  undefined8 uVar15;
  long *plVar16;
  long lVar17;
  undefined4 local_1c;
  timespec local_18;
  long local_8;
  
  local_8 = *(long *)PTR___stack_chk_guard_005df758;
  jsPubOptions_Init(param_1 + 2,PTR___stack_chk_guard_005df758,0);
  lVar9 = std::chrono::_V2::steady_clock::now();
LAB_001afe60:
  do {
    cVar7 = (char)param_1[0x10];
    while( true ) {
      if (cVar7 == '\0') {
        if (local_8 - *(long *)PTR___stack_chk_guard_005df758 == 0) {
          return;
        }
                    /* WARNING: Subroutine does not return */
        __stack_chk_fail(PTR___stack_chk_guard_005df758,
                         local_8 - *(long *)PTR___stack_chk_guard_005df758,0);
      }
      cVar7 = FUN_001970e0(param_1);
      if (cVar7 == '\0') {
        local_18.tv_sec = 1;
        local_18.tv_nsec = 0;
        goto LAB_001b00e0;
      }
      plVar16 = param_1 + 0xb0;
      if (param_1[0xa0] == *plVar16) break;
      lVar14 = *plVar16;
      if ((lVar14 == param_1[0xb8]) &&
         (lVar17 = param_1[0xa0], param_1[0xb8] = lVar17, lVar14 == lVar17)) goto LAB_001b030c;
      lVar17 = param_1[0x99];
      lVar14 = (lVar14 + 1) * 0x40;
      iVar8 = natsConnection_Publish
                        (*param_1,*(undefined8 *)(lVar17 + lVar14),
                         *(undefined8 *)(lVar17 + lVar14 + 0x20),
                         *(undefined4 *)(lVar17 + lVar14 + 0x28));
      if ((iVar8 == 0) && (iVar8 = natsConnection_Flush(*param_1), iVar8 == 0)) {
        lVar14 = *plVar16 + 1;
        lVar13 = param_1[0x99];
        lVar17 = lVar13 + lVar14 * 0x40;
        if (*(void **)(lVar17 + 0x20) != (void *)(lVar17 + 0x30)) {
          operator_delete(*(void **)(lVar17 + 0x20),*(long *)(lVar17 + 0x30) + 1);
        }
        pvVar12 = *(void **)(lVar13 + lVar14 * 0x40);
        if (pvVar12 != (void *)(lVar17 + 0x10)) {
          operator_delete(pvVar12,*(long *)(lVar17 + 0x10) + 1);
        }
        if (lVar14 == param_1[0x98]) {
          lVar14 = 0;
        }
        *plVar16 = lVar14;
        goto LAB_001afe60;
      }
      uVar15 = *(undefined8 *)(lVar17 + lVar14);
      uVar10 = natsStatus_GetText();
      FUN_001965f0(PTR_DAT_005df810,0x165,&DAT_004621d8,
                   "/usr/src/debug/frank/0.1-r0/git/submodules/native-utils/inc/raw_nats_worker.h",
                   "[nats_worker] failed to publish core msg to %s: %s",uVar15,uVar10);
      nats_PrintLastErrorStack(*(undefined8 *)PTR_stderr_005dff60);
      if (param_1[0xb] != 0) {
        kvStore_Destroy();
        param_1[0xb] = 0;
        param_1[0xd] = 0;
        *(undefined1 *)param_1[0xc] = 0;
      }
      if (param_1[1] != 0) {
        jsCtx_Destroy();
        param_1[1] = 0;
      }
      if (*param_1 != 0) {
        natsConnection_Flush();
        natsConnection_Destroy(*param_1);
        *param_1 = 0;
      }
      local_18.tv_sec = 1;
      local_18.tv_nsec = 0;
      do {
        iVar8 = nanosleep(&local_18,&local_18);
        if (iVar8 != -1) goto LAB_001afe60;
        piVar11 = __errno_location();
      } while (*piVar11 == 4);
      cVar7 = (char)param_1[0x10];
    }
    lVar14 = std::chrono::_V2::steady_clock::now();
    if (lVar14 < param_1[0xd3]) {
LAB_001b0034:
      lVar14 = 0;
      goto LAB_001b003c;
    }
    if (param_1[0xd2] * 1000000 - (lVar14 - lVar9) == 0 || param_1[0xd2] * 1000000 < lVar14 - lVar9)
    {
      cVar7 = FUN_0019feb0(param_1);
      lVar9 = lVar14;
      if (cVar7 != '\0') {
        iVar8 = FUN_001af7c0(param_1);
        goto joined_r0x001b0264;
      }
      if ((*param_1 == 0) || (iVar8 = natsConnection_Status(), iVar8 != 2)) {
        if (param_1[0xb] != 0) {
          kvStore_Destroy();
          param_1[0xb] = 0;
          param_1[0xd] = 0;
          *(undefined1 *)param_1[0xc] = 0;
        }
        if (param_1[1] != 0) {
          jsCtx_Destroy();
          param_1[1] = 0;
        }
        if (*param_1 != 0) {
          natsConnection_Flush();
          natsConnection_Destroy(*param_1);
          *param_1 = 0;
        }
        local_18.tv_sec = 1;
        local_18.tv_nsec = 0;
        goto LAB_001b0454;
      }
    }
    else {
      iVar8 = FUN_001af7c0(param_1);
joined_r0x001b0264:
      if (iVar8 != 2) {
        if (iVar8 != 1) goto LAB_001b0034;
        goto LAB_001afe60;
      }
      if ((*param_1 == 0) || (iVar8 = natsConnection_Status(), lVar14 = lVar9, iVar8 != 2)) {
        if (param_1[0xb] != 0) {
          kvStore_Destroy();
          param_1[0xb] = 0;
          param_1[0xd] = 0;
          *(undefined1 *)param_1[0xc] = 0;
        }
        if (param_1[1] != 0) {
          jsCtx_Destroy();
          param_1[1] = 0;
        }
        if (*param_1 != 0) {
          natsConnection_Flush();
          natsConnection_Destroy(*param_1);
          *param_1 = 0;
        }
        local_18.tv_sec = 1;
        local_18.tv_nsec = 0;
        goto LAB_001b02e0;
      }
    }
    lVar9 = std::chrono::_V2::steady_clock::now();
    param_1[0xd3] = lVar9 + 5000000000;
    lVar9 = lVar14;
  } while( true );
  while (piVar11 = __errno_location(), *piVar11 == 4) {
LAB_001b00e0:
    iVar8 = nanosleep(&local_18,&local_18);
    if (iVar8 != -1) break;
  }
  goto LAB_001afe60;
  while (lVar14 = lVar14 + 1, lVar14 != 3) {
LAB_001b003c:
    uVar2 = lVar14 + param_1[0x93];
    auVar3._8_8_ = 0;
    auVar3._0_8_ = uVar2;
    lVar17 = uVar2 - ((SUB168(auVar3 * ZEXT816(0xaaaaaaaaaaaaaaab),8) & 0xfffffffffffffffe) +
                     uVar2 / 3);
    if (*(long *)(param_1[lVar17 + 0x90] + 0x40) != *(long *)(param_1[lVar17 + 0x90] + 0xc0)) {
      plVar16 = (long *)param_1[lVar17 + 0x90];
      if (plVar16 != (long *)0x0) {
        plVar1 = plVar16 + 0x18;
        lVar14 = *plVar1;
        if ((lVar14 == plVar16[0x20]) && (plVar16[0x20] = plVar16[8], lVar14 == plVar16[8])) {
LAB_001b030c:
                    /* WARNING: Does not return */
          pcVar6 = (code *)SoftwareBreakpoint(1000,0x1b0318);
          (*pcVar6)();
        }
        lVar14 = lVar14 * 0x38 + 0x70;
        lVar13 = plVar16[1] + lVar14;
        uVar10 = *(undefined8 *)(lVar13 + 0x20);
        iVar8 = js_Publish(param_1 + 10,param_1[1],*(undefined8 *)(plVar16[1] + lVar14),uVar10,
                           (int)*(undefined8 *)(lVar13 + 0x28) - (int)uVar10,param_1 + 2,&local_1c);
        uVar5 = local_1c;
        if (iVar8 == 0) {
          lVar14 = *plVar1;
          lVar13 = plVar16[1] + lVar14 * 0x38 + 0x70;
          pvVar12 = *(void **)(lVar13 + 0x20);
          if (pvVar12 != (void *)0x0) {
            operator_delete(pvVar12,*(long *)(lVar13 + 0x30) - (long)pvVar12);
          }
          FUN_001998f0(lVar13);
          lVar14 = lVar14 + 1;
          if (lVar14 == *plVar16) {
            lVar14 = 0;
          }
          *plVar1 = lVar14;
          uVar2 = lVar17 + 1;
          auVar4._8_8_ = 0;
          auVar4._0_8_ = uVar2;
          param_1[0x93] =
               uVar2 - ((SUB168(auVar4 * ZEXT816(0xaaaaaaaaaaaaaaab),8) & 0xfffffffffffffffe) +
                       uVar2 / 3);
          jsPubAck_Destroy(param_1[10]);
          param_1[10] = 0;
          goto LAB_001afe60;
        }
        uVar10 = natsStatus_GetText();
        FUN_001965f0(PTR_DAT_005df810,0x1a5,&DAT_004621d8,
                     "/usr/src/debug/frank/0.1-r0/git/submodules/native-utils/inc/raw_nats_worker.h"
                     ,"[nats_worker] failed to publish (%lu): %s",uVar5,uVar10);
        nats_PrintLastErrorStack(*(undefined8 *)PTR_stderr_005dff60);
        if (param_1[0xb] != 0) {
          kvStore_Destroy();
          param_1[0xb] = 0;
          param_1[0xd] = 0;
          *(undefined1 *)param_1[0xc] = 0;
        }
        if (param_1[1] != 0) {
          jsCtx_Destroy();
          param_1[1] = 0;
        }
        if (*param_1 != 0) {
          natsConnection_Flush();
          natsConnection_Destroy(*param_1);
          *param_1 = 0;
        }
        local_18.tv_sec = 1;
        local_18.tv_nsec = 0;
        goto LAB_001b03c0;
      }
      break;
    }
  }
  local_18.tv_sec = 0;
  local_18.tv_nsec = 100000000;
  do {
    iVar8 = nanosleep(&local_18,&local_18);
    if (iVar8 != -1) break;
    piVar11 = __errno_location();
  } while (*piVar11 == 4);
  goto LAB_001afe60;
  while (piVar11 = __errno_location(), *piVar11 == 4) {
LAB_001b03c0:
    iVar8 = nanosleep(&local_18,&local_18);
    if (iVar8 != -1) break;
  }
  goto LAB_001afe60;
  while (piVar11 = __errno_location(), *piVar11 == 4) {
LAB_001b02e0:
    iVar8 = nanosleep(&local_18,&local_18);
    if (iVar8 != -1) break;
  }
  goto LAB_001afe60;
  while (piVar11 = __errno_location(), *piVar11 == 4) {
LAB_001b0454:
    iVar8 = nanosleep(&local_18,&local_18);
    if (iVar8 != -1) break;
  }
  goto LAB_001afe60;
}


