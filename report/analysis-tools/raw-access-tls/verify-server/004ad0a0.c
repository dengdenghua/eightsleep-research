/* Reconstructed Ghidra pseudocode, not vendor source. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_004ad0a0(undefined1 *param_1,undefined8 param_2,long param_3,undefined8 param_4,
                 undefined8 param_5,undefined8 *param_6,undefined8 param_7,undefined8 param_8,
                 undefined8 param_9)

{
  long local_cb8;
  undefined8 local_cb0;
  undefined8 uStack_ca8;
  undefined8 uStack_ca0;
  undefined8 uStack_c98;
  undefined8 local_c90;
  undefined8 uStack_c88;
  undefined8 local_c80;
  undefined8 local_6e8;
  undefined8 local_6e0;
  undefined8 local_6d8;
  undefined8 local_6d0;
  undefined *local_6c8;
  undefined8 local_6c0;
  undefined8 local_6b8;
  undefined8 uStack_6b0;
  undefined8 local_6a8;
  undefined8 local_6a0;
  undefined8 local_698;
  undefined8 local_690;
  undefined8 local_688;
  undefined8 local_680;
  undefined8 local_678;
  undefined1 auStack_670 [1496];
  undefined8 local_98;
  long local_90;
  undefined8 local_88;
  undefined8 uStack_80;
  undefined8 local_78;
  undefined8 uStack_70;
  undefined8 local_68;
  undefined8 uStack_60;
  undefined8 local_58;
  undefined8 local_50;
  undefined8 uStack_48;
  undefined8 local_40;
  
  local_6d0 = 1;
  local_6c8 = &DAT_007a2f18;
  local_690 = *(undefined8 *)(param_3 + 8);
  local_688 = *(undefined8 *)(param_3 + 0x10);
  uStack_6b0 = param_6[1];
  local_6b8 = *param_6;
  local_6a8 = param_6[2];
  local_6c0 = 8;
  local_6a0 = param_8;
  local_698 = param_9;
  local_680 = param_4;
  local_678 = param_5;
  FUN_0050d6e0(auStack_670);
  uStack_48 = _UNK_007a1aa8;
  local_50 = _DAT_007a1aa0;
  local_40 = 250000;
  FUN_004ab954(&local_90,&local_6d0,auStack_670,param_7,0);
  if (local_90 == 2) {
    memcpy(&local_cb8,auStack_670,0x5d0);
    local_6e8 = local_98;
    local_6d8 = local_88;
    local_6e0 = param_2;
    if (local_cb8 != -0x7ffffffffffffffd) {
      *param_1 = 0x16;
      if (local_cb8 != -0x7ffffffffffffffe) {
        FUN_004ab78c(&local_cb8);
      }
      return;
    }
  }
  else {
    uStack_ca8 = uStack_80;
    local_cb0 = local_88;
    uStack_c98 = uStack_70;
    uStack_ca0 = local_78;
    uStack_c88 = uStack_60;
    local_c90 = local_68;
    local_c80 = local_58;
    local_cb8 = -0x7ffffffffffffffd;
    FUN_004ab78c(auStack_670);
  }
  FUN_004b92d0(param_1,&local_cb0);
  return;
}


