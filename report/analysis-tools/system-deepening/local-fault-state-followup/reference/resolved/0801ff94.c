/* Ghidra static pseudocode; not original source. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_0801ff94(undefined4 *param_1,undefined4 *param_2,undefined4 *param_3,undefined4 *param_4,
                 int param_5)

{
  undefined4 local_64 [2];
  undefined4 local_5c;
  undefined4 local_58 [4];
  undefined4 local_48;
  int local_44;
  undefined4 local_40;
  undefined4 local_3c;
  undefined4 local_38;
  undefined4 local_34;
  undefined4 local_30;
  undefined4 local_2c;
  undefined4 local_24;
  
  _DAT_40021034 = _DAT_40021034 | 0x1e;
  _DAT_4002103c = _DAT_4002103c | 6;
  _DAT_40021040 = _DAT_40021040 | 0x10800;
  local_48 = 8;
  local_44 = param_5;
  local_3c = 3;
  local_38 = 1;
  local_40 = 0;
  FUN_08012654(0x50001000,&local_48);
  local_48 = 0x10;
  FUN_08012654(0x50001000,&local_48);
  local_44 = 2;
  local_48 = 0x2000;
  local_38 = 1;
  FUN_08012654(0x50001000,&local_48);
  local_48 = 0x4000;
  FUN_08012654(0x50001000,&local_48);
  local_48 = 0x20;
  local_38 = 1;
  FUN_08012654(0x50001000,&local_48);
  local_48 = 0x40;
  FUN_08012654(0x50001000,&local_48);
  local_48 = 0x100;
  local_38 = 2;
  FUN_08012654(0x50000800,&local_48);
  local_48 = 0x200;
  FUN_08012654(0x50000800,&local_48);
  local_38 = 2;
  local_48 = 0x1000;
  FUN_08012654(0x50000c00,&local_48);
  local_48 = 0x2000;
  FUN_08012654(0x50000c00,&local_48);
  local_38 = 2;
  local_48 = 0x4000;
  FUN_08012654(0x50000c00,&local_48);
  local_48 = 0x8000;
  FUN_08012654(0x50000c00,&local_48);
  local_48 = 0x4000;
  local_38 = 5;
  FUN_08012654(0x50000400,&local_48);
  local_48 = 0x8000;
  FUN_08012654(0x50000400,&local_48);
  FUN_0801066c(local_58,0,0x10);
  FUN_0801066c(local_64,0,0xc);
  FUN_0801066c(&local_34,0,0x1c);
  DAT_2000d200 = 0x40000400;
  DAT_2000d204 = 0x3f;
  DAT_2000d20c = 0x31;
  DAT_2000d218 = 0x80;
  DAT_2000d208 = 0;
  DAT_2000d210 = 0;
  FUN_08014a5c(&DAT_2000d200);
  local_58[0] = 0x1000;
  FUN_08014704(&DAT_2000d200,local_58);
  FUN_08014ac4(&DAT_2000d200);
  local_64[0] = 0;
  local_5c = 0;
  FUN_08014b2c(&DAT_2000d200,local_64);
  local_34 = 0x60;
  local_30 = 0;
  local_2c = 0;
  local_24 = 0;
  FUN_080145e0(&DAT_2000d200,&local_34,0);
  FUN_080145e0(&DAT_2000d200,&local_34,4);
  FUN_080145e0(&DAT_2000d200,&local_34,8);
  FUN_080145e0(&DAT_2000d200,&local_34,0xc);
  if (param_5 == 0x12) {
    FUN_08014928(&DAT_2000d200,0);
    FUN_08014928(&DAT_2000d200,4);
  }
  DAT_2000d144 = 0x40012c00;
  DAT_2000d150 = 0x31;
  DAT_2000d15c = 0x80;
  DAT_2000d148 = 0x3f;
  DAT_2000d14c = 0;
  DAT_2000d154 = 0;
  FUN_08014a5c(&DAT_2000d144);
  FUN_08014ac4(&DAT_2000d144);
  FUN_080145e0(&DAT_2000d144,&local_34,0);
  FUN_080145e0(&DAT_2000d144,&local_34,4);
  FUN_080145e0(&DAT_2000d144,&local_34,8);
  FUN_080145e0(&DAT_2000d144,&local_34,0xc);
  *(uint *)(DAT_2000d144 + 0x44) = *(uint *)(DAT_2000d144 + 0x44) | 0x8000;
  DAT_2000d088 = 0x40000800;
  DAT_2000d094 = 0x31;
  DAT_2000d0a0 = 0x80;
  DAT_2000d08c = 0x3f;
  DAT_2000d090 = 0;
  DAT_2000d098 = 0;
  FUN_08014a5c(&DAT_2000d088);
  FUN_08014ac4(&DAT_2000d088);
  FUN_080145e0(&DAT_2000d088,&local_34,0);
  FUN_080145e0(&DAT_2000d088,&local_34,4);
  FUN_080145e0(&DAT_2000d088,&local_34,8);
  FUN_080145e0(&DAT_2000d088,&local_34,0xc);
  DAT_2000cfcc = 0x40014000;
  DAT_2000cfd0 = 0x3f;
  DAT_2000cfd8 = 0x31;
  DAT_2000cfe4 = 0x80;
  DAT_2000cfd4 = 0;
  DAT_2000cfdc = 0;
  FUN_08014a5c(&DAT_2000cfcc);
  FUN_08014ac4(&DAT_2000cfcc);
  FUN_080145e0(&DAT_2000cfcc,&local_34,0);
  FUN_080145e0(&DAT_2000cfcc,&local_34,4);
  *(uint *)(DAT_2000cfcc + 0x44) = *(uint *)(DAT_2000cfcc + 0x44) | 0x8000;
  *param_1 = &DAT_2000d200;
  *param_2 = &DAT_2000d144;
  *param_3 = &DAT_2000d088;
  *param_4 = &DAT_2000cfcc;
  return;
}


