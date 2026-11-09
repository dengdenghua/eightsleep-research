/* Reconstructed Ghidra pseudocode, not vendor source. */

void FUN_00434034(undefined8 *param_1,uint param_2,int param_3)

{
  undefined1 uVar1;
  undefined1 *puVar2;
  undefined1 *puVar3;
  void *__dest;
  undefined4 uVar4;
  undefined1 auStack_10030 [65536];
  
  puVar2 = &stack0xffffffffffffffd0;
  do {
    puVar3 = puVar2;
    *(undefined8 *)(puVar3 + -0x1000) = 0;
    puVar2 = puVar3 + -0x1000;
  } while (puVar3 + -0x1000 != auStack_10030);
  uVar1 = *PTR_DAT_009faac8;
  __dest = (void *)FUN_00318628(0x100b0,8);
  if (__dest != (void *)0x0) {
    FUN_0043426c(puVar3 + -0x10b0);
    memcpy(__dest,puVar3 + -0x10b0,0x100b0);
    if (0xff < param_2) {
      param_2 = 1;
    }
    uVar4 = 0;
    if (param_3 == 0) {
      uVar4 = 2;
    }
    FUN_004341d0(__dest,uVar4,param_2);
    param_1[1] = 0;
    param_1[2] = 0;
    *param_1 = __dest;
    return;
  }
                    /* WARNING: Subroutine does not return */
  FUN_0019139c(8,0x100b0);
}


