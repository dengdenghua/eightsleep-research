/* Ghidra static pseudocode; not original source. Read-only project; no target execution. */

void FUN_002463a0(long param_1,undefined8 *param_2,undefined8 *param_3,undefined8 *param_4)

{
  size_t sVar1;
  int iVar2;
  undefined8 *puVar3;
  _Rb_tree_node_base *__dest;
  _Rb_tree_node_base *p_Var4;
  undefined8 uVar5;
  long lVar6;
  _Rb_tree_node_base *p_Var7;
  _Rb_tree_node_base *p_Var8;
  _Rb_tree_node_base *p_Var9;
  ulong uVar10;
  bool bVar11;
  undefined1 *__src;
  ulong uVar12;
  _Rb_tree_node_base *p_Var13;
  _Rb_tree_node_base *p_Var14;
  _Rb_tree_node_base *p_Var15;
  undefined1 auVar16 [16];
  size_t local_d8;
  ulong *local_88;
  ulong local_78;
  undefined8 uStack_70;
  _Rb_tree_node_base *local_68;
  ulong local_60;
  ulong local_58;
  undefined8 uStack_50;
  _Rb_tree_node_base *local_48;
  size_t local_40;
  long local_38;
  undefined8 uStack_30;
  _Rb_tree_node_base *local_28;
  size_t local_20;
  long local_18;
  undefined8 uStack_10;
  long local_8;
  
  __src = (undefined1 *)*param_2;
  local_8 = *(long *)PTR___stack_chk_guard_005df758;
  uVar10 = param_2[1];
  local_68 = (_Rb_tree_node_base *)&local_58;
  if (__src + uVar10 != (undefined1 *)0x0 && __src == (undefined1 *)0x0) {
                    /* WARNING: Subroutine does not return */
    std::__throw_logic_error("basic_string::_M_construct null not valid");
  }
  if (uVar10 < 0x10) {
    if (uVar10 == 1) {
      local_58 = CONCAT71(local_58._1_7_,*__src);
    }
    else if (uVar10 != 0) goto LAB_00246a00;
  }
  else {
    if ((long)uVar10 < 0) {
                    /* WARNING: Subroutine does not return */
      std::__throw_length_error("basic_string::_M_create");
    }
    if ((long)(uVar10 + 1) < 0) {
                    /* WARNING: Subroutine does not return */
      std::__throw_bad_alloc();
    }
    local_68 = operator_new(uVar10 + 1);
    local_58 = uVar10;
LAB_00246a00:
    memcpy(local_68,__src,uVar10);
  }
  local_68[uVar10] = (_Rb_tree_node_base)0x0;
  local_60 = uVar10;
  FUN_00240290((string *)&local_68,uVar10,0,1,0x1f);
  puVar3 = (undefined8 *)
           std::__cxx11::string::_M_append((string *)&local_68,(char *)*param_3,param_3[1]);
  if ((ulong *)*puVar3 == puVar3 + 2) {
    local_78 = puVar3[2];
    uStack_70 = puVar3[3];
    local_88 = &local_78;
  }
  else {
    local_78 = puVar3[2];
    local_88 = (ulong *)*puVar3;
  }
  uVar10 = puVar3[1];
  *puVar3 = puVar3 + 2;
  puVar3[1] = 0;
  *(undefined1 *)(puVar3 + 2) = 0;
  if (local_68 != (_Rb_tree_node_base *)&local_58) {
    operator_delete(local_68,local_58 + 1);
  }
  if ((PTR___pthread_key_create_005dfdb8 != (undefined *)0x0) &&
     (iVar2 = pthread_mutex_lock((pthread_mutex_t *)(param_1 + 0x600)), iVar2 != 0)) {
    uVar5 = std::__throw_system_error(iVar2);
    FUN_001998f0((string *)&local_68);
                    /* WARNING: Subroutine does not return */
    _Unwind_Resume(uVar5);
  }
  if ((_Rb_tree_node_base *)*param_2 == (_Rb_tree_node_base *)(param_2 + 2)) {
    local_58 = param_2[2];
    uStack_50 = param_2[3];
    local_68 = (_Rb_tree_node_base *)&local_58;
  }
  else {
    local_58 = param_2[2];
    local_68 = (_Rb_tree_node_base *)*param_2;
  }
  *param_2 = (_Rb_tree_node_base *)(param_2 + 2);
  *(undefined1 *)(param_2 + 2) = 0;
  local_d8 = param_2[1];
  local_48 = (_Rb_tree_node_base *)*param_3;
  param_2[1] = 0;
  if (local_48 == (_Rb_tree_node_base *)(param_3 + 2)) {
    local_38 = param_3[2];
    uStack_30 = param_3[3];
    local_48 = (_Rb_tree_node_base *)&local_38;
  }
  else {
    local_38 = param_3[2];
  }
  *param_3 = (_Rb_tree_node_base *)(param_3 + 2);
  *(undefined1 *)(param_3 + 2) = 0;
  local_40 = param_3[1];
  local_28 = (_Rb_tree_node_base *)*param_4;
  param_3[1] = 0;
  if ((_Rb_tree_node_base *)(param_4 + 2) == local_28) {
    local_18 = param_4[2];
    uStack_10 = param_4[3];
    local_28 = (_Rb_tree_node_base *)&local_18;
  }
  else {
    local_18 = param_4[2];
  }
  *(undefined1 *)(param_4 + 2) = 0;
  local_20 = param_4[1];
  p_Var13 = *(_Rb_tree_node_base **)(param_1 + 0x640);
  *param_4 = (_Rb_tree_node_base *)(param_4 + 2);
  param_4[1] = 0;
  p_Var4 = (_Rb_tree_node_base *)(param_1 + 0x638);
  p_Var15 = p_Var4;
  local_60 = local_d8;
  if (p_Var13 == (_Rb_tree_node_base *)0x0) {
LAB_002467d0:
    p_Var13 = operator_new(0xa0);
    *(_Rb_tree_node_base **)(p_Var13 + 0x20) = p_Var13 + 0x30;
    if (local_88 == &local_78) {
      *(ulong *)(p_Var13 + 0x30) = local_78;
      *(undefined8 *)(p_Var13 + 0x38) = uStack_70;
    }
    else {
      *(ulong **)(p_Var13 + 0x20) = local_88;
      *(ulong *)(p_Var13 + 0x30) = local_78;
    }
    *(undefined8 *)(p_Var13 + 0x40) = 0;
    *(undefined8 *)(p_Var13 + 0x48) = 0;
    p_Var8 = p_Var13 + 0x50;
    *(ulong *)(p_Var13 + 0x28) = uVar10;
    *(undefined8 *)(p_Var13 + 0x50) = 0;
    *(undefined8 *)(p_Var13 + 0x58) = 0;
    p_Var7 = p_Var13 + 0x70;
    p_Var14 = p_Var13 + 0x90;
    *(undefined8 *)(p_Var13 + 0x60) = 0;
    *(undefined8 *)(p_Var13 + 0x68) = 0;
    *(undefined8 *)(p_Var13 + 0x70) = 0;
    *(undefined8 *)(p_Var13 + 0x78) = 0;
    *(undefined8 *)(p_Var13 + 0x80) = 0;
    *(undefined8 *)(p_Var13 + 0x88) = 0;
    *(undefined8 *)(p_Var13 + 0x90) = 0;
    *(undefined8 *)(p_Var13 + 0x98) = 0;
    *(_Rb_tree_node_base **)(p_Var13 + 0x40) = p_Var8;
    *(undefined8 *)(p_Var13 + 0x48) = 0;
    p_Var13[0x50] = (_Rb_tree_node_base)0x0;
    *(_Rb_tree_node_base **)(p_Var13 + 0x60) = p_Var7;
    *(undefined8 *)(p_Var13 + 0x68) = 0;
    p_Var13[0x70] = (_Rb_tree_node_base)0x0;
    *(_Rb_tree_node_base **)(p_Var13 + 0x80) = p_Var14;
    *(undefined8 *)(p_Var13 + 0x88) = 0;
    p_Var13[0x90] = (_Rb_tree_node_base)0x0;
    local_78 = local_78 & 0xffffffffffffff00;
    auVar16 = FUN_001abf80(param_1 + 0x630,p_Var15,p_Var13 + 0x20);
    p_Var9 = auVar16._8_8_;
    p_Var15 = auVar16._0_8_;
    if (p_Var9 == (_Rb_tree_node_base *)0x0) {
      if (p_Var13 + 0x30 != *(_Rb_tree_node_base **)(p_Var13 + 0x20)) {
        operator_delete(*(_Rb_tree_node_base **)(p_Var13 + 0x20),*(long *)(p_Var13 + 0x30) + 1);
      }
      p_Var7 = p_Var15 + 0x70;
      p_Var8 = p_Var15 + 0x50;
      p_Var14 = p_Var15 + 0x90;
      operator_delete(p_Var13,0xa0);
    }
    else {
      bVar11 = p_Var15 != (_Rb_tree_node_base *)0x0 || p_Var4 == p_Var9;
      if (p_Var15 == (_Rb_tree_node_base *)0x0 && p_Var4 != p_Var9) {
        uVar12 = *(ulong *)(p_Var9 + 0x28);
        sVar1 = uVar10;
        if (uVar12 < uVar10) {
          sVar1 = uVar12;
        }
        if ((sVar1 == 0) ||
           (iVar2 = memcmp(*(void **)(p_Var13 + 0x20),*(void **)(p_Var9 + 0x20),sVar1), iVar2 == 0))
        {
          lVar6 = uVar10 - uVar12;
          if (lVar6 < 0x80000000) {
            if (lVar6 < -0x80000000) {
              bVar11 = true;
            }
            else {
              iVar2 = (int)lVar6;
              if (iVar2 != 0) goto LAB_00246b5c;
            }
          }
        }
        else {
LAB_00246b5c:
          bVar11 = SUB41((uint)iVar2 >> 0x1f,0);
        }
      }
      std::_Rb_tree_insert_and_rebalance(bVar11,p_Var13,p_Var9,p_Var4);
      *(long *)(param_1 + 0x658) = *(long *)(param_1 + 0x658) + 1;
      p_Var15 = p_Var13;
    }
    p_Var4 = p_Var15 + 0x40;
    p_Var13 = p_Var15 + 0x60;
    p_Var9 = p_Var15 + 0x80;
    local_d8 = local_60;
    __dest = *(_Rb_tree_node_base **)(p_Var15 + 0x40);
    local_88 = &local_78;
    if (local_68 != (_Rb_tree_node_base *)&local_58) goto LAB_00246650;
LAB_0024690c:
    if (local_d8 != 0) {
      if (local_d8 == 1) {
        *__dest = local_58._0_1_;
        local_d8 = local_60;
        __dest = *(_Rb_tree_node_base **)p_Var4;
      }
      else {
        memcpy(__dest,(_Rb_tree_node_base *)&local_58,local_d8);
        local_d8 = local_60;
        __dest = *(_Rb_tree_node_base **)p_Var4;
      }
    }
    *(size_t *)(p_Var4 + 8) = local_d8;
    __dest[local_d8] = (_Rb_tree_node_base)0x0;
    *local_68 = (_Rb_tree_node_base)0x0;
    p_Var4 = *(_Rb_tree_node_base **)(p_Var15 + 0x60);
    if (local_48 != (_Rb_tree_node_base *)&local_38) goto LAB_00246694;
LAB_0024696c:
    local_60 = 0;
    if (local_40 != 0) {
      if (local_40 == 1) {
        *p_Var4 = local_38._0_1_;
        p_Var4 = *(_Rb_tree_node_base **)p_Var13;
      }
      else {
        memcpy(p_Var4,(_Rb_tree_node_base *)&local_38,local_40);
        p_Var4 = *(_Rb_tree_node_base **)p_Var13;
      }
    }
    *(size_t *)(p_Var13 + 8) = local_40;
    p_Var4[local_40] = (_Rb_tree_node_base)0x0;
    *local_48 = (_Rb_tree_node_base)0x0;
    p_Var4 = *(_Rb_tree_node_base **)(p_Var15 + 0x80);
  }
  else {
    do {
      while( true ) {
        p_Var14 = p_Var13;
        uVar12 = *(ulong *)(p_Var14 + 0x28);
        sVar1 = uVar12;
        if (uVar10 < uVar12) {
          sVar1 = uVar10;
        }
        if ((sVar1 != 0) && (iVar2 = memcmp(*(void **)(p_Var14 + 0x20),local_88,sVar1), iVar2 != 0))
        break;
        lVar6 = uVar12 - uVar10;
        if (lVar6 < 0x80000000) {
          if (lVar6 < -0x80000000) goto LAB_002467b4;
          iVar2 = (int)lVar6;
          if (iVar2 != 0) break;
        }
LAB_002465cc:
        p_Var13 = *(_Rb_tree_node_base **)(p_Var14 + 0x10);
        p_Var15 = p_Var14;
        if (*(_Rb_tree_node_base **)(p_Var14 + 0x10) == (_Rb_tree_node_base *)0x0)
        goto LAB_002465d8;
      }
      if (-1 < iVar2) goto LAB_002465cc;
LAB_002467b4:
      p_Var13 = *(_Rb_tree_node_base **)(p_Var14 + 0x18);
    } while (*(_Rb_tree_node_base **)(p_Var14 + 0x18) != (_Rb_tree_node_base *)0x0);
LAB_002465d8:
    if (p_Var4 == p_Var15) goto LAB_002467d0;
    uVar12 = *(ulong *)(p_Var15 + 0x28);
    sVar1 = uVar12;
    if (uVar10 < uVar12) {
      sVar1 = uVar10;
    }
    if ((sVar1 == 0) || (iVar2 = memcmp(local_88,*(void **)(p_Var15 + 0x20),sVar1), iVar2 == 0)) {
      lVar6 = uVar10 - uVar12;
      if (lVar6 < 0x80000000) {
        if (lVar6 < -0x80000000) goto LAB_002467d0;
        iVar2 = (int)lVar6;
        if (iVar2 != 0) goto LAB_002467cc;
      }
    }
    else {
LAB_002467cc:
      if (iVar2 < 0) goto LAB_002467d0;
    }
    p_Var14 = p_Var15 + 0x90;
    p_Var7 = p_Var15 + 0x70;
    p_Var8 = p_Var15 + 0x50;
    p_Var4 = p_Var15 + 0x40;
    p_Var13 = p_Var15 + 0x60;
    p_Var9 = p_Var15 + 0x80;
    __dest = *(_Rb_tree_node_base **)(p_Var15 + 0x40);
    if (local_68 == (_Rb_tree_node_base *)&local_58) goto LAB_0024690c;
LAB_00246650:
    *(_Rb_tree_node_base **)p_Var4 = local_68;
    if (__dest == p_Var8) {
      *(size_t *)(p_Var4 + 8) = local_d8;
      *(ulong *)(p_Var4 + 0x10) = local_58;
      local_68 = (_Rb_tree_node_base *)&local_58;
    }
    else {
      *(size_t *)(p_Var4 + 8) = local_d8;
      lVar6 = *(long *)(p_Var4 + 0x10);
      *(ulong *)(p_Var4 + 0x10) = local_58;
      local_68 = (_Rb_tree_node_base *)&local_58;
      if (__dest != (_Rb_tree_node_base *)0x0) {
        local_68 = __dest;
        local_58 = lVar6;
      }
    }
    *local_68 = (_Rb_tree_node_base)0x0;
    p_Var4 = *(_Rb_tree_node_base **)(p_Var15 + 0x60);
    if (local_48 == (_Rb_tree_node_base *)&local_38) goto LAB_0024696c;
LAB_00246694:
    local_60 = 0;
    *(_Rb_tree_node_base **)p_Var13 = local_48;
    *(size_t *)(p_Var13 + 8) = local_40;
    if (p_Var4 == p_Var7) {
      *(long *)(p_Var13 + 0x10) = local_38;
      local_48 = (_Rb_tree_node_base *)&local_38;
    }
    else {
      lVar6 = *(long *)(p_Var13 + 0x10);
      *(long *)(p_Var13 + 0x10) = local_38;
      local_48 = (_Rb_tree_node_base *)&local_38;
      if (p_Var4 != (_Rb_tree_node_base *)0x0) {
        local_48 = p_Var4;
        local_38 = lVar6;
      }
    }
    *local_48 = (_Rb_tree_node_base)0x0;
    p_Var4 = *(_Rb_tree_node_base **)(p_Var15 + 0x80);
  }
  if (local_28 == (_Rb_tree_node_base *)&local_18) {
    local_40 = 0;
    if (local_20 != 0) {
      if (local_20 == 1) {
        *p_Var4 = local_18._0_1_;
        p_Var4 = *(_Rb_tree_node_base **)p_Var9;
      }
      else {
        memcpy(p_Var4,(_Rb_tree_node_base *)&local_18,local_20);
        p_Var4 = *(_Rb_tree_node_base **)p_Var9;
      }
    }
    *(size_t *)(p_Var9 + 8) = local_20;
    p_Var4[local_20] = (_Rb_tree_node_base)0x0;
    lVar6 = local_18;
  }
  else {
    local_40 = 0;
    *(_Rb_tree_node_base **)p_Var9 = local_28;
    *(size_t *)(p_Var9 + 8) = local_20;
    if (p_Var4 == p_Var14) {
      *(long *)(p_Var9 + 0x10) = local_18;
    }
    else {
      lVar6 = *(long *)(p_Var9 + 0x10);
      *(long *)(p_Var9 + 0x10) = local_18;
      local_28 = p_Var4;
      if (p_Var4 != (_Rb_tree_node_base *)0x0) goto LAB_002466f4;
    }
    local_28 = (_Rb_tree_node_base *)&local_18;
    lVar6 = local_18;
  }
LAB_002466f4:
  local_18 = lVar6;
  local_20 = 0;
  *local_28 = (_Rb_tree_node_base)0x0;
  if (local_28 != (_Rb_tree_node_base *)&local_18) {
    operator_delete(local_28,local_18 + 1);
  }
  if (local_48 != (_Rb_tree_node_base *)&local_38) {
    operator_delete(local_48,local_38 + 1);
  }
  if (local_68 != (_Rb_tree_node_base *)&local_58) {
    operator_delete(local_68,local_58 + 1);
  }
  if (PTR___pthread_key_create_005dfdb8 != (undefined *)0x0) {
    pthread_mutex_unlock((pthread_mutex_t *)(param_1 + 0x600));
  }
  if (local_88 != &local_78) {
    operator_delete(local_88,local_78 + 1);
  }
  if (local_8 - *(long *)PTR___stack_chk_guard_005df758 != 0) {
                    /* WARNING: Subroutine does not return */
    __stack_chk_fail(PTR___stack_chk_guard_005df758,
                     local_8 - *(long *)PTR___stack_chk_guard_005df758,0);
  }
  return;
}


