/* Ghidra static pseudocode; not original source. */

void FUN_00277cb0(long param_1,long param_2,undefined4 param_3)

{
  byte bVar1;
  char cVar2;
  undefined8 uVar3;
  undefined4 uVar4;
  long lVar5;
  undefined *puVar6;
  undefined *puVar7;
  undefined8 local_28;
  undefined2 *puStack_20;
  undefined8 local_18;
  undefined2 local_10;
  undefined1 local_e;
  undefined1 local_d;
  long local_8;
  
                    /* catch() { ... } // from try @ 00277c60 with catch @ 00277cc0 */
                    /* catch() { ... } // from try @ 00277c48 with catch @ 00277cd4 */
  local_8 = *(long *)PTR___stack_chk_guard_005df758;
                    /* catch() { ... } // from try @ 00277c34 with catch @ 00277ce8 */
  uVar3 = FUN_001da8f0(0);
  bVar1 = *(byte *)(param_2 + 1);
  if (bVar1 != 2) {
                    /* try { // try from 00277cfc to 00377d17 has its CatchHandler @ 00277bd4 */
                    /* catch() { ... } // from try @ 00277c88 with catch @ 00277d00 */
    if (bVar1 == 3) {
                    /* try { // try from 00277f28 to 00377f2b has its CatchHandler @ 00277f88 */
      FUN_001965f0(PTR_DAT_005df810,0x2ba,"handleGesture",
                   "/usr/src/debug/frank/0.1-r0/git/firmware/src/subsystem/UsbSensor.cpp",
                   "[TTC] temperature up gesture");
                    /* try { // try from 00277f50 to 00377f53 has its CatchHandler @ 00277fc8 */
      uVar4 = 2;
      if (PTR_DAT_005df708[0x2d3] == '\0') {
        uVar4 = *(undefined4 *)(param_1 + 0x3bfc);
      }
      cVar2 = FUN_001dc260(uVar3,uVar4,1);
      if (cVar2 == '\0') {
                    /* catch() { ... } // from try @ 00277f28 with catch @ 00277f88 */
        FUN_001965f0(PTR_DAT_005df810,0x2bd,"handleGesture",
                     "/usr/src/debug/frank/0.1-r0/git/firmware/src/subsystem/UsbSensor.cpp",
                     "[TTC] not online or failed to adjust temp");
      }
      else {
        local_d = *(undefined1 *)(param_2 + 3);
        puStack_20 = &local_10;
        local_28 = 0x40;
        local_18 = 4;
        local_10 = 0x1900;
                    /* catch() { ... } // from try @ 00278050 with catch @ 00278000
                       catch() { ... } // from try @ 00278128 with catch @ 00278000 */
        local_e = 7;
        FUN_002336a0(param_1,&local_28);
      }
                    /* catch() { ... } // from try @ 00277f10 with catch @ 00277f9c */
      lVar5 = local_8 - *(long *)PTR___stack_chk_guard_005df758;
      puVar6 = PTR_DAT_005dff88;
      puVar7 = PTR_s___l__0__r__0__s__0__005df878;
                    /* catch() { ... } // from try @ 00277efc with catch @ 00277fb0 */
      if (lVar5 != 0) goto LAB_00278014;
      goto LAB_00277ed0;
    }
    if (bVar1 < 4) {
                    /* try { // try from 00277dc4 to 00377dc7 has its CatchHandler @ 00277e24 */
      lVar5 = local_8 - *(long *)PTR___stack_chk_guard_005df758;
      if (lVar5 == 0) {
                    /* try { // try from 00277dec to 00377def has its CatchHandler @ 00277e64 */
        FUN_001965f0(PTR_DAT_005df7b0,0x2e7,"handleGesture",
                     "/usr/src/debug/frank/0.1-r0/git/firmware/src/subsystem/UsbSensor.cpp",
                     "[TTC] not handling less than 2 taps");
        return;
      }
    }
    else {
      FUN_001965f0(PTR_DAT_005df810,0x2c5,"handleGesture",
                   "/usr/src/debug/frank/0.1-r0/git/firmware/src/subsystem/UsbSensor.cpp",
                   "[TTC] adj base gesture");
      local_d = *(undefined1 *)(param_2 + 3);
      puStack_20 = &local_10;
                    /* catch() { ... } // from try @ 00277d88 with catch @ 00277d38
                       catch() { ... } // from try @ 00277e60 with catch @ 00277d38 */
      local_28 = 0x40;
      local_18 = 4;
      local_10 = 0x1900;
      local_e = 7;
      FUN_002336a0(param_1,&local_28);
      lVar5 = local_8 - *(long *)PTR___stack_chk_guard_005df758;
      if (lVar5 == 0) {
                    /* try { // try from 00277d88 to 00377d8b has its CatchHandler @ 00277d38 */
                    /* try { // try from 00277d98 to 00377d9b has its CatchHandler @ 00277e4c */
                    /* try { // try from 00277dac to 00377daf has its CatchHandler @ 00277e38 */
        FUN_00204b80(param_2,param_3,PTR_DAT_005dffd8,PTR_s___l__0__r__0__s__0__005dfe18);
        return;
      }
    }
    goto LAB_00278014;
  }
                    /* catch() { ... } // from try @ 00277dc4 with catch @ 00277e24 */
  FUN_001965f0(PTR_DAT_005df810,0x2af,"handleGesture",
               "/usr/src/debug/frank/0.1-r0/git/firmware/src/subsystem/UsbSensor.cpp",
               "[TTC] temperature down gesture");
                    /* catch() { ... } // from try @ 00277dac with catch @ 00277e38 */
  if (PTR_DAT_005df708[0x2d3] == '\0') {
                    /* try { // try from 00277f10 to 00377f13 has its CatchHandler @ 00277f9c */
    cVar2 = FUN_001dc260(uVar3,*(undefined4 *)(param_1 + 0x3bfc),0);
    if (cVar2 != '\0') goto LAB_00277e60;
LAB_00277ee8:
                    /* try { // try from 00277eec to 00377eef has its CatchHandler @ 00277e9c */
                    /* try { // try from 00277efc to 00377eff has its CatchHandler @ 00277fb0 */
    FUN_001965f0(PTR_DAT_005df810,0x2b2,"handleGesture",
                 "/usr/src/debug/frank/0.1-r0/git/firmware/src/subsystem/UsbSensor.cpp",
                 "[TTC] not online or failed to adjust temp");
  }
  else {
                    /* catch() { ... } // from try @ 00277d98 with catch @ 00277e4c */
    cVar2 = FUN_001dc260(uVar3,2,0);
    if (cVar2 == '\0') goto LAB_00277ee8;
LAB_00277e60:
                    /* try { // try from 00277e60 to 00377e7b has its CatchHandler @ 00277d38 */
    local_d = *(undefined1 *)(param_2 + 3);
                    /* catch() { ... } // from try @ 00277dec with catch @ 00277e64 */
    puStack_20 = &local_10;
    local_28 = 0x40;
    local_18 = 4;
    local_10 = 0x1900;
    local_e = 7;
    FUN_002336a0(param_1,&local_28);
  }
                    /* catch() { ... } // from try @ 00277eec with catch @ 00277e9c
                       catch() { ... } // from try @ 00277fc4 with catch @ 00277e9c */
  lVar5 = local_8 - *(long *)PTR___stack_chk_guard_005df758;
  puVar6 = PTR_DAT_005df948;
  puVar7 = PTR_s___l__0__r__0__s__0__005dff78;
  if (lVar5 == 0) {
LAB_00277ed0:
    FUN_00204b80(param_2,param_3,puVar6,puVar7);
    return;
  }
LAB_00278014:
                    /* WARNING: Subroutine does not return */
  __stack_chk_fail(PTR___stack_chk_guard_005df758,lVar5,0);
}


