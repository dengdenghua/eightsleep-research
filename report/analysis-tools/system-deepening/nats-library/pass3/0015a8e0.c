/* Ghidra static pseudocode; not original source. Read-only project; no target execution. */

void nats_overrideDefaultOptionsWithConfig(long param_1)

{
  undefined1 uVar1;
  
  *(undefined8 *)(param_1 + 0x50) = DAT_0018d3e8;
  uVar1 = (undefined1)DAT_0018d400;
  *(undefined1 *)(param_1 + 0x160) = (undefined1)DAT_0018d3f8;
  *(undefined1 *)(param_1 + 0x161) = uVar1;
  return;
}


