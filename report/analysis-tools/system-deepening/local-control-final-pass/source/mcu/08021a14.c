/* Ghidra static pseudocode; not original source. */

void FUN_08021a14(char *param_1,int param_2,int param_3,uint param_4,byte param_5,byte param_6,
                 uint param_7,byte param_8,uint param_9)

{
  if (*param_1 != '\0') {
    if (param_2 - 1U < 1000) {
      *(int *)(param_1 + 0x14) = param_2;
    }
    if (param_3 - 1U < 100) {
      param_1[0x18] = (char)param_3;
    }
    if (param_4 < 0x2711) {
      *(uint *)(param_1 + 0x1c) = param_4;
    }
    if (param_5 - 1 < 100) {
      param_1[0x20] = param_5;
    }
    if (param_6 < 0x65) {
      param_1[0x21] = param_6;
    }
    if (param_7 < 0x7d1) {
      *(uint *)(param_1 + 0x24) = param_7;
    }
    if (param_8 < 0x65) {
      param_1[0x28] = param_8;
    }
    if (param_9 < 0x7d1) {
      *(uint *)(param_1 + 0x2c) = param_9;
    }
    FUN_08017634("[solenoid:%u] config: ramp=%ums/%u%% hold=%ums maintain=%u%% close=%u%%/%ums->%u%%/%ums->0"
                 ,param_1[0x4d],*(undefined4 *)(param_1 + 0x14),param_1[0x18],
                 *(undefined4 *)(param_1 + 0x1c),param_1[0x20],param_1[0x21],
                 *(undefined4 *)(param_1 + 0x24),param_1[0x28],*(undefined4 *)(param_1 + 0x2c));
  }
  return;
}


