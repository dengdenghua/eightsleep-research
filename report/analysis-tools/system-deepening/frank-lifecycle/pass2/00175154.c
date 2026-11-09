/* Ghidra static pseudocode; not original source. Read-only project; no target execution. */

void FUN_00175154(void)

{
  undefined *puVar1;
  undefined *puVar2;
  long *plVar3;
  
  plVar3 = (long *)__cxa_allocate_exception(8);
  puVar2 = PTR_typeinfo_005dfbf8;
  puVar1 = PTR__bad_alloc_005df860;
  *plVar3 = (long)(PTR_vtable_005dfa00 + 0x10);
                    /* WARNING: Subroutine does not return */
  __cxa_throw(plVar3,puVar2,puVar1);
}


