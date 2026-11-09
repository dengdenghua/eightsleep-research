/* Static Ghidra pseudocode; not original source. */

undefined4 FUN_0002655c(void)

{
  byte *pbVar1;
  byte *pbVar2;
  byte *extraout_r1;
  byte *pbVar3;
  int extraout_r2;
  uint uVar4;
  int iVar5;
  uint uVar6;
  undefined4 *puVar7;
  uint uVar8;
  
  for (puVar7 = &DAT_00037b68; puVar7 < &DAT_00037b88; puVar7 = puVar7 + 4) {
    (*(code *)puVar7[3])(*puVar7,puVar7[1],puVar7[2]);
  }
  thunk_FUN_0003098c();
  pbVar1 = (byte *)(uint)extraout_r1[0xe];
  pbVar3 = extraout_r1;
  do {
    uVar8 = (uint)*pbVar1;
    uVar6 = uVar8 & 7;
    pbVar2 = pbVar1 + 1;
    if ((*pbVar1 & 7) == 0) {
      pbVar2 = pbVar1 + 2;
      uVar6 = (uint)pbVar1[1];
    }
    uVar4 = (int)uVar8 >> 4;
    if (uVar4 == 0) {
      uVar4 = (uint)*pbVar2;
      pbVar2 = pbVar2 + 1;
    }
    while (uVar6 = uVar6 - 1, uVar6 != 0) {
      *pbVar3 = *pbVar2;
      pbVar2 = pbVar2 + 1;
      pbVar3 = pbVar3 + 1;
    }
    if ((int)(uVar8 << 0x1c) < 0) {
      pbVar1 = pbVar2 + 1;
      iVar5 = uVar4 + 2;
      pbVar2 = pbVar3 + -(uint)*pbVar2;
      while (iVar5 = iVar5 + -1, -1 < iVar5) {
        *pbVar3 = *pbVar2;
        pbVar3 = pbVar3 + 1;
        pbVar2 = pbVar2 + 1;
      }
    }
    else {
      while (uVar4 = uVar4 - 1, pbVar1 = pbVar2, -1 < (int)uVar4) {
        *pbVar3 = 0;
        pbVar3 = pbVar3 + 1;
      }
    }
  } while (pbVar3 < extraout_r1 + extraout_r2);
  return 0;
}


