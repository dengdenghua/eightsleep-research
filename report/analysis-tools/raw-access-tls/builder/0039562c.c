/* Reconstructed Ghidra pseudocode, not vendor source. */

void FUN_0039562c(long *param_1,undefined8 *param_2)

{
  long lVar1;
  undefined8 *puVar2;
  long lVar3;
  long local_a8;
  long lStack_a0;
  long local_98;
  long lStack_90;
  long local_88;
  long lStack_80;
  long local_78;
  undefined8 local_70;
  undefined8 uStack_68;
  undefined8 uStack_60;
  undefined8 uStack_58;
  undefined8 local_50;
  undefined8 uStack_48;
  long *local_40;
  
  uStack_68 = param_2[1];
  local_70 = *param_2;
  uStack_58 = param_2[3];
  uStack_60 = param_2[2];
  uStack_48 = param_2[5];
  local_50 = param_2[4];
  local_a8 = 5;
  local_40 = &local_a8;
  FUN_00383208(&local_88,&local_70,&PTR_s__rust_lib_rustlib_src_rust_libra_009ce578);
  if (local_a8 == 5) {
    *param_1 = 5;
    param_1[2] = lStack_80;
    param_1[1] = local_88;
    param_1[3] = local_78;
  }
  else {
    param_1[1] = lStack_a0;
    *param_1 = local_a8;
    param_1[3] = lStack_90;
    param_1[2] = local_98;
    if (local_78 != 0) {
      puVar2 = (undefined8 *)(lStack_80 + 8);
      lVar3 = local_78;
      do {
        lVar1 = puVar2[-1];
        if ((lVar1 != -0x8000000000000000) && (lVar1 != 0)) {
          FUN_0031865c(*puVar2,lVar1,1);
        }
        lVar3 = lVar3 + -1;
        puVar2 = puVar2 + 3;
      } while (lVar3 != 0);
    }
    if (local_88 != 0) {
      FUN_0031865c(lStack_80,local_88 * 0x18,8);
      return;
    }
  }
  return;
}


