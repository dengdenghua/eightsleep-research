/* Ghidra static pseudocode; not original source. Read-only project; no target execution. */

/* WARNING: Heritage AFTER dead removal. Example location: x0 : 0x0017bebc */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void _INIT_5(undefined8 param_1)

{
  undefined8 *puVar1;
  undefined *puVar2;
  int iVar3;
  void *__s;
  size_t sVar4;
  long lVar5;
  undefined8 *puVar6;
  undefined8 local_78;
  undefined8 uStack_70;
  code *local_68 [2];
  code *local_58;
  code *pcStack_50;
  undefined1 auStack_48 [16];
  code *local_38;
  code *pcStack_30;
  undefined1 auStack_28 [16];
  code *local_18;
  code *pcStack_10;
  long local_8;
  
  local_8 = *(long *)PTR___stack_chk_guard_005df758;
  std::ios_base::Init::Init((Init *)&DAT_005e3f78);
  __cxa_atexit(PTR__Init_005dfff8,&DAT_005e3f78,&PTR_LOOP_005e0008);
  __cxa_atexit(FUN_0018f2a0,&PTR_PTR_005e0208,&PTR_LOOP_005e0008);
  __cxa_atexit(FUN_0018f290,&PTR_PTR_005e0210,&PTR_LOOP_005e0008);
  __cxa_atexit(FUN_0018f280,&PTR_PTR_005e0218,&PTR_LOOP_005e0008);
  FUN_00193f60();
  iVar3 = (int)param_1;
  if (((DAT_005e3cd0 & 1) == 0) && (__cxa_guard_acquire(&DAT_005e3cd0), iVar3 != 0)) {
    __cxa_atexit(FUN_0018feb0,&PTR_PTR_005e00a8,&PTR_LOOP_005e0008);
    __cxa_guard_release(&DAT_005e3cd0);
  }
  if (((DAT_005e3cc8 & 1) == 0) && (__cxa_guard_acquire(&DAT_005e3cc8), iVar3 != 0)) {
    __cxa_atexit(FUN_0018ff10,&PTR_PTR_005e00a0,&PTR_LOOP_005e0008);
    __cxa_guard_release(&DAT_005e3cc8);
  }
  if (((DAT_005e3cc0 & 1) == 0) && (__cxa_guard_acquire(&DAT_005e3cc0), iVar3 != 0)) {
    __cxa_atexit(FUN_0018fe50,&PTR_PTR_005e0098,&PTR_LOOP_005e0008);
    __cxa_guard_release(&DAT_005e3cc0);
  }
  if ((DAT_005e3b30 & 1) == 0) {
    DAT_005e3b30 = 1;
    __s = operator_new(param_1,0x40);
    memset(__s,0,0x6c0);
    FUN_0019a970(__s);
    DAT_005e3b98 = __s;
  }
  FUN_00198b80(&local_78,&DAT_00461178);
  puVar2 = PTR_s_SEQNO_RAW_005e0220;
  puVar6 = &DAT_005e4010;
  DAT_005e4028 = 0;
  DAT_005e402c = 0;
  DAT_005e3f80 = &PTR_FUN_0058d920;
  DAT_005e3f88 = local_78;
  DAT_005e4018 = 1;
  DAT_005e3f90 = uStack_70;
  DAT_005e4030 = &PTR_FUN_0058d8d0;
  DAT_005e3fa8 = &PTR_FUN_0058d8d0;
  DAT_005e4088 = 0;
  DAT_005e4090 = 0;
  DAT_005e4000 = 0;
  DAT_005e4098 = 0;
  DAT_005e4008 = 0;
  DAT_005e4010 = 0;
  DAT_005e40a8 = 8;
  _DAT_005e4020 = 0;
  DAT_005e40a0 = 0;
  if (PTR_s_SEQNO_RAW_005e0220 != (undefined *)0x0) {
    sVar4 = strlen(PTR_s_SEQNO_RAW_005e0220);
    if (0xc < sVar4) {
      sVar4 = 0xc;
    }
    puVar6 = (undefined8 *)((long)&DAT_005e4010 + sVar4);
    __memcpy_chk(&DAT_005e4020,puVar2,sVar4,0x90);
  }
  *(undefined1 *)(puVar6 + 2) = 0;
  __cxa_atexit(FUN_001f0090,&DAT_005e4010,&PTR_LOOP_005e0008);
  DAT_005e40b0 = 0;
  local_68[0] = thunk_FUN_00252dc0;
  local_58 = FUN_00190530;
  pcStack_50 = FUN_0018eab0;
  memset(&DAT_005e40b8,0,0x10c0);
  puVar6 = (undefined8 *)&DAT_005e40b8;
  do {
    puVar1 = (undefined8 *)((long)puVar6 + 0x10c);
    memset(puVar6,0,0x100);
    *(undefined4 *)(puVar6 + 0x20) = 0;
    *(undefined2 *)((long)puVar6 + 0x104) = 0;
    *(undefined4 *)(puVar6 + 0x21) = 0;
    puVar6 = puVar1;
  } while (puVar1 != &DAT_005e5178);
  DAT_005e51d8 = 0;
  DAT_005e5178 = 0;
  DAT_005e5180 = 0;
  DAT_005e5188 = 0;
  DAT_005e5190 = 0;
  DAT_005e5198 = 0;
  DAT_005e51a0 = 0;
  DAT_005e51a8 = 0;
  DAT_005e51b0 = 0;
  DAT_005e51b8 = 0;
  DAT_005e51c0 = 0;
  DAT_005e51c8 = 0;
  DAT_005e51d0 = 0;
  DAT_005e51ec = 0;
  DAT_005e51f4 = 0;
  DAT_005e51fc = 0;
  DAT_005e5204 = 0;
  DAT_005e5210 = 0;
  DAT_005e5218 = 0;
  DAT_005e5224 = 0;
  DAT_005e522c = 0;
  DAT_005e5234 = 0;
  DAT_005e5238 = 0;
  DAT_005e5240 = 0;
  DAT_005e5260 = 0;
  DAT_005e5268 = 0;
  DAT_005e51e0 = 0;
  DAT_005e5208 = 0;
  DAT_005e5248 = 0;
  DAT_005e5250 = 0;
  DAT_005e5258 = 0;
  DAT_005e5278 = 0;
  DAT_005e5280 = 0;
  DAT_005e52b0 = 0;
  DAT_005e52dc = 0;
  DAT_005e52e4 = 0;
  DAT_005e52ec = 0;
  DAT_005e52f4 = 0;
  DAT_005e5318 = 0;
  DAT_005e5344 = 0;
  DAT_005e534c = 0;
  DAT_005e5354 = 0;
  DAT_005e535c = 0;
  DAT_005e5388 = 0;
  DAT_005e53a8 = 0;
  DAT_005e5288 = 0;
  DAT_005e5298 = 0;
  DAT_005e52a0 = &DAT_005e52b0;
  DAT_005e52a8 = 0;
  DAT_005e52c0 = 0;
  DAT_005e52c8 = 0;
  DAT_005e52d0 = 0;
  DAT_005e5300 = 0;
  DAT_005e5308 = &DAT_005e5318;
  DAT_005e5310 = 0;
  DAT_005e5328 = 0;
  DAT_005e5330 = 0;
  DAT_005e5338 = 0;
  DAT_005e5368 = 0;
  DAT_005e5378 = &DAT_005e5388;
  DAT_005e5380 = 0;
  DAT_005e5398 = &DAT_005e53a8;
  DAT_005e53a0 = 0;
  DAT_005e53b8 = &DAT_005e53c8;
  DAT_005e53c0 = 0;
  DAT_005e53c8 = 0;
  DAT_005e53d8 = 0;
  DAT_005e53f8 = 0;
  DAT_005e5418 = 0;
  DAT_005e5438 = 0;
  DAT_005e5448 = 0;
  DAT_005e54a8 = 0;
  DAT_005e54e0 = 0;
  DAT_005e5518 = 0;
  DAT_005e53e8 = &DAT_005e53f8;
  DAT_005e53f0 = 0;
  DAT_005e5408 = &DAT_005e5418;
  DAT_005e5410 = 0;
  DAT_005e5428 = &DAT_005e5438;
  DAT_005e5430 = 0;
  DAT_005e5450 = 0;
  DAT_005e5458 = &DAT_005e5488;
  DAT_005e5460 = 1;
  DAT_005e5468 = 0;
  DAT_005e5470 = 0;
  DAT_005e5478 = 0x3f800000;
  DAT_005e5480 = 0;
  DAT_005e5488 = 0;
  DAT_005e5490 = 0;
  DAT_005e5498 = &DAT_005e54a8;
  DAT_005e54a0 = 0;
  DAT_005e54c8 = 0;
  DAT_005e54d0 = &DAT_005e54e0;
  DAT_005e54d8 = 0;
  DAT_005e5500 = 0;
  DAT_005e5508 = &DAT_005e5518;
  DAT_005e5510 = 0;
  DAT_005e5528 = &DAT_005e5538;
  DAT_005e5530 = 0;
  DAT_005e5538 = 0;
  DAT_005e5558 = 0;
  DAT_005e5578 = 0;
  DAT_005e5600 = 0;
  DAT_005e566c = 0;
  DAT_005e5548 = &DAT_005e5558;
  DAT_005e5550 = 0;
  DAT_005e5570 = 0;
  DAT_005e5580 = 0;
  DAT_005e5588 = 0;
  DAT_005e5590 = 0;
  FUN_001fe650(&DAT_005e5670);
  DAT_005e5bf0 = 0;
  DAT_005e5bf8 = 0;
  DAT_005e5ba8 = 0;
  DAT_005e5bb8 = 0;
  DAT_005e5bc0 = 0;
  DAT_005e5be0 = 0;
  DAT_005e5c08 = 0;
  DAT_005e5c10 = 0;
  DAT_005e5c14 = 0;
  local_38 = (code *)0x0;
  DAT_005e5b8c = 0;
  DAT_005e5b88 = 0;
  DAT_005e5b90 = &DAT_005e5bc0;
  DAT_005e5b98 = 1;
  DAT_005e5ba0 = 0;
  DAT_005e5bc8 = &DAT_005e5bf8;
  DAT_005e5bd0 = 1;
  DAT_005e5bd8 = 0;
  DAT_005e5c00 = &DAT_005e3f80;
  DAT_005e5c18 = 0;
  DAT_005e5c20 = &DAT_005e4010;
  _DAT_005e5bb0 = 0x3f800000;
  _DAT_005e5be8 = 0x3f800000;
  if (local_58 == (code *)0x0) {
    DAT_005e5c28 = 0;
    _DAT_005e5c30 = _DAT_005e5c30 & 0xffffffff00000000;
  }
  else {
    (*local_58)(auStack_48,local_68,2);
    local_18 = (code *)0x0;
    local_38 = local_58;
    pcStack_30 = pcStack_50;
    DAT_005e5c28 = 0;
    if (local_58 == (code *)0x0) {
      _DAT_005e5c30 = 0;
      DAT_005e5c58 = 0;
      DAT_005e5c48 = (code *)0x0;
      goto LAB_0017c398;
    }
    (*local_58)(auStack_28,auStack_48,2);
    local_18 = local_38;
    pcStack_10 = pcStack_30;
    _DAT_005e5c30 = _DAT_005e5c30 & 0xffffffff00000000;
    DAT_005e5c48 = (code *)0x0;
    if (local_38 != (code *)0x0) {
      (*local_38)(&DAT_005e5c38,auStack_28,2);
      DAT_005e5c48 = local_18;
      DAT_005e5c50 = pcStack_10;
      DAT_005e5c58 = 0;
      if (local_18 != (code *)0x0) {
        (*local_18)(auStack_28,auStack_28,3);
      }
      goto LAB_0017c398;
    }
  }
  DAT_005e5c48 = (code *)0x0;
  DAT_005e5c58 = 0;
LAB_0017c398:
  if (local_38 != (code *)0x0) {
    (*local_38)(auStack_48,auStack_48,3);
  }
  DAT_005e5c60 = 900000;
  DAT_005e5c68 = 0;
  FUN_00194470(local_68);
  __cxa_atexit(FUN_001f9080,&DAT_005e40b0,&PTR_LOOP_005e0008);
  if ((DAT_005e3b28 & 1) == 0) {
    DAT_005e3b28 = 1;
    FUN_001a2aa0(&DAT_005e3b90);
    __cxa_atexit(FUN_00190140,&DAT_005e3b90,&PTR_LOOP_005e0008);
  }
  if ((DAT_005e3b20 & 1) == 0) {
    DAT_005e3b20 = 1;
    FUN_001a2aa0(&DAT_005e3b88);
    __cxa_atexit(FUN_00190150,&DAT_005e3b88,&PTR_LOOP_005e0008);
  }
  if ((DAT_005e3b18 & 1) == 0) {
    DAT_005e3b18 = 1;
    __cxa_atexit(FUN_0018f2b0,&DAT_005e3b80,&PTR_LOOP_005e0008);
  }
  if ((DAT_005e3b10 & 1) == 0) {
    DAT_005e3b10 = 1;
    FUN_001a2aa0(&DAT_005e3b78);
    __cxa_atexit(FUN_00190160,&DAT_005e3b78,&PTR_LOOP_005e0008);
  }
  if ((DAT_005e3b00 & 1) == 0) {
    DAT_005e3b00 = 1;
    __cxa_atexit(FUN_0018f2c0,&DAT_005e3b60,&PTR_LOOP_005e0008);
  }
  if ((DAT_005e3af8 & 1) == 0) {
    DAT_005e3af8 = 1;
    __cxa_atexit(FUN_0018f2d0,&DAT_005e3b58,&PTR_LOOP_005e0008);
  }
  if ((DAT_005e3af0 & 1) == 0) {
    DAT_005e3af0 = 1;
    lVar5 = local_8 - *(long *)PTR___stack_chk_guard_005df758;
    if (lVar5 == 0) {
      __cxa_atexit(FUN_0018f2e0,&DAT_005e3b50,&PTR_LOOP_005e0008);
      return;
    }
  }
  else {
    lVar5 = local_8 - *(long *)PTR___stack_chk_guard_005df758;
    if (lVar5 == 0) {
      return;
    }
  }
                    /* WARNING: Subroutine does not return */
  __stack_chk_fail(PTR___stack_chk_guard_005df758,lVar5,0);
}


