/* Ghidra static pseudocode; not original source. Read-only project; no target execution. */

void natsMsg_IsNoResponders(long param_1)

{
  bool bVar1;
  int iVar2;
  byte *local_10;
  long local_8;
  
  local_8 = *(long *)PTR___stack_chk_guard_00187fa0;
  local_10 = (byte *)0x0;
  if ((((param_1 == 0) ||
       (iVar2 = natsMsg_GetDataLength(param_1,PTR___stack_chk_guard_00187fa0,0), iVar2 != 0)) ||
      (iVar2 = natsMsgHeader_Get(param_1,"Status",&local_10), iVar2 != 0)) ||
     (local_10 == (byte *)0x0)) {
    bVar1 = false;
  }
  else {
    iVar2 = *local_10 - 0x35;
    if ((iVar2 == 0) && (iVar2 = local_10[1] - 0x30, iVar2 == 0)) {
      iVar2 = local_10[2] - 0x33;
    }
    bVar1 = iVar2 == 0;
  }
  if (local_8 - *(long *)PTR___stack_chk_guard_00187fa0 != 0) {
                    /* WARNING: Subroutine does not return */
    __stack_chk_fail(bVar1,PTR___stack_chk_guard_00187fa0,
                     local_8 - *(long *)PTR___stack_chk_guard_00187fa0,0);
  }
  return;
}


