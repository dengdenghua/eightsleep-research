/* Ghidra static pseudocode; not original source. */

char FUN_08021c28(int param_1,undefined4 param_2,undefined4 param_3)

{
  char cVar1;
  undefined4 uVar2;
  undefined4 uVar3;
  int iVar4;
  undefined4 uVar5;
  undefined4 uVar6;
  undefined4 uVar7;
  undefined4 uVar8;
  char *pcVar9;
  char *pcVar10;
  char *local_2c;
  
  cVar1 = *(char *)(param_1 + 0x5c);
  if (cVar1 != '\0') {
    uVar2 = FUN_08016f60(param_2,10);
    uVar3 = FUN_08016f6e(param_2,10);
    iVar4 = FUN_0801053c(param_2,0);
    if (iVar4 == 0) {
      iVar4 = FUN_08010578(param_2,param_3);
      if (iVar4 == 0) {
        iVar4 = FUN_08010564(param_3,0x41500000);
        local_2c = "";
        if (iVar4 == 0) {
          *(undefined4 *)(param_1 + 0x50) = param_2;
          *(undefined4 *)(param_1 + 0x54) = param_3;
          uVar5 = FUN_0802b814(param_3,param_2);
          uVar5 = FUN_0802b1cc(uVar5,0x41200000);
          *(undefined4 *)(param_1 + 0x58) = uVar5;
          iVar4 = FUN_0801053c(param_3,0);
          pcVar10 = "-";
          if (iVar4 == 0) {
            pcVar10 = "";
          }
          uVar6 = FUN_08016f60(param_3,10);
          uVar7 = FUN_08016f6e(param_3,10);
          iVar4 = FUN_0801053c(uVar5,0);
          pcVar9 = "-";
          if (iVar4 == 0) {
            pcVar9 = "";
          }
          uVar8 = FUN_08016f60(uVar5,100);
          uVar5 = FUN_08016f6e(uVar5,100);
          FUN_08017634("[tolerance_bins] range updated: %s%u.%01u-%s%u.%01u kPa, bin_width=%s%u.%02u kPa"
                       ,"",uVar2,uVar3,pcVar10,uVar6,uVar7,pcVar9,uVar8,uVar5);
          return cVar1;
        }
      }
      else {
        local_2c = "";
      }
    }
    else {
      local_2c = "-";
    }
    iVar4 = FUN_0801053c(param_3,0);
    pcVar10 = "-";
    if (iVar4 == 0) {
      pcVar10 = "";
    }
    uVar5 = FUN_08016f60(param_3,10);
    uVar6 = FUN_08016f6e(param_3,10);
    FUN_08017634("[tolerance_bins] invalid range: min=%s%u.%01u max=%s%u.%01u (must be 0 <= min < max <= 13)"
                 ,local_2c,uVar2,uVar3,pcVar10,uVar5,uVar6);
  }
  return '\0';
}


