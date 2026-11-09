/* Reconstructed Ghidra pseudocode, not vendor source. */

undefined1  [16]
FUN_003a7844(undefined8 param_1,undefined8 param_2,undefined8 param_3,undefined2 param_4)

{
  undefined1 uVar1;
  undefined1 auVar2 [16];
  undefined8 local_4d0 [8];
  undefined8 local_490;
  undefined8 local_488;
  undefined8 local_478;
  undefined2 local_470;
  undefined1 local_46c;
  
  local_4d0[0] = 0;
  local_46c = 0;
  uVar1 = *PTR_DAT_009faac8;
  local_490 = param_2;
  local_488 = param_3;
  local_478 = param_1;
  local_470 = param_4;
  auVar2._0_8_ = (void *)FUN_00318628(0x4b0,8);
  if (auVar2._0_8_ != (void *)0x0) {
    memcpy(auVar2._0_8_,local_4d0,0x4b0);
    auVar2._8_8_ = &UNK_009d0250;
    return auVar2;
  }
                    /* WARNING: Subroutine does not return */
  FUN_0019139c(8,0x4b0);
}


