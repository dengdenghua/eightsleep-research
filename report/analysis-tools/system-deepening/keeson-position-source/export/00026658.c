/* Static Ghidra pseudocode; not original source. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void vector_handler_22(void)

{
  byte bVar1;
  int iVar2;
  undefined4 uVar3;
  uint uVar4;
  short sVar5;
  uint uVar6;
  uint uVar7;
  code *pcVar8;
  uint uVar9;
  int local_48 [4];
  undefined4 local_38 [2];
  int local_30;
  undefined4 local_2c [3];
  
  uVar6 = 0;
  sVar5 = 0x100;
  uVar4 = 1;
  uVar7 = 0;
  local_30 = 0;
  do {
    iVar2 = FUN_00032868(sVar5);
    if ((iVar2 != 0) && ((_DAT_40006304 & uVar4) != 0)) {
      FUN_00032854(sVar5);
      uVar6 = uVar6 | uVar4;
    }
    sVar5 = sVar5 + 4;
    uVar4 = uVar4 << 1;
    uVar7 = uVar7 + 1;
  } while (uVar7 < 8);
  iVar2 = FUN_00032868(0x17c);
  if (iVar2 != 0) {
    FUN_00032854(0x17c);
    uVar6 = uVar6 | 0x80000000;
    FUN_0003282c(0,1,&local_30);
  }
  if ((uVar6 & 0xff) != 0) {
    uVar7 = 1;
    uVar4 = 0;
    do {
      if ((uVar7 & uVar6) != 0) {
        if ((code *)(&DAT_20005308)[uVar4] != (code *)0x0) {
          (*(code *)(&DAT_20005308)[uVar4])
                    ((*(uint *)(uVar4 * 4 + 0x40006510) & 0x1fff) >> 8,
                     (*(uint *)(uVar4 * 4 + 0x40006510) & 0x3ffff) >> 0x10);
        }
      }
      uVar7 = uVar7 << 1;
      uVar4 = uVar4 + 1;
    } while (uVar4 < 8);
  }
  if (-1 < (int)uVar6) {
    return;
  }
  local_38[0] = 0;
  local_2c[0] = 0xffffffff;
  do {
    uVar6 = 0;
    uVar4 = uVar6;
    do {
      bVar1 = (&DAT_20005360)[uVar6];
      uVar7 = bVar1 & 0xffffff3f;
      if (((&DAT_20005360)[uVar6] != 0xff) && (iVar2 = FUN_00030df4(uVar7,local_2c), iVar2 != 0)) {
        bVar1 = bVar1 >> 6;
        iVar2 = FUN_0002ec98(uVar7);
        pcVar8 = (code *)(&DAT_20005308)[iVar2];
        if (pcVar8 == (code *)0x0) {
          if (bVar1 == 3) goto LAB_00026730;
        }
        else {
          if (bVar1 == 3) {
LAB_00026730:
            FUN_00030e04(uVar7,local_38);
          }
          uVar9 = (*(uint *)(uVar7 * 4 + 0x50000700) & 0x3ffff) >> 0x10;
          iVar2 = FUN_00030df4(uVar7,&local_30);
          if (iVar2 == 0) {
            if (uVar9 == 3) goto LAB_00026760;
          }
          else if (uVar9 == 2) {
LAB_00026760:
            if (bVar1 == 3) {
              if (uVar9 == 2) {
                uVar3 = 3;
              }
              else {
                uVar3 = 2;
              }
              FUN_000327f4(uVar7,uVar3);
              uVar4 = uVar4 + 1 & 0xff;
            }
            if (pcVar8 != (code *)0x0) {
              (*pcVar8)(uVar7,bVar1);
            }
          }
        }
      }
      uVar6 = uVar6 + 1;
    } while (uVar6 < 6);
    if (uVar4 == 0) {
      return;
    }
    FUN_0003282c(0,1,local_48);
    if (local_48[0] == local_30) {
      return;
    }
    local_30 = local_48[0];
    local_2c[0] = local_38[0];
  } while( true );
}


