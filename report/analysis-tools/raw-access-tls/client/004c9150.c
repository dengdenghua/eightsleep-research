/* Reconstructed Ghidra pseudocode, not vendor source. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_004c9150(long *param_1,undefined8 param_2,undefined8 *param_3,undefined8 param_4)

{
  long lVar1;
  long lVar2;
  long local_458;
  long local_450;
  long lStack_448;
  long lStack_440;
  long lStack_438;
  long local_430;
  long lStack_428;
  long lStack_420;
  long lStack_418;
  undefined1 auStack_410 [896];
  undefined8 local_90;
  undefined8 uStack_88;
  undefined8 local_80;
  undefined8 uStack_78;
  undefined1 auStack_68 [56];
  
  uStack_88 = param_3[1];
  local_90 = *param_3;
  uStack_78 = param_3[3];
  local_80 = param_3[2];
  FUN_004e9f34(auStack_68,param_4);
  FUN_004a41fc(&local_458,param_2,&local_90,auStack_68,0);
  if (local_458 == 2) {
    param_1[2] = lStack_448;
    param_1[1] = local_450;
    param_1[4] = lStack_438;
    param_1[3] = lStack_440;
    param_1[6] = lStack_428;
    param_1[5] = local_430;
    param_1[8] = lStack_418;
    param_1[7] = lStack_420;
    *param_1 = 2;
    return;
  }
  memcpy(param_1 + 9,auStack_410,0x380);
  param_1[0x7c] = 8;
  param_1[2] = lStack_448;
  param_1[1] = local_450;
  param_1[4] = lStack_438;
  param_1[3] = lStack_440;
  param_1[8] = lStack_418;
  param_1[7] = lStack_420;
  param_1[6] = lStack_428;
  param_1[5] = local_430;
  lVar2 = _UNK_007a13b8;
  lVar1 = _DAT_007a13b0;
  param_1[0x79] = 1;
  param_1[0x7b] = lVar2;
  param_1[0x7a] = lVar1;
  param_1[0x7e] = 0;
  param_1[0x7d] = 0;
  param_1[0x80] = 0;
  param_1[0x7f] = 0;
  param_1[0x81] = 1;
  param_1[0x83] = 0;
  param_1[0x82] = 0;
  *param_1 = local_458;
  return;
}


