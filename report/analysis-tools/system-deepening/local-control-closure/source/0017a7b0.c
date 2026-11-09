/* Ghidra static pseudocode; not original source. */

/* WARNING: Heritage AFTER dead removal. Example location: x0 : 0x0017a8c8 */
/* WARNING: Restarted to delay deadcode elimination for space: ram */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void FUN_0017a7b0(undefined8 param_1)

{
  undefined8 uVar1;
  int iVar2;
  void *pvVar3;
  undefined8 *puVar4;
  long lVar5;
  undefined1 auStack_c0 [8];
  undefined4 local_b8;
  undefined4 uStack_b4;
  undefined8 uStack_b0;
  undefined1 auStack_a8 [32];
  code *local_88 [2];
  code *local_78;
  code *pcStack_70;
  string *local_68;
  undefined8 uStack_60;
  _List *local_58;
  code *pcStack_50;
  _List a_Stack_48 [8];
  char local_40;
  undefined8 local_38;
  undefined8 uStack_30;
  undefined1 *local_28 [2];
  undefined1 auStack_18 [16];
  long local_8;
  
  local_8 = *(long *)PTR___stack_chk_guard_005df758;
  FUN_00193f60(PTR___stack_chk_guard_005df758,0);
  iVar2 = (int)param_1;
  if ((DAT_005e3cd0 & 1) == 0) {
    __cxa_guard_acquire(&DAT_005e3cd0);
    if (iVar2 != 0) {
      __cxa_atexit(FUN_0018feb0,&PTR_PTR_005e00a8,&PTR_LOOP_005e0008);
      __cxa_guard_release(&DAT_005e3cd0);
    }
  }
  if ((DAT_005e3cc8 & 1) == 0) {
    __cxa_guard_acquire(&DAT_005e3cc8);
    if (iVar2 != 0) {
      __cxa_atexit(FUN_0018ff10,&PTR_PTR_005e00a0,&PTR_LOOP_005e0008);
      __cxa_guard_release(&DAT_005e3cc8);
    }
  }
  if ((DAT_005e3cc0 & 1) == 0) {
    __cxa_guard_acquire(&DAT_005e3cc0);
    if (iVar2 != 0) {
      __cxa_atexit(FUN_0018fe50,&PTR_PTR_005e0098,&PTR_LOOP_005e0008);
      __cxa_guard_release(&DAT_005e3cc0);
    }
  }
  std::ios_base::Init::Init((Init *)&DAT_005e3898);
  __cxa_atexit(PTR__Init_005dfff8,&DAT_005e3898,&PTR_LOOP_005e0008);
  __cxa_atexit(FUN_0018f2a0,&PTR_PTR_005e0100,&PTR_LOOP_005e0008);
  __cxa_atexit(FUN_0018f290,&PTR_PTR_005e0108,&PTR_LOOP_005e0008);
  __cxa_atexit(FUN_0018f280,&PTR_PTR_005e0110,&PTR_LOOP_005e0008);
  if ((DAT_005e3ca0 & 1) == 0) {
    __cxa_guard_acquire(&DAT_005e3ca0);
    if (iVar2 != 0) {
      __cxa_atexit(FUN_0018ff70,&PTR_PTR_005e0090,&PTR_LOOP_005e0008);
      __cxa_guard_release(&DAT_005e3ca0);
    }
  }
  if ((DAT_005e3c98 & 1) == 0) {
    __cxa_guard_acquire(&DAT_005e3c98);
    if (iVar2 != 0) {
      __cxa_atexit(FUN_0018ffd0,&PTR_PTR_005e0088,&PTR_LOOP_005e0008);
      __cxa_guard_release(&DAT_005e3c98);
    }
  }
  if ((DAT_005e3b30 & 1) == 0) {
    DAT_005e3b30 = 1;
    pvVar3 = operator_new(param_1,0x40);
    memset(pvVar3,0,0x6c0);
    FUN_0019a970(pvVar3);
    DAT_005e3b98 = pvVar3;
  }
  FUN_002531a0(&DAT_005e36b8);
  DAT_005e3640 = &DAT_005e36b8;
  FUN_00198b80(&local_b8,&DAT_00461178);
  DAT_005e3920 = 0;
  DAT_005e38a8 = CONCAT44(uStack_b4,local_b8);
  DAT_005e38a0 = &PTR_FUN_0058d920;
  DAT_005e38b0 = uStack_b0;
  DAT_005e38c8 = &PTR_FUN_0058d8d0;
  DAT_005e3928 = 0;
  DAT_005e3930 = FUN_001a5c00();
  DAT_005e3938 = FUN_001d5a30();
  puVar4 = operator_new(0x28);
  *puVar4 = 0;
  puVar4[1] = 0;
  puVar4[2] = 0;
  puVar4[3] = 0;
  puVar4[4] = 0;
  local_68 = (string *)thunk_FUN_00252dc0;
  local_58 = (_List *)FUN_00190530;
  pcStack_50 = FUN_0018eab0;
  FUN_001da5c0(puVar4,30000,0,(path *)&local_68);
  FUN_00194470((path *)&local_68);
  DAT_005e3940 = &DAT_005e3950;
  DAT_005e3888 = puVar4;
  std::__cxx11::string::_M_construct<char_const*>(&DAT_005e3940,"/persistent","",0);
  std::filesystem::__cxx11::path::_List::_List((_List *)&DAT_005e3960);
  std::filesystem::__cxx11::path::_M_split_cmpts();
  __cxa_atexit(FUN_00191da0,&DAT_005e3940,&PTR_LOOP_005e0008);
  local_68 = (string *)&local_58;
  std::__cxx11::string::_M_construct<char_const*>((path *)&local_68,"deviceinfo","",0);
  std::filesystem::__cxx11::path::_List::_List(a_Stack_48);
  std::filesystem::__cxx11::path::_M_split_cmpts();
  FUN_00198030(&DAT_005e3968,&DAT_005e3940);
  std::filesystem::__cxx11::path::_List::_List((_List *)&DAT_005e3988,(_List *)&DAT_005e3960);
  std::filesystem::__cxx11::path::operator/=((path *)&DAT_005e3968,(path *)&local_68);
  FUN_00198010(a_Stack_48);
  FUN_001998f0((path *)&local_68);
  __cxa_atexit(FUN_00191da0,&DAT_005e3968,&PTR_LOOP_005e0008);
  DAT_005e3990 = &DAT_005e39a0;
  std::__cxx11::string::_M_construct<char_const*>(&DAT_005e3990,"/opt/eight/config","",0);
  std::filesystem::__cxx11::path::_List::_List((_List *)&DAT_005e39b0);
  std::filesystem::__cxx11::path::_M_split_cmpts();
  __cxa_atexit(FUN_00191da0);
  FUN_0024baa0(&DAT_005e36d0,&DAT_005e3940,&DAT_005e3990);
  __cxa_atexit(FUN_0019be90,&DAT_005e36d0,&PTR_LOOP_005e0008);
  FUN_0019a880((path *)&local_68,&DAT_005e3968);
  local_88[0] = thunk_FUN_00252dc0;
  local_78 = FUN_00190530;
  pcStack_70 = FUN_0018eab0;
  local_40 = '\x01';
  FUN_001872c0(auStack_a8,"/var/volatile/tmp/");
  pvVar3 = operator_new(0x148);
  FUN_001ab670(pvVar3,&DAT_005e3640,(path *)&local_68,local_88,auStack_a8);
  DAT_005e3300 = pvVar3;
  FUN_001998f0(auStack_a8);
  FUN_00194470(local_88);
  if (local_40 != '\0') {
    FUN_001a4670((path *)&local_68);
  }
  puVar4 = operator_new(800);
  *puVar4 = 0;
  puVar4[1] = 0;
  puVar4[8] = 0;
  puVar4[9] = 0;
  puVar4[0x10] = 0;
  puVar4[0x11] = 0;
  *puVar4 = "disconnected";
  puVar4[2] = 0;
  puVar4[3] = 0;
  puVar4[4] = 0;
  puVar4[5] = 0;
  puVar4[6] = 0;
  puVar4[7] = 0;
  *(undefined4 *)(puVar4 + 8) = 0xffffffff;
  puVar4[9] = "disconnected";
  puVar4[10] = 0;
  puVar4[0xb] = 0;
  puVar4[0xc] = 0;
  puVar4[0xd] = 0;
  puVar4[0xe] = 0;
  puVar4[0xf] = 0;
  *(undefined4 *)(puVar4 + 0x11) = 0xffffffff;
  *(undefined4 *)(puVar4 + 0x12) = 0xff;
  *(undefined4 *)((long)puVar4 + 0x94) = 0xff;
  *(undefined1 *)(puVar4 + 0x13) = 0;
  *(undefined1 *)((long)puVar4 + 0x99) = 0;
  memset((void *)((long)puVar4 + 0x9a),0,0x280);
  FUN_00196e80(puVar4);
  DAT_005e3648 = puVar4;
  DAT_005e3688 = FUN_00203a30();
  local_b8 = 0;
  FUN_001a5120(&DAT_005e39b8,auStack_c0,&local_b8);
  __cxa_atexit(FUN_00193d20,&DAT_005e39b8,&PTR_LOOP_005e0008);
  DAT_005e0020 = DAT_005e39b8;
  DAT_005e0028 = DAT_005e39c0;
  if (DAT_005e39c0 != 0) {
    FUN_0019b0d0();
  }
  __cxa_atexit(FUN_00193ba0,&DAT_005e0018,&PTR_LOOP_005e0008);
  DAT_005e0038 = DAT_005e39b8;
  DAT_005e0040 = DAT_005e39c0;
  if (DAT_005e39c0 != 0) {
    FUN_0019b0d0();
  }
  __cxa_atexit(FUN_00193ba0,&DAT_005e0030,&PTR_LOOP_005e0008);
  local_68 = (string *)thunk_FUN_00252dc0;
  local_58 = (_List *)FUN_00190530;
  pcStack_50 = FUN_0018eab0;
  pvVar3 = operator_new(0xf8);
  FUN_00198270(pvVar3,0,(path *)&local_68);
  DAT_005e39c8 = pvVar3;
  FUN_00194470((path *)&local_68);
  FUN_001872c0((path *)&local_68,"left");
  pvVar3 = operator_new(0x4078);
  FUN_0019edf0(pvVar3,(path *)&local_68,DAT_005e39c8,DAT_005e3300,&DAT_005e0018,DAT_005e3648);
  DAT_005e3690 = pvVar3;
  FUN_001998f0((path *)&local_68);
  local_68 = (string *)thunk_FUN_00252dc0;
  local_58 = (_List *)FUN_00190530;
  pcStack_50 = FUN_0018eab0;
  pvVar3 = operator_new(0xf8);
  FUN_00198270(pvVar3,0,(path *)&local_68);
  DAT_005e39d0 = pvVar3;
  FUN_00194470((path *)&local_68);
  FUN_001872c0((path *)&local_68,"right");
  pvVar3 = operator_new(0x4078);
  FUN_0019edf0(pvVar3,(path *)&local_68,DAT_005e39d0,DAT_005e3300,&DAT_005e0030,DAT_005e3648);
  DAT_005e3698 = pvVar3;
  FUN_001998f0((path *)&local_68);
  local_b8 = 0;
  FUN_001a5120(&DAT_005e39d8,auStack_c0,&local_b8);
  __cxa_atexit(FUN_00193d20,&DAT_005e39d8,&PTR_LOOP_005e0008);
  DAT_005e0050 = DAT_005e39d8;
  DAT_005e0058 = DAT_005e39e0;
  if (DAT_005e39e0 != 0) {
    FUN_0019b0d0();
  }
  __cxa_atexit(FUN_00193ba0,&DAT_005e0048,&PTR_LOOP_005e0008);
  DAT_005e0068 = DAT_005e39d8;
  DAT_005e0070 = DAT_005e39e0;
  if (DAT_005e39e0 != 0) {
    FUN_0019b0d0();
  }
  __cxa_atexit(FUN_00193ba0,&DAT_005e0060,&PTR_LOOP_005e0008);
  local_68 = (string *)thunk_FUN_00252dc0;
  local_58 = (_List *)FUN_00190530;
  pcStack_50 = FUN_0018eab0;
  pvVar3 = operator_new(0xf8);
  FUN_00198270(pvVar3,0,(path *)&local_68);
  DAT_005e39e8 = pvVar3;
  FUN_00194470((path *)&local_68);
  FUN_001872c0((path *)&local_68,"left");
  pvVar3 = operator_new(0x3d30);
  FUN_0019e7f0(pvVar3,(path *)&local_68,DAT_005e39e8,DAT_005e3300,&DAT_005e0048,DAT_005e3648);
  DAT_005e36a0 = pvVar3;
  FUN_001998f0((path *)&local_68);
  local_68 = (string *)thunk_FUN_00252dc0;
  local_58 = (_List *)FUN_00190530;
  pcStack_50 = FUN_0018eab0;
  pvVar3 = operator_new(0xf8);
  FUN_00198270(pvVar3,0,(path *)&local_68);
  DAT_005e39f0 = pvVar3;
  FUN_00194470((path *)&local_68);
  FUN_001872c0((path *)&local_68,"right");
  pvVar3 = operator_new(0x3d30);
  FUN_0019e7f0(pvVar3,(path *)&local_68,DAT_005e39f0,DAT_005e3300,&DAT_005e0060,DAT_005e3648);
  DAT_005e36a8 = pvVar3;
  FUN_001998f0((path *)&local_68);
  DAT_005e3650 = FUN_0023f2c0();
  DAT_005e36b0 = FUN_001da8f0();
  uVar1 = DAT_005e3688;
  DAT_005e3a28 = &PTR_FUN_0058da30;
  DAT_005e3a30 = DAT_005e3688;
  DAT_005e3a38 = 0;
  DAT_005e35e0 = &PTR_FUN_0058d8d0;
  DAT_005e3638 = 0;
  DAT_005e3658 = &PTR_FUN_0058d9d0;
  DAT_005e3680 = 0x4210000000000032;
  DAT_005e39f8 = &PTR_FUN_0058da00;
  DAT_005e3a20 = &PTR_FUN_0058da58;
  DAT_005e367c = 0x41d80000;
  __cxa_atexit(FUN_0018f250,&DAT_005e3a20,&PTR_LOOP_005e0008);
  DAT_005e3a40 = &PTR_FUN_0058da58;
  DAT_005e3a48 = &PTR_FUN_0058da30;
  DAT_005e3a50 = uVar1;
  DAT_005e3a58 = 1;
  __cxa_atexit(FUN_0018f250,&DAT_005e3a40,&PTR_LOOP_005e0008);
  DAT_005e3a60 = &PTR_FUN_0058daa8;
  DAT_005e3a68 = &PTR_FUN_0058da80;
  DAT_005e3a70 = DAT_005e3690;
  __cxa_atexit(FUN_0018f230,&DAT_005e3a60,&PTR_LOOP_005e0008);
  DAT_005e3a78 = &PTR_FUN_0058daa8;
  DAT_005e3a80 = &PTR_FUN_0058da80;
  DAT_005e3a88 = DAT_005e3698;
  __cxa_atexit(FUN_0018f230,&DAT_005e3a78,&PTR_LOOP_005e0008);
  DAT_005e3a90 = &PTR_FUN_0058daf8;
  DAT_005e3a98 = &PTR_FUN_0058dad0;
  DAT_005e3aa0 = DAT_005e36a0;
  __cxa_atexit(FUN_0018f210,&DAT_005e3a90,&PTR_LOOP_005e0008);
  DAT_005e3aa8 = &PTR_FUN_0058daf8;
  DAT_005e3ab0 = &PTR_FUN_0058dad0;
  DAT_005e3ab8 = DAT_005e36a8;
  __cxa_atexit(FUN_0018f210,&DAT_005e3aa8,&PTR_LOOP_005e0008);
  local_68 = (string *)0x0;
  uStack_60 = 0;
  local_58 = a_Stack_48;
  std::__cxx11::string::_M_construct((string *)&local_58,0x40,'\0');
  local_38 = 0;
  uStack_30 = 0;
  local_28[0] = auStack_18;
  std::__cxx11::string::_M_construct((string *)local_28,0x40,'\0');
  FUN_00199e40(&DAT_005e3308,(path *)&local_68,&DAT_005e3a20,&DAT_005e3a60,&DAT_005e3a90,
               &DAT_005e3a40,&DAT_005e3a78,&DAT_005e3aa8);
  FUN_001998f0((string *)local_28);
  FUN_001998f0((string *)&local_58);
  __cxa_atexit(FUN_00192e20,&DAT_005e3308,&PTR_LOOP_005e0008);
  FUN_002553d0(&DAT_005e2fc0);
  __cxa_atexit(PTR_FUN_005dfc60,&DAT_005e2fc0,&PTR_LOOP_005e0008);
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
  if ((DAT_005e3b08 & 1) == 0) {
    DAT_005e3b08 = 1;
    FUN_00196d40(&DAT_005e3b68);
    __cxa_atexit(FUN_00193c60,&DAT_005e3b68,&PTR_LOOP_005e0008);
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
    __cxa_atexit(FUN_0018f2e0,&DAT_005e3b50,&PTR_LOOP_005e0008);
  }
  if ((DAT_005e3ae8 & 1) == 0) {
    DAT_005e3ae8 = 1;
    __cxa_atexit(FUN_0018f2f0,&DAT_005e3b48,&PTR_LOOP_005e0008);
  }
  if ((DAT_005e3ae0 & 1) == 0) {
    DAT_005e3ae0 = 1;
    __cxa_atexit(FUN_0018f300,&DAT_005e3b40,&PTR_LOOP_005e0008);
  }
  if ((DAT_005e3ad8 & 1) == 0) {
    DAT_005e3ad8 = 1;
    lVar5 = local_8 - *(long *)PTR___stack_chk_guard_005df758;
    if (lVar5 == 0) {
      __cxa_atexit(FUN_0018f310,&DAT_005e3b38,&PTR_LOOP_005e0008);
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


