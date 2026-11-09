/* Static Ghidra pseudocode; not original source. */

void FUN_00029d9c(void)

{
  int iVar1;
  uint uVar2;
  int iVar3;
  
  uVar2 = 0;
  do {
    iVar1 = uVar2 * 0x28;
    if ((&DAT_20003be1)[iVar1] == '\0') {
      if ((&DAT_20003be2)[iVar1] != '\x01') {
        if ((&DAT_20003bd0)[uVar2 * 10] != -1) {
          iVar3 = (&DAT_20003bd0)[uVar2 * 10] + 1;
          (&DAT_20003bd0)[uVar2 * 10] = iVar3;
          (&DAT_20003bc8)[uVar2 * 10] = iVar3;
        }
        goto LAB_00029de4;
      }
    }
    else if ((&DAT_20003be1)[iVar1] == '\x01') {
      if (0 < (int)(&DAT_20003bd0)[uVar2 * 10]) {
        iVar3 = (&DAT_20003bd0)[uVar2 * 10] + -1;
        (&DAT_20003bd0)[uVar2 * 10] = iVar3;
        (&DAT_20003bc8)[uVar2 * 10] = iVar3;
      }
LAB_00029de4:
      (&DAT_20003be2)[iVar1] = 2;
      (&DAT_20003f5e)[uVar2] = 100;
    }
    uVar2 = uVar2 + 1 & 0xff;
    if (3 < uVar2) {
      return;
    }
  } while( true );
}


