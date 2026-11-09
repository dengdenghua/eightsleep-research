/* Static Ghidra pseudocode; not original source. */

/* WARNING: Removing unreachable block (ram,0x0002e664) */
/* WARNING: Removing unreachable block (ram,0x0002e67a) */
/* WARNING: Removing unreachable block (ram,0x0002e670) */

void FUN_0002e594(undefined4 param_1,undefined4 param_2,undefined4 param_3,undefined4 param_4)

{
  int iVar1;
  char *pcVar2;
  undefined4 local_20;
  char acStack_1c [8];
  
  local_20 = param_2;
  acStack_1c._0_4_ = param_3;
  acStack_1c._4_4_ = param_4;
  if (DAT_20002b38 != -1) {
    software_interrupt(0x76);
    if (DAT_20002b38 != 0) {
      FUN_00026218(DAT_20002b38,0x391,"..\\..\\..\\OKIN_app_ble.c");
    }
    while (DAT_20002b38 != -1) {
      FUN_00032c34(0x140003,"Disconnected");
      do {
        iVar1 = FUN_00032a04();
      } while (iVar1 != 0);
      FUN_0003133c(10);
    }
  }
  software_interrupt(0x74);
  if (DAT_20004308 == '\0') {
    FUN_00032c3c(0x140003,"Success stop advertising: %d");
    FUN_0003133c(10);
    DAT_200042f0 = 5;
    DAT_200042f8 = 0xa0;
    DAT_200042fc = 0;
    local_20 = 0x7040102;
    builtin_strncpy(acStack_1c,"\tDEVICE",8);
    DAT_200044f0 = 0;
    DAT_200044ec = 0xb;
    DAT_200044f4 = 0;
    DAT_200044e8 = &local_20;
    FUN_00032c3c(0x140003,"Adv data size: %d",0xb);
    software_interrupt(0x72);
    pcVar2 = "Failed to configure advertising: 0x%X";
  }
  else {
    pcVar2 = "Failed to stop advertising: 0x%d";
  }
  FUN_00032c3c(0x140001,pcVar2);
  return;
}


