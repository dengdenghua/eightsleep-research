/* Ghidra static pseudocode; not original source. Read-only project; no target execution. */

undefined8 FUN_001f49b0(long *param_1,undefined8 *param_2)

{
  long lVar1;
  undefined1 *__src;
  void *__src_00;
  ulong uVar2;
  size_t __n;
  void *__dest;
  undefined1 *__dest_00;
  long lVar3;
  long lVar4;
  size_t sVar5;
  long lVar6;
  
  lVar3 = param_1[8];
  lVar1 = lVar3 + 1;
  lVar4 = param_1[0x10];
  if (*param_1 == lVar1) {
    lVar1 = 0;
  }
  if ((lVar4 == lVar1) && (param_1[0x10] = param_1[0x18], lVar4 == param_1[0x18])) {
    return 0;
  }
  lVar6 = param_1[1];
  lVar3 = lVar3 * 0x38 + 0x70;
  lVar4 = lVar6 + lVar3;
  __dest_00 = (undefined1 *)(lVar4 + 0x10);
  *(undefined1 **)(lVar6 + lVar3) = __dest_00;
  __src = (undefined1 *)*param_2;
  uVar2 = param_2[1];
  if (__src + uVar2 != (undefined1 *)0x0 && __src == (undefined1 *)0x0) {
                    /* WARNING: Subroutine does not return */
    std::__throw_logic_error("basic_string::_M_construct null not valid");
  }
  if (uVar2 < 0x10) {
    if (uVar2 != 1) {
      if (uVar2 == 0) {
        *(undefined8 *)(lVar4 + 8) = 0;
        *__dest_00 = 0;
        lVar3 = param_2[4];
        lVar6 = param_2[5];
        *(undefined8 *)(lVar4 + 0x20) = 0;
        *(undefined8 *)(lVar4 + 0x28) = 0;
        *(undefined8 *)(lVar4 + 0x30) = 0;
        uVar2 = lVar6 - lVar3;
        goto joined_r0x001f4a58;
      }
      goto LAB_001f4b44;
    }
    *(undefined1 *)(lVar4 + 0x10) = *__src;
  }
  else {
    if ((long)uVar2 < 0) {
                    /* WARNING: Subroutine does not return */
      std::__throw_length_error("basic_string::_M_create");
    }
    if ((long)(uVar2 + 1) < 0) {
                    /* WARNING: Subroutine does not return */
      std::__throw_bad_alloc();
    }
    __dest_00 = operator_new(uVar2 + 1);
    *(undefined1 **)(lVar6 + lVar3) = __dest_00;
    *(ulong *)(lVar4 + 0x10) = uVar2;
LAB_001f4b44:
    memcpy(__dest_00,__src,uVar2);
    __dest_00 = *(undefined1 **)(lVar6 + lVar3);
  }
  *(ulong *)(lVar4 + 8) = uVar2;
  __dest_00[uVar2] = 0;
  lVar3 = param_2[4];
  lVar6 = param_2[5];
  *(undefined8 *)(lVar4 + 0x20) = 0;
  *(undefined8 *)(lVar4 + 0x28) = 0;
  *(undefined8 *)(lVar4 + 0x30) = 0;
  uVar2 = lVar6 - lVar3;
joined_r0x001f4a58:
  if (uVar2 == 0) {
    __dest = (void *)0x0;
    *(undefined8 *)(lVar4 + 0x20) = 0;
    *(undefined8 *)(lVar4 + 0x28) = 0;
    *(undefined8 *)(lVar4 + 0x30) = 0;
    __src_00 = (void *)param_2[4];
    __n = param_2[5] - (long)__src_00;
  }
  else {
    if ((long)uVar2 < 0) {
                    /* WARNING: Subroutine does not return */
      std::__throw_bad_alloc();
    }
    __dest = operator_new(uVar2);
    *(void **)(lVar4 + 0x20) = __dest;
    *(void **)(lVar4 + 0x28) = __dest;
    *(ulong *)(lVar4 + 0x30) = (long)__dest + uVar2;
    __src_00 = (void *)param_2[4];
    __n = param_2[5] - (long)__src_00;
  }
  sVar5 = 0;
  if (__n != 0) {
    __dest = memmove(__dest,__src_00,__n);
    sVar5 = __n;
  }
  *(size_t *)(lVar4 + 0x28) = (long)__dest + sVar5;
  param_1[8] = lVar1;
  return 1;
}


