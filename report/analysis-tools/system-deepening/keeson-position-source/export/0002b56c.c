/* Static Ghidra pseudocode; not original source. */

void FUN_0002b56c(void)

{
  int iVar1;
  
  iVar1 = 0;
  do {
    if (((&DAT_20003be1)[iVar1 * 0x28] == '\x01') && ((&DAT_20003f5e)[iVar1] == 0)) {
      (&DAT_20003bc8)[iVar1 * 10] = 0;
      (&DAT_20003bcc)[iVar1 * 10] = 0;
      (&DAT_20003bd0)[iVar1 * 10] = 0;
    }
    iVar1 = iVar1 + 1;
  } while (iVar1 < 4);
  return;
}


