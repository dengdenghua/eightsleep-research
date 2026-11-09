/* Ghidra static pseudocode; not original source. Read-only project; no target execution. */

undefined8 jsPubOptions_Init(undefined8 *param_1)

{
  undefined8 uVar1;
  
  if (param_1 != (undefined8 *)0x0) {
    *param_1 = 0;
    param_1[1] = 0;
    param_1[2] = 0;
    param_1[3] = 0;
    param_1[4] = 0;
    param_1[5] = 0;
    param_1[6] = 0;
    param_1[7] = 0;
    return 0;
  }
  uVar1 = natsStatus_GetText(0x10);
  uVar1 = nats_setErrorReal("/home/ubuntu/src/frankenfirmware/build/_deps/nats.c-src/src/js.c",
                            "jsPubOptions_Init",0x1b2,0x10,"%s",uVar1);
  return uVar1;
}


