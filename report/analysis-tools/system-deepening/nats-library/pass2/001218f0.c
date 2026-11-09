/* Ghidra static pseudocode; not original source. Read-only project; no target execution. */

undefined4 js_unmarshalResponse(undefined8 *param_1,undefined8 *param_2,undefined8 param_3)

{
  undefined4 uVar1;
  int iVar2;
  undefined8 uVar3;
  undefined8 local_18;
  long local_10;
  long local_8;
  
  local_8 = *(long *)PTR___stack_chk_guard_00187fa0;
  *param_1 = 0;
  param_1[1] = 0;
  param_1[2] = 0;
  local_18 = 0;
  local_10 = 0;
  uVar3 = natsMsg_GetData(param_3,param_2,0);
  uVar1 = natsMsg_GetDataLength(param_3);
  uVar3 = nats_JSONParse(&local_18,uVar3,uVar1);
  if ((int)uVar3 == 0) {
    iVar2 = nats_JSONGetObject(local_18,"error",&local_10);
    if ((iVar2 == 0) &&
       ((local_10 == 0 ||
        (((iVar2 = nats_JSONGetInt(local_10,&DAT_001615b0,param_1 + 1), iVar2 == 0 &&
          (iVar2 = nats_JSONGetUInt16(local_10,"err_code",(long)param_1 + 0xc), iVar2 == 0)) &&
         (iVar2 = nats_JSONGetStr(local_10,"description",param_1 + 2), iVar2 == 0)))))) {
      *param_2 = local_18;
      uVar1 = 0;
    }
    else {
      nats_JSONDestroy(local_18);
      uVar1 = nats_updateErrStack(iVar2,"js_unmarshalResponse");
    }
  }
  else {
    uVar1 = nats_updateErrStack(uVar3,"js_unmarshalResponse");
  }
  if (local_8 - *(long *)PTR___stack_chk_guard_00187fa0 != 0) {
                    /* WARNING: Subroutine does not return */
    __stack_chk_fail(PTR___stack_chk_guard_00187fa0,
                     local_8 - *(long *)PTR___stack_chk_guard_00187fa0,0);
  }
  return uVar1;
}


