/* Reconstructed Ghidra pseudocode, not vendor source. */

void FUN_004bb3f4(undefined8 param_1,undefined8 *param_2)

{
  undefined1 uVar1;
  undefined8 *puVar2;
  undefined8 local_d0;
  undefined8 uStack_c8;
  undefined8 uStack_c0;
  undefined8 uStack_b8;
  undefined8 local_b0;
  undefined8 uStack_a8;
  undefined8 uStack_a0;
  undefined8 uStack_98;
  undefined8 local_90;
  undefined8 uStack_88;
  undefined8 uStack_80;
  undefined8 uStack_78;
  undefined8 local_70;
  undefined8 uStack_68;
  undefined8 uStack_60;
  undefined8 uStack_58;
  undefined8 local_50;
  undefined8 uStack_48;
  undefined8 uStack_40;
  undefined8 uStack_38;
  undefined8 local_30;
  undefined8 uStack_28;
  undefined8 local_20;
  
  uStack_48 = param_2[0x11];
  local_50 = param_2[0x10];
  uStack_38 = param_2[0x13];
  uStack_40 = param_2[0x12];
  uStack_28 = param_2[0x15];
  local_30 = param_2[0x14];
  local_20 = param_2[0x16];
  uStack_88 = param_2[9];
  local_90 = param_2[8];
  uStack_78 = param_2[0xb];
  uStack_80 = param_2[10];
  uStack_68 = param_2[0xd];
  local_70 = param_2[0xc];
  uStack_58 = param_2[0xf];
  uStack_60 = param_2[0xe];
  uStack_c8 = param_2[1];
  local_d0 = *param_2;
  uStack_b8 = param_2[3];
  uStack_c0 = param_2[2];
  uStack_a8 = param_2[5];
  local_b0 = param_2[4];
  uStack_98 = param_2[7];
  uStack_a0 = param_2[6];
  uVar1 = *PTR_DAT_009faac8;
  puVar2 = (undefined8 *)FUN_00318628(0x10,8);
  if (puVar2 != (undefined8 *)0x0) {
    puVar2[1] = 1;
    *puVar2 = 1;
    FUN_004bb4ac(param_1,&local_d0,puVar2,&DAT_009e2740);
    return;
  }
                    /* WARNING: Subroutine does not return */
  FUN_0019139c(8,0x10);
}


