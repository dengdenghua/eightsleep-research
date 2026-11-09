/* Ghidra static pseudocode; not original source. */

undefined8 FUN_08021fe4(char *param_1,undefined4 param_2,undefined4 param_3)

{
  char *pcVar1;
  
  pcVar1 = param_1;
  if ((param_1 != (char *)0x0) && (*param_1 != '\0')) {
    pcVar1 = *(char **)(param_1 + 8);
    FUN_08017634("[solenoid:%u] open_delayed called (delay=%ums) TIM@%p ch=%lu",param_1[0x4d],0,
                 **(undefined4 **)(param_1 + 4),pcVar1,param_2,param_3);
    *(undefined1 **)(param_1 + 0x30) = &LAB_0801edc8_1;
    param_1[0x34] = '\x02';
    FUN_08016fce(param_1 + 0x38,*(undefined4 *)(param_1 + 0x14));
    param_1[0x40] = '\0';
    FUN_0801ec3c(param_1);
  }
  return CONCAT44(param_2,pcVar1);
}


