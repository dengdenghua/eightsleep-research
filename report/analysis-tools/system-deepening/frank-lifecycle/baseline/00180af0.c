/* Ghidra static pseudocode; not original source. Read-only project; no target execution. */

/* WARNING: Heritage AFTER dead removal. Example location: x0 : 0x00180ba4 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void _INIT_43(undefined8 param_1)

{
  void *__s;
  void *pvVar1;
  
  std::ios_base::Init::Init((Init *)&DAT_005edab0);
  __cxa_atexit(PTR__Init_005dfff8,&DAT_005edab0,&PTR_LOOP_005e0008);
  __cxa_atexit(FUN_0018f2a0,&PTR_PTR_005e2f18,&PTR_LOOP_005e0008);
  __cxa_atexit(FUN_0018f290,&PTR_PTR_005e2f20,&PTR_LOOP_005e0008);
  __cxa_atexit(FUN_0018f280,&PTR_PTR_005e2f28,&PTR_LOOP_005e0008);
  if ((DAT_005e3b30 & 1) == 0) {
    DAT_005e3b30 = 1;
    __s = operator_new(param_1,0x40);
    memset(__s,0,0x6c0);
    *(long *)((long)__s + 0x60) = (long)__s + 0x70;
    *(undefined1 *)((long)__s + 0x80) = 1;
    *(undefined8 *)((long)__s + 0xc0) = 0x11;
    pvVar1 = operator_new(0x498);
    *(void **)((long)__s + 200) = pvVar1;
    *(undefined8 *)((long)__s + 0x240) = 0;
    *(undefined8 *)((long)__s + 0x280) = 0;
    *(undefined8 *)((long)__s + 0x2c0) = 0;
    *(undefined8 *)((long)__s + 0x300) = 0;
    *(undefined8 *)((long)__s + 0x200) = 0x401;
    pvVar1 = operator_new(0xe118);
    *(void **)((long)__s + 0x208) = pvVar1;
    *(undefined8 *)((long)__s + 0x380) = 0;
    *(undefined8 *)((long)__s + 0x3c0) = 0;
    *(undefined8 *)((long)__s + 0x400) = 0;
    *(undefined8 *)((long)__s + 0x440) = 0;
    *(undefined8 *)((long)__s + 0x340) = 0x21;
    pvVar1 = operator_new(0x818);
    *(void **)((long)__s + 0x348) = pvVar1;
    *(long *)((long)__s + 0x480) = (long)__s + 0xc0;
    *(long *)((long)__s + 0x488) = (long)__s + 0x200;
    *(long *)((long)__s + 0x490) = (long)__s + 0x340;
    *(undefined8 *)((long)__s + 0x498) = 0;
    *(undefined8 *)((long)__s + 0x4c0) = 0x11;
    *(undefined8 *)((long)__s + 0x500) = 0;
    *(undefined8 *)((long)__s + 0x540) = 0;
    *(undefined8 *)((long)__s + 0x580) = 0;
    *(undefined8 *)((long)__s + 0x5c0) = 0;
    pvVar1 = operator_new(0x4c0);
    *(void **)((long)__s + 0x4c8) = pvVar1;
    *(undefined8 *)((long)__s + 0x600) = 0;
    *(undefined8 *)((long)__s + 0x608) = 0;
    *(undefined8 *)((long)__s + 0x610) = 0;
    *(undefined8 *)((long)__s + 0x618) = 0;
    *(undefined8 *)((long)__s + 0x620) = 0;
    *(undefined8 *)((long)__s + 0x628) = 0;
    DAT_005e3b98 = __s;
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
    *(undefined8 *)((long)__s + 0x690) = 60000;
    *(undefined8 *)((long)__s + 0x698) = 0;
  }
  return;
}


