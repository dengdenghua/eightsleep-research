/* Ghidra static pseudocode; not original source. Read-only project; no target execution. */

/* WARNING: Heritage AFTER dead removal. Example location: x0 : 0x0017ee38 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void _INIT_25(undefined8 param_1)

{
  int iVar1;
  void *__s;
  void *pvVar2;
  
  FUN_00193f60();
  iVar1 = (int)param_1;
  if ((DAT_005e3cd0 & 1) == 0) {
    __cxa_guard_acquire(&DAT_005e3cd0);
    if (iVar1 != 0) {
      __cxa_atexit(FUN_0018feb0,&PTR_PTR_005e00a8,&PTR_LOOP_005e0008);
      __cxa_guard_release(&DAT_005e3cd0);
    }
  }
  if ((DAT_005e3cc8 & 1) == 0) {
    __cxa_guard_acquire(&DAT_005e3cc8);
    if (iVar1 != 0) {
      __cxa_atexit(FUN_0018ff10,&PTR_PTR_005e00a0,&PTR_LOOP_005e0008);
      __cxa_guard_release(&DAT_005e3cc8);
    }
  }
  if ((DAT_005e3cc0 & 1) == 0) {
    __cxa_guard_acquire(&DAT_005e3cc0);
    if (iVar1 != 0) {
      __cxa_atexit(FUN_0018fe50,&PTR_PTR_005e0098,&PTR_LOOP_005e0008);
      __cxa_guard_release(&DAT_005e3cc0);
    }
  }
  if ((DAT_005e3b30 & 1) == 0) {
    DAT_005e3b30 = 1;
    __s = operator_new(param_1,0x40);
    memset(__s,0,0x6c0);
    *(long *)((long)__s + 0x60) = (long)__s + 0x70;
    *(undefined1 *)((long)__s + 0x80) = 1;
    *(undefined8 *)((long)__s + 0xc0) = 0x11;
    pvVar2 = operator_new(0x498);
    *(void **)((long)__s + 200) = pvVar2;
    *(undefined8 *)((long)__s + 0x240) = 0;
    *(undefined8 *)((long)__s + 0x280) = 0;
    *(undefined8 *)((long)__s + 0x2c0) = 0;
    *(undefined8 *)((long)__s + 0x300) = 0;
    *(undefined8 *)((long)__s + 0x200) = 0x401;
    pvVar2 = operator_new(0xe118);
    *(void **)((long)__s + 0x208) = pvVar2;
    *(undefined8 *)((long)__s + 0x380) = 0;
    *(undefined8 *)((long)__s + 0x3c0) = 0;
    *(undefined8 *)((long)__s + 0x400) = 0;
    *(undefined8 *)((long)__s + 0x440) = 0;
    *(undefined8 *)((long)__s + 0x340) = 0x21;
    pvVar2 = operator_new(0x818);
    *(void **)((long)__s + 0x348) = pvVar2;
    *(long *)((long)__s + 0x480) = (long)__s + 0xc0;
    *(long *)((long)__s + 0x488) = (long)__s + 0x200;
    *(long *)((long)__s + 0x490) = (long)__s + 0x340;
    *(undefined8 *)((long)__s + 0x498) = 0;
    *(undefined8 *)((long)__s + 0x4c0) = 0x11;
    *(undefined8 *)((long)__s + 0x500) = 0;
    *(undefined8 *)((long)__s + 0x540) = 0;
    *(undefined8 *)((long)__s + 0x580) = 0;
    *(undefined8 *)((long)__s + 0x5c0) = 0;
    pvVar2 = operator_new(0x4c0);
    *(void **)((long)__s + 0x4c8) = pvVar2;
    *(undefined8 *)((long)__s + 0x600) = 0;
    *(undefined8 *)((long)__s + 0x608) = 0;
    *(undefined8 *)((long)__s + 0x610) = 0;
    *(undefined8 *)((long)__s + 0x618) = 0;
    *(undefined8 *)((long)__s + 0x620) = 0;
    *(undefined8 *)((long)__s + 0x628) = 0;
    *(undefined4 *)((long)__s + 0x638) = 0;
    *(undefined8 *)((long)__s + 0x640) = 0;
    *(long *)((long)__s + 0x648) = (long)__s + 0x638;
    *(long *)((long)__s + 0x650) = (long)__s + 0x638;
    *(undefined8 *)((long)__s + 0x658) = 0;
    *(undefined4 *)((long)__s + 0x668) = 0;
    *(undefined8 *)((long)__s + 0x670) = 0;
    *(long *)((long)__s + 0x678) = (long)__s + 0x668;
    *(long *)((long)__s + 0x680) = (long)__s + 0x668;
    *(undefined8 *)((long)__s + 0x688) = 0;
    DAT_005e3b98 = __s;
    *(undefined8 *)((long)__s + 0x690) = 60000;
    *(undefined8 *)((long)__s + 0x698) = 0;
  }
  std::ios_base::Init::Init((Init *)&DAT_005ea920);
  __cxa_atexit(PTR__Init_005dfff8,&DAT_005ea920,&PTR_LOOP_005e0008);
  __cxa_atexit(FUN_0018f2a0,&PTR_PTR_005e0d00,&PTR_LOOP_005e0008);
  __cxa_atexit(FUN_0018f290,&PTR_PTR_005e0d08,&PTR_LOOP_005e0008);
  __cxa_atexit(FUN_0018f280,&PTR_PTR_005e0d10,&PTR_LOOP_005e0008);
  if ((DAT_005e3b28 & 1) == 0) {
    DAT_005e3b28 = 1;
    FUN_001a2aa0(&DAT_005e3b90);
    __cxa_atexit(FUN_00190140,&DAT_005e3b90,&PTR_LOOP_005e0008);
  }
  if ((DAT_005e3b20 & 1) == 0) {
    DAT_005e3b20 = 1;
    FUN_001a2aa0(&DAT_005e3b88);
    __cxa_atexit(FUN_00190150,&DAT_005e3b88,&PTR_LOOP_005e0008);
  }
  if ((DAT_005e3b18 & 1) == 0) {
    DAT_005e3b18 = 1;
    __cxa_atexit(FUN_0018f2b0,&DAT_005e3b80,&PTR_LOOP_005e0008);
  }
  if ((DAT_005e3b10 & 1) == 0) {
    DAT_005e3b10 = 1;
    FUN_001a2aa0(&DAT_005e3b78);
    __cxa_atexit(FUN_00190160,&DAT_005e3b78,&PTR_LOOP_005e0008);
  }
  if ((DAT_005e3b00 & 1) == 0) {
    DAT_005e3b00 = 1;
    __cxa_atexit(FUN_0018f2c0,&DAT_005e3b60,&PTR_LOOP_005e0008);
  }
  if ((DAT_005e3af8 & 1) == 0) {
    DAT_005e3af8 = 1;
    __cxa_atexit(FUN_0018f2d0,&DAT_005e3b58,&PTR_LOOP_005e0008);
  }
  if ((DAT_005e3af0 & 1) != 0) {
    return;
  }
  DAT_005e3af0 = 1;
  __cxa_atexit(FUN_0018f2e0,&DAT_005e3b50,&PTR_LOOP_005e0008);
  return;
}


