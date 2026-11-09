/* Reconstructed Ghidra pseudocode, not vendor source. */

void FUN_00604b48(undefined1 *param_1,long *param_2)

{
  ulong uVar1;
  uint uVar2;
  ulong uVar3;
  long lVar4;
  uint uVar5;
  undefined1 uVar6;
  long lVar7;
  long lVar8;
  byte local_70;
  uint uStack_6f;
  undefined2 uStack_6b;
  undefined1 uStack_69;
  undefined5 uStack_68;
  undefined2 uStack_63;
  undefined1 uStack_61;
  undefined1 uStack_60;
  undefined8 local_50;
  undefined4 local_48;
  long local_40;
  ulong uStack_38;
  
  lVar4 = param_2[1];
  uVar1 = param_2[2];
  uVar3 = FUN_00605250(lVar4,uVar1);
  if ((uVar3 & 1) == 0) {
    lVar8 = param_2[1];
    lVar7 = *param_2;
    lVar4 = param_2[2];
    *param_1 = 0;
    uStack_61 = (undefined1)lVar8;
    uStack_69 = (undefined1)lVar7;
    *(ulong *)(param_1 + 9) = CONCAT17(uStack_61,(int7)((ulong)lVar7 >> 8));
    *(ulong *)(param_1 + 1) = CONCAT17(uStack_69,CONCAT25(uStack_6b,CONCAT41(uStack_6f,local_70)));
    *(long *)(param_1 + 0x18) = lVar4;
    *(long *)(param_1 + 0x10) = lVar8;
    return;
  }
  lVar7 = *param_2;
  if (uVar1 < 0x10) {
    local_70 = (byte)lVar4;
    uStack_6f = (uint)((ulong)lVar4 >> 8);
    uStack_6b = (undefined2)((ulong)lVar4 >> 0x28);
    uStack_69 = (undefined1)((ulong)lVar4 >> 0x38);
    uStack_68 = (undefined5)uVar1;
    uStack_63 = (undefined2)(uVar1 >> 0x28);
    uStack_61 = (undefined1)(uVar1 >> 0x38);
    uVar3 = FUN_00601c98(&local_70);
    if ((CONCAT17(uStack_61,CONCAT25(uStack_63,uStack_68)) != 0) || ((uVar3 & 1) == 0))
    goto LAB_00604be4;
    uVar6 = 0;
    uVar5 = (uint)uVar3 >> 8;
    uVar2 = (uint)(uVar3 >> 8);
  }
  else {
LAB_00604be4:
    local_40 = lVar4;
    uStack_38 = uVar1;
    FUN_00601b30(&local_70,&local_40,1);
    if ((local_70 & 1) != 0) {
      *param_1 = 2;
      goto joined_r0x00604c08;
    }
    local_50 = CONCAT53(uStack_68,CONCAT12(uStack_69,uStack_6b));
    local_48 = CONCAT13(uStack_60,CONCAT12(uStack_61,uStack_63));
    uVar6 = 1;
    uVar5 = uStack_6f;
    uVar2 = uStack_6f;
  }
  param_1[1] = uVar6;
  *param_1 = 1;
  *(uint *)(param_1 + 2) = uVar5 & 0xff | uVar2 & 0xffffff00;
  *(undefined8 *)(param_1 + 6) = local_50;
  *(undefined4 *)(param_1 + 0xe) = local_48;
joined_r0x00604c08:
  if (lVar7 != 0) {
    FUN_0031865c(lVar4,lVar7,1);
    return;
  }
  return;
}


