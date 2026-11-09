/* Reconstructed Ghidra pseudocode, not vendor source. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_0043426c(void *param_1)

{
  undefined1 uVar1;
  undefined8 uVar2;
  undefined8 uVar3;
  undefined *puVar4;
  void *__s;
  void *__s_00;
  undefined8 local_78;
  undefined8 uStack_70;
  undefined8 local_68;
  undefined8 uStack_60;
  undefined8 local_58;
  undefined8 uStack_50;
  undefined8 local_48;
  undefined8 uStack_40;
  undefined1 local_38;
  undefined7 uStack_37;
  
  puVar4 = PTR_DAT_009faac8;
  uVar1 = *PTR_DAT_009faac8;
  __s = (void *)FUN_00318628(0x14ccc,1);
  if (__s == (void *)0x0) {
                    /* WARNING: Subroutine does not return */
    FUN_0019139c(1,0x14ccc);
  }
  memset(__s,0,0x14ccc);
  uVar1 = *puVar4;
  __s_00 = (void *)FUN_00318628(0x10e0,2);
  if (__s_00 != (void *)0x0) {
    memset(__s_00,0,0x10e0);
    FUN_00437f60(&local_78);
    local_38 = 0x20;
    uStack_60 = DAT_007967f8;
    uStack_50 = 0;
    local_58 = 0;
    uStack_40 = 0;
    local_48 = 0;
    memset(param_1,0,0x10000);
    uVar3 = _UNK_0077e068;
    uVar2 = _DAT_0077e060;
    *(void **)((long)param_1 + 0x10078) = __s;
    *(undefined8 *)((long)param_1 + 0x10008) = uVar3;
    *(undefined8 *)((long)param_1 + 0x10000) = uVar2;
    uVar2 = DAT_007967f0;
    *(undefined8 *)((long)param_1 + 0x10070) = 0;
    *(undefined8 *)((long)param_1 + 0x10068) = 0;
    *(undefined4 *)((long)param_1 + 0x10080) = 0x1010;
    *(undefined8 *)((long)param_1 + 0x10010) = uVar2;
    *(undefined8 *)((long)param_1 + 0x1008c) = 0;
    *(undefined8 *)((long)param_1 + 0x10084) = 0;
    *(undefined4 *)((long)param_1 + 0x10094) = 0;
    *(undefined4 *)((long)param_1 + 0x10098) = 1;
    *(undefined8 *)((long)param_1 + 0x100a4) = 0;
    *(undefined8 *)((long)param_1 + 0x1009c) = 0;
    *(void **)((long)param_1 + 0x10060) = __s_00;
    *(undefined8 *)((long)param_1 + 0x10040) = uStack_50;
    *(undefined8 *)((long)param_1 + 0x10038) = local_58;
    *(undefined8 *)((long)param_1 + 0x10050) = uStack_40;
    *(undefined8 *)((long)param_1 + 0x10048) = local_48;
    *(ulong *)((long)param_1 + 0x10058) = CONCAT71(uStack_37,local_38);
    *(undefined8 *)((long)param_1 + 0x10020) = uStack_70;
    *(undefined8 *)((long)param_1 + 0x10018) = local_78;
    *(undefined8 *)((long)param_1 + 0x10030) = uStack_60;
    *(undefined8 *)((long)param_1 + 0x10028) = local_68;
    return;
  }
                    /* WARNING: Subroutine does not return */
  FUN_0019139c(2,0x10e0);
}


