/* Ghidra static pseudocode; not original source. Read-only project; no target execution. */

void FUN_00189bb0(void)

{
  long *plVar1;
  long *plVar2;
  
  plVar2 = DAT_005e3b98;
  plVar1 = DAT_005e3b98 + 0x10;
  *(char *)plVar1 = '\x01';
  do {
    if ((char)*plVar1 == '\0') {
      return;
    }
    while( true ) {
      FUN_001afe00(plVar2);
      if (plVar2[0xb] != 0) {
        kvStore_Destroy();
        plVar2[0xb] = 0;
        plVar2[0xd] = 0;
        *(undefined1 *)plVar2[0xc] = 0;
      }
      if (plVar2[1] != 0) {
        jsCtx_Destroy();
        plVar2[1] = 0;
      }
      if (*plVar2 == 0) break;
      natsConnection_Flush();
      natsConnection_Destroy(*plVar2);
      *plVar2 = 0;
      if ((char)*plVar1 == '\0') {
        return;
      }
    }
  } while( true );
}


