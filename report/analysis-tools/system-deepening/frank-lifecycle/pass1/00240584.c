/* Ghidra static pseudocode; not original source. Read-only project; no target execution. */

void FUN_00240584(undefined8 *param_1)

{
  uint uVar1;
  undefined8 uVar2;
  undefined *puVar3;
  undefined8 uVar4;
  undefined8 local_88;
  undefined4 *puStack_80;
  undefined8 local_78;
  long *local_70 [2];
  long local_60 [2];
  long *local_50;
  undefined8 uStack_48;
  long local_40;
  char local_38 [4];
  undefined1 local_34;
  long *local_30;
  undefined8 uStack_28;
  long local_20 [2];
  undefined4 local_10 [2];
  long local_8;
  
  puVar3 = PTR_DAT_005df810;
  uVar1 = (*(byte *)(param_1 + 0x49b) & 1) << 3 | *(uint *)(param_1 + 0x4a3) & 7;
  local_8 = *(long *)PTR___stack_chk_guard_005df758;
  *(undefined1 *)(param_1 + 0x419) = 1;
  FUN_001965f0(puVar3,0x3b1,"setPidMode",
               "/usr/src/debug/frank/0.1-r0/git/firmware/src/subsystem/frozen.cpp","set mode 0x%08x"
               ,uVar1,1,0);
  local_10[0] = 0;
  FUN_0045f670(local_10,4,uVar1);
  local_88 = 0x44;
  local_78 = 4;
  puStack_80 = local_10;
  (**(code **)*param_1)(param_1,&local_88);
  uVar4 = DAT_005e3b98;
  local_34 = 0;
  uStack_48 = 0xc;
  local_40._0_1_ = s_device_state_0046fcf8[0];
  local_40._1_1_ = s_device_state_0046fcf8[1];
  local_40._2_1_ = s_device_state_0046fcf8[2];
  local_40._3_1_ = s_device_state_0046fcf8[3];
  local_40._4_1_ = s_device_state_0046fcf8[4];
  local_40._5_1_ = s_device_state_0046fcf8[5];
  local_40._6_1_ = s_device_state_0046fcf8[6];
  local_40._7_1_ = s_device_state_0046fcf8[7];
  local_38[0] = s_device_state_0046fcf8[8];
  local_38[1] = s_device_state_0046fcf8[9];
  local_38[2] = s_device_state_0046fcf8[10];
  local_38[3] = s_device_state_0046fcf8[0xb];
  local_50 = &local_40;
  local_30 = local_20;
  local_30 = operator_new(0x15);
  *(char *)((long)local_30 + 0x14) = '\0';
  uVar2 = s_frank_frozen_priming_0046fd08._8_8_;
  uStack_28 = 0x14;
  *local_30 = s_frank_frozen_priming_0046fd08._0_8_;
  local_30[1] = uVar2;
  *(undefined4 *)(local_30 + 2) = s_frank_frozen_priming_0046fd08._16_4_;
  local_20[0] = 0x14;
  FUN_00284dd4(local_70);
  FUN_002463a0(uVar4,&local_50,&local_30,local_70);
  if (local_70[0] != local_60) {
    operator_delete(local_70[0],local_60[0] + 1);
  }
  if (local_30 != local_20) {
    operator_delete(local_30,local_20[0] + 1);
  }
  if (local_50 != &local_40) {
    operator_delete(local_50,local_40 + 1);
  }
  if (local_8 - *(long *)PTR___stack_chk_guard_005df758 == 0) {
    return;
  }
                    /* WARNING: Subroutine does not return */
  __stack_chk_fail(PTR___stack_chk_guard_005df758,local_8 - *(long *)PTR___stack_chk_guard_005df758,
                   0);
}


