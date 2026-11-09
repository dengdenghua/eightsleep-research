/* Ghidra static pseudocode; not original source. Read-only project; no target execution. */

void natsMsg_init(undefined8 *param_1,undefined8 param_2,undefined8 param_3,undefined4 param_4)

{
  param_1[2] = 0;
  param_1[3] = 0;
  param_1[6] = 0;
  param_1[7] = 0;
  *param_1 = 0;
  param_1[1] = 0;
  param_1[2] = param_2;
  param_1[4] = 0;
  param_1[5] = 0;
  param_1[6] = param_3;
  *(undefined4 *)(param_1 + 7) = param_4;
  param_1[8] = 0;
  param_1[9] = 0;
  param_1[10] = 0;
  param_1[0xb] = 0;
  param_1[0xc] = 0;
  return;
}


