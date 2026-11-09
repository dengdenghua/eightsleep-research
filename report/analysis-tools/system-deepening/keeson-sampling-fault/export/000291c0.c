/* Static Ghidra pseudocode; not original source. */

void FUN_000291c0(int param_1,int param_2)

{
  uint uVar1;
  int extraout_r2;
  int extraout_r2_00;
  int extraout_r2_01;
  int extraout_r2_02;
  int extraout_r2_03;
  int extraout_r3;
  int extraout_r3_00;
  int extraout_r3_01;
  int extraout_r3_02;
  int iVar2;
  
  if (param_1 == 0) {
    if (param_2 == 0x800) {
      DAT_20003494 = 0;
      DAT_20003f6d = 1;
      return;
    }
    if (param_2 == 0x400) {
      DAT_20003498 = 0;
      DAT_20003f6e = 1;
      return;
    }
    if (param_2 == 0x30000000) {
      DAT_20003496 = 0;
    }
    else {
      if (param_2 == 0x40000) {
        FUN_00029bd4(0,0x40000,&DAT_20003f48);
        *(undefined1 *)(extraout_r2 + 0x2b) = 1;
        uVar1 = 0;
        do {
          iVar2 = extraout_r2 + uVar1;
          uVar1 = uVar1 + 1 & 0xff;
          *(undefined1 *)(iVar2 + 0x30) = 0x1e;
          param_2 = extraout_r3;
        } while (uVar1 < 4);
      }
      if (param_2 == 0x80000) {
        FUN_00029bd4();
        *(undefined1 *)(extraout_r2_00 + 0x2b) = 2;
        uVar1 = 0;
        do {
          iVar2 = extraout_r2_00 + uVar1;
          uVar1 = uVar1 + 1 & 0xff;
          *(undefined1 *)(iVar2 + 0x30) = 0x32;
          param_2 = extraout_r3_00;
        } while (uVar1 < 4);
      }
      if (param_2 == 0x100000) {
        FUN_00029bd4();
        *(undefined1 *)(extraout_r2_01 + 0x2b) = 3;
        uVar1 = 0;
        do {
          iVar2 = extraout_r2_01 + uVar1;
          uVar1 = uVar1 + 1 & 0xff;
          *(undefined1 *)(iVar2 + 0x30) = 0x3c;
          param_2 = extraout_r3_01;
        } while (uVar1 < 4);
      }
      if (param_2 == 0x200000) {
        FUN_00029bd4();
        *(undefined1 *)(extraout_r2_02 + 0x2b) = 4;
        uVar1 = 0;
        do {
          iVar2 = extraout_r2_02 + uVar1;
          uVar1 = uVar1 + 1 & 0xff;
          *(undefined1 *)(iVar2 + 0x30) = 0x50;
          param_2 = extraout_r3_02;
        } while (uVar1 < 4);
      }
      if (param_2 == 0x40000000) {
        FUN_00029bd4();
        *(undefined1 *)(extraout_r2_03 + 0x2b) = 5;
        uVar1 = 0;
        do {
          iVar2 = extraout_r2_03 + uVar1;
          uVar1 = uVar1 + 1 & 0xff;
          *(undefined1 *)(iVar2 + 0x30) = 100;
        } while (uVar1 < 4);
        return;
      }
    }
  }
  return;
}


