/* Static Ghidra pseudocode; not original source. */

void FUN_0002afdc(int param_1,int param_2)

{
  undefined1 uVar1;
  
  if (param_2 == 0) {
    uVar1 = 0;
  }
  else if (param_2 == 1) {
    uVar1 = 1;
  }
  else {
    uVar1 = 2;
  }
  (&DAT_20003be1)[param_1 * 0x28] = uVar1;
  FUN_00032c4a(0x140003,"g_moto_parameter[%x].run_state = %x");
  return;
}


