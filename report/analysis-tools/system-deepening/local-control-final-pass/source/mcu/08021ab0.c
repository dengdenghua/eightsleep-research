/* Ghidra static pseudocode; not original source. */

char FUN_08021ab0(int *param_1,uint param_2)

{
  undefined1 uVar1;
  char cVar2;
  char *pcVar3;
  int iVar4;
  undefined4 uVar5;
  int iVar6;
  undefined4 uVar7;
  undefined1 *puVar8;
  uint local_20;
  
  if (((char)param_1[5] != '\0') && (param_2 < 2)) {
    iVar6 = *param_1;
    puVar8 = (undefined1 *)(param_1[4] + param_2 * 0x34);
    uVar1 = *(undefined1 *)(param_1[4] + param_2 * 0x34);
    if (iVar6 == 0) {
      pcVar3 = "[mode] failed to set pump speed cap to %u%%";
    }
    else {
      iVar4 = iVar6 + (uint)*(byte *)(iVar6 + 0x230) * 0x44;
      for (; iVar6 != iVar4; iVar6 = iVar6 + 0x44) {
        *(undefined1 *)(iVar6 + 0x10) = uVar1;
      }
      *(undefined1 *)(param_1[1] + 0x115) = uVar1;
      iVar6 = param_1[2];
      local_20 = 0;
      if (iVar6 != 0) {
        for (; local_20 < *(byte *)(iVar6 + 0x3f0); local_20 = local_20 + 1 & 0xff) {
          iVar4 = local_20 * 0xa8;
          if (*(char *)(iVar6 + iVar4 + 0xa4) != '\0') {
            FUN_08021a14(iVar6 + iVar4 + 4,*(undefined4 *)(puVar8 + 4),puVar8[8],
                         *(undefined4 *)(puVar8 + 0xc),puVar8[0x10],puVar8[0x11],
                         *(undefined4 *)(puVar8 + 0x14),puVar8[0x18],*(undefined4 *)(puVar8 + 0x1c))
            ;
            FUN_08021a14(iVar6 + iVar4 + 0x54,*(undefined4 *)(puVar8 + 4),puVar8[8],
                         *(undefined4 *)(puVar8 + 0xc),puVar8[0x10],puVar8[0x11],
                         *(undefined4 *)(puVar8 + 0x14),puVar8[0x18],*(undefined4 *)(puVar8 + 0x1c))
            ;
          }
        }
      }
      iVar6 = param_1[1];
      if ((iVar6 == 0) || (*(char *)(iVar6 + 0x14c) == '\0')) {
        pcVar3 = "[mode] failed to set sleep duration %u";
      }
      else {
        *(undefined4 *)(iVar6 + 0x140) = *(undefined4 *)(puVar8 + 0x20);
        FUN_08017634("[scheduler] sleep duration set to %u sec");
        iVar6 = param_1[1];
        if (((iVar6 != 0) && (*(char *)(iVar6 + 0x14c) != '\0')) &&
           (*(int *)(puVar8 + 0x24) - 1U < 0xe10)) {
          *(int *)(iVar6 + 0x144) = *(int *)(puVar8 + 0x24);
          FUN_08017634("[scheduler] idle cycles required set to %u");
          iVar6 = param_1[1];
          uVar5 = *(undefined4 *)(puVar8 + 0x2c);
          uVar7 = *(undefined4 *)(puVar8 + 0x30);
          if ((iVar6 != 0) && (cVar2 = *(char *)(iVar6 + 0x14c), cVar2 != '\0')) {
            *(undefined4 *)(iVar6 + 0xf4) = *(undefined4 *)(puVar8 + 0x28);
            *(undefined4 *)(iVar6 + 0xf8) = uVar5;
            *(undefined4 *)(iVar6 + 0xfc) = uVar7;
            FUN_08017634("[scheduler] grant durations set (inflate=%u deflate=%u default=%u)");
            pcVar3 = "demo";
            *(char *)(param_1 + 3) = (char)param_2;
            if (param_2 == 1) {
              pcVar3 = "sleep";
            }
            FUN_08017634("[mode] applied %s mode (pump cap %u%%, sleep %us)",pcVar3,*puVar8,
                         *(undefined4 *)(puVar8 + 0x20));
            return cVar2;
          }
          FUN_08017634("[mode] failed to set grant durations: %u/%u/%u");
          return '\0';
        }
        pcVar3 = "[mode] failed to set idle cycles %u";
      }
    }
    FUN_08017634(pcVar3);
  }
  return '\0';
}


