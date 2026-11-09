/* Ghidra static pseudocode; not original source. */

void FUN_080217a0(char *param_1)

{
  if (((param_1 != (char *)0x0) && (param_1[0x14c] != '\0')) && (*param_1 == '\x04')) {
    param_1[0x148] = '\0';
    param_1[0x149] = '\0';
    param_1[0x14a] = '\0';
    param_1[0x14b] = '\0';
    *param_1 = '\0';
  }
  return;
}


