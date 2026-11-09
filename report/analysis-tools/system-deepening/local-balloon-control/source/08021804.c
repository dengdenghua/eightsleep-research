/* Ghidra static pseudocode; not original source. */

void FUN_08021804(char *param_1,int param_2)

{
  if ((param_1 != (char *)0x0) && (*param_1 != '\0')) {
    if (param_1[0x34] != '\0') {
      if (param_2 == 0) {
        FUN_0801ef58();
      }
      else {
        *(undefined1 **)(param_1 + 0x30) = &LAB_0801ef9c_1;
        param_1[0x34] = '\x01';
        param_1[0x48] = '\0';
        param_1[0x49] = '\0';
        *(int *)(param_1 + 0x44) = param_2;
        FUN_08017484(param_1 + 0x38);
        FUN_08017006(param_1 + 0x38);
        FUN_08017634("[solenoid:%u] scheduled %s after %ums delay",param_1[0x4d],"close",param_2);
      }
    }
  }
  return;
}


