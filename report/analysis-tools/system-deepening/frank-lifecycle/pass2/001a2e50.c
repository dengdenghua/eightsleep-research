/* Ghidra static pseudocode; not original source. Read-only project; no target execution. */

void FUN_001a2e50(long *param_1)

{
  uint uVar1;
  uint uVar2;
  int iVar3;
  void *pvVar4;
  long *plVar5;
  char *__s1;
  logic_error *plVar6;
  undefined8 uVar7;
  long lVar8;
  long lVar9;
  long lVar10;
  pthread_mutex_t *unaff_x26;
  uint local_28 [2];
  undefined8 local_20;
  undefined **local_18 [2];
  long local_8;
  
  local_8 = *(long *)PTR___stack_chk_guard_005df758;
  pvVar4 = operator_new(0x48);
  uVar1 = pthread_mutex_init((pthread_mutex_t *)((long)pvVar4 + 8),(pthread_mutexattr_t *)0x0);
  plVar5 = (long *)(ulong)uVar1;
  local_20 = FUN_00193f60();
  local_28[0] = uVar1;
  if (uVar1 == 0) {
    *param_1 = (long)pvVar4;
    *(long **)((long)pvVar4 + 0x38) = param_1;
    *(undefined8 *)((long)pvVar4 + 0x40) = 0;
    plVar5 = operator_new(0x108);
    unaff_x26 = (pthread_mutex_t *)(plVar5 + 6);
    *plVar5 = (long)&PTR_FUN_0058d6d8;
    plVar5[1] = 0;
    plVar5[2] = 0;
    plVar5[3] = (long)param_1;
    plVar5[4] = 0;
    *(undefined1 *)(plVar5 + 5) = 0;
    uVar1 = pthread_mutex_init((pthread_mutex_t *)(plVar5 + 7),(pthread_mutexattr_t *)0x0);
    local_20 = FUN_00193f60();
    local_28[0] = uVar1;
    if (uVar1 == 0) {
      *(undefined1 *)(plVar5 + 0xd) = 1;
      plVar5[0x15] = 0;
      uVar2 = pthread_condattr_init((pthread_condattr_t *)local_18);
      uVar1 = uVar2;
      if (uVar2 == 0) goto LAB_001a2f44;
      do {
        local_20 = FUN_00193f60(uVar2);
        local_28[0] = uVar1;
        while( true ) {
          FUN_001a01a0(local_28,"event");
LAB_001a2f44:
          uVar1 = pthread_condattr_setclock((pthread_condattr_t *)local_18,1);
          if (uVar1 != 0) break;
          uVar1 = pthread_cond_init((pthread_cond_t *)(plVar5 + 0xf),(pthread_condattr_t *)local_18)
          ;
          iVar3 = pthread_condattr_destroy((pthread_condattr_t *)local_18);
          local_20 = FUN_00193f60(iVar3);
          local_28[0] = uVar1;
          if (uVar1 == 0) {
            lVar9 = *param_1;
            lVar8 = *(long *)(lVar9 + 0x38);
            plVar5[0x16] = 0;
            plVar5[0x17] = (long)FUN_001a3660;
            plVar5[0x18] = 0;
            plVar5[0x19] = 0;
            *(undefined4 *)(plVar5 + 0x1a) = 0;
            *(undefined1 *)(plVar5 + 0x1b) = 1;
            plVar5[0x1c] = 0;
            plVar5[0x1d] = 0;
            plVar5[0x1e] = 0;
            *(undefined2 *)(plVar5 + 0x1f) = 0;
            *(undefined4 *)((long)plVar5 + 0xfc) = 0xffffffff;
            plVar5[0x20] = 0;
            if (lVar8 != plVar5[3]) {
              std::logic_error::logic_error
                        ((logic_error *)((pthread_condattr_t *)local_18)->__size,
                         "Invalid service owner.");
              local_18[0] = &PTR_FUN_005c7218;
              plVar6 = (logic_error *)__cxa_allocate_exception(0x10);
              std::logic_error::logic_error
                        (plVar6,(logic_error *)((pthread_condattr_t *)local_18)->__size);
              *(undefined ***)plVar6 = &PTR_FUN_005c7218;
                    /* WARNING: Subroutine does not return */
              __cxa_throw(plVar6,&PTR_vtable_005c6860,FUN_00190080);
            }
            pthread_mutex_lock((pthread_mutex_t *)(lVar9 + 8));
            lVar10 = *(long *)(lVar9 + 0x40);
            lVar8 = lVar10;
            while( true ) {
              if (lVar8 == 0) {
                plVar5[1] = (long)&PTR_vtable_005c6d38;
                plVar5[2] = 0;
                plVar5[4] = lVar10;
                *(long **)(lVar9 + 0x40) = plVar5;
                pthread_mutex_unlock((pthread_mutex_t *)(lVar9 + 8));
                param_1[1] = (long)plVar5;
                if (local_8 - *(long *)PTR___stack_chk_guard_005df758 == 0) {
                  return;
                }
                    /* WARNING: Subroutine does not return */
                __stack_chk_fail(PTR___stack_chk_guard_005df758,
                                 local_8 - *(long *)PTR___stack_chk_guard_005df758,0);
              }
              if ((*(long *)(lVar8 + 8) != 0) &&
                 ((__s1 = *(char **)(*(long *)(lVar8 + 8) + 8),
                  __s1 == "N4asio6detail14typeid_wrapperINS0_9schedulerEEE" ||
                  ((*__s1 != '*' &&
                   (iVar3 = strcmp(__s1,"N4asio6detail14typeid_wrapperINS0_9schedulerEEE"),
                   iVar3 == 0)))))) break;
              lVar8 = *(long *)(lVar8 + 0x20);
            }
            std::logic_error::logic_error
                      ((logic_error *)((pthread_condattr_t *)local_18)->__size,
                       "Service already exists.");
            local_18[0] = &PTR_FUN_005c71f0;
            plVar6 = (logic_error *)__cxa_allocate_exception(0x10);
            std::logic_error::logic_error
                      (plVar6,(logic_error *)((pthread_condattr_t *)local_18)->__size);
            *(undefined ***)plVar6 = &PTR_FUN_005c71f0;
                    /* WARNING: Subroutine does not return */
            __cxa_throw(plVar6,&PTR_vtable_005c6848,FUN_001900e0);
          }
        }
        uVar2 = pthread_condattr_destroy((pthread_condattr_t *)local_18);
      } while( true );
    }
    FUN_001a01a0(local_28,"mutex");
  }
  uVar7 = FUN_001a01a0(local_28,"mutex");
  pthread_mutex_unlock(unaff_x26);
  if (*(code **)(*plVar5 + 8) == FUN_001928e0) {
    FUN_00192710();
    operator_delete(plVar5,0x108);
  }
  else {
    (**(code **)(*plVar5 + 8))(plVar5);
  }
  FUN_001946b0(param_1);
                    /* WARNING: Subroutine does not return */
  _Unwind_Resume(uVar7);
}


