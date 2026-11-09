/* Static Ghidra pseudocode; not original source. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined4 FUN_00031608(byte *param_1,undefined4 param_2)

{
  undefined4 uVar1;
  
  if (param_1 == (byte *)0x0) {
    param_1 = &DAT_00036c24;
  }
  if (DAT_200053e8 == '\0') {
    _DAT_400075f0 = (uint)*param_1;
    _DAT_400075f4 = (uint)param_1[1];
    DAT_200053ea = param_1[3];
    DAT_200053e8 = '\x01';
    DAT_200053cc = 0;
    DAT_200053e9 = 0;
    DAT_200053d0 = 0;
    DAT_200053eb = 0;
    _DAT_40007308 = 0x7fffffff;
    DAT_200053bc = param_2;
    FUN_000331ac(0x104);
    FUN_000331ac(0x100);
    DAT_e000e407 = param_1[2] << 5;
    _DAT_e000e280 = 0x80;
    _DAT_e000e100 = 0x80;
    _DAT_40007304 = 2;
    if (DAT_200053ea != 0) {
      _DAT_40007304 = 1;
    }
    _DAT_40007500 = 1;
    uVar1 = 0;
  }
  else {
    uVar1 = 8;
  }
  return uVar1;
}


