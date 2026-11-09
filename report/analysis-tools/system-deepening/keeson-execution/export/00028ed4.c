/* Static Ghidra pseudocode; not original source. */

void FUN_00028ed4(void)

{
  int iVar1;
  uint uVar2;
  uint uVar3;
  uint in_fpscr;
  float fVar4;
  undefined4 uVar5;
  float extraout_s4;
  float extraout_s5;
  float extraout_s6;
  float local_44 [4];
  short local_34 [2];
  short local_30 [2];
  short local_2c [2];
  short local_28 [2];
  short local_24 [4];
  
  local_34[0] = 0;
  local_30[0] = 0;
  local_2c[0] = 0;
  local_28[0] = 0;
  thunk_FUN_00033df0(0,local_34);
  thunk_FUN_00033df0(1,local_30);
  thunk_FUN_00033df0(2,local_2c);
  thunk_FUN_00033df0(3,local_28);
  local_24[0] = 0;
  if (DAT_20003548 == 0) {
    thunk_FUN_00033df0(0,local_24);
    fVar4 = (float)VectorSignedToFloat((int)local_24[0],(byte)(in_fpscr >> 0x16) & 3);
    uVar5 = VectorFloatToUnsigned(fVar4 * 0.3515625,3);
    DAT_20003f66 = (undefined2)uVar5;
  }
  local_44[0] = 0.0;
  local_44[1] = 0.0;
  local_44[2] = 0.0;
  local_44[3] = 0.0;
  uVar5 = VectorSignedToFloat((int)local_34[0],(byte)(in_fpscr >> 0x16) & 3);
  FUN_00030748(uVar5,0);
  uVar5 = VectorSignedToFloat((int)local_30[0],(byte)(in_fpscr >> 0x16) & 3);
  FUN_00030748(uVar5,1);
  uVar5 = VectorSignedToFloat((int)local_2c[0],(byte)(in_fpscr >> 0x16) & 3);
  FUN_00030748(uVar5,2);
  uVar5 = VectorSignedToFloat((int)local_28[0],(byte)(in_fpscr >> 0x16) & 3);
  fVar4 = (float)FUN_00030748(uVar5,3);
  DAT_200049b0 = extraout_s6 * 0.7 + DAT_200049b0 * 0.3;
  local_44[0] = DAT_200049b0;
  DAT_200049b4 = extraout_s4 * 0.7 + DAT_200049b4 * 0.3;
  local_44[1] = DAT_200049b4;
  DAT_200049b8 = extraout_s5 * 0.7 + DAT_200049b8 * 0.3;
  local_44[2] = DAT_200049b8;
  DAT_200049bc = fVar4 * 0.7 + DAT_200049bc * 0.3;
  local_44[3] = DAT_200049bc;
  uVar3 = 0;
  do {
    uVar2 = uVar3 + 1 & 0xff;
    (&DAT_20003be4)[uVar3 * 0x14] =
         (short)(int)(local_44[uVar3] - (float)(&DAT_200049c0)[uVar3 * 3]);
    uVar3 = uVar2;
  } while (uVar2 < 4);
  uVar3 = 0;
  do {
    if ((((DAT_20003be1 == '\x02') && (DAT_20003c09 == '\x02')) && (DAT_20003c31 == '\x02')) &&
       (DAT_20003c59 == '\x02')) {
      iVar1 = FUN_0002b8f0(2);
      if (2 < (uint)(iVar1 - (&DAT_200049a0)[uVar3])) {
        (&DAT_200049c0)[uVar3 * 3] = local_44[uVar3];
      }
    }
    else {
      uVar5 = FUN_0002b8f0(2);
      (&DAT_200049a0)[uVar3] = uVar5;
      (&DAT_20003bea)[uVar3 * 0x28] = 0;
    }
    if ((((&DAT_20003be1)[uVar3 * 0x28] == '\x02') || ((short)(&DAT_20003be4)[uVar3 * 0x14] < 0)) ||
       (0x7f00 < (short)(&DAT_20003be4)[uVar3 * 0x14])) {
      (&DAT_20003be4)[uVar3 * 0x14] = 0;
    }
    uVar3 = uVar3 + 1 & 0xff;
  } while (uVar3 < 4);
  return;
}


