/* Ghidra static pseudocode; not original source. Read-only project; no target execution. */

void FUN_0019feb0(long param_1)

{
  int iVar1;
  undefined8 uVar2;
  size_t __n;
  _Rb_tree_node_base *p_Var3;
  undefined8 uVar4;
  undefined8 uVar5;
  long lVar6;
  undefined8 local_78 [2];
  undefined1 local_64;
  long *local_28;
  undefined4 local_20;
  long local_18 [2];
  long local_8;
  
  p_Var3 = *(_Rb_tree_node_base **)(param_1 + 0x678);
  local_8 = *(long *)PTR___stack_chk_guard_005df758;
  if (p_Var3 != (_Rb_tree_node_base *)(param_1 + 0x668)) {
    do {
      lVar6 = *(long *)(param_1 + 0x58);
      if (lVar6 == 0) {
LAB_0019ff48:
        iVar1 = js_KeyValue(param_1 + 0x58,*(undefined8 *)(param_1 + 8),
                            *(undefined8 *)(p_Var3 + 0x40));
        if (iVar1 == 0) {
LAB_0019ff88:
          std::__cxx11::string::_M_assign((string *)(param_1 + 0x60),(string *)(p_Var3 + 0x40));
          lVar6 = *(long *)(param_1 + 0x58);
          goto LAB_0019ff98;
        }
        kvConfig_Init(local_78);
        local_78[0] = *(undefined8 *)(p_Var3 + 0x40);
        local_64 = 1;
        iVar1 = js_CreateKeyValue(param_1 + 0x58,*(undefined8 *)(param_1 + 8),local_78);
        if (iVar1 == 0) goto LAB_0019ff88;
        uVar4 = *(undefined8 *)(p_Var3 + 0x40);
        uVar2 = natsStatus_GetText();
        FUN_001965f0(PTR_DAT_005df810,0x8f,"ensureKvStore",
                     "/usr/src/debug/frank/0.1-r0/git/submodules/native-utils/inc/raw_nats_worker.h"
                     ,"[nats_worker] failed to open/create KV bucket %s: %s",uVar4,uVar2);
        nats_PrintLastErrorStack(*(undefined8 *)PTR_stderr_005dff60);
        *(undefined8 *)(param_1 + 0x58) = 0;
LAB_0019fffc:
        uVar2 = 0;
        goto LAB_001a000c;
      }
      __n = *(size_t *)(param_1 + 0x68);
      if ((__n != *(size_t *)(p_Var3 + 0x48)) ||
         ((__n != 0 &&
          (iVar1 = memcmp(*(void **)(param_1 + 0x60),*(void **)(p_Var3 + 0x40),__n), iVar1 != 0))))
      {
        kvStore_Destroy(lVar6);
        *(undefined8 *)(param_1 + 0x58) = 0;
        *(undefined8 *)(param_1 + 0x68) = 0;
        **(undefined1 **)(param_1 + 0x60) = 0;
        goto LAB_0019ff48;
      }
LAB_0019ff98:
      local_78[0] = 0;
      iVar1 = kvStore_Get(local_78,lVar6,*(undefined8 *)(p_Var3 + 0x60));
      if (iVar1 != 0) {
        if (iVar1 == 0xd) {
          FUN_0019faa0(&local_28,p_Var3 + 0x80);
          local_78[0] = 0;
          iVar1 = kvStore_Put(local_78,*(undefined8 *)(param_1 + 0x58),
                              *(undefined8 *)(p_Var3 + 0x60),local_28,local_20);
          if (iVar1 == 0) {
            if (local_28 != local_18) {
              operator_delete(local_28,local_18[0] + 1);
            }
            goto LAB_001a0044;
          }
          uVar5 = *(undefined8 *)(p_Var3 + 0x40);
          uVar4 = *(undefined8 *)(p_Var3 + 0x60);
          uVar2 = natsStatus_GetText();
          FUN_001965f0(PTR_DAT_005df810,0xdb,"reconcileState",
                       "/usr/src/debug/frank/0.1-r0/git/submodules/native-utils/inc/raw_nats_worker.h"
                       ,"[nats_worker] reconcile put KV %s/%s failed: %s",uVar5,uVar4,uVar2);
          nats_PrintLastErrorStack(*(undefined8 *)PTR_stderr_005dff60);
          FUN_001998f0(&local_28);
        }
        else {
          uVar5 = *(undefined8 *)(p_Var3 + 0x60);
          uVar4 = *(undefined8 *)(p_Var3 + 0x40);
          uVar2 = natsStatus_GetText();
          FUN_001965f0(PTR_DAT_005df810,0xc5,"readBack",
                       "/usr/src/debug/frank/0.1-r0/git/submodules/native-utils/inc/raw_nats_worker.h"
                       ,"[nats_worker] reconcile get KV %s/%s failed: %s",uVar4,uVar5,uVar2);
        }
        goto LAB_0019fffc;
      }
      kvEntry_Destroy(local_78[0]);
LAB_001a0044:
      p_Var3 = (_Rb_tree_node_base *)std::_Rb_tree_increment(p_Var3);
    } while ((_Rb_tree_node_base *)(param_1 + 0x668) != p_Var3);
  }
  uVar2 = 1;
LAB_001a000c:
  if (local_8 - *(long *)PTR___stack_chk_guard_005df758 != 0) {
                    /* WARNING: Subroutine does not return */
    __stack_chk_fail(uVar2,PTR___stack_chk_guard_005df758,
                     local_8 - *(long *)PTR___stack_chk_guard_005df758,0);
  }
  return;
}


