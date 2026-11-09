/* Ghidra static pseudocode; not original source. */

/* WARNING: Control flow encountered bad instruction data */

void FUN_0801de62(void)

{
  undefined4 uVar1;
  int iVar2;
  int iVar3;
  undefined1 *extraout_r3;
  uint unaff_r4;
  uint uVar4;
  undefined *puVar5;
  undefined1 *in_stack_000000dc;
  code *in_stack_000000e8;
  code *in_stack_000000f4;
  
  if (in_stack_000000f4 == (code *)0x0) {
    FUN_0801ce0c();
  }
  iVar2 = (*in_stack_000000e8)();
  uVar1 = DAT_200015b0;
  puVar5 = &DAT_2000c79c;
  do {
    uVar4 = unaff_r4 + 1 & 0xff;
    (*in_stack_000000f4)(puVar5,unaff_r4);
    puVar5 = puVar5 + 0x18;
    unaff_r4 = uVar4;
  } while (uVar4 != 5);
  iVar3 = 0x4c;
  if (iVar2 != 0) {
    iVar3 = (((iVar2 + -1) - (iVar2 + -2)) - (uint)(iVar2 + -1 == 0)) + 0x52;
  }
  FUN_0801ce08("[sys] applied platform pressure compensation defaults (sku=0x%02X side=%c)",uVar1,
               iVar3);
  if (in_stack_000000dc == (undefined1 *)0x0) {
    FUN_0801ce7e();
    in_stack_000000dc = extraout_r3;
  }
  *in_stack_000000dc = 2;
  FUN_0801ce7e();
                    /* WARNING: Bad instruction - Truncating control flow here */
  halt_baddata();
}


