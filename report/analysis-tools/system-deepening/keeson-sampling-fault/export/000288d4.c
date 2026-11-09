/* Static Ghidra pseudocode; not original source. */

void FUN_000288d4(void)

{
  int iVar1;
  char cVar2;
  undefined4 extraout_r3;
  undefined4 extraout_r3_00;
  undefined4 uVar3;
  undefined4 unaff_r4;
  undefined4 unaff_r5;
  int iVar4;
  undefined4 unaff_r6;
  
  FUN_00027aa8();
  if (DAT_20003f57 == '\x01') {
    FUN_0002e594();
    FUN_0003131c(100);
    DAT_20003f57 = '\x02';
    DAT_20003f6a = 1;
  }
  else if (DAT_20003f57 == '\x03') {
    FUN_0003131c(100);
    DAT_20003f57 = '\0';
  }
  if (DAT_20003fbe == '\x01') {
    DAT_20003fb7 = 0;
    DAT_20003fbe = '\0';
  }
  FUN_000286dc();
  FUN_00029c94();
  FUN_0002b56c();
  FUN_00026f40();
  FUN_00028e6c();
  FUN_0002a8a4();
  FUN_0002a098();
  FUN_00027194();
  FUN_000291a4();
  if (DAT_20003104 != 0) {
    return;
  }
  iVar4 = 0;
  uVar3 = extraout_r3;
  do {
    iVar1 = iVar4 * 0x28;
    cVar2 = (&DAT_20003be1)[iVar1];
    if (cVar2 == '\0') {
      if ((&DAT_20003f5e)[iVar4] != 0) {
LAB_0002b520:
        (&DAT_20003be2)[iVar1] = 2;
        goto LAB_0002b524;
      }
      if (DAT_20002af0 == 0) {
        if ((&DAT_20003be2)[iVar1] != '\x01') {
          FUN_00032c3c(0x140003," MOTOR_TOP = %d",iVar4,uVar3,unaff_r4,unaff_r5,unaff_r6);
          uVar3 = extraout_r3_00;
        }
        (&DAT_20003be2)[iVar1] = 1;
        cVar2 = (&DAT_20003be1)[iVar1];
        if (cVar2 != '\0') goto LAB_0002b512;
        goto LAB_0002b518;
      }
    }
    else {
LAB_0002b512:
      if (cVar2 == '\x01') {
LAB_0002b518:
        if ((&DAT_20003f5e)[iVar4] != 0) goto LAB_0002b520;
LAB_0002b524:
        if (((&DAT_20003be1)[iVar1] == '\x01') && ((&DAT_20003f5e)[iVar4] == 0)) {
          (&DAT_20003bc8)[iVar4 * 10] = 0;
          (&DAT_20003bcc)[iVar4 * 10] = 0;
          (&DAT_20003bd0)[iVar4 * 10] = 0;
          (&DAT_20003be2)[iVar1] = 0;
        }
      }
    }
    iVar4 = iVar4 + 1;
    if (3 < iVar4) {
      return;
    }
  } while( true );
}


