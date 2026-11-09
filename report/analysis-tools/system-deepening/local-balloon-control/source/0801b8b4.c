/* Ghidra static pseudocode; not original source. */

void FUN_0801b8b4(undefined1 *param_1,undefined4 param_2)

{
  undefined1 uVar1;
  int iVar2;
  undefined4 uVar3;
  undefined4 uVar4;
  char *pcVar5;
  char *pcVar6;
  
  if (param_1[0x2c] == '\x01') {
    param_1[0x2c] = '\0';
    uVar1 = *param_1;
    pcVar5 = "UNKNOWN";
    if ((byte)param_1[1] < 8) {
      pcVar5 = (char *)(&DAT_0802f9c8)[(byte)param_1[1]];
    }
    uVar4 = *(undefined4 *)(param_1 + 4);
    iVar2 = FUN_0801053c(uVar4,0);
    pcVar6 = "-";
    if (iVar2 == 0) {
      pcVar6 = "";
    }
    uVar3 = FUN_08016f60(uVar4,100);
    uVar4 = FUN_08016f6e(uVar4,100);
    FUN_08017634("[bag_task] bag %u: command ended, %s, in %s (SP=%s%u.%02u moves=%u)",uVar1,param_2
                 ,pcVar5,pcVar6,uVar3,uVar4,param_1[0x2d]);
  }
  return;
}


