/* Ghidra static pseudocode; not original source. */

/* WARNING: Control flow encountered bad instruction data */

void FUN_0801de3a(char param_1,undefined4 param_2,int param_3,undefined4 *param_4)

{
  int iVar1;
  int iVar2;
  undefined1 *extraout_r3;
  uint uVar3;
  uint uVar4;
  undefined4 uVar5;
  undefined *puVar6;
  undefined4 uVar7;
  undefined4 uStack00000020;
  uint uStack00000024;
  undefined1 *in_stack_000000dc;
  code *in_stack_000000e8;
  code *in_stack_000000f4;
  
  uStack00000020 = *(undefined4 *)(param_3 + 0x14);
  uVar7 = *(undefined4 *)(param_3 + 0xc);
  uVar3 = *(uint *)(param_3 + 0x18);
  uVar5 = *(undefined4 *)(param_3 + 0x10);
  param_4[1] = *(undefined4 *)(param_3 + 8);
  *param_4 = uVar7;
  param_4[3] = uStack00000020;
  param_4[2] = uVar5;
  param_4[4] = uVar3;
  uStack00000024 = uVar3;
  FUN_0801cdfc(param_1 + '\x01',param_2,param_3 + 0x18,param_4 + 6);
  if (in_stack_000000f4 == (code *)0x0) {
    FUN_0801ce0c();
  }
  iVar1 = (*in_stack_000000e8)();
  uVar5 = DAT_200015b0;
  puVar6 = &DAT_2000c79c;
  do {
    uVar4 = uVar3 + 1 & 0xff;
    (*in_stack_000000f4)(puVar6,uVar3);
    puVar6 = puVar6 + 0x18;
    uVar3 = uVar4;
  } while (uVar4 != 5);
  iVar2 = 0x4c;
  if (iVar1 != 0) {
    iVar2 = (((iVar1 + -1) - (iVar1 + -2)) - (uint)(iVar1 + -1 == 0)) + 0x52;
  }
  FUN_0801ce08("[sys] applied platform pressure compensation defaults (sku=0x%02X side=%c)",uVar5,
               iVar2);
  if (in_stack_000000dc == (undefined1 *)0x0) {
    FUN_0801ce7e();
    in_stack_000000dc = extraout_r3;
  }
  *in_stack_000000dc = 2;
  FUN_0801ce7e();
                    /* WARNING: Bad instruction - Truncating control flow here */
  halt_baddata();
}


