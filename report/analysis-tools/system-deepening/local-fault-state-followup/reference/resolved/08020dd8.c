/* Ghidra static pseudocode; not original source. */

int FUN_08020dd8(void)

{
  undefined1 uVar1;
  undefined4 uVar2;
  int iVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  int *piVar6;
  byte bVar7;
  char *pcVar8;
  undefined1 *puVar9;
  char cVar10;
  undefined4 uVar11;
  uint uVar12;
  int local_3c;
  char *local_30;
  char *local_2c;
  char *local_28;
  
  piVar6 = &DAT_2000c3ec;
  local_3c = 0;
  for (bVar7 = 0; bVar7 != DAT_2000c400; bVar7 = bVar7 + 1) {
    if ((*piVar6 != 0) && (*(char *)(*piVar6 + 0x2c) == '\x01')) {
      local_3c = 1;
    }
    piVar6 = piVar6 + 1;
  }
  uVar12 = 0;
  do {
    if (DAT_2000c400 <= uVar12) {
      return local_3c;
    }
    puVar9 = (undefined1 *)(&DAT_2000c3ec)[uVar12];
    if ((puVar9 != (undefined1 *)0x0) && (puVar9[0xdc] != '\0')) {
      cVar10 = puVar9[0x2c];
      if (cVar10 != '\x01') {
        if (local_3c == 0) {
          if (cVar10 != '\0') {
            uVar1 = *puVar9;
            cVar10 = '\0';
            pcVar8 = "released";
            goto LAB_08020e4a;
          }
        }
        else if (cVar10 != '\x02') {
          cVar10 = '\x02';
          uVar1 = *puVar9;
          pcVar8 = "held";
LAB_08020e4a:
          local_28 = "UNKNOWN";
          if ((byte)puVar9[1] < 8) {
            local_28 = (char *)(&DAT_0802f9c8)[(byte)puVar9[1]];
          }
          uVar2 = FUN_08020a1c(*(undefined4 *)(puVar9 + 0x14),uVar1);
          iVar3 = FUN_0801053c(uVar2,0);
          local_2c = "-";
          if (iVar3 == 0) {
            local_2c = "";
          }
          uVar4 = FUN_08016f60(uVar2,100);
          uVar2 = FUN_08016f6e(uVar2,100);
          uVar11 = *(undefined4 *)(puVar9 + 4);
          iVar3 = FUN_0801053c(uVar11,0);
          local_30 = "-";
          if (iVar3 == 0) {
            local_30 = "";
          }
          uVar5 = FUN_08016f60(uVar11,100);
          uVar11 = FUN_08016f6e(uVar11,100);
          FUN_08017634("[bag_task] bag %u: %s for commanded bags in %s (P=%s%u.%02u SP=%s%u.%02u)",
                       uVar1,pcVar8,local_28,local_2c,uVar4,uVar2,local_30,uVar5,uVar11);
        }
        puVar9[0x2c] = cVar10;
      }
    }
    uVar12 = uVar12 + 1 & 0xff;
  } while( true );
}


