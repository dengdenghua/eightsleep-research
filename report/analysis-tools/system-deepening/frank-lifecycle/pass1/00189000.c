/* Ghidra static pseudocode; not original source. Read-only project; no target execution. */

void FUN_00189000(long param_1)

{
  size_t __n;
  long lVar1;
  bool bVar2;
  int iVar3;
  long lVar4;
  void *__dest;
  ulong uVar5;
  long lVar6;
  bool bVar7;
  size_t sVar8;
  undefined4 local_60;
  undefined1 local_5c;
  undefined1 local_5b;
  undefined1 local_5a;
  void *local_58;
  long lStack_50;
  long local_48;
  long *local_40 [2];
  long local_30 [2];
  void *local_20;
  long local_18;
  long local_10;
  long local_8;
  
  uVar5 = (ulong)*(byte *)(param_1 + 0x1b0);
  local_8 = *(long *)PTR___stack_chk_guard_005df758;
  if (((((*(byte *)(param_1 + 0x1b0) == 0) &&
        (uVar5 = *(ulong *)(param_1 + 0x128), uVar5 == *(ulong *)(param_1 + 0x130))) &&
       (uVar5 = *(ulong *)(param_1 + 0x140), uVar5 == *(ulong *)(param_1 + 0x148))) &&
      ((uVar5 = *(ulong *)(param_1 + 0x158), uVar5 == *(ulong *)(param_1 + 0x160) &&
       (uVar5 = *(ulong *)(param_1 + 0x98), uVar5 == *(ulong *)(param_1 + 0xa0))))) &&
     (*(long *)(param_1 + 0xb0) == *(long *)(param_1 + 0xb8))) {
    local_58 = (void *)CONCAT44(local_58._4_4_,1);
    lVar4 = FUN_0019c2f0(DAT_005e3300 + 0x20,&local_58,1,uVar5,0);
    iVar3 = strcmp((char *)(lVar4 + 0x50),"null");
    bVar2 = iVar3 != 0;
    bVar7 = bVar2;
  }
  else {
    local_58._0_4_ = 4;
    lVar4 = FUN_0019c2f0(DAT_005e3300 + 0x20,&local_58,4,uVar5,0);
    iVar3 = strcmp((char *)(lVar4 + 0x50),"null");
    bVar2 = iVar3 != 0;
    local_58 = (void *)CONCAT44(local_58._4_4_,5);
    lVar4 = FUN_0019c2f0(DAT_005e3300 + 0x20,&local_58);
    iVar3 = strcmp((char *)(lVar4 + 0x50),"null");
    bVar7 = iVar3 != 0;
  }
  local_60 = FUN_00252b10();
  lVar1 = DAT_005e3b98;
  local_5c = 1;
  local_5b = bVar2;
  local_5a = bVar7;
  FUN_0019b610(&local_58,&local_60);
  local_40[0] = local_30;
  std::__cxx11::string::_M_construct<char_const*>(local_40,"raw.sens.health","",0);
  local_10 = local_48;
  local_18 = lStack_50;
  local_20 = local_58;
  local_58 = (void *)0x0;
  lStack_50 = 0;
  local_48 = 0;
  lVar6 = *(long *)(lVar1 + 0x100);
  lVar4 = lVar6 + 1;
  if (lVar4 == *(long *)(lVar1 + 0xc0)) {
    lVar4 = 0;
  }
  if ((*(long *)(lVar1 + 0x140) != lVar4) ||
     (*(long *)(lVar1 + 0x140) = *(long *)(lVar1 + 0x180), lVar4 != *(long *)(lVar1 + 0x180))) {
    lVar6 = *(long *)(lVar1 + 200) + lVar6 * 0x38 + 0x70;
    FUN_00198030(lVar6,local_40);
    *(undefined8 *)(lVar6 + 0x20) = 0;
    *(undefined8 *)(lVar6 + 0x28) = 0;
    *(undefined8 *)(lVar6 + 0x30) = 0;
    uVar5 = local_18 - (long)local_20;
    if (uVar5 == 0) {
      __dest = (void *)0x0;
      *(undefined8 *)(lVar6 + 0x20) = 0;
      *(undefined8 *)(lVar6 + 0x28) = 0;
      *(undefined8 *)(lVar6 + 0x30) = 0;
      __n = local_18 - (long)local_20;
    }
    else {
      if ((long)uVar5 < 0) {
                    /* WARNING: Subroutine does not return */
        std::__throw_bad_alloc();
      }
      __dest = operator_new(uVar5);
      *(void **)(lVar6 + 0x20) = __dest;
      *(void **)(lVar6 + 0x28) = __dest;
      *(ulong *)(lVar6 + 0x30) = (long)__dest + uVar5;
      __n = local_18 - (long)local_20;
    }
    sVar8 = 0;
    if (__n != 0) {
      __dest = memmove(__dest,local_20,__n);
      sVar8 = __n;
    }
    *(size_t *)(lVar6 + 0x28) = (long)__dest + sVar8;
    *(long *)(lVar1 + 0x100) = lVar4;
  }
  if (local_20 != (void *)0x0) {
    operator_delete(local_20,local_10 - (long)local_20);
  }
  if (local_40[0] != local_30) {
    operator_delete(local_40[0],local_30[0] + 1);
  }
  if (local_58 != (void *)0x0) {
    operator_delete(local_58,local_48 - (long)local_58);
  }
  if (local_8 - *(long *)PTR___stack_chk_guard_005df758 == 0) {
    return;
  }
                    /* WARNING: Subroutine does not return */
  __stack_chk_fail(PTR___stack_chk_guard_005df758,local_8 - *(long *)PTR___stack_chk_guard_005df758,
                   0);
}


