/* Ghidra static pseudocode; not original source. */

char FUN_08021d58(int param_1,uint param_2,undefined4 param_3,undefined4 param_4)

{
  char cVar1;
  int iVar2;
  undefined4 uVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  undefined4 uVar6;
  undefined4 *puVar7;
  
  cVar1 = *(char *)(param_1 + 0x5c);
  if (cVar1 != '\0') {
    if (param_2 < 10) {
      iVar2 = FUN_0801053c(param_3,0);
      if ((iVar2 == 0) && (iVar2 = FUN_0801053c(param_4,0), iVar2 == 0)) {
        puVar7 = (undefined4 *)(param_1 + param_2 * 8);
        *puVar7 = param_3;
        puVar7[1] = param_4;
        uVar3 = FUN_08016f60(param_3,100);
        uVar4 = FUN_08016f6e(param_3,100);
        uVar5 = FUN_08016f60(param_4,100);
        uVar6 = FUN_08016f6e(param_4,100);
        FUN_08017634("[tolerance_bins] bin %u: arrival=%s%u.%02u kPa, departure=%s%u.%02u kPa",
                     param_2,"",uVar3,uVar4,"",uVar5,uVar6);
        return cVar1;
      }
      FUN_08017634("[tolerance_bins] negative tolerances not allowed");
    }
    else {
      FUN_08017634("[tolerance_bins] invalid bin_index %u (must be 0-9)");
    }
  }
  return '\0';
}


