/* Ghidra static pseudocode; not original source. Read-only project; no target execution. */

void FUN_0025e0b4(int *param_1)

{
  *(char *)(param_1 + 0xc4) = '\x01';
  while ((char)param_1[0xc4] != '\0') {
    FUN_0025dc30(param_1);
    if (-1 < *param_1) {
      inotify_rm_watch(*param_1,param_1[1]);
      close(*param_1);
    }
    param_1[0] = -1;
    param_1[1] = -1;
    FUN_00287d00(param_1 + 0xaa);
  }
  return;
}


