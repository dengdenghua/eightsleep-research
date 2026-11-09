/* Ghidra static pseudocode; not original source. Read-only project; no target execution. */

undefined8 FUN_001af7c0(void *param_1)

{
  void *pvVar1;
  bool bVar2;
  int iVar3;
  uint uVar4;
  _Rb_tree_node_base *p_Var5;
  _Rb_tree_node_base *p_Var6;
  _Rb_tree_node_base *p_Var7;
  ulong uVar8;
  _Rb_tree_node_base *p_Var9;
  _Rb_tree_node_base *p_Var10;
  size_t sVar11;
  ulong uVar12;
  long lVar13;
  undefined8 uVar14;
  undefined8 uVar15;
  undefined8 uVar16;
  _Rb_tree_node_base *p_Var17;
  undefined1 auVar18 [16];
  undefined1 auStack_a8 [8];
  undefined4 local_a0 [2];
  _Rb_tree_node_base *local_98;
  _Rb_tree_node_base *local_90;
  _Rb_tree_node_base *local_88;
  undefined8 uStack_80;
  long local_78;
  _Rb_tree_node_base *local_70;
  undefined8 local_68;
  undefined8 local_28;
  undefined4 local_20;
  long local_8;
  
  local_8 = *(long *)PTR___stack_chk_guard_005df758;
  local_a0[0] = 0;
  local_98 = (_Rb_tree_node_base *)0x0;
  uStack_80 = 0;
  if (PTR___pthread_key_create_005dfdb8 == (undefined *)0x0) {
    local_78 = 0;
LAB_001afbf8:
    p_Var6 = (_Rb_tree_node_base *)0x0;
    local_70 = (_Rb_tree_node_base *)0x0;
  }
  else {
    local_90 = (_Rb_tree_node_base *)local_a0;
    local_88 = (_Rb_tree_node_base *)local_a0;
    iVar3 = pthread_mutex_lock((pthread_mutex_t *)((long)param_1 + 0x600));
    if (iVar3 != 0) {
      std::__throw_system_error(iVar3);
      __cxa_begin_catch();
      operator_delete(param_1,0xa0);
      uVar14 = __cxa_rethrow();
      FUN_00191ce0(local_98);
                    /* WARNING: Subroutine does not return */
      _Unwind_Resume(uVar14);
    }
    local_78 = (long)local_98;
    local_70 = local_88;
    if (local_98 == (_Rb_tree_node_base *)0x0) goto LAB_001afbf8;
    p_Var9 = *(_Rb_tree_node_base **)(local_88 + 0x10);
    *(undefined8 *)((long)local_98 + 8) = 0;
    p_Var6 = local_98;
    if (p_Var9 != (_Rb_tree_node_base *)0x0) {
      local_70 = p_Var9;
    }
  }
  local_98 = (_Rb_tree_node_base *)0x0;
  uStack_80 = 0;
  local_90 = (_Rb_tree_node_base *)local_a0;
  local_88 = (_Rb_tree_node_base *)local_a0;
  local_68 = auStack_a8;
  if (*(long *)((long)param_1 + 0x640) != 0) {
    local_98 = (_Rb_tree_node_base *)
               FUN_001af480(*(long *)((long)param_1 + 0x640),(_Rb_tree_node_base *)local_a0,
                            &local_78);
    p_Var6 = local_98;
    do {
      local_90 = p_Var6;
      p_Var9 = local_98;
      p_Var6 = *(_Rb_tree_node_base **)(local_90 + 0x10);
    } while (*(_Rb_tree_node_base **)(local_90 + 0x10) != (_Rb_tree_node_base *)0x0);
    do {
      local_88 = p_Var9;
      p_Var9 = *(_Rb_tree_node_base **)(local_88 + 0x18);
    } while (*(_Rb_tree_node_base **)(local_88 + 0x18) != (_Rb_tree_node_base *)0x0);
    uStack_80 = *(undefined8 *)((long)param_1 + 0x658);
    p_Var6 = (_Rb_tree_node_base *)local_78;
  }
  FUN_00191ce0(p_Var6);
  if (PTR___pthread_key_create_005dfdb8 != (undefined *)0x0) {
    pthread_mutex_unlock((pthread_mutex_t *)((long)param_1 + 0x600));
  }
  if (local_90 != (_Rb_tree_node_base *)local_a0) {
    p_Var5 = *(_Rb_tree_node_base **)((long)param_1 + 0x670);
    p_Var6 = (_Rb_tree_node_base *)((long)param_1 + 0x668);
    p_Var9 = local_90;
    do {
      if (p_Var5 == (_Rb_tree_node_base *)0x0) {
LAB_001af978:
        lVar13 = *(long *)((long)param_1 + 0x58);
        if (lVar13 == 0) {
LAB_001af9ac:
          iVar3 = js_KeyValue((long)param_1 + 0x58,*(undefined8 *)((long)param_1 + 8),
                              *(undefined8 *)(p_Var9 + 0x40));
          if (iVar3 != 0) {
            kvConfig_Init(&local_78);
            local_78 = *(long *)(p_Var9 + 0x40);
            local_68._0_5_ = CONCAT14(1,(undefined4)local_68);
            iVar3 = js_CreateKeyValue((long)param_1 + 0x58,*(undefined8 *)((long)param_1 + 8),
                                      &local_78);
            if (iVar3 != 0) {
              uVar15 = *(undefined8 *)(p_Var9 + 0x40);
              uVar14 = natsStatus_GetText();
              FUN_001965f0(PTR_DAT_005df810,0x8f,"ensureKvStore",
                           "/usr/src/debug/frank/0.1-r0/git/submodules/native-utils/inc/raw_nats_worker.h"
                           ,"[nats_worker] failed to open/create KV bucket %s: %s",uVar15,uVar14);
              nats_PrintLastErrorStack(*(undefined8 *)PTR_stderr_005dff60);
              uVar14 = 2;
              *(undefined8 *)((long)param_1 + 0x58) = 0;
              goto LAB_001afabc;
            }
          }
          std::__cxx11::string::_M_assign
                    ((string *)((long)param_1 + 0x60),(string *)(p_Var9 + 0x40));
        }
        else {
          sVar11 = *(size_t *)((long)param_1 + 0x68);
          if ((sVar11 != *(size_t *)(p_Var9 + 0x48)) ||
             ((sVar11 != 0 &&
              (iVar3 = memcmp(*(void **)((long)param_1 + 0x60),*(void **)(p_Var9 + 0x40),sVar11),
              iVar3 != 0)))) {
            kvStore_Destroy(lVar13);
            *(undefined8 *)((long)param_1 + 0x58) = 0;
            *(undefined8 *)((long)param_1 + 0x68) = 0;
            **(undefined1 **)((long)param_1 + 0x60) = 0;
            goto LAB_001af9ac;
          }
        }
        FUN_0019faa0(&local_28);
        local_78 = 0;
        iVar3 = kvStore_Put(&local_78,*(undefined8 *)((long)param_1 + 0x58),
                            *(undefined8 *)(p_Var9 + 0x60),local_28,local_20);
        if (iVar3 != 0) {
          uVar15 = *(undefined8 *)(p_Var9 + 0x40);
          uVar16 = *(undefined8 *)(p_Var9 + 0x60);
          uVar14 = natsStatus_GetText();
          FUN_001965f0(PTR_DAT_005df810,0x10b,"writePendingState",
                       "/usr/src/debug/frank/0.1-r0/git/submodules/native-utils/inc/raw_nats_worker.h"
                       ,"[nats_worker] failed to put KV %s/%s: %s",uVar15,uVar16,uVar14);
          nats_PrintLastErrorStack(*(undefined8 *)PTR_stderr_005dff60);
          uVar14 = 2;
          goto LAB_001afab4;
        }
        p_Var5 = p_Var6;
        if (*(_Rb_tree_node_base **)((long)param_1 + 0x670) == (_Rb_tree_node_base *)0x0)
        goto LAB_001afc5c;
        pvVar1 = *(void **)(p_Var9 + 0x20);
        uVar8 = *(ulong *)(p_Var9 + 0x28);
        p_Var17 = *(_Rb_tree_node_base **)((long)param_1 + 0x670);
        goto LAB_001afa20;
      }
      pvVar1 = *(void **)(p_Var9 + 0x20);
      uVar8 = *(ulong *)(p_Var9 + 0x28);
      p_Var17 = p_Var6;
      p_Var7 = p_Var5;
      do {
        while( true ) {
          uVar12 = *(ulong *)(p_Var7 + 0x28);
          sVar11 = uVar12;
          if (uVar8 < uVar12) {
            sVar11 = uVar8;
          }
          if ((sVar11 != 0) && (iVar3 = memcmp(*(void **)(p_Var7 + 0x20),pvVar1,sVar11), iVar3 != 0)
             ) break;
          lVar13 = uVar12 - uVar8;
          if (lVar13 < 0x80000000) {
            if (lVar13 < -0x80000000) goto LAB_001afb08;
            iVar3 = (int)lVar13;
            if (iVar3 != 0) break;
          }
LAB_001af93c:
          p_Var10 = p_Var7 + 0x10;
          p_Var17 = p_Var7;
          p_Var7 = *(_Rb_tree_node_base **)p_Var10;
          if (*(_Rb_tree_node_base **)p_Var10 == (_Rb_tree_node_base *)0x0) goto LAB_001af948;
        }
        if (-1 < iVar3) goto LAB_001af93c;
LAB_001afb08:
        p_Var7 = *(_Rb_tree_node_base **)(p_Var7 + 0x18);
      } while (p_Var7 != (_Rb_tree_node_base *)0x0);
LAB_001af948:
      if ((((p_Var6 == p_Var17) ||
           (uVar4 = FUN_00181710(pvVar1,uVar8,*(undefined8 *)(p_Var17 + 0x20),
                                 *(undefined8 *)(p_Var17 + 0x28)), (uVar4 >> 7 & 1) != 0)) ||
          (sVar11 = *(size_t *)(p_Var17 + 0x88), sVar11 != *(size_t *)(p_Var9 + 0x88))) ||
         ((sVar11 != 0 &&
          (iVar3 = memcmp(*(void **)(p_Var17 + 0x80),*(void **)(p_Var9 + 0x80),sVar11), iVar3 != 0))
         )) goto LAB_001af978;
      p_Var9 = (_Rb_tree_node_base *)std::_Rb_tree_increment(p_Var9);
    } while (p_Var9 != (_Rb_tree_node_base *)local_a0);
  }
  uVar14 = 0;
  goto LAB_001afabc;
LAB_001afa20:
  do {
    uVar12 = *(ulong *)(p_Var17 + 0x28);
    sVar11 = uVar12;
    if (uVar8 < uVar12) {
      sVar11 = uVar8;
    }
    if ((sVar11 == 0) || (iVar3 = memcmp(*(void **)(p_Var17 + 0x20),pvVar1,sVar11), iVar3 == 0)) {
      lVar13 = uVar12 - uVar8;
      if (lVar13 < 0x80000000) {
        if (lVar13 < -0x80000000) goto LAB_001afb9c;
        iVar3 = (int)lVar13;
        if (iVar3 != 0) goto LAB_001afb98;
      }
    }
    else {
LAB_001afb98:
      if (iVar3 < 0) {
LAB_001afb9c:
        p_Var17 = *(_Rb_tree_node_base **)(p_Var17 + 0x18);
        if (p_Var17 == (_Rb_tree_node_base *)0x0) break;
        goto LAB_001afa20;
      }
    }
    p_Var7 = p_Var17 + 0x10;
    p_Var5 = p_Var17;
    p_Var17 = *(_Rb_tree_node_base **)p_Var7;
  } while (*(_Rb_tree_node_base **)p_Var7 != (_Rb_tree_node_base *)0x0);
  if (p_Var5 == p_Var6) {
LAB_001afc5c:
    p_Var7 = operator_new(0xa0);
    FUN_00198030(p_Var7 + 0x20,p_Var9 + 0x20);
    p_Var17 = p_Var7 + 0x40;
    *(undefined8 *)(p_Var7 + 0x40) = 0;
    *(undefined8 *)(p_Var7 + 0x48) = 0;
    *(undefined8 *)(p_Var7 + 0x50) = 0;
    *(undefined8 *)(p_Var7 + 0x58) = 0;
    *(undefined8 *)(p_Var7 + 0x60) = 0;
    *(undefined8 *)(p_Var7 + 0x68) = 0;
    *(undefined8 *)(p_Var7 + 0x70) = 0;
    *(undefined8 *)(p_Var7 + 0x78) = 0;
    *(undefined8 *)(p_Var7 + 0x80) = 0;
    *(undefined8 *)(p_Var7 + 0x88) = 0;
    *(undefined8 *)(p_Var7 + 0x90) = 0;
    *(undefined8 *)(p_Var7 + 0x98) = 0;
    *(_Rb_tree_node_base **)(p_Var7 + 0x40) = p_Var7 + 0x50;
    *(undefined8 *)(p_Var7 + 0x48) = 0;
    p_Var7[0x50] = (_Rb_tree_node_base)0x0;
    *(_Rb_tree_node_base **)(p_Var7 + 0x60) = p_Var7 + 0x70;
    *(undefined8 *)(p_Var7 + 0x68) = 0;
    p_Var7[0x70] = (_Rb_tree_node_base)0x0;
    *(_Rb_tree_node_base **)(p_Var7 + 0x80) = p_Var7 + 0x90;
    *(undefined8 *)(p_Var7 + 0x88) = 0;
    p_Var7[0x90] = (_Rb_tree_node_base)0x0;
    auVar18 = FUN_001abf80((long)param_1 + 0x660,p_Var5,p_Var7 + 0x20);
    p_Var10 = auVar18._8_8_;
    p_Var5 = auVar18._0_8_;
    if (p_Var10 == (_Rb_tree_node_base *)0x0) {
      if (*(_Rb_tree_node_base **)(p_Var7 + 0x20) != p_Var7 + 0x30) {
        operator_delete(*(_Rb_tree_node_base **)(p_Var7 + 0x20),*(long *)(p_Var7 + 0x30) + 1);
      }
      p_Var17 = p_Var5 + 0x40;
      operator_delete(p_Var7,0xa0);
    }
    else {
      bVar2 = p_Var5 != (_Rb_tree_node_base *)0x0 || p_Var10 == p_Var6;
      if (p_Var5 == (_Rb_tree_node_base *)0x0 && p_Var10 != p_Var6) {
        uVar8 = FUN_00181710(*(undefined8 *)(p_Var7 + 0x20),*(undefined8 *)(p_Var7 + 0x28),
                             *(undefined8 *)(p_Var10 + 0x20),*(undefined8 *)(p_Var10 + 0x28));
        bVar2 = (bool)((byte)(uVar8 >> 7) & 1);
      }
      std::_Rb_tree_insert_and_rebalance(bVar2,p_Var7,p_Var10,p_Var6);
      *(long *)((long)param_1 + 0x688) = *(long *)((long)param_1 + 0x688) + 1;
      p_Var5 = p_Var7;
    }
  }
  else {
    p_Var17 = p_Var5 + 0x40;
    uVar4 = FUN_00181710(pvVar1,uVar8,*(undefined8 *)(p_Var5 + 0x20),*(undefined8 *)(p_Var5 + 0x28))
    ;
    if ((uVar4 >> 7 & 1) != 0) goto LAB_001afc5c;
  }
  std::__cxx11::string::_M_assign((string *)p_Var17,(string *)(p_Var9 + 0x40));
  std::__cxx11::string::_M_assign((string *)(p_Var5 + 0x60),(string *)(p_Var9 + 0x60));
  std::__cxx11::string::_M_assign((string *)(p_Var17 + 0x40),(string *)(p_Var9 + 0x80));
  uVar14 = 1;
LAB_001afab4:
  FUN_001998f0(&local_28);
LAB_001afabc:
  FUN_00191ce0(local_98);
  if (local_8 - *(long *)PTR___stack_chk_guard_005df758 != 0) {
                    /* WARNING: Subroutine does not return */
    __stack_chk_fail(PTR___stack_chk_guard_005df758,
                     local_8 - *(long *)PTR___stack_chk_guard_005df758,0);
  }
  return uVar14;
}


